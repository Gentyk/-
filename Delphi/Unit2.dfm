object Form1: TForm1
  Left = 213
  Top = 142
  Width = 962
  Height = 657
  Caption = #1043#1088#1072#1092#1080#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl7: TLabel
    Left = 0
    Top = 192
    Width = 2
    Height = 13
    Caption = 'l'
  end
  object lbl8: TLabel
    Left = 432
    Top = 192
    Width = 3
    Height = 13
  end
  object mmo1: TMemo
    Left = 0
    Top = 24
    Width = 897
    Height = 57
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 80
    Width = 425
    Height = 113
    TabOrder = 1
    object lbl1: TLabel
      Left = 8
      Top = 32
      Width = 42
      Height = 16
      Caption = 'Uo, '#1084#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 8
      Top = 56
      Width = 42
      Height = 16
      Caption = #1061'o, '#1089#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 8
      Top = 80
      Width = 33
      Height = 16
      Caption = 'h, '#1089#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt1: TEdit
      Left = 56
      Top = 32
      Width = 57
      Height = 21
      TabOrder = 0
      Text = '0'
      OnChange = edt1Change
    end
    object edt2: TEdit
      Left = 56
      Top = 56
      Width = 57
      Height = 21
      TabOrder = 1
      Text = '12'
      OnChange = edt2Change
    end
    object edt3: TEdit
      Left = 56
      Top = 80
      Width = 57
      Height = 21
      TabOrder = 2
      Text = '5'
      OnChange = edt3Change
    end
    object scrlbr1: TScrollBar
      Left = 224
      Top = 32
      Width = 121
      Height = 17
      Min = -100
      PageSize = 0
      TabOrder = 3
      OnChange = scrlbr1Change
    end
    object scrlbr2: TScrollBar
      Left = 224
      Top = 56
      Width = 121
      Height = 17
      Min = -100
      PageSize = 0
      TabOrder = 4
      OnChange = scrlbr2Change
    end
    object scrlbr3: TScrollBar
      Left = 224
      Top = 80
      Width = 121
      Height = 17
      PageSize = 0
      Position = 5
      TabOrder = 5
      OnChange = scrlbr3Change
    end
    object edt7: TEdit
      Left = 160
      Top = 32
      Width = 57
      Height = 21
      TabOrder = 6
      Text = '-100'
      OnChange = edt7Change
    end
    object edt8: TEdit
      Left = 352
      Top = 32
      Width = 57
      Height = 21
      TabOrder = 7
      Text = '100'
      OnChange = edt8Change
    end
    object edt9: TEdit
      Left = 160
      Top = 56
      Width = 57
      Height = 21
      TabOrder = 8
      Text = '-100'
      OnChange = edt9Change
    end
    object edt10: TEdit
      Left = 352
      Top = 56
      Width = 57
      Height = 21
      TabOrder = 9
      Text = '100'
      OnChange = edt10Change
    end
    object edt11: TEdit
      Left = 160
      Top = 80
      Width = 57
      Height = 21
      TabOrder = 10
      Text = '0'
      OnChange = edt11Change
    end
    object edt12: TEdit
      Left = 352
      Top = 80
      Width = 57
      Height = 21
      TabOrder = 11
      Text = '100'
      OnChange = edt12Change
    end
  end
  object pnl2: TPanel
    Left = 424
    Top = 80
    Width = 473
    Height = 113
    TabOrder = 2
    object lbl5: TLabel
      Left = 16
      Top = 56
      Width = 76
      Height = 16
      Caption = 'Alpha, '#1075#1088#1072#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl6: TLabel
      Left = 48
      Top = 80
      Width = 41
      Height = 16
      Caption = #1045'o, '#1084#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 48
      Top = 32
      Width = 31
      Height = 16
      Caption = 'r, '#1089#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt6: TEdit
      Left = 96
      Top = 80
      Width = 57
      Height = 21
      TabOrder = 0
      Text = '200'
      OnChange = edt6Change
    end
    object scrlbr6: TScrollBar
      Left = 264
      Top = 80
      Width = 121
      Height = 17
      Max = 1000
      PageSize = 0
      Position = 200
      TabOrder = 1
      OnChange = scrlbr6Change
    end
    object edt5: TEdit
      Left = 96
      Top = 56
      Width = 57
      Height = 21
      TabOrder = 2
      Text = '90'
      OnChange = edt5Change
    end
    object scrlbr5: TScrollBar
      Left = 264
      Top = 56
      Width = 121
      Height = 17
      Max = 360
      PageSize = 0
      Position = 90
      TabOrder = 3
      OnChange = scrlbr5Change
    end
    object scrlbr4: TScrollBar
      Left = 264
      Top = 32
      Width = 121
      Height = 17
      PageSize = 0
      Position = 2
      TabOrder = 4
      OnChange = scrlbr4Change
    end
    object edt4: TEdit
      Left = 96
      Top = 32
      Width = 57
      Height = 21
      TabOrder = 5
      Text = '2'
      OnChange = edt4Change
    end
    object edt13: TEdit
      Left = 200
      Top = 32
      Width = 57
      Height = 21
      TabOrder = 6
      Text = '0'
      OnChange = edt13Change
    end
    object edt14: TEdit
      Left = 392
      Top = 32
      Width = 57
      Height = 21
      TabOrder = 7
      Text = '100'
      OnChange = edt14Change
    end
    object edt15: TEdit
      Left = 200
      Top = 56
      Width = 57
      Height = 21
      TabOrder = 8
      Text = '0'
      OnChange = edt15Change
    end
    object edt16: TEdit
      Left = 392
      Top = 56
      Width = 57
      Height = 21
      TabOrder = 9
      Text = '360'
      OnChange = edt16Change
    end
    object edt17: TEdit
      Left = 200
      Top = 80
      Width = 57
      Height = 21
      TabOrder = 10
      Text = '0'
      OnChange = edt17Change
    end
    object edt18: TEdit
      Left = 392
      Top = 80
      Width = 57
      Height = 21
      TabOrder = 11
      Text = '1000'
      OnChange = edt18Change
    end
  end
  object cht1: TChart
    Left = 0
    Top = 216
    Width = 897
    Height = 250
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = #1061', '#1089#1084
    LeftAxis.LabelsSize = 30
    LeftAxis.Title.Caption = 'U, '#1084#1042
    Legend.Alignment = laTop
    View3D = False
    TabOrder = 3
    object lnsrsSeries1: TLineSeries
      Active = False
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object cht2: TChart
    Left = 0
    Top = 464
    Width = 897
    Height = 153
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    LeftAxis.Inverted = True
    LeftAxis.LabelsSize = 30
    LeftAxis.Title.Caption = 'H, '#1089#1084
    View3D = False
    TabOrder = 4
  end
  object pnl3: TPanel
    Left = 0
    Top = 0
    Width = 897
    Height = 25
    TabOrder = 5
    object btn1: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 25
      Caption = 'open'
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 72
      Top = 0
      Width = 65
      Height = 25
      Caption = 'save me'
      TabOrder = 1
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 136
      Top = 0
      Width = 75
      Height = 25
      Caption = 'exit'
      TabOrder = 2
      OnClick = btn3Click
    end
  end
  object dlgOpen1: TOpenDialog
    Left = 616
    Top = 32
  end
  object dlgSave1: TSaveDialog
    Left = 656
    Top = 40
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 128
    Top = 40
  end
end
