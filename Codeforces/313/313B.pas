const               fi='';//313B.INP';
                    fo='';//313B.OUT';
                    maxn=100100;
var                 s:ansistring;
                    n:longint;
                    f:array[0..maxn] of longint;
procedure           Readf;
    begin
                    readln(s);
                    n:=length(s);
    end;
procedure           Init;
    var             i:longint;
    begin
                    f[1]:=0;
                    for i:=2 to n do
                    begin
                        f[i]:=f[i-1];
                        if s[i]=s[i-1] then inc(f[i]);
                    end;
    end;
procedure           Submit;
    var             q,u,v:longint;
    begin
                    readln(q);
                    while q>0 do
                    begin
                        readln(u,v);
                        writeln(f[v]-f[u]);
                        dec(q);
                    end;
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readf;
    init;
    submit;
    close(input);
    close(output);
end.
