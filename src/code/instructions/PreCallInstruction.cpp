#include "PreCallInstruction.h"
#include "../CodeGeneration.h"


PreCallInstruction::PreCallInstruction(SubProgram *programa)
    : programa(programa), Instruction(Instruction::Type::PRECALL)
{

}

PreCallInstruction::~PreCallInstruction()
{

}

std::string PreCallInstruction::toString(){
    return "";
}

/**
 * Només s'ha de reservar espai a la pila pels paràmetres
 */
void PreCallInstruction::generateAssembly(CodeGeneration *code){
    int espai = this->programa->getOcupacioParametres();
    code->output << "subq\t$" + std::to_string(espai) + ", %" + CodeGeneration::getRegister(CodeGeneration::Register::SP, 8) << std::endl;
}