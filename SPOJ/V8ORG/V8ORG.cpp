#include<iostream>
#include<stdio.h>
#include<vector>
using namespace std;
#define TASK "V8ORG"
#define maxn 10100

typedef vector<int> vi;

int k,n,deg[maxn],cnt;
vi a[maxn];

void dfs(int u)
{
    int j; deg[u]=1;
    for (j=0;j<a[u].size();j++)
    {
        dfs(a[u][j]);
        deg[u]+=deg[a[u][j]];
    }
    if (deg[u]>=k)
    {
        deg[u]=0;
        cnt++;
    }
}
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(TASK".INP","r",stdin);
        freopen(TASK".OUT","w",stdout);
    #endif //ONLINE_JUDGE
    int i,x,u,v;
    cin>>k;
    cin>>n;
    for (i=1;i<n;i++)
    {
        cin>>x;
        a[x].push_back(i+1);
    }
    cnt=0;
    dfs(1);
    cout<<cnt<<endl;
    return 0;
}
