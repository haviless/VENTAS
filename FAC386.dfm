object FBuscarPagos: TFBuscarPagos
  Left = 244
  Top = 325
  Width = 720
  Height = 332
  Caption = 'Pagos Realizados por Cliente'
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 15
    Top = 19
    Width = 87
    Height = 13
    Caption = 'Nombre de Cliente'
  end
  object dbeCliente: TwwDBEdit
    Left = 112
    Top = 16
    Width = 277
    Height = 21
    TabOrder = 0
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object BitBtn1: TBitBtn
    Left = 621
    Top = 14
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object dbgTransf: TwwDBGrid
    Left = 9
    Top = 51
    Width = 695
    Height = 237
    DisableThemesInTitle = False
    Selected.Strings = (
      'FORPAG'#9'10'#9'Origen'#9#9
      'NUMDOCPAG'#9'15'#9'Número'#9#9
      'FECPAG'#9'10'#9'Fecha~Pago'#9#9
      'CLAUXID'#9'04'#9'Cl.~Aux.'#9#9
      'CLIEID'#9'11'#9'Código~Cliente'#9#9
      'RUCDNI'#9'12'#9'Documento~Identidad'#9#9
      'NOMBRE'#9'30'#9'Nombre~Cliente'#9#9
      'CPTOID'#9'08'#9'Concepto~Pago'#9#9
      'CPTODES'#9'30'#9'Concepto~Pago'#9#9
      'TMONID'#9'3'#9'TM'#9#9
      'IMPORTE'#9'10'#9'Importe~Pago'#9#9
      'CIAFAC'#9'4'#9'Cía~Fac.'#9#9
      'DOCID'#9'4'#9'Doc.'#9#9
      'SERIE'#9'5'#9'Serie'#9#9
      'NODOC'#9'10'#9'No.~Documento'#9#9
      'FECFAC'#9'11'#9'Fecha~Factura'#9#9
      'USUDOC'#9'12'#9'Usuario~Factura'#9#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = 12904163
    KeyOptions = []
    ReadOnly = True
    TabOrder = 2
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
  end
end
