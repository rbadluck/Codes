const               fi='';//NKSGAME.INP';
                    fo='';//NKSGAME.OUT';
                    maxn=100100;
type                arr=array[-1..maxn] of longint;
var                 n:longint;
                    a,b:arr;
procedure           Readf;
    var             i:longint;
    begin
                    readln(n);
                    for i:=1 to n do read(a[i]);
                    for i:=1 to n do read(b[i]);
    end;
procedure           Sort(L,H:longint);
    var             i,j,x,tmp:longint;
    begin
                    i:=L; j:=H; x:=a[L+random(H-L)];
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
function            Find(x:longint):longint;
    var             d,c,g:longint;
    begin
                    d:=1; c:=n;
                    while d<=c do
                    begin
                        g:=(d+c) div 2;
                        if a[g]=x then exit(g);
                        if a[g]>x then
                        begin
                            find:=g;
                            c:=g-1;
                        end;
                        if a[g]<x then
                        begin
                            find:=g;
                            d:=g+1;
                        end;
                    end;
    end;
function            ExaFind(x:longint):longint;
    var             d,c,g:longint;
    begin
                    d:=1; c:=n;
                    while d<=c do
                    begin
                        g:=(d+c) div 2;
                        if a[g]=x then exit(g);
                        if a[g]>x then c:=g-1 else d:=g+1;
                    end;
                    exit(0);
    end;
function            min(x,y:longint):longint;
    begin
                    if x<y then exit(x) else exit(y);
    end;
procedure           Submit;
    var             i,j,res:longint;
    begin
                    res:=maxlongint;
                    for i:=1 to n do
                    begin
                        if ExaFind(-b[i])<>0 then
                            begin
                                writeln(0);
                                exit;
                            end;
                        j:=Find(-b[i]);
                        res:=min(res,abs(a[j]+b[i]));
                        if j>1 then res:=min(res,abs(a[j-1]+b[i]));
                    end;
                    writeln(res);
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readf;
    randomize;
    sort(1,n);
    submit;
    close(input);
    close(output);
end.



