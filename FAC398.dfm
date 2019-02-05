object FObsequioMovNormal: TFObsequioMovNormal
  Left = 267
  Top = 172
  Width = 433
  Height = 439
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Entrega de Obsequio'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 37
    Width = 75
    Height = 20
    Caption = 'Asociado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 298
    Top = 9
    Width = 34
    Height = 24
    Caption = 'No.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 14
    Top = 86
    Width = 403
    Height = 227
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 6
    object Label1: TLabel
      Left = 6
      Top = 9
      Width = 77
      Height = 20
      Caption = 'Obsequio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAgregar: TButton
      Left = 362
      Top = 30
      Width = 28
      Height = 24
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAgregarClick
    end
    object btnRetirar: TButton
      Left = 363
      Top = 63
      Width = 28
      Height = 24
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnRetirarClick
    end
    object VEdObsequios: TValueListEditor
      Left = 5
      Top = 59
      Width = 354
      Height = 161
      KeyOptions = [keyUnique]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
      TabOrder = 2
      TitleCaptions.Strings = (
        'ID'
        'DESCRIPCION')
      ColWidths = (
        150
        198)
    end
    object dblcObsequio: TwwDBLookupCombo
      Left = 5
      Top = 30
      Width = 94
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ARTID'#9'10'#9'Id.'#9'F'
        'ARTDES'#9'40'#9'Art'#237'culo'#9'F')
      LookupField = 'ARTID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcObsequioChange
      OnExit = dblcObsequioExit
    end
    object dbeObsequio: TwwDBEdit
      Left = 102
      Top = 30
      Width = 257
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object bbtnAcepta: TBitBtn
    Left = 174
    Top = 372
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 0
    OnClick = bbtnAceptaClick
  end
  object BitBtn2: TBitBtn
    Left = 342
    Top = 372
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object bbtnImp: TBitBtn
    Left = 258
    Top = 372
    Width = 75
    Height = 25
    Caption = 'Imprime'
    TabOrder = 2
    OnClick = bbtnImpClick
  end
  object Panel1: TPanel
    Left = 16
    Top = 319
    Width = 401
    Height = 47
    Color = 14869218
    Enabled = False
    TabOrder = 3
    object cbImp: TCheckBox
      Left = 227
      Top = 11
      Width = 105
      Height = 24
      Caption = 'Impreso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cbOk: TCheckBox
      Left = 34
      Top = 12
      Width = 130
      Height = 24
      Caption = 'Entregado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object dbeAso: TwwDBEdit
    Left = 18
    Top = 58
    Width = 397
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeNumero: TwwDBEdit
    Left = 337
    Top = 5
    Width = 78
    Height = 30
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object cbDiseno: TCheckBox
    Left = 118
    Top = 376
    Width = 14
    Height = 17
    TabOrder = 7
    Visible = False
  end
  object ppdb1: TppDBPipeline
    UserName = 'db1'
    Left = 21
    Top = 372
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
    Template.FileName = 'C:\oaEjecuta\RTMS\FAC\Dema\ReciboObsequio.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 53
    Top = 372
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
    Left = 85
    Top = 372
  end
end
