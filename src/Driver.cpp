#include "Driver.h"

#include "code/instructions/AssignmentInstruction.h"

#include <exception>

Driver::Driver(char *filename) 
	: treeFile("tree.dot", std::fstream::out), errorsFile("erros.txt", std::fstream::out)
{
    this->scanner = new Lexic(filename, "tokens.txt", this);
    this->parser = new Syntax(this->scanner, this);
	this->code = CodeGeneration();

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
    this->ts.posar("string", string, true);
    this->ts.posarDimensio("string", new DescripcioDimensio(256));

    // funcions pròpies
    DescripcioFuncio *readChar = new DescripcioFuncio();
    readChar->setTipusRetorn("char");
    this->ts.posar("readChar", readChar);

    DescripcioProc *printChar = new DescripcioProc(nullptr);
    this->ts.posar("printChar", printChar);
    this->ts.posarParam("printChar", "caracter", new DescripcioArgument("char", DescripcioArgument::IN));

    DescripcioProc *print = new DescripcioProc(nullptr);
    this->ts.posar("print", print);
    this->ts.posarParam("print", "msg", new DescripcioArgument("string", DescripcioArgument::IN));

    DescripcioFuncio *read = new DescripcioFuncio();
    read->setTipusRetorn("int");
    this->ts.posar("read", read);
    this->ts.posarParam("read", "msg", new DescripcioArgument("string", DescripcioArgument::IN_OUT));

    DescripcioFuncio *readInt = new DescripcioFuncio();
    readInt->setTipusRetorn("int");
    this->ts.posar("readInt", readInt);

    DescripcioProc *writeInt = new DescripcioProc(nullptr);
    this->ts.posar("printInt", writeInt);
    this->ts.posarParam("printInt", "num", new DescripcioArgument("int", DescripcioArgument::IN));


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