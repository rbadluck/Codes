const               fi='';//MINK.INP';
                    fo='';//MINK.OUT';
                    maxn=30000;
var                 n,test,top,bot,i,k:longint;
                    a,q:array[0..maxn] of longint;
begin
                    assign(input,fi); reset(input);
                    assign(output,fo); rewrite(output);
                    readln(test);
                    while test>0 do
                    begin
                        readln(n,k); top:=1; bot:=0;
                        for i:=1 to n do
                        begin
                            read(a[i]);
                            while (top<=bot) and (q[top]<=i-k) do inc(top);
                            while (a[q[bot]]>a[i]) and (bot>=top) do dec(bot);
                            inc(bot); q[bot]:=i;
                            if i>=k then write(a[q[top]],' ');
                        end;
                        writeln;
                        dec(test);
                    end;
                    close(input);
                    close(output);
end.
