object FCobroServicios: TFCobroServicios
  Left = 135
  Top = 132
  Width = 788
  Height = 533
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Generar Boleta de Venta / Factura'
  Color = clBtnFace
  Constraints.MaxHeight = 540
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 530
  Constraints.MinWidth = 780
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 1
    Width = 390
    Height = 24
    Caption = 'Cobranzas Servicios (Caja/Banco/Cr'#233'dito)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 408
    Top = 471
    Width = 58
    Height = 16
    Caption = 'Registros'
  end
  object dbgTransf: TwwDBGrid
    Left = 5
    Top = 61
    Width = 762
    Height = 400
    DisableThemesInTitle = False
    Selected.Strings = (
      'FORPAG'#9'09'#9'Origen'#9#9
      'NUMDOCPAG'#9'15'#9'N'#250'mero'#9#9
      'FECPAG'#9'10'#9'Fecha~Pago'#9#9
      'CLAUXID'#9'03'#9'Cl.~Aux.'#9#9
      'CLIEID'#9'11'#9'C'#243'digo~Cliente'#9#9
      'NOMBRE'#9'25'#9'Nombre~Cliente'#9#9
      'CPTOID'#9'07'#9'Cpto.~Pago'#9#9
      'CPTODES'#9'20'#9'Concepto~Pago'#9#9
      'TMONID'#9'2'#9'TM'#9#9
      'IMPORTE'#9'08'#9'Importe~Pago'#9#9
      'RUCDNI'#9'12'#9'Documento~Identidad'#9#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    OnRowChanged = dbgTransfRowChanged
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = 12904163
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnEnter = dbgTransfEnter
    object dbgTransfIButton: TwwIButton
      Left = 0
      Top = 0
      Width = 20
      Height = 35
      AllowAllUp = True
      Caption = 'B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = dbgTransfIButtonClick
    end
  end
  object bbtnBoleta: TBitBtn
    Left = 435
    Top = 33
    Width = 110
    Height = 25
    Caption = 'Genera Boleta '
    TabOrder = 1
    OnClick = bbtnBoletaClick
  end
  object bbtnTransfCaja: TBitBtn
    Left = 4
    Top = 467
    Width = 118
    Height = 25
    Caption = 'Transferir de Caja'
    TabOrder = 2
    OnClick = bbtnTransfCajaClick
  end
  object bbtnTransfCredito: TBitBtn
    Left = 127
    Top = 467
    Width = 118
    Height = 25
    Caption = 'Transferir Cr'#233'ditos'
    TabOrder = 3
    OnClick = bbtnTransfCreditoClick
  end
  object meReg: TMaskEdit
    Left = 471
    Top = 467
    Width = 39
    Height = 24
    Enabled = False
    TabOrder = 4
  end
  object dtpFecha: TwwDBDateTimePicker
    Left = 552
    Top = 34
    Width = 95
    Height = 24
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 5
  end
  object Z2bbtnImprime: TBitBtn
    Left = 520
    Top = 464
    Width = 32
    Height = 30
    Hint = 'Imprime Factura'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = Z2bbtnImprimeClick
    Glyph.Data = {
      BE080000424DBE0800000000000036000000280000001B0000001A0000000100
      18000000000088080000CE0E0000D80E00000000000000000000C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
      0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C080
      8080000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000808080C0C0
      C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C000000080808080800080808080
      8000808080808000808080808000808080808000808080808000808080808000
      808080808000808080808080808000000000C0C0C0C0C0C0C0C0C0000000C0C0
      C0C0C0C000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000C0C0C0C0C0C0000000C0C0C0C0C0C00000008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000000000C0C0C0
      C0C0C0000000C0C0C0C0C0C00000008080008080000000000000008080000000
      0000000080800000000000000080800080800080800080800000000000000000
      0000000000000000000000808000000000C0C0C0C0C0C0000000C0C0C0C0C0C0
      0000008080008080000000000000008080000000000000008080000000000000
      0080800080800080800080800000000000000000000000000000000000000080
      8000000000C0C0C0C0C0C0000000C0C0C0C0C0C0000000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      00808000808000808000808000808000808000808000000000C0C0C0C0C0C000
      0000C0C0C0C0C0C0000000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      00808000808000808000000000C0C0C0C0C0C0000000C0C0C0C0C0C0000000C0
      C0C0C0C0C0FFFFFFFFFFFFC0C0C0FFFFFFC0C0C0FFFFFFC0C0C0FFFFFFFFFFFF
      C0C0C0FFFFFFC0C0C0FFFFFFC0C0C0FFFFFFFFFFFFC0C0C0FFFFFFC0C0C00000
      00C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C0C0C0C0C0C0C0000000C0C0
      C0C0C0C0C0C0C0C0C0C0000000808000808000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808000808000
      000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C00000
      00000000000000000000FFFFFF00000000000080808080808000000080808000
      0000808080000000FFFFFF000000000000000000000000C0C0C0C0C0C0C0C0C0
      C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF0000000000008080800000
      00808080000000000000C0C0C0000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
      0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF000000
      808080000000000000808080000000FFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
      0000FFFFFF000000000000808080808080000000000000FFFFFF000000000000
      000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
      00000000000000000000000000000000000000000000000000C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
      0000}
  end
  object bbtnBuscaBol: TBitBtn
    Left = 663
    Top = 467
    Width = 103
    Height = 25
    Caption = 'Buscar Boletas'
    TabOrder = 7
    OnClick = bbtnBuscaBolClick
  end
  object bbtnPago: TBitBtn
    Left = 578
    Top = 467
    Width = 75
    Height = 25
    Caption = 'Pagos'
    TabOrder = 8
    OnClick = bbtnPagoClick
  end
  object bbtnFactura: TBitBtn
    Left = 655
    Top = 33
    Width = 110
    Height = 25
    Caption = 'Genera Factura'
    TabOrder = 9
    OnClick = bbtnFacturaClick
  end
  object pnlBusca: TPanel
    Left = 140
    Top = 167
    Width = 512
    Height = 73
    BevelInner = bvRaised
    BevelWidth = 3
    TabOrder = 10
    Visible = False
    object Label3: TLabel
      Left = 14
      Top = 26
      Width = 155
      Height = 20
      Caption = 'Buscar por Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object isBusca: TwwIncrementalSearch
      Left = 175
      Top = 24
      Width = 322
      Height = 24
      SearchField = 'NOMBRE'
      TabOrder = 0
      OnExit = isBuscaExit
    end
  end
  object bbtnOrdFecha: TBitBtn
    Left = 6
    Top = 33
    Width = 140
    Height = 25
    Caption = 'Ordenar por Fecha'
    TabOrder = 11
    OnClick = bbtnOrdFechaClick
  end
  object bbtnOrdNombre: TBitBtn
    Left = 155
    Top = 33
    Width = 140
    Height = 25
    Caption = 'Ordenar por Nombre'
    TabOrder = 12
    OnClick = bbtnOrdNombreClick
  end
  object bbtnFacCob: TBitBtn
    Left = 435
    Top = 3
    Width = 330
    Height = 25
    Caption = 'Factura / Boleta por Cheque / Dep'#243'sito'
    TabOrder = 13
    OnClick = bbtnFacCobClick
  end
  object BitBtn1: TBitBtn
    Left = 268
    Top = 467
    Width = 56
    Height = 25
    Caption = 'Becas'
    TabOrder = 14
    OnClick = BitBtn1Click
  end
  object bbtnEliminar: TBitBtn
    Left = 326
    Top = 467
    Width = 56
    Height = 25
    Caption = 'Eliminar'
    TabOrder = 15
    OnClick = bbtnEliminarClick
  end
  object cbDiseno: TCheckBox
    Left = 390
    Top = 470
    Width = 14
    Height = 17
    TabOrder = 16
    Visible = False
  end
  object ppdb1: TppDBPipeline
    UserName = 'db1'
    Left = 240
    Top = 360
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
    Template.FileName = 'C:\oaEjecuta\RTMS\FAC\Dema\CobranzasxFacturar.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 280
    Top = 360
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
    Left = 320
    Top = 360
  end
end
