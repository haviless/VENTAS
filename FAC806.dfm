object FVentaUtilidad: TFVentaUtilidad
  Left = 572
  Top = 284
  Width = 280
  Height = 300
  BorderIcons = [biSystemMenu]
  Caption = 'Reporte de Utilidades'
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
    Left = 153
    Top = 208
  end
  object ppr1: TppReport
    AutoStop = False
    DataPipeline = ppdb1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter 8 1/2 x 11 in'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 15000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 5000
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\FAC\Dema\VentaUtilidad.rtm'
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
    Left = 173
    Top = 200
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdb1'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29369
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
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Total Venta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 107950
        mmTop = 17198
        mmWidth = 16298
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Sin IGV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 114036
        mmTop = 21167
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Venta Inc.IGV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 164042
        mmTop = 17198
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 176477
        mmTop = 21167
        mmWidth = 4445
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 21167
        mmWidth = 7408
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
        mmTop = 13229
        mmWidth = 187325
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'VENTAS DE CONCESIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 79904
        mmTop = 265
        mmWidth = 31221
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
        mmTop = 4498
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
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'TM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 101336
        mmTop = 17198
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'CONCESION:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 79904
        mmTop = 8996
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 136525
        mmTop = 21167
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'TOTAL VENTA SIN IGV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 132292
        mmTop = 17198
        mmWidth = 28152
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'US$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 155311
        mmTop = 21167
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'D O C U M E N T O'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 18256
        mmTop = 21167
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'DESCRIPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 47890
        mmTop = 21167
        mmWidth = 16404
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'TITNC2'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 186002
        mmTop = 17198
        mmWidth = 2963
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
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
        mmLeft = 46302
        mmTop = 265
        mmWidth = 51065
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'FACFECHA'
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
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'NFAC'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 32015
        mmTop = 265
        mmWidth = 10372
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'FACSERIE'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 24606
        mmTop = 265
        mmWidth = 4445
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DOCID'
        DataPipeline = ppdb1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4233
        mmLeft = 19315
        mmTop = 265
        mmWidth = 3440
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
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'TOTAL GENERAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 104246
        mmTop = 5292
        mmWidth = 19315
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
    Left = 129
    Top = 200
  end
end
