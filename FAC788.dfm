object FToolResVtaNeta: TFToolResVtaNeta
  Left = 207
  Top = 248
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FToolResVtaNeta'
  ClientHeight = 75
  ClientWidth = 575
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 75
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object gbPeriodo: TGroupBox
      Left = 5
      Top = 4
      Width = 213
      Height = 55
      Caption = 'Periodo'
      TabOrder = 0
      object Label3: TLabel
        Left = 6
        Top = 12
        Width = 31
        Height = 15
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 109
        Top = 12
        Width = 29
        Height = 15
        Caption = 'Hasta'
      end
      object dtpDesde: TDateTimePicker
        Left = 6
        Top = 27
        Width = 99
        Height = 23
        Date = 36892.719144328700000000
        Time = 36892.719144328700000000
        TabOrder = 0
      end
      object dtpHasta: TDateTimePicker
        Left = 109
        Top = 27
        Width = 97
        Height = 23
        Date = 36943.719144328700000000
        Time = 36943.719144328700000000
        TabOrder = 1
      end
    end
    object Z1sbKardex: TBitBtn
      Left = 309
      Top = 11
      Width = 47
      Height = 39
      Hint = 'Consulta de Kardex'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z1sbKardexClick
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
    end
    object Z2bbtnInvVal: TBitBtn
      Left = 236
      Top = 13
      Width = 39
      Height = 31
      Default = True
      TabOrder = 2
      OnClick = Z2bbtnInvValClick
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
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DMFAC.dsKdx
    UserName = 'DBPipeline1'
    Left = 386
    Top = 18
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
      FieldAlias = 'ALMID'
      FieldName = 'ALMID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'TDAID'
      FieldName = 'TDAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'NISAID'
      FieldName = 'NISAID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'KDXID'
      FieldName = 'KDXID'
      FieldLength = 5
      DisplayWidth = 5
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'ARTID'
      FieldName = 'ARTID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'NISATIP'
      FieldName = 'NISATIP'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTPCU'
      FieldName = 'ARTPCU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTPCG'
      FieldName = 'ARTPCG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTPVU'
      FieldName = 'ARTPVU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTPVG'
      FieldName = 'ARTPVG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXCNTG'
      FieldName = 'KDXCNTG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXCNTU'
      FieldName = 'KDXCNTU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXPEDIDOG'
      FieldName = 'KDXPEDIDOG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXPEDIDOU'
      FieldName = 'KDXPEDIDOU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXSALDOG'
      FieldName = 'KDXSALDOG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXSALDOU'
      FieldName = 'KDXSALDOU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTCONT'
      FieldName = 'ARTCONT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      FieldAlias = 'UNMIDG'
      FieldName = 'UNMIDG'
      FieldLength = 3
      DisplayWidth = 3
      Position = 19
    end
    object ppField21: TppField
      FieldAlias = 'UNMIDU'
      FieldName = 'UNMIDU'
      FieldLength = 3
      DisplayWidth = 3
      Position = 20
    end
    object ppField22: TppField
      FieldAlias = 'GRARID'
      FieldName = 'GRARID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 21
    end
    object ppField23: TppField
      FieldAlias = 'FABID'
      FieldName = 'FABID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object ppField24: TppField
      FieldAlias = 'ARTSPRO'
      FieldName = 'ARTSPRO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 23
    end
    object ppField25: TppField
      FieldAlias = 'ARTSCA'
      FieldName = 'ARTSCA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField26: TppField
      FieldAlias = 'ARTPARA'
      FieldName = 'ARTPARA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 25
    end
    object ppField27: TppField
      FieldAlias = 'ARTSNA'
      FieldName = 'ARTSNA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'ARTFUC'
      FieldName = 'ARTFUC'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 28
    end
    object ppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTCRGO'
      FieldName = 'ARTCRGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppField31: TppField
      FieldAlias = 'ARTACTIVO'
      FieldName = 'ARTACTIVO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 30
    end
    object ppField32: TppField
      FieldAlias = 'CUENTAID'
      FieldName = 'CUENTAID'
      FieldLength = 20
      DisplayWidth = 20
      Position = 31
    end
    object ppField33: TppField
      FieldAlias = 'TINID'
      FieldName = 'TINID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 32
    end
    object ppField34: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 15
      DisplayWidth = 15
      Position = 33
    end
    object ppField35: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 34
    end
    object ppField36: TppField
      FieldAlias = 'TRIID'
      FieldName = 'TRIID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 35
    end
    object ppField37: TppField
      FieldAlias = 'ODCID'
      FieldName = 'ODCID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 36
    end
    object ppField38: TppField
      FieldAlias = 'CCOSID'
      FieldName = 'CCOSID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 37
    end
    object ppField39: TppField
      FieldAlias = 'NISASOLIC'
      FieldName = 'NISASOLIC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 38
    end
    object ppField40: TppField
      FieldAlias = 'NISAFREG'
      FieldName = 'NISAFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 39
    end
    object ppField41: TppField
      FieldAlias = 'NISANDOC'
      FieldName = 'NISANDOC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 40
    end
    object ppField42: TppField
      FieldAlias = 'NISAFDOC'
      FieldName = 'NISAFDOC'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 41
    end
    object ppField43: TppField
      FieldAlias = 'KDXUSER'
      FieldName = 'KDXUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 42
    end
    object ppField44: TppField
      FieldAlias = 'KDXFREG'
      FieldName = 'KDXFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 43
    end
    object ppField45: TppField
      FieldAlias = 'KDXHREG'
      FieldName = 'KDXHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 44
    end
    object ppField46: TppField
      FieldAlias = 'KDXANO'
      FieldName = 'KDXANO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 45
    end
    object ppField47: TppField
      FieldAlias = 'KDXMM'
      FieldName = 'KDXMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 46
    end
    object ppField48: TppField
      FieldAlias = 'KDXDD'
      FieldName = 'KDXDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 47
    end
    object ppField49: TppField
      FieldAlias = 'KDXTRI'
      FieldName = 'KDXTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 48
    end
    object ppField50: TppField
      FieldAlias = 'KDXSEM'
      FieldName = 'KDXSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 49
    end
    object ppField51: TppField
      FieldAlias = 'KDXSS'
      FieldName = 'KDXSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 50
    end
    object ppField52: TppField
      FieldAlias = 'KDXANOMM'
      FieldName = 'KDXANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 51
    end
    object ppField53: TppField
      FieldAlias = 'KDXAATRI'
      FieldName = 'KDXAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 52
    end
    object ppField54: TppField
      FieldAlias = 'KDXAASEM'
      FieldName = 'KDXAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 53
    end
    object ppField55: TppField
      FieldAlias = 'KDXAASS'
      FieldName = 'KDXAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 54
    end
    object ppField56: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 55
    end
    object ppField57: TppField
      FieldAlias = 'CALID'
      FieldName = 'CALID'
      FieldLength = 3
      DisplayWidth = 3
      Position = 56
    end
    object ppField58: TppField
      FieldAlias = 'DODCID'
      FieldName = 'DODCID'
      FieldLength = 3
      DisplayWidth = 3
      Position = 57
    end
    object ppField59: TppField
      FieldAlias = 'ARTDES'
      FieldName = 'ARTDES'
      FieldLength = 60
      DisplayWidth = 60
      Position = 58
    end
    object ppField60: TppField
      FieldAlias = 'KDXNREQ'
      FieldName = 'KDXNREQ'
      FieldLength = 15
      DisplayWidth = 15
      Position = 59
    end
    object ppField61: TppField
      FieldAlias = 'FAMID'
      FieldName = 'FAMID'
      FieldLength = 3
      DisplayWidth = 3
      Position = 60
    end
    object ppField62: TppField
      FieldAlias = 'SFAMID'
      FieldName = 'SFAMID'
      FieldLength = 8
      DisplayWidth = 8
      Position = 61
    end
    object ppField63: TppField
      FieldAlias = 'CUENTA2ID'
      FieldName = 'CUENTA2ID'
      FieldLength = 20
      DisplayWidth = 20
      Position = 62
    end
    object ppField64: TppField
      FieldAlias = 'KDXCVTAS'
      FieldName = 'KDXCVTAS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 63
    end
    object ppField65: TppField
      FieldAlias = 'TIPPRESID'
      FieldName = 'TIPPRESID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 64
    end
    object ppField66: TppField
      FieldAlias = 'PARPRESID'
      FieldName = 'PARPRESID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 65
    end
    object ppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTMORIPCG'
      FieldName = 'ARTMORIPCG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object ppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTMORIPCU'
      FieldName = 'ARTMORIPCU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 67
    end
    object ppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'TCAMB'
      FieldName = 'TCAMB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
    object ppField70: TppField
      FieldAlias = 'SITUACION'
      FieldName = 'SITUACION'
      FieldLength = 15
      DisplayWidth = 15
      Position = 69
    end
    object ppField71: TppField
      FieldAlias = 'NISAATERQS'
      FieldName = 'NISAATERQS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 70
    end
    object ppField72: TppField
      FieldAlias = 'NISSIT'
      FieldName = 'NISSIT'
      FieldLength = 15
      DisplayWidth = 15
      Position = 71
    end
    object ppField73: TppField
      FieldAlias = 'ACFREG'
      FieldName = 'ACFREG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 72
    end
    object ppField74: TppField
      FieldAlias = 'FNSERIE'
      FieldName = 'FNSERIE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 73
    end
    object ppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 74
    end
  end
  object ppReporte: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SOLFormatos\Fac\Incoresa\ResVtaNeta.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReportePreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 498
    Top = 10
    Version = '7.02'
    mmColumnWidth = 266701
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42598
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Resumen de Venta Neta Seg'#250'n Vencimiento (En D'#243'lares)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 75936
        mmTop = 6350
        mmWidth = 114829
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 6085
        mmLeft = 26988
        mmTop = 30163
        mmWidth = 211403
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Venta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 37571
        mmTop = 36513
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 57415
        mmTop = 36513
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Venta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 78317
        mmTop = 36513
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 98954
        mmTop = 36513
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Venta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 36513
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 36513
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Venta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 165365
        mmTop = 36513
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 185738
        mmTop = 36513
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Venta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 207169
        mmTop = 36513
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 229394
        mmTop = 36513
        mmWidth = 2646
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 65352
        mmTop = 30427
        mmWidth = 265
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 105569
        mmTop = 30427
        mmWidth = 265
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 152929
        mmTop = 30427
        mmWidth = 265
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 193940
        mmTop = 30427
        mmWidth = 265
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Lima'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 40746
        mmTop = 30692
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Provincias'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 74348
        mmTop = 30692
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Sub - Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 118798
        mmTop = 30692
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Corporativa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 164042
        mmTop = 30692
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 211667
        mmTop = 30427
        mmWidth = 10054
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 4233
        mmTop = 41010
        mmWidth = 234950
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Vencimiento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 37042
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Del Mes de:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 27517
        mmTop = 12965
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Enero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 53181
        mmTop = 12965
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DIAS'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 529
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'SEC01'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 28046
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PORLIM'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 52652
        mmTop = 529
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SEC02'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 69586
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PORPRO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 94192
        mmTop = 529
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VTASUB'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 112184
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PORSUB'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 138377
        mmTop = 529
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'SEC03'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PORCOR'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 181240
        mmTop = 529
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VTATOT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 198967
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'PORTOT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 224896
        mmTop = 529
        mmWidth = 9260
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'A'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 529
        mmWidth = 2117
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'D'#237'as'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 15346
        mmTop = 529
        mmWidth = 5556
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
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 3970
        mmTop = 1588
        mmWidth = 234950
        BandType = 7
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 3970
        mmTop = 7673
        mmWidth = 234950
        BandType = 7
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Totales'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 3175
        mmWidth = 9260
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'SEC01'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 3175
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'SEC02'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 69586
        mmTop = 3175
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'VTASUB'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 112184
        mmTop = 3175
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'SEC03'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 3175
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VTATOT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 198967
        mmTop = 3175
        mmWidth = 22225
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'PORLIM'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 52652
        mmTop = 3175
        mmWidth = 9260
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'PORPRO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 94192
        mmTop = 3175
        mmWidth = 9260
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'PORSUB'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 138377
        mmTop = 3175
        mmWidth = 9260
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'PORCOR'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 181240
        mmTop = 3175
        mmWidth = 9260
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'PORTOT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 224896
        mmTop = 3175
        mmWidth = 9260
        BandType = 7
      end
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 442
    Top = 18
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 480
    Top = 40
  end
end
