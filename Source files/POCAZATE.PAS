uses crt;

TYPE
 pok=^real;
 ft=text;
 ar=array[1..100] of pok;
VAR
 a:ar;
 n,i:byte;
 f:ft;

 procedure vvod (n:byte; var a:ar);
  var
    i,k:byte;
  begin
    randomize;
    new(a[1]);
    write('chislo=');
    readln(a[1]^);
    for i:=2 to n do
      begin
        if random(2)=0 then
        begin
          new(a[i]);
          write('chislo=');
          readln(a[i]^);
        end else
          a[i]:=a[random(i-1)+1];
        end;
    for i:=n+1 to 100 do
    a[i]:=nil;
  end;

 function log (n:byte; a:ar):boolean;
  var
    i,j:byte;
    b:boolean;
  begin
   b:=false;
   j:=0;
   repeat
    j:=j+1;
    i:=j;
    while (b=false) and (i<>n) do
      begin
       i:=i+1;
       if a[i]^=a[j]^ then b:=true;
      end;
   until b or (j=n);
    log:=b;
  end;

BEGIN
 assign(f,'ddd.txt');
 rewrite(f);
 clrscr;
 writeln('Vvedite kol-vo elem. massiva');
 readln(n);
 vvod(n,a);
 for i:=1 to n do
  writeln(f,'a[i]=',seg(a[i]^),':',ofs(a[i]^),a[i]^:6:1);
 writeln(f,log(n,a));
 readln;
 close(f);
END.













