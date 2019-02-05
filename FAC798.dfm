object FToolConsultaxArticulo: TFToolConsultaxArticulo
  Left = 64
  Top = 108
  Width = 797
  Height = 195
  Caption = 'FToolConsultaxArticulo'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlArticulo: TPanel
    Left = 2
    Top = 0
    Width = 777
    Height = 155
    BevelInner = bvRaised
    Color = 14869218
    TabOrder = 0
    object Label2: TLabel
      Left = 12
      Top = 4
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 593
      Top = 4
      Width = 31
      Height = 15
      Caption = 'Desde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 687
      Top = 4
      Width = 29
      Height = 15
      Caption = 'Hasta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 380
      Top = 4
      Width = 75
      Height = 15
      Caption = 'Punto de Venta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 194
      Top = 4
      Width = 96
      Height = 15
      Caption = 'Tipo de Inventario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object sbDisenoRep: TSpeedButton
      Left = 8
      Top = 127
      Width = 14
      Height = 22
      Flat = True
      OnClick = sbDisenoRepClick
    end
    object edtCia: TEdit
      Left = 57
      Top = 20
      Width = 130
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
    object dblcCia: TwwDBLookupCombo
      Left = 12
      Top = 20
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
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCiaExit
      OnNotInList = NotInList
    end
    object dtpInicio: TwwDBDateTimePicker
      Left = 569
      Top = 20
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 6
    end
    object dtpFin: TwwDBDateTimePicker
      Left = 668
      Top = 20
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 7
    end
    object bbtnImprimir: TBitBtn
      Left = 619
      Top = 49
      Width = 115
      Height = 32
      Hint = 'Imprimir'
      Caption = 'Detalle x Factura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = bbtnImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      Margin = 2
      NumGlyphs = 2
    end
    object bbtnFiltrar: TBitBtn
      Left = 573
      Top = 46
      Width = 40
      Height = 30
      Hint = 'Filtrar'
      Caption = 'Fam'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Visible = False
      OnClick = bbtnFiltrarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object dblcAlmacen: TwwDBLookupCombo
      Left = 375
      Top = 20
      Width = 45
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'Almacen'#9'F'
        'ALMDES'#9'28'#9'Descripci'#243'n'#9'F')
      LookupField = 'ALMID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcAlmacenExit
    end
    object edtAlmacen: TEdit
      Left = 420
      Top = 20
      Width = 130
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object dblcTInv: TwwDBLookupCombo
      Left = 194
      Top = 20
      Width = 45
      Height = 23
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'2'#9'id'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupField = 'TINID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcTInvExit
    end
    object edtTinv: TEdit
      Left = 239
      Top = 20
      Width = 130
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
      TabOrder = 3
    end
    object bbtnFiltrar2: TBitBtn
      Left = 619
      Top = 117
      Width = 108
      Height = 32
      Hint = 'Filtrar'
      Caption = 'Consulta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = bbtnFiltrar2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      Margin = 5
      NumGlyphs = 2
    end
    object bbtnRep2: TBitBtn
      Left = 730
      Top = 117
      Width = 38
      Height = 32
      Hint = 'Imprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = bbtnRep2Click
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
    object gbOpcional: TGroupBox
      Left = 7
      Top = 49
      Width = 605
      Height = 68
      Caption = 'Opcional'
      TabOrder = 12
      object lblProv: TLabel
        Left = 15
        Top = 20
        Width = 49
        Height = 13
        Caption = 'Proveedor'
      end
      object Label12: TLabel
        Left = 251
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Marca'
      end
      object Label13: TLabel
        Left = 427
        Top = 18
        Width = 73
        Height = 13
        Caption = 'Art'#237'culo ( Tipo )'
      end
      object dblcdProv: TwwDBLookupComboDlg
        Left = 7
        Top = 35
        Width = 68
        Height = 21
        CharCase = ecUpperCase
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taCenter
        Caption = 'Proveedores'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'PROV'#9'8'#9'ID'#9'F'
          'PROVDES'#9'40'#9'Descripci'#243'n'#9'F'
          'PROVABR'#9'15'#9'Abreviatura'#9'F')
        LookupField = 'PROV'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcdProvExit
      end
      object dbeProv: TEdit
        Left = 75
        Top = 35
        Width = 161
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object dblcdMarca: TwwDBLookupComboDlg
        Left = 242
        Top = 35
        Width = 60
        Height = 21
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'MARCA'#9'6'#9'Id'#9'F'
          'MARDES'#9'30'#9'Marca'#9'F')
        LookupField = 'MARCA'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnExit = dblcdMarcaExit
      end
      object edtMarca: TEdit
        Left = 302
        Top = 35
        Width = 115
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object dblcdArtTipo: TwwDBLookupComboDlg
        Left = 422
        Top = 35
        Width = 60
        Height = 21
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'TIPART'#9'6'#9'Id'#9'F'
          'TIPARTDES'#9'30'#9'Tipo de Art'#237'culo'#9'F')
        LookupField = 'TIPART'
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnExit = dblcdArtTipoExit
      end
      object edtTipArt: TEdit
        Left = 482
        Top = 35
        Width = 115
        Height = 21
        Enabled = False
        TabOrder = 5
      end
    end
    object bbtnConsignacion: TBitBtn
      Left = 619
      Top = 83
      Width = 149
      Height = 32
      Hint = 'Imprimir'
      Caption = 'Ventas Consignaci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      OnClick = bbtnConsignacionClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      Margin = 5
      NumGlyphs = 2
    end
    object bbtnExcel1: TBitBtn
      Left = 735
      Top = 49
      Width = 33
      Height = 32
      TabOrder = 14
      OnClick = bbtnExcel1Click
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
      Margin = 2
    end
    object dtgData: TDBGrid
      Left = 58
      Top = 122
      Width = 49
      Height = 25
      TabOrder = 15
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
    end
    object cbDiseno: TCheckBox
      Left = 31
      Top = 124
      Width = 14
      Height = 17
      TabOrder = 16
      Visible = False
    end
  end
  object ppReporte: TppReport
    AutoStop = False
    DataPipeline = ppdbReporte
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMS\FAC\Dema\VentadeArticulos.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 479
    Top = 121
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbReporte'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31485
      mmPrintPosition = 0
      object ppLblCia: TppLabel
        UserName = 'LblCia'
        Caption = 'BAZAR Y REPRESENTACIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4445
        mmLeft = 5027
        mmTop = 0
        mmWidth = 55880
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'ARTICULOS VENDIDOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3895
        mmLeft = 84666
        mmTop = 8202
        mmWidth = 38100
        BandType = 0
      end
      object pplblFecha: TppLabel
        UserName = 'lblFecha'
        Caption = ' Del 01/11/2007 al 30/11/2007'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3895
        mmLeft = 73025
        mmTop = 12700
        mmWidth = 61383
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 0
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 180182
        mmTop = 3969
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 7938
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 16404
        mmTop = 21696
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 47096
        mmTop = 21696
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 68792
        mmTop = 21696
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Cant.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 21431
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '-----------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 27781
        mmWidth = 189971
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Nombres'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 92604
        mmTop = 21696
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Precio U.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 160602
        mmTop = 21431
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Precio T.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 178065
        mmTop = 21431
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 25135
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 184150
        mmTop = 25135
        mmWidth = 5556
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'ALMDES'
        DataPipeline = ppdbReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3810
        mmLeft = 11377
        mmTop = 4763
        mmWidth = 19854
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'ALMID'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3598
        mmLeft = 5027
        mmTop = 4763
        mmWidth = 3810
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'FACSERIE'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3006
        mmLeft = 21696
        mmTop = 0
        mmWidth = 5080
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'NFAC'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3006
        mmLeft = 28310
        mmTop = 0
        mmWidth = 11853
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'DFACCANTG'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3006
        mmLeft = 153618
        mmTop = 0
        mmWidth = 1693
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CLIEDES'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 0
        mmWidth = 55033
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'FACFECHA'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3006
        mmLeft = 44715
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'CLIEID'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3006
        mmLeft = 67998
        mmTop = 0
        mmWidth = 13547
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DOCDES'
        DataPipeline = ppdbReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'PU'
        DataPipeline = ppdbReporte
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3006
        mmLeft = 168010
        mmTop = 0
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = 'PT'
        DataPipeline = ppdbReporte
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3006
        mmLeft = 185473
        mmTop = 0
        mmWidth = 8467
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '-----------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 1323
        mmWidth = 189177
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'PT'
        DataPipeline = ppdbReporte
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbReporte'
        mmHeight = 3175
        mmLeft = 176742
        mmTop = 5821
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 161132
        mmTop = 5821
        mmWidth = 8467
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ARTID'
      DataPipeline = ppdbReporte
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbReporte'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'ARTID'
          DataPipeline = ppdbReporte
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 15cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppdbReporte'
          mmHeight = 3217
          mmLeft = 32544
          mmTop = 2646
          mmWidth = 13547
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'ARTDES'
          DataPipeline = ppdbReporte
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 15cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppdbReporte'
          mmHeight = 3217
          mmLeft = 48683
          mmTop = 2646
          mmWidth = 54187
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Art'#237'culo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 15cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 14817
          mmTop = 2646
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 
            '----------------------------------------------------------------' +
            '-----------------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 15cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 5027
          mmTop = 5027
          mmWidth = 189177
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Total x Art'#237'culo '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 15cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 101336
          mmTop = 2381
          mmWidth = 31485
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'DFACCANTG'
          DataPipeline = ppdbReporte
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 15cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbReporte'
          mmHeight = 3704
          mmLeft = 138113
          mmTop = 2381
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          AutoSize = False
          Caption = 
            '----------------------------------------------------------------' +
            '-----------------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 15cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 5027
          mmTop = 0
          mmWidth = 189177
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'PT'
          DataPipeline = ppdbReporte
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 15cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbReporte'
          mmHeight = 3217
          mmLeft = 182087
          mmTop = 2381
          mmWidth = 11853
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppd1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppr1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 738
    Top = 175
  end
  object ppdbReporte: TppDBPipeline
    UserName = 'dbReporte'
    Left = 446
    Top = 121
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'LOCID'
      FieldName = 'LOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'TINID'
      FieldName = 'TINID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'ALMID'
      FieldName = 'ALMID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'CLIEID'
      FieldName = 'CLIEID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'FACSERIE'
      FieldName = 'FACSERIE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'NFAC'
      FieldName = 'NFAC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'CLIERUC'
      FieldName = 'CLIERUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'VEID'
      FieldName = 'VEID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'GRARID'
      FieldName = 'GRARID'
      FieldLength = 3
      DisplayWidth = 3
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'FAMID'
      FieldName = 'FAMID'
      FieldLength = 3
      DisplayWidth = 3
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'SFAMID'
      FieldName = 'SFAMID'
      FieldLength = 8
      DisplayWidth = 8
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'TLISTAID'
      FieldName = 'TLISTAID'
      FieldLength = 3
      DisplayWidth = 3
      Position = 13
    end
    object ppField15: TppField
      FieldAlias = 'ARTID'
      FieldName = 'ARTID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object ppField16: TppField
      FieldAlias = 'UNMIDG'
      FieldName = 'UNMIDG'
      FieldLength = 3
      DisplayWidth = 3
      Position = 15
    end
    object ppField17: TppField
      FieldAlias = 'UNMABR'
      FieldName = 'UNMABR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 16
    end
    object ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACCANTG'
      FieldName = 'DFACCANTG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACPREUMO'
      FieldName = 'DFACPREUMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACPREUMN'
      FieldName = 'DFACPREUMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACPREUME'
      FieldName = 'DFACPREUME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACDTOUMO'
      FieldName = 'DFACDTOUMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACDTOUMN'
      FieldName = 'DFACDTOUMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACDTOUME'
      FieldName = 'DFACDTOUME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACMTOMO'
      FieldName = 'DFACMTOMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACMTOMN'
      FieldName = 'DFACMTOMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACMTOME'
      FieldName = 'DFACMTOME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'DFACUSER'
      FieldName = 'DFACUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'DFACFREG'
      FieldName = 'DFACFREG'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 28
    end
    object ppField30: TppField
      FieldAlias = 'DFACHREG'
      FieldName = 'DFACHREG'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 29
    end
    object ppField31: TppField
      FieldAlias = 'DFACANOMES'
      FieldName = 'DFACANOMES'
      FieldLength = 6
      DisplayWidth = 6
      Position = 30
    end
    object ppField32: TppField
      FieldAlias = 'DFACAAAA'
      FieldName = 'DFACAAAA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 31
    end
    object ppField33: TppField
      FieldAlias = 'DFACMM'
      FieldName = 'DFACMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 32
    end
    object ppField34: TppField
      FieldAlias = 'DFACDD'
      FieldName = 'DFACDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 33
    end
    object ppField35: TppField
      FieldAlias = 'DFACTRI'
      FieldName = 'DFACTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 34
    end
    object ppField36: TppField
      FieldAlias = 'DFACSEM'
      FieldName = 'DFACSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 35
    end
    object ppField37: TppField
      FieldAlias = 'DFACSS'
      FieldName = 'DFACSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 36
    end
    object ppField38: TppField
      FieldAlias = 'DFACAATRI'
      FieldName = 'DFACAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 37
    end
    object ppField39: TppField
      FieldAlias = 'DFACAASEM'
      FieldName = 'DFACAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 38
    end
    object ppField40: TppField
      FieldAlias = 'DFACAASS'
      FieldName = 'DFACAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 39
    end
    object ppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACTCAM'
      FieldName = 'DFACTCAM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object ppField42: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 41
    end
    object ppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLIECREMAX'
      FieldName = 'CLIECREMAX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object ppField44: TppField
      FieldAlias = 'DFACIGV'
      FieldName = 'DFACIGV'
      FieldLength = 1
      DisplayWidth = 1
      Position = 43
    end
    object ppField45: TppField
      FieldAlias = 'DFACISC'
      FieldName = 'DFACISC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 44
    end
    object ppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACDCTO'
      FieldName = 'DFACDCTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object ppField47: TppField
      FieldAlias = 'DFACESTADO'
      FieldName = 'DFACESTADO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 46
    end
    object ppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACCANTAT'
      FieldName = 'DFACCANTAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object ppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACGARAN'
      FieldName = 'DFACGARAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object ppField50: TppField
      FieldAlias = 'FPAGOID'
      FieldName = 'FPAGOID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 49
    end
    object ppField51: TppField
      FieldAlias = 'SERIE'
      FieldName = 'SERIE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 50
    end
    object ppField52: TppField
      FieldAlias = 'NGUIA'
      FieldName = 'NGUIA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 51
    end
    object ppField53: TppField
      FieldAlias = 'UNMIDU'
      FieldName = 'UNMIDU'
      FieldLength = 3
      DisplayWidth = 3
      Position = 52
    end
    object ppField54: TppField
      FieldAlias = 'DFACFLAGRE'
      FieldName = 'DFACFLAGRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 53
    end
    object ppField55: TppField
      FieldAlias = 'UNMIDO'
      FieldName = 'UNMIDO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 54
    end
    object ppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACCOMLMO'
      FieldName = 'DFACCOMLMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object ppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACCOMLMN'
      FieldName = 'DFACCOMLMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object ppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACCOMLME'
      FieldName = 'DFACCOMLME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object ppField59: TppField
      FieldAlias = 'DFACFLAGV'
      FieldName = 'DFACFLAGV'
      FieldLength = 2
      DisplayWidth = 2
      Position = 58
    end
    object ppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACDCTO2'
      FieldName = 'DFACDCTO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object ppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACDTOMO2'
      FieldName = 'DFACDTOMO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object ppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACDTOME2'
      FieldName = 'DFACDTOME2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 61
    end
    object ppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACDTOMN2'
      FieldName = 'DFACDTOMN2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object ppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACDCTO3'
      FieldName = 'DFACDCTO3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 63
    end
    object ppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACDTOMO3'
      FieldName = 'DFACDTOMO3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 64
    end
    object ppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACDTOMN3'
      FieldName = 'DFACDTOMN3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object ppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACDTOME3'
      FieldName = 'DFACDTOME3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object ppField68: TppField
      FieldAlias = 'CLIEDIRID'
      FieldName = 'CLIEDIRID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 67
    end
    object ppField69: TppField
      FieldAlias = 'DFACDIRENT'
      FieldName = 'DFACDIRENT'
      FieldLength = 50
      DisplayWidth = 50
      Position = 68
    end
    object ppField70: TppField
      FieldAlias = 'DFACITEM'
      FieldName = 'DFACITEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 69
    end
    object ppField71: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 70
    end
    object ppField72: TppField
      FieldAlias = 'DFACHOR'
      FieldName = 'DFACHOR'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 71
    end
    object ppField73: TppField
      FieldAlias = 'FACFECHA'
      FieldName = 'FACFECHA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 72
    end
    object ppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACSALDO'
      FieldName = 'DFACSALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 73
    end
    object ppField75: TppField
      FieldAlias = 'DFACCONT'
      FieldName = 'DFACCONT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 74
    end
    object ppField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACPREVMO'
      FieldName = 'DFACPREVMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 75
    end
    object ppField77: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACPREVMN'
      FieldName = 'DFACPREVMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 76
    end
    object ppField78: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACPREVME'
      FieldName = 'DFACPREVME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 77
    end
    object ppField79: TppField
      FieldAlias = 'FACTIP'
      FieldName = 'FACTIP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 78
    end
    object ppField80: TppField
      FieldAlias = 'FACTCLI'
      FieldName = 'FACTCLI'
      FieldLength = 3
      DisplayWidth = 3
      Position = 79
    end
    object ppField81: TppField
      FieldAlias = 'TIPOADQ'
      FieldName = 'TIPOADQ'
      FieldLength = 1
      DisplayWidth = 1
      Position = 80
    end
    object ppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACIMP1'
      FieldName = 'DFACIMP1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 81
    end
    object ppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACIMPMTO1'
      FieldName = 'DFACIMPMTO1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 82
    end
    object ppField84: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACIMP2'
      FieldName = 'DFACIMP2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 83
    end
    object ppField85: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACIMPMTO2'
      FieldName = 'DFACIMPMTO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 84
    end
    object ppField86: TppField
      FieldAlias = 'ARTDES'
      FieldName = 'ARTDES'
      FieldLength = 60
      DisplayWidth = 60
      Position = 85
    end
    object ppField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACVTOTMO'
      FieldName = 'DFACVTOTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 86
    end
    object ppField88: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACVTOTMN'
      FieldName = 'DFACVTOTMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 87
    end
    object ppField89: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACVTOTME'
      FieldName = 'DFACVTOTME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 88
    end
    object ppField90: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACIMPMTN1'
      FieldName = 'DFACIMPMTN1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 89
    end
    object ppField91: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACIMPMTE1'
      FieldName = 'DFACIMPMTE1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 90
    end
    object ppField92: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACIMPMTE2'
      FieldName = 'DFACIMPMTE2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 91
    end
    object ppField93: TppField
      Alignment = taRightJustify
      FieldAlias = 'DFACIMPMTN2'
      FieldName = 'DFACIMPMTN2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 92
    end
    object ppField94: TppField
      FieldAlias = 'FACID'
      FieldName = 'FACID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 93
    end
    object ppField95: TppField
      FieldAlias = 'DFACTFLAG'
      FieldName = 'DFACTFLAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 94
    end
    object ppField96: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 95
    end
    object ppField97: TppField
      FieldAlias = 'CIAID_1'
      FieldName = 'CIAID_1'
      FieldLength = 2
      DisplayWidth = 2
      Position = 96
    end
    object ppField98: TppField
      FieldAlias = 'LOCID_1'
      FieldName = 'LOCID_1'
      FieldLength = 2
      DisplayWidth = 2
      Position = 97
    end
    object ppField99: TppField
      FieldAlias = 'TINID_1'
      FieldName = 'TINID_1'
      FieldLength = 2
      DisplayWidth = 2
      Position = 98
    end
    object ppField100: TppField
      FieldAlias = 'ALMID_1'
      FieldName = 'ALMID_1'
      FieldLength = 2
      DisplayWidth = 2
      Position = 99
    end
    object ppField101: TppField
      FieldAlias = 'TLISTAID_1'
      FieldName = 'TLISTAID_1'
      FieldLength = 3
      DisplayWidth = 3
      Position = 100
    end
    object ppField102: TppField
      FieldAlias = 'CLIEID_1'
      FieldName = 'CLIEID_1'
      FieldLength = 15
      DisplayWidth = 15
      Position = 101
    end
    object ppField103: TppField
      FieldAlias = 'CLAUXID_1'
      FieldName = 'CLAUXID_1'
      FieldLength = 2
      DisplayWidth = 2
      Position = 102
    end
    object ppField104: TppField
      FieldAlias = 'CLIERUC_1'
      FieldName = 'CLIERUC_1'
      FieldLength = 15
      DisplayWidth = 15
      Position = 103
    end
    object ppField105: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLIECREMAX_1'
      FieldName = 'CLIECREMAX_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 104
    end
    object ppField106: TppField
      FieldAlias = 'FACSERIE_1'
      FieldName = 'FACSERIE_1'
      FieldLength = 4
      DisplayWidth = 4
      Position = 105
    end
    object ppField107: TppField
      FieldAlias = 'NFAC_1'
      FieldName = 'NFAC_1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 106
    end
    object ppField108: TppField
      FieldAlias = 'FACFECHA_1'
      FieldName = 'FACFECHA_1'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 107
    end
    object ppField109: TppField
      FieldAlias = 'VEID_1'
      FieldName = 'VEID_1'
      FieldLength = 4
      DisplayWidth = 4
      Position = 108
    end
    object ppField110: TppField
      FieldAlias = 'FPAGOID_1'
      FieldName = 'FPAGOID_1'
      FieldLength = 2
      DisplayWidth = 2
      Position = 109
    end
    object ppField111: TppField
      FieldAlias = 'TMONID_1'
      FieldName = 'TMONID_1'
      FieldLength = 2
      DisplayWidth = 2
      Position = 110
    end
    object ppField112: TppField
      FieldAlias = 'TIPVTAID'
      FieldName = 'TIPVTAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 111
    end
    object ppField113: TppField
      FieldAlias = 'FACPO'
      FieldName = 'FACPO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 112
    end
    object ppField114: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACMTOMO'
      FieldName = 'FACMTOMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 113
    end
    object ppField115: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACMTOMN'
      FieldName = 'FACMTOMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 114
    end
    object ppField116: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACMTOME'
      FieldName = 'FACMTOME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 115
    end
    object ppField117: TppField
      FieldAlias = 'FACESTADO'
      FieldName = 'FACESTADO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 116
    end
    object ppField118: TppField
      FieldAlias = 'FACFECENT'
      FieldName = 'FACFECENT'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 117
    end
    object ppField119: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACDCTOMO'
      FieldName = 'FACDCTOMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 118
    end
    object ppField120: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACDCTOMN'
      FieldName = 'FACDCTOMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 119
    end
    object ppField121: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACDCTOME'
      FieldName = 'FACDCTOME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 120
    end
    object ppField122: TppField
      FieldAlias = 'FACUSER'
      FieldName = 'FACUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 121
    end
    object ppField123: TppField
      FieldAlias = 'FACFREG'
      FieldName = 'FACFREG'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 122
    end
    object ppField124: TppField
      FieldAlias = 'FACHREG'
      FieldName = 'FACHREG'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 123
    end
    object ppField125: TppField
      FieldAlias = 'FACANOMES'
      FieldName = 'FACANOMES'
      FieldLength = 6
      DisplayWidth = 6
      Position = 124
    end
    object ppField126: TppField
      FieldAlias = 'FACAAAA'
      FieldName = 'FACAAAA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 125
    end
    object ppField127: TppField
      FieldAlias = 'FACMM'
      FieldName = 'FACMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 126
    end
    object ppField128: TppField
      FieldAlias = 'FACDD'
      FieldName = 'FACDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 127
    end
    object ppField129: TppField
      FieldAlias = 'FACTRI'
      FieldName = 'FACTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 128
    end
    object ppField130: TppField
      FieldAlias = 'FACSEM'
      FieldName = 'FACSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 129
    end
    object ppField131: TppField
      FieldAlias = 'FACSS'
      FieldName = 'FACSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 130
    end
    object ppField132: TppField
      FieldAlias = 'FACAATRI'
      FieldName = 'FACAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 131
    end
    object ppField133: TppField
      FieldAlias = 'FACAASEM'
      FieldName = 'FACAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 132
    end
    object ppField134: TppField
      FieldAlias = 'FACAASS'
      FieldName = 'FACAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 133
    end
    object ppField135: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACTCAM'
      FieldName = 'FACTCAM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 134
    end
    object ppField136: TppField
      FieldAlias = 'FACFLAGD'
      FieldName = 'FACFLAGD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 135
    end
    object ppField137: TppField
      FieldAlias = 'FACSIT'
      FieldName = 'FACSIT'
      FieldLength = 2
      DisplayWidth = 2
      Position = 136
    end
    object ppField138: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACIGVMN'
      FieldName = 'FACIGVMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 137
    end
    object ppField139: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACIGVME'
      FieldName = 'FACIGVME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 138
    end
    object ppField140: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACISCMN'
      FieldName = 'FACISCMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 139
    end
    object ppField141: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACISCME'
      FieldName = 'FACISCME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 140
    end
    object ppField142: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACTOTMO'
      FieldName = 'FACTOTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 141
    end
    object ppField143: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACTOTMN'
      FieldName = 'FACTOTMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 142
    end
    object ppField144: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACTOTME'
      FieldName = 'FACTOTME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 143
    end
    object ppField145: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACGARAN'
      FieldName = 'FACGARAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 144
    end
    object ppField146: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACIGVMO'
      FieldName = 'FACIGVMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 145
    end
    object ppField147: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACISCMO'
      FieldName = 'FACISCMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 146
    end
    object ppField148: TppField
      FieldAlias = 'FACTIP_1'
      FieldName = 'FACTIP_1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 147
    end
    object ppField149: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACCOMVEMO'
      FieldName = 'FACCOMVEMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 148
    end
    object ppField150: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACCOMVEMN'
      FieldName = 'FACCOMVEMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 149
    end
    object ppField151: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACCOMVEME'
      FieldName = 'FACCOMVEME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 150
    end
    object ppField152: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACEMBMO'
      FieldName = 'FACEMBMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 151
    end
    object ppField153: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACEMBMN'
      FieldName = 'FACEMBMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 152
    end
    object ppField154: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACEMBME'
      FieldName = 'FACEMBME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 153
    end
    object ppField155: TppField
      FieldAlias = 'ZONVTAID'
      FieldName = 'ZONVTAID'
      FieldLength = 10
      DisplayWidth = 10
      Position = 154
    end
    object ppField156: TppField
      FieldAlias = 'DOCID_1'
      FieldName = 'DOCID_1'
      FieldLength = 2
      DisplayWidth = 2
      Position = 155
    end
    object ppField157: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 156
    end
    object ppField158: TppField
      FieldAlias = 'TIPPERID'
      FieldName = 'TIPPERID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 157
    end
    object ppField159: TppField
      FieldAlias = 'GUIASERIE'
      FieldName = 'GUIASERIE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 158
    end
    object ppField160: TppField
      FieldAlias = 'GUIANUM'
      FieldName = 'GUIANUM'
      FieldLength = 10
      DisplayWidth = 10
      Position = 159
    end
    object ppField161: TppField
      FieldAlias = 'FACTDOC'
      FieldName = 'FACTDOC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 160
    end
    object ppField162: TppField
      FieldAlias = 'ZIPID'
      FieldName = 'ZIPID'
      FieldLength = 6
      DisplayWidth = 6
      Position = 161
    end
    object ppField163: TppField
      FieldAlias = 'USERANUL'
      FieldName = 'USERANUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 162
    end
    object ppField164: TppField
      FieldAlias = 'FECANUL'
      FieldName = 'FECANUL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 163
    end
    object ppField165: TppField
      FieldAlias = 'HORANUL'
      FieldName = 'HORANUL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 164
    end
    object ppField166: TppField
      FieldAlias = 'PROFID'
      FieldName = 'PROFID'
      FieldLength = 10
      DisplayWidth = 10
      Position = 165
    end
    object ppField167: TppField
      FieldAlias = 'CLIEDIRID_1'
      FieldName = 'CLIEDIRID_1'
      FieldLength = 2
      DisplayWidth = 2
      Position = 166
    end
    object ppField168: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACDSCTO1'
      FieldName = 'FACDSCTO1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 167
    end
    object ppField169: TppField
      FieldAlias = 'FACIMPREP'
      FieldName = 'FACIMPREP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 168
    end
    object ppField170: TppField
      FieldAlias = 'FACFEVCMTO'
      FieldName = 'FACFEVCMTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 169
    end
    object ppField171: TppField
      FieldAlias = 'PROFTCLI'
      FieldName = 'PROFTCLI'
      FieldLength = 3
      DisplayWidth = 3
      Position = 170
    end
    object ppField172: TppField
      FieldAlias = 'FACTCLI_1'
      FieldName = 'FACTCLI_1'
      FieldLength = 3
      DisplayWidth = 3
      Position = 171
    end
    object ppField173: TppField
      FieldAlias = 'CLIEDES'
      FieldName = 'CLIEDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 172
    end
    object ppField174: TppField
      FieldAlias = 'CLIEDIR'
      FieldName = 'CLIEDIR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 173
    end
    object ppField175: TppField
      FieldAlias = 'TIPOADQ_1'
      FieldName = 'TIPOADQ_1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 174
    end
    object ppField176: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACIGV2MN'
      FieldName = 'FACIGV2MN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 175
    end
    object ppField177: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACIGV2ME'
      FieldName = 'FACIGV2ME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 176
    end
    object ppField178: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACIGV2MO'
      FieldName = 'FACIGV2MO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 177
    end
    object ppField179: TppField
      FieldAlias = 'FACID_1'
      FieldName = 'FACID_1'
      FieldLength = 15
      DisplayWidth = 15
      Position = 178
    end
    object ppField180: TppField
      FieldAlias = 'FACTOBS'
      FieldName = 'FACTOBS'
      FieldLength = 256
      DataType = dtMemo
      DisplayWidth = 10
      Position = 179
      Searchable = False
      Sortable = False
    end
    object ppField181: TppField
      FieldAlias = 'SERIENGUIA'
      FieldName = 'SERIENGUIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 180
    end
    object ppField182: TppField
      FieldAlias = 'FLAGVAR_1'
      FieldName = 'FLAGVAR_1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 181
    end
    object ppField183: TppField
      FieldAlias = 'ARTDESOBS'
      FieldName = 'ARTDESOBS'
      FieldLength = 256
      DataType = dtMemo
      DisplayWidth = 10
      Position = 182
      Searchable = False
      Sortable = False
    end
    object ppField184: TppField
      FieldAlias = 'DARTOBS'
      FieldName = 'DARTOBS'
      FieldLength = 256
      DataType = dtMemo
      DisplayWidth = 10
      Position = 183
      Searchable = False
      Sortable = False
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 412
    Top = 121
  end
  object ppdb1: TppDBPipeline
    UserName = 'db1'
    Left = 664
    Top = 176
  end
  object ppr1: TppReport
    AutoStop = False
    DataPipeline = ppdb1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\FAC\Dema\VentaArticuloGrupos.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 698
    Top = 176
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdb1'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
end
