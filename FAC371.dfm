object FVentaDcto: TFVentaDcto
  Left = 341
  Top = 356
  Width = 420
  Height = 254
  BorderIcons = [biSystemMenu]
  Caption = 'Factura / Boleta de Venta'
  Color = clBtnFace
  Constraints.MaxHeight = 254
  Constraints.MaxWidth = 420
  Constraints.MinHeight = 254
  Constraints.MinWidth = 420
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 57
    Top = 2
    Width = 300
    Height = 37
    Caption = 'Descuento Especial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 15
    Top = 48
    Width = 115
    Height = 16
    Caption = 'Tipo de Moneda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 225
    Top = 48
    Width = 53
    Height = 16
    Caption = 'Importe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Bevel2: TBevel
    Left = 4
    Top = 180
    Width = 406
    Height = 4
  end
  object Bevel3: TBevel
    Left = 4
    Top = 40
    Width = 406
    Height = 4
  end
  object Panel1: TPanel
    Left = 200
    Top = 66
    Width = 199
    Height = 112
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 3
    object Label3: TLabel
      Left = 111
      Top = 10
      Width = 81
      Height = 16
      Caption = 'Total Venta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 111
      Top = 84
      Width = 86
      Height = 16
      Caption = 'Nuevo Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 111
      Top = 42
      Width = 75
      Height = 16
      Caption = 'Descuento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 4
      Top = 69
      Width = 194
      Height = 4
    end
    object dbeTotVta: TwwDBEdit
      Left = 9
      Top = 3
      Width = 90
      Height = 24
      Color = clBtnFace
      DataField = 'TOTVTA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNewTot: TwwDBEdit
      Left = 9
      Top = 79
      Width = 90
      Height = 24
      Color = clBtnFace
      DataField = 'NEWTOT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object bbtnDctoFact: TBitBtn
    Left = 204
    Top = 188
    Width = 97
    Height = 29
    Caption = 'Descuento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
    OnClick = bbtnDctoFactClick
  end
  object dbeImpDcto: TwwDBEdit
    Left = 209
    Top = 104
    Width = 90
    Height = 24
    DataField = 'IMPORTE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    Picture.PictureMask = '#[*#][.[#][#]]'
    TabOrder = 1
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
    OnExit = dbeImpDctoExit
  end
  object bbtnCerrar: TBitBtn
    Left = 333
    Top = 188
    Width = 65
    Height = 29
    Caption = 'Cerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = bbtnCerrarClick
  end
  object Panel2: TPanel
    Left = 6
    Top = 66
    Width = 189
    Height = 33
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 4
    object dblcTMon: TwwDBLookupCombo
      Left = 7
      Top = 4
      Width = 45
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'Id'#9'F'
        'TMONDES'#9'25'#9'Moneda'#9'F')
      DataField = 'TMONID'
      Options = [loColLines, loTitles]
      Color = clBtnFace
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object edtTMon: TEdit
      Left = 53
      Top = 4
      Width = 130
      Height = 23
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object bbtnDctoProf: TBitBtn
    Left = 226
    Top = 188
    Width = 97
    Height = 29
    Caption = 'Descuento '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Visible = False
    OnClick = bbtnDctoProfClick
  end
end
