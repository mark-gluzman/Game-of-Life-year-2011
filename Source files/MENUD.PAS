unit menud;
interface

   const V2=2;
         V3=3;
         V4=4;
         V5=5;
   type st2=array[1..V2] of string;
   type st3=array[1..V3] of string;
   type st4=array[1..V4] of string;
   type st5=array[1..V5] of string;
   function menu2 (x1,y1,x2,y2,r:word; s:st2):byte;

implementation

uses graph, crt;


procedure knopka(s1:string; x1,y1,x2,y2:word; t:boolean);
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


function menu2 (x1,y1,x2,y2,r:word; s:st2):byte;
var i:integer;
x,z:integer;
ch:char;
begin
  knopka(s[1],x1,y1,x2,y2,true);
  for i:=2 to V2 do
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
        z:=z mod V2;
        if z=0 then z:=V2;
        knopka(s[z],x2+(z-1)*r+(z-2)*(x2-x1),y1,x2+(z-1)*(r+x2-x1),y2,true);
        knopka(s[x],x2+(x-1)*r+(x-2)*(x2-x1),y1,x2+(x-1)*(r+x2-x1),y2,false);
        x:=z;
      end;
    until (ch=#13);
   menu2:=x;
 end;

end.