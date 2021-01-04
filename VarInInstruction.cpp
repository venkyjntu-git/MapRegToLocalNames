#include <iostream>
#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Type.h"

using namespace llvm;

//StringRef get_local_name(const Instruction* iv);
//void fun_rec(Instruction *iv);

LLVMContext context;

int main(int argc, char *argv[]) {

	if (argc != 2) {
		std::cout << "Usage is: ./a.out filename.bc";
		return -1;
	}

	SMDiagnostic error;

	std::unique_ptr<Module> module = parseIRFile(argv[1], error, context);

	if (!module) {
		std::cout << " Not a valid Module";
		return -2;
	}
	

	for (auto &F : *module) {

		Function *pf = &F;

		if (pf->isIntrinsic()) {
			continue;
		}  

	  for (inst_iterator I = inst_begin(pf), E = inst_end(pf); I != E;++I) {
             
     const Instruction *inst = &(*I);
     
     if (const DbgDeclareInst* DbgDeclare = dyn_cast<DbgDeclareInst>(inst)) {       
     			   // outs()<<DbgDeclare->getVariable()->getName() <<"\n";
    		 } 
     else if (const DbgValueInst* DbgValue = dyn_cast<DbgValueInst>(inst)) {
      			 
      			 outs()<<DbgValue->getVariable()->getName()<<" same value as ";
                 
                 if (Value *v = DbgValue->getValue()){               	 
                 	 
                 	 if(v->hasName())
                       outs()<<v->getName()<<"\n";
                     else
                     	outs()<<"no Name"<<"\n";
                     
                     if(Instruction *insV= dyn_cast<Instruction>(v)) {

                      	MDNode *md = insV->getMetadata("dbg"); 
                      	if(md){
                 	  		  
                          DILocation* loc = cast<DILocation>(md);      
                      		unsigned lineNo = loc->getLine();
                      		StringRef fileName = loc->getFilename();
                      		if(lineNo!=0) //Instruction  in source program 
                      		 outs()<<" from line number: "<<lineNo<<"\n";
                      	}

                      }

                 }

                 else outs()<<"replaced \n";
      }                        						
	  } //end instruction loop 			
	} //end module loop
} //end main



/*const DILocalVariable* findVar(const Value* V, const Function* F) {

  for (const_inst_iterator Iter = inst_begin(F), End = inst_end(F); Iter != End; ++Iter) {

    const Instruction* I = &*Iter;

    if (const DbgDeclareInst* DbgDeclare = dyn_cast<DbgDeclareInst>(I)) {

      if (DbgDeclare->getAddress() == V) return DbgDeclare->getVariable();

    } else if (const DbgValueInst* DbgValue = dyn_cast<DbgValueInst>(I)) {

      if (DbgValue->getValue() == V) return DbgValue->getVariable();
    }
  }
  return NULL;
}

StringRef get_local_name(const Instruction* iv) {

	if(isa<StoreInst>(*iv)) {
			
			for (const Use &U : iv->operands()) {

		if(GlobalVariable * GV = dyn_cast<GlobalVariable>(U)) {
                             return GV->getName();
           }

          }
      }
  const Function* F = iv->getParent()->getParent();

     if(const Value *V = dyn_cast<Value>(iv))
     {
        const DILocalVariable *Var = findVar(V, F);
                 if (!Var) return "tmp";

                 return Var->getName();
   }
             return "tmp";
}*/


