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
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object lblDbName: TLabel
    Left = 32
    Top = 8
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Lokalizacja bazy danych:'
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
    Top = 83
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'U'#380'ytkownik bazy danych:'
    Layout = tlCenter
  end
  object lblDbPassword: TLabel
    Left = 32
    Top = 122
    Width = 175
    Height = 25
    AutoSize = False
    Caption = 'Has'#322'o u'#380'ytkownika:'
    Layout = tlCenter
  end
  object edtDbName: TEdit
    Left = 202
    Top = 10
    Width = 199
    Height = 25
    AutoSelect = False
    AutoSize = False
    Color = clWhite
    TabOrder = 0
  end
  object edtDbServer: TEdit
    Left = 202
    Top = 46
    Width = 199
    Height = 23
    TabOrder = 1
  end
  object edtDbUser: TEdit
    Left = 201
    Top = 85
    Width = 199
    Height = 23
    TabOrder = 2
  end
  object edtDbPassword: TEdit
    Left = 201
    Top = 124
    Width = 199
    Height = 23
    TabOrder = 3
  end
  object btnSaveSettings: TButton
    Left = 304
    Top = 161
    Width = 96
    Height = 25
    Action = actSaveSettings
    Caption = 'Zapisz'
    TabOrder = 4
  end
  object btnClose: TButton
    Left = 202
    Top = 161
    Width = 96
    Height = 25
    Action = actCloseSettings
    Caption = 'Zamknij'
    TabOrder = 5
  end
  object actSettings: TActionList
    Left = 32
    Top = 272
    object actCloseSettings: TAction
      Caption = 'actCloseSettings'
      OnExecute = actCloseSettingsExecute
    end
    object actSaveSettings: TAction
      Caption = 'actSaveSettings'
      OnExecute = actSaveSettingsExecute
    end
  end
end
