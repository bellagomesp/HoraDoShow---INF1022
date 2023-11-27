#include <stdio.h>
#include <stdlib.h>
       int horaDoShow(int Y, int X) {

	Y = X;

	return Y;

}

int main(int argc, char *argv[]) {

	printf("Saida -> %d\n", horaDoShow(atoi(argv[1]), atoi(argv[2])));
	return 0;

}