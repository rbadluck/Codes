const               fi='';//MDOLLS.INP';
                    fo='';//MDOLLS.OUT';
                    maxn=50500;
var                 n,test:longint;
                    a,b,f,high:array[0..maxn] of longint;
procedure           Readf;
    var             i:longint;
    begin
                    readln(n);
                    for i:=1 to n do read(a[i],b[i]);
                    readln;
    end;
procedure           Sort(L,H:longint);
    var             i,j,k,x,y,tmp:longint;
    begin
                    k:=L+random(H-L);
                    x:=a[k]; y:=b[k];
                    i:=L; j:=H;
                    repeat
                        while (a[i]<x) or ((a[i]=x) and (b[i]>y)) do inc(i);
                        while (a[j]>x) or ((a[j]=x) and (b[j]<y)) do dec(j);
                        if i<=j then
                        begin
                            tmp:=a[i]; a[i]:=a[j]; a[j]:=tmp;
                            tmp:=b[i]; b[i]:=b[j]; b[j]:=tmp;
                            inc(i); dec(j);
                        end;
                    until i>j;
                    if i<H then Sort(i,H);
                    if L<j then Sort(L,j);
    end;
procedure           Submit;
    var             i,d,c,g,r:longint;
    begin
                    fillchar(high,sizeof(high),0);
                    r:=0; b[0]:=maxlongint;
                    for i:=1 to n do
                    begin
                        d:=0; c:=r;
                        while d<=c do
                        begin
                            g:=(d+c) div 2;
                            if b[i]<=b[high[g]] then
                            begin
                                f[i]:=g+1;
                                d:=g+1;
                            end
                            else c:=g-1;
                        end;
                        if (high[f[i]]=0) or (b[high[f[i]]]<b[i]) then high[f[i]]:=i;
                        if f[i]>r then r:=f[i];
                    end;
                    writeln(r);
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    randomize;
    readln(test);
    while test>0 do
    begin
    readf;
    sort(1,n);
    submit;
    dec(test);
    end;
    close(input);
    close(output);
end.
