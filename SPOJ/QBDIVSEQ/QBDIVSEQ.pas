const               fi='';//QBDIVSEQ.INP';
                    fo='';//QBDIVSEQ.OUT';
                    maxn=100100;
var                 n:longint;
                    a,f,h:array[0..maxn] of longint;
procedure           Readf;
    var             i:longint;
    begin
                    readln(n);
                    for i:=1 to n do readln(a[i]);
    end;
procedure           Submit;
    var             i,d,c,g,res:longint;
    begin
                    res:=0;
                    a[0]:=maxlongint;
                    for i:=1 to n do
                    begin
                        f[i]:=0;
                        d:=0; c:=res;
                        while d<=c do
                        begin
                            g:=(d+c) div 2;
                            if a[h[g]]>a[i] then
                            begin
                                f[i]:=g+1;
                                d:=g+1;
                            end
                            else c:=g-1;
                        end;
                        if (h[f[i]]=0) or (a[h[f[i]]]<a[i]) then h[f[i]]:=i;
                        if f[i]>res then res:=f[i];
                    end;
                    writeln(res);
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readf;
    submit;
    close(input);
    close(output);
end.
