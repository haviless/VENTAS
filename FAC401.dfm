object FAgregarObsequio: TFAgregarObsequio
  Left = 221
  Top = 267
  BorderStyle = bsDialog
  Caption = 'Agregar Obsequio'
  ClientHeight = 233
  ClientWidth = 480
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 480
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object Label3: TLabel
      Left = 9
      Top = 9
      Width = 66
      Height = 23
      Caption = 'Producto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbtnFiltra: TBitBtn
      Left = 340
      Top = 8
      Width = 109
      Height = 28
      Caption = 'Filtrar Productos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bbtnFiltraClick
      Margin = 4
    end
    object edFiltro: TEdit
      Left = 80
      Top = 12
      Width = 257
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 1
      OnKeyPress = edFiltroKeyPress
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 195
    Width = 480
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = True
    ParentColor = True
    ParentCtl3D = False
    TabOrder = 1
    DesignSize = (
      480
      38)
    object btnCancelar: TButton
      Left = 381
      Top = 8
      Width = 91
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Terminar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnAgregar: TButton
      Left = 285
      Top = 8
      Width = 91
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Agregar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAgregarClick
    end
  end
  object dbgData: TwwDBGrid
    Left = 0
    Top = 49
    Width = 480
    Height = 146
    DisableThemesInTitle = False
    Selected.Strings = (
      'ARTID'#9'9'#9'CODIGO'
      'ARTDES'#9'52'#9'PRODUCTO'
      'RANGO_INI'#9'10'#9'RANGO MIN'
      'RANGO_FIN'#9'10'#9'RANGO MAX'
      'EMICARTA'#9'8'#9'EMI. CARTA'
      'ACTIVO'#9'6'#9'ACTIVO')
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    KeyOptions = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgFooter3DCells]
    ParentFont = False
    TabOrder = 2
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgDataDblClick
    FooterColor = 7566265
    FooterHeight = 28
  end
end
