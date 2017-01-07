
program menu2;
uses Crt;
const
  NORM = $17; { Cvet ne vidlenogo pyncta }
  SEL = $70; {Cvet ne vidlenogo pyncta }
  N = 3;
var
  menu: array[1..N] of string[12]; { nazvanie pynctov menu }
  punkt: integer; { nomer videlenogo pyncta }
  ch: char; { Vvedenniu simbol }
  x, y: integer; { Koordinati menu }
procedure punkt1;
begin
  ClrScr;
  writeln('Procedure1 Nagmite enter');
  readln;
end;
procedure punkt2;
begin
  ClrScr;
  writeln('Procedure2 Nagmite enter');
  readln;
end;
procedure MenuToScr; { Vvivod na ekran }
var i: integer;
begin
  ClrScr;
  for i := 1 to N do begin
    GoToXY(x, y + i - 1);
    write(menu[i]);
  end;
  TextAttr := SEL;
  GoToXY(x, y + punkt - 1);
  write(menu[punkt]); { Vvidelim scroky menu }
  TextAttr := NORM;
end;

begin
  menu[1] := ' Deistvie 1 ';
  menu[2] := ' Deistvie 2 ';
  menu[3] := ' Vihod ';
  punkt := 1;
  x := 5;
  y := 5; TextAttr := NORM;
  MenuToScr;
  repeat
    ch := ReadKey;
    if ch = char(0) then begin
      ch := ReadKey;
      case ch of
        chr(80): { strelka vniz }
          if punkt < N then begin
            GoToXY(x, y + punkt - 1);
            write(menu[punkt]);
            punkt := punkt + 1;
            TextAttr := SEl;
            GoToXY(x, y + punkt - 1);
            write(menu[punkt]);
            TextAttr := NORM;
          end;
        chr(72): { strelke verh }
          if punkt > 1 then begin
            GoToXY(x, y + punkt - 1);
            write(menu[punkt]);
            punkt := punkt - 1;
            TextAttr := SEl;
            GoToXY(x, y + punkt - 1);
            write(menu[punkt]);
            TextAttr := NORM;
          end;
      end;
    end
    else
      if ch = chr(13) then begin { nagata clavisha enter }
        case punkt of
          1: punkt1;
          2: punkt2;
          3: ch := chr(27); { vihod }
        end;
        MenuToScr;
      end;
  until ch = chr(27); { 27 - код <Esc> }
end.