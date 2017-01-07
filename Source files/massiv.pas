program massiv;
uses crt;
type matr=array[1..200] of real;
var
a:matr;
i,j,n:byte;
b:real;
t:boolean;
begin
   clrscr;
   writeln ('Vvedite chislo <200');
   readln(n);
       for i:=1 to n do
          Begin
             Write(' A[',i,']=');
             readln(a[i]);
          end;
       t:=true;
       j:=n-1;
       while t do
          Begin
             t:=false;
             for i:=1 to j do
                if a[i]>a[i+1] then
                   begin
                      b:=a[i];
                      a[i]:=a[i+1];
                      a[i+1]:=b;
                      t:=true;
                   end;
             j:=j-1;
          end;
       for i:=1 to n do
          write(a[i]:5:1);
    readln;
end.