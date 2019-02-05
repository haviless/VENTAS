object FToolConsClie: TFToolConsClie
  Left = 270
  Top = 506
  Width = 670
  Height = 97
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnGLT: TPanel
    Left = -18
    Top = 0
    Width = 675
    Height = 60
    BevelInner = bvRaised
    Color = 14869218
    TabOrder = 0
    object Z1sbMenuReglas2: TSpeedButton
      Left = 310
      Top = 8
      Width = 40
      Height = 38
      Cursor = crHandPoint
      Hint = 'Filtrar selecci'#243'n'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      Margin = 5
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = Z1sbMenuReglas2Click
    end
    object rgSeleccion: TRadioGroup
      Left = 350
      Top = 3
      Width = 236
      Height = 48
      Caption = 'Seleccione Condici'#243'n'
      Columns = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Pedido'
        'Articulo'
        'Vendedor')
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object gbFechas: TGroupBox
      Left = 27
      Top = 3
      Width = 304
      Height = 48
      Caption = 'Fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 8
        Top = 18
        Width = 35
        Height = 15
        Caption = 'Inicial'
      end
      object Label2: TLabel
        Left = 157
        Top = 18
        Width = 25
        Height = 15
        Caption = 'Final'
      end
      object dtpFIni: TwwDBDateTimePicker
        Left = 48
        Top = 15
        Width = 86
        Height = 23
        AutoSize = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
        Visible = False
      end
      object dtpFFin: TwwDBDateTimePicker
        Left = 207
        Top = 15
        Width = 86
        Height = 23
        AutoSize = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 1
      end
    end
    object rdgTipo: TRadioGroup
      Left = 38
      Top = 3
      Width = 236
      Height = 48
      Caption = 'Seleccione Tipo Cliente'
      Columns = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Cliente'
        'Asociado')
      ParentFont = False
      TabOrder = 2
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 582
    Top = 16
  end
end
