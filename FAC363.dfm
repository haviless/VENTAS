object FExportaTdaVirtual: TFExportaTdaVirtual
  Left = 440
  Top = 208
  Width = 258
  Height = 250
  Caption = 'Exporta a WEB'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object bbtnExporta: TBitBtn
    Left = 32
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Exportar'
    TabOrder = 0
    OnClick = bbtnExportaClick
  end
  object bbtnCancela: TBitBtn
    Left = 136
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = bbtnCancelaClick
  end
  object StaticText1: TStaticText
    Left = 40
    Top = 16
    Width = 59
    Height = 17
    Caption = 'Compa'#241#237'a :'
    TabOrder = 2
  end
  object edtciaid: TMaskEdit
    Left = 112
    Top = 8
    Width = 25
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 3
    Text = '04'
  end
  object StaticText2: TStaticText
    Left = 48
    Top = 42
    Width = 51
    Height = 17
    Caption = 'Almac'#233'n :'
    TabOrder = 4
  end
  object edtalmid: TMaskEdit
    Left = 112
    Top = 36
    Width = 25
    Height = 21
    TabOrder = 5
    Text = '31'
  end
  object StaticText3: TStaticText
    Left = 17
    Top = 68
    Width = 85
    Height = 17
    Caption = 'Lista de Precios :'
    TabOrder = 6
  end
  object StaticText4: TStaticText
    Left = 59
    Top = 94
    Width = 40
    Height = 17
    Caption = 'Fecha :'
    TabOrder = 7
  end
  object edtlprecios: TMaskEdit
    Left = 112
    Top = 64
    Width = 33
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
  end
  object edtfecha: TMaskEdit
    Left = 112
    Top = 92
    Width = 65
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 9
    Text = '  /  /    '
  end
  object StaticText5: TStaticText
    Left = 54
    Top = 120
    Width = 45
    Height = 17
    Caption = 'Versi'#243'n :'
    TabOrder = 10
  end
  object edtversion: TMaskEdit
    Left = 112
    Top = 120
    Width = 25
    Height = 21
    TabOrder = 11
  end
end
