#include <s t d i o . h>

double media_frente (double ve t [ ] , int ∗m) {
    double ma = 0 , md = 0 ;
    for (int i = 0; i < 30; i++) {
        ma += vet[i];
        ve t [i] = (vet[i] + vet[i+1])/2.0;
        md += vet[i];
    }
    ma = ma/30.0;
    m = md/30.0;
    return ma;
}

int main () {
    double v[20];
    double mediad, mediaa;
    for (int i=0; i < 20; i++) {
        scanf( "%lf",&v[i]);
    }
    mediaa = media_frente (v, mediad);
    printf("Media antes: %lf\n", mediaa);
    printf("Media depois: %lf\n", mediad);
    return 0 ;
}
