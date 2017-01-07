uses graph,menud,CRT;
var
 x,x1,y1,y,r,o,i:byte;
 s:st;
begin
 CLRSCR;
 writeln('Vvedite koordinati pyncta');
 readln(x,y,x1,y1);
 writeln('Vvedide promegutok megdu pynctami');
 readln(r);
 for i:=1 to V do
  begin
   writeln('nazvanie ',i,' pyncta');
   readln(s[i]);
  end;
 reg;
 o:=menu(x,y,x1,y1,r,s);
 closegraph;
 WRITELN(o);
 readln;

end.