object FToolResNac: TFToolResNac
  Left = 126
  Top = 232
  Width = 714
  Height = 106
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl: TPanel
    Left = -1
    Top = 0
    Width = 707
    Height = 69
    BevelInner = bvRaised
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Bevel1: TBevel
      Left = 402
      Top = 12
      Width = 171
      Height = 50
      Shape = bsFrame
    end
    object Label2: TLabel
      Left = 412
      Top = 13
      Width = 78
      Height = 13
      Caption = 'Tipo de Moneda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object bvFechas: TBevel
      Left = 11
      Top = 12
      Width = 279
      Height = 50
      Shape = bsFrame
    end
    object Label1: TLabel
      Left = 18
      Top = 29
      Width = 35
      Height = 15
      Caption = 'Inicial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 152
      Top = 29
      Width = 25
      Height = 15
      Caption = 'Final'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 30
      Top = 7
      Width = 69
      Height = 15
      Caption = 'Rango Fechas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object bbtnFiltrar: TBitBtn
      Left = 581
      Top = 12
      Width = 46
      Height = 42
      TabOrder = 5
      OnClick = bbtnFiltrarClick
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
    object dbdtpFecIni: TwwDBDateTimePicker
      Left = 57
      Top = 24
      Width = 88
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 0
    end
    object dbdtpFecFin: TwwDBDateTimePicker
      Left = 182
      Top = 24
      Width = 99
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 1
      OnExit = dbdtpFecFinExit
    end
    object rdgTipo: TRadioGroup
      Left = 295
      Top = 6
      Width = 103
      Height = 57
      Caption = 'Tipo'
      ItemIndex = 0
      Items.Strings = (
        'Corporativa'
        'Vendedor')
      TabOrder = 2
    end
    object bbtnPrint: TBitBtn
      Left = 645
      Top = 12
      Width = 46
      Height = 42
      Hint = 'Consulta de Venta Neta'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = bbtnPrintClick
      Glyph.Data = {
        CE020000424DCE020000000000007600000028000000220000001E0000000100
        0400000000005802000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFF0078800FFFFFFFFFFFFFFFF000000FFFFFFFFF00777888800
        FFFFFFFFFFFFFF000000FFFFFFF007777800888800FFFFFFFFFFFF000000FFFF
        F0077778878800888800FFFFFFFFFF000000FFF00777788787888800888800FF
        FFFFFF000000FF07777887778788888800888800FFFFFF000000FF8778877777
        87888888880088880FFFFF000000FF888777777787888888888800880FFFFF00
        0000F8878777777787888888888888000FFFFF000000F8F7877777778F888888
        8888888800FFFF000000F8F78777777F8877888888888888800FFF000000F8F7
        87777FF777887788888888888080FF000000F8F7877FF7777777887788888888
        80780F000000F8F78FF77799778877887788888880788F000000F8FF8877AA77
        8877777088778888808FFF000000F88F778877887777700F7088778880FFFF00
        0000FFF88F77888877700FFFF077887780FFFF000000FFFFF88F7788800FFFCC
        F7087788FFFFFF000000FFFFFFF88F7788FFCCFFFF0888FFFFFFFF000000FFFF
        FFFFF88F778FFFFCCF70FFFFFFFFFF000000FFFFFFFFFFF88F8FFCCFFFF70FFF
        FFFFFF000000FFFFFFFFFFFFF888FFFFCCFF70FFFFFFFF000000FFFFFFFFFFFF
        FFF8FFCCFFFFF70FFFFFFF000000FFFFFFFFFFFFFFFF8FFFFFCCFF700FFFFF00
        0000FFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFF000000FFFFFFFFFFFFFFFFFF8F
        FFFFF88FFFFFFF000000FFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFF888FFFFFFFFFFF000000}
      Layout = blGlyphTop
    end
    object dblcTMon: TwwDBLookupCombo
      Left = 409
      Top = 28
      Width = 46
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'Id'#9'F'
        'TMONDES'#9'23'#9'Moneda'#9'F')
      LookupTable = DMFAC.cdsTMon
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcTMonExit
    end
    object edtTMon: TEdit
      Left = 458
      Top = 29
      Width = 107
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object ppdbResumen: TppDBPipeline
    UserName = 'dbResumen'
    Left = 191
    Top = 24
  end
  object ppRResumen: TppReport
    AutoStop = False
    DataPipeline = ppdbResumen
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 378090
    PrinterSetup.PaperSize = 123
    Template.FileName = 'C:\SOLExes\SOLFormatos\Fac\Incoresa\ResVentasNacional.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 255
    Top = 16
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbResumen'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'RESUMEN DE VENTAS NACIONAL IMPORTADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 74083
        mmTop = 4233
        mmWidth = 93398
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'lblPeriodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 177007
        mmTop = 4233
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Usuario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 233628
        mmTop = 4763
        mmWidth = 10848
        BandType = 0
      end
      object pplblUser: TppLabel
        UserName = 'lblUser'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 246857
        mmTop = 4763
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Fecha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 4763
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Hora:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 10848
        mmWidth = 7144
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 14288
        mmTop = 4763
        mmWidth = 14288
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 14023
        mmTop = 10583
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'VENDEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 23019
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'INDUSTRIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 23019
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'CUOTA MES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 41804
        mmTop = 23019
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'AVANCE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69586
        mmTop = 23019
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 91017
        mmTop = 23019
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 123296
        mmTop = 23019
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'NACIONAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 131234
        mmTop = 16140
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'TOT.NAC.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165100
        mmTop = 23019
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label101'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 185473
        mmTop = 23019
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label14'
        Caption = 'STANLEY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 203730
        mmTop = 23019
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 224632
        mmTop = 23019
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label15'
        Caption = 'OTROS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 242094
        mmTop = 23019
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label17'
        Caption = 'IMPORTADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 229659
        mmTop = 16140
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label18'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 259292
        mmTop = 23019
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label19'
        Caption = 'TOT.IMPORT.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 266171
        mmTop = 23019
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 293688
        mmTop = 23019
        mmWidth = 2646
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 31750
        mmTop = 28575
        mmWidth = 273051
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'OTROS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 136790
        mmTop = 23283
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 155046
        mmTop = 23019
        mmWidth = 2646
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 97631
        mmTop = 21167
        mmWidth = 93927
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 202936
        mmTop = 21167
        mmWidth = 101071
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VEID'
        DataPipeline = ppdbResumen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VENOMBRES'
        DataPipeline = ppdbResumen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 11377
        mmTop = 0
        mmWidth = 31485
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VECUOTA'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 42598
        mmTop = 0
        mmWidth = 17991
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'AVANCE'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 71438
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PORCENAVANCE'
        DataPipeline = ppdbResumen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 85990
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'MONTOMEIND'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 99219
        mmTop = 0
        mmWidth = 17991
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PORCENIND'
        DataPipeline = ppdbResumen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 118269
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TOTNAC'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 161925
        mmTop = 0
        mmWidth = 17991
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'PORCENTOTNAC'
        DataPipeline = ppdbResumen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 181240
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'MONTOSTANLEY'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 200290
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'PORCENSTANLEY'
        DataPipeline = ppdbResumen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 219075
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'MONTOIMPOTROS'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 234686
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'PORCENOTROS'
        DataPipeline = ppdbResumen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 253736
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TOTIMP'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 269082
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'PORCENTOTIMP'
        DataPipeline = ppdbResumen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 288132
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'MONTOMEOTROS'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 130175
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'PORCENOTROS'
        DataPipeline = ppdbResumen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 149754
        mmTop = 0
        mmWidth = 8202
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
      mmHeight = 10583
      mmPrintPosition = 0
      object ppLabel23: TppLabel
        UserName = 'Label201'
        Caption = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 2646
        mmWidth = 10848
        BandType = 7
      end
      object ppDBTotCuota: TppDBCalc
        UserName = 'DBTotCuota'
        DataField = 'VECUOTA'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 2646
        mmWidth = 18256
        BandType = 7
      end
      object ppDBTotAvance: TppDBCalc
        UserName = 'DBTotAvance'
        DataField = 'AVANCE'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 64823
        mmTop = 2646
        mmWidth = 19844
        BandType = 7
      end
      object ppDBTotInd: TppDBCalc
        UserName = 'DBTotInd'
        DataField = 'MONTOMEIND'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 98954
        mmTop = 2646
        mmWidth = 18256
        BandType = 7
      end
      object ppDBTotNac: TppDBCalc
        UserName = 'DBTotNac'
        DataField = 'TOTNAC'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 161925
        mmTop = 2646
        mmWidth = 18256
        BandType = 7
      end
      object ppDBTotStanley: TppDBCalc
        UserName = 'DBTotStanley'
        DataField = 'MONTOSTANLEY'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 200290
        mmTop = 2646
        mmWidth = 17463
        BandType = 7
      end
      object ppDBTotOtrosImp: TppDBCalc
        UserName = 'DBTotOtrosImp'
        DataField = 'MONTOIMPOTROS'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 235215
        mmTop = 2910
        mmWidth = 17463
        BandType = 7
      end
      object ppDBTotImp: TppDBCalc
        UserName = 'DBTotImp'
        DataField = 'TOTIMP'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 269346
        mmTop = 2646
        mmWidth = 17727
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 31750
        mmTop = 1588
        mmWidth = 273051
        BandType = 7
      end
      object ppVTotPorAvance: TppVariable
        UserName = 'VTotPorAvance'
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        OnCalc = ppVTotPorAvanceCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 85990
        mmTop = 2646
        mmWidth = 8202
        BandType = 7
      end
      object ppDBTotOtrosNac: TppDBCalc
        UserName = 'DBTotOtrosNac'
        DataField = 'MONTOMEOTROS'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 129911
        mmTop = 2646
        mmWidth = 18256
        BandType = 7
      end
      object ppDBTotPorInd: TppVariable
        UserName = 'DBTotPorInd'
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        OnCalc = ppDBTotPorIndCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 118269
        mmTop = 2646
        mmWidth = 8202
        BandType = 7
      end
      object ppDBTotPorOtrosNac: TppVariable
        UserName = 'DBTotPorOtrosNac'
        CalcOrder = 2
        DataType = dtDouble
        DisplayFormat = '##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        OnCalc = ppDBTotPorOtrosNacCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 149754
        mmTop = 2381
        mmWidth = 8202
        BandType = 7
      end
      object ppDBTotPorcNac: TppVariable
        UserName = 'DBTotPorcNac'
        CalcOrder = 3
        DataType = dtDouble
        DisplayFormat = '##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        OnCalc = ppDBTotPorcNacCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 181240
        mmTop = 2646
        mmWidth = 8202
        BandType = 7
      end
      object ppDBTotPorStanley: TppVariable
        UserName = 'DBTotPorStanley'
        CalcOrder = 4
        DataType = dtDouble
        DisplayFormat = '##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        OnCalc = ppDBTotPorStanleyCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 219075
        mmTop = 2646
        mmWidth = 8202
        BandType = 7
      end
      object ppDBTotPorOtrosImp: TppVariable
        UserName = 'DBTotPorOtrosImp'
        CalcOrder = 5
        DataType = dtDouble
        DisplayFormat = '##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        OnCalc = ppDBTotPorOtrosImpCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 253736
        mmTop = 2646
        mmWidth = 8202
        BandType = 7
      end
      object ppDBTotPorImp: TppVariable
        UserName = 'DBTotPorImp'
        CalcOrder = 6
        DataType = dtDouble
        DisplayFormat = '##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 9
        Font.Style = []
        OnCalc = ppDBTotPorImpCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 288132
        mmTop = 2646
        mmWidth = 8202
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'ppDBText1'
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'TVTADES'
          DataPipeline = ppdbResumen
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppdbResumen'
          mmHeight = 3969
          mmLeft = 3704
          mmTop = 265
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'TOTAL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 2117
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotCuota: TppDBCalc
          UserName = 'DBSTotCuota'
          DataField = 'VECUOTA'
          DataPipeline = ppdbResumen
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbResumen'
          mmHeight = 3969
          mmLeft = 42598
          mmTop = 2117
          mmWidth = 17992
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotAvance: TppDBCalc
          UserName = 'DBSTotAvance'
          DataField = 'AVANCE'
          DataPipeline = ppdbResumen
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbResumen'
          mmHeight = 3969
          mmLeft = 65088
          mmTop = 2117
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotInd: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'MONTOMEIND'
          DataPipeline = ppdbResumen
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbResumen'
          mmHeight = 3969
          mmLeft = 99219
          mmTop = 2117
          mmWidth = 17992
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotNac: TppDBCalc
          UserName = 'DBSTotNac'
          DataField = 'TOTNAC'
          DataPipeline = ppdbResumen
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbResumen'
          mmHeight = 3969
          mmLeft = 162190
          mmTop = 2117
          mmWidth = 17991
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotStanley: TppDBCalc
          UserName = 'DBSTotStanley'
          DataField = 'MONTOSTANLEY'
          DataPipeline = ppdbResumen
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbResumen'
          mmHeight = 3969
          mmLeft = 200555
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotOtrosImp: TppDBCalc
          UserName = 'DBSTotOtrosImp'
          DataField = 'MONTOIMPOTROS'
          DataPipeline = ppdbResumen
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbResumen'
          mmHeight = 3969
          mmLeft = 235480
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotImp: TppDBCalc
          UserName = 'DBSTotImp'
          DataField = 'TOTIMP'
          DataPipeline = ppdbResumen
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbResumen'
          mmHeight = 3969
          mmLeft = 269611
          mmTop = 2117
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 529
          mmLeft = 31750
          mmTop = 1058
          mmWidth = 273051
          BandType = 5
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          AutoSize = True
          DataField = 'TVTADES'
          DataPipeline = ppdbResumen
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppdbResumen'
          mmHeight = 3969
          mmLeft = 13758
          mmTop = 2117
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object ppVSTotPorAvance: TppVariable
          UserName = 'VSTotPorAvance'
          CalcOrder = 0
          DataType = dtDouble
          DisplayFormat = '##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          OnCalc = ppVSTotPorAvanceCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 85990
          mmTop = 2117
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotOtrosNac: TppDBCalc
          UserName = 'DBSTotOtrosNac'
          DataField = 'MONTOMEOTROS'
          DataPipeline = ppdbResumen
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbResumen'
          mmHeight = 3969
          mmLeft = 130175
          mmTop = 2117
          mmWidth = 17992
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotPorInd: TppVariable
          UserName = 'DBSTotPorInd'
          CalcOrder = 1
          DataType = dtDouble
          DisplayFormat = '##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          OnCalc = ppDBSTotPorIndCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 118269
          mmTop = 2117
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotPorOtrosNac: TppVariable
          UserName = 'DBSTotPorOtrosNac'
          CalcOrder = 2
          DataType = dtDouble
          DisplayFormat = '##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          OnCalc = ppDBSTotPorOtrosNacCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 149754
          mmTop = 2117
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotPorcNac: TppVariable
          UserName = 'DBSTotPorcNac'
          CalcOrder = 3
          DataType = dtDouble
          DisplayFormat = '##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          OnCalc = ppDBSTotPorcNacCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 181240
          mmTop = 2117
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotPorStanley: TppVariable
          UserName = 'DBSTotPorStanley'
          CalcOrder = 4
          DataType = dtDouble
          DisplayFormat = '##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          OnCalc = ppDBSTotPorStanleyCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 219075
          mmTop = 2381
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotPorOtrosImp: TppVariable
          UserName = 'DBSTotPorOtrosImp'
          AutoSize = False
          CalcOrder = 5
          DataType = dtDouble
          DisplayFormat = '##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          OnCalc = ppDBSTotPorOtrosImpCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 253736
          mmTop = 2117
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object ppDBSTotPorImp: TppVariable
          UserName = 'DBSTotPorImp'
          CalcOrder = 6
          DataType = dtDouble
          DisplayFormat = '##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Size = 9
          Font.Style = []
          OnCalc = ppDBSTotPorImpCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 288132
          mmTop = 2117
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 567
    Top = 8
  end
end
