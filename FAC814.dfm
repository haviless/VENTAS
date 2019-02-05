object FCompras: TFCompras
  Left = 82
  Top = 38
  Width = 1000
  Height = 680
  Caption = 'Compras por Punto de venta'
  Color = 14869218
  Constraints.MaxHeight = 900
  Constraints.MaxWidth = 1200
  Constraints.MinHeight = 660
  Constraints.MinWidth = 1000
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgData: TwwDBGrid
    Left = 8
    Top = 157
    Width = 975
    Height = 479
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ReadOnly = True
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 3
    TitleButtons = False
    OnCalcCellColors = dbgDataCalcCellColors
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 992
    Height = 157
    Align = alTop
    Color = 14869218
    TabOrder = 1
    object Label2: TLabel
      Left = 24
      Top = 4
      Width = 51
      Height = 16
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label18: TLabel
      Left = 312
      Top = 4
      Width = 88
      Height = 16
      Caption = 'Punto de Venta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 845
      Top = 3
      Width = 4
      Height = 148
    end
    object Label17: TLabel
      Left = 24
      Top = 52
      Width = 30
      Height = 16
      Caption = 'L'#237'nea'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 239
      Top = 52
      Width = 39
      Height = 16
      Caption = 'Familia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 456
      Top = 52
      Width = 60
      Height = 16
      Caption = 'SubFamilia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 101
      Width = 37
      Height = 16
      Caption = 'Marca'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 454
      Top = 101
      Width = 45
      Height = 16
      Caption = 'Articulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblcCia: TwwDBLookupCombo
      Left = 18
      Top = 23
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
        'CIAID'#9'2'#9'Id'#9'F'
        'CIADES'#9'30'#9'Compa'#241'ia'#9'F')
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      AutoSelect = False
      DropDownCount = 15
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCiaExit
      OnNotInList = dblcCiaNotInList
    end
    object edtCia: TEdit
      Left = 64
      Top = 23
      Width = 225
      Height = 23
      AutoSize = False
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dblcTienda: TwwDBLookupCombo
      Left = 306
      Top = 23
      Width = 44
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIE_ID'#9'2'#9'Id'#9'F'
        'TIE_DES'#9'40'#9'Pto.Venta'#9'F')
      LookupField = 'TIE_ID'
      Options = [loColLines, loTitles]
      ParentFont = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnEnter = dblcTiendaEnter
      OnExit = dblcTiendaExit
      OnNotInList = dblcTiendaNotInList
    end
    object edtTienda: TEdit
      Left = 351
      Top = 23
      Width = 160
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Z2bbtnAcepta: TBitBtn
      Left = 787
      Top = 104
      Width = 49
      Height = 45
      Hint = 'Procesar Informaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = Z2bbtnAceptaClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object bbtnExcel: TBitBtn
      Left = 866
      Top = 105
      Width = 89
      Height = 35
      Hint = 'Exportar a Excel'
      Caption = 'Exportar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = bbtnExcelClick
      Glyph.Data = {
        16080000424D160800000000000036000000280000001B000000180000000100
        180000000000E0070000C40E0000C40E00000000000000000000B0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BC00
        0000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BC000000000000B0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC0000000000000000000000000000
        00B0A7BCB0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BC000000000000B0A7BCB0A7BC000000B0A7BC000000B0A7
        BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BCB0A7BC
        000000B0A7BCB0A7BCB0A7BC000000000000B0A7BC0080008080800080008080
        8000800080808000800080808000800080808000800080808000800080808000
        8000808080B0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        000000000000B0A7BC8080800080008080800080008080800080008080800080
        00808080008000808080008000808080008000808080008000B0A7BC000000B0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000000000B0A7BC008000
        808080B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BC008000808080B0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BC000000000000B0A7BC808080008000B0A7BCB0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BC8080800080008080800080008080808080800080
        00B0A7BC000000B0A7BCB0A7BCB0A7BC000000B0A7BCB0A7BC000000B0A7BC00
        0000B0A7BC008000808080B0A7BC008000808080008000808080008000808080
        008000B0A7BC008000808080008000008000808080B0A7BCB0A7BC000000B0A7
        BCB0A7BC000000000000B0A7BCB0A7BCB0A7BC000000B0A7BC808080008000B0
        A7BC808080008000808080008000808080008000B0A7BC008000808080008000
        B0A7BC808080008000B0A7BCB0A7BCB0A7BC0000000000000000000000000000
        00B0A7BCB0A7BC000000B0A7BC008000808080B0A7BC00800080808000800080
        8080008000B0A7BC008000808080008000808080B0A7BC008000808080B0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BC000000000000B0A7BCB0A7BCB0A7BC000000B0A7
        BC808080008000B0A7BCB0A7BC008000808080008000B0A7BC00800080808000
        8000808080008000B0A7BC808080008000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        000000B0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BC008000808080B0A7BCB0A7
        BCB0A7BC008000B0A7BC008000808080008000808080B0A7BCB0A7BCB0A7BC00
        8000808080B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BC000000B0A7BC808080008000B0A7BCB0A7BC008000B0A7BC0080008080
        80008000808080008000808080B0A7BCB0A7BC808080008000B0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BC008000
        808080B0A7BC008000B0A7BC0080008080800080008080800080008080800080
        00808080B0A7BC008000808080B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BC000000B0A7BC808080008000B0A7BC808080008000
        808080008000808080B0A7BC808080008000808080008000B0A7BC8080800080
        00B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC00
        0000B0A7BC008000808080B0A7BC008000808080008000808080B0A7BCB0A7BC
        B0A7BC808080008000808080B0A7BC008000808080B0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BC808080008000B0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BC808080008000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BC000000B0A7BC00800080808000800080808000800080808000
        8000808080008000808080008000808080008000808080008000808080B0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000B0A7
        BC80808000800080808000800080808000800080808000800080808000800080
        8080008000808080008000808080008000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC
        B0A7BC000000B0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7
        BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0
        A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BCB0A7BC000000}
      Margin = 4
    end
    object rgStock: TRadioGroup
      Left = 693
      Top = 48
      Width = 142
      Height = 51
      Caption = 'Con Stock'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '> 0                                              '
        '= 0')
      TabOrder = 12
    end
    object dblcLinea: TwwDBLookupCombo
      Left = 18
      Top = 71
      Width = 50
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'GRARID'#9'10'#9'Id'#9'F'
        'GRARDES'#9'30'#9'L'#237'nea'#9'F')
      LookupField = 'GRARID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      OnExit = dblcLineaExit
      OnNotInList = dblcLineaNotInList
    end
    object edtLinea: TEdit
      Left = 69
      Top = 71
      Width = 150
      Height = 23
      Color = clMenu
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object dblcFam: TwwDBLookupCombo
      Left = 236
      Top = 70
      Width = 50
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'FAMID'#9'3'#9'Id'#9'F'
        'FAMDES'#9'30'#9'Familia'#9'F')
      LookupField = 'FAMID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      OnEnter = dblcFamEnter
      OnExit = dblcFamExit
      OnNotInList = dblcFamNotInList
    end
    object edtFamilia: TEdit
      Left = 288
      Top = 70
      Width = 150
      Height = 23
      Color = clMenu
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object dblcSFamilia: TwwDBLookupCombo
      Left = 453
      Top = 70
      Width = 50
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SFAMID'#9'6'#9'Id'#9'F'
        'SFAMDES'#9'30'#9'SubFamilia'#9'F')
      LookupField = 'SFAMID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 8
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      OnExit = dblcSFamiliaExit
      OnNotInList = dblcSFamiliaNotInList
    end
    object edtSFamilia: TEdit
      Left = 505
      Top = 70
      Width = 150
      Height = 23
      Color = clMenu
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object dblcdMarca: TwwDBLookupComboDlg
      Left = 18
      Top = 119
      Width = 90
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Marca'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'MARCA'#9'8'#9'Id'#9'F'
        'MARDES'#9'20'#9'Marca'#9'F')
      LookupField = 'MARCA'
      ParentFont = False
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdMarcaExit
    end
    object edtMarca: TEdit
      Left = 109
      Top = 119
      Width = 328
      Height = 23
      Color = clMenu
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object dbgExp: TwwDBGrid
      Left = 539
      Top = 7
      Width = 103
      Height = 51
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      TabOrder = 15
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      Visible = False
    end
    object dblcArticulo: TwwDBLookupComboDlg
      Left = 451
      Top = 119
      Width = 73
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Articulo'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ARTID'#9'8'#9'Id'#9'F'
        'ARTDES'#9'50'#9'Marca'#9'F')
      LookupField = 'ARTID'
      TabOrder = 16
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcArticuloChange
      OnExit = dblcArticuloExit
    end
    object edtArticulo: TEdit
      Left = 525
      Top = 118
      Width = 252
      Height = 23
      Color = clMenu
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
    end
    object BtnImprime: TBitBtn
      Left = 866
      Top = 62
      Width = 89
      Height = 33
      Caption = 'Imprime'
      TabOrder = 18
      OnClick = BtnImprimeClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object cbDiseno: TCheckBox
      Left = 962
      Top = 120
      Width = 16
      Height = 17
      TabOrder = 19
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 636
    Width = 992
    Height = 10
    Align = alBottom
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 0
    Top = 157
    Width = 8
    Height = 479
    Align = alLeft
    TabOrder = 3
  end
  object Panel4: TPanel
    Left = 983
    Top = 157
    Width = 9
    Height = 479
    Align = alRight
    Color = 14869218
    TabOrder = 4
  end
  object ppDBPCompras: TppDBPipeline
    UserName = 'DBPCompras'
    Left = 872
    Top = 16
  end
  object RepComprasXPVentas: TppReport
    AutoStop = False
    DataPipeline = ppDBPCompras
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DemaExes\RTMS\FAC\Dema\ComprXPVenta.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 912
    Top = 16
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPCompras'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 11377
        mmLeft = 0
        mmTop = 13758
        mmWidth = 271463
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 529
        mmTop = 20902
        mmWidth = 8932
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Art'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 11642
        mmTop = 20902
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Alm.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 88636
        mmTop = 20902
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'N.Ingreso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 20902
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 111919
        mmTop = 20902
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Cant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 20902
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Precio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 133086
        mmTop = 20902
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'N.Ingreso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 145257
        mmTop = 20902
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 162190
        mmTop = 20902
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Cant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 174361
        mmTop = 20902
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Precio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 184944
        mmTop = 20902
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Precio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 199761
        mmTop = 16669
        mmWidth = 8043
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Calculado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 197909
        mmTop = 20902
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Precio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 216694
        mmTop = 16669
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Promoci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 214578
        mmTop = 20902
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = '(%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 231246
        mmTop = 20902
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 240242
        mmTop = 20902
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Alm.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 252942
        mmTop = 20902
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Gral.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 262467
        mmTop = 20902
        mmWidth = 6085
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 87842
        mmTop = 14023
        mmWidth = 529
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 94986
        mmTop = 13758
        mmWidth = 529
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 143934
        mmTop = 13758
        mmWidth = 529
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 95250
        mmTop = 19315
        mmWidth = 48948
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 109538
        mmTop = 19315
        mmWidth = 265
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 122502
        mmTop = 19315
        mmWidth = 265
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 131498
        mmTop = 19315
        mmWidth = 265
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Ultima Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 108215
        mmTop = 15346
        mmWidth = 21167
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 194734
        mmTop = 13758
        mmWidth = 529
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 144198
        mmTop = 19315
        mmWidth = 50800
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = 'Penultina Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 159015
        mmTop = 15346
        mmWidth = 22691
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 158750
        mmTop = 19315
        mmWidth = 265
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 173038
        mmTop = 19315
        mmWidth = 265
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 183092
        mmTop = 19315
        mmWidth = 265
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 212990
        mmTop = 13758
        mmWidth = 529
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 229394
        mmTop = 13758
        mmWidth = 529
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 229659
        mmTop = 19315
        mmWidth = 21167
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 250561
        mmTop = 13758
        mmWidth = 529
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Utilidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 234421
        mmTop = 15081
        mmWidth = 9440
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Stock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 251884
        mmTop = 16669
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Stock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 261938
        mmTop = 16669
        mmWidth = 7144
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 260615
        mmTop = 13758
        mmWidth = 529
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label21'
        Caption = 'Bazar y Representaciones'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 529
        mmTop = 4763
        mmWidth = 37423
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Derrama Magisterial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 794
        mmWidth = 30427
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label25'
        Caption = 'Compras por Punto de Venta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 102394
        mmTop = 6615
        mmWidth = 60325
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 233628
        mmTop = 1588
        mmWidth = 10668
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Hora :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 235480
        mmTop = 6350
        mmWidth = 8731
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 245269
        mmTop = 1852
        mmWidth = 36449
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 245534
        mmTop = 6350
        mmWidth = 1778
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ALMID'
        DataPipeline = ppDBPCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3260
        mmLeft = 89694
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ARTDES'
        DataPipeline = ppDBPCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 0
        mmWidth = 74877
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ARTID'
        DataPipeline = ppDBPCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        BlankWhenZero = True
        DataField = 'COSTOIGVS'
        DataPipeline = ppDBPCompras
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3260
        mmLeft = 131763
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        BlankWhenZero = True
        DataField = 'COSTOIGVSANT'
        DataPipeline = ppDBPCompras
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3260
        mmLeft = 182563
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'IMPORTE_UTILIDAD'
        DataPipeline = ppDBPCompras
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3175
        mmLeft = 241036
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'KDXCNTG'
        DataPipeline = ppDBPCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3260
        mmLeft = 125942
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        BlankWhenZero = True
        DataField = 'KDXCNTGANT'
        DataPipeline = ppDBPCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3260
        mmLeft = 176477
        mmTop = 0
        mmWidth = 5292
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'NISAFREG'
        DataPipeline = ppDBPCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3260
        mmLeft = 109273
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'NISAID'
        DataPipeline = ppDBPCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3260
        mmLeft = 94456
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'NISAIDANT'
        DataPipeline = ppDBPCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3260
        mmLeft = 145521
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        BlankWhenZero = True
        DataField = 'PORC_UTILIDAD'
        DataPipeline = ppDBPCompras
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3260
        mmLeft = 231511
        mmTop = 0
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        BlankWhenZero = True
        DataField = 'PRECIO_PRO'
        DataPipeline = ppDBPCompras
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3175
        mmLeft = 215371
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'STKALM'
        DataPipeline = ppDBPCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3260
        mmLeft = 253736
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'STKTOT'
        DataPipeline = ppDBPCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3260
        mmLeft = 261673
        mmTop = 0
        mmWidth = 5292
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'NISAFREGANT'
        DataPipeline = ppDBPCompras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3260
        mmLeft = 159809
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'PRECIO_CAL'
        DataPipeline = ppDBPCompras
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPCompras'
        mmHeight = 3175
        mmLeft = 199232
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'GRARID'
      DataPipeline = ppDBPCompras
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPCompras'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'FAMDES'
          DataPipeline = ppDBPCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPCompras'
          mmHeight = 3387
          mmLeft = 61648
          mmTop = 1058
          mmWidth = 19008
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'FAMID'
          DataPipeline = ppDBPCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPCompras'
          mmHeight = 3387
          mmLeft = 57944
          mmTop = 1058
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'GRARID'
          DataPipeline = ppDBPCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPCompras'
          mmHeight = 3387
          mmLeft = 265
          mmTop = 1058
          mmWidth = 3175
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          AutoSize = True
          DataField = 'GRARDES'
          DataPipeline = ppDBPCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPCompras'
          mmHeight = 3387
          mmLeft = 3704
          mmTop = 1058
          mmWidth = 33994
          BandType = 3
          GroupNo = 0
        end
        object ppDBText24: TppDBText
          UserName = 'DBText24'
          AutoSize = True
          DataField = 'SFAMDES'
          DataPipeline = ppDBPCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPCompras'
          mmHeight = 3387
          mmLeft = 101336
          mmTop = 1058
          mmWidth = 28575
          BandType = 3
          GroupNo = 0
        end
        object ppDBText25: TppDBText
          UserName = 'DBText25'
          DataField = 'SFAMID'
          DataPipeline = ppDBPCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPCompras'
          mmHeight = 3387
          mmLeft = 96838
          mmTop = 1058
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
        object ppLine18: TppLine
          UserName = 'Line11'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 5556
          mmWidth = 270934
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'FAMID'
      DataPipeline = ppDBPCompras
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPCompras'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'SFAMID'
      DataPipeline = ppDBPCompras
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPCompras'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'MARCA'
      DataPipeline = ppDBPCompras
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPCompras'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          DataField = 'MARCA'
          DataPipeline = ppDBPCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPCompras'
          mmHeight = 3387
          mmLeft = 0
          mmTop = 0
          mmWidth = 6085
          BandType = 3
          GroupNo = 3
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          AutoSize = True
          DataField = 'MARDES'
          DataPipeline = ppDBPCompras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPCompras'
          mmHeight = 3387
          mmLeft = 8202
          mmTop = 0
          mmWidth = 3937
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object Diseno: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = RepComprasXPVentas
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 952
    Top = 16
  end
end
