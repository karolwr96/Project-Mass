object FormAddContractor: TFormAddContractor
  Left = 0
  Top = 8
  Caption = 'Dodaj kontrahenta'
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
  object actAddContractor: TActionList
    Left = 40
    Top = 280
  end
end
