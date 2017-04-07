#include<iostream>
#include<stdio.h>
#include<queue>
#include<algorithm>
#define task "maxarr1"
#define maxn 100010
typedef long long ll;
using namespace std;
priority_queue<ll,vector<ll> > pq;
ll a[maxn],f[maxn];
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    a[0]=0; a[1]=1; f[1]=1;
    for (int i=2;i<=maxn;i++)
    {
        if (i%2==0)
        {
            a[i]=a[i/2];
        }
        else
        {
            a[i]=a[i/2]+a[i/2+1];
        }

        f[i]=max(f[i-1],a[i]);
    }
    int test,n;
    cin>>test;
    while (test>0)
    {
        cin>>n;
        cout<<f[n]<<endl;
        test--;
    }
    return 0;
}
/*pq.push(a[1]);
    pq.push(10);
    for (i=2;i<=maxn;i++)
    {
        if (i%2==0) a[i]=a[i/2];
        if (i%2==1) a[i]=a[i/2]+a[i/2+1];
        pq.push(a[i]);
        f[i]=pq.top();
    }*/
