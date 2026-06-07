VICE := x64sc
DASM := dasm
SRC := src/main.asm
target := prog.prg

SRC=

all:
	dasm src/main.asm -oprog.prg
#	$(DASM) $(SRC)
	echo $(VICE)

clean: 
