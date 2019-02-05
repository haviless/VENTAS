object FNCredito: TFNCredito
  Left = 321
  Top = 225
  Width = 820
  Height = 371
  Caption = 'Generar Nota de Credito'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 179
    Top = 91
    Width = 59
    Height = 26
    Caption = 'Nro Nota Ingreso   :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label6: TLabel
    Left = 610
    Top = 91
    Width = 107
    Height = 13
    Caption = '[T]otal / [P]arcial :'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 589
    Top = 156
    Width = 109
    Height = 13
    Caption = 'Motivo NC Sunat  :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 591
    Top = 125
    Width = 87
    Height = 13
    Caption = 'Monto Parcial :'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 23
    Top = 1
    Width = 554
    Height = 80
    Caption = ' Documento de Referencia '
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label8: TLabel
      Left = 22
      Top = 25
      Width = 27
      Height = 13
      Caption = 'Cia :'
      Enabled = False
    end
    object Label1: TLabel
      Left = 110
      Top = 23
      Width = 61
      Height = 13
      Caption = 'Tipo Doc :'
      Enabled = False
    end
    object Label9: TLabel
      Left = 305
      Top = 22
      Width = 38
      Height = 13
      Caption = 'Serie :'
      Enabled = False
    end
    object Label10: TLabel
      Left = 399
      Top = 22
      Width = 52
      Height = 13
      Caption = 'NroDoc :'
      Enabled = False
    end
    object Label3: TLabel
      Left = 117
      Top = 52
      Width = 52
      Height = 13
      Caption = 'Cliente  :'
      Enabled = False
    end
  end
  object dblcTdoc: TEdit
    Left = 199
    Top = 22
    Width = 23
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 2
  end
  object dblcSerie: TEdit
    Left = 369
    Top = 20
    Width = 32
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 3
  end
  object dblcNfac: TEdit
    Left = 477
    Top = 19
    Width = 77
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 4
  end
  object dblcNI: TEdit
    Left = 736
    Top = 17
    Width = 49
    Height = 21
    Color = clBtnFace
    TabOrder = 6
    Visible = False
  end
  object dblcCia: TEdit
    Left = 77
    Top = 21
    Width = 28
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 1
  end
  object dblcTotPa: TComboBox
    Left = 735
    Top = 86
    Width = 34
    Height = 21
    Enabled = False
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 7
    Text = 'T'
    OnClick = dblcTotPaClick
    OnExit = dblcTotPaExit
    Items.Strings = (
      'T'
      'P')
  end
  object dblcTipNC: TwwDBLookupCombo
    Left = 726
    Top = 151
    Width = 41
    Height = 21
    DropDownAlignment = taLeftJustify
    TabOrder = 8
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnChange = dblcTipNCChange
    OnClick = dblcTipNCClick
    OnExit = dblcTipNCExit
  end
  object sbtnGenerar: TfcShapeBtn
    Left = 605
    Top = 258
    Width = 75
    Height = 25
    Caption = 'Generar'
    Color = 10207162
    DitherColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentClipping = True
    ParentFont = False
    RoundRectBias = 25
    ShadeStyle = fbsHighlight
    TabOrder = 10
    TextOptions.Alignment = taCenter
    TextOptions.OutlineColor = clGreen
    TextOptions.ShadeColor = clGreen
    TextOptions.VAlignment = vaVCenter
    OnClick = sbtnGenerarClick
  end
  object sbtnCancelar: TfcShapeBtn
    Left = 709
    Top = 258
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Color = 10207162
    DitherColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    NumGlyphs = 0
    ParentClipping = True
    ParentFont = False
    RoundRectBias = 25
    ShadeStyle = fbsHighlight
    TabOrder = 11
    TextOptions.Alignment = taCenter
    TextOptions.OutlineColor = clGreen
    TextOptions.ShadeColor = clGreen
    TextOptions.VAlignment = vaVCenter
    OnClick = sbtnCancelarClick
  end
  object cbDevMerca: TCheckBox
    Left = 48
    Top = 80
    Width = 100
    Height = 49
    Alignment = taLeftJustify
    AllowGrayed = True
    BiDiMode = bdRightToLeft
    Caption = 'Devoluci'#243'n Mercader'#237'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 5
    WordWrap = True
    OnClick = cbDevMercaClick
    OnExit = cbDevMercaExit
  end
  object edtTipoNC: TEdit
    Left = 594
    Top = 191
    Width = 205
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 9
  end
  object dblcdNisa: TwwDBLookupComboDlg
    Left = 245
    Top = 95
    Width = 104
    Height = 21
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    GridColor = clWhite
    GridTitleAlignment = taLeftJustify
    Caption = 'Lookup'
    MaxWidth = 0
    MaxHeight = 209
    OnCloseDialog = dblcdNisaCloseDialog
    TabOrder = 12
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcdNisaExit
  end
  object Panel1: TPanel
    Left = 20
    Top = 128
    Width = 557
    Height = 202
    TabOrder = 14
  end
  object dbgDetalleNIngreso: TwwDBGrid
    Left = 23
    Top = 126
    Width = 546
    Height = 187
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
    ReadOnly = True
    TabOrder = 13
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object dblcMntPa: TEdit
    Left = 688
    Top = 120
    Width = 81
    Height = 21
    Enabled = False
    TabOrder = 15
  end
  object dblcTdocdes: TEdit
    Left = 227
    Top = 21
    Width = 81
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 16
  end
  object dblcClieDes: TEdit
    Left = 198
    Top = 51
    Width = 355
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 17
  end
end
