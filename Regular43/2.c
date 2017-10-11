#include<stdio.h>
int main(){
int i,j,n,a,max=0,s=0,r=0,b[100001]={0};
long long d[100001][4]={0};
int m=1000000007;
scanf("%d",&n);
while(n--){
scanf("%d",&a);
b[a]++;
if(max<a)max=a;
}
for(i=1;i<=max;i++)d[i][0]=(d[i-1][0]+b[i]          )%m;
for(i=1;i<=max;i++)d[i][1]=(d[i-1][1]+b[i]*d[i/2][0])%m;
for(i=1;i<=max;i++)d[i][2]=(d[i-1][2]+b[i]*d[i/2][1])%m;
for(i=1;i<=max;i++)d[i][3]=(d[i-1][3]+b[i]*d[i/2][2])%m;

for(j=0;j<4;j++){
  for(i=0;i<=max;i++){
    if(b[i])printf("%d ",d[i][j]);
  }
  printf("\n");
}

for(i=0;i<max;i++)
printf("%d ", b[i]);

printf("%lld\n",d[max][3]);
return 0;
}
