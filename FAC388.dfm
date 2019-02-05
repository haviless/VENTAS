object FGenFactura: TFGenFactura
  Left = 333
  Top = 110
  Width = 607
  Height = 508
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Genera Factura'
  Color = 12904163
  Constraints.MaxHeight = 510
  Constraints.MaxWidth = 610
  Constraints.MinHeight = 500
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label36: TLabel
    Left = 194
    Top = 46
    Width = 63
    Height = 17
    Caption = 'Documento '
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblFCanje: TLabel
    Left = 397
    Top = 46
    Width = 52
    Height = 17
    Caption = 'F.Emisi'#243'n'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label10: TLabel
    Left = 519
    Top = 46
    Width = 30
    Height = 17
    Caption = 'Serie'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Bevel1: TBevel
    Left = 5
    Top = 37
    Width = 583
    Height = 4
  end
  object Label2: TLabel
    Left = 8
    Top = 45
    Width = 155
    Height = 24
    AutoSize = False
    Caption = ' Datos de           '
    Color = 10207162
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblTit1: TLabel
    Left = 8
    Top = 8
    Width = 132
    Height = 24
    Caption = ' Cliente Pago '
    Color = 10207162
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 65
    Width = 155
    Height = 24
    AutoSize = False
    Caption = ' Factura / Boleta'
    Color = 10207162
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object dblcTdoc: TwwDBLookupCombo
    Left = 192
    Top = 63
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
      'DOCID'#9'2'#9'Documento'#9'F'
      'DOCDES'#9'15'#9'Descripci'#243'n'#9'F')
    LookupTable = DMFAC.cdsTDoc
    LookupField = 'DOCID'
    Options = [loColLines, loRowLines, loTitles]
    Enabled = False
    ParentFont = False
    TabOrder = 1
    AutoDropDown = True
    ShowButton = True
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcTdocExit
  end
  object dtpFFac: TwwDBDateTimePicker
    Left = 384
    Top = 63
    Width = 90
    Height = 23
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Color = clBtnFace
    Epoch = 1950
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    ShowButton = True
    TabOrder = 3
    DisplayFormat = 'DD/MM/YYYY'
  end
  object dblcSerie: TwwDBLookupCombo
    Left = 516
    Top = 63
    Width = 55
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    CharCase = ecUpperCase
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'SERIEID'#9'5'#9'Id'#9'F'
      'SERIEDES'#9'30'#9'Serie'#9'F')
    LookupField = 'SERIEID'
    Options = [loColLines, loTitles]
    DropDownCount = 15
    ParentFont = False
    TabOrder = 4
    AutoDropDown = True
    ShowButton = True
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
  end
  object edtTDoc: TEdit
    Left = 238
    Top = 63
    Width = 120
    Height = 23
    Color = clBtnFace
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 390
    Top = 438
    Width = 117
    Height = 25
    Caption = 'Confirmar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 520
    Top = 438
    Width = 57
    Height = 25
    Caption = 'Salir'
    TabOrder = 9
    OnClick = BitBtn2Click
  end
  object dbeClientePago: TwwDBEdit
    Left = 171
    Top = 6
    Width = 412
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbgDetalle: TwwDBGrid
    Left = 8
    Top = 254
    Width = 576
    Height = 179
    DisableThemesInTitle = False
    Selected.Strings = (
      'CPTOID'#9'10'#9'Concepto'#9#9
      'CPTODES'#9'50'#9'Descripci'#243'n'#9#9
      'TMONID'#9'06'#9'Moneda'#9#9
      'IMPORTE'#9'12'#9'Importe'#9#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    FixedCols = 0
    ShowHorzScrollBar = True
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
    TabOrder = 7
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    FooterHeight = 22
  end
  object pnlCambia: TPanel
    Left = 8
    Top = 92
    Width = 575
    Height = 114
    Color = 10207162
    Enabled = False
    TabOrder = 6
    object Label6: TLabel
      Left = 14
      Top = 25
      Width = 54
      Height = 17
      Caption = 'T. Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 14
      Top = 68
      Width = 29
      Height = 17
      Caption = 'R.U.C'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label23: TLabel
      Left = 158
      Top = 68
      Width = 53
      Height = 17
      Caption = 'Direcci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblTipoCliente: TLabel
      Left = 188
      Top = 25
      Width = 39
      Height = 17
      Caption = 'Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 296
      Top = 25
      Width = 69
      Height = 17
      Caption = 'Raz'#243'n Social'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcTClie: TwwDBLookupCombo
      Left = 14
      Top = 41
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
        'TCLIEID'#9'3'#9'Id '#9'F'
        'TCLIEDES'#9'40'#9'Tipo de Cliente'#9'F')
      LookupField = 'TCLIEID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      ShowMatchText = True
      OnExit = dblcTClieExit
    end
    object dblcdClieRuc: TwwDBLookupComboDlg
      Left = 14
      Top = 84
      Width = 110
      Height = 23
      Hint = 'Registro Unico'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Registro Unico'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'CLIERUC'#9'15'#9'CLIERUC'#9'F'
        'CLIEID'#9'15'#9'CLIEID'#9'F'
        'CLIEDES'#9'90'#9'CLIEDES'#9'F')
      LookupField = 'CLIERUC'
      Color = clBtnFace
      Enabled = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object EdtTClie: TEdit
      Left = 61
      Top = 41
      Width = 100
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
      TabOrder = 2
    end
    object edtDireccion: TwwDBEdit
      Left = 154
      Top = 84
      Width = 330
      Height = 23
      Color = clBtnFace
      DataField = 'CLIEDIR'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdClie: TwwDBLookupComboDlg
      Left = 172
      Top = 41
      Width = 107
      Height = 23
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Maestro de Clientes'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'CLIEID'#9'15'#9'Cliente'#9'F'
        'CLIEDES'#9'40'#9'Nombre'#9'F'
        'CLIERUC'#9'15'#9'Ruc'#9'F'
        'CLAUXID'#9'2'#9'Aux'#9'F')
      LookupField = 'CLIEID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 15
      ParentFont = False
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      OnExit = dblcdClieExit
    end
    object edtClie: TwwDBEdit
      Left = 283
      Top = 41
      Width = 276
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
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdAso: TwwDBEdit
      Left = 172
      Top = 41
      Width = 105
      Height = 23
      BorderStyle = bsNone
      DataField = 'CLIEID'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Frame.Enabled = True
      Frame.Transparent = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      Frame.NonFocusStyle = efsFrameSunken
      ParentFont = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dblcdAsoExit
    end
    object btnExec: TButton
      Left = 259
      Top = 41
      Width = 20
      Height = 23
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = btnExecClick
    end
  end
  object cbCambia: TCheckBox
    Left = 24
    Top = 97
    Width = 137
    Height = 17
    Caption = 'Cambiar Cliente'
    Color = 10207162
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    OnClick = cbCambiaClick
  end
  object pnlDet: TPanel
    Left = 8
    Top = 209
    Width = 575
    Height = 39
    Color = 10207162
    Enabled = False
    TabOrder = 10
    object Label3: TLabel
      Left = 212
      Top = 12
      Width = 45
      Height = 17
      Caption = 'Importe'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object dbeDetrac: TwwDBEdit
      Left = 263
      Top = 8
      Width = 97
      Height = 24
      DataField = 'IMPDET'
      DataSource = DMFAC.dsQryDet
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object cbDet: TCheckBox
    Left = 25
    Top = 220
    Width = 102
    Height = 17
    Caption = 'Detracci'#243'n'
    Color = 10207162
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 11
    OnClick = cbDetClick
  end
end
