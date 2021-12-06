#include <stdio.h>

int main(){
	int t=0, c=0 pa=0, pb=0;
	double g1=0, g2=0;

	scanf("%d", &t);

	int i=0;
	for(i=0; i<t; i++){
		c=0;
		scanf("%d%d%d%d", &pa,&pb,&g1,&g2);
		while(pa<=pb){
			pa *= (pa/100.0)+1.0;
			pb *= (pb/100.0)+1.0;
			c++;
			if (c>100){
				printf("Mais de 1 seculo.\n");
				break;
			}
		}
		if (c<=100){
			printf("%d anos.\n", c);
		}
	}

	return 0;
}