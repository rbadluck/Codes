const               fi='';//VRATF.INP';
                    fo='';//VRATF.OUT';
var                 n,i,k,x,cnt,top,max:longint;
                    s:array[0..100100] of longint;
begin
                    assign(input,fi); reset(input);
                    assign(output,fo); rewrite(output);
                    readln(n,k);
                    top:=1; s[1]:=n; cnt:=0;
                    while top>0 do
                    begin
                        x:=s[top]; dec(top);
                        if ((x+k) mod 2 = 0) and (x>k) then
                        begin
                            inc(top);
                            s[top]:=(x+k) div 2;
                            inc(top);
                            s[top]:=(x-k) div 2;
                            if top>max then max:=top;
                        end
                        else inc(cnt);
                    end;
                    writeln(cnt);
                    close(input);
                    close(output);
end.
