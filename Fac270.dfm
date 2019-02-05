object FLPrecio: TFLPrecio
  Left = 333
  Top = 216
  BorderStyle = bsDialog
  Caption = 'Lista de Precios'
  ClientHeight = 364
  ClientWidth = 693
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 16
    Top = 24
    Width = 75
    Height = 13
    Caption = 'Lista de Precios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 104
    Top = 24
    Width = 35
    Height = 13
    Caption = 'Articulo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 79
    Top = 22
    Width = 57
    Height = 13
    Caption = 'Precio Base'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 155
    Top = 22
    Width = 64
    Height = 13
    Caption = '% Incremento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 235
    Top = 22
    Width = 54
    Height = 13
    Caption = 'Vol. Minimo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel
    Left = 315
    Top = 22
    Width = 42
    Height = 13
    Caption = '% Dscto.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 389
    Top = 22
    Width = 30
    Height = 13
    Caption = 'Precio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label26: TLabel
    Left = 11
    Top = 15
    Width = 57
    Height = 13
    Caption = 'Precio Base'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label29: TLabel
    Left = 371
    Top = 16
    Width = 54
    Height = 13
    Caption = '% Dscto 1. '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label30: TLabel
    Left = 315
    Top = 16
    Width = 54
    Height = 13
    Caption = '% Dscto 1. '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object pnlCabecera: TPanel
    Left = 0
    Top = 1
    Width = 694
    Height = 360
    BevelInner = bvRaised
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 0
    object Bevel1: TBevel
      Left = 640
      Top = 300
      Width = 42
      Height = 42
      Style = bsRaised
      Visible = False
    end
    object Label20: TLabel
      Left = 8
      Top = 192
      Width = 28
      Height = 13
      Caption = 'Stock'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Z2bbtnCancel: TBitBtn
      Left = 645
      Top = 305
      Width = 32
      Height = 31
      Hint = 'Registro Cancelado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Z2bbtnCancelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object gbUmg: TGroupBox
      Left = 8
      Top = 132
      Width = 301
      Height = 53
      Caption = 'General'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label12: TLabel
        Left = 79
        Top = 14
        Width = 30
        Height = 13
        Caption = 'Precio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 11
        Top = 13
        Width = 23
        Height = 13
        Caption = 'U.M.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 139
        Top = 14
        Width = 60
        Height = 13
        Caption = 'Precio + IGV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbePrecioG: TwwDBEdit
        Left = 73
        Top = 27
        Width = 62
        Height = 23
        DataField = 'LPREPREGMO'
        DataSource = DMFAC.dsLPrecio
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeUmg: TwwDBEdit
        Left = 7
        Top = 27
        Width = 64
        Height = 23
        DataField = 'UNMIDG'
        DataSource = DMFAC.dsLPrecio
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbePrecioIGV: TwwDBEdit
        Left = 136
        Top = 27
        Width = 67
        Height = 23
        DataField = 'LPREPREGIGV'
        DataSource = DMFAC.dsLPrecio
        TabOrder = 2
        UnboundDataType = wwDefault
        UnboundAlignment = taRightJustify
        WantReturns = False
        WordWrap = False
      end
    end
    object gbUmu: TGroupBox
      Left = 317
      Top = 132
      Width = 169
      Height = 53
      Caption = 'Unitario'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label24: TLabel
        Left = 83
        Top = 10
        Width = 30
        Height = 13
        Caption = 'Precio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 11
        Top = 13
        Width = 23
        Height = 13
        Caption = 'U.M.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbeUmu: TwwDBEdit
        Left = 8
        Top = 27
        Width = 61
        Height = 23
        DataField = 'UNMIDU'
        DataSource = DMFAC.dsLPrecio
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbePrecioU: TwwDBEdit
        Left = 84
        Top = 27
        Width = 60
        Height = 23
        DataField = 'LPREPREUMO'
        DataSource = DMFAC.dsLPrecio
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnl1: TPanel
      Left = 8
      Top = 8
      Width = 678
      Height = 40
      Color = 14869218
      Enabled = False
      TabOrder = 3
      object Label14: TLabel
        Left = 13
        Top = 1
        Width = 47
        Height = 13
        Caption = 'Compa'#241'ia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 329
        Top = 1
        Width = 75
        Height = 13
        Caption = 'Lista de Precios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dblcCia: TwwDBLookupCombo
        Left = 12
        Top = 15
        Width = 54
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'C'#237'a'#9'F'
          'CIADES'#9'40'#9'Raz'#243'n Social'#9'F')
        DataField = 'CIAID'
        DataSource = DMFAC.dsLPrecio
        LookupTable = DMFAC.cdsCia
        LookupField = 'CIAID'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblcLPrecio: TwwDBLookupCombo
        Left = 329
        Top = 15
        Width = 63
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TLISTAID'#9'3'#9'Id'#9'F'
          'TLISTADES'#9'20'#9'Lista'#9'F'
          'TLISTAVIG'#9'10'#9'Vigencia'#9'F')
        DataField = 'TLISTAID'
        DataSource = DMFAC.dsLPrecio
        LookupTable = DMFAC.cdsTLista
        LookupField = 'TLISTAID'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
      end
      object dbeCiaDes: TwwDBEdit
        Left = 68
        Top = 15
        Width = 249
        Height = 21
        DataField = 'CIADES'
        DataSource = DMFAC.dsLPrecio
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeTListaDes: TwwDBEdit
        Left = 395
        Top = 15
        Width = 249
        Height = 21
        DataField = 'TLISTADES'
        DataSource = DMFAC.dsLPrecio
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnl3: TPanel
      Left = 8
      Top = 91
      Width = 678
      Height = 42
      Color = 14869218
      Enabled = False
      TabOrder = 4
      object Label2: TLabel
        Left = 8
        Top = 1
        Width = 35
        Height = 13
        Caption = 'Articulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 371
        Top = 1
        Width = 78
        Height = 13
        Caption = 'Tipo de Moneda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dblcdArticulo: TwwDBLookupComboDlg
        Left = 8
        Top = 15
        Width = 93
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Articulos'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'ARTID'#9'10'#9'Articulo'#9'F'
          'ARTDES'#9'30'#9'Descripci'#243'n'#9'F'
          'GRARID'#9'3'#9'GRARID'#9'F'
          'FAMID'#9'3'#9'FAMID'#9'F'
          'SFAMID'#9'8'#9'SFAMID'#9'F'
          'ARTCONT'#9'8'#9'ARTCONT'#9'F'
          'UNMIDG'#9'2'#9'UNMIDG'#9'F'
          'UNMIDU'#9'2'#9'UNMIDU'#9'F'
          'ARTDCTG'#9'1'#9'ARTDCTG'#9'F'
          'ARTDCTU'#9'1'#9'ARTDCTU'#9'F'
          'ARTISC'#9'1'#9'ARTISC'#9'F'
          'ARTVENTA'#9'1'#9'ARTVENTA'#9'F')
        DataField = 'ARTID'
        DataSource = DMFAC.dsLPrecio
        LookupTable = DMFAC.cdsArticulo
        LookupField = 'ARTID'
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblcTMon: TwwDBLookupCombo
        Left = 370
        Top = 15
        Width = 49
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TMONID'#9'3'#9'Id'#9'F'
          'TMONDES'#9'30'#9'Moneda'#9'F')
        DataField = 'LPRETMONID'
        DataSource = DMFAC.dsLPrecio
        LookupTable = DMFAC.cdsTMon
        LookupField = 'TMONID'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
      end
      object dbeArtDes: TwwDBEdit
        Left = 104
        Top = 15
        Width = 249
        Height = 21
        DataField = 'ARTDES'
        DataSource = DMFAC.dsLPrecio
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeTMonDes: TwwDBEdit
        Left = 424
        Top = 15
        Width = 121
        Height = 21
        DataField = 'TMONDES'
        DataSource = DMFAC.dsLPrecio
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnl2: TPanel
      Left = 8
      Top = 49
      Width = 678
      Height = 42
      Color = 14869218
      Enabled = False
      TabOrder = 5
      object Label6: TLabel
        Left = 14
        Top = -1
        Width = 65
        Height = 15
        Caption = 'T.Inventario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 216
        Top = -1
        Width = 28
        Height = 15
        Caption = 'L'#237'nea'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 423
        Top = -1
        Width = 37
        Height = 15
        Caption = 'Familia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcTinid: TwwDBLookupCombo
        Left = 14
        Top = 15
        Width = 57
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TINID'#9'2'#9'T.Inventario'#9'F'
          'TINDES'#9'28'#9'Descripci'#243'n'#9'F')
        DataField = 'TINID'
        DataSource = DMFAC.dsLPrecio
        LookupTable = DMFAC.cdsTInven
        LookupField = 'TINID'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
      end
      object dblcLinea: TwwDBLookupCombo
        Left = 216
        Top = 15
        Width = 65
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'GRARID'#9'4'#9'Linea'#9'F'
          'GRARDES'#9'30'#9'Descripci'#243'n'#9'F')
        DataField = 'GRARID'
        DataSource = DMFAC.dsLPrecio
        LookupTable = DMFAC.cdsLinea
        LookupField = 'GRARID'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
      end
      object dblcFamilia: TwwDBLookupCombo
        Left = 423
        Top = 15
        Width = 66
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'FAMID'#9'4'#9'Familia'#9'F'
          'FAMDES'#9'28'#9'Descripci'#243'n'#9'F')
        DataField = 'FAMID'
        DataSource = DMFAC.dsLPrecio
        LookupTable = DMFAC.cdsFam
        LookupField = 'FAMID'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
      end
      object dbeTinDes: TwwDBEdit
        Left = 72
        Top = 15
        Width = 129
        Height = 21
        DataField = 'TINDES'
        DataSource = DMFAC.dsLPrecio
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeLineaDes: TwwDBEdit
        Left = 280
        Top = 15
        Width = 121
        Height = 21
        DataField = 'GRARDES'
        DataSource = DMFAC.dsLPrecio
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFamDes: TwwDBEdit
        Left = 496
        Top = 15
        Width = 145
        Height = 21
        DataField = 'FAMDES'
        DataSource = DMFAC.dsLPrecio
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object dbgStock: TwwDBGrid
      Left = 8
      Top = 210
      Width = 617
      Height = 131
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 14869218
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 6
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      FooterColor = clWhite
      FooterCellColor = 14869218
    end
  end
end
