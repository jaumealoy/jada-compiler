#include "MallocInstruction.h"
#include "../CodeGeneration.h"

MallocInstruction::MallocInstruction(Variable *desti, Variable *nbytes)
    : Instruction(Instruction::Type::MALLOC), desti(desti), nbytes(nbytes)
{

}

MallocInstruction::~MallocInstruction()
{

}

std::string MallocInstruction::toString()
{
    return this->desti->getNom() + " = malloc " + this->nbytes->getNom();
}

void MallocInstruction::generateAssembly(CodeGeneration *code)
{

    code->load(this, this->nbytes, CodeGeneration::Register::A);

    // passar els paràmetres a jada_malloc
    code->output << "push\t%" << CodeGeneration::getRegister(CodeGeneration::Register::A, TSB::sizeOf(TipusSubjacentBasic::POINTER)) << std::endl;
    code->output << "push\t%" << CodeGeneration::getRegister(CodeGeneration::Register::A, TSB::sizeOf(TipusSubjacentBasic::POINTER)) << std::endl;

    // fer la crida i recuperar els paràmetres
    code->output << "call\tjada_malloc" << std::endl;
    code->output << "pop\t%" << CodeGeneration::getRegister(CodeGeneration::Register::A, TSB::sizeOf(TipusSubjacentBasic::POINTER)) << std::endl;
    code->store(this, CodeGeneration::Register::A, this->desti);
    code->output << "pop\t%" << CodeGeneration::getRegister(CodeGeneration::Register::A, TSB::sizeOf(TipusSubjacentBasic::POINTER)) << std::endl;
}

Variable *MallocInstruction::getDesti(){
    return this->desti;
}

Variable *MallocInstruction::getBytes(){
    return this->nbytes;
}
