object FBuscarFactura: TFBuscarFactura
  Left = 235
  Top = 218
  Width = 720
  Height = 332
  Caption = 'Facturas Generadas '
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
    Left = 48
    Top = 15
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object Label2: TLabel
    Left = 160
    Top = 15
    Width = 37
    Height = 13
    Caption = 'Nombre'
  end
  object Label3: TLabel
    Left = 361
    Top = 15
    Width = 72
    Height = 13
    Caption = 'Forma de Pago'
  end
  object Label4: TLabel
    Left = 456
    Top = 15
    Width = 37
    Height = 13
    Caption = 'Numero'
  end
  object Label5: TLabel
    Left = 592
    Top = 15
    Width = 35
    Height = 13
    Caption = 'Importe'
  end
  object dbgBoletas: TwwDBGrid
    Left = 16
    Top = 72
    Width = 681
    Height = 217
    DisableThemesInTitle = False
    Selected.Strings = (
      'FACFECHA'#9'11'#9'Fecha~Boleta'#9#9
      'DOCID'#9'04'#9'Doc.'#9#9
      'FACSERIE'#9'5'#9'Serie'#9#9
      'NFAC'#9'12'#9'N'#250'mero~Bol/Fac'#9#9
      'CLIEDES'#9'30'#9'Nombre~Cliente'#9#9
      'TMONID'#9'04'#9'TM'#9#9
      'FACTOTMO'#9'10'#9'Importe'#9#9
      'DOCPAG'#9'5'#9'Doc~Pago'#9#9
      'NUMDOCPAG'#9'16'#9'Numero~Doc.Pago'#9#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    FixedCols = 0
    ShowHorzScrollBar = True
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
    OnDblClick = dbgBoletasDblClick
  end
  object dbeCliente: TwwDBEdit
    Left = 24
    Top = 32
    Width = 97
    Height = 21
    DataField = 'CLIEID'
    Enabled = False
    TabOrder = 1
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeNombre: TwwDBEdit
    Left = 128
    Top = 32
    Width = 217
    Height = 21
    DataField = 'NOMBRE'
    Enabled = False
    TabOrder = 2
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeFPago: TwwDBEdit
    Left = 360
    Top = 32
    Width = 73
    Height = 21
    DataField = 'FORPAG'
    Enabled = False
    TabOrder = 3
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeNumero: TwwDBEdit
    Left = 448
    Top = 32
    Width = 105
    Height = 21
    DataField = 'NUMDOCPAG'
    Enabled = False
    TabOrder = 4
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeTM: TwwDBEdit
    Left = 577
    Top = 32
    Width = 25
    Height = 21
    DataField = 'TMONID'
    Enabled = False
    TabOrder = 5
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeImporte: TwwDBEdit
    Left = 609
    Top = 32
    Width = 57
    Height = 21
    DataField = 'IMPORTE'
    Enabled = False
    TabOrder = 6
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
end
