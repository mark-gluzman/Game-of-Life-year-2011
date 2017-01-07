type fun=function(x:real):real;
  function  sinm (x:real):real; far;
   begin
   sinm:=sin(x);
   end;
   function k(var f:fun; a,b,e:real):real;
      var c:real;
      begin
      if f(a)*f(b)<0 then
         repeat
            c:=(a+b)/2;
            if f(c)=0 then
               begin
               a:=c;
               b:=c;
               end
               else
               if f(a)*f(c)<0 then b:=c
               else a:=c;
               until abs(a-b)<e;
               k:=a;
               end;
   var
               r,a,b,e:real;
               f:fun;
   begin
     readln(a);
     readln(b);
     readln(e);
     f:=sinm;
    r:=k(f,a,b,e);
    writeln(r);
    end.
