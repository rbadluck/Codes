#include<iostream>
#include<queue>
#include<stdio.h>
#define TASK "QBHEAP"
using namespace std;
priority_queue<int> pq,pqq;
int main()
{
    int x;
    char ch;
    //freopen(TASK".inp","r",stdin);
    //freopen(TASK".out","w",stdout);
    while (scanf("%c",&ch)>0)
    {
        if (ch=='+')
        {
            scanf("%d",&x);
            if (pq.size()<15000) pq.push(x);
        };
        if (ch=='-')
        {
            if (pq.size()>0) x=pq.top();
            while ((pq.size()>0)&&(pq.top()==x))
            {
                pq.pop();
            }
        }
    }
    x=pq.top();
    pqq.push(x);
    while (pq.size()>0)
    {
        if (pq.top()!=x)
        {
            x=pq.top();
            pqq.push(x);
        };
        pq.pop();
    }
    printf("%d\n",pqq.size());
    while (pqq.size()>0)
    {
        printf("%d\n",pqq.top());
        pqq.pop();
    }
    return 0;
}
