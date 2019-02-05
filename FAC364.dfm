object FImportaTdaVirtual: TFImportaTdaVirtual
  Left = 482
  Top = 179
  Width = 250
  Height = 215
  Caption = 'Importa desde WEB'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 40
    Top = 16
    Width = 59
    Height = 17
    Caption = 'Compa'#241#237'a :'
    TabOrder = 0
  end
  object StaticText4: TStaticText
    Left = 59
    Top = 41
    Width = 40
    Height = 17
    Caption = 'Fecha :'
    TabOrder = 1
  end
  object StaticText5: TStaticText
    Left = 54
    Top = 71
    Width = 45
    Height = 17
    Caption = 'Versi'#243'n :'
    TabOrder = 2
    Visible = False
  end
  object edtciaid: TMaskEdit
    Left = 112
    Top = 8
    Width = 24
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 3
    Text = '04'
  end
  object edtfecha: TMaskEdit
    Left = 112
    Top = 38
    Width = 65
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
  end
  object edtversion: TMaskEdit
    Left = 112
    Top = 68
    Width = 25
    Height = 21
    Enabled = False
    TabOrder = 5
    Visible = False
  end
  object bbtnImporta: TBitBtn
    Left = 32
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 6
    OnClick = bbtnImportaClick
  end
  object bbtnCancela: TBitBtn
    Left = 136
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 7
    OnClick = bbtnCancelaClick
  end
end
