USES crt;

Type

 mark=array [1..4] of 1..5;

 name=record
   fname,sname,surname:string;
 end;

 datar=record
   chislo,month:string[2];
   god:string[4];
 end;

 student=record
   n:name;
   d:datar;
   p:char;
   m:mark;
 end;

 ft=file of student;
 nm=file of name;

Procedure vvod (var f:ft);
 var
  s:student;
  i:integer;
  s1:string;
  j:byte;
 begin
  i:=0;
  rewrite(f);
  repeat
   with s do
     begin
       i:=i+1;
       writeln(i,' student');
       write('imya-');
       readln(n.fname);
        if n.fname<>'' then
         begin
          with n do
             begin
               write('otchestvo-');
               readln(sname);
               write('familiya-');
               readln(surname);
             end;

          with d do
             begin
               write('data rogdeniya(''ch.m.god'')-');
               readln(s1);
               chislo:=copy(s1,1,2);
               month:=copy(s1,4,2);
               god:=copy(s1,7,4);
             end;

          writeln('vvedite-''m'' esli malchik, ''g'' esli devochka');
          readln(p);

          for j:=1 to 4 do
            begin
              write('mark',j,'-');
              readln(m[j]);
            end;
          write(f,s);
       end;
     end;
  until s.n.fname='';
  close(f);
 end;

procedure sort_file (var f:ft;var nam:nm; c:char);
  var
  n1,n2:name;
  i,j:longint;
  s1:student;
  begin
   reset(f);
   rewrite(nam);
     for i:=0 to filesize(f)-1 do
       begin
         seek(f,i);
         read(f,s1);
         writeln(s1.n.fname,' ',s1.n.sname,' ',s1.n.surname);
         if upcase(s1.n.surname[1])=upcase(c) then
           write(nam,s1.n);
       end;
       writeln;
     close(f);
     for j:=filesize(nam)-1 downto 1 do
       for i:=0 to j-1 do
         begin
           seek(nam,i);
           read(nam,n1);
           read(nam,n2);
           if n1.surname>n2.surname then
             begin
               seek(nam,i);
               write(nam,n2);
               write(nam,n1);
             end;
         end;
     close(nam);
  end;

procedure out_file1 (var f:ft; var t1:text);
  var
    s:student;
  begin
   reset(f);
   rewrite(t1);
   while not eof(f) do
     begin
       read(f,s);
       writeln(t1,s.n.fname,' ',s.n.sname,' ',s.n.surname);
       writeln(t1,s.d.chislo,'.',s.d.month,'.',s.d.god);
       writeln(t1,s.p);
       writeln(t1,s.m[1],' ', s.m[2],' ',s.m[3],' ',s.m[4]);
       writeln(t1);
     end;
   close(f);
   close(t1);
  end;

procedure out_file (var nam:nm; var t:text);
  var
    n1:name;
  begin
   reset(nam);
   rewrite(t);
   while not eof(nam) do
     begin
       read(nam,n1);
       writeln(t,n1.fname,' ',n1.sname,' ',n1.surname);
     end;
   close(nam);
   close(t);
  end;

VAR f_name,t_name,s:string;
    c,l:char;
    nam:nm;
    f:ft;
    t,t1:text;
BEGIN
  clrscr;
  write('file name-');
  readln(f_name);
  assign(f,f_name);
  writeln('create file y/n');
  readln(c);
  if upcase(c)='Y' then
    vvod(f);
  assign(nam,'rez.dat');
  assign(t,'rez.txt');
  assign(t1,'int1.txt');
  writeln('Vvedite bykvy');
  readln(l);
  out_file1(f,t1);
  sort_file(f,nam,l);
  out_file(nam,t);
  reset(t);
  while not eof(t) do
    begin
      readln(t,s);
      writeln(s);
    end;
  readln;
End.





