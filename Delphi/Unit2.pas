unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Math,

  Dialogs, ExtCtrls, StdCtrls, TeEngine, Series, TeeProcs, Chart, IniFiles;

type
  TForm1 = class(TForm)
    dlgOpen1: TOpenDialog;
    mmo1: TMemo;
    pnl1: TPanel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    scrlbr1: TScrollBar;
    scrlbr2: TScrollBar;
    scrlbr3: TScrollBar;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    pnl2: TPanel;
    lbl5: TLabel;
    lbl6: TLabel;
    edt6: TEdit;
    scrlbr6: TScrollBar;
    edt5: TEdit;
    scrlbr5: TScrollBar;
    scrlbr4: TScrollBar;
    lbl4: TLabel;
    edt4: TEdit;
    edt7: TEdit;
    edt8: TEdit;
    edt9: TEdit;
    edt10: TEdit;
    edt11: TEdit;
    edt12: TEdit;
    edt13: TEdit;
    edt14: TEdit;
    edt15: TEdit;
    edt16: TEdit;
    edt17: TEdit;
    edt18: TEdit;
    cht1: TChart;
    cht2: TChart;
    lnsrsSeries1: TLineSeries;
    dlgSave1: TSaveDialog;
    pnl3: TPanel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    lbl7: TLabel;
    lbl8: TLabel;
    tmr1: TTimer;
    procedure btn1Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure edt7Change(Sender: TObject);
    procedure scrlbr1Change(Sender: TObject);
    procedure scrlbr2Change(Sender: TObject);
    procedure scrlbr3Change(Sender: TObject);
    procedure scrlbr4Change(Sender: TObject);
    procedure scrlbr6Change(Sender: TObject);
    procedure scrlbr5Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt8Change(Sender: TObject);
    procedure edt9Change(Sender: TObject);
    procedure edt11Change(Sender: TObject);
    procedure edt10Change(Sender: TObject);
    procedure edt12Change(Sender: TObject);
    procedure edt13Change(Sender: TObject);
    procedure edt14Change(Sender: TObject);
    procedure edt16Change(Sender: TObject);
    procedure edt18Change(Sender: TObject);
    procedure edt17Change(Sender: TObject);
    procedure edt15Change(Sender: TObject);
    procedure edt2Change(Sender: TObject);
    procedure edt3Change(Sender: TObject);
    procedure edt4Change(Sender: TObject);
    procedure edt5Change(Sender: TObject);
    procedure edt6Change(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;


const
  //Коэффициент для перевода градусов в радианы.
  K = Pi / 180;
  RE = 50;
  RI = 0.01;
  magnification = 100; // коэфициент увеличения для scrolbar

var
  Form1: TForm1;
  Max, Min, MaxH, MinH: Integer;
  series1, series2, series3, series4, series5, series6: TLineSeries;
  U0, X0, H, R, E0, dU, dUp: Real;
  Alpha: Real;
  who_action:integer;

implementation

{$R *.dfm}

function StrToReal(s: string): Real;
var
  position1:Integer;
begin
  position1 := -1;
  try
  if (AnsiPos('.', s) = 0) then begin
    Result := (StrToInt(s))  ;
  end else begin

  if AnsiPos('.', s) <> 0 then begin
      position1 := AnsiPos('.', s);
  end;
  if position1 = 1 then
    Result := StrToReal('0'+s)
  else if position1 = Length(s) then
    Result := StrToReal(s+'0')
  else
    Result := StrToInt(Copy(s,0,position1-1)) + Sign(StrToInt(Copy(s,0,position1-1))) * StrToInt(Copy(s,position1+1,Length(s)))/Power(10,Length(s)-position1);
  end;
  except
    s:= '0';
    Result:=strtoreal(s);
  end;
end;

procedure ReadFunctionValues();
begin
  with Form1 do begin
    try
      U0 := StrToReal(edt1.Text);
      X0 := StrToReal(edt2.Text);
      H := StrToReal(edt3.Text);
      R := StrToReal(edt4.Text);
      Alpha := StrToReal(edt5.Text) * K;
      E0 := StrToReal(edt6.Text);
      if lbl8.Caption = 'Неправильные параметры U(x)' then
      lbl8.Caption := '' ;
    except
      lbl8.Caption := 'Неправильные параметры U(x)' ;
    end;
  end;
end;

procedure WriteDefaultSettings();
var
 ini: TIniFile;
begin
  with Form1 do begin
   ini := TIniFile.Create('.\settings.ini');
   try
    ini.WriteInteger('Uo', 'Min', StrToInt(edt7.Text));
    ini.WriteFloat('Uo', 'Position', StrToReal(edt1.Text));
    ini.WriteInteger('Uo', 'Max', StrToInt(edt8.Text));

    ini.WriteInteger('Xo', 'Min', StrToInt(edt9.Text));
    ini.WriteFloat('Xo', 'Position', StrToReal(edt2.Text));
    ini.WriteInteger('Xo', 'Max', StrToInt(edt10.Text));

    ini.WriteInteger('h', 'Min', StrToInt(edt11.Text));
    ini.WriteFloat('h', 'Position', StrToReal(edt3.Text));
    ini.WriteInteger('h', 'Max', StrToInt(edt12.Text));

    ini.WriteInteger('r', 'Min', StrToInt(edt13.Text));
    ini.WriteFloat('r', 'Position', StrToReal(edt4.Text));
    ini.WriteInteger('r', 'Max', StrToInt(edt14.Text));

    ini.WriteInteger('Alpha', 'Min', StrToInt(edt15.Text));
    ini.WriteFloat('Alpha', 'Position', StrToReal(edt5.Text));
    ini.WriteInteger('Alpha', 'Max', StrToInt(edt16.Text));

    ini.WriteInteger('Eo', 'Min', StrToInt(edt17.Text));
    ini.WriteFloat('Eo', 'Position', StrToReal(edt6.Text));
    ini.WriteInteger('Eo', 'Max', StrToInt(edt18.Text));

    ini.Free;
    if lbl8.Caption = 'Save error' then
    lbl8.Caption := '';
   except
     lbl8.Caption := 'Save error';
   end;
  end;
end;
// изменение граничных значений
procedure ChangeBorders();
var
  reserve: Integer;
  g: Real;
begin
  with Form1 do begin
    // если изменилось граничное значение по оси Х
    if cht2.BottomAxis.Maximum <> Max then begin
      cht2.BottomAxis.Maximum := Max;
      cht1.BottomAxis.Maximum := Max;
    end;
    if cht2.BottomAxis.Minimum <> Min then begin
      cht2.BottomAxis.Minimum := Min;
      cht1.BottomAxis.Minimum := Min;
    end;

    // если изменилась как-либо глубина или радиус
    reserve := 0 ;
      cht2.LeftAxis.Maximum := 1000;
      cht2.LeftAxis.Minimum := 0;
      g := cht2.Height /(cht2.Width/Max)/1.25;
      if (H - g < 0) then
        reserve := -Round(H - Round(g))
      else
        cht2.LeftAxis.Minimum := Round(H - g);
      cht2.LeftAxis.Maximum := Round(H + reserve + Round(cht2.Height /(cht2.Width/Max)/1.25));
  end;
end;


function U1(x:real):Real;
begin
    Result := U0 + 2*E0*R*R*(RE /(RE+RI)) * (((X0-x)*cos(Alpha)-H*sin(Alpha)) / (Power(((X0-x)*(X0-x)+H*H), 3/2)));
end;

procedure DrawU();
var
  x,U : Real;
begin
  with Form1 do begin
    x := Min;
    while x < Max do begin
      x := x + 0.01;
      U := U1(x);
      series3.AddXY(x,U);
    end;
  end;
end;

procedure DrawEllipse();
var
  x, y, xmax, ymax, k, b: Real;
begin
  with Form1 do begin
      // рисуем кружек
      x := X0-R - 0.01;
      while x < X0+R do begin
        x := x + 0.01;
        if (R*R-(X0-x)*(X0-x))>0 then
          y:= sqrt(R*R-(X0-x)*(X0-x))
        else
          y := 0;
        series1.AddXY(x,H + y,'',clRed);
        series2.AddXY(x,H - y,'',clRed);
      end;

      //рисуем угол
      x := X0 - 0.01;
      while x < X0+R do begin
        x := x + 0.01;
        series5.AddXY(x, H);
      end;

      x := X0 - 0.01;
      y := H;
      xmax := X0 + R * cos(Alpha);

      // если угол не +/- 90 град
      if (StrToInt(edt5.Text) <> 90) and (StrToInt(edt5.Text) <> 270*K) and ((xmax - X0) <> 0) then begin
        ymax := H + R * Sin(Alpha);
        k := (ymax - H) / (xmax - X0);
        b := H - X0 * k;

        while ((H-y)*(H-y) + (x-X0)*(x-X0)) < R*R do begin
          x := x + 0.01 * Sign(xmax-X0);
          y := k * x + b;
          y := H + Abs(H-y)*sign(H-y); //из за перевернутою оси
          series6.AddXY(x,y);
        end  ;

      // если +/- 90 град
      end else begin
        x:=X0;
        y:=H;
        while (((H-y)*(H-y) + (x-X0)*(x-X0)) < R*R) and (y>0)  do begin
          y := y - 0.01 * Sign(R * Sin(Alpha));
          series6.AddXY(xmax,y);
        end;

      end;
  end;
end;

procedure DrawFunction();
var
  x,y,sum, sump, simplesumm: real;
  i:Integer;
  r_max, r_min:Integer;

begin
  with Form1 do begin
    series1.Clear;
    series2.Clear;
    series3.Clear;
    series5.Clear;
    series6.Clear;

    ReadFunctionValues();
    ChangeBorders();
    DrawU();
    DrawEllipse();

    // подсчет погрешность
    sum := 0;
    sump := 0;
    simplesumm := 0;
    if Assigned(series4) then begin //есть ли полевые данные
      for i:=0 to series4.Count - 1 do begin
        simplesumm := simplesumm+abs(series4.YValues[i]);
        sum := sum + abs(series4.YValues[i] - U1(series4.XValues[i]));
        sump := sump+ abs(series4.YValues[i] - U1(series4.XValues[i]));
      end;
      // округляем до двух знаков после запятой
      if series4.Count = 0 then begin
        dU := 0;
        dUp := 0;
      end else begin
      simplesumm := simplesumm / series4.Count; // средняя У по измеренным
      sump := sump / simplesumm*100; // отклонение от среднего
      dU := SimpleRoundTo(sum / series4.Count, -2);
      dUp := SimpleRoundTo(sump /  series4.Count, -2);
      end;
      lbl7.Caption := 'Погрешности: dU=' + FloatToStr(dU) + 'мВ (dU=' + FloatToStr(dUp) + '%)';
    end;

  end;
end;


// полевые значения
procedure TForm1.btn1Click(Sender: TObject);
var
  x0, y0, z, i, number_of_points:Integer;
  x,y, step, start_x:Real;
  f: textfile;
  buf: string;
begin
 if dlgOpen1.Execute then begin   // если мы жмакнули на файл, то откроем его
      mmo1.Lines.LoadFromFile(dlgOpen1.FileName); //автоматически выводит текст на memo
    try
      AssignFile(f,dlgOpen1.FileName);
      Reset(f);
      readln(f, number_of_points, step, start_x);

      if not Assigned(series4) then begin   // если доселе мы не рисовали график
        series4:=TLineSeries.Create(cht1);
        series4.Pointer.Visible := True; // чтобы точки были квадратиками
        series4.SeriesColor := clGreen;
        series4.Pointer.Visible := True;
        series4.Title := 'Измеренные значения';
        x := start_x;
        i:=0;
        while not EOF(f) do begin
          i := i+1;
          read(f, y);
          series4.AddXY(x,y);
          x := x + step;
        end;
        cht1.AddSeries(series4);
        if series4.Count <> number_of_points then begin
              series4.Clear;
              lbl8.Caption := 'Неверные данные в файле';
              Max := 100;
              Min:=-100;
              Exit;
        end;


      end else begin
        series4.Clear;
        x := start_x;
        i:=0;
        while not EOF(f) do begin
          i := i+1;
          read(f, y);
          series4.AddXY(x,y);
          x := x + step;
        end;
        if series4.Count <> number_of_points then begin
              series4.Clear;
              lbl8.Caption := 'Неверные данные в файле';
              Max := 100;
              Min:=-100;
              Exit;
        end;
      end;
    Min := round(start_x) - 2;
    Max := round(start_x + step*number_of_points);
    ChangeBorders();
    DrawFunction();
    if lbl8.Caption = 'Неверные данные в файле' then
        lbl8.Caption := '';
    except
      series4.Clear;
      lbl8.Caption := 'Неверные данные в файле';
      Max := 100;
      Min:=-100;
    end;

  end;
end;



procedure ChangeMax(edit: TEdit; bar: TScrollBar; msg: string);
var
  i:integer;
begin
  with Form1 do begin
    try
      i := StrToInt(edit.Text);
      if msg <> 'Alpha' then
            i:=i * magnification;
      if (i > bar.Min) and (i >= bar.Position) then begin

        bar.Max := i;
        if lbl8.Caption = 'Error: Неккоректная верхняя граница' + msg then
        lbl8.Caption := '';
      end else
         lbl8.Caption := 'Error: Неккоректная верхняя граница' + msg;
    except
      lbl8.Caption := 'Error: Неккоректная верхняя граница' + msg;
    end;
  end;
end;

procedure ChangeMin(edit: TEdit; bar: TScrollBar; msg: string);
var
  i:integer;
begin
  with Form1 do begin
    try
      i := StrToInt(edit.Text);
      if msg <> 'Alpha' then
            i:=i * magnification;
      if (i < bar.Max) and (i <= bar.Position) then begin

        bar.Min := i ;
        if lbl8.Caption = 'Error: Неккоректная минимальная граница' + msg then
        lbl8.Caption := '';
      end else
         lbl8.Caption := 'Error: Неккоректная минимальная граница' + msg
    except
      lbl8.Caption := 'Error: Неккоректная минимальная граница' + msg;
    end;
  end;
end;

procedure ChangeValue(edit: TEdit; bar: TScrollBar; msg: string);
var
  s: string;
  i: Integer;
  r: Real;
begin
  with Form1 do begin
    s:=edit.Text;
    if s = '' then
      s := '0';
    try
      r := StrToReal(s);
      if msg = 'Alpha' then
        i:=Round(r)
      else
        i := Round(r * magnification);
      if (i <= bar.Max) and (i >= bar.Min) then begin
        DrawFunction();
        bar.Position := i;
        if lbl8.Caption = 'Error: Недопустимое ' + msg then
        lbl8.Caption := '';
      end else
        lbl8.Caption := 'Error: Недопустимое ' + msg;
    except
      lbl8.Caption := 'Error: Недопустимое ' + msg;
    end;
  end;
end;


procedure TForm1.edt1Change(Sender: TObject);
begin
  if who_action <> 1 then begin
    if who_action = 0 then
      who_action := 1;
    ChangeValue(edt1, scrlbr1, 'Uo');
  end;
  if who_action <> 2 then
    who_action := 0;

  WriteDefaultSettings() ;
end;

procedure TForm1.edt7Change(Sender: TObject);
var
  i: Integer;
begin
  // проверяем значение
  ChangeMin(edt7, scrlbr1, 'Uo');
  WriteDefaultSettings() ;
end;

procedure TForm1.scrlbr1Change(Sender: TObject);
begin
  if who_action = 0 then begin
    who_action := 2;
    edt1.Text := FloatToStr(scrlbr1.Position / magnification);
  end;
  if who_action = 2 then
    who_action := 0;
  DrawFunction();
  WriteDefaultSettings() ;
end;

procedure TForm1.scrlbr2Change(Sender: TObject);
begin
    if who_action = 0 then begin
    who_action := 2;
    edt2.Text := FloatToStr(scrlbr2.Position/ magnification);
  end;
  if who_action = 2 then
    who_action := 0;

   DrawFunction();
   WriteDefaultSettings() ;
end;

procedure TForm1.scrlbr3Change(Sender: TObject);
begin
  if who_action = 0 then begin
    who_action := 2;
     edt3.Text := FloatToStr(scrlbr3.Position/ magnification);
  end;
  if who_action = 2 then
    who_action := 0;

 DrawFunction();
 WriteDefaultSettings() ;
end;

procedure TForm1.scrlbr4Change(Sender: TObject);
begin
  if who_action = 0 then begin
    who_action := 2;
     edt4.Text := FloatToStr(scrlbr4.Position / magnification);
  end;
  if who_action = 2 then
    who_action := 0;

      DrawFunction();
      WriteDefaultSettings() ;
end;


procedure TForm1.scrlbr6Change(Sender: TObject);
begin
  if who_action = 0 then begin
    who_action := 2;
    edt6.Text := FloatToStr(scrlbr6.Position / magnification);
  end;
   if who_action = 2 then
    who_action := 0;

      DrawFunction();
      WriteDefaultSettings() ;
end;

procedure TForm1.scrlbr5Change(Sender: TObject);
begin
    if who_action = 0 then begin
    who_action := 2;
    edt5.Text := FloatToStr(scrlbr5.Position);
  end;
   if who_action = 2 then
    who_action := 0;


      DrawFunction();
      WriteDefaultSettings() ;
end;


procedure ReadDefaultSettings();
 var
   ini: TIniFile;
   umin,umax,xmin,xmax,hmin,hmax,amin,amax,emin,emax,rmin,rmax,u,x,h,r,e,a:string;
 begin

 with Form1 do begin
   // Create INI Object and open or create file test.ini
  ini := TIniFile.Create('.\settings.ini');
   try
    umin:= IntToStr(ini.ReadInteger('Uo', 'Min', StrToInt(edt7.Text)));
    umax:= IntToStr(ini.ReadInteger('Uo', 'Max', StrToInt(edt8.Text)));
    u:= FloatToStr(ini.ReadFloat('Uo', 'Position', 0));
    xmax:= IntToStr(ini.ReadInteger('Xo', 'Max', StrToInt(edt10.Text)));
    xmin:= IntToStr(ini.ReadInteger('Xo', 'Min', StrToInt(edt9.Text)));
    x:= FloatToStr(ini.ReadFloat('Xo', 'Position', StrToReal(edt2.Text)));
    hmax:= IntToStr(ini.ReadInteger('h', 'Max', StrToInt(edt12.Text)));
    hmin:= IntToStr(ini.ReadInteger('h', 'Min', -1));
    h:= FloatToStr(ini.ReadFloat('h', 'Position', StrToReal(edt3.Text)));
    rmax:= IntToStr(ini.ReadInteger('r', 'Max', StrToInt(edt14.Text)));
    rmin:= IntToStr(ini.ReadInteger('r', 'Min', StrToInt(edt13.Text)));
    r:= FloatToStr(ini.ReadFloat('r', 'Position', StrToReal(edt4.Text)));
    amax:= IntToStr(ini.ReadInteger('Alpha', 'Max', StrToInt(edt16.Text)));
    amin:= IntToStr(ini.ReadInteger('Alpha', 'Min', StrToInt(edt15.Text)));
    a:= FloatToStr(ini.ReadFloat('Alpha', 'Position', StrToReal(edt5.Text)));
    emax:= IntToStr(ini.ReadInteger('Eo', 'Max', StrToInt(edt18.Text)));
    emin:= IntToStr(ini.ReadInteger('Eo', 'Min', StrToInt(edt17.Text)));
    e:= FloatToStr(ini.ReadFloat('Eo', 'Position', StrToReal(edt6.Text)));

    edt8.Text:= umax;
    scrlbr1.Max := StrToInt(edt8.Text) * magnification;
    edt7.Text:= umin;
    scrlbr1.Min :=  StrToInt(edt7.Text) * magnification;
    edt1.Text:= u;

    edt10.Text:= xmax;
    scrlbr2.Max :=  StrToInt(edt10.Text) * magnification;
    edt9.Text:= xmin;
    scrlbr2.Min := StrToInt(edt9.Text) * magnification;
    edt2.Text:= x;

    edt12.Text:= hmax;
    scrlbr3.Max := StrToInt(edt12.Text) * magnification;
    edt11.Text:= hmin;
    scrlbr3.Min := StrToInt(edt11.Text) * magnification;
    edt3.Text:= h;

    edt14.Text:= rmax;
    scrlbr4.Max := StrToInt(edt14.Text) * magnification;
    edt13.Text:= rmin;
    scrlbr4.Min := StrToInt(edt13.Text) * magnification;
    edt4.Text:= r;

    edt16.Text:= amax;
    scrlbr5.Max := StrToInt(edt16.Text);
    edt15.Text:= amin;
    scrlbr5.Min := StrToInt(edt15.Text);
    edt5.Text:= a;

    edt18.Text:= emax;
    scrlbr6.Max := StrToInt(edt18.Text) * magnification;
    edt17.Text:= emin;
    scrlbr6.Min := StrToInt(edt17.Text) * magnification;
    edt6.Text:= e;

   finally
     ini.Free;
   end;
  end;

 end;

// когда только открылось окошко
procedure TForm1.FormCreate(Sender: TObject);
const
  //Коэффициент для перевода градусов в радианы.
  K = Pi / 180;
var
  Gr, Alpha : Extended;
  fileName:string;
  myFile   : TextFile;
  data     : string;
  i: integer;
  x,y: Real;
begin
  {
  как только форма создается - мы пытаемся заполнить все поля значениями
  по умолчанию и строим график
  }

  who_action := 0;
  cht2.LeftAxis.Automatic := False;
  cht2.BottomAxis.Automatic := False;
  cht1.BottomAxis.Automatic := False;

  cht1.Legend.LegendStyle := lsSeries;
  cht2.Legend.Visible := False;

  series1:=TLineSeries.Create(cht2);
  series1.SeriesColor := clRed;
  series2:=TLineSeries.Create(cht2);
  series2.SeriesColor := clRed;
  series3:=TLineSeries.Create(cht1);
  series3.SeriesColor:=clRed;
  series5:=TLineSeries.Create(cht2);
  series5.SeriesColor := clBlue;
  series6:=TLineSeries.Create(cht2);
  series6.SeriesColor := clBlue;

  Max:=100;
  Min:=-100;

  ReadDefaultSettings();
  ChangeBorders();
  ReadFunctionValues();
  DrawU();
  DrawEllipse();

  cht2.AddSeries(series1);
  cht2.AddSeries(series2);
  cht2.AddSeries(series5);
  cht2.AddSeries(series6);
  series3.Title := 'U(x)';
  cht1.AddSeries(series3);
end;

procedure TForm1.edt8Change(Sender: TObject);
begin
  ChangeMax(edt8, scrlbr1, 'Uo');
  WriteDefaultSettings() ;
end;

procedure TForm1.edt9Change(Sender: TObject);
begin
  ChangeMin(edt9, scrlbr2, 'Xo');
  WriteDefaultSettings() ;
end;

procedure TForm1.edt11Change(Sender: TObject);
begin
  ChangeMin(edt11, scrlbr3, 'h');
  WriteDefaultSettings() ;
end;

procedure TForm1.edt10Change(Sender: TObject);
begin
  ChangeMax(edt10, scrlbr2, 'Xo');
  WriteDefaultSettings() ;
end;

procedure TForm1.edt12Change(Sender: TObject);
begin
  ChangeMax(edt12, scrlbr3, 'h');
  WriteDefaultSettings() ;
end;

procedure TForm1.edt13Change(Sender: TObject);
begin
  ChangeMin(edt13, scrlbr4, 'r');
  WriteDefaultSettings() ;
end;

procedure TForm1.edt14Change(Sender: TObject);
begin
  ChangeMax(edt14, scrlbr4, 'r');
  WriteDefaultSettings() ;
end;

procedure TForm1.edt16Change(Sender: TObject);
begin
  ChangeMax(edt16, scrlbr5, 'Alpha');
  WriteDefaultSettings() ;
end;

procedure TForm1.edt18Change(Sender: TObject);
begin
  ChangeMax(edt18, scrlbr6, 'Eo');
  WriteDefaultSettings() ;
end;

procedure TForm1.edt17Change(Sender: TObject);
begin
  ChangeMin(edt17, scrlbr6, 'Eo');
  WriteDefaultSettings() ;
end;

procedure TForm1.edt15Change(Sender: TObject);
begin
  ChangeMin(edt15, scrlbr5, 'Alpha');
  WriteDefaultSettings() ;
end;

procedure TForm1.edt2Change(Sender: TObject);
begin
    if who_action <> 1 then begin
    if who_action = 0 then
      who_action := 1;
    ChangeValue(edt2, scrlbr2, 'Xo');
  end;
  if  who_action = 1 then
    who_action := 0;
    WriteDefaultSettings() ;
end;

procedure TForm1.edt3Change(Sender: TObject);
begin
if who_action <> 1 then begin
    if who_action = 0 then
      who_action := 1;
ChangeValue(edt3, scrlbr3, 'h');
  end;
  if  who_action = 1 then
    who_action := 0;

WriteDefaultSettings() ;
end;

procedure TForm1.edt4Change(Sender: TObject);
begin
  if who_action <> 1 then begin
    if who_action = 0 then
      who_action := 1;
     ChangeValue(edt4, scrlbr4, 'r');
  end;
  if  who_action = 1 then
    who_action := 0;
WriteDefaultSettings() ;
end;

procedure TForm1.edt5Change(Sender: TObject);
begin
  if who_action = 0 then  begin
      who_action := 1;
      ChangeValue(edt5, scrlbr5, 'Alpha');
  end;
  if who_action = 1 then
    who_action := 0;
WriteDefaultSettings() ;
end;

procedure TForm1.edt6Change(Sender: TObject);
begin
  if who_action <> 1 then begin
    if who_action = 0 then
      who_action := 1;
    ChangeValue(edt6, scrlbr6, 'Eo');
  end;
  if who_action = 1 then
    who_action := 0;
WriteDefaultSettings() ;
end;

// сохранение res
procedure TForm1.btn2Click(Sender: TObject);
var
  FName: string;
  outfile: TextFile;
  saveDialog : TSaveDialog;
begin
  dlgSave1.Filter := 'Res file|*.res';

  // Установка расширения по умолчанию
  dlgSave1.DefaultExt := 'res';
  if dlgSave1.Execute then  begin
    FName := dlgSave1.FileName;
    AssignFile(outfile, FName);
  Rewrite(outfile);
  writeln(outfile, 'Uo=' + edt1.Text + 'мВ');
  writeln(outfile, 'Хo=' + edt2.Text + 'см');
  writeln(outfile, 'h=' + edt3.Text + 'см');
  writeln(outfile, 'r=' + edt4.Text + 'см');
  writeln(outfile, 'Alpha=' + edt5.Text + 'град');
  writeln(outfile, 'Еo=' + edt6.Text + 'мВ');

  if Assigned(series4) then begin
  writeln(outfile, 'dU=' + FloatToStr(dU) + 'мВ');
  writeln(outfile, 'dU='  + FloatToStr(dUp) + '%');
  end;
  CloseFile(outfile);
  end;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  // закрытие окна по кнопке
  WriteDefaultSettings() ;
  Close;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  // отрисовка и проверка значений
DrawFunction();
if scrlbr1.Position <> StrToReal(edt1.Text) * magnification then
  ChangeValue(edt1,scrlbr1,'Uo');

if scrlbr2.Position <> StrToReal(edt2.Text) * magnification then
  ChangeValue(edt2,scrlbr2,'Xo');

if scrlbr3.Position <> StrToReal(edt3.Text) * magnification then
  ChangeValue(edt3,scrlbr3,'h');

if scrlbr4.Position <> StrToReal(edt4.Text) * magnification then
  ChangeValue(edt4,scrlbr4,'r');

if scrlbr5.Position <> StrToReal(edt5.Text) then
  ChangeValue(edt5,scrlbr5,'Alpha');

if scrlbr6.Position <> StrToReal(edt6.Text) * magnification then
  ChangeValue(edt6,scrlbr6,'Eo');
end;

end.
