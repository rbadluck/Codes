#include<iostream>
#include<algorithm>
#include<stdio.h>
#include<queue>
#define task "kmin"
#define maxn 60060
class ele
{
    public:
        int csa;
        int csb;
        int val;
};
struct comp
{
    bool operator()(const ele& x,const ele& y)
    {
        return x.val>y.val;
    }
};
using namespace std;
int m,n,k,a[maxn],b[maxn];
priority_queue<ele,vector<ele>,comp>pq;
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    cin>>m>>n>>k;
    int i;
    for (i=1;i<=m;i++) cin>>a[i];
    for (i=1;i<=n;i++) cin>>b[i];
    sort(a+1,a+m+1);
    sort(b+1,b+n+1);
    struct ele x;
    for (i=1;i<=m;i++)
    {
        x.csa=i;
        x.csb=1;
        x.val=a[i]+b[1];
        pq.push(x);
    }
    int cnt=0;
    while (cnt<k)
    {
        x=pq.top(); pq.pop();
        cout<<x.val<<endl;
        x.csb++;
        x.val=a[x.csa]+b[x.csb];
        pq.push(x);
        cnt++;
    }
    return 0;
}
