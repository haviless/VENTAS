object FMaesClieCorto: TFMaesClieCorto
  Left = 214
  Top = 114
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Maestro de Clientes'
  ClientHeight = 549
  ClientWidth = 747
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label65: TLabel
    Left = 45
    Top = 311
    Width = 84
    Height = 15
    Caption = 'Nombre del Aval'
    Visible = False
  end
  object pnlPrincipal: TPanel
    Left = 8
    Top = 5
    Width = 729
    Height = 538
    Color = 14869218
    TabOrder = 0
    object Panel1: TPanel
      Left = 10
      Top = 12
      Width = 711
      Height = 513
      TabOrder = 0
      object pcMaestro: TPageControl
        Left = 0
        Top = 109
        Width = 714
        Height = 362
        ActivePage = TabSheet1
        TabOrder = 1
        OnChanging = pcMaestroChanging
        object TabSheet1: TTabSheet
          Caption = 'Generales'
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 706
            Height = 332
            Align = alClient
            Color = 14869218
            TabOrder = 0
            object Label4: TLabel
              Left = 24
              Top = 235
              Width = 43
              Height = 15
              Caption = 'EMail(s)'
            end
            object Label13: TLabel
              Left = 469
              Top = 235
              Width = 51
              Height = 15
              Caption = 'Tel'#233'fonos'
            end
            object lblNombreCorto: TLabel
              Left = 23
              Top = 16
              Width = 71
              Height = 15
              Caption = 'Nombre Corto'
            end
            object lblDocIdentidad: TLabel
              Left = 443
              Top = 16
              Width = 90
              Height = 15
              Caption = 'N'#186' Doc Identidad'
            end
            object lblNombre: TLabel
              Left = 407
              Top = 66
              Width = 40
              Height = 15
              Caption = 'Nombre'
            end
            object lblNombre2: TLabel
              Left = 557
              Top = 64
              Width = 87
              Height = 15
              Caption = 'Segundo Nombre'
            end
            object lblApPaterno: TLabel
              Left = 23
              Top = 66
              Width = 84
              Height = 15
              Caption = 'Apellido Paterno'
            end
            object lblApMaterno: TLabel
              Left = 212
              Top = 66
              Width = 88
              Height = 15
              Caption = 'Apellido Materno'
            end
            object Label11: TLabel
              Left = 31
              Top = 122
              Width = 105
              Height = 15
              Caption = 'Direcci'#243'n Comercial'
            end
            object Label29: TLabel
              Left = 23
              Top = 178
              Width = 21
              Height = 15
              Caption = 'Pa'#237's'
            end
            object Label21: TLabel
              Left = 188
              Top = 178
              Width = 71
              Height = 15
              Caption = 'Departamento'
            end
            object Label22: TLabel
              Left = 356
              Top = 178
              Width = 49
              Height = 15
              Caption = 'Provincia'
            end
            object Label23: TLabel
              Left = 514
              Top = 178
              Width = 40
              Height = 15
              Caption = 'Distrito'
            end
            object lblTDocIdentidad: TLabel
              Left = 203
              Top = 16
              Width = 99
              Height = 15
              Caption = 'Tipo Doc Identidad'
            end
            object dbeTelef: TwwDBEdit
              Left = 440
              Top = 252
              Width = 121
              Height = 23
              CharCase = ecUpperCase
              DataField = 'CLIETELF'
              TabOrder = 17
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeMail: TwwDBEdit
              Left = 20
              Top = 252
              Width = 360
              Height = 23
              DataField = 'CLIEEMAI'
              TabOrder = 16
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeAbr: TwwDBEdit
              Left = 20
              Top = 32
              Width = 173
              Height = 23
              DataField = 'CLIEABR'
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeDocIdentidad: TwwDBEdit
              Left = 442
              Top = 32
              Width = 127
              Height = 23
              DataField = 'CLIEDNI'
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbeDocIdentidadExit
            end
            object dbeNombres: TwwDBEdit
              Left = 404
              Top = 80
              Width = 146
              Height = 23
              DataField = 'CLIENOMBRE'
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbesNombres: TwwDBEdit
              Left = 556
              Top = 79
              Width = 146
              Height = 23
              DataField = 'CLIENOMBRE1'
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeapepat: TwwDBEdit
              Left = 20
              Top = 81
              Width = 185
              Height = 23
              DataField = 'CLIEAPEPAT'
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeapemat: TwwDBEdit
              Left = 209
              Top = 81
              Width = 188
              Height = 23
              DataField = 'CLIEAPEMAT'
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object cbActivo: TwwCheckBox
              Left = 575
              Top = 289
              Width = 98
              Height = 30
              DisableThemes = False
              AlwaysTransparent = False
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              DisplayValueChecked = 'S'
              DisplayValueUnchecked = 'N'
              NullAndBlankState = cbUnchecked
              Caption = 'Activo'
              Color = clInfoBk
              DataField = 'ACTIVO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -19
              Font.Name = 'Comic Sans MS'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 18
            end
            object dbeDirCom: TwwDBEdit
              Left = 20
              Top = 139
              Width = 300
              Height = 23
              DataField = 'CLIEDIR'
              TabOrder = 7
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblcPais: TwwDBLookupCombo
              Left = 20
              Top = 196
              Width = 45
              Height = 23
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'PAISID'#9'3'#9'Id'#9'F'
                'PAISDES'#9'30'#9'Pais'#9'F')
              DataField = 'PAISID'
              LookupField = 'PAISID'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 8
              AutoDropDown = False
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblcPaisExit
            end
            object dbePais: TwwDBEdit
              Left = 66
              Top = 196
              Width = 100
              Height = 23
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 9
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblcDeparta: TwwDBLookupCombo
              Left = 187
              Top = 196
              Width = 45
              Height = 23
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DPTOID'#9'3'#9'Id'#9'F'
                'DPTODES'#9'30'#9'Departamento'#9'F')
              DataField = 'DPTOID'
              LookupField = 'DPTOID'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 10
              AutoDropDown = False
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblcDepartaExit
            end
            object dbeDeparta: TwwDBEdit
              Left = 233
              Top = 196
              Width = 100
              Height = 23
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 11
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblcdProvinc: TwwDBLookupComboDlg
              Left = 356
              Top = 196
              Width = 45
              Height = 23
              GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
              GridColor = clWhite
              GridTitleAlignment = taLeftJustify
              Caption = 'Lookup'
              MaxWidth = 0
              MaxHeight = 209
              Selected.Strings = (
                'CIUDID'#9'3'#9'Id'#9'F'
                'CIUDDES'#9'30'#9'Descripci'#243'n'#9'F')
              DataField = 'CIUDID'
              LookupField = 'CIUDID'
              TabOrder = 12
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnExit = dblcdProvincExit
            end
            object dbeProvinc: TwwDBEdit
              Left = 401
              Top = 196
              Width = 100
              Height = 23
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 13
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblcdDistrito: TwwDBLookupComboDlg
              Left = 512
              Top = 196
              Width = 45
              Height = 23
              GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
              GridColor = clWhite
              GridTitleAlignment = taLeftJustify
              Caption = 'Lookup'
              MaxWidth = 0
              MaxHeight = 209
              Selected.Strings = (
                'ZIPID'#9'3'#9'Id'#9'F'
                'ZIPDES'#9'35'#9'Distrito'#9'F')
              DataField = 'CLIECZIP'
              LookupField = 'ZIPID'
              TabOrder = 14
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnExit = dblcdDistritoExit
            end
            object dbeDistrito: TwwDBEdit
              Left = 558
              Top = 196
              Width = 100
              Height = 23
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 15
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblcTDocIdentidad: TwwDBLookupCombo
              Left = 203
              Top = 32
              Width = 40
              Height = 23
              DropDownAlignment = taLeftJustify
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              PreciseEditRegion = False
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblcTDocIdentidadExit
            end
            object edtTDocIdentidad: TwwDBEdit
              Left = 243
              Top = 32
              Width = 186
              Height = 23
              Enabled = False
              TabOrder = 19
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      object pnlCab: TPanel
        Left = 1
        Top = 1
        Width = 709
        Height = 103
        Align = alTop
        Color = 14869218
        TabOrder = 0
        object Label46: TLabel
          Left = 389
          Top = 6
          Width = 37
          Height = 15
          Caption = 'Cl.Aux.'
        end
        object Label25: TLabel
          Left = 612
          Top = 6
          Width = 74
          Height = 15
          Caption = 'Codigo Cliente'
        end
        object Label17: TLabel
          Left = 244
          Top = 6
          Width = 109
          Height = 16
          AutoSize = False
          Caption = 'Tipo de Persona'
          WordWrap = True
        end
        object Label47: TLabel
          Left = 7
          Top = 6
          Width = 49
          Height = 15
          Caption = 'Compa'#241#237'a'
        end
        object lblRuc: TLabel
          Left = 8
          Top = 51
          Width = 19
          Height = 15
          Caption = 'Ruc'
        end
        object lblRazonSocial: TLabel
          Left = 139
          Top = 50
          Width = 67
          Height = 15
          Caption = 'Razon Social'
        end
        object dblcClAux: TwwDBLookupCombo
          Left = 389
          Top = 23
          Width = 42
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CLAUXID'#9'2'#9'Id.'#9'F'
            'CLAUXDES'#9'30'#9'Clase Auxiliar'#9'F')
          DataField = 'CLAUXID'
          LookupField = 'CLAUXID'
          Options = [loColLines, loRowLines, loTitles]
          Enabled = False
          ReadOnly = True
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcClAuxExit
          OnNotInList = NotInList
        end
        object dbeClAux: TwwDBEdit
          Left = 433
          Top = 23
          Width = 166
          Height = 23
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 8
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeClie: TwwDBEdit
          Left = 612
          Top = 23
          Width = 89
          Height = 23
          AutoFillDate = False
          AutoSelect = False
          AutoSize = False
          CharCase = ecUpperCase
          DataField = 'CLIEID'
          Enabled = False
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbeClieExit
        end
        object dblcTipPer: TwwDBLookupCombo
          Left = 240
          Top = 23
          Width = 40
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TIPPERID'#9'2'#9'Id'#9'F'
            'TIPPERDES'#9'30'#9'Tipo de Persona'#9'F')
          DataField = 'TIPPERID'
          LookupField = 'TIPPERID'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblcTipPerExit
          OnNotInList = NotInList
        end
        object dbeTipPer: TwwDBEdit
          Left = 280
          Top = 23
          Width = 105
          Height = 23
          Enabled = False
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcCia: TwwDBLookupCombo
          Left = 5
          Top = 23
          Width = 41
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CIAID'#9'2'#9'Id'#9'F'
            'CIADES'#9'40'#9'Compa'#241#237'a'#9'F')
          DataField = 'CIAID'
          LookupField = 'CIAID'
          Options = [loColLines, loRowLines, loTitles]
          DropDownCount = 13
          ReadOnly = True
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcCiaExit
          OnNotInList = NotInList
        end
        object dbeCia: TwwDBEdit
          Left = 46
          Top = 23
          Width = 191
          Height = 23
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 6
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeRuc: TwwDBEdit
          Left = 8
          Top = 65
          Width = 113
          Height = 23
          AutoFillDate = False
          AutoSelect = False
          AutoSize = False
          CharCase = ecUpperCase
          DataField = 'CLIERUC'
          MaxLength = 11
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbeRucExit
        end
        object dbeRazSoc: TwwDBEdit
          Left = 138
          Top = 66
          Width = 448
          Height = 23
          CharCase = ecUpperCase
          DataField = 'CLIEDES'
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object pnlPie: TPanel
        Left = 1
        Top = 471
        Width = 709
        Height = 41
        Align = alBottom
        Color = 14869218
        TabOrder = 2
        object Z2bbtnOK: TBitBtn
          Left = 624
          Top = 7
          Width = 32
          Height = 31
          Hint = 'Pasa a Registrar Detalle'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = Z2bbtnOKClick
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
        object Z2bbtnCancel: TBitBtn
          Left = 666
          Top = 7
          Width = 32
          Height = 31
          Hint = 'Reinicia Comprobante'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = Z2bbtnCancelClick
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
    end
  end
end
