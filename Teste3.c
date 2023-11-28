#include <stdio.h>
#include <stdlib.h>
                int horaDoShow(int X, int Y, int Z) {

	Z = 0;
	if (X) {
		Z = X * 2;
	}
	if (Y) {
		Z = Y + 3;
	}

	return Z;

}

int main(int argc, char *argv[]) {

	printf("Saida -> %d\n", horaDoShow(atoi(argv[1]), atoi(argv[2]), atoi(argv[3])));
	return 0;

}