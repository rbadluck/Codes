const               fi='';//580A.INP';
                    fo='';//580A.OUT';
                    maxn=100100;
var                 n:longint;
                    a,l,h:array[0..maxn] of longint;
procedure           Readf;
    var             i:longint;
    begin
                    readln(n);
                    for i:=1 to n do read(a[i]);
    end;
function            max(x,y:longint):longint;
    begin
                    if x>y then exit(x) else exit(y);
    end;
{procedure           Process;
    var             i,d,c,g,res:longint;
    begin
                    res:=0;
                    for i:=1 to n do
                    begin
                        d:=0; c:=res;
                        while d<=c do
                            begin
                                g:=(d+c) div 2;
                                if a[h[g]]<=a[i] then
                                    begin
                                        l[i]:=g+1;
                                        d:=g+1;
                                    end
                                else c:=g-1;
                            end;
                        if (h[l[i]]=0) or (a[h[l[i]]]>a[i]) then h[l[i]]:=i;
                        res:=max(res,l[i]);
                    end;
                    writeln(res);
    end;}
procedure           Process;
    var             i,res:longint;
    begin
                    res:=1; l[1]:=1;
                    for i:=2 to n do
                        begin
                            if a[i]>=a[i-1] then l[i]:=l[i-1]+1
                            else l[i]:=1;
                            res:=max(res,l[i]);
                        end;
                    writeln(res);
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readf;
    process;
    close(input);
    close(output);
end.
