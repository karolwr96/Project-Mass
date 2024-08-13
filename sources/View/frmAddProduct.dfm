object FormProducts: TFormProducts
  Left = 0
  Top = 0
  Caption = 'Produkt'
  ClientHeight = 425
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblProductName: TLabel
    Left = 32
    Top = 22
    Width = 97
    Height = 15
    Caption = 'Nazwa produktu: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtProductName: TEdit
    Left = 155
    Top = 20
    Width = 150
    Height = 21
    AutoSelect = False
    AutoSize = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
  end
  object btnClose: TButton
    Left = 29
    Top = 64
    Width = 110
    Height = 25
    Action = actClose
    Caption = 'Zamknij'
    TabOrder = 1
  end
  object btnAddProduct: TButton
    Left = 172
    Top = 63
    Width = 110
    Height = 25
    Action = actAddProduct
    Caption = 'Dodaj produkt'
    TabOrder = 2
  end
  object actionListProduct: TActionList
    Left = 44
    Top = 190
    object actClose: TAction
      Caption = 'actClose'
      OnExecute = actCloseExecute
    end
    object actAddProduct: TAction
      Caption = 'actAddProduct'
      OnExecute = actAddProductExecute
    end
  end
  object UniQuery1: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO products (addProduct.Text);')
    Left = 183
    Top = 180
  end
end
