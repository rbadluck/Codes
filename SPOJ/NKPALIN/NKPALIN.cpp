#include<iostream>
#include<stdio.h>
#include<algorithm>
#include<string>
#define task "nkpalin"
#define maxn 3000
using namespace std;
int n,f[maxn][maxn];
char a[maxn];
string s;
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    cin>>s;
    n=s.size();
    char b[maxn];
    for (int i=0;i<n;i++) a[i+1]=s[i];
    for (int i=n;i>0;i--) b[i]=a[n-i+1];
    for (int i=1;i<=n;i++)
    for (int j=1;j<=n;j++)
    if (a[i]==b[j]) f[i][j]=f[i-1][j-1]+1;
    else f[i][j]=max(f[i-1][j],f[i][j-1]);
    int i=n,j=n,cnt=0;
    char res[maxn];
    int kq=f[n][n];
    while ((i>0)&&(j>0)&&(f[i][j]>0))
    {
        if ((f[i][j]==f[i-1][j-1]+1)&&(a[i]==b[j]))
        {
            cnt++;
            if (cnt>kq-cnt+1) break;
            else{
                res[cnt]=a[i];
                res[kq-cnt+1]=a[i];
                i--;
                j--;
            }
        }
        else
        {
            if (f[i][j]==f[i-1][j]) i--;
            else j--;
        }
    }
    for (int i=1;i<=kq;i++) cout<<res[i];
    return 0;
}
