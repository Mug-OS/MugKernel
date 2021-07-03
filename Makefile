# My first makefile
 
all: printy
 
printy: main.o helloWorld.o
	tcc -m32 main.o helloWorld.o -o printy

main.o: main.c helloWorld.h
	tcc -m32 -c main.c -o main.o
 
helloWorld.o: helloWorld.c helloWorld.h
	tcc -m32 -c helloWorld.c -o helloWorld.o 
 
clean:
	rm -rf *.o *~ printy