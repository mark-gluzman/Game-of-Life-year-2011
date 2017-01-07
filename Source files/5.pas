program drob;
uses crt;
var
n,i,r,c:integer;
k:real;
begin
clrscr;
write('chislitel=');
readln(r);
write('znamenatel=');
readln(n);

k:=1/n;
if k=1/n then writeln('0') else
begin
i:=0;
while n+1<>i do
begin
r:=(10*r) mod n;
i:=i+1;
end;
c:=r;
r:=(10*r) mod n;
write('period=');
repeat
begin
r:=(10*r) mod n;
i:=(10*r) div n;
write(i);
end until r=c;
{while r<>c do
begin
r:=(10*r) mod n;
i:=(10*r) div n;
write(i);
end;
r:=(10*r) mod n;
i:=(10*r) div n;
write(i);}
end;

readln;
end.
