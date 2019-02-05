object FIngParticipantesEncinas: TFIngParticipantesEncinas
  Left = 286
  Top = 178
  BorderStyle = bsDialog
  Caption = 'Ingreso de Participantes'
  ClientHeight = 220
  ClientWidth = 442
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 175
    Width = 442
    Height = 45
    Align = alBottom
    ParentColor = True
    TabOrder = 0
    DesignSize = (
      442
      45)
    object btnAgregar: TButton
      Left = 273
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Agregar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAgregarClick
    end
    object btnCancelar: TButton
      Left = 361
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 175
    Align = alClient
    ParentColor = True
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 63
      Height = 13
      Caption = 'RUC / DNI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 17
      Top = 48
      Width = 54
      Height = 13
      Caption = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edDNI: TEdit
      Left = 79
      Top = 12
      Width = 110
      Height = 21
      MaxLength = 15
      TabOrder = 0
      OnKeyPress = edDNIKeyPress
    end
    object edNombre: TEdit
      Left = 79
      Top = 44
      Width = 350
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 1
      OnKeyPress = edDNIKeyPress
    end
    object GroupBox1: TGroupBox
      Left = 44
      Top = 80
      Width = 385
      Height = 89
      Caption = 'FORMA DE PAGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Label3: TLabel
        Left = 12
        Top = 62
        Width = 87
        Height = 13
        Caption = 'N'#176' DOC. PAGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 173
        Top = 30
        Width = 57
        Height = 13
        Caption = 'IMPORTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cboFormaPago: TComboBox
        Left = 11
        Top = 26
        Width = 110
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = 'BECAS'
        OnClick = cboFormaPagoClick
        Items.Strings = (
          'BECAS'
          'CAJA'
          'CHEQUE'
          'BANCO_OCTA')
      end
      object edNumDocPago: TEdit
        Left = 104
        Top = 57
        Width = 273
        Height = 21
        Color = clScrollBar
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        TabOrder = 1
        OnKeyPress = edDNIKeyPress
      end
      object edImporte: TEdit
        Left = 240
        Top = 25
        Width = 81
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 2
        Text = '0.00'
        OnKeyPress = edDNIKeyPress
      end
    end
  end
end
