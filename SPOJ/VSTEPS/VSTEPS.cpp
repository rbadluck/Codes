#include<iostream>
#include<stdio.h>
#define task "vsteps"
#define maxn 100100
#define base 14062008
using namespace std;
int a[maxn];
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    int n,i,k,x;
    a[1]=1;a[0]=0;

    cin>>n>>k;
    for (i=1;i<=k;i++)
    {
        cin>>x;
        a[x]=-1;
    }
    for (i=2;i<=n;i++)
        if (a[i]!=-1)
        {
            if (a[i-1]!=-1) a[i]+=a[i-1];
            if (a[i-2]!=-1) a[i]+=a[i-2];
            if (a[i]>base) a[i]=a[i]%base;
        }
    cout<<a[n]<<endl;
    return 0;
}
