const               fi='';//789C.INP';
                    fo='';//789C.OUT';
                    maxn=100100;
var                 n:longint;
                    a,b:array[0..maxn] of longint;
                    f1,f2:array[0..maxn] of int64;
procedure           Readf;
    var             i:longint;
    begin
                    readln(n);
                    for i:=1 to n do
                    begin
                        read(a[i]);
                        if i>1 then b[i-1]:=abs(a[i-1]-a[i]);
                    end;
                    f1[0]:=0; f2[0]:=0;
                    for i:=1 to n-1 do
                    begin
                        if i mod 2=0 then b[i]:=-b[i];
                        f1[i]:=f1[i-1]+b[i];
                        f2[i]:=-f1[i];
                    end;
    end;
function            min(x,y:int64):int64;
    begin
                    if x<y then exit(x) else exit(y);
    end;
function            max(x,y:int64):int64;
    begin
                    if x>y then exit(x) else exit(y);
    end;
procedure           Greedy;
    var             i:longint;
                    f1min,f2min,res:int64;
    begin
                    f1min:=0; f2min:=0; res:=0;
                    for i:=1 to n-1 do
                    begin
                        res:=max(res,f1[i]-f1min);
                        f1min:=min(f1min,f1[i]);
                        res:=max(res,f2[i]-f2min);
                        f2min:=min(f2min,f2[i]);
                    end;
                    writeln(res);
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readf;
    greedy;
    close(input);
    close(output);
end.
