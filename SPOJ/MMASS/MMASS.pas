const               fi='';//MMASS.INP';
                    fo='';//MMASS.OUT';
var                 s:array[0..10000] of longint;
                    top,temp,x,sum:longint;
                    ch:char;
begin
                    assign(input,fi); reset(input);
                    assign(output,fo); rewrite(output);
                    sum:=0; top:=0;
                    while not eof do
                    begin
                        read(ch);
                        case ch of
                        'C':
                        begin
                            inc(top);
                            s[top]:=12;
                        end;
                        'H':
                        begin
                            inc(top);
                            s[top]:=1;
                        end;
                        'O':
                        begin
                            inc(top);
                            s[top]:=16;
                        end;
                        '(':
                        begin
                            inc(top);
                            s[top]:=-1;
                        end;
                        ')':
                        begin
                            x:=0; temp:=0;
                            while x<>-1 do
                            begin
                                x:=s[top]; dec(top);
                                if x<>-1 then temp:=temp+x;
                            end;
                            inc(top);
                            s[top]:=temp;
                        end;
                        else
                        if ('2'<=ch) and (ch<='9') then
                        begin
                            x:=s[top]; dec(top);
                            x:=x*(ord(ch)-48);
                            inc(top); s[top]:=x;
                        end;
                    end;
                    end;
                    while top>0 do
                    begin
                        sum:=sum+s[top];
                        dec(top);
                    end;
                    writeln(sum);
                    close(input);
                    close(output);
end.
