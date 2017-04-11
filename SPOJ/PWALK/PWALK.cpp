#include<iostream>
#include<stdio.h>
#include<vector>
#include<cstring>
#define task "pwalk"
#define maxn 1010
using namespace std;
typedef pair<int,int> ii;
typedef vector<ii> vii;
vii a[maxn];
int dis[maxn][maxn];
void dfs(int u, int v)
{
    int j;
    ii x;
    for (j=0;j<a[v].size();j++)
    {
        x=a[v][j];
        //if (x.first==u) return;
        if (dis[u][x.first]==-1)
        {
            dis[u][x.first]=dis[u][v]+x.second;
            dfs(u,x.first);
        }
    }
    return;
}

int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    int n,qr;
    cin>>n>>qr;
    int i,u,v,x;
    ii ti;
    for (i=1;i<n;i++)
    {
        cin>>u>>v>>x;
        ti.first=v; ti.second=x;
        a[u].push_back(ti);
        ti.first=u;
        a[v].push_back(ti);
    }
    memset(dis,-1,sizeof(dis));
    for (i=1;i<=n;i++) dis[i][i]=0;
    for (i=1;i<=n;i++) dfs(i,i);
    for (i=1;i<=qr;i++)
    {
        cin>>u>>v;
        cout<<dis[u][v]<<endl;
    }
    return 0;
}
