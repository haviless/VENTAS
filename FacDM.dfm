object DMFAC: TDMFAC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 273
  Top = 74
  Height = 687
  Width = 841
  object dsMovFac: TwwDataSource
    DataSet = cdsMovFac
    Left = 20
    Top = 58
  end
  object dsUsuarios: TwwDataSource
    DataSet = cdsUsuarios
    Left = 70
    Top = 4
  end
  object dsAcceso: TwwDataSource
    DataSet = cdsAcceso
    Left = 134
    Top = 4
  end
  object dsGrupos: TwwDataSource
    DataSet = cdsGrupos
    Left = 194
    Top = 4
  end
  object dsMGrupo: TwwDataSource
    DataSet = cdsMGrupo
    Left = 256
    Top = 4
  end
  object dsClie: TwwDataSource
    DataSet = cdsClie
    Left = 357
    Top = 4
  end
  object dsVen: TwwDataSource
    DataSet = cdsVen
    Left = 309
    Top = 4
  end
  object dsLPrecio: TwwDataSource
    DataSet = cdsLPrecio
    Left = 696
    Top = 4
  end
  object dsTVta: TwwDataSource
    DataSet = cdsTVta
    Left = 464
    Top = 4
  end
  object cdsQry: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 14
    Top = 499
  end
  object cdsQry1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 60
    Top = 499
  end
  object cdsQry2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 106
    Top = 499
  end
  object dsCia: TwwDataSource
    DataSet = cdsCia
    Left = 512
    Top = 4
  end
  object cdsTMon: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTMon'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 604
    Top = 162
  end
  object cdsUltTGE: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 85
    Top = 211
  end
  object dsStkArt: TwwDataSource
    DataSet = cdsStkArt
    Left = 410
    Top = 4
  end
  object cdsTLista: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTLista'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 365
    Top = 162
  end
  object cdsTReg: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTReg'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 312
    Top = 162
  end
  object dsGuia: TwwDataSource
    DataSet = cdsGuia
    Left = 139
    Top = 58
  end
  object dsDetGuia: TwwDataSource
    DataSet = cdsDetGuia
    Left = 195
    Top = 58
  end
  object dsMovFac2: TwwDataSource
    DataSet = cdsMovFac2
    Left = 262
    Top = 58
  end
  object dsDetFac2: TwwDataSource
    DataSet = cdsDetFac2
    Left = 329
    Top = 58
  end
  object cdsLocal: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocal'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 194
    Top = 162
  end
  object cdsAlmacen: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAlmacen'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 253
    Top = 162
  end
  object cdsTTran: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTTran'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 685
    Top = 326
  end
  object cdsCosto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCosto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 636
    Top = 326
  end
  object cdsChofer: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChofer'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 723
    Top = 499
  end
  object cdsArticulo: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 100
    Params = <>
    ProviderName = 'dspArticulo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 483
    Top = 162
  end
  object dsGuia2: TwwDataSource
    DataSet = cdsGuia2
    Left = 390
    Top = 58
  end
  object dsDetguia2: TwwDataSource
    DataSet = cdsDetGuia2
    Left = 450
    Top = 58
  end
  object cdsSerie: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSerie'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 712
    Top = 162
  end
  object cdsParPres: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParPres'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 20
    Top = 162
  end
  object cdsTipPres: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipPres'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 138
    Top = 162
  end
  object dsFact: TwwDataSource
    DataSet = cdsFact
    Left = 505
    Top = 58
  end
  object dsDetFact: TwwDataSource
    DataSet = cdsDetFact
    Left = 562
    Top = 58
  end
  object cdsGuiaPend: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGuia2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 25
    Top = 113
  end
  object dsGuiaPend: TwwDataSource
    DataSet = cdsGuiaPend
    Left = 35
    Top = 113
  end
  object cdsDetPend: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetGuia2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 95
    Top = 113
  end
  object dsDetPend: TwwDataSource
    DataSet = cdsDetPend
    Left = 105
    Top = 113
  end
  object cdsFact2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFactS'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'FACTCAM'#9'#[*#][.[#][#][#][#]]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 153
    Top = 113
  end
  object cdsDetFact2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetFactS'
    RemoteServer = DCOM1
    OnReconcileError = cdsDetFact2ReconcileError
    ValidateWithMask = True
    Left = 213
    Top = 113
  end
  object dsFact2: TwwDataSource
    DataSet = cdsFact2
    Left = 163
    Top = 113
  end
  object dsDetFact2: TwwDataSource
    DataSet = cdsDetFact2
    Left = 223
    Top = 113
  end
  object cdsEmpresa: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 600
    Top = 211
  end
  object dsEmpresa: TwwDataSource
    DataSet = cdsEmpresa
    Left = 607
    Top = 211
  end
  object cdsRepClie: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRepClie'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 346
    Top = 113
  end
  object dsRepclie: TwwDataSource
    DataSet = cdsRepClie
    Left = 356
    Top = 113
  end
  object cdsRepPed: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 408
    Top = 113
  end
  object dsRepPed: TwwDataSource
    DataSet = cdsRepPed
    Left = 418
    Top = 113
  end
  object cdsRepDPed: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 475
    Top = 113
  end
  object dsRepDPed: TwwDataSource
    DataSet = cdsRepDPed
    Left = 485
    Top = 113
  end
  object cdsRepGuia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 544
    Top = 113
  end
  object dsRepGuia: TwwDataSource
    DataSet = cdsRepGuia
    Left = 554
    Top = 113
  end
  object cdsRepDGuia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 614
    Top = 113
  end
  object dsRepDGuia: TwwDataSource
    DataSet = cdsRepDGuia
    Left = 624
    Top = 113
  end
  object cdsQry3: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 152
    Top = 499
  end
  object cdsQry4: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 198
    Top = 499
  end
  object cdsTDoc: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTDocCxC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 485
    Top = 211
  end
  object dsTDoc: TwwDataSource
    DataSet = cdsTDoc
    Left = 492
    Top = 211
  end
  object dsComision: TwwDataSource
    DataSet = cdsComision
    Left = 671
    Top = 441
  end
  object dsDetComision: TwwDataSource
    DataSet = cdsDetComision
    Left = 695
    Top = 113
  end
  object cdsFactPend: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFactpend'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 281
    Top = 113
  end
  object dsFactPend: TwwDataSource
    DataSet = cdsFactPend
    Left = 291
    Top = 113
  end
  object cdsReglas: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReglas'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 79
    Top = 162
  end
  object dsDetFac: TwwDataSource
    AutoEdit = False
    DataSet = cdsDetFac
    Left = 81
    Top = 58
  end
  object dsDireccion: TwwDataSource
    DataSet = cdsDireccion
    Left = 568
    Top = 4
  end
  object cdsStk: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CIAID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'LOCID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ALMID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'STKANO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'TINID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'GRARID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FAMID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'SFAMID'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ARTID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ARTCONT'
        DataType = ftFloat
      end
      item
        Name = 'UNMIDG'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UNMIDU'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UBID'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'FABID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ARTSPRO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ARTSCA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ARTPARA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ARTSNA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ARTFUC'
        DataType = ftDate
      end
      item
        Name = 'TMONID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ARTCRGO'
        DataType = ftFloat
      end
      item
        Name = 'ARTACTIVO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CUENTAID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'STKSANTG'
        DataType = ftFloat
      end
      item
        Name = 'STKSANTU'
        DataType = ftFloat
      end
      item
        Name = 'STKMANTG'
        DataType = ftFloat
      end
      item
        Name = 'STKMANTU'
        DataType = ftFloat
      end
      item
        Name = 'STKTSG01'
        DataType = ftFloat
      end
      item
        Name = 'STKISG01'
        DataType = ftFloat
      end
      item
        Name = 'STKSSG01'
        DataType = ftFloat
      end
      item
        Name = 'STKTMG01'
        DataType = ftFloat
      end
      item
        Name = 'STKIMG01'
        DataType = ftFloat
      end
      item
        Name = 'STKSMG01'
        DataType = ftFloat
      end
      item
        Name = 'STKTSU01'
        DataType = ftFloat
      end
      item
        Name = 'STKISU01'
        DataType = ftFloat
      end
      item
        Name = 'STKSSU01'
        DataType = ftFloat
      end
      item
        Name = 'STKTMU01'
        DataType = ftFloat
      end
      item
        Name = 'STKIMU01'
        DataType = ftFloat
      end
      item
        Name = 'STKSMU01'
        DataType = ftFloat
      end
      item
        Name = 'STKTSG02'
        DataType = ftFloat
      end
      item
        Name = 'STKISG02'
        DataType = ftFloat
      end
      item
        Name = 'STKSSG02'
        DataType = ftFloat
      end
      item
        Name = 'STKTMG02'
        DataType = ftFloat
      end
      item
        Name = 'STKIMG02'
        DataType = ftFloat
      end
      item
        Name = 'STKSMG02'
        DataType = ftFloat
      end
      item
        Name = 'STKTSU02'
        DataType = ftFloat
      end
      item
        Name = 'STKISU02'
        DataType = ftFloat
      end
      item
        Name = 'STKSSU02'
        DataType = ftFloat
      end
      item
        Name = 'STKTMU02'
        DataType = ftFloat
      end
      item
        Name = 'STKIMU02'
        DataType = ftFloat
      end
      item
        Name = 'STKSMU02'
        DataType = ftFloat
      end
      item
        Name = 'STKTSG03'
        DataType = ftFloat
      end
      item
        Name = 'STKISG03'
        DataType = ftFloat
      end
      item
        Name = 'STKSSG03'
        DataType = ftFloat
      end
      item
        Name = 'STKTMG03'
        DataType = ftFloat
      end
      item
        Name = 'STKIMG03'
        DataType = ftFloat
      end
      item
        Name = 'STKSMG03'
        DataType = ftFloat
      end
      item
        Name = 'STKTSU03'
        DataType = ftFloat
      end
      item
        Name = 'STKISU03'
        DataType = ftFloat
      end
      item
        Name = 'STKSSU03'
        DataType = ftFloat
      end
      item
        Name = 'STKTMU03'
        DataType = ftFloat
      end
      item
        Name = 'STKIMU03'
        DataType = ftFloat
      end
      item
        Name = 'STKSMU03'
        DataType = ftFloat
      end
      item
        Name = 'STKTSG04'
        DataType = ftFloat
      end
      item
        Name = 'STKISG04'
        DataType = ftFloat
      end
      item
        Name = 'STKSSG04'
        DataType = ftFloat
      end
      item
        Name = 'STKTMG04'
        DataType = ftFloat
      end
      item
        Name = 'STKIMG04'
        DataType = ftFloat
      end
      item
        Name = 'STKSMG04'
        DataType = ftFloat
      end
      item
        Name = 'STKTSU04'
        DataType = ftFloat
      end
      item
        Name = 'STKISU04'
        DataType = ftFloat
      end
      item
        Name = 'STKSSU04'
        DataType = ftFloat
      end
      item
        Name = 'STKTMU04'
        DataType = ftFloat
      end
      item
        Name = 'STKIMU04'
        DataType = ftFloat
      end
      item
        Name = 'STKSMU04'
        DataType = ftFloat
      end
      item
        Name = 'STKTSG05'
        DataType = ftFloat
      end
      item
        Name = 'STKISG05'
        DataType = ftFloat
      end
      item
        Name = 'STKSSG05'
        DataType = ftFloat
      end
      item
        Name = 'STKTMG05'
        DataType = ftFloat
      end
      item
        Name = 'STKIMG05'
        DataType = ftFloat
      end
      item
        Name = 'STKSMG05'
        DataType = ftFloat
      end
      item
        Name = 'STKTSU05'
        DataType = ftFloat
      end
      item
        Name = 'STKISU05'
        DataType = ftFloat
      end
      item
        Name = 'STKSSU05'
        DataType = ftFloat
      end
      item
        Name = 'STKTMU05'
        DataType = ftFloat
      end
      item
        Name = 'STKIMU05'
        DataType = ftFloat
      end
      item
        Name = 'STKSMU05'
        DataType = ftFloat
      end
      item
        Name = 'STKTSG06'
        DataType = ftFloat
      end
      item
        Name = 'STKISG06'
        DataType = ftFloat
      end
      item
        Name = 'STKSSG06'
        DataType = ftFloat
      end
      item
        Name = 'STKTMG06'
        DataType = ftFloat
      end
      item
        Name = 'STKIMG06'
        DataType = ftFloat
      end
      item
        Name = 'STKSMG06'
        DataType = ftFloat
      end
      item
        Name = 'STKTSU06'
        DataType = ftFloat
      end
      item
        Name = 'STKISU06'
        DataType = ftFloat
      end
      item
        Name = 'STKSSU06'
        DataType = ftFloat
      end
      item
        Name = 'STKTMU06'
        DataType = ftFloat
      end
      item
        Name = 'STKIMU06'
        DataType = ftFloat
      end
      item
        Name = 'STKSMU06'
        DataType = ftFloat
      end
      item
        Name = 'STKTSG07'
        DataType = ftFloat
      end
      item
        Name = 'STKISG07'
        DataType = ftFloat
      end
      item
        Name = 'STKSSG07'
        DataType = ftFloat
      end
      item
        Name = 'STKTMG07'
        DataType = ftFloat
      end
      item
        Name = 'STKIMG07'
        DataType = ftFloat
      end
      item
        Name = 'STKSMG07'
        DataType = ftFloat
      end
      item
        Name = 'STKTSU07'
        DataType = ftFloat
      end
      item
        Name = 'STKISU07'
        DataType = ftFloat
      end
      item
        Name = 'STKSSU07'
        DataType = ftFloat
      end
      item
        Name = 'STKTMU07'
        DataType = ftFloat
      end
      item
        Name = 'STKIMU07'
        DataType = ftFloat
      end
      item
        Name = 'STKSMU07'
        DataType = ftFloat
      end
      item
        Name = 'STKTSG08'
        DataType = ftFloat
      end
      item
        Name = 'STKISG08'
        DataType = ftFloat
      end
      item
        Name = 'STKSSG08'
        DataType = ftFloat
      end
      item
        Name = 'STKTMG08'
        DataType = ftFloat
      end
      item
        Name = 'STKIMG08'
        DataType = ftFloat
      end
      item
        Name = 'STKSMG08'
        DataType = ftFloat
      end
      item
        Name = 'STKTSU08'
        DataType = ftFloat
      end
      item
        Name = 'STKISU08'
        DataType = ftFloat
      end
      item
        Name = 'STKSSU08'
        DataType = ftFloat
      end
      item
        Name = 'STKTMU08'
        DataType = ftFloat
      end
      item
        Name = 'STKIMU08'
        DataType = ftFloat
      end
      item
        Name = 'STKSMU08'
        DataType = ftFloat
      end
      item
        Name = 'STKTSG09'
        DataType = ftFloat
      end
      item
        Name = 'STKISG09'
        DataType = ftFloat
      end
      item
        Name = 'STKSSG09'
        DataType = ftFloat
      end
      item
        Name = 'STKTMG09'
        DataType = ftFloat
      end
      item
        Name = 'STKIMG09'
        DataType = ftFloat
      end
      item
        Name = 'STKSMG09'
        DataType = ftFloat
      end
      item
        Name = 'STKTSU09'
        DataType = ftFloat
      end
      item
        Name = 'STKISU09'
        DataType = ftFloat
      end
      item
        Name = 'STKSSU09'
        DataType = ftFloat
      end
      item
        Name = 'STKTMU09'
        DataType = ftFloat
      end
      item
        Name = 'STKIMU09'
        DataType = ftFloat
      end
      item
        Name = 'STKSMU09'
        DataType = ftFloat
      end
      item
        Name = 'STKTSG10'
        DataType = ftFloat
      end
      item
        Name = 'STKISG10'
        DataType = ftFloat
      end
      item
        Name = 'STKSSG10'
        DataType = ftFloat
      end
      item
        Name = 'STKTMG10'
        DataType = ftFloat
      end
      item
        Name = 'STKIMG10'
        DataType = ftFloat
      end
      item
        Name = 'STKSMG10'
        DataType = ftFloat
      end
      item
        Name = 'STKTSU10'
        DataType = ftFloat
      end
      item
        Name = 'STKISU10'
        DataType = ftFloat
      end
      item
        Name = 'STKSSU10'
        DataType = ftFloat
      end
      item
        Name = 'STKTMU10'
        DataType = ftFloat
      end
      item
        Name = 'STKIMU10'
        DataType = ftFloat
      end
      item
        Name = 'STKSMU10'
        DataType = ftFloat
      end
      item
        Name = 'STKTSG11'
        DataType = ftFloat
      end
      item
        Name = 'STKISG11'
        DataType = ftFloat
      end
      item
        Name = 'STKSSG11'
        DataType = ftFloat
      end
      item
        Name = 'STKTMG11'
        DataType = ftFloat
      end
      item
        Name = 'STKIMG11'
        DataType = ftFloat
      end
      item
        Name = 'STKSMG11'
        DataType = ftFloat
      end
      item
        Name = 'STKTSU11'
        DataType = ftFloat
      end
      item
        Name = 'STKISU11'
        DataType = ftFloat
      end
      item
        Name = 'STKSSU11'
        DataType = ftFloat
      end
      item
        Name = 'STKTMU11'
        DataType = ftFloat
      end
      item
        Name = 'STKIMU11'
        DataType = ftFloat
      end
      item
        Name = 'STKSMU11'
        DataType = ftFloat
      end
      item
        Name = 'STKTSG12'
        DataType = ftFloat
      end
      item
        Name = 'STKISG12'
        DataType = ftFloat
      end
      item
        Name = 'STKSSG12'
        DataType = ftFloat
      end
      item
        Name = 'STKTMG12'
        DataType = ftFloat
      end
      item
        Name = 'STKIMG12'
        DataType = ftFloat
      end
      item
        Name = 'STKSMG12'
        DataType = ftFloat
      end
      item
        Name = 'STKTSU12'
        DataType = ftFloat
      end
      item
        Name = 'STKISU12'
        DataType = ftFloat
      end
      item
        Name = 'STKSSU12'
        DataType = ftFloat
      end
      item
        Name = 'STKTMU12'
        DataType = ftFloat
      end
      item
        Name = 'STKIMU12'
        DataType = ftFloat
      end
      item
        Name = 'STKSMU12'
        DataType = ftFloat
      end
      item
        Name = 'STKSACTG'
        DataType = ftFloat
      end
      item
        Name = 'STKSACTU'
        DataType = ftFloat
      end
      item
        Name = 'STKMACTG'
        DataType = ftFloat
      end
      item
        Name = 'STKMACTU'
        DataType = ftFloat
      end
      item
        Name = 'STKSFISG'
        DataType = ftFloat
      end
      item
        Name = 'STKSFISU'
        DataType = ftFloat
      end
      item
        Name = 'STKSMAXG'
        DataType = ftFloat
      end
      item
        Name = 'STKSMING'
        DataType = ftFloat
      end
      item
        Name = 'STKSMAXU'
        DataType = ftFloat
      end
      item
        Name = 'STKSMINU'
        DataType = ftFloat
      end
      item
        Name = 'STKINV'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'STKPUPED'
        DataType = ftFloat
      end
      item
        Name = 'STKLOTEC'
        DataType = ftFloat
      end
      item
        Name = 'STKRACTG'
        DataType = ftFloat
      end
      item
        Name = 'STKRACTU'
        DataType = ftFloat
      end
      item
        Name = 'ARTDES'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'i2'
        Source = 'IXKDX'
      end>
    PacketRecords = 100
    Params = <>
    ProviderName = 'dspStk'
    RemoteServer = DCOM1
    StoreDefs = True
    ValidateWithMask = True
    Left = 187
    Top = 211
  end
  object dsStk: TwwDataSource
    DataSet = cdsStk
    Left = 194
    Top = 211
  end
  object cdsArtiStk: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspArtiStk'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 289
    Top = 211
  end
  object dsArtiStk: TwwDataSource
    DataSet = cdsArtiStk
    Left = 296
    Top = 211
  end
  object cdsPPrecio: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPPrecio'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 539
    Top = 211
  end
  object dsPPrecio: TwwDataSource
    DataSet = cdsPPrecio
    Left = 546
    Top = 211
  end
  object cdsDscto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDscto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 146
    Top = 268
  end
  object dsDscto: TwwDataSource
    DataSet = cdsDscto
    Left = 155
    Top = 268
  end
  object cdsTInven: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTInven'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 236
    Top = 211
  end
  object dsTInven: TwwDataSource
    DataSet = cdsTInven
    Left = 243
    Top = 211
  end
  object cdsLinea: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLinea'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 340
    Top = 211
  end
  object dsLinea: TwwDataSource
    DataSet = cdsLinea
    Left = 347
    Top = 211
  end
  object cdsFam: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFam'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 387
    Top = 211
  end
  object cdsSFam: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSFam'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 434
    Top = 211
  end
  object dsFam: TwwDataSource
    DataSet = cdsFam
    Left = 394
    Top = 211
  end
  object dsSFam: TwwDataSource
    DataSet = cdsSFam
    Left = 441
    Top = 211
  end
  object dsCanal: TwwDataSource
    DataSet = cdsCanal
    Left = 636
    Top = 4
  end
  object cdsDHojaT: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDHojat'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 711
    Top = 211
  end
  object dsDHojaT: TwwDataSource
    DataSet = cdsDHojaT
    Left = 718
    Top = 211
  end
  object cdsHojaT: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHojaT'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 658
    Top = 211
  end
  object dsHojaT: TwwDataSource
    DataSet = cdsHojaT
    Left = 665
    Top = 211
  end
  object cdsCComer: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCComer'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 659
    Top = 162
  end
  object cdsUsuarios: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'USERID;'
    Params = <>
    ProviderName = 'prvUsuario'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 70
    Top = 4
  end
  object cdsAcceso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcceso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 135
    Top = 4
  end
  object cdsGrupos: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'GRUPOID;MODULOID;TIPO;OBJETO'
    Params = <>
    ProviderName = 'dspGrupos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 195
    Top = 4
  end
  object cdsMGrupo: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'GRUPOID'
    Params = <>
    ProviderName = 'dspMGrupo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 257
    Top = 4
  end
  object cdsVen: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'VEID'
    Params = <>
    ProviderName = 'dspVen'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 311
    Top = 4
  end
  object cdsClie: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'dspClie'
    RemoteServer = DCOM1
    OnReconcileError = cdsClieReconcileError
    ValidateWithMask = True
    Left = 360
    Top = 4
  end
  object cdsStkArt: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 100
    Params = <>
    ProviderName = 'dspStkArt'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 411
    Top = 4
  end
  object cdsTVta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTVta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 464
    Top = 4
  end
  object cdsCia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCia'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 512
    Top = 4
  end
  object cdsDireccion: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 100
    Params = <>
    ProviderName = 'dspDireccion'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 569
    Top = 4
  end
  object cdsCanal: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCanal'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 636
    Top = 4
  end
  object cdsLPrecio: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLPrecio'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'LPRETCAM'#9'#[*#][.[#][#][#]]'#9'T'#9'F'
      'LPREVOLMIN'#9'#[*#][.[#][#][#]]'#9'T'#9'F'
      'LPREPDCTO'#9'#[*#][.[#][#][#]]'#9'T'#9'F'
      'LPREPRECMO'#9'#[*#][.[#][#][#]]'#9'T'#9'F'
      'LPREPINC'#9'#[*#][.[#][#][#]]'#9'T'#9'F'
      'LPREBASEMO'#9'#[*#][.[#][#][#]]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 696
    Top = 4
  end
  object cdsMovFac: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'dspMovFac'
    RemoteServer = DCOM1
    OnReconcileError = cdsMovFacReconcileError
    PictureMasks.Strings = (
      'PEDTCAM'#9'#[*#][.[#][#][#][#]]'#9'T'#9'F'
      'PEDGARAN'#9'[#][#][#]'#9'T'#9'F'
      'PEDEMBMO'#9'#[*#][.[#][#][#]]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 20
    Top = 58
  end
  object cdsDetFac: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetFac'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 82
    Top = 58
  end
  object cdsGuia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGuia'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'NGUIA'#9'#[*#]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 137
    Top = 58
  end
  object cdsDetGuia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetGuia'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 193
    Top = 58
  end
  object cdsMovFac2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 260
    Top = 58
  end
  object cdsDetFac2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetFac2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 328
    Top = 58
  end
  object cdsGuia2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGuiaS'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'GREMGARAN'#9'#[*#]'#9'T'#9'F'
      'GREMTCAM'#9'#[*#][.[#][#][#][#]]'#9'T'#9'F'
      'NGUIA'#9'#[#][#][#][#][#][#][#][#][#]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 388
    Top = 58
  end
  object cdsDetGuia2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetGuiaS'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 449
    Top = 58
  end
  object cdsFact: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFact'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'FACTCAM'#9'#[*#][.[#][#][#][#]]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 507
    Top = 58
  end
  object cdsDetFact: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetFact'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 559
    Top = 58
  end
  object cdsComision: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComision'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 671
    Top = 441
  end
  object cdsDetComision: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetcomision'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 694
    Top = 113
  end
  object cdsKdx: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspKdx'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 11
    Top = 326
  end
  object dsKdx: TwwDataSource
    DataSet = cdsKdx
    Left = 20
    Top = 326
  end
  object cdsPeriodo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPeriodo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 64
    Top = 326
  end
  object dsPeriodo: TwwDataSource
    DataSet = cdsPeriodo
    Left = 72
    Top = 326
  end
  object cdsProv: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProv'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 169
    Top = 326
    object cdsProvPROV: TStringField
      DisplayLabel = 'Id'
      DisplayWidth = 12
      FieldName = 'PROV'
      Size = 15
    end
    object cdsProvPROVDES: TStringField
      DisplayLabel = 'Provedor'
      DisplayWidth = 30
      FieldName = 'PROVDES'
      Size = 40
    end
  end
  object dsProv: TwwDataSource
    DataSet = cdsProv
    Left = 177
    Top = 326
  end
  object cdsRComp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRComp'
    ValidateWithMask = True
    Left = 206
    Top = 268
  end
  object cdsDRComp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDRComp'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 208
    Top = 268
  end
  object dsArticulo: TwwDataSource
    DataSet = cdsArticulo
    Left = 491
    Top = 162
  end
  object dsQry3: TwwDataSource
    DataSet = cdsQry3
    Left = 163
    Top = 499
  end
  object dsQry4: TwwDataSource
    DataSet = cdsQry4
    Left = 207
    Top = 499
  end
  object cdsCanjes: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCanjes'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 346
    Top = 326
  end
  object cdsDetCanje: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetCanje'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 466
    Top = 326
  end
  object cdsMovCxC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovCxC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 531
    Top = 326
  end
  object dsCanjes: TwwDataSource
    DataSet = cdsCanjes
    Left = 354
    Top = 326
  end
  object dsDetCanje: TwwDataSource
    DataSet = cdsDetCanje
    Left = 474
    Top = 326
  end
  object dsMovCxC: TwwDataSource
    DataSet = cdsMovCxC
    Left = 539
    Top = 326
  end
  object cdsLetras: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLetras'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 587
    Top = 326
  end
  object dsLetras: TwwDataSource
    DataSet = cdsLetras
    Left = 595
    Top = 326
  end
  object cdsCCanje: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCCanje'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 403
    Top = 326
  end
  object dsCCanje: TwwDataSource
    DataSet = cdsCCanje
    Left = 411
    Top = 326
  end
  object cdsCuota: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCuota'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 120
    Top = 326
  end
  object dsCuota: TwwDataSource
    DataSet = cdsCuota
    Left = 128
    Top = 326
  end
  object cdsReporte: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReporte'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 423
    Top = 162
  end
  object dsReporte: TwwDataSource
    DataSet = cdsReporte
    Left = 431
    Top = 162
  end
  object cdsTransf: TwwClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 220
    Top = 326
  end
  object dsTransf: TwwDataSource
    DataSet = cdsTransf
    Left = 228
    Top = 326
  end
  object cdsDetTransf: TwwClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 282
    Top = 326
  end
  object dsDetTransf: TwwDataSource
    DataSet = cdsDetTransf
    Left = 290
    Top = 326
  end
  object cdsMovIS: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovIS'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 140
    Top = 211
  end
  object dsMovIS: TwwDataSource
    DataSet = cdsMovIS
    Left = 147
    Top = 211
  end
  object cdsHPedido: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHPedido'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 545
    Top = 162
  end
  object dsHPedido: TwwDataSource
    DataSet = cdsHPedido
    Left = 553
    Top = 162
  end
  object cdsQry5: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 244
    Top = 499
  end
  object dsQry5: TwwDataSource
    DataSet = cdsQry5
    Left = 253
    Top = 499
  end
  object cdsResultSet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 23
    Top = 211
  end
  object cdsDeltaSet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 21
    Top = 268
  end
  object dsDeltaSet: TwwDataSource
    DataSet = cdsDeltaSet
    Left = 30
    Top = 268
  end
  object dsDiasGracia: TwwDataSource
    DataSet = cdsDiasGracia
    Left = 347
    Top = 268
  end
  object cdsDiasGracia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 347
    Top = 268
  end
  object cdsQry6: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 291
    Top = 499
  end
  object dsQry6: TwwDataSource
    DataSet = cdsQry6
    Left = 300
    Top = 499
  end
  object cdsQry7: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 337
    Top = 499
  end
  object dsQry7: TwwDataSource
    DataSet = cdsQry7
    Left = 346
    Top = 499
  end
  object dsTLPrecio: TwwDataSource
    Left = 87
    Top = 268
  end
  object cdsTLPrecio: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTLPrecio'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 87
    Top = 268
  end
  object dsCabPed: TwwDataSource
    DataSet = cdsCabPed
    Left = 626
    Top = 58
  end
  object dsDetPed: TwwDataSource
    DataSet = cdsDetPed
    Left = 688
    Top = 58
  end
  object cdsCabPed: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCabPed'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 626
    Top = 58
  end
  object cdsDetPed: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetPed'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 688
    Top = 58
  end
  object cdsProforma: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProforma'
    RemoteServer = DCOM1
    OnReconcileError = cdsProformaReconcileError
    ValidateWithMask = True
    Left = 476
    Top = 268
  end
  object dsProforma: TwwDataSource
    DataSet = cdsProforma
    Left = 485
    Top = 268
  end
  object dsDetProf: TwwDataSource
    DataSet = cdsDetProf
    Left = 361
    Top = 384
  end
  object cdsDetProf: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetProf'
    RemoteServer = DCOM1
    OnReconcileError = cdsDetProfReconcileError
    ValidateWithMask = True
    Left = 361
    Top = 384
  end
  object cdsAsocia: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 100
    Params = <>
    ProviderName = 'prvAsocia'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 16
    Top = 384
  end
  object dsAsocia: TwwDataSource
    DataSet = cdsAsocia
    Left = 24
    Top = 384
  end
  object cdsTClie: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTClie'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 71
    Top = 384
  end
  object dsTClie: TwwDataSource
    DataSet = cdsTClie
    Left = 79
    Top = 384
  end
  object cdsTipSol: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipSol'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 125
    Top = 384
  end
  object dsTipSol: TwwDataSource
    DataSet = cdsTipSol
    Left = 133
    Top = 384
  end
  object cdsDetFactObs2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetFactSObs'
    RemoteServer = DCOM1
    OnReconcileError = cdsDetFactObs2ReconcileError
    ValidateWithMask = True
    Left = 198
    Top = 384
  end
  object dsDetFactObs2: TwwDataSource
    DataSet = cdsDetFactObs2
    Left = 206
    Top = 384
  end
  object cdsDetProfObs2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetProfObs2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 286
    Top = 384
  end
  object dsDetProfObs2: TwwDataSource
    DataSet = cdsDetProfObs2
    Left = 294
    Top = 384
  end
  object dsQry: TwwDataSource
    DataSet = cdsQry
    Left = 25
    Top = 499
  end
  object cdsKDXSerie: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvKDXSerie'
    RemoteServer = DCOM1
    OnReconcileError = cdsKDXSerieReconcileError
    ControlType.Strings = (
      'ENTREGADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 274
    Top = 268
  end
  object dsKDXSerie: TwwDataSource
    DataSet = cdsKDXSerie
    Left = 283
    Top = 268
  end
  object cdsSerieG: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSerie'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 419
    Top = 384
  end
  object cdsVinculo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVinculo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 475
    Top = 384
  end
  object dsVinculo: TwwDataSource
    DataSet = cdsVinculo
    Left = 483
    Top = 384
  end
  object cdsGiro: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGiro'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 529
    Top = 384
  end
  object dsGiro: TwwDataSource
    DataSet = cdsGiro
    Left = 537
    Top = 384
  end
  object cdsClasif: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClasif'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 576
    Top = 384
  end
  object dsClasif: TwwDataSource
    DataSet = cdsClasif
    Left = 584
    Top = 384
  end
  object cdsSitClie: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSitClie'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 630
    Top = 384
  end
  object dsSitClie: TwwDataSource
    DataSet = cdsSitClie
    Left = 638
    Top = 384
  end
  object cdsPais: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPais'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 679
    Top = 384
  end
  object dsPais: TwwDataSource
    DataSet = cdsPais
    Left = 687
    Top = 384
  end
  object cdsDpto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDpto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 725
    Top = 441
  end
  object dsDpto: TwwDataSource
    DataSet = cdsDpto
    Left = 734
    Top = 441
  end
  object cdsZona: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvZona'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 534
    Top = 268
  end
  object dsZona: TwwDataSource
    DataSet = cdsZona
    Left = 543
    Top = 268
  end
  object cdsDistrito: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDistrito'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 588
    Top = 268
  end
  object dsDistrito: TwwDataSource
    DataSet = cdsDistrito
    Left = 597
    Top = 268
  end
  object dsProvinc: TwwDataSource
    DataSet = cdsProvinc
    Left = 415
    Top = 268
  end
  object cdsProvinc: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProvinc'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 414
    Top = 268
  end
  object cdsZona1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvZona1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 16
    Top = 441
  end
  object dsZona1: TwwDataSource
    DataSet = cdsZona1
    Left = 26
    Top = 441
  end
  object cdsVende: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVende'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 69
    Top = 441
  end
  object dsVende: TwwDataSource
    DataSet = cdsVende
    Left = 78
    Top = 441
  end
  object cdsCondP: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCondP'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 124
    Top = 441
  end
  object dsCondP: TwwDataSource
    DataSet = cdsCondP
    Left = 133
    Top = 441
  end
  object cdsSecEco: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSecEco'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 181
    Top = 441
  end
  object dsSecEco: TwwDataSource
    DataSet = cdsSecEco
    Left = 190
    Top = 441
  end
  object cdsCIUU: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCIUU'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 236
    Top = 441
  end
  object dsCIUU: TwwDataSource
    DataSet = cdsCIUU
    Left = 245
    Top = 441
  end
  object cdsCargos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCargos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 288
    Top = 441
  end
  object dsCargos: TwwDataSource
    DataSet = cdsCargos
    Left = 297
    Top = 441
  end
  object cdsTipBien: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipBien'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 345
    Top = 441
  end
  object dsTipBien: TwwDataSource
    DataSet = cdsTipBien
    Left = 354
    Top = 441
  end
  object cdsClAux: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClAux'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 400
    Top = 441
  end
  object dsClAux: TwwDataSource
    DataSet = cdsClAux
    Left = 409
    Top = 441
  end
  object cdsTipPer: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipPer'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 452
    Top = 441
  end
  object dsTipPer: TwwDataSource
    DataSet = cdsTipPer
    Left = 461
    Top = 441
  end
  object cdsLineaCredito: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLineaCredito'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 520
    Top = 441
  end
  object dsLineaCredito: TwwDataSource
    DataSet = cdsLineaCredito
    Left = 529
    Top = 441
  end
  object cdsMiemEmpre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMiemEmpre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 600
    Top = 441
  end
  object dsMiemEmpre: TwwDataSource
    DataSet = cdsMiemEmpre
    Left = 609
    Top = 441
  end
  object cdsBienes: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBienes'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 731
    Top = 384
  end
  object dsBienes: TwwDataSource
    DataSet = cdsBienes
    Left = 739
    Top = 384
  end
  object dsClieComent: TwwDataSource
    Left = 654
    Top = 268
  end
  object cdsClieComent: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 654
    Top = 268
  end
  object cdsUser: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUsers'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 716
    Top = 268
  end
  object dsUser: TwwDataSource
    DataSet = cdsUser
    Left = 725
    Top = 268
  end
  object cdsQry8: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 383
    Top = 499
  end
  object dsQry8: TwwDataSource
    DataSet = cdsQry8
    Left = 392
    Top = 499
  end
  object cdsQry9: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 430
    Top = 499
  end
  object dsQry9: TwwDataSource
    DataSet = cdsQry9
    Left = 439
    Top = 499
  end
  object cdsQry10: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 478
    Top = 499
  end
  object dsQry10: TwwDataSource
    DataSet = cdsQry10
    Left = 487
    Top = 499
  end
  object cdsQry11: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 529
    Top = 499
  end
  object dsQry11: TwwDataSource
    DataSet = cdsQry11
    Left = 538
    Top = 499
  end
  object cdsQry12: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 578
    Top = 499
  end
  object dsQry12: TwwDataSource
    DataSet = cdsQry12
    Left = 587
    Top = 499
  end
  object cdsQry13: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 629
    Top = 499
  end
  object dsQry13: TwwDataSource
    DataSet = cdsQry13
    Left = 638
    Top = 499
  end
  object cdsLC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 677
    Top = 499
  end
  object dsLC: TwwDataSource
    DataSet = cdsLC
    Left = 686
    Top = 499
  end
  object dsTReg: TDataSource
    DataSet = cdsTReg
    Left = 320
    Top = 162
  end
  object cdsRepo2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 738
    Top = 326
  end
  object dsRepo2: TwwDataSource
    DataSet = cdsRepo2
    Left = 741
    Top = 326
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 738
    Top = 7
  end
  object ExcelBook: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 745
    Top = 58
  end
  object WS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 745
    Top = 110
  end
  object dsQry14: TwwDataSource
    DataSet = cdsQry14
    Left = 20
    Top = 564
  end
  object cdsQry14: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 20
    Top = 550
  end
  object dsQry15: TwwDataSource
    DataSet = cdsQry15
    Left = 76
    Top = 564
  end
  object cdsQry15: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 77
    Top = 550
  end
  object dsQry16: TwwDataSource
    DataSet = cdsQry16
    Left = 137
    Top = 564
  end
  object cdsQry16: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 136
    Top = 550
  end
  object cdsRepo3: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 324
    Top = 550
  end
  object dsRepo3: TwwDataSource
    DataSet = cdsRepo3
    Left = 327
    Top = 564
  end
  object cdsQry17: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 385
    Top = 550
  end
  object dsQry17: TwwDataSource
    DataSet = cdsQry17
    Left = 389
    Top = 564
  end
  object dsQryDet: TwwDataSource
    DataSet = cdsQryDet
    Left = 504
    Top = 564
  end
  object cdsQryDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 504
    Top = 550
  end
  object cdsAlmVar: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 196
    Top = 550
  end
  object dsAlmVar: TwwDataSource
    DataSet = cdsAlmVar
    Left = 198
    Top = 564
  end
  object DCOM1: TSocketConnection
    ServerGUID = '{EBAED2C9-F9F6-4E21-B628-01F9269BF0ED}'
    ServerName = 'DMFACSrv.srvDMFAC'
    Left = 13
    Top = 5
  end
  object cdsQry18: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 258
    Top = 550
  end
  object dsQry18: TwwDataSource
    DataSet = cdsQry18
    Left = 261
    Top = 564
  end
  object cdsQry20: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 443
    Top = 550
  end
  object dsQry20: TwwDataSource
    DataSet = cdsQry20
    Left = 446
    Top = 564
  end
  object dsTienda: TwwDataSource
    DataSet = cdsTienda
    Left = 569
    Top = 564
  end
  object cdsTienda: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 567
    Top = 550
  end
  object dsMarca: TwwDataSource
    DataSet = cdsMarca
    Left = 633
    Top = 564
  end
  object cdsMarca: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 631
    Top = 550
  end
  object cdsTDocSunat: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 100
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 691
    Top = 562
  end
  object dsTDocSunat: TwwDataSource
    DataSet = cdsTDocSunat
    Left = 707
    Top = 562
  end
end
