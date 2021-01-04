# name for the executable file
EXE := VarInInstruction

# source files
SOURCE_FILES := VarInInstruction.cpp
# header files

# compiler to use
CXX := clang++-9

# compiler flags
CXX_FLAGS := -std=c++14
CXX_FLAGS += -Wall
CXX_FLAGS += -Wextra
CXX_FLAGS += -O0
# CXX_FLAGS += -march=native
# CXX_FLAGS += -DNDEBUG
CXX_FLAGS += -pipe
CXX_FLAGS += -g 
#CXX_FLAGS += -rdynamic
#CXX_FLAGS += -I./include

# llvm flags
LLVM_FLAGS := `llvm-config-9 --cppflags`

# llvm libraries
LLVM_LIBS := `llvm-config-9 --libs all`

# definition of targets
.PHONY: clean

all: $(SOURCE_FILES)
	$(CXX) -w $(CXX_FLAGS) $(CLANG_FLAGS) $(LLVM_FLAGS) $(SOURCE_FILES) $(LLVM_LIBS) -o $(EXE)

clean:
	rm -f $(EXE)
