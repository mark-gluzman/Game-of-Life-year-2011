uses crt;
type
koor=record
  x,y:byte;
end;

ft=file of koor;

var
 f:ft;
 s:string;
 k:koor;
begin
 clrscr;
 writeln('Vvedite name');
 readln(s);
 assign(f,s);
 rewrite(f);
 readln(k.x,k.y);
 repeat
   write(f,k);
   readln(k.x,k.y);
 until (k.x=0) or (k.y=0);
 close (f);
 end.
