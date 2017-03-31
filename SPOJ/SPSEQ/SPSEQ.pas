const               fi='';//SPSEQ.INP';
                    fo='';//SPSEQ.OUT';
                    maxn=100100;
var                 n:longint;
                    a,f1,f2,h:array[0..maxn] of longint;
procedure           readf;
    var             i:longint;
    begin
                    readln(n);
                    for i:=1 to n do read(a[i]);
    end;
function            min(x,y:longint):longint;
    begin
                    if x<y then exit(x) else exit(y);
    end;
function            max(x,y:longint):longint;
    begin
                    if x>y then exit(x) else exit(y);
    end;
procedure           submit;
    var             i,j,d,c,g,r1,r2,r:longint;
    begin
                    r1:=0;
                    a[0]:=-maxlongint;
                    for i:=1 to n do
                    begin
                        f1[i]:=0;
                        d:=0; c:=r1;
                        while d<=c do
                        begin
                            g:=(d+c) div 2;
                            if a[h[g]]<a[i] then
                            begin
                                f1[i]:=g+1;
                                d:=g+1;
                            end
                            else c:=g-1;
                        end;
                        if (h[f1[i]]=0) or (a[h[f1[i]]]>a[i]) then h[f1[i]]:=i;
                        if f1[i]>r1 then r1:=f1[i];
                    end;

                    r2:=0;
                    fillchar(h,sizeof(h),0);
                    h[0]:=n+1;
                    for i:=n downto 1 do
                    begin
                        f2[i]:=0;
                        d:=0; c:=r2;
                        while d<=c do
                        begin
                            g:=(d+c) div 2;
                            if a[h[g]]<a[i] then
                            begin
                                f2[i]:=g+1;
                                d:=g+1;
                            end
                            else c:=g-1;
                        end;
                        if (h[f2[i]]=0) or (a[h[f2[i]]]>a[i]) then h[f2[i]]:=i;
                        if f2[i]>r2 then r2:=f2[i];
                    end;
                    r:=0;
                    for i:=1 to n do
                    r:=max(r,2*min(f1[i],f2[i])-1);
                    writeln(r);
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readf;
    submit;
    close(input);
    close(output);
end.
