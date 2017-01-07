uses inter, menu,crt,graph;
type

 matr=array[1..250,1..250] of byte;
 par=^matr;

 ris=object
   name:string[20];
   x1,y1:word;
   a:par;
   p:pointer;

   constructor init;
   constructor init1(s:string;x,y:word);
   constructor init2(s:string;x,y:word; nf:string);
   procedure out;
   destructor done;
   virtual;
 end;

   constructor ris.init;
    var i,j:word;
     begin
      name:='noname';
      x1:=50;
      y1:=50;
      new(a);
      if a=nil then fail;
      for i:=1 to x1 do
       for j:=1 to y1 do
        begin
         a^[i,j]:=1;
         putpixel(i,j,a^[i,j]);
        end;
      getmem(p,imagesize(1,1,x1,y1));
      if p=nil then fail;
      getimage(1,1,x1,y1,p^);
      cleardevice;
     end;

   constructor ris.init1;
    var i,j:word;
     begin
      randomize;
      name:=s;
      x1:=x;
      y1:=y;
      new(a);
      if a=nil then fail;
      for i:=1 to x1 do
       for j:=1 to y1 do
        begin
         a^[i,j]:=random(20);
         putpixel(i,j,a^[i,j]);
        end;
      getmem(p,imagesize(1,1,x1,y1));
      if p=nil then fail;
      getimage(1,1,x1,y1,p^);
     end;

   constructor ris.init2;
    var i,j:word;
        c:byte;
        f:text;
     begin
      randomize;
      name:=s;
      x1:=x;
      y1:=y;
      new(a);
      assign(f,nf);
      reset(f);
      if a=nil then fail;
      for i:=1 to x1 do
       for j:=1 to y1 do
        begin
         read(f,c);
         if not eof(f) then
           a^[i,j]:=c else
           a^[i,j]:=1;
         putpixel(i,j,a^[i,j]);
        end;
      getmem(p,imagesize(1,1,x1,y1));
      if p=nil then fail;
      getimage(1,1,x1,y1,p^);
      close(f);
     end;

   destructor ris.done;
    begin
     if p<>nil then
      freemem(p,imagesize(1,1,x1,y1));
     if a<>nil then
       dispose(a);
    end;

   procedure ris.out;
    begin
     cleardevice;
     outtextxy(10,10,name);
     putimage((getmaxx-20) div 2,(getmaxy-20) div 2,p^,normalput);
     readln;
    end;

  var o:^ris;
      s,s1:string[20];
      s3:st3;
      q:byte;
      c:char;
      o1,o2,x,y:word;
   begin;
    reg;
    setcolor(2);
    s3[1]:='1 color';
    s3[2]:='random';
    s3[3]:='file';
    q:=3;{:=menuv3(1,1,20,30,10,s3);}
    cleardevice;
    case q of
      1:new(o,init);
      2:begin
         outtextxy(10,10,'vvedite imya risynka');
         s:='';
         repeat
          c:=readkey;
          if upcase(c) in ['A'..'Z'] then
           begin
            s:=s+c;
            outtextxy(0,30,s);
           end;
         until (c=#13) or (length(s)>20);


         outtextxy(10,50,'vvedite dliny i shiriny');
         s1:='';
         repeat
          c:=readkey;
          if upcase(c) in ['0'..'9',' '] then
           begin
            s1:=s1+c;
            outtextxy(10,60,s1);
           end;
         until (c=#13) or (length(s)>20);
         val(copy(s1,1,pos(' ',s1)-1),x,o1);
         val(copy(s1,pos(' ',s1)+1,length(s1)-pos(' ',s1)),y,o2);
         if (o1=0) and (o2=0) then
           new(o,init1(s,x,y));
       end;

     3:begin
         outtextxy(10,10,'vvedite imya risynka');
         s:='';
         repeat
          c:=readkey;
          if upcase(c) in ['A'..'Z'] then
           begin
            s:=s+c;
            outtextxy(0,20,s);
           end;
         until (c=#13) or (length(s)>20);


         outtextxy(10,30,'vvedite dliny i shiriny');
         s1:='';
         repeat
          c:=readkey;
          if upcase(c) in ['0'..'9',' '] then
           begin
            s1:=s1+c;
            outtextxy(10,40,s1);
           end;
         until (c=#13) or (length(s)>20);
         val(copy(s1,1,pos(' ',s1)-1),x,o1);
         val(copy(s1,pos(' ',s1)+1,length(s1)-pos(' ',s1)),y,o2);

         outtextxy(10,50,'vvedite imya faila');
         s1:='';
         repeat
          c:=readkey;
          if upcase(c) in ['A'..'Z','.'] then
           begin
            s1:=s1+c;
            outtextxy(0,60,s1);
           end;
         until (c=#13) or (length(s1)>20);

         if (o1=0) and (o2=0) then
           new(o,init2(s,x,y,s1));
       end;

     end;

    if o<>nil then
     begin
      o^.out;
      dispose(o,done);
     end;
    closegraph;
   end.






