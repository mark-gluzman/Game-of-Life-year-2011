unit modul;
interface
   type st=array[1..4] of string;

   function menu (x1,y1,x2,y2,r:byte; s:st):byte;
   procedure knopka(s1:string; x1,y1,x2,y2:byte; t:boolean);
   procedure reg;

implementation

uses graph, crt;


procedure knopka(s1:string; x1,y1,x2,y2:byte; t:boolean);
 begin
  if t then
  begin
    setcolor(6);
   end else
    begin
     setcolor(3);
    end;
  bar(x1,y1,x2,y2);
  moveto(x1,trunc((y1+y2)/2));
  outtext(s1);
  end;

 procedure reg;
      var
      k,l,h:integer;
     begin
      detectgraph(k,l);
      initgraph(k,l,' ');
      h:=graphresult;
      if h<>0 then write('error graph',h,' ');
      setbkcolor(2);
     end;

function menu (x1,y1,x2,y2,r:byte; s:st):byte;
var i:integer;
x,z:integer;
ch:char;
begin
  knopka(s[1],x1,y1,x2,y2,true);
  for i:=2 to 4 do
    knopka(s[i],x2+(i-1)*r+(i-2)*(x2-x1),y1,x2+(i-1)*(r+x2-x1),y2,false);
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
        z:=z mod 4;
        if z=0 then z:=4;
        knopka(s[z],x2+(z-1)*r+(z-2)*(x2-x1),y1,x2+(z-1)*(r+x2-x1),y2,true);
        knopka(s[x],x2+(x-1)*r+(x-2)*(x2-x1),y1,x2+(x-1)*(r+x2-x1),y2,false);
        x:=z;
      end;
    until (ch=#13);
   menu:=x;
 end;

end.