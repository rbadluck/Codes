#include<iostream>
#include<stdio.h>
#include<cstring>
#include<algorithm>
#define task "qbmst"
#define maxn 20010
using namespace std;
typedef pair<int,int> ii;
typedef pair<int,ii> pii;
pii a[maxn];
int lab[maxn];
void Union(int r, int s)
{
    int x=lab[r]+lab[s];
    if (lab[s]>lab[r])
    {
        lab[s]=r;
        lab[r]=x;
    }
    else
    {
        lab[r]=s;
        lab[s]=x;
    }
}
int Find(int u)
{
    while (lab[u]>0) u=lab[u];
    return u;
}
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    int n,m;
    scanf("%d %d", &n, &m);
    pii temp;
    for (int i=1;i<=m;i++)
    {
        int u,v,w;
        scanf("%d %d %d", &u, &v, &w);
        temp.first=w;
        temp.second.first=u;
        temp.second.second=v;
        a[i]=temp;
    }
    sort(a+1,a+m+1);
    memset(lab,-1,sizeof(lab));
    int cnt=0,i=0;
    long long res=0;
    int u,v;
    while ((cnt>-n)&&(i<=m))
    {
        i++;
        u=Find(a[i].second.first);
        v=Find(a[i].second.second);
        if (u!=v)
        {
            Union(u,v);
            res+=a[i].first;
        }
        cnt=min(cnt,min(lab[u],lab[v]));
    }
    cout<<res<<endl;
    return 0;
}
