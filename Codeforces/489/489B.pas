const               fi='';//489B.INP';
                    fo='';//489B.OUT';
                    maxn=110;
type                arr=array[0..maxn] of longint;
var                 a,b:arr;
                    F:array[0..maxn,0..maxn] of longint;
                    n,m:longint;

procedure           Readf;
    var             i:longint;
    begin
                    readln(n);
                    for i:=1 to n do read(a[i]);
                    readln(m);
                    for i:=1 to m do read(b[i]);
    end;
procedure           Sort(var a:arr;L,H:longint);
    var             i,j:longint;
                    x,tmp:int64;
    begin
                    i:=L; j:=H;
                    x:=a[L+random(H-L)];
                    repeat
                        while a[i]<x do inc(i);
                        while a[j]>x do dec(j);
                        if i<=j then
                            begin
                                tmp:=a[i]; a[i]:=a[j]; a[j]:=tmp;
                                inc(i); dec(j);
                            end;
                    until i>j;
                    if i<H then Sort(a,i,H);
                    if L<j then Sort(a,L,j);
    end;
function            max(x,y:longint):longint;
    begin
                    if x>y then exit(x) else exit(y);
    end;
procedure           Sub;
    var             i,j,res,k,l:longint;
    begin
                    res:=0;
                    for i:=1 to n do
                    for j:=1 to m do
                    begin
                    if abs(a[i]-b[j])<=1 then
                    F[i,j]:=F[i-1,j-1]+1
                    else
                    begin
                        for k:=1 to i do
                        for l:=1 to j do
                        F[i,j]:=max(F[i,j],F[k,l]);
                    end;
                    res:=max(res,F[i,j]);
                    end;
                    writeln(res);
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readf;
    randomize;
    sort(a,1,n);
    sort(b,1,m);
    sub;
    close(input);
    close(output);
end.
