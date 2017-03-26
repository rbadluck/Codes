const               fi='';//189A.INP';
                    fo='';//189A.OUT';
                    maxn=5000;
var                 n,a,b,c:longint;
procedure           Readf;
    begin
                    readln(n,a,b,c);
    end;
procedure           Sort;
    var             i,j,tmp:longint;
                    t:array[1..3] of longint;
    begin
                    t[1]:=a; t[2]:=b; t[3]:=c;
                    for i:=1 to 3 do
                    for j:=i+1 to 3 do
                    if t[j]>t[i] then
                        begin
                            tmp:=t[i]; t[i]:=t[j]; t[j]:=tmp;
                        end;
                    a:=t[3]; b:=t[2]; c:=t[1];
    end;
procedure           Sub;
    var             i,j,sum,sum2,res,tmp:longint;
    begin
                    res:=0;
                    for i:=n div a downto 0 do
                        begin
                            sum:=n-i*a;
                            for j:=sum div b downto 0 do
                                begin
                                    sum2:=sum-j*b;
                                    if sum2 mod c=0 then
                                    begin
                                    tmp:=i+j+sum2 div c;
                                    if tmp>res then res:=tmp;
                                    end;
                                end;
                        end;
                    writeln(res);
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readf;
    sort;
    sub;
    close(input);
    close(output);
end.






