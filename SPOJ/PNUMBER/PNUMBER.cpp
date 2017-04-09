#include<iostream>
#include<stdio.h>
#include<cstring>
#define task "pnumber"
#define maxn 200020
using namespace std;
bool mark[maxn];
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    int a,b;
    cin>>a>>b;
    memset(mark,true,sizeof(mark));
    int i,j;
    mark[1]=false;
    for (i=2;i<=b;i++)
    if ((mark[i])&&(i*i<=b))
    {
        for (j=2;j<=maxn/i;j++) mark[j*i]=false;
    }
    for (i=a;i<=b;i++) if (mark[i]) cout<<i<<endl;
    return 0;
}
