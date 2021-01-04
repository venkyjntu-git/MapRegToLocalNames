#/bin/bash
if [ $# -ne 1 ] ; then
 echo " ### one argument required ###"
 echo " usage is ./run.sh name "
 echo "name without .c ex: ./run.sh x"
 exit 0
fi
fn=$1
clang-9  -emit-llvm -O0 -Xclang -disable-O0-optnone -g -c $fn.c -o $fn.bc
opt-9 -mem2reg $fn.bc -o $fn.bc
llvm-dis-9 $fn.bc
opt-9 -S -instnamer $fn.ll -o $fn.ll
./VarInInstruction $fn.ll

