uses crt, graph;
type
 rez=object
   x,y:word;
   cf,ci:byte;
   constructor init(x1,y1:word; cf1,ci1:byte);
 end;
 constructor rez.init;
  begin
   x:=x1;
   y:=y1;
   cf:=cf1;
   ci:=ci1;
  end;
type
 knop=object(rez)
  sx,sy:byte;
  name:string;
  vid:boolean;
  constructor init (x1,y1:word; cf1,ci1:byte; sx1,sy1:byte;name1:string;vid1:boolean);
  procedure out(t:boolean);

 end;
 constructor knop.init;
  begin
   inherited init (x1,y1,cf1,ci1);
   sx:=sx1;
   sy:=sy1;
   name:=name1;
   vid:=vid1;
  end;

 procedure knop.out;
  begin
   setbkcolor(cf);
   if vid then
    begin
     setfillstyle(3,1);

     bar(x-4,y-4,x+sx+3,y+sy+3);
     setfillstyle(3,0);

     bar(x-1,y-1,x+sx,y+sy);


    end;
    if t then
    setcolor(6)
       else
    setcolor(ci);
   moveto(x,y);
   outtext(name);
  end;


     procedure reg;
      var
      k,l,h:integer;
     begin
      detectgraph(k,l);
      initgraph(k,l,' ');
      h:=graphresult;
      if h<>0 then write('error graph',h,' ');
      textcolor(blue);
     end;



 var
 k1,k2:knop;
 x1,y1:word;
 cf1,ci1:byte;
 sx1,sy1:byte;
 name1:string;
 vid1,t:boolean;
 ch:char;
 x,z:integer;

 begin
  clrscr;
  writeln('Vvedite cvet fona');
  readln(cf1);
  writeln('Vvedite cvet nadpici');
  readln(ci1);

  writeln('Vvedite koordinati 1-i knopki');
  readln(x1,y1);
  writeln('Rozmeri');
  readln(sx1,sy1);
  Writeln('Nadpis');
  readln(name1);
  Writeln('Ramka Y/N');
  readln(ch);
  if upcase(ch)='Y' then vid1:=true else vid1:=false;
  k1.init(x1,y1,cf1,ci1,sx1,sy1,name1,vid1);

  writeln('Vvedite koordinati 2-i knopki');
  readln(x1,y1);
  writeln('Rozmeri');
  readln(sx1,sy1);
  Writeln('Nadpis');
  readln(name1);
  Writeln('Ramka Y/N');
  readln(ch);
  if upcase(ch)='Y' then vid1:=true else vid1:=false;
  k2.init(x1,y1,cf1,ci1,sx1,sy1,name1,vid1);

   reg;
  k1.out(true);
  k2.out(false);

    x:=1; z:=1;
    repeat
     ch := ReadKey;
     if ch = char(0) then
     begin
        ch := ReadKey;
        if ch=#75 then z:=x-1;
        if ch=#77 then z:=x+1;
     end;
     if z<>x then
      begin
        z:=z mod 2;
        if z=0 then z:=2;
        if z=1 then t:=true else t:=false;
        k1.out(not t);
        k2.out(t);
        x:=z;
      end;
    until (ch=#13);
    closegraph;
   writeln(x);
   readln;
 end.
