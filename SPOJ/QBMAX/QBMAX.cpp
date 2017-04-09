#include<iostream>
#include<stdio.h>
#include<algorithm>
#define task "qbmax"
#define maxn 1000
#define inf 1000000007
typedef long long ll;
using namespace std;
int m,n;
int a[maxn][maxn];
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    cin>>m>>n;
    int i,j;
    for (i=0;i<=m+1;i++)
    for (j=0;j<=n+1;j++) a[i][j]=-inf;
    for (i=1;i<=m;i++)
    for (j=1;j<=n;j++) cin>>a[i][j];
    for (j=2;j<=n;j++)
    for (i=1;i<=m;i++)
    a[i][j]=max(a[i-1][j-1],max(a[i][j-1],a[i+1][j-1]))+a[i][j];
    int res=a[1][n];
    for (i=2;i<=m;i++) res=max(res,a[i][n]);
    cout<<res<<endl;
    return 0;
}
