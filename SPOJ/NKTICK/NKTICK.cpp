#include<iostream>
#include<algorithm>
#include<stdio.h>
#define maxn 60060
#define task "nktick"
using namespace std;
int n,t[maxn],f[maxn],r[maxn];
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    cin>>n;
    int i;
    for (i=1;i<=n;i++) cin>>t[i];
    for (i=2;i<=n;i++) cin>>r[i];
    f[1]=t[1];
    for (i=2;i<=n;i++)
    {
        f[i]=min(f[i-1]+t[i],f[i-2]+r[i]);
    }
    cout<<f[n]<<endl;
    return 0;
}
