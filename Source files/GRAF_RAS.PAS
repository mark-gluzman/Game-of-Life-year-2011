program labaph23;
uses crt;
var
 M: Array[1..18] of real;
 G: Array[1..18] of real;
 gs,gs2,ms,ms2,Dx,Dy,k,b,qk,qb,gms:real;
 i:integer;
begin
 clrscr;
 writeln('Rivniannia type y=kx+b');
 ms:=0;ms2:=0;  gs:=0;gs2:=0;gms:=0;
 for i:=1 to 18 do
 begin
 write('m[',i,']=');
 readln(m[i]);
 write('g[',i,']=');
 readln(g[i]);
 end;
 ms:=0; ms2:=0;  gs:=0; gs2:=0; gms:=0;
 for i:=1 to 18 do
 begin
 ms:=ms+m[i];
 ms2:=ms2+sqr(m[i]);
 gs:=gs+g[i];
 gs2:=gs2+sqr(g[i]);
 gms:=gms+m[i]*g[i];
 end;
 ms:=ms/18;
 ms2:=ms2/18;
 gs:=gs/18;
 gs2:=gs2/18;
 gms:=gms/18;
 Dx:=ms2-sqr(ms);
 Dy:=gs2-sqr(gs);
 k:=(gms-gs*ms)/Dx;
 b:=gs-k*ms;
 qk:=(sqrt((Dy/dx)-sqr(k)))/sqrt(18);
 qb:=qk*sqrt(dx);
  writeln('gs=',gs:4:18);
  writeln('gs2=',gs2:4:18);
  writeln('ms=',ms:4:18);
  writeln('ms2=',ms2:4:18);
  writeln('gms=',gms:4:18);
 writeln('Dx=',Dx:4:18);
  writeln('Dy=',Dy:4:18);
  writeln('k=',k:4:18);
  writeln('b=',b:4:18);
  writeln('qk=',qk:4:18);
  writeln('qb=',qb:4:18);
  readln;
end.










