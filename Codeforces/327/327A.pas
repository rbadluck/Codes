const               fi='';//327A.INP';
                    fo='';//327A.OUT';
var                 n,i,j,res,tmp:longint;
                    a,f:array[0..110] of longint;
begin
                    assign(input,fi); reset(input);
                    assign(output,fo); rewrite(output);
                    readln(n);
                    for i:=1 to n do
                    begin
                        read(a[i]);
                        if a[i]=1 then f[i]:=f[i-1]+1 else f[i]:=f[i-1];
                    end;
                    res:=1-2*(f[1]-f[0]);
                    for i:=1 to n do
                    for j:=i to n do
                    begin
                        tmp:=(j-i+1)-2*(f[j]-f[i-1]);
                        if tmp>res then res:=tmp;
                    end;
                    res:=res+f[n];
                    writeln(res);
                    close(input);
                    close(output);
end.


