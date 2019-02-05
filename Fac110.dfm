object FTCambio: TFTCambio
  Left = 273
  Top = 231
  Width = 516
  Height = 266
  Caption = 'Tipo de Cambio del D'#237'a'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTCambio: TLabel
    Left = 16
    Top = 63
    Width = 227
    Height = 45
    Caption = 'Tipo de Cambio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object bbtnCalc: TBitBtn
    Left = 439
    Top = 152
    Width = 32
    Height = 28
    Hint = 'Calculadora'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Visible = False
    OnClick = bbtnCalcClick
    Glyph.Data = {
      36010000424D3601000000000000760000002800000010000000180000000100
      040000000000C0000000CE0E0000D80E00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777700000000000007708888888888888070800800899999807080080089999
      9807088888888888880708008008008008070800800800800807088888888888
      8807080080080080080708008008008008070888888888888807080080080080
      0807080080080080080708888888888888070888888888888807088888888888
      8807080000000000080708000EE0EEEE080708000EE0EEEE0807080000000000
      0807088888888888880708888888888888077000000000000077}
  end
  object Panel1: TPanel
    Left = 120
    Top = 121
    Width = 289
    Height = 96
    Color = 14869218
    TabOrder = 0
    object lblMontoMN: TLabel
      Left = 16
      Top = 23
      Width = 79
      Height = 16
      Caption = 'Monto en MN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblMontoME: TLabel
      Left = 16
      Top = 61
      Width = 78
      Height = 16
      Caption = 'Monto en ME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object dbeMontoMN: TwwDBEdit
      Left = 116
      Top = 15
      Width = 143
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      Visible = False
      WantReturns = False
      WordWrap = False
      OnExit = dbeMontoMNExit
    end
    object dbeMontoME: TwwDBEdit
      Left = 116
      Top = 53
      Width = 143
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      Visible = False
      WantReturns = False
      WordWrap = False
      OnExit = dbeMontoMEExit
    end
  end
  object dtpFecha: TwwDBDateTimePicker
    Left = 181
    Top = 19
    Width = 137
    Height = 31
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    ShowButton = True
    TabOrder = 1
    OnChange = dtpFechaChange
    OnExit = dtpFechaExit
  end
end
