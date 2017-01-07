uses crt;
type vec=array [1..200] of integer;

procedure p (var f1,f2,f3:text);
 var
 t:text;
 i,j,b,n:integer;
 a:vec;
 begin
  reset(f1);
  reset(f2);
  rewrite(f3);
  n:=0;

  while not eof(f1) do
   begin
   while not eoln(f1) do
     begin
        read(f1,b);
        n:=n+1;
        a[n]:=b;
     end;
   readln(f1);
   end;



  while not eof(f2) do
  begin
  while not eoln(f2) do
     begin
        read(f2,b);
        n:=n+1;
        a[n]:=b;
     end;
  readln(f2);
  end;


  for j:=n-1 downto 1 do
   for i:=1 to j do
      if a[i]>a[i+1] then
         begin
           b:=a[i];
           a[i]:=a[i+1];
           a[i+1]:=b;
         end;
  for i:=1 to n do
     write(f3,a[i],' ');
  close(f1);
  close(f2);
  CLOSE(F3);
 end;

VAR
 f1,f2,f3:text;
 name1,s:string;
 ERR:BYTE;

BEGIN
  clrscr;
  write('file 1 name '); readln(name1);
  assign(f1,name1);
  {$i-}
  reset(f1);
  err:=ioresult;{$i+}
  if err<>0 then
    begin
      rewrite(f1);
      repeat
        write('st-');
        readln(s);
        if s<>'' then writeln(f1,s);
        until s='';
        close(f1);
    end;

  write('file 2 name '); readln(name1);
  assign(f2,name1);
   {$i-}
  reset(f2);
  err:=ioresult;{$i+}
  if err<>0 then
    begin
rewrite(f2);
      repeat
        write('st-');
        readln(s);
        if s<>'' then writeln(f2,s);
        until s='';
        close(f2);
    end;
  write('file 3 name '); readln(name1);
  assign(f3,name1);
  p(f1,f2,f3);
END.
