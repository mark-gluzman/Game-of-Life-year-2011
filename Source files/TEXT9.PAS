uses crt;

procedure p (var f1:text; s,name:string);
 var
 t:text;
 s1:string;
 b,l:word;
 begin
  reset(f1);
  assign(t,'qqq.pas');
  rewrite(t);
  l:=length(s);
  while not eof(f1) do
     begin
        readln(f1,s1);
        repeat
           b:=pos(s,s1);
           if (b<>0) and ((b=1) or (s1[b-1]=' ')) and ((s1[b+l]=' ') or (b+l-1=ord(s1[0]))) then
              delete(s1,b,l) else
              if b<>0 then
                begin
                  write(t,copy(s1,1,b+l));
                  delete(s1,1,b+l);
                end;
        until b=0;
        writeln(t,s1);
     end;
  close(f1);
  close(t);
  erase(f1);
  rename(t,name);
 end;


VAR
 f1:text;
 name1,s,s1:string;
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
  writeln('Vvedite slovo');
  readln(s1);
  p(f1,s1,name1);
END.
