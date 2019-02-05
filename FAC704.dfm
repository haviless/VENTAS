object FContabBaz: TFContabBaz
  Left = 414
  Top = 221
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Genera CXC'
  ClientHeight = 225
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbPeriodo: TGroupBox
    Left = 7
    Top = 2
    Width = 339
    Height = 220
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label3: TLabel
      Left = 45
      Top = 80
      Width = 31
      Height = 15
      Caption = 'Desde'
    end
    object Label4: TLabel
      Left = 155
      Top = 80
      Width = 29
      Height = 15
      Caption = 'Hasta'
    end
    object Label1: TLabel
      Left = 28
      Top = 15
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
    object Bevel2: TBevel
      Left = 4
      Top = 69
      Width = 331
      Height = 3
    end
    object Bevel1: TBevel
      Left = 4
      Top = 130
      Width = 331
      Height = 3
    end
    object lblMensaje: TLabel
      Left = 3
      Top = 148
      Width = 332
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = 'Rango procesado del 01/01/2011 al 02/06/2011'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object dtpDesde: TwwDBDateTimePicker
      Left = 24
      Top = 96
      Width = 92
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Date = 40544.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
      UnboundDataType = wwDTEdtDate
      OnChange = dtpDesdeChange
    end
    object dtpHasta: TwwDBDateTimePicker
      Left = 134
      Top = 96
      Width = 92
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Date = 38353.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 3
      UnboundDataType = wwDTEdtDate
      OnChange = dtpHastaChange
    end
    object dblcCia: TwwDBLookupCombo
      Left = 23
      Top = 32
      Width = 44
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Compa'#241'ia'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      Enabled = False
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
      OnNotInList = dblcCiaNotInList
    end
    object edtCia: TEdit
      Left = 69
      Top = 32
      Width = 200
      Height = 23
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
    object bbtnProc: TBitBtn
      Left = 158
      Top = 186
      Width = 80
      Height = 25
      Caption = 'Procesar'
      Enabled = False
      TabOrder = 5
      OnClick = bbtnProcClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
        3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
        700077337F3333373777887007333337007733F773F333337733700070333333
        077037773733333F7F37703707333300080737F373333377737F003333333307
        78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
        078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
        70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
        3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
        33337F73FF737773333307800077033333337337773373333333}
      NumGlyphs = 2
    end
    object bbtnSalir: TBitBtn
      Left = 247
      Top = 186
      Width = 80
      Height = 25
      Caption = 'Salir'
      TabOrder = 6
      OnClick = bbtnSalirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object bbtnRango: TBitBtn
      Left = 250
      Top = 93
      Width = 75
      Height = 25
      Caption = 'Rango'
      TabOrder = 4
      OnClick = bbtnRangoClick
    end
    object pnlPB: TPanel
      Left = 7
      Top = 138
      Width = 324
      Height = 39
      TabOrder = 7
      Visible = False
      object Label2: TLabel
        Left = 5
        Top = 22
        Width = 7
        Height = 15
        Caption = '0'
      end
      object lblMax: TLabel
        Left = 305
        Top = 22
        Width = 12
        Height = 15
        Alignment = taRightJustify
        Caption = '10'
      end
      object lblCon: TLabel
        Left = 125
        Top = 22
        Width = 74
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
      end
      object pbReg: TProgressBar
        Left = 6
        Top = 3
        Width = 312
        Height = 17
        TabOrder = 0
      end
    end
    object cbConta: TCheckBox
      Left = 9
      Top = 192
      Width = 124
      Height = 17
      Caption = 'Eliminar y Generar'
      TabOrder = 8
    end
  end
end
