const               fi='';//789A.INP';
                    fo='';//789A.OUT';
                    maxn=100100;
var                 n,k:longint;
                    a,b,c:array[0..maxn] of longint;

procedure           Readf;
    var             i:longint;
    begin
                    readln(n,k);
                    for i:=1 to n do read(a[i]);
    end;
procedure           Buffalo;
    var             i,j,cnt,top,top2:longint;
    begin
                    cnt:=0;
                    for i:=1 to n do
                        begin
                            cnt:=cnt + a[i] div (2*k);
                            a[i]:=a[i] mod (2*k);
                        end;
                    top:=0; top2:=0;
                    for i:=1 to n do
                    begin
                        if (a[i]>0) and (a[i]<=k) then inc(top);
                        if a[i]>k then inc(top2);
                    end;
                    cnt:=cnt+top div 2; top:=top mod 2;
                    cnt:=cnt+top2;
                    if top>0 then inc(cnt);
                    writeln(cnt);
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readf;
    buffalo;
    close(input);
    close(output);
end.
