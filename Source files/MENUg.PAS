unit menu;
interface
uses crt;
type men=array[1..5] of string[20];
     menras=array[1..5] of string[40];
const
      menu1:men=('new game','help','about','exit','');
       menu3:men=('worm','arctangle','circle','','');
       menu4:men=('100 dollars','150 dollars','200 dollars','250 dollars','back');
       menu2:men=('To the game','player "cyan"','player "magenta"','player "white"','back');
       menbet:menras=('player "cyan" choose the bet ','player "magenta" choose the bet: ',
       'player "white" choose the bat: ','','');
       cannot:string='you can"not choose this bet';
       ym:string='your money  ';
procedure ramka(x,y,m,n,colt,colf:byte);
procedure form_menu(menu:men; x,y,n,colt,colf:byte);
function move_MEN(menu:men; x,y,n,colt,colf:byte):byte;
 implementation
  procedure ramka(x,y,m,n,colt,colf:byte);
  var i:byte;
  begin
  window(x,y,x+m-1,y+n-1);
  textcolor(colt);
  textbackground(colf);
  clrscr;
  gotoxy(1,n);
  write(#200);
  for i:=1 to m-2 do
   write(#205);
  write(#188);
  gotoxy(1,1); insline;
  write(#201);
  for i:=1 to m-2 do
   write(#205);
  write(#187);
  for i:=2 to n-1 do begin;
    gotoxy(1,i);
    write(#186);
    gotoxy(m,i);
    write(#186);
  end;
  gotoxy(2,2);
end;
procedure form_menu(menu:men; x,y,n,colt,colf:byte);
   var i:byte;
 begin
  ramka(x,y,sizeof(menu[1]),n+2,colt,colf);
  gotoxy(2,2);
  highvideo;
  write(menu[1]);
  lowvideo;
  for i:=2 to n do begin
   gotoxy(2,i+1);
   write(menu[i]);
  end;
  gotoxy(2,2);
end;
function move_men(menu:men; x,y,n,colt,colf:byte):byte;
   var i:byte; c:char;
 begin
   form_menu(menu,x,y,n,colt,colf);
   i:=1;
   repeat
    c:=readkey;
    case c of
    #72:
      begin
        lowvideo;
        write(menu[i]);
        if i=1 then i:=n else i:=i-1;
        gotoxy(2,i+1);
        highvideo;
        write(menu[i]);
        gotoxy(2,i+1);
      end;
    #80:
      begin
        lowvideo;
        write(menu[i]);
        if i=n then i:=1 else i:=i+1;
        gotoxy(2,i+1);
        highvideo;
        write(menu[i]);
        gotoxy(2,i+1);
      end;
    end;
   until(c=#13) or (c=#27);
   if c=#13 then
   move_men:=i
    else
   move_men:=0;
  end;
  end.
