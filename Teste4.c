#include <stdio.h>
#include <stdlib.h>
              int horaDoShow(int X, int Z, int NUM, int RESULT) {

	NUM = 0;
	RESULT = 1;
	while (X > NUM) {
		NUM = NUM + 1;
	RESULT = RESULT * NUM;
	Z = RESULT;
	}

	return Z;

}

int main(int argc, char *argv[]) {

	printf("Saida -> %d\n", horaDoShow(atoi(argv[1]), atoi(argv[2]), atoi(argv[3]), atoi(argv[4])));
	return 0;

}