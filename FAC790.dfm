object FToolRepDocs: TFToolRepDocs
  Left = 113
  Top = 535
  Width = 849
  Height = 141
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel5: TBevel
    Left = 34
    Top = 34
    Width = 221
    Height = 52
    Shape = bsFrame
  end
  object Label11: TLabel
    Left = 70
    Top = 39
    Width = 31
    Height = 13
    Caption = 'Desde'
  end
  object Label12: TLabel
    Left = 171
    Top = 39
    Width = 28
    Height = 13
    Caption = 'Hasta'
  end
  object Label13: TLabel
    Left = 58
    Top = 26
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object Bevel6: TBevel
    Left = 258
    Top = 32
    Width = 212
    Height = 55
    Shape = bsFrame
  end
  object Label14: TLabel
    Left = 370
    Top = 58
    Width = 29
    Height = 15
    Caption = 'Serie'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 278
    Top = 27
    Width = 24
    Height = 13
    Caption = 'Serie'
  end
  object pcDocumento: TPageControl
    Left = 0
    Top = 0
    Width = 841
    Height = 105
    ActivePage = tsGuia
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tsGuia: TTabSheet
      Caption = 'Gu'#237'as'
      object bvGFecha: TBevel
        Left = 3
        Top = 9
        Width = 221
        Height = 55
        Shape = bsFrame
      end
      object Label4: TLabel
        Left = 10
        Top = 19
        Width = 31
        Height = 15
        Caption = 'Desde'
      end
      object Label5: TLabel
        Left = 122
        Top = 19
        Width = 29
        Height = 15
        Caption = 'Hasta'
      end
      object Label6: TLabel
        Left = 27
        Top = 1
        Width = 30
        Height = 15
        Caption = 'Fecha'
      end
      object bvGuia: TBevel
        Left = 227
        Top = 9
        Width = 170
        Height = 55
        Shape = bsFrame
      end
      object Label8: TLabel
        Left = 248
        Top = 2
        Width = 29
        Height = 15
        Caption = 'Serie'
      end
      object Label7: TLabel
        Left = 364
        Top = 11
        Width = 22
        Height = 30
        Caption = 'Ult. Lote'
        WordWrap = True
      end
      object dbdtpGFecIni: TwwDBDateTimePicker
        Left = 8
        Top = 35
        Width = 96
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
      end
      object dbdtpGFecFin: TwwDBDateTimePicker
        Left = 120
        Top = 35
        Width = 96
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 1
        OnExit = dbdtpGFecFinExit
      end
      object bbtnGOk: TBitBtn
        Left = 590
        Top = 30
        Width = 35
        Height = 30
        TabOrder = 4
        OnClick = bbtnGOkClick
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
      object bbtnGPrint: TBitBtn
        Left = 631
        Top = 30
        Width = 35
        Height = 30
        TabOrder = 5
        OnClick = bbtnGPrintClick
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
      object chkGTodos: TCheckBox
        Left = 235
        Top = 41
        Width = 61
        Height = 19
        Caption = 'Todos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = chkGTodosClick
      end
      object dblcGSerie: TwwDBLookupCombo
        Left = 290
        Top = 35
        Width = 69
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
      end
      object chkGLote: TCheckBox
        Left = 364
        Top = 41
        Width = 19
        Height = 19
        TabOrder = 7
      end
      object GroupBox1: TGroupBox
        Left = 402
        Top = 3
        Width = 183
        Height = 61
        Caption = 'Sector Comercial'
        TabOrder = 8
        object chkGSector: TCheckBox
          Left = 9
          Top = 17
          Width = 50
          Height = 13
          Caption = 'Todos'
          TabOrder = 0
          OnClick = chkGSectorClick
        end
        object dblcGSector: TwwDBLookupCombo
          Left = 10
          Top = 32
          Width = 49
          Height = 23
          DropDownAlignment = taLeftJustify
          LookupTable = DMFAC.cdsTVta
          LookupField = 'TVTAID'
          Options = [loTitles]
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcGSectorExit
        end
        object edtGSector: TEdit
          Left = 61
          Top = 32
          Width = 108
          Height = 23
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
      end
      object bbtnPedVendedor: TBitBtn
        Left = 669
        Top = 6
        Width = 102
        Height = 25
        Hint = 'Pedidos Registrados por Vendedor'
        Caption = 'Pedidos x Vend.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = bbtnPedVendedorClick
      end
      object bbtnPedRechazado: TBitBtn
        Left = 669
        Top = 38
        Width = 103
        Height = 25
        Hint = 'Pedidos Registrados por Vendedor'
        Caption = 'Pedidos Rechazados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = bbtnPedRechazadoClick
      end
    end
    object tsBoleta: TTabSheet
      Caption = 'Facturas'
      ImageIndex = 1
      object bvFFecha: TBevel
        Left = 3
        Top = 9
        Width = 221
        Height = 55
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 31
        Height = 15
        Caption = 'Desde'
      end
      object Label2: TLabel
        Left = 116
        Top = 20
        Width = 29
        Height = 15
        Caption = 'Hasta'
      end
      object Label3: TLabel
        Left = 27
        Top = 1
        Width = 30
        Height = 15
        Caption = 'Fecha'
      end
      object bvFSerie: TBevel
        Left = 228
        Top = 9
        Width = 170
        Height = 55
        Shape = bsFrame
      end
      object Label10: TLabel
        Left = 247
        Top = 2
        Width = 29
        Height = 15
        Caption = 'Serie'
      end
      object Label9: TLabel
        Left = 361
        Top = 11
        Width = 22
        Height = 30
        Caption = 'Ult. Lote'
        WordWrap = True
      end
      object dbdtpFFecIni: TwwDBDateTimePicker
        Left = 8
        Top = 36
        Width = 96
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
      end
      object dbdtpFFecFin: TwwDBDateTimePicker
        Left = 114
        Top = 36
        Width = 96
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 1
        OnExit = dbdtpFFecFinExit
      end
      object bbtnFOk: TBitBtn
        Left = 591
        Top = 33
        Width = 35
        Height = 30
        TabOrder = 4
        OnClick = bbtnFOkClick
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
      object chkFTodos: TCheckBox
        Left = 235
        Top = 43
        Width = 50
        Height = 14
        Caption = 'Todos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = chkFTodosClick
      end
      object dblcFSerie: TwwDBLookupCombo
        Left = 287
        Top = 35
        Width = 69
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
      end
      object chkFLote: TCheckBox
        Left = 363
        Top = 42
        Width = 15
        Height = 18
        Caption = 'Ultimo Lote'
        TabOrder = 7
      end
      object bbtnVendedor: TBitBtn
        Left = 669
        Top = 11
        Width = 96
        Height = 25
        Caption = 'Res. x Vendedor'
        TabOrder = 6
        OnClick = bbtnVendedorClick
      end
      object GroupBox3: TGroupBox
        Left = 402
        Top = 2
        Width = 183
        Height = 61
        Caption = 'Sector Comercial'
        TabOrder = 8
        object chkFSector: TCheckBox
          Left = 11
          Top = 17
          Width = 50
          Height = 13
          Caption = 'Todos'
          TabOrder = 0
          OnClick = chkFSectorClick
        end
        object dblcFSector: TwwDBLookupCombo
          Left = 11
          Top = 33
          Width = 49
          Height = 23
          DropDownAlignment = taLeftJustify
          LookupTable = DMFAC.cdsTVta
          LookupField = 'TVTAID'
          Options = [loTitles]
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcFSectorExit
        end
        object edtFSector: TEdit
          Left = 62
          Top = 33
          Width = 108
          Height = 23
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
      end
      object bbtnFPrint: TBitBtn
        Left = 630
        Top = 33
        Width = 33
        Height = 30
        Hint = 'Consulta de Venta Neta'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = bbtnFPrintClick
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
        Layout = blGlyphTop
        NumGlyphs = 2
      end
    end
    object tsFactura: TTabSheet
      Caption = 'Boletas'
      ImageIndex = 2
      object Bevel7: TBevel
        Left = 3
        Top = 9
        Width = 221
        Height = 55
        Shape = bsFrame
      end
      object Label16: TLabel
        Left = 10
        Top = 18
        Width = 31
        Height = 15
        Caption = 'Desde'
      end
      object Label17: TLabel
        Left = 123
        Top = 18
        Width = 29
        Height = 15
        Caption = 'Hasta'
      end
      object Label18: TLabel
        Left = 27
        Top = 1
        Width = 30
        Height = 15
        Caption = 'Fecha'
      end
      object Bevel8: TBevel
        Left = 227
        Top = 9
        Width = 170
        Height = 55
        Shape = bsFrame
      end
      object Label20: TLabel
        Left = 247
        Top = 2
        Width = 29
        Height = 15
        Caption = 'Serie'
      end
      object Label19: TLabel
        Left = 357
        Top = 11
        Width = 22
        Height = 30
        Caption = 'Ult. Lote'
        WordWrap = True
      end
      object dbdtpBFecIni: TwwDBDateTimePicker
        Left = 8
        Top = 34
        Width = 96
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
      end
      object dbdtpBFecFin: TwwDBDateTimePicker
        Left = 120
        Top = 34
        Width = 96
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 1
        OnExit = dbdtpBFecFinExit
      end
      object bbtnBOk: TBitBtn
        Left = 623
        Top = 29
        Width = 35
        Height = 30
        TabOrder = 4
        OnClick = bbtnBOkClick
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
      object bbtnBPrint: TBitBtn
        Left = 671
        Top = 29
        Width = 35
        Height = 30
        TabOrder = 5
        OnClick = bbtnBPrintClick
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
      object chkBTodos: TCheckBox
        Left = 235
        Top = 36
        Width = 49
        Height = 23
        Caption = 'Todos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = chkBTodosClick
      end
      object dblcBSerie: TwwDBLookupCombo
        Left = 286
        Top = 35
        Width = 68
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
      end
      object chkBLote: TCheckBox
        Left = 356
        Top = 40
        Width = 18
        Height = 21
        Caption = 'Ultimo Lote'
        TabOrder = 7
        Visible = False
      end
      object GroupBox2: TGroupBox
        Left = 400
        Top = 3
        Width = 183
        Height = 61
        Caption = 'Sector Comercial'
        TabOrder = 6
        object chkBSector: TCheckBox
          Left = 13
          Top = 17
          Width = 50
          Height = 13
          Caption = 'Todos'
          TabOrder = 0
          OnClick = chkBSectorClick
        end
        object dblcBSector: TwwDBLookupCombo
          Left = 9
          Top = 33
          Width = 49
          Height = 23
          DropDownAlignment = taLeftJustify
          LookupTable = DMFAC.cdsTVta
          LookupField = 'TVTAID'
          Options = [loTitles]
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcBSectorExit
        end
        object edtBSector: TEdit
          Left = 60
          Top = 33
          Width = 78
          Height = 23
          Color = clBtnFace
          Enabled = False
          TabOrder = 2
        end
      end
    end
  end
  object ppDBRepGuias: TppDBPipeline
    UserName = 'DBRepGuias'
    Left = 168
    Top = 4
    object ppField17: TppField
      FieldAlias = 'FECHA'
      FieldName = 'FECHA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 0
    end
    object ppField18: TppField
      FieldAlias = 'SERIE'
      FieldName = 'SERIE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object ppField19: TppField
      FieldAlias = 'NGUIA'
      FieldName = 'NGUIA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField20: TppField
      FieldAlias = 'NROGUIA'
      FieldName = 'NROGUIA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 3
    end
    object ppField21: TppField
      FieldAlias = 'FACSERIE'
      FieldName = 'FACSERIE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 4
    end
    object ppField22: TppField
      FieldAlias = 'NFAC'
      FieldName = 'NFAC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object ppField23: TppField
      FieldAlias = 'TIPVTAID'
      FieldName = 'TIPVTAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 6
    end
    object ppField24: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField25: TppField
      FieldAlias = 'VEID'
      FieldName = 'VEID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 8
    end
    object ppField26: TppField
      FieldAlias = 'NROFACTURA'
      FieldName = 'NROFACTURA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 9
    end
    object ppField27: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppField28: TppField
      FieldAlias = 'CLIEID'
      FieldName = 'CLIEID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 11
    end
    object ppField29: TppField
      FieldAlias = 'CLIEDES'
      FieldName = 'CLIEDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 12
    end
    object ppField30: TppField
      FieldAlias = 'FPAGO'
      FieldName = 'FPAGO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 13
    end
    object ppField31: TppField
      FieldAlias = 'OBSERVACION'
      FieldName = 'OBSERVACION'
      FieldLength = 12
      DisplayWidth = 12
      Position = 14
    end
    object ppField32: TppField
      FieldAlias = 'TVTADES'
      FieldName = 'TVTADES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
  end
  object ppRepGuias: TppReport
    AutoStop = False
    DataPipeline = ppDBRepGuias
    OnPrintingComplete = ppRepGuiasPrintingComplete
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
    Template.FileName = 'C:\SOLExes\SOLFormatos\Fac\Incoresa\GuiasEmitidas.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 240
    Top = 4
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBRepGuias'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40746
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'REPORTE DE GUIAS DE REMISION EMITIDAS '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 55033
        mmTop = 8202
        mmWidth = 70379
        BandType = 0
      end
      object pplblRango: TppLabel
        UserName = 'lblRango'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 56356
        mmTop = 13494
        mmWidth = 51858
        BandType = 0
      end
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 2646
        mmWidth = 40746
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Usuario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162454
        mmTop = 14817
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 8731
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'FECHA GUIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 2646
        mmTop = 29633
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'N'#176'GUIA R.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 17198
        mmTop = 29633
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'N'#176'FACTURA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 29633
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'N'#176'PEDIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 53711
        mmTop = 29633
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'CODIGO CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 112448
        mmTop = 29633
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 138377
        mmTop = 33073
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'OBSERVACIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 172244
        mmTop = 33073
        mmWidth = 24077
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageCount
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 8731
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Fecha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 8731
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Hora:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 14817
        mmWidth = 9260
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 14288
        mmTop = 8731
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 14552
        mmTop = 14817
        mmWidth = 14817
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1323
        mmTop = 38100
        mmWidth = 200025
        BandType = 0
      end
      object pplblSerie: TppLabel
        UserName = 'lblSerie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 8202
        mmWidth = 22225
        BandType = 0
      end
      object pplblUser: TppLabel
        UserName = 'lblUser'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 178859
        mmTop = 14817
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'CONDICION DE PAGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 81227
        mmTop = 29633
        mmWidth = 16669
        BandType = 0
      end
      object pplblGSector: TppLabel
        UserName = 'lblGSector'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 56886
        mmTop = 18785
        mmWidth = 10054
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NROGUIA'
        DataPipeline = ppDBRepGuias
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRepGuias'
        mmHeight = 3704
        mmLeft = 11906
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NROFACTURA'
        DataPipeline = ppDBRepGuias
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRepGuias'
        mmHeight = 3704
        mmLeft = 32279
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PEDIDO'
        DataPipeline = ppDBRepGuias
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRepGuias'
        mmHeight = 3704
        mmLeft = 52917
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CLIEID'
        DataPipeline = ppDBRepGuias
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRepGuias'
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CLIEDES'
        DataPipeline = ppDBRepGuias
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRepGuias'
        mmHeight = 3704
        mmLeft = 131763
        mmTop = 0
        mmWidth = 37571
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 171186
        mmTop = 3703
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'OBSERVACION'
        DataPipeline = ppDBRepGuias
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRepGuias'
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 0
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'FPAGO'
        DataPipeline = ppDBRepGuias
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRepGuias'
        mmHeight = 3704
        mmLeft = 72761
        mmTop = 0
        mmWidth = 36248
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'FECHA'
      DataPipeline = ppDBRepGuias
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBRepGuias'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'FECHA'
          DataPipeline = ppDBRepGuias
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBRepGuias'
          mmHeight = 3704
          mmLeft = 2646
          mmTop = 529
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'NROGUIA'
          DataPipeline = ppDBRepGuias
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppDBRepGuias'
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 1058
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object pplblTotal: TppLabel
          UserName = 'lblTotal'
          Caption = ' Gu'#237'as Emitidas el:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 20108
          mmTop = 1058
          mmWidth = 35190
          BandType = 5
          GroupNo = 0
        end
        object ppDBText27: TppDBText
          UserName = 'DBText27'
          DataField = 'FECHA'
          DataPipeline = ppDBRepGuias
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBRepGuias'
          mmHeight = 3704
          mmLeft = 55827
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppdbRepFactura: TppDBPipeline
    UserName = 'dbRepFactura'
    Left = 293
    Top = 2
    object ppField1: TppField
      FieldAlias = 'FECHA'
      FieldName = 'FECHA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'SERIE'
      FieldName = 'SERIE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'NGUIA'
      FieldName = 'NGUIA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'NROGUIA'
      FieldName = 'NROGUIA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'FACSERIE'
      FieldName = 'FACSERIE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'NFAC'
      FieldName = 'NFAC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'TIPVTAID'
      FieldName = 'TIPVTAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'VEID'
      FieldName = 'VEID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'NROFACTURA'
      FieldName = 'NROFACTURA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'CLIEID'
      FieldName = 'CLIEID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'CLIEDES'
      FieldName = 'CLIEDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'FPAGO'
      FieldName = 'FPAGO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 13
    end
    object ppField15: TppField
      FieldAlias = 'OBSERVACION'
      FieldName = 'OBSERVACION'
      FieldLength = 12
      DisplayWidth = 12
      Position = 14
    end
    object ppField16: TppField
      FieldAlias = 'TVTADES'
      FieldName = 'TVTADES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
  end
  object ppRepFactura: TppReport
    AutoStop = False
    DataPipeline = ppdbRepFactura
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
    Template.FileName = 'C:\SOLExes\SOLFormatos\Fac\Incoresa\FacturasEmitidas.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 437
    Top = 2
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbRepFactura'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40746
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'REPORTE DE FACTURAS EMITIDAS '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 55033
        mmTop = 8202
        mmWidth = 53711
        BandType = 0
      end
      object pplblFFecha: TppLabel
        UserName = 'lblRango1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 56356
        mmTop = 13494
        mmWidth = 51858
        BandType = 0
      end
      object pplblFCia: TppLabel
        UserName = 'lblCia1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 2646
        mmWidth = 40746
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Usuario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162454
        mmTop = 14817
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 8731
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'EMISION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 29633
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'N'#176'GUIA R.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 46038
        mmTop = 29633
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'N'#176'FACTURA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 19844
        mmTop = 29633
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'N'#176'PEDIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 64558
        mmTop = 29633
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label101'
        Caption = 'CODIGO CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 120650
        mmTop = 29633
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 146579
        mmTop = 33073
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'OBSERVACIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 33073
        mmWidth = 24077
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageCount
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 8731
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Fecha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 8731
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Hora:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 14817
        mmWidth = 9260
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 14288
        mmTop = 8731
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 14552
        mmTop = 14817
        mmWidth = 14817
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1058
        mmTop = 38100
        mmWidth = 200555
        BandType = 0
      end
      object pplblFSerie: TppLabel
        UserName = 'lblSerie1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 8202
        mmWidth = 22225
        BandType = 0
      end
      object pplblFUser: TppLabel
        UserName = 'lblUser1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 178859
        mmTop = 14817
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'CONDICION DE PAGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 92340
        mmTop = 29633
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'VEN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 38629
        mmTop = 29633
        mmWidth = 5556
        BandType = 0
      end
      object pplblFSector: TppLabel
        UserName = 'lblFSector'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 56886
        mmTop = 19050
        mmWidth = 18521
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 178859
        mmTop = 3704
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'NROFACTURA'
        DataPipeline = ppdbRepFactura
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepFactura'
        mmHeight = 3704
        mmLeft = 19579
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'PEDIDO'
        DataPipeline = ppdbRepFactura
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepFactura'
        mmHeight = 3704
        mmLeft = 64823
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'CLIEID'
        DataPipeline = ppdbRepFactura
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepFactura'
        mmHeight = 3704
        mmLeft = 119856
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'CLIEDES'
        DataPipeline = ppdbRepFactura
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepFactura'
        mmHeight = 3704
        mmLeft = 141552
        mmTop = 0
        mmWidth = 36513
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'OBSERVACION'
        DataPipeline = ppdbRepFactura
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepFactura'
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'FPAGO'
        DataPipeline = ppdbRepFactura
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepFactura'
        mmHeight = 3704
        mmLeft = 84138
        mmTop = 0
        mmWidth = 34396
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'NROGUIA'
        DataPipeline = ppdbRepFactura
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepFactura'
        mmHeight = 3704
        mmLeft = 44979
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'VEID'
        DataPipeline = ppdbRepFactura
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbRepFactura'
        mmHeight = 3704
        mmLeft = 39158
        mmTop = 0
        mmWidth = 5292
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup4: TppGroup
      BreakName = 'FECHA'
      DataPipeline = ppdbRepFactura
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbRepFactura'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          AutoSize = True
          DataField = 'FECHA'
          DataPipeline = ppdbRepFactura
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbRepFactura'
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 265
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'NROFACTURA'
          DataPipeline = ppdbRepFactura
          DisplayFormat = '###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppdbRepFactura'
          mmHeight = 3704
          mmLeft = 3175
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object pplblFTotal: TppLabel
          UserName = 'lblTotal1'
          Caption = 'Facturas Emitidas el:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 20902
          mmTop = 1058
          mmWidth = 38894
          BandType = 5
          GroupNo = 0
        end
        object ppDBText28: TppDBText
          UserName = 'DBText28'
          DataField = 'FECHA'
          DataPipeline = ppdbRepFactura
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbRepFactura'
          mmHeight = 3704
          mmLeft = 61648
          mmTop = 1058
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppdbRepBoleta: TppDBPipeline
    UserName = 'dbRepBoleta'
    Left = 494
    Top = 2
  end
  object ppRepBoleta: TppReport
    AutoStop = False
    DataPipeline = ppdbRepBoleta
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
    Template.FileName = 'C:\SOLExes\SOLFormatos\Fac\Incoresa\BoletasEmitidas.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 558
    Top = 2
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbRepBoleta'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40746
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'REPORTE DE BOLETAS EMITIDAS '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 55033
        mmTop = 8202
        mmWidth = 51858
        BandType = 0
      end
      object pplblBFecha: TppLabel
        UserName = 'lblBFecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 56356
        mmTop = 13494
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 2646
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Usuario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162454
        mmTop = 14817
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 8731
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'EMISION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 29633
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label201'
        Caption = 'N'#176'GUIA R.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 46038
        mmTop = 29633
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'N'#176'FACTURA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 29633
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'N'#176'PEDIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 64558
        mmTop = 29633
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'CODIGO CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 120650
        mmTop = 29633
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 146579
        mmTop = 33073
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'OBSERVACIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 33073
        mmWidth = 24077
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
        VarType = vtPageCount
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 8731
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Fecha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 8731
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'Hora:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 14817
        mmWidth = 9260
        BandType = 0
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 14288
        mmTop = 8731
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 14552
        mmTop = 14817
        mmWidth = 14817
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1058
        mmTop = 38100
        mmWidth = 200555
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 8202
        mmWidth = 12965
        BandType = 0
      end
      object pplblbUser: TppLabel
        UserName = 'lblbUser'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 178859
        mmTop = 14817
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label301'
        Caption = 'CONDICION DE PAGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 92340
        mmTop = 29633
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'VEN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 37835
        mmTop = 29633
        mmWidth = 5556
        BandType = 0
      end
      object pplblBSector: TppLabel
        UserName = 'lblBSector'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 56886
        mmTop = 18521
        mmWidth = 11906
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'NROFACTURA'
        DataPipeline = ppdbRepBoleta
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbRepBoleta'
        mmHeight = 3704
        mmLeft = 16669
        mmTop = 265
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'PEDIDO'
        DataPipeline = ppdbRepBoleta
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbRepBoleta'
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 265
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'CLIEID'
        DataPipeline = ppdbRepBoleta
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbRepBoleta'
        mmHeight = 3704
        mmLeft = 119063
        mmTop = 265
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'CLIEDES'
        DataPipeline = ppdbRepBoleta
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbRepBoleta'
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 265
        mmWidth = 36513
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 178330
        mmTop = 2911
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'OBSERVACION'
        DataPipeline = ppdbRepBoleta
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbRepBoleta'
        mmHeight = 3704
        mmLeft = 177800
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'FPAGO'
        DataPipeline = ppdbRepBoleta
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbRepBoleta'
        mmHeight = 3704
        mmLeft = 83344
        mmTop = 265
        mmWidth = 34396
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText101'
        DataField = 'NROGUIA'
        DataPipeline = ppdbRepBoleta
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbRepBoleta'
        mmHeight = 3704
        mmLeft = 44186
        mmTop = 265
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'VEID'
        DataPipeline = ppdbRepBoleta
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbRepBoleta'
        mmHeight = 3704
        mmLeft = 37571
        mmTop = 265
        mmWidth = 5292
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'FECHA'
      DataPipeline = ppdbRepBoleta
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbRepBoleta'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          AutoSize = True
          DataField = 'FECHA'
          DataPipeline = ppdbRepBoleta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppdbRepBoleta'
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 1058
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel46: TppLabel
          UserName = 'Label46'
          Caption = 'Facturas Emitidas el:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 19315
          mmTop = 529
          mmWidth = 38894
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'NROFACTURA'
          DataPipeline = ppdbRepBoleta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppdbRepBoleta'
          mmHeight = 3704
          mmLeft = 1588
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBText29: TppDBText
          UserName = 'DBText29'
          DataField = 'FECHA'
          DataPipeline = ppdbRepBoleta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppdbRepBoleta'
          mmHeight = 3704
          mmLeft = 60061
          mmTop = 529
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppReporte: TppReport
    AutoStop = False
    DataPipeline = dbpReporte
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
    Template.FileName = 'C:\SOLExes\SOLFormatos\Fac\Incoresa\RepEmi.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 140
    Top = 40
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'dbpReporte'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable10'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 16933
        mmTop = 2910
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable11'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 16669
        mmTop = 8467
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label1'
        Caption = 'Fecha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 2910
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Hora :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 8731
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'REPORTE DE FACTURAS / BOLETRAS EMITIDAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 55298
        mmTop = 1588
        mmWidth = 72231
        BandType = 0
      end
      object pplPeriodo: TppLabel
        UserName = 'lPeriodo'
        Caption = 'DEL 23/01/2002 AL 25/01/2002'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 72761
        mmTop = 5556
        mmWidth = 51858
        BandType = 0
      end
      object pplZona: TppLabel
        UserName = 'lZona'
        Caption = 'DE LIMA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 73025
        mmTop = 10583
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'EMISION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 23548
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = 'TIPO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 18256
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'DOCUM.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18521
        mmTop = 23548
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label102'
        Caption = 'N'#176' FACTURA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 31221
        mmTop = 18256
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = 'O BOLETA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 31485
        mmTop = 23548
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        Caption = 'N'#176' GUIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 50536
        mmTop = 18256
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = 'REMISION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 49477
        mmTop = 23548
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label55'
        Caption = 'N'#176' PEDIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 68792
        mmTop = 23813
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = 'CONDICION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 91281
        mmTop = 18256
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label16'
        Caption = 'DE PAGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 92604
        mmTop = 23548
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label58'
        Caption = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 114829
        mmTop = 18256
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label59'
        Caption = 'CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 113506
        mmTop = 23548
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        Caption = 'CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 135732
        mmTop = 23548
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label202'
        Caption = 'OBS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 23548
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        Caption = 'NETO S/IGV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 179123
        mmTop = 23548
        mmWidth = 18521
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        AutoSize = True
        DataField = 'FACMTOMO'
        DataPipeline = dbpReporte
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbpReporte'
        mmHeight = 3704
        mmLeft = 182034
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'ESTADO'
        DataPipeline = dbpReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpReporte'
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 265
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'CLIEDES'
        DataPipeline = dbpReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpReporte'
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 265
        mmWidth = 36777
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'CLIEID'
        DataPipeline = dbpReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpReporte'
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'DCCOMDES'
        DataPipeline = dbpReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpReporte'
        mmHeight = 3704
        mmLeft = 87048
        mmTop = 265
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'PEDIDO'
        DataPipeline = dbpReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpReporte'
        mmHeight = 3704
        mmLeft = 67998
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText102'
        DataField = 'GUIA'
        DataPipeline = dbpReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpReporte'
        mmHeight = 3704
        mmLeft = 50271
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'NFACTURA'
        DataPipeline = dbpReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpReporte'
        mmHeight = 3704
        mmLeft = 30163
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'DOCABR'
        DataPipeline = dbpReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpReporte'
        mmHeight = 3704
        mmLeft = 19844
        mmTop = 265
        mmWidth = 6615
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'FACFECHA'
        DataPipeline = dbpReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbpReporte'
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup3: TppGroup
      BreakName = 'VEID'
      DataPipeline = dbpReporte
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbpReporte'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBText40: TppDBText
          UserName = 'DBText40'
          DataField = 'VEID'
          DataPipeline = dbpReporte
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbpReporte'
          mmHeight = 4233
          mmLeft = 3440
          mmTop = 265
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppDBText41: TppDBText
          UserName = 'DBText41'
          AutoSize = True
          DataField = 'VENOMBRES'
          DataPipeline = dbpReporte
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 12cpi'
          Font.Pitch = fpFixed
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbpReporte'
          mmHeight = 4233
          mmLeft = 16933
          mmTop = 265
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppLabel63: TppLabel
          UserName = 'Label63'
          Caption = 
            '----------------------------------------------------------------' +
            '------------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 0
          mmWidth = 196321
          BandType = 5
          GroupNo = 0
        end
        object ppLabel64: TppLabel
          UserName = 'Label23'
          Caption = 'TOTAL DE VENDEDOR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 119856
          mmTop = 4233
          mmWidth = 31485
          BandType = 5
          GroupNo = 0
        end
        object ppDBText42: TppDBText
          UserName = 'DBText42'
          DataField = 'VEID'
          DataPipeline = dbpReporte
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbpReporte'
          mmHeight = 3704
          mmLeft = 155046
          mmTop = 4233
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'FACMTOMO'
          DataPipeline = dbpReporte
          DisplayFormat = '###,###,#0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbpReporte'
          mmHeight = 3704
          mmLeft = 179388
          mmTop = 4233
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBText43: TppDBText
          UserName = 'DBText43'
          DataField = 'TMONABR'
          DataPipeline = dbpReporte
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbpReporte'
          mmHeight = 3704
          mmLeft = 170657
          mmTop = 4233
          mmWidth = 7144
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object dbpReporte: TppDBPipeline
    UserName = 'dbpReporte'
    Left = 192
    Top = 40
    object ppField33: TppField
      FieldAlias = 'VEID'
      FieldName = 'VEID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 0
    end
    object ppField34: TppField
      FieldAlias = 'VENOMBRES'
      FieldName = 'VENOMBRES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ppField35: TppField
      FieldAlias = 'FACFECHA'
      FieldName = 'FACFECHA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 2
    end
    object ppField36: TppField
      FieldAlias = 'DOCABR'
      FieldName = 'DOCABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppField37: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 4
    end
    object ppField38: TppField
      FieldAlias = 'NFACTURA'
      FieldName = 'NFACTURA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 5
    end
    object ppField39: TppField
      FieldAlias = 'GUIA'
      FieldName = 'GUIA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 6
    end
    object ppField40: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object ppField41: TppField
      FieldAlias = 'FPAGOID'
      FieldName = 'FPAGOID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 8
    end
    object ppField42: TppField
      FieldAlias = 'DCCOMDES'
      FieldName = 'DCCOMDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object ppField43: TppField
      FieldAlias = 'CLIEID'
      FieldName = 'CLIEID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 10
    end
    object ppField44: TppField
      FieldAlias = 'CLIEDES'
      FieldName = 'CLIEDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 11
    end
    object ppField45: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 12
    end
    object ppField46: TppField
      FieldAlias = 'TMONABR'
      FieldName = 'TMONABR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 13
    end
    object ppField47: TppField
      FieldAlias = 'ESTADO'
      FieldName = 'ESTADO'
      FieldLength = 7
      DisplayWidth = 7
      Position = 14
    end
    object ppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'FACMTOMO'
      FieldName = 'FACMTOMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
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
    Report = ppReporte
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 272
    Top = 40
  end
  object ppDBPedVendedor: TppDBPipeline
    UserName = 'DBPedVendedor'
    Left = 20
    Top = 42
  end
  object pprRPedVendedor: TppReport
    AutoStop = False
    DataPipeline = ppDBPedVendedor
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report2'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SOLFormatos\Fac\Incoresa\PedidosxVendedor.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 76
    Top = 42
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPedVendedor'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38365
      mmPrintPosition = 0
      object ppLabel65: TppLabel
        UserName = 'Label65'
        Caption = 'PEDIDOS REGISTRADOS POR VENDEDOR '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 63500
        mmTop = 5556
        mmWidth = 61119
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        Caption = 'DESDE EL:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 67733
        mmTop = 12435
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label67'
        Caption = 'HASTA EL :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 110861
        mmTop = 12435
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label68'
        Caption = 'Pedido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 31485
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 27252
        mmTop = 31485
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = 'Zona'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 85461
        mmTop = 31485
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label71'
        Caption = 'Registrado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102129
        mmTop = 31485
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = 'F/Status'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 125413
        mmTop = 31485
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = 'Status'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 146050
        mmTop = 31485
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label74'
        Caption = 'N'#176' Gu'#237'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165629
        mmTop = 31485
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = 'Neto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 187855
        mmTop = 31485
        mmWidth = 7408
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1058
        mmTop = 37306
        mmWidth = 198173
        BandType = 0
      end
      object pplblZona: TppLabel
        UserName = 'lblZona'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 135467
        mmTop = 5292
        mmWidth = 13229
        BandType = 0
      end
      object pplblDesde: TppLabel
        UserName = 'lblDesde'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 87842
        mmTop = 12171
        mmWidth = 21167
        BandType = 0
      end
      object pplblHasta: TppLabel
        UserName = 'lblHasta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 130175
        mmTop = 12435
        mmWidth = 13494
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 29104
        mmWidth = 198173
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label75'
        Caption = 'Fecha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 4763
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label77'
        Caption = 'Hora:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 11906
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'Label78'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 159544
        mmTop = 4763
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'Label79'
        Caption = 'Usuario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 157692
        mmTop = 11906
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable12'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 14817
        mmTop = 4498
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable13: TppSystemVariable
        UserName = 'SystemVariable13'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 14817
        mmTop = 11906
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable14: TppSystemVariable
        UserName = 'SystemVariable14'
        VarType = vtPageCount
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 176742
        mmTop = 4498
        mmWidth = 1852
        BandType = 0
      end
      object pplblPUser: TppLabel
        UserName = 'lblPUser'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 176742
        mmTop = 11906
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        DataField = 'PEDIDO'
        DataPipeline = ppDBPedVendedor
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedVendedor'
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'CLIEDES'
        DataPipeline = ppDBPedVendedor
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedVendedor'
        mmHeight = 3969
        mmLeft = 23019
        mmTop = 0
        mmWidth = 49742
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        DataField = 'ZVTADES'
        DataPipeline = ppDBPedVendedor
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedVendedor'
        mmHeight = 3969
        mmLeft = 74348
        mmTop = 0
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'PEDFECHA'
        DataPipeline = ppDBPedVendedor
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedVendedor'
        mmHeight = 3969
        mmLeft = 101336
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        DataField = 'GREMFECHA'
        DataPipeline = ppDBPedVendedor
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedVendedor'
        mmHeight = 3969
        mmLeft = 120386
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'PEDESTADO'
        DataPipeline = ppDBPedVendedor
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedVendedor'
        mmHeight = 3969
        mmLeft = 139965
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'SERIENGUIA'
        DataPipeline = ppDBPedVendedor
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedVendedor'
        mmHeight = 3969
        mmLeft = 160867
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText53'
        DataField = 'GREMMTOMO'
        DataPipeline = ppDBPedVendedor
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPedVendedor'
        mmHeight = 3969
        mmLeft = 183621
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
    end
    object ppGroup5: TppGroup
      BreakName = 'VEID'
      DataPipeline = ppDBPedVendedor
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPedVendedor'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText44: TppDBText
          UserName = 'DBText44'
          DataField = 'VEID'
          DataPipeline = ppDBPedVendedor
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPedVendedor'
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 529
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object ppDBText45: TppDBText
          UserName = 'DBText45'
          DataField = 'VENOMBRES'
          DataPipeline = ppDBPedVendedor
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPedVendedor'
          mmHeight = 3969
          mmLeft = 10054
          mmTop = 529
          mmWidth = 73554
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppDBPedRechazado: TppDBPipeline
    UserName = 'DBPedRechazado'
    Left = 608
  end
  object pprPedRechazado: TppReport
    AutoStop = False
    DataPipeline = ppDBPedRechazado
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report3'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SOLFormatos\Fac\Incoresa\PedidosRechazados.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 664
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPedRechazado'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35454
      mmPrintPosition = 0
      object ppLabel80: TppLabel
        UserName = 'Label80'
        Caption = 'PEDIDOS RECHAZADOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 80698
        mmTop = 3704
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'Label81'
        Caption = 'Fecha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 5027
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label82'
        Caption = 'Hora:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 9525
        mmWidth = 9260
        BandType = 0
      end
      object ppSystemVariable15: TppSystemVariable
        UserName = 'SystemVariable15'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17727
        mmTop = 5027
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable16: TppSystemVariable
        UserName = 'SystemVariable16'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17727
        mmTop = 9525
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable17: TppSystemVariable
        UserName = 'SystemVariable17'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 146579
        mmTop = 5027
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'Label83'
        Caption = 'Usuario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 146579
        mmTop = 9525
        mmWidth = 14817
        BandType = 0
      end
      object pplblPRUser: TppLabel
        UserName = 'lblPRUser'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 161925
        mmTop = 9525
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label84'
        Caption = 'VENDEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 29369
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'Label85'
        Caption = 'PEDIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19844
        mmTop = 29369
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'Label86'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 37835
        mmTop = 29369
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label87'
        Caption = 'CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 54504
        mmTop = 29369
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label88'
        Caption = 'RAZON SOCIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 103717
        mmTop = 29369
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label89'
        Caption = 'SITUACION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 150019
        mmTop = 29369
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label90'
        Caption = 'INTERRUMPIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 171186
        mmTop = 24342
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label91'
        Caption = 'CREDITOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 168540
        mmTop = 29369
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'Label92'
        Caption = 'COMPRAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 184944
        mmTop = 29369
        mmWidth = 12965
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1058
        mmTop = 34396
        mmWidth = 198702
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'Label93'
        Caption = 'RUC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 80963
        mmTop = 29369
        mmWidth = 5556
        BandType = 0
      end
      object pplblPRSector: TppLabel
        UserName = 'lblPRSector'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 82550
        mmTop = 9525
        mmWidth = 12965
        BandType = 0
      end
      object pplblPRDesde: TppLabel
        UserName = 'lblPRDesde'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 75406
        mmTop = 14552
        mmWidth = 24342
        BandType = 0
      end
      object pplblPRHasta: TppLabel
        UserName = 'lblPRHasta'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 102659
        mmTop = 14552
        mmWidth = 24342
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppDBText56: TppDBText
        UserName = 'DBText56'
        DataField = 'PEDIDO'
        DataPipeline = ppDBPedRechazado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedRechazado'
        mmHeight = 3969
        mmLeft = 10848
        mmTop = 265
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        DataField = 'PEDFECHA'
        DataPipeline = ppDBPedRechazado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedRechazado'
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        DataField = 'CLIEID'
        DataPipeline = ppDBPedRechazado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedRechazado'
        mmHeight = 3969
        mmLeft = 50271
        mmTop = 265
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText59'
        DataField = 'CLIEDES'
        DataPipeline = ppDBPedRechazado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedRechazado'
        mmHeight = 3969
        mmLeft = 92075
        mmTop = 265
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        DataField = 'PEDSIT'
        DataPipeline = ppDBPedRechazado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedRechazado'
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 265
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText61'
        DataField = 'INTCXC'
        DataPipeline = ppDBPedRechazado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedRechazado'
        mmHeight = 3969
        mmLeft = 171715
        mmTop = 265
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'INTLOG'
        DataPipeline = ppDBPedRechazado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedRechazado'
        mmHeight = 3969
        mmLeft = 187855
        mmTop = 265
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = 'OBSERVACION'
        DataPipeline = ppDBPedRechazado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedRechazado'
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 5027
        mmWidth = 193675
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = 'CLIERUC'
        DataPipeline = ppDBPedRechazado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Sans Serif 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPedRechazado'
        mmHeight = 3969
        mmLeft = 70908
        mmTop = 265
        mmWidth = 20108
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
    end
    object ppGroup6: TppGroup
      BreakName = 'ppDBText54'
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBText54: TppDBText
          UserName = 'DBText54'
          DataField = 'VEID'
          DataPipeline = ppDBPedRechazado
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPedRechazado'
          mmHeight = 3969
          mmLeft = 3175
          mmTop = 0
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppDBText55: TppDBText
          UserName = 'DBText55'
          AutoSize = True
          DataField = 'VENOMBRES'
          DataPipeline = ppDBPedRechazado
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Sans Serif 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPedRechazado'
          mmHeight = 3969
          mmLeft = 12435
          mmTop = 0
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 596
    Top = 42
  end
end
