program massiv;
uses crt;
type matr=array[1..200] of integer;
var
a:matr;
i,n,k,j,p:byte;
b:integer;
t:boolean;
c:char;
begin
   randomize;
   clrscr;
   writeln ('Vvedite chislo <200');
   readln(n);
   while (c<>'2') and (c<>'1') do
      begin
         Writeln('Esli vu hotite random - 1');
         writeln('Esli vu hotite vvodit - 2');
         readln(c);
         case c of
            '2' :  for i:=1 to n do
                Begin
                   Write(' A[',i,']=');
                   readln(a[i]);
                end;
            '1' :  for i:=1 to n do
                a[i]:=100-random(200);
            else writeln('nevernii zivra');
         end;
     end;
     for i:=1 to n do
         write(a[i]:5);
     writeln;
     t:=true;
     j:=n-1;
     while t do
        Begin
           k:=1;
           t:=false;
           for i:=1 to j do
           Begin
              p:=i-1+k;
              k:=1;
              while (p+k<=n) and (a[p+k]<=0) do k:=succ(k);
              if (p+k<=n) and (a[p]>a[p+k]) then
                 begin
                    b:=a[p];
                    a[p]:=a[p+k];
                    a[p+k]:=b;
                    t:=true;
                 end;
           end;
           j:=j-1;
        end;
        for i:=1 to n do
          write(a[i]:5);
    readln;
end.
