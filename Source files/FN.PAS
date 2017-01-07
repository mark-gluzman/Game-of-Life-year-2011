uses crt;
type
s20=string[20];
var
f:file of s20;
s:s20;
begin
 clrscr;
 assign(f,'figname');
 rewrite(f);
 repeat
  readln(s);
  if s<>'' then begin
  seek(f,filesize(f));
  write(f,s);        end;
 until s='';
 close(f);
end.