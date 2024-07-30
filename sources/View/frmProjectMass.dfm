object FormProjectMass: TFormProjectMass
  Left = 0
  Top = 0
  Caption = 'Program Projekt Masa'
  ClientHeight = 425
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object barMain: TToolBar
    Left = 0
    Top = 0
    Width = 620
    Height = 25
    ButtonHeight = 23
    ButtonWidth = 105
    Caption = 'barMain'
    Color = clBtnFace
    ParentColor = False
    ShowCaptions = True
    TabOrder = 0
    ExplicitWidth = 622
    object btnClose: TToolButton
      Left = 0
      Top = 0
      Caption = 'Zamknij'
      OnClick = actCloseExecute
    end
    object separatorBarMain1: TToolButton
      Left = 131
      Top = 0
      Width = 8
      Caption = 'separatorBarMain1'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnOpenSettings: TToolButton
      Left = 139
      Top = 0
      Caption = 'Ustawienia'
      ImageIndex = 1
      OnClick = actSettingsExecute
    end
    object separatorBarMain2: TToolButton
      Left = 270
      Top = 0
      Width = 8
      Caption = 'separatorBarMain2'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object btnAddContractor: TToolButton
      Left = 278
      Top = 0
      Caption = 'Dodaj kontrahenta'
      OnClick = actContractorExecute
    end
    object separatorBarMain3: TToolButton
      Left = 409
      Top = 0
      Width = 8
      Caption = 'separatorBarMain3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnAddProduct: TToolButton
      Left = 417
      Top = 0
      Caption = 'Dodaj produkt'
      ImageIndex = 3
    end
  end
  object actionListMainMenu: TActionList
    Left = 80
    Top = 168
    object actClose: TAction
      Caption = 'actClose'
      OnExecute = actCloseExecute
    end
    object actSettings: TAction
      Caption = 'actSettings'
      OnExecute = actSettingsExecute
    end
    object actContractor: TAction
      Caption = 'Action1'
      OnExecute = actContractorExecute
    end
  end
end
