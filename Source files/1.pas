program treyg;
uses crt;
var
x1,x2,x3,y1,y2,y3,s,p:real;
begin
clrscr;
writeln('Vvedite koordinatu 1-oy tochki');
readln(x1,y1);
writeln('Vvedite koordinatu 2-oy tochki');
readln(x2,y2);
writeln('Vvedite koordinatu 3-oy tochki');
readln(x3,y3);
if (x3-x1)*(y2-y1)=(y3-y1)*(x2-x1) then writeln('tochiki nahodya na odnoi prymoi')
else begin
p:=sqrt(sqr(x1-x2)+sqr(y1-y2))+sqrt(sqr(x1-x3)+sqr(y1-y3))+sqrt(sqr(x3-x2)+sqr(y3-y2));
s:=abs(0.5*((x2-x1)*(y3-y1)-(y2-y1)*(x3-x1)));
writeln('perimetr=',p:0:2);
writeln('ploschad=',s:0:2);
readln;
end;
end.
