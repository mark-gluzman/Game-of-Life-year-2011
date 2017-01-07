program pros_del;
uses crt;
var
i,n,a,b:integer;
begin
   clrscr;
   i:=2;
   a:=2;
   writeln('vvedite natyralnoe chislo');
   read(n);
   if n<=1 then
        writeln('nevernoe chislo') else
        begin
           write(n,'=');
           b:=n;
           while b mod 2=0 do
              Begin
              if b<>2 then
                write('2*') else
                write('2');
              b:=trunc(b/2);
              end;
           while n>=a do
           begin
              while (a mod i<>0) and (i<trunc(a/2)) do
                i:=succ(i);
              if a mod i=0 then
                begin
                  a:=succ(a);
                  i:=2;
                end else
                begin
                  while b mod a=0 do
                    Begin
                      if b<>a then
                        write(a,'*') else
                        write(a);
                      b:=trunc(b/a);
                    end;
                  a:=succ(a);
                  i:=2;
                end;
          end;
        end;
   readln;
   readln;
end.
