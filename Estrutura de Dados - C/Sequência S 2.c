#include <stdio.h>

int main(){
	double S =0, r;
	double x = 1, y = 1;

	for (x = 1; x<=39; x += 2){
		r = x/y;
		S += r;
		y *= 2;
	}

	printf("%.2lf\n", S);


	return 0;
}