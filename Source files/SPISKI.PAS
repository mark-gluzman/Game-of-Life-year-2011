uses crt;

type pel=^el;
     el=record
       data:string;
       next:pel;
     end;

procedure create(var root:pel);
 var p1,p2:pel;
     c:char;
 begin
   new(p1);
   root:=p1;
   repeat
     write('data-');
     readln(p1^.data);
     writeln('continue y/n');
     readln(c);
     if upcase (c)='N' then
       p1^.next:=nil else
         begin
          new(p2);
          p1^.next:=p2;
          p1:=p2;
         end;
   until upcase(c)='N';

 end;

 procedure createl1(var root:pel; var l:integer);
 var p1,p2:pel;
     c:char;
 begin
   l:=1;
   new(p1);
   root:=p1;
   repeat
     write('data-');
     readln(p1^.data);
     writeln('continue y/n');
     readln(c);
     if upcase (c)='N' then
       p1^.next:=nil else
         begin
         l:=l+1;
          new(p2);
          p1^.next:=p2;
          p1:=p2;
         end;
   until upcase(c)='N';
 end;


procedure out (root:pel);
  var p:pel;
  begin
    p:=root;
    while p<>nil do
      begin
       writeln(p^.data);
       p:=p^.next;
      end;
  end;

procedure poisk (var rootL,rootL1,rootL2:pel; l:integer);
    var
      d,p0,pd,p1:pel;
      b:boolean;
      i:integer;

    Begin
      new(p0);
      p0^.next:=rootl;
      p0^.data:='nach';
      d:=p0;

      b:=false;
      while (b=false) and (pd<>nil) do
        begin
          b:=true;
          p1:=rootl1;
          pd:=p0^.next;
          while b and (p1<>nil) and (pd<>nil) do
            begin
              if pd^.data<>p1^.data then b:=false;
              p1:=p1^.next;
              pd:=pd^.next;
            end;
          if (b=false) then p0:=p0^.next;
        end;



    if b then
     begin
      pd:=p0^.next;
      for i:=1 to l do
        begin
          p1:=pd^.next;
          dispose(pd);
          pd:=p1;
        end;

      if p0^.data='nach' then
        rootl:=rootl2 else
         p0^.next:=rootl2;

      p1:=rootl2;
      while p1^.next<>nil do
        p1:=p1^.next;
      p1^.next:=pd;

      rootl1:=nil;
      rootl2:=nil;
     end;

      dispose(d);
      pd:=nil;
      p1:=nil;
      p0:=nil;

    end;




var
  rootL,rootL1,rootL2:pel;
  l:integer;
begin
  clrscr;
  create(rootL);
  writeln;
  createl1(rootL1,l);
  writeln;
  create(rootL2);
  writeln;
  poisk(rootL,rootL1,rootL2,l);
  out(rootL);
  readln;
end.