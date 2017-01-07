program pr_del;
uses crt;
var a,i,k,q:integer;
begin
clrscr;
writeln('Vvedite natyralnoe chiclo');
readln(q);
if q<1 then writeln('Vu vveli ne natyralnoe chislo') else
while a<q do
begin
while (a mod i<>0) and (i<trunc(a/2))
do
Begin
i:=succ(i);
end;
if a mod i=0 then
begin
a:=succ(a);
i:=2;
end else
begin
k:=succ(k);
write(a,'  ');
a:=succ(a);
i:=2;
end;
end;
readln;
end.