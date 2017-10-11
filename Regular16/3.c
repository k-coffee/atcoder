#include <stdio.h>

double dp[1024];
int c[5],cost[5],idol[5][12],p[5][12];

int main(){
    int n,m,i,j,k,cnt;
    double tmp;
    scanf("%d%d",&n,&m);
    for(i=0;i<m;i++){
        scanf("%d%d",&c[i],&cost[i]);
        for(j=0;j<c[i];j++){
            scanf("%d%d",&idol[i][j],&p[i][j]);
            idol[i][j]--;
        }
    }
    dp[0]=0.0;
    for(i=1;i<(1<<n);i++){
        dp[i]=100000000000.0;
        for(j=0;j<m;j++){
            tmp=1.0*cost[j];cnt=0;
            for(k=0;k<c[j];k++){
                if(i&(1<<idol[j][k])){
                    tmp=tmp+dp[i^(1<<idol[j][k])]*p[j][k]/100.0;
                    cnt+=p[j][k];
                    printf("%d, %d, %d\n", i, idol[j][k], cnt);
                    printf("dp: %f\n", dp[i^(1<<idol[j][k])]);
                }
            }
            if(!cnt)continue;
            tmp=tmp*100.0/cnt;
            if(dp[i]>tmp)dp[i]=tmp;
        }
    }
    for(i=1;i<(1<<n);i++)
        printf("%f\n", dp[i]);
    printf("%.10lf\n",dp[(1<<n)-1]);
    return 0;
}
