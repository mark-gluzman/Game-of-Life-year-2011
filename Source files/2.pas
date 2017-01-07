program drob;
uses crt;
var
n,r,i,c:integer;
begin
   clrscr;
   write('chislitel=');
   readln(r);
   write('znamenatel=');
   readln(n);
      	 i:=0;
	 while n+1<>i do
	    begin
	       r:=(10*r) mod n;
               i:=i+1;
            end;
         c:=r;
         r:=(10*r) mod n;
         write('period=');
         while r<>c do
            begin
               r:=(10*r) mod n;
               i:=(10*r) div n;
               write(i);
            end;
         r:=(10*r) mod n;
         i:=(10*r) div n;
         write(i);
   readln;
end.
