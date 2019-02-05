object FTransfCredito: TFTransfCredito
  Left = 233
  Top = 219
  Width = 760
  Height = 460
  Caption = 'Transferir Cr'#233'ditos'
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 265
    Top = 21
    Width = 44
    Height = 13
    Caption = 'Registros'
  end
  object dbgRecibos: TwwDBGrid
    Left = 7
    Top = 48
    Width = 737
    Height = 345
    DisableThemesInTitle = False
    Selected.Strings = (
      'CREFOTORG'#9'11'#9'Fecha~Emisi'#243'n'#9#9
      'CREDID'#9'15'#9'N'#250'mero~Cr'#233'dito'#9#9
      'TMONID'#9'5'#9'Moneda'#9#9
      'CREMTOOTOR'#9'12'#9'Importe'#9#9
      'CLAUXID'#9'5'#9'Cl.~Aux'#9#9
      'ASOID'#9'10'#9'Cliente~Id.'#9#9
      'ASODNI'#9'12'#9'RUC/DNI'#9#9
      'ASOAPENOM'#9'30'#9'Nombre~Raz'#243'n Social'#9#9
      'CPTOID'#9'8'#9'Concepto'#9#9
      'CPTODES'#9'30'#9'Descripci'#243'n'#9#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    KeyOptions = []
    ReadOnly = True
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
  end
  object dtpFecha: TwwDBDateTimePicker
    Left = 112
    Top = 12
    Width = 105
    Height = 24
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinDate = 38718.000000000000000000
    ParentFont = False
    ShowButton = True
    TabOrder = 1
  end
  object bbtnFiltrar: TBitBtn
    Left = 8
    Top = 11
    Width = 89
    Height = 25
    Caption = 'Filtrar Fecha'
    TabOrder = 2
    OnClick = bbtnFiltrarClick
  end
  object bbtnTranfTodo: TBitBtn
    Left = 640
    Top = 11
    Width = 97
    Height = 25
    Caption = 'Transferir Todo'
    TabOrder = 3
    OnClick = bbtnTranfTodoClick
  end
  object bbtnTransfUno: TBitBtn
    Left = 528
    Top = 11
    Width = 97
    Height = 25
    Caption = 'Transferir Uno'
    TabOrder = 4
    OnClick = bbtnTransfUnoClick
  end
  object meReg: TMaskEdit
    Left = 315
    Top = 17
    Width = 45
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 182
    Top = 400
    Width = 150
    Height = 25
    Caption = 'Eliminar Creditos Anulados'
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object bbtnBuscaAnu: TBitBtn
    Left = 16
    Top = 400
    Width = 150
    Height = 25
    Caption = 'Buscar Creditos Anulados'
    TabOrder = 7
    OnClick = bbtnBuscaAnuClick
  end
end
