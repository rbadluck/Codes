#include<iostream>
#include<stdio.h>
#include<algorithm>
#define maxn 1010
#define task "auction"
using namespace std;
int n,m,a[maxn];
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    cin>>n>>m;
    for (int i=1;i<=m;i++) cin>>a[i];
    sort(a+1,a+m+1);
    int val=0,sum=9;
    for (int i=1;i<=m;i++)
        if (m-i+1<=n)
        if (a[i]*(m-i+1)>sum)
        {
            val=a[i];
            sum=a[i]*(m-i+1);
        }
    cout<<val<<" "<<sum<<endl;
    return 0;
}
