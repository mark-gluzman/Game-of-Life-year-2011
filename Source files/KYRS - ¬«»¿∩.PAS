USES crt, dos, inter, menu, graph;

TYPE

ft=file of tchk;

function getlongintTime:longint;

 var Hour,minute,second,sec100: word;
 var k,r:longint;
begin
 GetTime (Hour, minute, second, sec100);
  k:=Hour; r:=k*360000;
 k:=minute; Inc (r,k*6000);
 k:=second; Inc(r,k*100);
 Inc(r,sec100); getlongintTime:=r;
end;

procedure Delay (ms:word);

var endTime,curTime : longint;
    cor:boolean;
begin
 cor:=false;
 endTime:=getlongintTime + ms div 10;
 if endTime>8639994 then cor:=true;
 repeat
  curTime:=getlongintTime;
  if cor=true then begin
   if curTime<360000 then
    Inc (curTime,8639994);
  end;
 until curTime>endTime;
end;


procedure cosp (x,y,n:byte; var mat:matr; w:boolean; t:boolean);
 var q:shortint;

 begin
     if w then q:=1 else q:=-1;
     mat[x,y].log:=w;
     if x>1 then
          mat[x-1,y].cos:=mat[x-1,y].cos+q else
        if t then
            mat[n,y].cos:=mat[n,y].cos+q;
        if x<n then
           mat[x+1,y].cos:=mat[x+1,y].cos+q
         else
        if t then mat[1,y].cos:=mat[1,y].cos+q;
     if y>1 then mat[x,y-1].cos:=mat[x,y-1].cos+q else
        if t then mat[x,n].cos:=mat[x,n].cos+q;
     if y<n then mat[x,y+1].cos:=mat[x,y+1].cos+q else
        if t then mat[x,1].cos:=mat[x,1].cos+q;

     if (x>1) and (y>1) then mat[x-1,y-1].cos:=mat[x-1,y-1].cos+q else
        if t then
          if x>1 then mat[x-1,n].cos:=mat[x-1,n].cos+q else
             if y>1 then mat[n,y-1].cos:=mat[n,y-1].cos+q else
               mat[n,n].cos:=mat[n,n].cos+q;

     if (x>1) and (y<n) then mat[x-1,y+1].cos:=mat[x-1,y+1].cos+q else
      if t then
          if x>1 then mat[x-1,1].cos:=mat[x-1,1].cos+q else
             if y<n then mat[n,y+1].cos:=mat[n,y+1].cos+q else
               mat[n,1].cos:=mat[n,1].cos+q;

     if (x<n) and (y>1) then mat[x+1,y-1].cos:=mat[x+1,y-1].cos+q else
        if t then
          if x<n then mat[x+1,n].cos:=mat[x+1,n].cos+q else

             if y>1 then mat[1,y-1].cos:=mat[1,y-1].cos+q else
               mat[1,n].cos:=mat[1,n].cos+q;

     if (x<n) and (y<n) then mat[x+1,y+1].cos:=mat[x+1,y+1].cos+q else
        if t then
          if x<n then mat[x+1,1].cos:=mat[x+1,1].cos+q else
             if y<n then mat[1,y+1].cos:=mat[1,y+1].cos+q else
               mat[1,1].cos:=mat[1,1].cos+q;
 end;


procedure vvodfig (n:byte; var mat:matr; t:boolean; var p:integer; b:boolean; var tt:tch);
 var
  x,y:byte;
  x2,y2:byte;
  fil:file of tchk;
  tc:tchk;
  namef,s1:string;
  o,o1,o2,nad:word;
  begin
    if b then
      begin
        moveto(trunc(getmaxx*0.7)+20,trunc(getmaxy*0.45));
        window(trunc((lo(windmax)+1)*0.75),trunc(hi(windmax)*0.65),lo(windmax)+1,hi(windmax)+1);
      end else
      begin
        moveto(trunc(getmaxx/3-5),trunc(getmaxy/3)+37);
        window(trunc((lo(windmax)+1)/3+1),trunc(hi(windmax)/3)+6,lo(windmax)+1,hi(windmax)+1);
      end;
    outtext('Vvedite figuru');
    gotoxy(1,1);
    write('>');
    readln(namef);
    assign(fil,namef);
    {$I-}
    reset(fil);
    o:=ioresult;
    if o<>0 then
       begin
         setcolor(1);
         if b then
         moveto(trunc((getmaxx*0.7))+20,trunc((getmaxy*0.5)))
          else
         moveto(trunc(getmaxx/3-5),trunc(getmaxy/3+70));
         outtext('file not found');
         readln;
       end  {$i+}
    else
     Begin
      if b then
        moveto(trunc((getmaxx*0.7))+20,trunc(getmaxy*0.52))
         else
        moveto(trunc(getmaxx/3-5),trunc(getmaxy/3)+70);
        gotoxy(1,3);
        outtext('Vvedite koordinati');
      repeat
       if wherey>10 then
        begin
         if b then
         bar(trunc((getmaxx*0.7))+20,trunc(getmaxy*0.4),getmaxx,getmaxy)
              else
         bar(trunc(getmaxx*0.3),trunc(getmaxy*0.5),getmaxx,getmaxy);
         gotoxy(1,3);
        end;

        write('>');
        readln(s1);
        val(copy(s1,1,pos(' ',s1)-1),x2,o1);
        val(copy(s1,pos(' ',s1)+1,length(s1)-pos(' ',s1)),y2,o2);
      until (o1=0) and (o2=0);
      while not eof(fil) do
        begin
          read(fil,tc);
          x:=tc.xt+x2-1;
          y:=tc.yt+y2-1;
          x:=x mod n; if x=0 then x:=n;
          y:=y mod n; if y=0 then y:=n;
          if mat[x,y].log=false then
            begin
             tt[x,y]:=true;
             cosp(x,y,n,mat,true,t);
             p:=p+1;
              if b then
               begin
                tochka(x,y,n,7);
                str(p,s1);
                setfillstyle(3,0);
                nad:=trunc(getmaxy-(getmaxy-10-pole(n))/2)-5;
                moveto(20,nad);
                bar(177,nad-5,205,nad+10);
                setcolor(blue);
                outtext('kol-vo givih kletok-'+s1);
               end;
            end;
        end;
     end;
    if o=0 then
      close(fil);
  end;

{procedure vvodpol (n:byte; var mat:matr; t:boolean; var p:integer; b:boolean; k:boolean; var tc:tch);
  var
   x,y,w:byte;
   errx,erry:integer;
   q,r,s1:string;
   nad:word;
  begin
   vvodpold;
   repeat
     if wherey>18 then
        begin
         setfillstyle(14,1);
         bar(trunc((getmaxx*0.7))+20,trunc(getmaxy*0.13),getmaxx,getmaxy);
         gotoxy(1,1);
        end;
     write('>');
     readln(r);
     w:=pos(' ',r);
     val(copy(r,1,w-1),x,errx);
     val(copy(r,w+1,ord(r[0])-w),y,erry);
     if (errx=0) and (erry=0) and (x>=0) and (x<=n) and (y>=0) and (y<=n)
      and (k xor mat[x,y].log) then
        begin
          tc[x,y]:=true;
          cosp(x,y,n,mat,k,t);
          if k then  p:=p+1
              else p:=p-1;

           str(p,s1);
           nad:=trunc(getmaxy-(getmaxy-10-pole(n))/2)-5;
           moveto(20,nad);
           setfillstyle(3,0);
           bar(177,nad-5,205,nad+10);
           setcolor(blue);
           outtext('kol-vo givih kletok-'+s1);

          if b then
           if k then
            tochka(x,y,n,7) else tochka(x,y,n,yellow);
        end
     else if r<>'end' then writeln('Nevernii vvod dannih');
   until r='end';
  end;                    }


procedure vvodpf (n:byte; var mat:matr;{ k:boolean;} t:boolean; var p:integer; var tc:tch);
 var
  x,y,x1,y1,nad:word;
  ch:char;
  s1:string;
  begin
    x:=1;
    y:=1;
    x1:=1;
    y1:=1;
  repeat
    while keypressed do
      ch:=readkey;
    repeat
       kvad(n,x,y,true);
       ch := ReadKey;
       if ch = char(0) then
       begin
         ch := ReadKey;
         if ch=#72 then y1:=y-1;
         if ch=#80 then y1:=y+1;
         if ch=#75 then x1:=x-1;
         if ch=#77 then x1:=x+1;
       end;
       if (x1<>x) or (y<>y1) then
       begin
        x1:=x1 mod n;
        if x1=0 then x1:=n;
        y1:=y1 mod n;
        if y1=0 then y1:=n;
        kvad(n,x,y,false);
        kvad(n,x1,y1,true);
        x:=x1;
        y:=y1;
       end;
      until (ch=#13) or (ch=#32);
    kvad(n,x,y,false);

    if{ (k xor mat[x,y].log) and} (ch=#13) then
         begin
          tc[x,y]:=true;
          cosp(x,y,n,mat,(not mat[x,y].log),t);
          if mat[x,y].log then  p:=p+1
              else p:=p-1;

           str(p,s1);
           nad:=trunc(getmaxy-(getmaxy-10-pole(n))/2)-5;
           moveto(20,nad);
           setfillstyle(3,0);
           bar(177,nad-5,205,nad+10);
           setcolor(blue);
           outtext('kol-vo givih kletok-'+s1);

           if not mat[x,y].log then
            tochka(x,y,n,yellow) else tochka(x,y,n,7);
         end;

    until (ch=#32);




  end;


procedure vvod (n:byte; var mat:matr; t:boolean; var p:integer; q2:byte; var tc:tch);
 var
   x,y,q:byte;
   s:st2;
 begin
   p:=0;
   for x:=1 to n do
    for y:=1 to n do
      begin
        mat[x,y].log:=false;
        mat[x,y].cos:=0;
        tc[x,y]:=false;
      end;

       case q2 of
       1:  begin
             randomize;
             for x:=1 to n do
              for y:=1 to n do
                if random(2)=1 then
                begin
                  tc[x,y]:=true;
                  cosp(x,y,n,mat,true,t);
                  p:=p+1;
                end;
            end;
     {  2: Begin
                cleardevice;
                s[1]:='vvesti figuru';
                s[2]:='vvesti polzovatel';
                q:=menug(trunc(getmaxx/3-5),trunc(getmaxy/3),trunc(getmaxx/3-5)+120,trunc(getmaxy/3)+20,50,s);
                if q=1 then
                 vvodfig(n,mat,true,p,false,tc)
                  else
                   vvodpol(n,mat,t,p,false,true,tc);
            end;    }
 end;
end;



procedure save (n:byte; mat:matr);
 var
  f:ft;
  s:string;
  k:tchk;
  x,y:byte;
 begin
  setcolor(1);
  moveto(trunc((getmaxx*0.7))+20,trunc(getmaxy*0.37));
  outtext('vvedite imya faila');
  window(trunc((lo(windmax)+1)*0.75),trunc(hi(windmax)*0.5+1),lo(windmax)+1,hi(windmax)+1);
  write('>');
  readln(s);
  assign(f,s);
  rewrite(f);
  for x:=1 to n do
   for y:=1 to n do
    if mat[x,y].log then
     begin
       k.xt:=x;
       k.yt:=y;
       write(f,k);
     end;
  close (f);
 end;



procedure shag (var mat:matr; n:byte; t:boolean; var p:integer; var tc:tch);
var
  x,y:byte;
  mat1:matr;
 begin
    mat1:=mat;
    for x:=1 to n do
     for y:=1 to n do
           begin
             tc[x,y]:=false;
             if (mat[x,y].log=false) and (mat[x,y].cos=3) then
                begin
                  cosp(x,y,n,mat1,true,t);
                  p:=p+1;
                  tc[x,y]:=true;
                  end;
             if (mat[x,y].log) and ((mat[x,y].cos<2) or (mat[x,y].cos>3)) then
                begin
                  cosp(x,y,n,mat1,false,t);
                  tc[x,y]:=true;
                  p:=p-1;
                end;
           end;
      mat:=mat1;
  end;



procedure vvivod (n:byte; var mat:matr; t:boolean; var q1:byte; var p:integer; q:real; tc:tch);

VAR
  s1:string;
  poc:integer;
  o,xm:word;
  b:boolean;
  s8:st8;
  s4:st4;
  s2:st2;
  s3:st3;
  q2,x,y:byte;
  ch:char;
BeGIN
    poc:=1;
    b:=false;
    cleardevice;
    q1:=q1+1;
    q2:=q1;
 repeat
    q1:=q2;
    if b then
       begin
        s8[1]:='Prodolgit';
        s8[2]:='Zapystit neprerivno';
        s8[3]:='Zapystit poshagovo';
        s8[4]:='Dob/ybr kletki';
        s8[5]:='Ochistit pole';
        s8[6]:='Sohranit pole';
        s8[7]:='Vernutsa v menu';
        s8[8]:='Vihod';
        setfillstyle(3,0);
        bar(trunc((getmaxx*0.7))+20,20,getmaxx,trunc(getmaxy*0.8));
        xm:=trunc((getmaxx*0.7))+25;
        q2:=menuv8(xm,trunc(getmaxy*0.1),xm+120,trunc(getmaxy*0.1)+10,5,s8);
       end
         else if q2=2 then
          begin
            grpol(n);
            vvivodnaecran(n,mat,p,poc,tc);
            delay(trunc(q*1000));
          end;

   if q2=1 then q2:=q1;

   case q2 of
     2: begin
          if b then
           begin
            setcolor(1);
            moveto(trunc((getmaxx*0.7))+20,trunc(getmaxy*0.36));
            outtext('vvedite scoroct');
            moveto(trunc((getmaxx*0.7))+20,trunc(getmaxy*0.36+10));
            outtext('v secundah');
            window(trunc((lo(windmax)+1)*0.75),trunc(hi(windmax)*0.5+1),lo(windmax)+1,hi(windmax)+1);
            repeat
             if wherey>12 then
                 begin
                  bar(trunc((getmaxx*0.7))+20,trunc(getmaxy*0.4),getmaxx,getmaxy);
                  gotoxy(1,1);
                 end;
              write('>');
              readln(s1);
              val(s1,q,o);
            until (o=0) and (q<=300) and (q>=0);
           end;
           bar(trunc((getmaxx*0.7))+20,20,getmaxx,getmaxy);
           repeat
             shag(mat,n,t,p,tc);
             poc:=poc+1;
             vvivodnaecran(n,mat,p,poc,tc);
             delay(trunc(q*1000));
           until keypressed;
          end;

   3: begin
       if not b then
        begin
          grpol(n);
          vvivodnaecran(n,mat,p,poc,tc);
          repeat
            ch := ReadKey;
            if ch = char(0) then
              ch := ReadKey;
          until (ch=#13) or (ch=#32);
        end;


        bar(trunc((getmaxx*0.7))+20,20,getmaxx,getmaxy);
        if b or (ch=#13) then
         repeat
           while keypressed do
           ch:=readkey;

            ch := ReadKey;
            if ch=#13 then
             begin

               while keypressed do
               ch:=readkey;

               shag(mat,n,t,p,tc);
               poc:=poc+1;
               vvivodnaecran(n,mat,p,poc,tc);
             end;

         until (ch=#32);
     end;

   4:begin
       bar(trunc((getmaxx*0.7))+20,trunc((getmaxy*0.23)),trunc((getmaxx)),trunc(getmaxy*0.5));
       s3[1]:='Dobavit random';
       s3[2]:='Dobavit figuru';
       s3[3]:='Dob/ybr kyrsorom';
       q1:=menuv3(trunc((getmaxx*0.7))+20,trunc((getmaxy*0.23)),trunc((getmaxx*0.7))+20,trunc(getmaxy*0.25),5,s3);

       case q1 of

       { 1:begin
            s4[1]:='Vvesti figuru';
            s4[2]:='Vvesti koordinatu';
            s4[3]:='Vvesti random';
            s4[4]:='Vvesti kyrsorom';
            q1:=menuv4(xm,trunc((getmaxy*0.3)),xm,trunc(getmaxy*0.32),5,s4);

            case q1 of
                          }
            2:vvodfig(n,mat,true,p,b,tc);
           { 2:vvodpol(n,mat,t,p,b,true,tc); }
            3:vvodpf (n,mat{,true},t,p,tc);
            1:begin
               randomize;
               for x:=1 to n do
                for y:=1 to n do
                 if (random(3)=1) and (mat[x,y].log=false) then
                   begin
                    tc[x,y]:=true;
                    cosp(x,y,n,mat,true,t);
                    p:=p+1;
                   end;
               vvivodnaecran(n,mat,p,poc,tc);
              end;

            end;

        {  end; }

      {  2: begin
            s2[1]:='Vvesti koordinatu';
            s2[2]:='Vvesti kyrsorom';
            q1:=menuv2(xm,trunc((getmaxy*0.3)),xm,trunc(getmaxy*0.32),5,s2);
            case q1 of
            { 1:vvodpol(n,mat,t,p,b,false,tc);   }
         {    2:vvodpf (n,mat{,false,t,p,tc);
            end;
           end;
       end;    }
     end;

   5: begin
       p:=0;
        for x:=1 to n do
         for y:=1 to n do
          begin
           mat[x,y].log:=false;
           mat[x,y].cos:=0;
           tc[x,y]:=true;
          end;
       vvivodnaecran(n,mat,p,poc,tc);
      end;

   6: save(n,mat);


 end;
    b:=true;
  until (q2=8) or (q2=7);
  q1:=q2;
 end;


VAR
n,q1,q2:byte;
mat:matr;
t:boolean;
p:integer;
q3:real;
tc:tch;
BEGIN
   directvideo:=false;
   reg;
   repeat
      nachalo(n,t,q1,q2,q3);
      vvod(n,mat,t,p,q2,tc);
      vvivod(n,mat,t,q1,p,q3,tc);
   until q1=8;
   closegraph;
END.
