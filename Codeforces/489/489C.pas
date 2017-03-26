const               fi='';//489C.INP';
                    fo='';//489C.OUT';
var                 m,s:longint;
                    a,b:array[0..110] of longint;

procedure           GetMax;
    var             i,j,t:longint;
    begin
                    t:=s; i:=1;
                    while t>=9 do
                    begin
                        b[i]:=9;
                        inc(i);
                        t:=t-9;
                    end;
                    b[i]:=t; t:=0; inc(i);
                    for j:=i to m do b[i]:=0;
                    for j:=1 to m do write(b[j]);
    end;
procedure           GetMin;
    var             i,j,t:longint;
    begin
                    if (m=1) then
                        begin
                            write(s,' ');
                            exit;
                        end;
                    t:=s;
                    for i:=1 to m do
                    begin
                        if (t>9*(m-i)) then
                        begin
                            a[i]:=t-9*(m-i);
                            t:=t-a[i];
                        end
                    else
                        begin
                            if i=1 then a[i]:=1 else a[i]:=0;
                            t:=t-a[i];
                        end;
                    end;
                    for i:=1 to m do write(a[i]);
                    write(' ');
    end;


function            Check:boolean;
    begin
                    if ((s=0) and (m>1)) or (s>m*9) then
                        begin
                            writeln(-1,' ',-1);
                            exit(false);
                        end;
                    exit(true);
    end;

begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readln(m,s);
    if check then
        begin
            getmin;
            getmax;
        end;
    close(input);
    close(output);
end.


