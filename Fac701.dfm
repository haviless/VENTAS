object FFacMaesClie: TFFacMaesClie
  Left = 316
  Top = 184
  BorderStyle = bsDialog
  Caption = 'Maestro de Clientes'
  ClientHeight = 317
  ClientWidth = 403
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label27: TLabel
    Left = 15
    Top = 145
    Width = 22
    Height = 15
    Caption = 'RUC'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label52: TLabel
    Left = 217
    Top = 146
    Width = 32
    Height = 15
    Caption = 'D.N.I.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 15
    Top = 104
    Width = 67
    Height = 15
    Caption = 'Raz'#243'n Social'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 15
    Top = 190
    Width = 51
    Height = 15
    Caption = 'Direcci'#243'n'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 15
    Top = 238
    Width = 51
    Height = 15
    Caption = 'Tel'#233'fonos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label25: TLabel
    Left = 15
    Top = 60
    Width = 74
    Height = 15
    Caption = 'C'#243'digo Cliente'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblCia: TLabel
    Left = 15
    Top = 10
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
  object dbeRuc: TwwDBEdit
    Left = 15
    Top = 159
    Width = 149
    Height = 23
    AutoFillDate = False
    AutoSelect = False
    AutoSize = False
    CharCase = ecUpperCase
    MaxLength = 11
    TabOrder = 5
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeDNI: TwwDBEdit
    Left = 218
    Top = 162
    Width = 135
    Height = 21
    MaxLength = 8
    TabOrder = 6
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeRazSoc: TwwDBEdit
    Left = 15
    Top = 120
    Width = 344
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeDirCom: TwwDBEdit
    Left = 15
    Top = 206
    Width = 341
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 7
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeTelef: TwwDBEdit
    Left = 15
    Top = 254
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeClie: TwwDBEdit
    Left = 15
    Top = 77
    Width = 89
    Height = 23
    AutoFillDate = False
    AutoSelect = False
    AutoSize = False
    CharCase = ecUpperCase
    TabOrder = 2
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
    OnEnter = dbeClieEnter
    OnExit = dbeClieExit
  end
  object bbtnOK: TBitBtn
    Left = 308
    Top = 272
    Width = 35
    Height = 25
    TabOrder = 9
    OnClick = bbtnOKClick
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
  object bbtnCancel: TBitBtn
    Left = 344
    Top = 272
    Width = 35
    Height = 25
    TabOrder = 10
    OnClick = bbtnCancelClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object rgTipo: TRadioGroup
    Left = 128
    Top = 66
    Width = 169
    Height = 37
    Caption = 'Tipo de Persona'
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Natural'
      'Jur'#237'dica')
    ParentFont = False
    TabOrder = 3
  end
  object dblcCia: TwwDBLookupCombo
    Left = 15
    Top = 26
    Width = 50
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'Id'#9'F'
      'CIADES'#9'30'#9'Compa'#241'ia'#9'F')
    LookupTable = DMFAC.cdsCia
    LookupField = 'CIAID'
    DropDownCount = 15
    ParentFont = False
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcCiaExit
  end
  object edtCia: TEdit
    Left = 63
    Top = 26
    Width = 219
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
