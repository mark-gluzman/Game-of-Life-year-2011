uses crt;

type
 koord=record
  x,y:byte;
 end;

var
  f_name:string;
  ft:file of koord;
  k:koord;

begin
  clrscr;
  write('name of file-'); readln(f_name);
  assign(ft,f_name);
  rewrite(ft);
  writeln('vvedite koordinati');
  readln(k.x,k.y);
  repeat
    write(ft,k);
    readln(k.x,k.y);
  until (k.x*k.y=0);
  close(ft);
end.
