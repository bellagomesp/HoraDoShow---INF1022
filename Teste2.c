#include <stdio.h>
#include <stdlib.h>
           int horaDoShow(int X, int Y, int Z) {

	for (int i=0; i<X; i++) {
		Y = Y + 2;
	}
	Z = Y;

	return Z;

}

int main(int argc, char *argv[]) {

	printf("Saida -> %d\n", horaDoShow(atoi(argv[1]), atoi(argv[2]), atoi(argv[3])));
	return 0;

}