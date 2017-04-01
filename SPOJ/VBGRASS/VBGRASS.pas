const               fi='';//VBGRASS.INP';
                    fo='';//VBGRASS.OUT';
                    maxn=500;
var                 m,n,count:longint;
                    a:array[0..maxn,0..maxn] of longint;
                    mark:array[0..maxn,0..maxn] of boolean;
                    hi,hj:array[0..4] of longint;
procedure           Readf;
    var             i,j:longint;
                    ch:char;
    begin
                    readln(m,n);
                    for i:=1 to m do
                    begin
                    for j:=1 to n do
                        begin
                            read(ch);
                            if ch='.' then a[i,j]:=0
                            else a[i,j]:=1;
                        end;
                    readln;
                    end;
    end;
////////////////////
procedure           Init;
    begin
                    fillchar(mark,sizeof(mark),false);
                    hi[1]:=1; hj[1]:=0;
                    hi[2]:=0; hj[2]:=1;
                    hi[3]:=-1; hj[3]:=0;
                    hi[4]:=0; hj[4]:=-1;
    end;
procedure           DFS(u,v:longint);
    var             r,x,y:longint;
    begin
                    mark[u,v]:=true;
                    for r:=1 to 4 do
                        begin
                            x:=u+hi[r];
                            y:=v+hj[r];
                            if (x>0) and (x<m+1) and (y>0) and (y<n+1) then
                            if not mark[x,y] then
                            if a[x,y]=1 then
                                DFS(x,y);
                        end;
    end;
procedure           Solve;
    var             i,j:longint;
    begin
                    for i:=1 to m do
                    for j:=1 to n do
                        if (not mark[i,j]) and (a[i,j]=1) then
                            begin
                                inc(count);
                                DFS(i,j);
                            end;
                    writeln(count);
    end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    readf;
    init;
    solve;
    close(input);
    close(output);
end.
