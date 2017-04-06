#include<iostream>
#include<algorithm>
#include<stdio.h>
#include<string>
#include<cstring>
#define task "qbstr"
#define maxn 1010
using namespace std;
string a,b;
int f[maxn][maxn];
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    cin>>a;
    cin>>b;
    int i,j,m,n;
    memset(f,0,maxn*maxn);
    m=a.length();n=b.length();
    for (i=0;i<m;i++)
    {
        for (j=0;j<n;j++)
    {
        if (a[i]==b[j]) f[i+1][j+1]=f[i][j]+1;
        else f[i+1][j+1]=max(f[i][j+1],f[i+1][j]);
    }
    }
    cout<<f[m][n];
    return 0;
}
