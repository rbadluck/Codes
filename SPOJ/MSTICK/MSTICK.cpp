#include<iostream>
#include<stdio.h>
#include<algorithm>
#include<utility>
#include<cstring>
#define task "mstick"
#define maxn 8000
#define inf 10e8
using namespace std;
typedef pair<int,int> ii;

bool cmp(ii x, ii y)
{
    return ((x.first<y.first)||((x.first==y.first)&&(x.second<y.second)));
}
int n,test;
ii a[maxn];
int h[maxn],f[maxn],res;
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    scanf("%d",&test);
    int i,x,y;
    while (test>0)
    {
        scanf("%d",&n);
        for (i=1;i<=n;i++)
        {
            cin>>x>>y;
            a[i].first=x;
            a[i].second=y;
        }
        sort(a+1,a+n+1,cmp);
        memset(h,0,maxn);
        memset(f,0,maxn);
        res=0;
        a[0].second=inf;
        for (i=1;i<=n;i++)
        {
            int d,c,g;
            d=0;c=res;
            while (d<=c)
            {
                g=(d+c)/2;
                if (a[h[g]].second>a[i].second)
                {
                    f[i]=g+1;
                    d=g+1;
                }
                else c=g-1;
            }
            if (f[i]>res) res=f[i];
            if ((h[f[i]]==0) || (a[h[f[i]]].second<a[i].second)) h[f[i]]=i;
        }
        cout<<res<<endl;
        test--;
    }
    return 0;
}
