#include<iostream>
#include<stdio.h>
#include<algorithm>
#define maxn 20200
#define inf 10e8
#define task "amsseq"
using namespace std;
int n,k,a[maxn],f[maxn];
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    cin>>n>>k;
    int i;
    for (i=1;i<=n;i++)
    {
        cin>>a[i];
        f[i]=-inf;
    }
    int res=0;
    for (i=0;i<=n;i++)
    {
        //cout<<f[i]<<endl;
        res=max(f[i],res);
        for (int j=k;j>0;j--)
        {
            if (i+j<=n) f[i+j]=max(f[i+j],f[i]+a[i+j]);
        }
    }
    cout<<res<<endl;
    return 0;
}
