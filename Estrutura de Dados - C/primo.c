#include <stdio.h>

int main(){
	int n=0, x=0;
	int i = 1, k = 1;

	scanf("%d", &n);

	for(i=1; i<=n; ++i){
		scanf("%d", &x);
		printf("%d\n", x);
		int cont = 0;
		for(k=1; k<=x; ++k){
			if(x%k == 0){
				cont +=1;
			}
		}
		if(cont == 2){
			printf("eh primo\n");
		}
		else{
			printf("nao eh primo\n");
		}

	}

	return 0;
}