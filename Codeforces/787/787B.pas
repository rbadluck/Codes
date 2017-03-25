const               fi='';//787B.INP';
                    fo='';//787B.OUT';
                    maxn=10100;
                    maxk=1000100;
var                 m,n:longint;
                    res:boolean;
                    a,s:array[0..maxk] of longint;
                    check:array[-maxn..maxn] of boolean;

procedure           Sub;
    var             i,cnt,top,x:longint;
                    temp:boolean;
    begin
                    top:=0; temp:=true;
                    read(cnt);
                    for i:=1 to cnt do
                    begin
                        read(x);
                        inc(top);
                        a[top]:=x;
                        check[x]:=true;
                    end;
                    readln;

                    for i:=1 to top do
                        if (check[a[i]]) and (check[-a[i]]) then temp:=false;
                    if temp then res:=true;
                    for i:=1 to top do check[a[i]]:=false;
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    fillchar(check,sizeof(check),false);
    readln(n,m); res:=false;
    while M>0 do
    begin
        sub;
        dec(m);
    end;
    if res then writeln('YES') else writeln('NO');
    close(input);
    close(output);
end.





