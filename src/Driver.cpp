#include "Driver.h"

#include "code/instructions/SkipInstruction.h"
#include "code/instructions/AssignmentInstruction.h"
#include "code/instructions/ReturnInstruction.h"
#include "code/instructions/AssemblyInstruction.h"
#include "code/instructions/PreAmbleInstruction.h"
#include "code/instructions/CondJumpInstruction.h"
#include "code/instructions/ArithmeticInstruction.h"
#include "code/instructions/MemoryInstruction.h"

#include <exception>

Driver::Driver(char *filename) 
	: treeFile("tree.dot", std::fstream::out), errorsFile("errors.txt", std::fstream::out)
{
    this->scanner = new Lexic(filename, "tokens.txt", this);
    this->parser = new Syntax(this->scanner, this);

    // inicialitzar la taula de símbols
    this->ts = TaulaSimbols();
    this->ts.buida();

    // inicialitzar la taula de símbols amb els tipus propis del llenguatge
    DescripcioTipusBasic *boolean = new DescripcioTipusBasic(TipusSubjacentBasic::BOOLEAN, 0, 1, sizeof(bool));
    this->ts.posar("boolean", boolean, true);

    // afegir true i false
	bool tmp = true;
    DescripcioConstant *dc = new DescripcioConstant("boolean");
	std::shared_ptr<ValueContainer> trueValue = std::make_shared<ValueContainer>((const char *) &tmp, sizeof(bool));
	dc->setValue(trueValue);
	
	Variable *tmpV = this->code.addVariable(TipusSubjacentBasic::BOOLEAN, "trueConst");
	this->code.addInstruction(new AssignmentInstruction(
		TipusSubjacentBasic::BOOLEAN,
		tmpV,
		trueValue
	));
	dc->setVariable(tmpV);

    this->ts.posar("true", dc, true);

    dc = new DescripcioConstant("boolean");
	tmp = false;
	std::shared_ptr<ValueContainer> falseValue = std::make_shared<ValueContainer>((const char *) &tmp, sizeof(bool));
	dc->setValue(falseValue);

	tmpV = this->code.addVariable(TipusSubjacentBasic::BOOLEAN, "falseConst");
	this->code.addInstruction(new AssignmentInstruction(
		TipusSubjacentBasic::BOOLEAN,
		tmpV,
		falseValue
	));
	dc->setVariable(tmpV);

    this->ts.posar("false", dc, true);

    DescripcioTipusBasic *character = new DescripcioTipusBasic(TipusSubjacentBasic::CHAR, 0, 255, 1);
    this->ts.posar("char", character, true);

    DescripcioTipusBasic *integer = new DescripcioTipusBasic(TipusSubjacentBasic::INT, (long) 0, ~((long)0), sizeof(int));
    this->ts.posar("int", integer, true);

    DescripcioTipusArray *string = new DescripcioTipusArray("char");
	string->setOcupacio(256);
    this->ts.posar("string", string, true);
    this->ts.posarDimensio("string", new DescripcioDimensio(256));

    // funcions pròpies
	this->initReadChar();
	this->initPrintChar();   

	this->initPrint();

    //DescripcioFuncio *read = new DescripcioFuncio();
    //read->setTipusRetorn("int");
    //this->ts.posar("read", read);
    //this->ts.posarParam("read", "msg", new DescripcioArgument("string", DescripcioArgument::IN_OUT));

    //DescripcioFuncio *readInt = new DescripcioFuncio();
    //readInt->setTipusRetorn("int");
    //this->ts.posar("readInt", readInt);

	SubProgram *writeIntProgram = this->code.addSubProgram("printInt", this->code.addLabel("printInt"));
	DescripcioArgument *daIntParam = new DescripcioArgument("int", DescripcioArgument::IN);
	this->code.enterSubProgram(writeIntProgram);
	Variable *var = this->code.addVariable(TipusSubjacentBasic::INT, true);
	writeIntProgram->addParameter(var);
	daIntParam->setVariable(var);
	this->code.leaveSubProgram();
    DescripcioProc *writeInt = new DescripcioProc(writeIntProgram);
    this->ts.posar("printInt", writeInt);
    this->ts.posarParam("printInt", "num", daIntParam);


    // inicialitzar fitxer de l'arbre
    this->writeToTree("digraph arbreSintactic {");
}

Driver::~Driver(){}

void Driver::parse(){
    this->exit = true;
    
    // Per observar tots els errors, el següent codi està comentat
    try {
        parser->parse();
    } catch (std::exception e) {
        this->exit = false;
    }
}

/**
 * Mostra un missatge d'error no crític
 */
void Driver::error(std::string msg){
    this->error(msg, false);
}

/**
 * Mostra un missatge d'error, crític o no, en funció d'error
 * a la posició actual
 */
void Driver::error(std::string msg, bool error){
    this->error(msg, this->getLocation(), error);
}

/**
 * Mostra un missatge d'error a la posició del paràmetre
 */
void Driver::error(std::string msg, yy::location loc, bool error){
    this->exit = false;

    if(error){
        std::cerr << "Error ";
        this->errorsFile << "Error ";
    }else{
        std::cerr << "Warning ";
        this->errorsFile << "Warning ";
    }

    std::cerr << "(línia "<< loc.begin <<" - "<< loc.end << "): " << msg << std::endl;
    this->errorsFile << "(línia "<< loc.begin <<" - "<< loc.end << "): " << msg << std::endl;

    if(error){
        // Només per visualitzar els errors s'ha comentat la següent línia
        //throw Driver::Error();
    }
}

yy::location Driver::getLocation(){
    return *this->scanner->getLocation(); 
}

void Driver::writeToTree(std::string data){
    this->treeFile << data << std::endl;
}

// comptador de missatges únics
int msgId = 0;

void Driver::writeToTree(Simbol *s, std::string data){
    std::string newNodeId = "\"" + std::to_string(s->getNodeId()) + "_" + std::to_string(msgId++) +  "\"";
    this->writeToTree(newNodeId + "[label=\""+ data +"\", shape=plaintext]");
    this->writeToTree(std::to_string(s->getNodeId()) + " -> " + newNodeId);
}

std::string Driver::addTreeChild(Simbol *s, std::string data){
    std::string newNodeId = "\"" + std::to_string(s->getNodeId()) + "_" + std::to_string(msgId++) +  "\"";
    this->writeToTree(newNodeId + "[label=\""+ data +"\", shape=plaintext]");

    return newNodeId;
}

void Driver::closeFiles(){
    // tancar l'arbre sintàctic
    this->writeToTree("}");
    this->treeFile.close();

    // tancar la seqüència de tokens
    this->tokensFile.close();

    // tancar el fitxer d'errors
    this->errorsFile.close();
}

bool Driver::exitosa(){
    return this->exit;
}

/**
 * Crea la funció printChar i genera el codi de 3 adreces
 * que necessita.
 * 
 * printChar(char caracter)
 */
void Driver::initPrintChar(){
	Label end = this->code.addLabel();

	this->code.addInstruction(new GoToInstruction(end));

	// generació de codi
	Label start = this->code.addLabel("printChar");
	this->code.addInstruction(new SkipInstruction(start));
	SubProgram *printCharProgram = this->code.addSubProgram("printChar", start);
	this->code.addInstruction(new PreAmbleInstruction(printCharProgram));

	// taula de símbols
	DescripcioProc *printChar = new DescripcioProc(printCharProgram);
    this->ts.posar("printChar", printChar);
	DescripcioArgument *darg = new DescripcioArgument("char", DescripcioArgument::IN);
    this->ts.posarParam("printChar", "caracter", darg);

	// entrar al subprograma
	this->code.enterSubProgram(printCharProgram);

	// crear variables associades als paràmetres
	Variable *arg1 = this->code.addVariable(TipusSubjacentBasic::CHAR, true);
	darg->setVariable(arg1);
	printCharProgram->addParameter(arg1);

	this->code.addInstruction(new AssemblyInstruction("movq\t$1, %rax")); // sys_write
	this->code.addInstruction(new AssemblyInstruction("lea\t"+ std::to_string(arg1->getOffset()) +"(%rbp), %rsi")); // file descriptor: stdout
	this->code.addInstruction(new AssemblyInstruction("movq\t$1, %rdi")); // file descriptor: stdout
	this->code.addInstruction(new AssemblyInstruction("movq\t$1, %rdx")); // buffer size
	this->code.addInstruction(new AssemblyInstruction("syscall"));

	// acabar el subprograma
	this->code.addInstruction(new ReturnInstruction(printCharProgram));
	this->code.leaveSubProgram();

	this->code.addInstruction(new SkipInstruction(end));
}

/**
 * Crea el codi associat a la funció readChar
 * 
 * readChar() : char
 */
void Driver::initReadChar(){
	// crear el subprograma
	Label start = this->code.addLabel("readChar");
	Label end = this->code.addLabel();
	SubProgram *readCharPrograma = this->code.addSubProgram("readChar", start);
	readCharPrograma->setTipusRetorn(TipusSubjacentBasic::CHAR);

	// inserir funció a la TS
	DescripcioFuncio *readChar = new DescripcioFuncio(readCharPrograma);
    readChar->setTipusRetorn("char");
    this->ts.posar("readChar", readChar);

	this->code.enterSubProgram(readCharPrograma);

	// variables locals
	Variable *var1 = this->code.addVariable(TipusSubjacentBasic::CHAR);

	// codi de la funció
	this->code.addInstruction(new GoToInstruction(end));
	this->code.addInstruction(new SkipInstruction(start));
	this->code.addInstruction(new PreAmbleInstruction(readCharPrograma));
	
	this->code.addInstruction(new AssemblyInstruction("movq\t$0, %rax")); // sys_read
	this->code.addInstruction(new AssemblyInstruction("lea\t-9(%rbp), %rsi")); // file descriptor: stdout
	this->code.addInstruction(new AssemblyInstruction("movq\t$0, %rdi")); // file descriptor: stdin
	this->code.addInstruction(new AssemblyInstruction("movq\t$1, %rdx")); // buffer size
	this->code.addInstruction(new AssemblyInstruction("syscall"));

	this->code.addInstruction(new ReturnInstruction(readCharPrograma, var1));
	
	this->code.addInstruction(new SkipInstruction(end));

	this->code.leaveSubProgram();
}

/**
 * Crea la funció per mostrar una cadena de text
 * 
 * print(string str)
 */
void Driver::initPrint(){
	// creació del subprograma
	Label start = this->code.addLabel("print");
	Label end = this->code.addLabel();
	SubProgram *printProgram = this->code.addSubProgram("print", start);

	this->code.enterSubProgram(printProgram);

	// crear el subprograma a la TS
	DescripcioProc *print = new DescripcioProc(printProgram);
    this->ts.posar("print", print);
	DescripcioArgument *darg1 = new DescripcioArgument("string", DescripcioArgument::IN);
    this->ts.posarParam("print", "msg", darg1);

	// associar el paràmetre a una variable
	Variable *arg1 = this->code.addVariable(TipusSubjacentBasic::ARRAY, true);
	printProgram->addParameter(arg1);
	darg1->setVariable(arg1);

	// etiquetes del bucle
	Label inici = this->code.addLabel();
	Label efinal = this->code.addLabel();

	// codi del programa
	this->code.addInstruction(new GoToInstruction(end));
	this->code.addInstruction(new SkipInstruction(start));
	this->code.addInstruction(new PreAmbleInstruction(printProgram));

	// variables locals
	Variable *i = this->code.addVariable(TipusSubjacentBasic::INT);
	int valor = 0;
	this->code.addInstruction(new AssignmentInstruction(
		TipusSubjacentBasic::INT,
		i,
		std::make_shared<ValueContainer>((const char *) &valor, sizeof(int))
	));

	Variable *max = this->code.addVariable(TipusSubjacentBasic::INT);
	DescripcioTipusArray *dta = (DescripcioTipusArray *) this->ts.consulta("string");
	valor = dta->getOcupacio();
	this->code.addInstruction(new AssignmentInstruction(
		TipusSubjacentBasic::INT,
		max,
		std::make_shared<ValueContainer>((const char *) &valor, sizeof(int))
	));

	Variable *zero = this->code.addVariable(TipusSubjacentBasic::CHAR);
	valor = 0;
	this->code.addInstruction(new AssignmentInstruction(
		TipusSubjacentBasic::INT,
		zero,
		std::make_shared<ValueContainer>((const char *) &valor, sizeof(char))
	));

	Variable *one = this->code.addVariable(TipusSubjacentBasic::INT);
	valor = 1;
	this->code.addInstruction(new AssignmentInstruction(
		TipusSubjacentBasic::INT,
		one,
		std::make_shared<ValueContainer>((const char *) &valor, sizeof(int))
	));

	Variable *t1 = this->code.addVariable(TipusSubjacentBasic::CHAR);

	this->code.addInstruction(new SkipInstruction(inici));

	this->code.addInstruction(new CondJumpInstruction(
		CondJumpInstruction::Operator::GTE,
		i,
		max,
		efinal
	)); // if i >= max goto efinal

	this->code.addInstruction(new AssignmentInstruction(
		AssignmentInstruction::Type::SOURCE_OFF,
		t1,
		arg1,
		i
	)); // t1 = msg[i]

	this->code.addInstruction(new CondJumpInstruction(
		CondJumpInstruction::Operator::EQ,
		t1,
		zero,
		efinal
	)); // if t1 = 0 goto efinal

	this->code.addInstruction(new ArithmeticInstruction(
		ArithmeticInstruction::Type::ADDITION,
		i,
		i,
		one
	)); // i = i + 1

	Instruction *instref = new GoToInstruction(inici);
	this->code.addInstruction(instref); // goto inici

	this->code.addInstruction(new SkipInstruction(efinal));
	this->code.addInstruction(new AssemblyInstruction("movq\t$0, %rdx")); // buffer size

	this->code.addInstruction(new MemoryInstruction(false, i, CodeGeneration::Register::D));
	this->code.addInstruction(new MemoryInstruction(false, arg1, CodeGeneration::Register::SI));

	this->code.addInstruction(new AssemblyInstruction("movq\t$1, %rax")); // sys_write
	this->code.addInstruction(new AssemblyInstruction("movq\t$1, %rdi")); // file descriptor: stdout	
	this->code.addInstruction(new AssemblyInstruction("syscall"));

	this->code.addInstruction(new ReturnInstruction(printProgram));

	this->code.addInstruction(new SkipInstruction(end));
	this->code.leaveSubProgram();
}