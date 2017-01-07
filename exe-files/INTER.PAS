unit inter;
 interface

     type
      soc=0..8;

      klet=record
         cos:soc;
         log:boolean;
      end;

      matr=array[1..60,1..60] of klet;

      tchk=record
       xt,yt:byte;
      end;

      tch=array[1..60,1..60] of boolean;

    function pole(n:byte):word;
    procedure reg;
    procedure grpol (n:byte);
    Procedure vvivodnaecran (n:byte; mat:matr; p,poc:integer; tc:tch);
    procedure tochka (x,y,n:byte; cv:word);
    procedure nachalo(var n:byte; var t:boolean; var q1,q2:byte; var q3:real);
    procedure kvad(n:byte; x,y:word; t:boolean);

 implementation

 uses graph,crt,menu,mouse ;

 function pole(n:byte):word;
   var x,xm:word;
    begin
     xm:=trunc(getmaxy*0.90);
     if (n=58) or (n=59) or (n=27) then
       xm:=trunc((getmaxx*0.69));
     x:=xm mod n;
      if x<trunc(n/2) then
       pole:=(xm div n)*n+10 else
       pole:=(xm div n)*n+10+n;
    end;

 procedure kvad(n:byte; x,y:word; t:boolean);


 procedure line1 (x,y:word; dn:byte);

   begin
    line(dn*(x-1)+10,dn*(y-1)+10,dn*(x-1)+10,dn*y+10);
    line(dn*(x-1)+10,dn*(y-1)+10,dn*x+10,dn*(y-1)+10);
    line(dn*x+10,dn*y+10,dn*(x-1)+10,dn*y+10);
    line(dn*x+10,dn*y+10,dn*x+10,dn*(y-1)+10);
   end;

  var
   pl:word;
   dn:byte;
  begin
    pl:=pole(n);
    dn:=trunc((pl-10)/n);
    if t then
     begin
       setcolor(blue);
       setlinestyle(0,3,0);
       line1(x,y,dn);
     end
          else
     begin
       setcolor(7);
       line1(x,y,dn);
       setcolor(red);
       setlinestyle(1,1,0);
       line(10,dn*(y-1)+10,pl,dn*(y-1)+10);
       line(dn*x+10,10,dn*x+10,pl);
       line(10,dn*y+10,pl,dn*y+10);
       line(dn*(x-1)+10,10,dn*(x-1)+10,pl);
       setlinestyle(0,1,1);
       line(10,10,10,pl);
       line(10,10,pl,10);
       line(10,pl,pl,pl);
       line(pl,10,pl,pl);
     end;

  end;

    procedure reg;
      var
      k,l,h:integer;
     begin
      detectgraph(k,l);
      initgraph(k,l,' ');
      h:=graphresult;
      if h<>0 then write('error graph',h,' ');
      setbkcolor(7);
      textcolor(blue);
      setcolor(blue);
     end;

    procedure grpol (n:byte);

     var
      pl,a,i:word;
      dn:word;
     begin
     setfillstyle(3,0);
     pl:=pole(n);
     bar(10,10,pl,pl);
     dn:=trunc((pl-10)/n);
     setcolor(4);
     setlinestyle(0,1,1);
     line(10,10,10,pl);
     line(10,10,pl,10);
     line(10,pl,pl,pl);
     line(pl,10,pl,pl);
     setlinestyle(1,1,2);
     a:=dn;
     while a<>pl-10 do
     begin
       line(10,10+a,pl,10+a);
       line(10+a,10,10+a,pl);
       a:=a+dn;
     end;

    end;

        procedure tochka (x,y,n:byte; cv:word);
        var
         x1,y1,dn:word;
        begin
          dn:=trunc((pole(n)-10)/n);
          x1:=(x-1)*dn+trunc(dn/2);
          y1:=(y-1)*dn+trunc(dn/2);
          setcolor(cv);
          setfillstyle(1,cv);
          if dn<>2*trunc(dn/2) then
           begin
            arc(x1+11,y1+11,270,0,trunc(dn/2)-1);
            arc(x1+10,y1+11,180,270,trunc(dn/2)-1);
            arc(x1+11,y1+10,0,90,trunc(dn/2)-1);
            arc(x1+10,y1+10,90,180,trunc(dn/2)-1);
            floodfill(x1+10,y1+10,cv);
           end else fillellipse(x1+10,y1+10,trunc(dn/2)-1,trunc(dn/2)-1);
        end;


 procedure rul;
 var
  ft:text;
  s:string;
  i:byte;
  o:word;
  begin
   assign(ft,'ruls.txt');
    {$I-}
    reset(ft);
    o:=ioresult;
    if o<>0 then
       begin
         setcolor(1);
         moveto(10,trunc(getmaxy/5)+i*10);
         outtext('file not found');
         readln;
       end  {$i+}
   else
  begin
   i:=0;
   setcolor(8);
   while not eof(ft) do
    begin
     moveto(10,trunc(getmaxy/5)+i*10);
     readln(ft,s);
     outtext(s);
     i:=i+1;
    end;
   close(ft);
  end;
  end;

     Procedure vvivodnaecran (n:byte; mat:matr; p,poc:integer; tc:tch);

      procedure tochka1 (x,y:byte; dn:word; cv:word);
        var
         x1,y1:word;
        begin
          x1:=(x-1)*dn+trunc(dn/2);
          y1:=(y-1)*dn+trunc(dn/2);
          setcolor(cv);
          setfillstyle(1,cv);
          if dn<>2*trunc(dn/2) then
           begin
            arc(x1+11,y1+11,270,0,trunc(dn/2)-1);
            arc(x1+10,y1+11,180,270,trunc(dn/2)-1);
            arc(x1+11,y1+10,0,90,trunc(dn/2)-1);
            arc(x1+10,y1+10,90,180,trunc(dn/2)-1);
            floodfill(x1+10,y1+10,cv);
           end else fillellipse(x1+10,y1+10,trunc(dn/2)-1,trunc(dn/2)-1);
        end;

      var
       x,y:byte;
       s1:string;
       nad:word;
       dn:word;
       k:tchk;
       pl:word;





       begin
        pl:=pole(n);
        dn:=trunc((pl-10)/n);
        for y:=1 to n do
         for x:=1 to n do
          if tc[x,y] then
           if mat[x,y].log
           then
            tochka1(x,y,dn,14)
           else
            tochka1(x,y,dn,7);
               setcolor(blue);
               setfillstyle(3,0);
               str(p,s1);
               nad:=trunc(getmaxy-(getmaxy-10-pole(n))/2)-5;
               moveto(10,nad);
               bar(290,nad-5,320,nad+10);
               outtext('The number of cells that are alive-'+s1);
               moveto(trunc((getmaxx*0.52))+1,nad);
               str(poc,s1);
               bar(420,nad-5,464,nad+200);
               outtext('Generation-'+s1);

               moveto(trunc((getmaxx*0.7))+25,10);
               outtext('Pause - space');
      end;

  procedure nachalo(var n:byte; var t:boolean; var q1,q2:byte; var q3:real);
    var
    s:string;
    s7:st7;
    o:word;
    s5:st5;
    s2:st2;
    s3:st3;
    f,q:byte;
    qq:integer;
     begin
        n:=55;
        t:=true;
        q1:=1;
        q2:=1;
        q3:=0;
      cleardevice;
      moveto(trunc(getmaxx*0.35),40);
      setcolor(1);
      outtext('CONWAY''S GAME OF LIFE');

      s5[1]:='BEGIN!';
      s5[2]:='Options';
      s5[3]:='Ruls';
      s5[4]:='About the program';
      s5[5]:='Exit';
      f:=menuv5(trunc(getmaxx*0.43),trunc(getmaxy/3)+20,trunc(getmaxx*0.43),trunc(getmaxy/3)+25,10,s5);

      case f of

      2: repeat
           cleardevice;
           moveto(trunc(getmaxx*0.4),40);
           setcolor(1);
           outtext('Options');
           s7[1]:='BEGIN';
           s7[2]:='Field size';
           s7[3]:='Border';
           s7[4]:='Input method';
           s7[5]:='The method of trans.';
           s7[6]:='Transition speed';
           s7[7]:='Exit';
           q:=menuv7(trunc(getmaxx*0.4),trunc(getmaxy/3)+15,trunc(getmaxx*0.4),trunc(getmaxy/3)+20,10,s7);

           case q of

           2: begin
               setfillstyle(3,0);
               bar(trunc(getmaxx*0.3),trunc(getmaxy*0.43),trunc(getmaxx*0.8),trunc(getmaxy*0.8));
               moveto(trunc(getmaxx*0.4)+1,trunc(getmaxy*0.44));
               setcolor(1);
               outtext('Enter the size of the field');
               window(trunc((lo(windmax))*0.4+2),trunc(hi(windmax)*0.65),lo(windmax)+1,hi(windmax)+1);
               repeat
                if wherey>10 then
                 begin
                  bar(trunc(getmaxx*0.3),trunc(getmaxy*0.47),trunc(getmaxx*0.8),trunc(getmaxy*0.95));
                  gotoxy(1,1);
                 end;
                 write('>');
                 readln(s);
                 val(s,qq,o);
               until (o=0) and (qq<=60) and (qq>0);
               n:=qq;
              end;

           3: begin
               s2[1]:='Torus';
               s2[2]:='Square';
               setfillstyle(3,0);
               bar(trunc(getmaxx*0.3),trunc(getmaxy*0.45),trunc(getmaxx*0.8),trunc(getmaxy*0.8));
               f:=menuv2(trunc(getmaxx*0.42),trunc(getmaxy*0.45),trunc(getmaxx*0.42)+20,trunc(getmaxy*0.45)+10,5,s2);
               if f=1 then t:=true else t:=false;
              end;

           4: begin
               s2[1]:='Enter random';
               s2[2]:='Empty field';
               setfillstyle(3,0);
               bar(trunc(getmaxx*0.3),trunc(getmaxy*0.48),trunc(getmaxx*0.8),trunc(getmaxy*0.8));
               q2:=menuv2(trunc(getmaxx*0.42),trunc(getmaxy*0.49),trunc(getmaxx*0.42)+20,trunc(getmaxy*0.49)+10,5,s2);
              end;

           5: begin
               s2[1]:='Run continuously';
               s2[2]:='Run by step';
               setfillstyle(3,0);
               bar(trunc(getmaxx*0.3),trunc(getmaxy*0.52),trunc(getmaxx*0.8),trunc(getmaxy*0.8));
               q1:=menuv2(trunc(getmaxx*0.42),trunc(getmaxy*0.52),trunc(getmaxx*0.42)+20,trunc(getmaxy*0.52)+10,5,s2);
              end;

           6: begin
               setfillstyle(3,0);
               bar(trunc(getmaxx*0.3),trunc(getmaxy*0.55-1),trunc(getmaxx*0.8),trunc(getmaxy*0.8));
               moveto(trunc(getmaxx*0.4),trunc(getmaxy*0.55));
               setcolor(1);
               outtext('Enter the speed in seconds');
               window(trunc((lo(windmax))*0.4+3),trunc(hi(windmax)*0.6+4),lo(windmax)+1,hi(windmax)+1);
               repeat
                if wherey>7 then
                 begin
                  bar(trunc(getmaxx*0.3),trunc(getmaxy*0.57),trunc(getmaxx*0.6),trunc(getmaxy*0.8));
                  gotoxy(1,1);
                 end;
                 write('>');
                 readln(s);
                 val(s,qq,o);
               until (o=0) and (qq<=30) and (qq>=0);
              end;

           7: halt;
         end;
        until q=1;

        5: halt;

        3: begin
            cleardevice;
            moveto(trunc(getmaxx*0.45),40);
            setcolor(1);
            outtext('Rules');
            rul;
            s2[2]:='Back';
            s2[1]:='Begin';
            f:=menug(trunc(getmaxx*0.39),trunc(getmaxy*0.7),trunc(getmaxx*0.37)+20,trunc(getmaxy*0.7)+10,70,s2);
            if f=2 then q1:=6;
            cleardevice;
           end;
        4:begin
           cleardevice;
            moveto(trunc(getmaxx*0.35),40);
            setcolor(1);
            outtext('CONWAY''S GAME OF LIFE');
            setcolor(8);
            moveto(10,100);
            outtext('The program is a coursework');
            moveto(10,110);
            outtext('1st year student');
            moveto(10,120);
            outtext('Group KA-11');
            moveto(10,130);
            outtext('Gluznam Mark');

            s2[2]:='Back';
            s2[1]:='Begin';
            f:=menug(trunc(getmaxx*0.4),trunc(getmaxy*0.7),trunc(getmaxx*0.37)+20,trunc(getmaxy*0.7)+10,70,s2);
            if f=2 then q1:=6;
           end;


        end;
      end;
 end.