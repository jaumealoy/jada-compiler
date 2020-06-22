#include "Driver.h"

#include "code/instructions/SkipInstruction.h"
#include "code/instructions/AssignmentInstruction.h"
#include "code/instructions/ReturnInstruction.h"
#include "code/instructions/PreAmbleInstruction.h"
#include "code/instructions/CondJumpInstruction.h"
#include "code/instructions/ArithmeticInstruction.h"

#include <exception>

Driver::Driver(char *filename, bool debugMode, std::string outputFilename) 
	: treeFile("tree.dot", std::fstream::out), errorsFile("errors.txt", std::fstream::out), debug(debugMode), code(outputFilename)
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
	
	Variable *tmpV = this->code.addVariable(TipusSubjacentBasic::BOOLEAN, (std::string) "trueConst");
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

	tmpV = this->code.addVariable(TipusSubjacentBasic::BOOLEAN, (std::string) "falseConst");
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

    DescripcioTipusPunter *string = new DescripcioTipusPunter("char", 1);
    this->ts.posar("string", string, true);

    // funcions pròpies
	this->initReadChar();
	this->initPrintChar();   

	this->initPrint();
	this->initRead();

	this->initPrintInt();
	this->initReadInt();

	this->initRandom();

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
        throw Driver::Error();
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
	// generació de codi
	Label *start = this->code.addLabel("printChar");
	SubProgram *printCharProgram = this->code.addSubProgram("printChar", start, true);

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

	// acabar el subprograma
	this->code.leaveSubProgram();
}

/**
 * Crea el codi associat a la funció readChar
 * 
 * readChar() : char
 */
void Driver::initReadChar(){
	// crear el subprograma
	Label *start = this->code.addLabel("readChar");
	Label *end = this->code.addLabel();
	SubProgram *readCharPrograma = this->code.addSubProgram("readChar", start, true);
	readCharPrograma->setTipusRetorn(TipusSubjacentBasic::CHAR);

	// inserir funció a la TS
	DescripcioFuncio *readChar = new DescripcioFuncio(readCharPrograma);
    readChar->setTipusRetorn("char");
    this->ts.posar("readChar", readChar);

	this->code.enterSubProgram(readCharPrograma);

	this->code.leaveSubProgram();
}

/**
 * Crea la funció per mostrar una cadena de text
 * 
 * print(string str)
 */
void Driver::initPrint(){
	// creació del subprograma
	Label *start = this->code.addLabel("print");
	SubProgram *printProgram = this->code.addSubProgram("print", start, true);
	start->markUsage();

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

	this->code.leaveSubProgram();
}

/**
 * Crea la funció per mostrar un enter 
 * 
 * printInt(int number)
 */
void Driver::initPrintInt(){
	Label *start = this->code.addLabel("printInt");
	SubProgram *printInt = this->code.addSubProgram("printInt", start, true);
	DescripcioProc *dPrintInt = new DescripcioProc(printInt);
	DescripcioArgument *dArg = new DescripcioArgument("int", DescripcioArgument::Tipus::VALOR);
	this->ts.posar("printInt", dPrintInt);
	this->ts.posarParam("printInt", "numero", dArg);

	// indica que s'ha entrat a un nou subprograma
	this->code.enterSubProgram(printInt);

	// crear variables dels paràemtes
	Variable *arg1 = this->code.addVariable(TipusSubjacentBasic::INT, "numero", true);
	dArg->setVariable(arg1);
	printInt->addParameter(arg1);

	// indicar el final del programa
	this->code.leaveSubProgram();
}

/**
 * Inicialitza la funció read que llegeix una cadena de text de
 * longitud il·limitada i retorna una punter.
 * 
 * read() : string
 */
void Driver::initRead(){
	// creació de la funció
	Label *start = this->code.addLabel("read");
	SubProgram *readFunction = this->code.addSubProgram("read", start, true);
	start->markUsage();

	DescripcioFuncio *read = new DescripcioFuncio(readFunction);
	read->setTipusRetorn("string");
	this->ts.posar("read", read);

	// no té cap paràmetre d'entrada, però sí un de retorn
	readFunction->setTipusRetorn(TipusSubjacentBasic::POINTER);
}

/**
 * Inicialitza la funció readInt que llegeix un enter per consola
 * 
 * readInt() : int
 */
void Driver::initReadInt(){
	// crear la funció
	Label *start = this->code.addLabel("readInt");
	SubProgram *readIntFunction = this->code.addSubProgram("readInt", start, true);
	start->markUsage();

	DescripcioFuncio *readInt = new DescripcioFuncio(readIntFunction);
	readInt->setTipusRetorn("int");
	this->ts.posar("readInt", readInt);

	// indicar el seu valor de retorn
	readIntFunction->setTipusRetorn(TipusSubjacentBasic::INT);
}

/**
 * Inicialitza la funció que retorna un valor aleatori entre dos valors
 *
 * random(int minim, int maxim) : int
 */
void Driver::initRandom()
{
	// crear la funció
	Label *start = this->code.addLabel("randInt");
	SubProgram *randomFunction = this->code.addSubProgram("randInt", start, true);
	randomFunction->setTipusRetorn(TipusSubjacentBasic::INT);
	DescripcioFuncio *random = new DescripcioFuncio(randomFunction);
	random->setTipusRetorn("int");
	start->markUsage();
	this->ts.posar("randInt", random);

	this->code.enterSubProgram(randomFunction);

	DescripcioArgument *dArgMinim = new DescripcioArgument("int", DescripcioArgument::Tipus::VALOR);
	Variable *minim = this->code.addVariable(TipusSubjacentBasic::INT, "minim", true);
	dArgMinim->setVariable(minim);
	randomFunction->addParameter(minim);
	this->ts.posarParam("randInt", "minim", dArgMinim);

	DescripcioArgument *dArgMaxim = new DescripcioArgument("int", DescripcioArgument::Tipus::VALOR);
	Variable *maxim = this->code.addVariable(TipusSubjacentBasic::INT, true);
	dArgMaxim->setVariable(maxim);
	randomFunction->addParameter(maxim);
	this->ts.posarParam("randInt", "maxim", dArgMaxim);

	this->code.leaveSubProgram();
}