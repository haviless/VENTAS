object FFormaPago: TFFormaPago
  Left = 418
  Top = 128
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Aceptaci'#243'n del Documento de Venta'
  ClientHeight = 558
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTodo: TPanel
    Left = 1
    Top = 1
    Width = 538
    Height = 548
    Color = clMoneyGreen
    TabOrder = 1
    object lblFormaPagoGral: TLabel
      Left = 8
      Top = 242
      Width = 114
      Height = 23
      Caption = 'Forma de Pago'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbgPago: TwwDBGrid
      Left = 4
      Top = 265
      Width = 530
      Height = 203
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgPagoDblClick
      OnKeyDown = dbgPagoKeyDown
      FooterHeight = 30
      object dbgAdicFPago: TwwIButton
        Left = 0
        Top = 0
        Width = 25
        Height = 29
        AllowAllUp = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333FF33333333FF333993333333300033377F3333333777333993333333
          300033F77FFF3333377739999993333333333777777F3333333F399999933333
          33003777777333333377333993333333330033377F3333333377333993333333
          3333333773333333333F333333333333330033333333F33333773333333C3333
          330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
          333333333337733333FF3333333C333330003333333733333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = dbgAdicFPagoClick
      end
    end
    object Panel3: TPanel
      Left = 4
      Top = 470
      Width = 530
      Height = 38
      Enabled = False
      TabOrder = 1
      object Label1: TLabel
        Left = 375
        Top = 6
        Width = 41
        Height = 23
        Caption = 'Saldo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dbeSaldo: TwwDBEdit
        Left = 422
        Top = 5
        Width = 90
        Height = 26
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        DataField = 'Saldo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Picture.PictureMask = '#[*#][.[#][#][#][#]]'
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object bbtnRegCanc: TBitBtn
      Left = 463
      Top = 513
      Width = 69
      Height = 28
      Hint = 'Cancela Ingreso de Articulo'
      Caption = 'Salir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnRegCancClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object Z2bbtnAcepta: TBitBtn
      Left = 426
      Top = 513
      Width = 32
      Height = 28
      Hint = 'Aceptar Articulos a Facturar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
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
  end
  object pnlFPago: TPanel
    Left = 27
    Top = 293
    Width = 509
    Height = 159
    BevelWidth = 2
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = clMoneyGreen
    TabOrder = 0
    Visible = False
    object bbtnOK: TBitBtn
      Left = 425
      Top = 126
      Width = 34
      Height = 24
      Hint = 'Confirma Ingreso de Articulo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbtnOKClick
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
    object bbtnCanc: TBitBtn
      Left = 464
      Top = 126
      Width = 34
      Height = 24
      Hint = 'Cancela Ingreso de Articulo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = bbtnCancClick
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
    object pnlDoc: TPanel
      Left = 8
      Top = 78
      Width = 490
      Height = 46
      Enabled = False
      TabOrder = 3
      object lblDocFPago: TLabel
        Left = 21
        Top = 2
        Width = 56
        Height = 15
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lblSerieFPago: TLabel
        Left = 175
        Top = 2
        Width = 29
        Height = 15
        Caption = 'Serie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lblNumDocfPago: TLabel
        Left = 237
        Top = 2
        Width = 40
        Height = 15
        Caption = 'Numero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lblFecFPago: TLabel
        Left = 351
        Top = 2
        Width = 30
        Height = 15
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object dblcTDocFPago: TwwDBLookupCombo
        Left = 6
        Top = 17
        Width = 44
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DOCID'#9'2'#9'Documento'#9'F'
          'DOCDES'#9'15'#9'Descripci'#243'n'#9'F')
        DataField = 'DOCPAG'
        LookupField = 'DOCID'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcTDocFPagoExit
      end
      object dbeDoc: TwwDBEdit
        Left = 51
        Top = 17
        Width = 107
        Height = 23
        BiDiMode = bdLeftToRight
        Color = clBtnFace
        ParentBiDiMode = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Picture.PictureMask = '#[*#][.[#][#][#][#]]'
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSerieDP: TwwDBEdit
        Left = 166
        Top = 17
        Width = 40
        Height = 23
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        DataField = 'SERDOCPAG'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Picture.PictureMask = '#[*#][.[#][#][#][#]]'
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeOpe: TwwDBEdit
        Left = 210
        Top = 17
        Width = 111
        Height = 23
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        DataField = 'NUMDOCPAG'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Picture.PictureMask = '#[*#][.[#][#][#][#]]'
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dtpFecOpe: TwwDBDateTimePicker
        Left = 330
        Top = 17
        Width = 90
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'FECDOCPAG'
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 4
        DisplayFormat = 'DD/MM/YYYY'
      end
    end
    object pnlTip: TPanel
      Left = 8
      Top = 28
      Width = 233
      Height = 49
      TabOrder = 1
      object lblFPago: TLabel
        Left = 15
        Top = 0
        Width = 93
        Height = 19
        Caption = 'Forma de Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblBusca: TLabel
        Left = 192
        Top = 4
        Width = 35
        Height = 15
        Caption = 'Buscar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object dblcFPago: TwwDBLookupCombo
        Left = 6
        Top = 21
        Width = 47
        Height = 23
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CCOMERID'#9'2'#9'Id'#9'F'
          'DCCOMDES'#9'30'#9'Descripci'#243'n'#9'F')
        DataField = 'FPAGOID'
        LookupField = 'CCOMERID'
        Options = [loColLines, loRowLines, loTitles]
        MaxLength = 2
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = dblcFPagoChange
        OnEnter = dblcFPagoEnter
        OnExit = dblcFPagoExit
      end
      object edtFPago: TEdit
        Left = 53
        Top = 21
        Width = 144
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
        TabOrder = 1
      end
      object dblcDoc: TwwDBLookupComboDlg
        Left = 197
        Top = 21
        Width = 23
        Height = 21
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        LookupTable = DMFAC.cdsQry18
        LookupField = 'TMONID'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnEnter = dblcDocEnter
        OnExit = dblcDocExit
      end
    end
    object pnlImp: TPanel
      Left = 243
      Top = 28
      Width = 255
      Height = 49
      TabOrder = 2
      object lblTMonFPago: TLabel
        Left = 14
        Top = 3
        Width = 81
        Height = 15
        Caption = 'Tipo de Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lblImporteFPago: TLabel
        Left = 176
        Top = 0
        Width = 50
        Height = 19
        Caption = 'Importe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dblcTMon: TwwDBLookupCombo
        Left = 6
        Top = 20
        Width = 42
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
        DataField = 'TMONPAID'
        LookupField = 'TMONID'
        Options = [loColLines, loTitles]
        MaxLength = 2
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblcTMonExit
      end
      object edtTMon: TEdit
        Left = 49
        Top = 20
        Width = 81
        Height = 23
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object dbeImp: TwwDBEdit
        Left = 155
        Top = 19
        Width = 88
        Height = 27
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        DataField = 'MTOPAGORI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Picture.PictureMask = '#[*#][.[#][#][#][#]]'
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnChange = dbeImpChange
        OnExit = dbeImpExit
      end
    end
    object stTitulo: TStaticText
      Left = 3
      Top = 3
      Width = 499
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSingle
      Caption = 'Detalle de Formas de Pago'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlNFact: TPanel
    Left = 6
    Top = 7
    Width = 530
    Height = 227
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 14869218
    TabOrder = 2
    object lblTipoMoneda: TLabel
      Left = 15
      Top = 97
      Width = 81
      Height = 15
      Caption = 'Tipo de Moneda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblImporte: TLabel
      Left = 182
      Top = 97
      Width = 41
      Height = 15
      Caption = 'Importe'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object gbGuia: TGroupBox
      Left = 14
      Top = 142
      Width = 285
      Height = 64
      Caption = 'Gu'#237'a de Remisi'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lblSerieGuia: TLabel
        Left = 10
        Top = 16
        Width = 29
        Height = 15
        Caption = 'Serie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lblNumGuia: TLabel
        Left = 72
        Top = 16
        Width = 40
        Height = 15
        Caption = 'N'#250'mero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object dblcSerieGuia: TwwDBLookupCombo
        Left = 9
        Top = 32
        Width = 57
        Height = 23
        DropDownAlignment = taLeftJustify
        LookupField = 'SERIEID'
        Enabled = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcSerieGuiaExit
      end
      object dbeNumGuia: TwwDBEdit
        Left = 68
        Top = 32
        Width = 121
        Height = 23
        Color = clInfoBk
        Enabled = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnKeyPress = dbeNFacConfKeyPress
      end
    end
    object gbNumFac: TGroupBox
      Left = 12
      Top = 10
      Width = 433
      Height = 85
      Caption = 'Documento de Venta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblSerie: TLabel
        Left = 134
        Top = 16
        Width = 46
        Height = 26
        Caption = 'Serie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lblNumeroDoc: TLabel
        Left = 212
        Top = 16
        Width = 69
        Height = 26
        Caption = 'N'#250'mero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lblTipoDocumento: TLabel
        Left = 16
        Top = 20
        Width = 100
        Height = 15
        Caption = 'Tipo de Documento '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcSerieConf: TwwDBLookupCombo
        Left = 134
        Top = 40
        Width = 76
        Height = 34
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SERIEID'#9'5'#9'Id'#9'F'
          'SERIEDES'#9'30'#9'Serie'#9'F')
        DataField = 'FACSERIE'
        Options = [loColLines, loTitles]
        Enabled = False
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
      end
      object dbeNFacConf: TEdit
        Left = 213
        Top = 40
        Width = 153
        Height = 34
        Color = clInfoBk
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = dbeNFacConfKeyPress
      end
      object edtTDoc: TEdit
        Left = 17
        Top = 40
        Width = 109
        Height = 23
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object edtMoneda: TEdit
      Left = 14
      Top = 114
      Width = 91
      Height = 23
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dbeMonto: TwwDBEdit
      Left = 143
      Top = 114
      Width = 80
      Height = 27
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      DataField = 'FACTOTMO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Picture.PictureMask = '#[*#][.[#][#][#][#]]'
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
end
