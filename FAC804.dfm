object FVentaPorUsuario: TFVentaPorUsuario
  Left = 326
  Top = 193
  Width = 387
  Height = 405
  BorderIcons = [biSystemMenu]
  Caption = 'Reporte de Ventas - Cobrado'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 5
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
  object dblcCia: TwwDBLookupCombo
    Left = 10
    Top = 21
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
    Left = 56
    Top = 21
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
  object Rango: TGroupBox
    Left = 10
    Top = 60
    Width = 249
    Height = 73
    Caption = 'Fecha'
    TabOrder = 2
    object Label1: TLabel
      Left = 44
      Top = 20
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
      Left = 152
      Top = 20
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
    object dtpInicio: TwwDBDateTimePicker
      Left = 20
      Top = 36
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
      TabOrder = 0
      OnExit = dtpInicioExit
    end
    object dtpFin: TwwDBDateTimePicker
      Left = 133
      Top = 36
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
      TabOrder = 1
    end
  end
  object gbOpc: TGroupBox
    Left = 16
    Top = 372
    Width = 243
    Height = 85
    Caption = 'Opcional'
    TabOrder = 3
    Visible = False
    object Label6: TLabel
      Left = 18
      Top = 28
      Width = 135
      Height = 15
      Caption = 'Linea de Comercializaci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object dblcLinCom: TwwDBLookupCombo
      Left = 18
      Top = 44
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
      LookupField = 'LINCOM'
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
    end
    object Edit1: TEdit
      Left = 63
      Top = 44
      Width = 160
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
  end
  object gbOpciones: TGroupBox
    Left = 8
    Top = 145
    Width = 357
    Height = 216
    Caption = 'Opciones'
    TabOrder = 4
    object Label34: TLabel
      Left = 23
      Top = 109
      Width = 36
      Height = 13
      Caption = 'Usuario'
      Transparent = True
    end
    object Label4: TLabel
      Left = 23
      Top = 160
      Width = 46
      Height = 13
      Caption = 'Vendedor'
      Transparent = True
    end
    object Label5: TLabel
      Left = 26
      Top = 31
      Width = 33
      Height = 13
      Caption = 'Tienda'
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 5
      Top = 93
      Width = 342
      Height = 3
    end
    object dblcdServicio: TwwDBLookupComboDlg
      Left = 15
      Top = 126
      Width = 100
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'FACUSER'#9'15'#9'Usuario'#9'F'
        'USERNOM'#9'30'#9'Nombre'#9'F')
      LookupField = 'FACUSER'
      MaxLength = 8
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcdServicioChange
      OnEnter = dblcdServicioEnter
    end
    object dbeServicios: TwwDBEdit
      Left = 116
      Top = 126
      Width = 160
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnRep2: TBitBtn
      Left = 240
      Top = 100
      Width = 31
      Height = 23
      Hint = 'Imprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
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
    object dblcdVendedor: TwwDBLookupComboDlg
      Left = 15
      Top = 177
      Width = 100
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'VEID'#9'15'#9'Vendedor'#9'F'
        'VENOMBRES'#9'30'#9'Nombre'#9'F')
      LookupField = 'VEID'
      MaxLength = 8
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblcdVendedorChange
      OnEnter = dblcdServicioEnter
      OnExit = dblcdVendedorExit
    end
    object dbeVendedores: TwwDBEdit
      Left = 116
      Top = 177
      Width = 160
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object BBtnRptVendedores: TBitBtn
      Left = 240
      Top = 151
      Width = 31
      Height = 23
      Hint = 'Imprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnClick = BBtnRptVendedoresClick
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
    object bbtnRepN1: TBitBtn
      Left = 280
      Top = 120
      Width = 33
      Height = 32
      Hint = 'Imprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = bbtnRepN1Click
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
    object bbtnRepN2: TBitBtn
      Left = 280
      Top = 170
      Width = 33
      Height = 32
      Hint = 'Imprimir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = bbtnRepN2Click
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
    object dblcTienda: TwwDBLookupCombo
      Left = 15
      Top = 48
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
        'TIE_DES'#9'40'#9'Tienda'#9'F')
      LookupField = 'TIE_ID'
      Options = [loColLines, loTitles]
      ParentFont = False
      TabOrder = 8
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcTiendaExit
      OnNotInList = dblcTiendaNotInList
    end
    object edtTienda: TEdit
      Left = 58
      Top = 48
      Width = 119
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
    end
    object bbtnExcUsu: TBitBtn
      Left = 317
      Top = 120
      Width = 33
      Height = 32
      TabOrder = 10
      OnClick = bbtnExcUsuClick
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
    object bbtnExcVen: TBitBtn
      Left = 317
      Top = 170
      Width = 33
      Height = 32
      TabOrder = 11
      OnClick = bbtnExcVenClick
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
    object cbDiseno: TCheckBox
      Left = 193
      Top = 52
      Width = 14
      Height = 17
      TabOrder = 12
      Visible = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 287
    Top = 17
    Width = 82
    Height = 32
    Caption = 'Inc N.C.'
    TabOrder = 5
    Visible = False
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object GroupBox1: TGroupBox
    Left = 264
    Top = 59
    Width = 98
    Height = 73
    Caption = 'Tipo'
    TabOrder = 6
    object cbLiq: TCheckBox
      Left = 14
      Top = 32
      Width = 74
      Height = 17
      Caption = 'Liquidaci'#243'n'
      TabOrder = 0
      OnClick = cbLiqClick
    end
  end
  object dbgExp: TwwDBGrid
    Left = 165
    Top = 7
    Width = 103
    Height = 51
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clMoneyGreen
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = 9359346
    TabOrder = 7
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
  object ppdb1: TppDBPipeline
    UserName = 'db1'
    Left = 265
    Top = 169
  end
  object ppr1: TppReport
    AutoStop = False
    DataPipeline = ppdb1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 15000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 5000
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\FAC\Dema\VentaConcesiones.rtm'
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 293
    Top = 169
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdb1'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29898
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CIADES'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 265
        mmWidth = 64294
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Monto de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 121973
        mmTop = 16933
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Unidades'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 99748
        mmTop = 16933
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Contribuci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 144198
        mmTop = 16933
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'por Art'#237'culo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 144198
        mmTop = 21167
        mmWidth = 17780
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Porcentaje de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 169598
        mmTop = 16933
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Participaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 169598
        mmTop = 21167
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Venta Soles'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 117475
        mmTop = 21167
        mmWidth = 16298
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Vendidas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 99748
        mmTop = 21167
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Articulos Vendidos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 19050
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 25135
        mmWidth = 187325
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 12700
        mmWidth = 187325
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'VENTAS POR LINEA DE COMERCIALIZACION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 68792
        mmTop = 4498
        mmWidth = 53446
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 168805
        mmTop = 265
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNoDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 168805
        mmTop = 8996
        mmWidth = 11906
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 168805
        mmTop = 4498
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'RANGO'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 71199
        mmTop = 8996
        mmWidth = 48895
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Modulo de Ventas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 4498
        mmWidth = 23813
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ARTID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 265
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ARTDES'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 17727
        mmTop = 265
        mmWidth = 77788
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 98954
        mmTop = 265
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 116681
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataPipeline = ppdb1
        DisplayFormat = '#,0.0000%;-#,0.0000%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 144727
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataPipeline = ppdb1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 116681
        mmTop = 5292
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'TOTAL GENERAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 86519
        mmTop = 5292
        mmWidth = 19262
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 529
        mmWidth = 187325
        BandType = 7
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
    Left = 321
    Top = 169
  end
  object ppr2: TppReport
    AutoStop = False
    DataPipeline = ppDB2
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 15000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\FAC\Dema\VentaVendedores.rtm'
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 293
    Top = 202
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB2'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText1'
        DataField = 'CIADES'
        DataPipeline = ppDB2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 3810
        mmLeft = 1588
        mmTop = 265
        mmWidth = 64294
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 22754
        mmWidth = 182563
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 13229
        mmWidth = 182563
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label13'
        Caption = 'VENTAS POR VENDEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 75810
        mmTop = 265
        mmWidth = 39412
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 265
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNoDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 8996
        mmWidth = 11906
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 4498
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'RANGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 70405
        mmTop = 4498
        mmWidth = 49953
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label18'
        Caption = 'Modulo de Ventas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 4498
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label16'
        Caption = 'DOCUMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 2646
        mmTop = 18256
        mmWidth = 16087
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label19'
        Caption = 'Forma de Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 24871
        mmTop = 18256
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label5'
        Caption = 'Cr'#233'dito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 87842
        mmTop = 16933
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label6'
        Caption = 'Personal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 105569
        mmTop = 20373
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label7'
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 68263
        mmTop = 16933
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label9'
        Caption = 'Estado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 46302
        mmTop = 18256
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label14'
        Caption = '(Importes expresados en Nuevos Soles)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 70115
        mmTop = 8996
        mmWidth = 50536
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label20'
        Caption = 'Inicial / N.C'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 136790
        mmTop = 20373
        mmWidth = 12488
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label21'
        Caption = 'No.Operaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 153194
        mmTop = 18256
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label22'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 173567
        mmTop = 16933
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label23'
        Caption = 'Efectivo /'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 138377
        mmTop = 16933
        mmWidth = 10075
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label201'
        Caption = 'Operaci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 171980
        mmTop = 20373
        mmWidth = 11261
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label4'
        Caption = 'Cr'#233'dito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 106363
        mmTop = 16933
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label25'
        Caption = 'Mestros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 87313
        mmTop = 20373
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label26'
        Caption = 'Vale /'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 125234
        mmTop = 16933
        mmWidth = 6265
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label27'
        Caption = 'Req.Se.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 123444
        mmTop = 20373
        mmWidth = 8848
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label28'
        Caption = 'Factura/Boleta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 62706
        mmTop = 20373
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText3'
        DataField = 'DCCOMDES'
        DataPipeline = ppDB2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2910
        mmLeft = 24871
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'FACTOTMN'
        DataPipeline = ppDB2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2910
        mmLeft = 61383
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'NFAC'
        DataPipeline = ppDB2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2879
        mmLeft = 12700
        mmTop = 265
        mmWidth = 9483
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'FACSERIE'
        DataPipeline = ppDB2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2879
        mmLeft = 6085
        mmTop = 265
        mmWidth = 4064
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'DOCID'
        DataPipeline = ppDB2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2879
        mmLeft = 1588
        mmTop = 265
        mmWidth = 2709
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'IMPCRE'
        DataPipeline = ppDB2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2910
        mmLeft = 85196
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'IMPCREPL'
        DataPipeline = ppDB2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2910
        mmLeft = 102659
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText16'
        DataField = 'FACESTADO'
        DataPipeline = ppDB2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2498
        mmLeft = 46831
        mmTop = 529
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText17'
        BlankWhenZero = True
        DataField = 'INICIAL'
        DataPipeline = ppDB2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2910
        mmLeft = 137054
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText14'
        DataField = 'NUMINI'
        DataPipeline = ppDB2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2879
        mmLeft = 153194
        mmTop = 265
        mmWidth = 16256
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'FECINI'
        DataPipeline = ppDB2
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2879
        mmLeft = 171186
        mmTop = 265
        mmWidth = 12192
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'IMPOTR'
        DataPipeline = ppDB2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2910
        mmLeft = 120121
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 16404
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'IMPCREPL'
        DataPipeline = ppDB2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2879
        mmLeft = 95092
        mmTop = 7938
        mmWidth = 20532
        BandType = 7
      end
      object ppLabel37: TppLabel
        UserName = 'Label15'
        Caption = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 7938
        mmWidth = 9260
        BandType = 7
      end
      object ppLabel38: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 2646
        mmWidth = 182563
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'IMPCRE'
        DataPipeline = ppDB2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2879
        mmLeft = 80635
        mmTop = 7938
        mmWidth = 17526
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        AutoSize = True
        DataField = 'FACTOTMN'
        DataPipeline = ppDB2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2879
        mmLeft = 55848
        mmTop = 7938
        mmWidth = 21675
        BandType = 7
      end
      object ppLabel39: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 12171
        mmWidth = 182563
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        AutoSize = True
        DataField = 'INICIAL'
        DataPipeline = ppDB2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2879
        mmLeft = 133509
        mmTop = 7938
        mmWidth = 16510
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        AutoSize = True
        DataField = 'IMPOTR'
        DataPipeline = ppDB2
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 2879
        mmLeft = 115560
        mmTop = 7938
        mmWidth = 17526
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'FACFECHA'
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBText22: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'FACFECHA'
          DataPipeline = ppDB2
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDB2'
          mmHeight = 4191
          mmLeft = 20108
          mmTop = 1323
          mmWidth = 17526
          BandType = 3
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'Label10'
          Caption = 'FECHA:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4022
          mmLeft = 4763
          mmTop = 1323
          mmWidth = 12869
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppLabel41: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '---------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 0
          mmWidth = 182563
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          AutoSize = True
          DataField = 'FACTOTMN'
          DataPipeline = ppDB2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDB2'
          mmHeight = 2879
          mmLeft = 55827
          mmTop = 5556
          mmWidth = 21675
          BandType = 5
          GroupNo = 0
        end
        object ppLabel42: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Total Vendedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 4233
          mmTop = 5556
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          AutoSize = True
          DataField = 'IMPCRE'
          DataPipeline = ppDB2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDB2'
          mmHeight = 2879
          mmLeft = 80635
          mmTop = 5556
          mmWidth = 17526
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          AutoSize = True
          DataField = 'IMPCREPL'
          DataPipeline = ppDB2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDB2'
          mmHeight = 2879
          mmLeft = 95092
          mmTop = 5556
          mmWidth = 20532
          BandType = 5
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText9'
          DataField = 'VENOMBRES'
          DataPipeline = ppDB2
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDB2'
          mmHeight = 3175
          mmLeft = 22225
          mmTop = 5556
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          AutoSize = True
          DataField = 'INICIAL'
          DataPipeline = ppDB2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDB2'
          mmHeight = 2879
          mmLeft = 133509
          mmTop = 5556
          mmWidth = 16510
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = 'IMPOTR'
          DataPipeline = ppDB2
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDB2'
          mmHeight = 2879
          mmLeft = 115560
          mmTop = 5556
          mmWidth = 17526
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'FACUSER'
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppLabel43: TppLabel
          UserName = 'Label2'
          Caption = 'VENDEDOR:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3598
          mmLeft = 14765
          mmTop = 2910
          mmWidth = 18838
          BandType = 3
          GroupNo = 1
        end
        object ppDBText24: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'VENOMBRES'
          DataPipeline = ppDB2
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 9
          Font.Style = [fsBold]
          ReprintOnSubsequent = True
          SuppressRepeatedValues = True
          Transparent = True
          DataPipelineName = 'ppDB2'
          mmHeight = 3810
          mmLeft = 35983
          mmTop = 2910
          mmWidth = 20447
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object ppd2: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppr2
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 321
    Top = 202
  end
  object ppDB2: TppDBPipeline
    UserName = 'DB2'
    Left = 266
    Top = 203
  end
end
