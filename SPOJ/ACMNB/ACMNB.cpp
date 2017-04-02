#include<iostream>
#include<stdio.h>
#include<vector>
#include<algorithm>
#define TASK "ACMNB"
using namespace std;
int n,res,sum;
vector<int> a;
int main()
{
    //freopen(TASK".inp","r",stdin);
    //freopen(TASK".out","w",stdout);
    scanf("%d",&n);
    sum=0;
    int i,x,y;
    for (i=1;i<=2*n;i++)
    {
        scanf("%d %d",&x,&y);
        sum+=x+y;
        a.push_back(x-y);
    }
    res=sum;
    sort(a.begin(),a.end());
    for (i=0;i<n;i++)
    {
        res+=a[i]-a[n+i];
    }
    printf("%d",res/2);
    return 0;
}
