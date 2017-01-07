program zodiac;
uses crt;
var
c:char;
a:real;
ch,m,z:integer;
begin
   repeat
      begin
         clrscr;
         writeln('Vvedite daty ("ch.mec")');
         readln(a);
         ch:=trunc(a);
         a:=100*a;
         m:=trunc(a) mod 100;
         z:=m*100+ch;
         case z of
            0..119 : writeln('Kozeroc');
            120..218 : writeln('Vodolei');
            219..320 : writeln('Rubi');
            321..419 : writeln('Oven');
            420..520 : writeln('Telec');
            521..621 : writeln('Blizneci');
            622..722 : writeln('Rac');
            723..822 : writeln('Lev');
            823..922 : writeln('Deva');
            923..1022 : writeln('Vesi');
            1023..1122 : writeln('Scorpion');
            1123..1221 : writeln('Strilec');
            1222..1231 : writeln('Kozeroc');
	    else writeln('Datu ne syschestvyet');
         end;
         writeln('repeat Y/N?');
         readln(c);
      end;
   until upcase(c)='N';
end.
