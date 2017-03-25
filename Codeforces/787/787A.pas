const               fi='';//787A.INP';
                    fo='';//787A.OUT';
var                 a,b,c,d:longint;
                    mark:array[0..100500] of boolean;
                    check:boolean;
procedure           Readf;
    begin
                    readln(a,b);
                    readln(c,d);
    end;
procedure           Greedy;
    var             i:longint;
    begin
                    fillchar(mark,sizeof(mark),false);
                    check:=false;
                    for i:=0 to 1000 do mark[b+a*i]:=true;
                    for i:=0 to 1000 do if mark[d+c*i] then
                    begin
                        writeln(d+c*i);
                        exit;
                    end;
                    if not check then writeln(-1);
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readf;
    greedy;
    close(input);
    close(output);
end.



