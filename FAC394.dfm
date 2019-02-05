object FCombos: TFCombos
  Left = 253
  Top = 159
  Width = 720
  Height = 540
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = ' Lista de Precio de Combos'
  Color = 12904163
  Constraints.MaxHeight = 540
  Constraints.MaxWidth = 720
  Constraints.MinHeight = 540
  Constraints.MinWidth = 720
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDet: TPanel
    Left = 6
    Top = 257
    Width = 700
    Height = 248
    Color = 10207162
    TabOrder = 0
    object Label1: TLabel
      Left = 18
      Top = 55
      Width = 113
      Height = 16
      Caption = 'Lista de Precios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgDet: TwwDBGrid
      Left = 15
      Top = 106
      Width = 672
      Height = 128
      DisableThemesInTitle = False
      Selected.Strings = (
        'ARTID'#9'10'#9'C'#243'digo~Combo'#9#9
        'ARTDES'#9'50'#9'Descripci'#243'n de Combo'#9#9
        'TMONID'#9'5'#9'TM'#9#9
        'STOCK'#9'10'#9'Stock'#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      FixedCols = 0
      ShowHorzScrollBar = True
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      FooterColor = 10207162
      FooterHeight = 25
    end
    object dblcLPrecio: TwwDBLookupCombo
      Left = 15
      Top = 72
      Width = 55
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TLISTAID'#9'3'#9'Id'#9'F'
        'TLISTADES'#9'20'#9'Lista'#9'F'
        'TLISTAVIG'#9'10'#9'Vigencia'#9'F')
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
      OnEnter = dblcLPrecioEnter
      OnExit = dblcLPrecioExit
    end
    object edtLPrecio: TEdit
      Left = 72
      Top = 72
      Width = 150
      Height = 26
      Color = 12904163
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object bbtnRegOk: TBitBtn
      Left = 236
      Top = 68
      Width = 33
      Height = 31
      Hint = 'Mostrar Detalle de Combo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnRegOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object Panel1: TPanel
      Left = 15
      Top = 7
      Width = 672
      Height = 42
      Color = 10207162
      Enabled = False
      TabOrder = 4
      object dbeCod: TwwDBEdit
        Left = 24
        Top = 8
        Width = 90
        Height = 26
        Color = 12904163
        DataField = 'CODCOM'
        DataSource = DMFAC.dsCabPed
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeNombre: TwwDBEdit
        Left = 122
        Top = 8
        Width = 527
        Height = 26
        Color = 12904163
        DataField = 'DESCOM'
        DataSource = DMFAC.dsCabPed
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object Panel2: TPanel
      Left = 293
      Top = 52
      Width = 259
      Height = 47
      BevelOuter = bvNone
      Color = 10207162
      Enabled = False
      TabOrder = 5
      object Label3: TLabel
        Left = 7
        Top = 2
        Width = 119
        Height = 16
        Caption = 'Precio al Publico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 157
        Top = 2
        Width = 93
        Height = 16
        Caption = 'Stock Combo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbePrePub: TwwDBEdit
        Left = 15
        Top = 19
        Width = 100
        Height = 27
        Color = 12904163
        DataField = 'PREPUB'
        DataSource = DMFAC.dsTReg
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeStock: TwwDBEdit
        Left = 175
        Top = 19
        Width = 50
        Height = 27
        Color = 12904163
        DataField = 'STOCK'
        DataSource = DMFAC.dsTReg
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlVenta: TPanel
      Left = 568
      Top = 50
      Width = 119
      Height = 56
      Color = 10207162
      TabOrder = 6
      object Label4: TLabel
        Left = 7
        Top = 4
        Width = 63
        Height = 16
        Caption = 'Cantidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bbtnVenta: TBitBtn
        Left = 63
        Top = 21
        Width = 50
        Height = 28
        Caption = 'Vender'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = bbtnVentaClick
      end
      object seCant: TSpinEdit
        Left = 13
        Top = 20
        Width = 42
        Height = 29
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        MaxLength = 2
        MaxValue = 100
        MinValue = 1
        ParentFont = False
        TabOrder = 1
        Value = 1
      end
    end
  end
  object pnlCab: TPanel
    Left = 6
    Top = 2
    Width = 700
    Height = 251
    Color = 10207162
    TabOrder = 1
    object Label14: TLabel
      Left = 17
      Top = 6
      Width = 71
      Height = 16
      Caption = 'Compa'#241'ia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 230
      Top = 6
      Width = 83
      Height = 16
      Caption = 'T.Inventario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgCab: TwwDBGrid
      Left = 16
      Top = 56
      Width = 670
      Height = 183
      DisableThemesInTitle = False
      Selected.Strings = (
        'CODCOM'#9'12'#9'C'#243'digo~Combo'#9#9
        'DESCOM'#9'60'#9'Descripci'#243'n de Combo'#9#9
        'TMONID'#9'08'#9'TM'#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      OnRowChanged = dbgCabRowChanged
      FixedCols = 0
      ShowHorzScrollBar = True
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgCabDblClick
    end
    object dblcCia: TwwDBLookupCombo
      Left = 17
      Top = 24
      Width = 50
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
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      Enabled = False
      ParentFont = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 68
      Top = 24
      Width = 150
      Height = 23
      Color = 12904163
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dblcTinid: TwwDBLookupCombo
      Left = 230
      Top = 24
      Width = 50
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
      LookupTable = DMFAC.cdsTInven
      LookupField = 'TINID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      Enabled = False
      ParentFont = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTinidExit
    end
    object edtTinid: TEdit
      Left = 281
      Top = 24
      Width = 150
      Height = 23
      Color = 12904163
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object bbtnMostrar: TBitBtn
      Left = 456
      Top = 21
      Width = 75
      Height = 27
      Hint = 'Mostrar Combos'
      Caption = 'Mostrar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = bbtnMostrarClick
    end
  end
end
