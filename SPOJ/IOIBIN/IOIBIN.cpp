#include<iostream>
#include<stdio.h>
#define TASK "IOIBIN"
using namespace std;
int lab[10010];
int trace(int u)
{
    while (lab[u]>0) u=lab[u];
    return u;
}
void unite(int r, int s)
{
    int x=lab[r]+lab[s];
    if (lab[r]>lab[s])
    {
        lab[r]=s;
        lab[s]=x;
    }
    else
    {
        lab[s]=r;
        lab[r]=x;
    }
}
int main()
{
    //freopen(TASK".INP","r",stdin);
    //freopen(TASK".OUT","w",stdout);
    int x,y,z,t,u,v;
    for (t=1;t<=10010;t++) lab[t]=-1;
    cin>>t;
    while (t>0)
    {
        cin>>x>>y>>z;
        u=trace(x); v=trace(y);
        if (z==2)
        {
            if (u!=v) cout<<0<<endl;
            else cout<<1<<endl;
        };
        if (z==1)
        {
            if (u!=v) unite(u,v);
        };
        --t;
    }
    return 0;
}
