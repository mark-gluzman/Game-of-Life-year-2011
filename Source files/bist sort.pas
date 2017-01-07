program bistsort1;
 uses crt;
 Type
  vec=array[1..100] of integer;

procedure vvivod(const a:vec; n:byte);
var i:byte;
begin
   writeln;
   writeln;
   for i:=1 to n do
       write(a[i]:3);
   readln;
end;


function Part (var a:vec; l, r: integer):integer;
var v,i,j,b:integer;
begin
   v:=a[r];
   i:=l-1;
   j:=r;
  while i<j do
     begin
        repeat
           j:=j-1;
        until (a[j]<=v) or (j=i+1);
        repeat
           i:=i+1;
        until (a[i]>=v) or (i=j-1);
        b:=a[i];
        a[i]:=a[j];
        a[j]:=b;
     end;
   a[j]:=a[i];
   a[i]:=a[r];
   a[r]:=b;
   part:=i;
end;

procedure bistsort(var a:vec; l, t: integer);
var i:byte;
begin
  if l<t then
    begin
      i:=part(a,l, t);
      bistsort(a,l,i-1);
      bistsort(a,i+1,t);
    end;
end;

procedure vvod(var a:vec; var n:byte);
var
c:char;
i:byte;
begin
  clrscr;
  randomize;
  writeln ('Vvedite chislo <100');
  readln(n);
  while (c<>'2') and (c<>'1') do
     begin
        Writeln('Esli vu hotite random - 1');
        writeln('Esli vu hotite vvodit - 2');
        readln(c);
        case c of
           '2' :  for i:=1 to n do
               Begin
                  Write(' A[',i,']=');
                  readln(a[i]);
               end;
           '1' :  for i:=1 to n do
               Begin
                  a[i]:=100-random(200);
                  write(a[i]:3);
               end;
           else writeln('nevernii zivra');
        end;
    end;
end;

var
  a:vec;
  n:byte;

begin
  vvod(a,n);
  bistsort(a,1,n);
  vvivod(a,n);
end.
