unit mouse;
interface
uses dos;

function reset_mouse( var button:byte):boolean;
procedure hide_mouse;
procedure show_mouse;
procedure mouse_gotoxy(x,y:word);
procedure get_mouse_status(var button:byte;var x,y:word);

implementation
var regs:registers;
function reset_mouse( var button:byte):boolean;
 begin
   regs.ax:=$00;
   intr($33,regs);
   button:=regs.bx;
   reset_mouse:=odd(regs.ax);
 end;

procedure hide_mouse;
begin
  regs.ax:=$02;
  intr($33,regs);
end;

procedure show_mouse;
begin
  regs.ax:=$01;
  intr($33,regs);
end;

procedure get_mouse_status(var button:byte;var x,y:word);
begin
  regs.ax:=$03;
  intr($33,regs);
  x:=regs.cx;
  y:=regs.dx;
  button:=regs.bl;
end;

procedure mouse_gotoxy(x,y:word);
begin
  with regs do begin
     ax:=$04;
     cx:=x;
     dx:=y;
     end;
  intr($33,regs);
end;

end.


