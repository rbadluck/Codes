const               maxn=100000;
type                mang=array[0..maxn+1] of longint;
var                 b,c:mang;
                    n:longint;

function            min(x,y:longint):longint;
    begin
                    if x>y then exit(y) else exit(x);
    end;
////////////////////
Procedure           Sort(Var m:mang;L,R:Longint);
    Var             i,j,x,temp:Longint;
    Begin
                    i:=L;j:=R; x:=m[(L+R) div 2];
                    Repeat
                        While m[i] < x do Inc(i);
                        While x < m[j] do Dec(j);
                        If i<=j then
                            Begin
                                temp:=m[i]; m[i]:=m[j]; m[j]:=temp;Inc(i);Dec(j);
                            End;
                        Until i>j;
                    If L<j then Sort(m,L,j); If i<R then Sort(m,i,R);
    End;
////////////////////
procedure           Enter;
    var             j:longint;
    begin
                    readln(n);
                    for j:=1 to n do read(b[j]);
                    for j:=1 to n do read(c[j]);
                    b[0]:=-maxlongint; b[n+1]:=maxlongint;
                    c[0]:=-maxlongint; c[n+1]:=maxlongint;
                    Sort(b,1,n);
                    Sort(c,1,n);
    end;
////////////////////
function            find(x:longint):longint;
    var             first,last,mid:longint;
    begin
                    first:=1; last:=n;
                    while first<=last do
                        begin
                            mid:=(first+last) div 2;
                            if c[mid]>x then
                                begin
                                    if (c[mid]>x) and (c[mid-1]<x) then exit(mid);
                                    last:=mid-1;
                                end;
                            if c[mid]<x then
                                begin
                                    if (c[mid]<x) and (c[mid+1]>x) then exit(mid+1);
                                    first:=mid+1;
                                end;
                        end;
                    Exit(0);
    end;
function            ExaFind(x:longint):longint;
    var             first,last,mid:longint;
    begin
                    ExaFind:=0;
                    first:=1; last:=n;
                    while first<=last do
                        begin
                            mid:= (first+last)div 2;
                            if c[mid]>x then Last:=Mid-1;
                            if c[mid]<x then First:=Mid+1;
                            if c[mid]=x then
                                begin
                                    ExaFind:=mid;
                                    Last:=Mid-1;
                                end;
                        end;
    end;
////////////////////
procedure           Solve;
    var             i,j,tmp,tmp2,res:longint;
    begin
                    If (b[1]>=0) and (c[1]>=0) then begin writeln(b[1]+c[1]); exit; end;
                    if (b[n]<=0) and (c[n]<=0) then begin writeln(abs(b[n]+c[n])); exit; end;
                    res:=maxlongint;
                    For i:=1 to n do
                        Begin
                            If ExaFind(-b[i])<>0 then begin writeln(0); exit; end;
                            j:=Find(-b[i]);
                            tmp:=Min(abs(b[i]+c[j-1]),abs(b[i]+c[j]));
                            res:=min(tmp,res);
                        End;
                    Writeln(res);
    end;
////////////////////
BEGIN
Enter;
Solve;
END.
