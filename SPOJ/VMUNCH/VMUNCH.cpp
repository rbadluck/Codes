#include<iostream>
#include<stdio.h>
#include<queue>
#include<cstring>
#define task "vmunch"
#define maxn 200
using namespace std;
typedef pair<int,int> ii;
char a[maxn][maxn];
int mark[maxn][maxn];
int m,n,hi[4],hj[4];
queue<ii> q;
int main()
{
    #ifndef ONLINE_JUDGE
        freopen(task".inp","r",stdin);
        freopen(task".out","w",stdout);
    #endif // ONLINE_JUDGE
    cin>>m>>n;
    int i,j;
    ii dau,cuoi;
    for (i=1;i<=m;i++)
    for (j=1;j<=n;j++)
    {
        cin>>a[i][j];
        if (a[i][j]=='B')
        {
            dau.first=i;
            dau.second=j;
        }
        if (a[i][j]=='C')
        {
            cuoi.first=i;
            cuoi.second=j;
        }
    }
    hi[1]=0; hj[1]=1;
    hi[2]=1; hj[2]=0;
    hi[3]=0; hj[3]=-1;
    hi[4]=-1; hj[4]=0;
    memset(mark,-1,sizeof(mark));
    mark[dau.first][dau.second]=0;
    q.push(dau);
    ii cur,nex;
    int x,y;
    while (!q.empty())
    {
        cur=q.front(); q.pop();
        for (i=1;i<=4;i++)
        {
            x=cur.first+hi[i];
            y=cur.second+hj[i];
            if ((x>0)&&(x<=m)&&(y>0)&&(y<=n)&&(a[x][y]!='*')&&(mark[x][y]==-1))
            {
                nex.first=x;
                nex.second=y;
                q.push(nex);
                mark[x][y]=mark[cur.first][cur.second]+1;

            }
        }
    }
    cout<<mark[cuoi.first][cuoi.second]<<endl;
    return 0;
}
