#include<iostream>
#include<algorithm>
#include<stdio.h>
#define task "lnacs"
#define maxn 1010
using namespace std;
int a[maxn],b[maxn],f[maxn][maxn];
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    int m,n,i,j,res;
    cin>>m>>n;
    for (i=1;i<=m;i++) cin>>a[i+1];
    for (j=1;j<=n;j++) cin>>b[j+1];
    for (i=2;i<=m+1;i++)
    for (j=2;j<=n+1;j++)
    {
        f[i][j]=max(f[i][j-1],max(f[i-1][j],f[i-1][j-1]));
        if (a[i]==b[j]) f[i][j]=max(f[i][j],f[i-2][j-2]+1);
    }
    cout<<f[m+1][n+1]<<endl;
    return 0;
}
