object FActVendProforma: TFActVendProforma
  Left = 240
  Top = 206
  Width = 768
  Height = 352
  Caption = 'Actualiza Vendedores de Proformas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgActProf: TwwDBGrid
    Left = 4
    Top = 72
    Width = 933
    Height = 209
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    KeyOptions = []
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object dblcVendedor: TwwDBLookupCombo
    Left = 344
    Top = 32
    Width = 121
    Height = 21
    DropDownAlignment = taLeftJustify
    Options = [loColLines, loRowLines]
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnEnter = dblcVendedorEnter
    OnExit = dblcVendedorExit
  end
  object cdsActProf: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DMFAC.DCOM1
    ValidateWithMask = True
    Left = 40
    Top = 16
  end
  object dsActProf: TwwDataSource
    DataSet = cdsActProf
    Left = 80
    Top = 16
  end
  object cdsVendedores: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DMFAC.DCOM1
    ValidateWithMask = True
    Left = 248
    Top = 24
  end
  object dsVendedores: TwwDataSource
    DataSet = cdsVendedores
    Left = 288
    Top = 24
  end
end
