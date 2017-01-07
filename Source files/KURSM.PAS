program kurs;
uses graph,crt,menu;
type headar=array[1..16,1..16] of byte;
     pex1=array[1..4] of pointer;
     pex2=array[1..4] of pointer;
     ars=array[1..3] of longint;
     re=record
      head:headar;
     end;
     headi=array[1..3] of re;
     par=record
       cherv:boolean;
       kvad:boolean;
       krug:boolean;
     end;
     arra=array[1..10] of byte;
const head1: headar=
((6 ,1 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,1 ,6 ),
  (6 ,1 ,1 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,1 ,1 ,6 ),
  (6 ,1 ,12,1 ,6 ,6 ,1 ,1 ,1 ,1 ,6 ,6 ,1 ,12,1 ,6 ),
  (6 ,1 ,12,12,1 ,1 ,1 ,1 ,1 ,1 ,1 ,1 ,12,12,1 ,6 ),
  (6 ,1 ,1 ,1 ,0 ,0 ,1 ,1 ,1 ,1 ,0 ,0 ,1 ,1 ,1 ,6 ),
  (6 ,6 ,1 ,1 ,0 ,0 ,1 ,1 ,1 ,1 ,0 ,0 ,1 ,1 ,6 ,6 ),
  (6 ,14,1 ,1 ,1 ,1 ,1 ,1 ,1 ,1 ,1 ,1 ,1 ,1 ,14,6 ),
  (6 ,1 ,14,1 ,1 ,1 ,1 ,1 ,1 ,1 ,1 ,1 ,1 ,14,1 ,6 ),
  (6 ,1 ,1 ,14,1 ,1 ,1 ,1 ,1 ,1 ,1 ,1 ,14,1 ,1 ,6 ),
  (6 ,1 ,1 ,1 ,14,1 ,1 ,14,14,1 ,1 ,14,1 ,1 ,1 ,6 ),
  (6 ,14,1 ,1 ,1 ,14,14,1 ,1 ,14,14,1 ,1 ,1 ,1 ,6 ),
  (6 ,6 ,14,1 ,1 ,14,1 ,1 ,1 ,1 ,14,1 ,1 ,1 ,6 ,6 ),
  (6 ,6 ,6 ,14,14,0 ,1 ,1 ,1 ,1 ,0 ,14,14,6 ,6 ,6 ),
  (6 ,6, 6 ,6 ,14,14,0 ,0 ,0 ,0 ,14,14,6 ,6 ,6 ,6 ),
  (6 ,6 ,6 ,6 ,6 ,14,1 ,1 ,1 ,1 ,14,6 ,6 ,6 ,6 ,6 ),
  (6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ,6 ));


    var d,m{,r1,r2,x,y,x1,y1,x2,y2,size,s1,s2},c,i,lk:integer;
t,n:real; p:pex1; zm:par; ch:char; hd:headi;stavka,money:ars; var l:ars;
procedure make_arhead(var hd:headi;const head1:headar);
var i,j,k,c:byte;
begin
 c:=3;
  for k:=1 to 3 do begin
   with hd[k] do
    for i:=1 to 16 do
     for j:=1 to 16 do begin
      head[i,j]:=head1[i,j];
      if head[i,j]=1 then head[i,j]:=c;
     end;
     c:=c+2;
  end;
    end;


procedure maketrek (const r1,r2:real);
  var t:real; x,y:integer;
  begin
  t:=0;
   while t<=2*pi do begin
    x:=round(320+ r2*cos(t));
    y:=round(240+r1*sin(t));
    putpixel(x,y,white);
    t:=t+0.01;
  end;

end;
procedure create_head(var p:pex1; const hd:headi;i:integer);

  var x1,y1,x2,y2,size,s,l,k:integer;
  begin

  x1:=(getmaxx-16) div 2;
  y1:=(getmaxy-16) div 2;
  x2:=x1+16;
  y2:=y1+16;
  for l:=1 to 16 do
  for k:=1  to 16 do
  putpixel(x1+l,y1+k, hd[i].head[k,l]);
  Size:=imagesize(x1-1,y1-1,x2+1,y2+1);
   getmem(p[i],size);
    getimage(x1-1,y1-1,x2+1,y2+1,p[i]^);
   putimage(x1,y1,p[i]^,xorPut);
   setfillstyle(0,3);
   bar(x1-2,y1-2,x2+2,y2+2);
  end;


procedure move(var p:pex1;var money:ars;var stavka:ars;const l:ars; const r1,r2:real);
      type  coord=array[1..3] of integer;
            ar=array[1..3] of real;
        const w:ar=(1,0.94,0.90);
          var i:integer;  x,y: coord; t,f,n,k:ar;  rad1,rad2:real;
      begin
       t[1]:=0.07;  t[2]:=0.50; t[3]:=0.84;
       rad1:=r1+20; rad2:=r2+20;
       for i:=1 to 3 do begin
      f[i]:=w[i]*t[i];
      x[i]:=round(312+(rad2)*cos(f[i]));
      y[i]:=round(232+(rad1)*sin(f[i]));
      putimage(x[i],y[i],p[i]^,1);
      rad1:=rad1+40; rad2:=rad2+40;
      end;
      setcolor(blue);
      outtextxy((getmaxx-200) div 2 ,getmaxy div 2,'press ENTER  to start');
      repeat
      ch:=readkey;
      until ch=#13;
      setcolor(6);
      outtextxy((getmaxx-200) div 2 ,getmaxy div 2,'press ENTER  to start');
      rad1:=r1+20; rad2:=r2+20;
       for i:=1 to 3 do begin
      f[i]:=w[i]*t[i];
      x[i]:=round(312+(rad2)*cos(f[i]));
      y[i]:=round(232+(rad1)*sin(f[i]));
      putimage(x[i],y[i],p[i]^,1);
      rad1:=rad1+40; rad2:=rad2+40;
      end;

     rad1:=r1+20; rad2:=r2+20;
     repeat
     for i:=1 to 3 do begin
      f[i]:=w[i]*t[i];
      x[i]:=round(312+(rad2)*cos(f[i]));
      y[i]:=round(232+(rad1)*sin(f[i]));
      rad1:=rad1+40;
      rad2:=rad2+40;
     end;
     rad1:=r1+20; rad2:=r2+20;
     for i:=1 to 3 do
      putimage(x[i],y[i],p[i]^,1);
     delay(10);
     for i:=1 to 3 do begin
     putimage(x[i],y[i],p[i]^,1);
     end;
     for i:=1 to 3 do begin
      t[i]:=t[i]+0.01;
      N[i]:=random(150)/10000;
      t[i]:=t[i]+(0.005-n[i]);
     end;

     if (f[1]>2*pi-0.01) and (f[1]<2*pi+0.01) and (f[2]<2*pi) and (f[3]<2*pi)  then
     begin
     setcolor(1);
     outtextxy(1,1,'the player "cyan" is first');
     money[1]:=money[1]+stavka[1];
     money[2]:= money[2]-stavka[2];
     money[3]:=money[3]-stavka[3];
     outtextxy(1,20,'he has won his bet');
     if stavka[1]=0 then outtextxy(1,35,'0 dollars') else
     outtextxy(1,35,menu4[l[1]]);
        end;

     if (f[2]>2*pi-0.01) and (f[2]<2*pi+0.01) and (f[1]<2*pi) and (f[3]<2*pi) then
      begin
       setcolor(1);
       outtextxy(1,1,'the player "magenta" is first');
       money[1]:=money[1]-stavka[1];
       money[2]:= money[2]+stavka[2];
       money[3]:=money[3]-stavka[3];
       outtextxy(1,20,'he has won his bet');
       if stavka[2]=0 then outtextxy(1,35,'0 dollars') else
       outtextxy(1,35,menu4[l[2]]);
      end;

     if (f[3]>2*pi-0.01) and (f[3]<2*pi+0.01) and (f[1]<2*pi) and (f[2]<2*pi) then
      begin
        setcolor(1);
        outtextxy(1,1,'the player "white"  is first');
        money[1]:=money[1]-stavka[1];
        money[2]:= money[2]-stavka[2];
        money[3]:=money[3]+stavka[3];
        outtextxy(1,20,'he has won his bet');
        if stavka[3]=0 then outtextxy(1,35,'0 dollars') else
        outtextxy(1,35,menu4[l[3]]);
      end;

    until ((f[1]>2*pi-0.01) and (f[1]<2*pi+0.01)) or ((f[2]>2*pi-0.01) and (f[2]<2*pi+0.01)) or
     ((f[3]>2*pi-0.01) and (f[3]<2*pi+0.01));
     for i:=1 to 3 do
    putimage(x[i],y[i],p[i]^,1);
       outtextxy((getmaxx-200) div 2 ,getmaxy div 2,'press ENTER to go to menu');
  end;
procedure makeplayground;
var d,m:integer;s1,s2,r1,r2,t:real;
   begin
   d:=detect; m:=detect;
   InitGraph(d,m,'');
   t:=0; R1:=100; R2:=150;
   s1:=r1;
   s2:=r2;
   setbkcolor(6);
   for i:=1 to 4 do begin
   maketrek (s1,s2);
   s1:=s1+40;
   s2:=s2+40;
   end;
   setcolor(white);
   setlinestyle(0,0,3);
   line(round(320+ r2*cos(0)),round(240+r1*sin(0)),round(320+270),round(240+r1*sin(0)));
   line( round(320+ (r2+40)*cos(0.39)),round(240+(r1+40)*sin(0.39)),round(320+ (r2+80)*cos(0.41)),
   round(240+(r1+80)*sin(0.41)));
   line( round(320+ (r2+80)*cos(0.69)),round(240+(r1+80)*sin(0.69)),round(320+ (r2+120)*cos(0.70)),
   round(240+(r1+120)*sin(0.70)));
 end;
 procedure money_guard(var l:ars;var stavka:ars;const money:ars;const x,ck:byte;const ik,bet:longint;
 const cannot:string; const menu4:men);
 var k:byte;
   begin
      if money[ik]<bet    then
                begin
                  textcolor(yellow);
                  gotoxy(x,3);
                  write(cannot);
                  For k:=1 to 14 do
                  delay(9000);
                 textcolor(blue);
                  gotoxy(x,3);
                 write(cannot);
                 end
                 else  begin
                  textcolor(white);
                  l[ik]:=ck;
                  stavka[ik]:=bet; gotoxy(x+40,1);  write(stavka[ik]);
                 end;
    end;
 procedure case_men(var l:ars; var money:ars; var stavka:ars);
 type menras=array[1..5] of string[40];
      {ars=array[1..3] of longint;}
  var x,y,n,x1,ck:byte;  r1,r2:real; ik,bet:longint; ch,ch1:char; {stavka,money:ars; var l:ars;}
  j:arra;
    {ch:array[1..10] of char;}
  sizex, sizey,maxx,maxy,colt,colf,c:longint;  s:string; back:array[1..4] of boolean;
  const st:string='Players, place your bets';
       betf=250;
       {menu1:men=('new game','help','about','exit','');
       menu3:men=('worm','arctangle','circle','','');
       menu4:men=('100 dollars','150 dollars','200 dollars','250 dollars','back');
       menu2:men=('To the game','player "cyan"','player "magenta"','player "white"','back');
       menbet:menras=('player [cyan] choose the bet ','player "magenta" choose the bet: ',
       'player "white" choose the bat: ','','');
       cannot:string='you can"not choose this bet';
       ym:string='your money ';  }
   begin
   r1:=100;
   r2:=150;
    {for lk:=1 to 3 do begin
        money[lk]:=101;
     stavka[lk]:=0;
      l[lk]:=0;
        end;}
    maxx:=lo(windmax)+1;
    maxy:=hi(windmax)+1;
    window(1,1, maxx,maxy);
    textbackground(blue);
    repeat
      textbackground(blue);
      clrscr;
      window(1,1, maxx,maxy);
      textbackground(blue);
      n:=4;
      x:=(maxx-sizeof(menu1[1])+2) div 2;
      y:=(maxy-(n+2)) div 2;
      colf:=blue; colt:=white;
      j[1]:=move_men(menu1,x,y,n,colt,colf);
      window(1,1,maxx,maxy);
      textbackground(blue);
      clrscr;
   case j[1] of
    1: begin
       repeat
       for c:=1 to 4 do
       back[c]:=false;
         textbackground(blue);
         clrscr;
        n:=5;
        x:=(maxx-sizeof(menu2[3])+2) div 2;
        y:=(maxy-(n+2)) div 2;
        colt:=yellow;
        textcolor(colt);
        {x1:=(maxx-sizeof(st)) div 2;}
        gotoxy(x,1);
         write(st);
        colf:=blue; colt:=white;
        j[2]:=move_men(menu2,x,y,n,colt,colf);
        window(1,1,maxx,maxy);
        textbackground(blue);
        clrscr;
        case j[2] of
         1: begin
             makeplayground;
             make_arhead(hd,head1);
             for i:=1 to 3 do begin
             create_head(p,hd,i);
              end;
             {c:=0;
             create_kvad(p,c,i);}

             move(p,money,stavka,l,r1,r2);
             repeat
             ch:=readkey;
             until ch=#13;;
           closegraph;
          end;
         2: begin repeat
             n:=5; ik:=1;
             x:=(maxx-sizeof(menu4[3])+2) div 2;
             y:=(maxy-(n+2)) div 2;
             textcolor(yellow);
             gotoxy({(maxx-sizeof(menbet[1])) div 2}x,1);
             write(menbet[1]);
             gotoxy({(maxx-sizeof(ym)) div 2}x,2);
             write(ym);
             write(money[1]);
             colf:=blue; colt:=white;
             j[3]:=move_men(menu4,x,y,n,colt,colf);
             window(1,1,maxx,maxy);
             {textbackground(blue);
             clrscr;}
             case j[3] of
             1: begin
                 bet:=100;  ck:=1;
                    money_guard(l,stavka,money,x,ck,ik,bet,cannot,menu4);
                 end;
             2: begin
                bet:=150; {l:=2} ck:=2;
                   money_guard(l,stavka,money,x,ck,ik,bet,cannot,menu4);
                  end;

             3: begin
                 bet:=200; ck:=3;
                     money_guard(l,stavka,money,x,ck,ik,bet,cannot,menu4);
                 end;

             4: begin
                  bet:=250;  ck:=4;
                   money_guard(l,stavka,money,x,ck,ik,bet,cannot,menu4);
                 end;
             5:begin back[1]:=false; back[2]:=true; back[3]:=false; back[4]:=false;  end;
               end;
           UNTIL back[2]=true;
              {ch:=readkey;
           UNTIL ch=#27;}
           end;
           3: begin repeat
             n:=5; ik:=2;
             x:=(maxx-sizeof(menu2[3])+2) div 2;
             y:=(maxy-(n+2)) div 2;
             textcolor(yellow);
             gotoxy(x,1);
             write(menbet[2]);
             gotoxy(x,2);
             write(ym);
             write(money[2]);
             colf:=blue; colt:=white;
             j[4]:=move_men(menu4,x,y,n,colt,colf);
             window(1,1,maxx,maxy);
             {textbackground(blue);
             clrscr;}
             case j[4] of
              1: begin
                 bet:=100;  ck:=1;
                    money_guard(l,stavka,money,x,ck,ik,bet,cannot,menu4);
                 end;
               2: begin
                bet:=150; ck:=2;
                    money_guard(l,stavka,money,x,ck,ik,bet,cannot,menu4);
                end;
               3: begin
                 bet:=200;  ck:=3;
                  money_guard(l,stavka,money,x,ck,ik,bet,cannot,menu4);
                 end;
               4: begin
                  bet:=250; ck:=4;
                   money_guard(l,stavka,money,x,ck,ik,bet,cannot,menu4);
                 end;
              5:begin back[1]:=false; back[2]:=false; back[3]:=true; back[4]:=false;end;

             end;
           UNTIL back[3]=true;
             {if keypressed then ch:=readkey;
           UNTIL ch=#27; }
           end;
           4: begin
             repeat
             n:=5; ik:=3;
             x:=(maxx-sizeof(menu2[3])+2) div 2;
             y:=(maxy-(n+2)) div 2;
             textcolor(yellow);
             gotoxy(x,1);
             write(menbet[3]);
             gotoxy(x,2);
             write(ym);
             write(money[3]);
             colf:=blue; colt:=white;
             j[5]:=move_men(menu4,x,y,n,colt,colf);
             window(1,1,maxx,maxy);
             {textbackground(blue);
             clrscr;}
             case j[5] of
              1: begin
                 bet:=100;  ck:=1;
                    money_guard(l,stavka,money,x,ck,ik,bet,cannot,menu4);
                 end;
              2: begin
                bet:=150;  ck:=2;
                    money_guard(l,stavka,money,x,ck,ik,bet,cannot,menu4);
                end;
              3: begin
                 bet:=200; ck:=3;
                  money_guard(l,stavka,money,x,ck,ik,bet,cannot,menu4);
                 end;
              4: begin
                  bet:=250; ck:=4;
                   money_guard(l,stavka,money,x,ck,ik,bet,cannot,menu4);
                 end;
              5: begin back[1]:=false; back[2]:=false; back[4]:=true; back[3]:=false;
               end;
              end;
             UNTIL back[4]=true;
            end;
          5: back[1]:=true;
           end;
         {if keypressed then ch1:=readkey;}
        until back[1] ;
        for c:=1 to 4 do
         back[i]:=false;
          end;
      2:begin
       s:='look to the game and you will understand';
       sizex:=length(s)+10;
       sizey:=10;
       x:=(maxx-sizex) div 2;
       y:=(maxy-sizey) div 2;
       ramka(x,y,sizex,sizey,white,red);
       gotoxy((sizex-length(s)) div 2, sizey div 2);
       write(s);
        repeat
        ch:=readkey;
        until ch=#13;
        textbackground(blue);
        clrscr;
      end;
    3:begin
       s:='created by Greg from IASA';
       sizex:=length(s)+10;
       sizey:=10;
       x:=(maxx-sizex) div 2;
       y:=(maxy-sizey) div 2;
       ramka(x,y,sizex,sizey,white,red);
       gotoxy((sizex-length(s)) div 2,sizey div 2);
       write(s);
        repeat
        ch:=readkey
        until ch=#13;
        textbackground(blue);
        clrscr;
        end;
    4:Halt;
    end;
    if keypressed then ch:=readkey;
 UNTIL ch=#27;
end;
begin
for lk:=1 to 3 do begin
money[lk]:=300;
stavka[lk]:=0;
l[lk]:=0;
end;
textbackground(blue); clrscr;
 randomize;
 case_men(l,money,stavka);
 readln;
end.
