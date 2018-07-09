//Ханойская башня
//рекурсивное решение
//помощь здесь(алгоритм взял отсюда): https://www.youtube.com/watch?v=yqlpAFr12yg

CONST h=5;  //высоту башен можешь менять в будущем

var n:byte;
    m,t,i:integer;
    a:array [1..h, 1..3] of integer; // 1..h-это уровни башни
                                     // 1..3-это номер башни по порядку
    
//выводим все башни на экран
procedure print_han();
begin
  for var j:=1 to h do
    writeln(a[j,1]:6,a[j,2]:6,a[j,3]:6);
  writeln();
  writeln();
end;
    
//функция поиска вершины башни n_tower
function getRow(n_tower:integer):integer; 
var r,j:integer;
begin
  r:=-1;  
  for j:=1 to h do
    if a[j,n_tower]<>0 then begin
      r:=j;
      break;
    end;
  result:=r;
end;

// перенос диска с башни1 на башню2
procedure move(tower1, tower2:integer);
var row1, row2, z:integer;
begin
  row1:=getRow(tower1); //зафиксировали то место, откуда снимем диск  
  row2:=getRow(tower2); //нашли свободное место на башне2 
  
  if row2=-1 then
    row2:=h  //если башня2 была пустой, то уровень, куда поставим - на самое дно
  else
    row2:=row2-1; //если в башне что-то было, то диск положим в ячейку над самым верхним
      
  //теперь перекладываем  
  z:=a[row1,tower1];
  a[row1,tower1]:=0;
  a[row2,tower2]:=z;
  
  print_han();
end;


//основная рекурсивная функция
procedure Hanoi(tower1, tower3, tower2:integer; N: byte);
begin
    if N <> 0 then begin
      Hanoi(tower1, tower2, tower3, N-1); // переносим N-1 дисков с первой палки на вторую
      move(tower1, tower3);                    // переносим N-ый диск с первой палки на третью
      Hanoi(tower2, tower3, tower1, N-1);// переносим N-1 дисков ссо второй палки на третью
    end;
end;

BEGIN
  write('n=');
  read(n); 
  if (n>0) and (n<=h) then begin
    //обнулим все массивы
    for i:=1 to h do begin
      a[i,1]:=0;
      a[i,2]:=0;
      a[i,3]:=0;
    end;   
    //заполним башню А
    for i:=1 to n do begin
      a[h-i+1,1]:=n-i+1;
    end;  
    
    print_han();
    Hanoi(1,3,2,n);
  end 
  else
    writeln('n должно быть не больше h');
END.
