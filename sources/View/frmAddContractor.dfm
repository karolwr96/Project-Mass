object FormAddContractor: TFormAddContractor
  Left = 0
  Top = 8
  Caption = 'Dodaj kontrahenta'
  ClientHeight = 425
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object lblContractorName: TLabel
    Left = 32
    Top = 8
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Nazwa przedsi'#281'biorstwa'
    Layout = tlCenter
  end
  object lblPostCode: TLabel
    Left = 32
    Top = 48
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Kod pocztowy'
    Layout = tlCenter
  end
  object lblTown: TLabel
    Left = 32
    Top = 88
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Miejscowo'#347#263
    Layout = tlCenter
  end
  object lblStreet: TLabel
    Left = 32
    Top = 128
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Ulica'
    Layout = tlCenter
  end
  object lblHouseNumber: TLabel
    Left = 32
    Top = 168
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Nr budynku'
    Layout = tlCenter
  end
  object edtContractorName: TEdit
    Left = 208
    Top = 10
    Width = 199
    Height = 25
    AutoSelect = False
    AutoSize = False
    TabOrder = 0
  end
  object edtPostCode: TEdit
    Left = 208
    Top = 50
    Width = 199
    Height = 25
    AutoSelect = False
    AutoSize = False
    TabOrder = 1
  end
  object edtTown: TEdit
    Left = 208
    Top = 90
    Width = 199
    Height = 25
    AutoSelect = False
    AutoSize = False
    TabOrder = 2
  end
  object edtStreet: TEdit
    Left = 208
    Top = 130
    Width = 199
    Height = 25
    AutoSelect = False
    AutoSize = False
    TabOrder = 3
  end
  object edtHouseNumer: TEdit
    Left = 208
    Top = 170
    Width = 199
    Height = 25
    AutoSelect = False
    AutoSize = False
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  object btnClose: TButton
    Left = 208
    Top = 216
    Width = 99
    Height = 25
    Action = actClose
    Caption = 'Zamknij'
    TabOrder = 5
  end
  object btnAddContractor: TButton
    Left = 311
    Top = 216
    Width = 96
    Height = 25
    Caption = 'Zapisz'
    TabOrder = 6
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
