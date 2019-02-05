object Form2: TForm2
  Left = 142
  Top = 140
  Width = 649
  Height = 376
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 345
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 3
      Width = 39
      Height = 13
      Caption = 'Moneda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object pnlRegistro: TPanel
      Left = 8
      Top = 40
      Width = 373
      Height = 245
      BevelInner = bvRaised
      BevelWidth = 2
      BorderStyle = bsSingle
      Color = clMenu
      TabOrder = 0
      Visible = False
      object Bevel1: TBevel
        Left = 13
        Top = 93
        Width = 330
        Height = 36
        Shape = bsFrame
      end
      object bvCantAceptada: TBevel
        Left = 13
        Top = 136
        Width = 330
        Height = 36
        Shape = bsFrame
      end
      object lblCnpEgr: TLabel
        Left = 13
        Top = 35
        Width = 59
        Height = 13
        Caption = 'Articulo       :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblCuenta: TLabel
        Left = 13
        Top = 183
        Width = 60
        Height = 13
        Caption = 'Precio         :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 171
        Top = 183
        Width = 52
        Height = 13
        Caption = 'Descuento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 172
        Top = 253
        Width = 47
        Height = 13
        Caption = 'U.M         '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 18
        Top = 107
        Width = 50
        Height = 13
        Caption = 'Cant. Gral.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 13
        Top = 208
        Width = 57
        Height = 13
        Caption = 'Monto         '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 160
        Top = 203
        Width = 43
        Height = 26
        Caption = 'Garantia (meses)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label19: TLabel
        Left = 21
        Top = 252
        Width = 56
        Height = 13
        Caption = 'Tipo U.M    '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 13
        Top = 61
        Width = 55
        Height = 13
        Caption = 'Proveedor :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 186
        Top = 107
        Width = 48
        Height = 13
        Caption = 'Cant. Unt.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblUMPG: TLabel
        Left = 147
        Top = 107
        Width = 3
        Height = 15
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblUMPU: TLabel
        Left = 306
        Top = 107
        Width = 3
        Height = 15
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 26
        Top = 85
        Width = 82
        Height = 15
        Caption = 'Cantidad Pedida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 18
        Top = 149
        Width = 54
        Height = 15
        Caption = 'Cant. Gral.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblUMAG: TLabel
        Left = 147
        Top = 148
        Width = 3
        Height = 15
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label29: TLabel
        Left = 186
        Top = 149
        Width = 50
        Height = 15
        Caption = 'Cant. Unt.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblUMAU: TLabel
        Left = 307
        Top = 148
        Width = 3
        Height = 15
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 26
        Top = 129
        Width = 96
        Height = 15
        Caption = 'Cantidad Aceptada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcdArticulo: TwwDBLookupComboDlg
        Left = 80
        Top = 30
        Width = 74
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Maestro de Articulos'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'ARTID'#9'9'#9'C'#243'digo'#9'F'
          'ARTDES'#9'40'#9'Articulo'#9'F'
          'UNMIDG'#9'3'#9'U.M'#9'F'
          'ARTPVG'#9'10'#9'Precio Vta.'#9'F'
          'ARTABR'#9'15'#9'Abrev.'#9'F'
          'GRARID'#9'3'#9'L'#237'nea'#9'F')
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        MaxLength = 15
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        OnDropDown = dblcdArticuloDropDown
        OnExit = dblcdArticuloExit
      end
      object bbtnRegOk: TBitBtn
        Left = 278
        Top = 207
        Width = 30
        Height = 28
        Hint = 'Confirma Ingreso de Articulo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
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
      object bbtnRegCanc: TBitBtn
        Left = 310
        Top = 207
        Width = 30
        Height = 28
        Hint = 'Cancela Ingreso de Articulo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = bbtnRegCancClick
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
      object stTitulo: TStaticText
        Left = 4
        Top = 4
        Width = 361
        Height = 17
        Align = alTop
        Alignment = taCenter
        BorderStyle = sbsSingle
        Caption = 'Detalle de Pedidos'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 8
      end
      object dbePrecioG: TwwDBEdit
        Left = 80
        Top = 178
        Width = 74
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Picture.PictureMask = '#[*#][.[#][#]]'
        TabOrder = 4
        UnboundDataType = wwDefault
        UnboundAlignment = taRightJustify
        WantReturns = False
        WordWrap = False
        OnExit = dbePrecioGExit
      end
      object dbeCtdadG: TwwDBEdit
        Left = 80
        Top = 103
        Width = 62
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Picture.PictureMask = '#[*#][.[#][#][#]]'
        TabOrder = 2
        UnboundDataType = wwDefault
        UnboundAlignment = taRightJustify
        WantReturns = False
        WordWrap = False
        OnExit = dbeCtdadGExit
      end
      object dbeImporte: TwwDBEdit
        Left = 80
        Top = 204
        Width = 74
        Height = 23
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Picture.PictureMask = '#[*#][.[#][#]]'
        TabOrder = 12
        UnboundDataType = wwDefault
        UnboundAlignment = taRightJustify
        UsePictureMask = False
        WantReturns = False
        WordWrap = False
      end
      object dbeArticulo: TwwDBEdit
        Left = 155
        Top = 30
        Width = 178
        Height = 23
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeUmg: TwwDBEdit
        Left = 211
        Top = 247
        Width = 42
        Height = 23
        Color = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDGarantia: TwwDBEdit
        Left = 227
        Top = 204
        Width = 34
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Picture.PictureMask = '#[*#]'
        TabOrder = 15
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object cbTipoum: TComboBox
        Left = 88
        Top = 241
        Width = 74
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        TabOrder = 18
        OnExit = cbTipoumExit
        Items.Strings = (
          'General'
          'Unitario')
      end
      object dbgStock: TwwDBGrid
        Left = 367
        Top = 31
        Width = 294
        Height = 85
        DisableThemesInTitle = False
        Selected.Strings = (
          'ALMID'#9'2'#9'Id'#9'F'
          'ALMDES'#9'15'#9'Almacen'#9'F'
          'ARTID'#9'8'#9'Articulo'#9'F'
          'ARTCONT'#9'8'#9'Contenido'#9'F'
          'STKSACTG'#9'8'#9'Stock'#9'F'
          'STKSACTU'#9'8'#9'Stock'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = 11974251
        FixedCols = 0
        ShowHorzScrollBar = False
        ShowVertScrollBar = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 10
        TitleAlignment = taLeftJustify
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        FooterColor = 11974251
        FooterCellColor = clHighlightText
      end
      object edtDsto3: TEdit
        Left = 271
        Top = 178
        Width = 41
        Height = 23
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        Visible = False
      end
      object edtProv: TEdit
        Left = 155
        Top = 58
        Width = 206
        Height = 23
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
      object dbeCtdadU: TwwDBEdit
        Left = 238
        Top = 103
        Width = 62
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Picture.PictureMask = '#[*#][.[#][#][#]]'
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnEnter = dbeCtdadUEnter
        OnExit = dbeCtdadUExit
      end
      object dblcProv: TwwDBLookupComboDlg
        Left = 80
        Top = 59
        Width = 74
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Proveedor'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'PROV'#9'12'#9'Id'#9'F'
          'PROVDES'#9'30'#9'Provedor'#9'F')
        LookupField = 'PROV'
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblcProvExit
      end
      object dbeCantGA: TwwDBEdit
        Left = 80
        Top = 146
        Width = 62
        Height = 21
        Picture.PictureMask = '#[*#][.[#][#][#]]'
        TabOrder = 16
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeCantGAExit
      end
      object dbeCantUA: TwwDBEdit
        Left = 238
        Top = 146
        Width = 62
        Height = 21
        Enabled = False
        Picture.PictureMask = '#[*#][.[#][#][#]]'
        TabOrder = 17
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeCantUAExit
      end
      object edtDsto2: TwwDBEdit
        Left = 228
        Top = 178
        Width = 41
        Height = 21
        Color = clBtnFace
        Picture.PictureMask = '#[*#][.[#][#]]'
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = edtDsto2Exit
      end
      object bbtnBuscaArt: TBitBtn
        Left = 336
        Top = 30
        Width = 23
        Height = 23
        TabOrder = 19
        OnClick = bbtnBuscaArtClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
          3333333333333FF3333333330000333333364463333333333333388F33333333
          00003333333E66433333333333338F38F3333333000033333333E66333333333
          33338FF8F3333333000033333333333333333333333338833333333300003333
          3333446333333333333333FF3333333300003333333666433333333333333888
          F333333300003333333E66433333333333338F38F333333300003333333E6664
          3333333333338F38F3333333000033333333E6664333333333338F338F333333
          0000333333333E6664333333333338F338F3333300003333344333E666433333
          333F338F338F3333000033336664333E664333333388F338F338F33300003333
          E66644466643333338F38FFF8338F333000033333E6666666663333338F33888
          3338F3330000333333EE666666333333338FF33333383333000033333333EEEE
          E333333333388FFFFF8333330000333333333333333333333333388888333333
          0000}
        NumGlyphs = 2
      end
    end
    object pnlBusqueda: TPanel
      Left = 132
      Top = 168
      Width = 493
      Height = 145
      Color = clMenu
      TabOrder = 1
      Visible = False
      object lblBusca: TLabel
        Left = 24
        Top = 16
        Width = 30
        Height = 13
        Caption = 'Busca'
      end
      object dbgBusca: TwwDBGrid
        Left = 8
        Top = 40
        Width = 473
        Height = 98
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = 11974251
        FixedCols = 0
        ShowHorzScrollBar = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
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
      object bbtnOkBusca: TBitBtn
        Left = 417
        Top = 7
        Width = 30
        Height = 28
        Hint = 'Confirma Ingreso de Articulo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbtnOkBuscaClick
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
      object bbtnCancBusca: TBitBtn
        Left = 451
        Top = 7
        Width = 30
        Height = 28
        Hint = 'Cancela Ingreso de Articulo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnCancBuscaClick
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
      object dbeBusca: TwwDBEdit
        Left = 61
        Top = 12
        Width = 220
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeBuscaExit
      end
    end
    object dblcTmon: TwwDBLookupCombo
      Left = 16
      Top = 16
      Width = 73
      Height = 21
      DropDownAlignment = taLeftJustify
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 99
      Top = 14
      Width = 178
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
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
end
