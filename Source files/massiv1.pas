program massiv;
uses crt;
type matr=array[1..20,1..20] of byte;
var
a:matr;
n,i,m,jm,q,j,k,min,w,e:byte;
begin
   clrscr;
   writeln ('Vvedite chislo <20');
   readln(m);
   readln(n);
       for i:=1 to n do
          for j:=1 to m do
             readln(a[i,j]);

   for w:=1 to m do
   begin
   for k:=1 to m do
     Begin
      if k mod 2=1 then
         for i:=1 to n do
         Begin
         min:=a[i,k];
         jm:=i;
            for j:=i+1 to n do
                if a[j,k]<min then
                    Begin
                       min:=a[j,k];
                       jm:=j;
                    end;
                a[jm,k]:=a[i,k];
                a[i,k]:=min;

                 if (k>2) and  (a[k,1]<a[k-1,1])  then
                 begin
            e:=a[k-1,1];
            a[k-1,1]:=a[k,1];
            a[k,1]:=e;
            end

         end;
       if k mod 2=0 then
         for i:=1 to n do
         Begin
                  min:=a[i,k];
         jm:=i;
            for j:=i+1 to n do
                if a[j,k]>min then
                    Begin
                       min:=a[j,k];
                       jm:=j;
                    end;
                a[jm,k]:=a[i,k];
                a[i,k]:=min;
            if a[k,n]<a[k-1,n] then begin
            e:=a[k-1,n];
            a[k-1,n]:=a[k,n];
            a[k,n]:=e;
            end;
            end;




         end;
      end;




    for k:=1 to n do
      begin
         for i:=1 to m do
            write(a[k,i]:5);
            writeln;
      end;

   readln;
end.
