object FormAddContractor: TFormAddContractor
  Left = 0
  Top = 8
  Caption = 'Dodaj kontrahenta'
  ClientHeight = 425
  ClientWidth = 620
  Color = clBtnFace
  Constraints.MinHeight = 425
  Constraints.MinWidth = 620
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 15
  object lblContractorName: TLabel
    Left = 116
    Top = 74
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Nazwa przedsi'#281'biorstwa'
    Layout = tlCenter
  end
  object lblPostCode: TLabel
    Left = 116
    Top = 114
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Kod pocztowy'
    Layout = tlCenter
  end
  object lblTown: TLabel
    Left = 116
    Top = 154
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Miejscowo'#347#263
    Layout = tlCenter
  end
  object lblStreet: TLabel
    Left = 116
    Top = 194
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Ulica'
    Layout = tlCenter
  end
  object lblHouseNumber: TLabel
    Left = 116
    Top = 234
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Nr budynku'
    Layout = tlCenter
  end
  object edtContractorName: TEdit
    Left = 292
    Top = 76
    Width = 199
    Height = 25
    AutoSelect = False
    AutoSize = False
    TabOrder = 0
  end
  object edtPostCode: TEdit
    Left = 292
    Top = 116
    Width = 199
    Height = 25
    AutoSelect = False
    AutoSize = False
    TabOrder = 1
  end
  object edtTown: TEdit
    Left = 292
    Top = 156
    Width = 199
    Height = 25
    AutoSelect = False
    AutoSize = False
    TabOrder = 2
  end
  object edtStreet: TEdit
    Left = 292
    Top = 196
    Width = 199
    Height = 25
    AutoSelect = False
    AutoSize = False
    TabOrder = 3
  end
  object edtHouseNumer: TEdit
    Left = 292
    Top = 236
    Width = 199
    Height = 25
    AutoSelect = False
    AutoSize = False
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  object btnClose: TButton
    Left = 135
    Top = 280
    Width = 140
    Height = 25
    Action = actClose
    Caption = 'Zamknij'
    TabOrder = 5
  end
  object btnAddContractor: TButton
    Left = 318
    Top = 279
    Width = 140
    Height = 25
    Caption = 'Zapisz'
    TabOrder = 6
  end
  object pnlBottomContractor: TPanel
    Left = 0
    Top = 384
    Width = 620
    Height = 41
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 7
    ExplicitLeft = 49
    ExplicitTop = 417
    ExplicitWidth = 185
  end
  object pnlTopContractor: TPanel
    Left = 0
    Top = 0
    Width = 620
    Height = 41
    Align = alTop
    Caption = 'Dane nowego kontrahenta'
    Color = clWhite
    ParentBackground = False
    TabOrder = 8
    ExplicitLeft = 1
    ExplicitTop = 1
  end
  object actContractor: TActionList
    Left = 856
    Top = 256
    object actClose: TAction
      Caption = 'actClose'
      OnExecute = actCloseExecute
    end
    object actAddContractor: TAction
      Caption = 'actAddContractor'
    end
  end
end
