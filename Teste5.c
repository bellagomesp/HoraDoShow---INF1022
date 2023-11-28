#include <stdio.h>
#include <stdlib.h>
                     int horaDoShow(int X, int Z) {

	if (X) {
		for (int i=0; i<X; i++) {
		Z = Z + 9;
	}
	}
	else{
		while (X <= Z) {
		Z = Z * 4;
	X = X + 1;
	}
	}

	return Z;

}

int main(int argc, char *argv[]) {

	printf("Saida -> %d\n", horaDoShow(atoi(argv[1]), atoi(argv[2])));
	return 0;

}