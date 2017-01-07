uses crt;
type matr=array[1..200,1..4] of real;
var
a:matr;
n,i,j:byte;
s:real;
c:boolean;
procedure peresechenie (const a:matr;i,j:byte; var c:boolean);
   begin
         if (abs(a[i,1]-a[j,1])+abs(a[i,3]-a[j,3])<abs(a[i,1]-a[i,3])+abs(a[j,1]-a[j,3]))  and
          (abs(a[i,2]-a[j,2])+abs(a[i,4]-a[j,4])<abs(a[i,2]-a[i,4])+abs(a[j,2]-a[j,4])) then
         c:=true;
   end;
procedure summa (const a:matr; i,j:byte; var s:real);
   var x,y:real; w,q,z:byte; b:array[1..4,1..2] of real;
     begin
       b[1,1]:=a[i,1]; b[1,2]:=a[i,2]; b[2,1]:=a[i,3]; b[2,2]:=a[i,4];
       b[3,1]:=a[j,1]; b[3,2]:=a[j,2]; b[4,1]:=a[j,3]; b[4,2]:=a[j,4];
       for z:=1 to 2 do
         for q:=3 downto 1 do
            for w:=1 to q do
               if  b[w,z]>b[w+1,z] then
                  begin
                     x:=b[w,z];
                     b[w,z]:=b[w+1,z];
                     b[w+1,z]:=x;
                  end;
       x:=abs(b[2,1]-b[3,1]);
       y:=abs(b[2,2]-b[3,2]);
       writeln(x*y:0:2);
       s:=s+x*y;
   end;
begin
   clrscr;
   writeln('Vvedite kol-vo pram-kov 1<n<200');
   readln(n);
   for i:=1 to n do
      begin
         writeln('Vvedite koordinati levou nigneu vershini  ',i,'-go pram-ka');
         read(a[i,1],a[i,2]);
         writeln('Vvedite koordinati pravoi verhneu vershini  ',i,'-go pram-ka');
         read(a[i,3],a[i,4]);
      end;
   s:=0;
   for i:=1 to n do
      for j:=i+1 to n do
         begin
            c:=false;
            peresechenie(a,i,j,c);
            if c then
               begin
                  writeln('peresecautsa  ',i,'-u i ',j,'-u pram-ki');
                  summa(a,i,j,s);
               end;
         end;
   if s=0 then writeln('Pram-ki ne peresecautsa') else
            writeln ('Symma obshcih ploshch=',s:0:2);
   readln;
   readln;
end.



