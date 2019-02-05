object FEditarObsequio: TFEditarObsequio
  Left = 355
  Top = 314
  BorderStyle = bsDialog
  Caption = 'Obsequio'
  ClientHeight = 179
  ClientWidth = 271
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnAceptar: TButton
    Left = 109
    Top = 136
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 190
    Top = 136
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnCancelarClick
  end
  object chbxEmiCarta: TCheckBox
    Left = 8
    Top = 145
    Width = 97
    Height = 17
    Caption = 'Emitio Carta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object gbRango: TGroupBox
    Left = 8
    Top = 72
    Width = 257
    Height = 57
    Caption = 'Rango(S/.)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 25
      Width = 32
      Height = 13
      Caption = 'Inicio'
    end
    object Label2: TLabel
      Left = 170
      Top = 25
      Width = 18
      Height = 13
      Caption = 'Fin'
    end
    object sedRangoMin: TSpinEdit
      Left = 46
      Top = 21
      Width = 65
      Height = 22
      MaxValue = 100000
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object sedRangoMax: TSpinEdit
      Left = 193
      Top = 21
      Width = 57
      Height = 22
      MaxValue = 100000
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
  end
  object edArtId: TEdit
    Left = 9
    Top = 2
    Width = 256
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = 13041663
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = 'edArtId'
  end
  object rgEmitioCarta: TRadioGroup
    Left = 8
    Top = 24
    Width = 257
    Height = 41
    Columns = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 1
    Items.Strings = (
      'Con Carta'
      'Sin Carta'
      'Ambos')
    ParentFont = False
    TabOrder = 5
    OnClick = rgEmitioCartaClick
  end
end
