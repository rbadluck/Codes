#include<queue>
#include<iostream>
#include<stdio.h>
using namespace std;
int main()
{
    //freopen("HEAP1.INP","r",stdin);
    //freopen("HEAP1.OUT","w",stdout);
    std::priority_queue<int, std::vector<long long>, greater<long long> >minHeap;
    int test,n;
    long long u,v,x,res;
    //scanf("%d",test);
    cin>>test;
    while (test>0)
    {
        //scanf("%d",n);
        cin>>n;
        res=0;
        while (n>0)
        {
            //scanf("%ll",x);
            cin>>x;
            minHeap.push(x);
            n--;
        }
        while (!minHeap.empty())
        {

            u=minHeap.top();
            minHeap.pop(); res+=u;
            if (!minHeap.empty())
            {
                v=minHeap.top();
                minHeap.pop();
                res+=v;
                minHeap.push(u+v);
            }
            else
            {
                res-=u;
                cout<<res<<endl;
            }
        }
        test--;
    }
    return 0;
}
