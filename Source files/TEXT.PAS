uses graph, CRT;
var d, m : integer;
    s : string;
begin
    d := 0; {autodetect}
    directVideo := false;
    InitGraph(d, m, 'c:\bp\bgi');

    putPixel(10, 10, white);
    gotoxy(5, 5); write('> '); readLn(s);
    moveto(100,100);
    outtext(s);
    readln;

    CloseGraph;
end.