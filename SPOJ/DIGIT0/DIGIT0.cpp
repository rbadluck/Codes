#include<iostream>
#include<stdio.h>
#include<vector>
#include<algorithm>
#define task "digit0"
#define maxn 10010
using namespace std;
typedef vector<int> vi;
vi f[maxn];
int a[maxn],pr[maxn],mul[maxn],mdc[maxn];
void ini()
{
    int i,j;
    for (i=2;i<=maxn;i++) pr[i]=i;
    pr[1]=0;
    for (i=2;i<=maxn;i++)
    if ((pr[i]==i)&&(i*i<=maxn))
    {
        for (j=2;j<=maxn/i;j++) pr[j*i]=i;
    }
    for (i=2;i<=maxn;i++)
    {
        j=i;
        while (j>1)
        {
            f[i].push_back(pr[j]);
            j=j/pr[j];
        }
    }
}
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    ini();
    string s;
    cin>>s;
    int n=0;
    for (int i=0;i<s.size();i++)
    {
        if (('a'<=s[i])&&(s[i]<='z'))
        {
            a[int(s[i])-int('a')+1]++;
            n++;
        }
    }
    mul[n]=1;
    for (int i=n;i>=2;i--)
    {
        mul[i]+=mul[i+1];
    }
    int u;
    for (int i=n;i>=2;i--)
    {
        if (pr[i]!=i)
        {
            for (int j=0;j<f[i].size();j++)
        {
            u=f[i][j];
            mul[u]+=mul[i];
        }
        mul[i]=0;
        }
    }

    for (int i=1;i<30;i++) mdc[a[i]]++;
    for (int i=n;i>=2;i--) mdc[i]+=mdc[i+1];
    for (int i=n;i>=2;i--)
    {
        {
            for (int j=0;j<f[i].size();j++)
        {
            u=f[i][j];
            mul[u]-=mdc[i];
        }
        mdc[i]=0;
        }
    }
    int res=0;
    res=min(mul[2],mul[5]);
    cout<<res<<endl;
}
