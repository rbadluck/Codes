const               fi='';//455A.INP';
                    fo='';//455A.OUT';
                    maxn=100100;
var                 n,cnt:longint;
                    a,b,d:array[0..maxn] of int64;
                    f:array[0..maxn] of int64;
procedure           Readf;
    var             i:longint;
    begin
                    readln(n);
                    for i:=1 to n do read(a[i]);
    end;
procedure           Sort(L,H:longint);
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
                    if i<H then Sort(i,H);
                    if L<j then Sort(L,j);
    end;
function            max(x,y:int64):int64;
    begin
                    if x>y then exit(x) else exit(y);
    end;
procedure           Process;
    var             i:longint;
                    res,pres:int64;
    begin
                    cnt:=0;
                    for i:=1 to n do
                    if a[i]<>a[i-1] then
                    begin
                        inc(cnt);
                        b[cnt]:=a[i];
                        d[cnt]:=1;
                    end
                    else inc(d[cnt]);

                    f[1]:=b[1]*d[1];
                    res:=f[1]; pres:=0;
                    for i:=2 to cnt do
                    begin
                        pres:=max(pres,f[i-2]);
                        if b[i]>b[i-1]+1 then f[i]:=b[i]*d[i]+res
                        else f[i]:=b[i]*d[i]+pres;
                        res:=max(res,f[i]);
                    end;
                    writeln(res);
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readf;
    randomize;
    sort(1,n);
    process;
    close(input);
    close(output);
end.
