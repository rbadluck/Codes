#include<iostream>
#include<stdio.h>
#include<algorithm>
#define task "ptrang"
#define maxn 8000
#define inf 10e8;
using namespace std;
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    int n,i,j,id,s,l,w[maxn],f[maxn];
    cin>>n>>l;
    for (i=1;i<=n;i++)
    {
        cin>>w[i];
        s=l-w[i];
        f[i]=inf;
        for (j=i-1;j>=0;j--)

        {
            if (s>=0)
            {
                id=max(f[j],s);
                f[i]=min(f[i],id);
            }
            else break;
            s-=w[j];
        }
    }
    cout<<f[n]<<endl;
    return 0;
}
