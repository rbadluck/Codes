const               fi='';//791A.INP';
                    fo='';//791A.OUT';
var                 a,b,i:longint;
                    tmp:real;
begin
                    assign(input,fi); reset(input);
                    assign(output,fo); rewrite(output);
                    readln(a,b);
                    i:=0; tmp:=1;
                    while (tmp<=b/a) do
                    begin
                        inc(i);
                        tmp:=tmp*(3/2);
                    end;
                    writeln(i);
                    close(input);
                    close(output);
end.


