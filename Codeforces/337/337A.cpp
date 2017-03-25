#include<iostream>
#include<algorithm>
#include<stdio.h>
using namespace std;
int a[100],n,m,i,res;
int main()
{
    //freopen("337A.INP","r",stdin);
    //freopen("337A.OUT","w",stdout);
    cin>>n>>m;
    for (i=0;i<m;i++) cin>>a[i];
    sort(a,a+m);
    res=a[n-1]-a[0];
    for (i=1;i+n-1<m;i++)
    if (a[i+n-1]-a[i]<res) res=a[i+n-1]-a[i];
    cout<<res<<endl;
    return 0;
}
