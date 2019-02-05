object FSeguimientoCompra: TFSeguimientoCompra
  Left = 593
  Top = 342
  Width = 280
  Height = 300
  BorderIcons = [biSystemMenu]
  Caption = 'Seguimiento de Compras'
  Color = 14869218
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 280
  Constraints.MinHeight = 300
  Constraints.MinWidth = 280
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
    Left = 16
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
    Left = 62
    Top = 21
    Width = 195
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
    Left = 14
    Top = 68
    Width = 244
    Height = 73
    Caption = 'Rango'
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
      Left = 147
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
    end
    object dtpFin: TwwDBDateTimePicker
      Left = 128
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
  object bbtnRep2: TBitBtn
    Left = 166
    Top = 229
    Width = 50
    Height = 32
    Hint = 'Imprimir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
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
  object gbOpc: TGroupBox
    Left = 16
    Top = 308
    Width = 243
    Height = 85
    Caption = 'Opcional'
    TabOrder = 4
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
    Left = 15
    Top = 145
    Width = 243
    Height = 74
    Caption = 'Opciones'
    TabOrder = 5
    Visible = False
    object Label34: TLabel
      Left = 23
      Top = 21
      Width = 38
      Height = 13
      Caption = 'Servicio'
      Transparent = True
    end
    object dblcdServicio: TwwDBLookupComboDlg
      Left = 15
      Top = 38
      Width = 82
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ARTID'#9'10'#9'C'#243'digo Servicio'#9'F'
        'ARTDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupField = 'ARTID'
      MaxLength = 8
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdServicioExit
    end
    object dbeServicios: TwwDBEdit
      Left = 99
      Top = 38
      Width = 125
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object bbtnExcel1: TBitBtn
    Left = 223
    Top = 229
    Width = 35
    Height = 32
    TabOrder = 6
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
    Left = 18
    Top = 230
    Width = 49
    Height = 25
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object cbDiseno: TCheckBox
    Left = 73
    Top = 228
    Width = 14
    Height = 17
    TabOrder = 8
    Visible = False
  end
  object ppdb1: TppDBPipeline
    UserName = 'db1'
    Left = 145
    Top = 184
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
    Left = 121
    Top = 200
  end
  object ppr1: TppReport
    AutoStop = False
    DataPipeline = ppdb1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter 8 1/2 x 11 in'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\FAC\Dema\SeguimientoCompras.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 160
    Top = 200
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdb1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
end
