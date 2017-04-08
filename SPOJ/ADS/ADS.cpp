#include<iostream>
#include<stdio.h>
#include<vector>
#include<cstring>
#include<algorithm>
#define task "ads"
#define maxn 3000
using namespace std;
int n,m,lt;
vector<int> a[maxn];
bool mark[maxn];
void dfs(int &u)
{
    int j;
    mark[u]=false;
    for (j=0;j<a[u].size();j++)
    if (mark[a[u][j]]) dfs(a[u][j]);

}
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    int n,m,u,v,i;
    cin>>n>>m;
    for (i=1;i<=m;i++)
    {
        cin>>u>>v;
        a[u].push_back(v);
        a[v].push_back(u);
    }
    memset(mark,true,sizeof(mark));
    int cnt=0;
    for (i=1;i<=n;i++)
    if (mark[i])
    {
        cnt++;
        dfs(i);
    }
    cout<<(m-n+cnt)<<endl;
    return 0;
}
