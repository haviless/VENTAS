object FActVendFactura: TFActVendFactura
  Left = 128
  Top = 160
  Width = 959
  Height = 323
  Caption = 'Actualiza Vendedor de Boleta/Factura'
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
  object Label1: TLabel
    Left = 136
    Top = 16
    Width = 79
    Height = 13
    Caption = 'Fecha de Inicio  '
  end
  object Label2: TLabel
    Left = 296
    Top = 16
    Width = 61
    Height = 13
    Caption = 'Fecha Final  '
  end
  object dbgActBolyFac: TwwDBGrid
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
    Left = 384
    Top = 136
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
  object wwDBDateTimePicker1: TwwDBDateTimePicker
    Left = 136
    Top = 30
    Width = 121
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 2
  end
  object wwDBDateTimePicker2: TwwDBDateTimePicker
    Left = 296
    Top = 30
    Width = 121
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 3
  end
  object Seleccionar: TBitBtn
    Left = 448
    Top = 29
    Width = 75
    Height = 25
    Caption = 'Seleccionar'
    TabOrder = 4
    OnClick = SeleccionarClick
  end
  object cdsBolyFac: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DMFAC.DCOM1
    ValidateWithMask = True
    Left = 392
    Top = 96
  end
  object dsBolyFac: TwwDataSource
    DataSet = cdsBolyFac
    Left = 432
    Top = 96
  end
  object cdsVendedores: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DMFAC.DCOM1
    ValidateWithMask = True
    Left = 248
    Top = 120
  end
  object dsVendedores: TwwDataSource
    DataSet = cdsVendedores
    Left = 312
    Top = 144
  end
end
