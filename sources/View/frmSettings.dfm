object FormSettings: TFormSettings
  Left = 0
  Top = 0
  Caption = 'Ustawienia'
  ClientHeight = 433
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  TextHeight = 15
  object lblDbName: TLabel
    Left = 32
    Top = 8
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Nazwa bazy danych:'
    Color = clBtnFace
    ParentColor = False
    Layout = tlCenter
  end
  object lblDbServer: TLabel
    Left = 32
    Top = 44
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Serwer bazy danych:'
    Layout = tlCenter
  end
  object lblDbUser: TLabel
    Left = 32
    Top = 75
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'U'#380'ytkownik bazy danych:'
    Layout = tlCenter
  end
  object lblDbPassword: TLabel
    Left = 32
    Top = 106
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Has'#322'o u'#380'ytkownika:'
    Layout = tlCenter
  end
  object edtDbName: TEdit
    Left = 202
    Top = 8
    Width = 175
    Height = 25
    AutoSelect = False
    AutoSize = False
    Color = clWhite
    TabOrder = 0
  end
  object edtDbServer: TEdit
    Left = 202
    Top = 39
    Width = 175
    Height = 30
    TabOrder = 1
  end
  object edtDbUser: TEdit
    Left = 202
    Top = 75
    Width = 175
    Height = 25
    TabOrder = 2
  end
  object edtDbPassword: TEdit
    Left = 202
    Top = 106
    Width = 175
    Height = 25
    TabOrder = 3
  end
end
