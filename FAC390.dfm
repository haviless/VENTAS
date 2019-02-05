object FActualizaDatos: TFActualizaDatos
  Left = 222
  Top = 113
  Width = 780
  Height = 590
  Caption = 'Actualiza Datos'
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
  object pnlConfirma: TPanel
    Left = 0
    Top = 325
    Width = 771
    Height = 227
    Color = 12904163
    TabOrder = 0
    object gbOrigen: TGroupBox
      Left = 17
      Top = 7
      Width = 740
      Height = 131
      Caption = 'Datos del Inscrito'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label6: TLabel
        Left = 121
        Top = 77
        Width = 130
        Height = 16
        Caption = 'Apellidos y Nombres'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 557
        Top = 79
        Width = 34
        Height = 16
        Caption = 'D.N.I.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 66
        Top = 26
        Width = 101
        Height = 16
        Caption = 'Tipo Inscripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 512
        Top = 26
        Width = 146
        Height = 16
        Caption = 'N'#250'mero de Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 364
        Top = 26
        Width = 39
        Height = 16
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeNombre: TwwDBEdit
        Left = 25
        Top = 95
        Width = 500
        Height = 27
        CharCase = ecUpperCase
        DataField = 'NOMBRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDNI: TwwDBEdit
        Left = 543
        Top = 95
        Width = 93
        Height = 27
        DataField = 'RUCDNI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeNumdoc: TwwDBEdit
        Left = 510
        Top = 42
        Width = 160
        Height = 27
        DataField = 'NUMDOCPAG'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeForPag: TwwDBEdit
        Left = 25
        Top = 42
        Width = 240
        Height = 27
        DataField = 'FORMAPAGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFecha: TwwDBEdit
        Left = 336
        Top = 42
        Width = 100
        Height = 27
        DataField = 'FECPAG'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object gbConfirma: TGroupBox
      Left = 16
      Top = 143
      Width = 740
      Height = 78
      Caption = 'Modificar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label4: TLabel
        Left = 123
        Top = 18
        Width = 130
        Height = 16
        Caption = 'Apellidos y Nombres'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 559
        Top = 20
        Width = 34
        Height = 16
        Caption = 'D.N.I.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeNombreConf: TwwDBEdit
        Left = 25
        Top = 36
        Width = 500
        Height = 27
        CharCase = ecUpperCase
        DataField = 'NOMCON'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDNIConf: TwwDBEdit
        Left = 543
        Top = 36
        Width = 93
        Height = 27
        DataField = 'DNICON'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentFont = False
        Picture.PictureMask = '########'
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnConfirmar: TBitBtn
        Left = 652
        Top = 15
        Width = 76
        Height = 26
        Caption = 'Grabar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnConfirmarClick
      end
      object BitBtn1: TBitBtn
        Left = 652
        Top = 46
        Width = 76
        Height = 26
        Caption = 'Cancelar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BitBtn1Click
      end
    end
  end
  object pnlBusca: TPanel
    Left = 0
    Top = 1
    Width = 771
    Height = 321
    Color = 10207162
    TabOrder = 1
    object dbeBusNom: TwwDBEdit
      Left = 89
      Top = 39
      Width = 270
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeBusDNI: TwwDBEdit
      Left = 460
      Top = 40
      Width = 90
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Picture.PictureMask = '#[#][#][#][#][#][#][#]'
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbgDatos: TwwDBGrid
      Left = 8
      Top = 69
      Width = 756
      Height = 215
      DisableThemesInTitle = False
      Selected.Strings = (
        'NOMBRE'#9'35'#9'Apellidos y Nombres'#9#9
        'RUCDNI'#9'09'#9'D.N.I.'#9#9
        'FECPAG'#9'10'#9'Fecha~Pago'#9#9
        'NOMCON'#9'35'#9'Apellidos y Nombres~Modificado'#9#9
        'DNICON'#9'09'#9'D.N.I.~Modificado'#9#9
        'USUCON'#9'10'#9'Usuario~Que Modifico'#9#9
        'FECCON'#9'10'#9'Fecha~Que Modifico'#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = 12904163
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 6
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgDatosDblClick
    end
    object bbtnBuscar: TBitBtn
      Left = 11
      Top = 37
      Width = 73
      Height = 30
      Caption = 'Nombre'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = bbtnBuscarClick
    end
    object dtpFecha: TwwDBDateTimePicker
      Left = 655
      Top = 40
      Width = 108
      Height = 26
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 4
    end
    object bbtnBuscarDNI: TBitBtn
      Left = 382
      Top = 37
      Width = 73
      Height = 30
      Caption = 'D.N.I.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = bbtnBuscarDNIClick
    end
    object bbtnBuscarFec: TBitBtn
      Left = 577
      Top = 37
      Width = 73
      Height = 30
      Caption = 'Fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = bbtnBuscarFecClick
    end
    object bbtnNomMod: TBitBtn
      Left = 24
      Top = 288
      Width = 169
      Height = 30
      Caption = 'Nombre Modificado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = bbtnNomModClick
    end
    object dbeBusNomMod: TwwDBEdit
      Left = 203
      Top = 290
      Width = 270
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnDNIMod: TBitBtn
      Left = 488
      Top = 288
      Width = 137
      Height = 30
      Caption = 'D.N.I. Modificado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = bbtnDNIModClick
    end
    object dbeBusDNIMod: TwwDBEdit
      Left = 635
      Top = 291
      Width = 100
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Picture.PictureMask = '#[#][#][#][#][#][#][#]'
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object rgEvento: TRadioGroup
      Left = 10
      Top = 3
      Width = 375
      Height = 28
      Columns = 4
      ItemIndex = 3
      Items.Strings = (
        'Cajamarca'
        'Arequipa'
        'Lima'
        'Lima 2010')
      TabOrder = 11
      OnClick = rgEventoClick
    end
    object btnAgregar: TBitBtn
      Left = 427
      Top = 3
      Width = 73
      Height = 30
      Caption = 'Agregar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = btnAgregarClick
    end
  end
end
