object FCondComercial: TFCondComercial
  Left = 377
  Top = 342
  Width = 292
  Height = 138
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cambiar Condici'#243'n Comercial'
  Color = 14869218
  Constraints.MaxHeight = 138
  Constraints.MaxWidth = 292
  Constraints.MinHeight = 138
  Constraints.MinWidth = 292
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label20: TLabel
    Left = 18
    Top = 15
    Width = 105
    Height = 15
    Caption = 'Condici'#243'n Comercial'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object dblcFPago: TwwDBLookupCombo
    Left = 17
    Top = 31
    Width = 47
    Height = 23
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CCOMERID'#9'2'#9'Id'#9'F'
      'DCCOMDES'#9'30'#9'Descripci'#243'n'#9'F')
    LookupField = 'CCOMERID'
    Options = [loColLines, loRowLines, loTitles]
    MaxLength = 2
    ParentFont = False
    TabOrder = 0
    AutoDropDown = True
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcFPagoExit
  end
  object edtFPago: TEdit
    Left = 65
    Top = 31
    Width = 200
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
    TabOrder = 1
  end
  object bbtnRegOk: TBitBtn
    Left = 194
    Top = 71
    Width = 30
    Height = 28
    Hint = 'Confirma Ingreso de Articulo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = bbtnRegOkClick
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
  object bbtnRegCanc: TBitBtn
    Left = 226
    Top = 71
    Width = 30
    Height = 28
    Hint = 'Cancela Ingreso de Articulo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = bbtnRegCancClick
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
end
