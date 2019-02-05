object FGrafico_V1: TFGrafico_V1
  Left = 286
  Top = 199
  Width = 900
  Height = 620
  Caption = 'FGrafico_V1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBChart1: TDBChart
    Left = 20
    Top = 160
    Width = 851
    Height = 394
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TDBChart')
    TabOrder = 0
    object Series1: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = dsRep
      SeriesColor = clRed
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object DBGrid1: TDBGrid
    Left = 88
    Top = 8
    Width = 761
    Height = 145
    DataSource = dsRep
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object SQLC1: TSQLConnection
    ConnectionName = 'OracleConnection'
    DriverName = 'Oracle'
    GetDriverFunc = 'getSQLDriverORACLE'
    LibraryName = 'dbexpora.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Oracle'
      'DataBase=test'
      'User_Name=DB2ADMIN'
      'Password=LIDER'
      'RowsetSize=20'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Oracle TransIsolation=ReadCommited'
      'OS Authentication=False'
      'Multiple Transaction=False'
      'Trim Char=False')
    VendorLib = 'oci.dll'
    Connected = True
    Left = 424
    Top = 18
  end
  object qryGraf: TSQLDataSet
    CommandText = 
      'select FACFECHA,  sum(FACTOTMN) FACTOTMN   from (  SELECT A.CIAI' +
      'D, A.FACFECHA, CASE WHEN A.FACESTADO <> '#39'ACEPTADO'#39' THEN 0 ELSE A' +
      '.FACTOTMN END FACTOTMN, CASE WHEN A.FACESTADO <> '#39'ACEPTADO'#39' THEN' +
      ' 0 ELSE A.FACMTOMN END FACMTOMN, NVL(T.TIE_ID, A.ALMID) TIE_ID, ' +
      ' NVL(T.TIE_DES, D.ALMDES) TIE_DES FROM FAC305 A, TGE180 B, TGE11' +
      '0 C, TGE151 D, FAC_TIENDA T WHERE A.CIAID = '#39'04'#39' AND A.FACFECHA ' +
      '>= '#39'01-05-2012'#39' AND A.FACFECHA <= '#39'25-05-2012'#39' and A.FACESTADO i' +
      'n ('#39'ACEPTADO'#39') AND A.CIAID = B.CIAID AND A.FPAGOID = B.CCOMERID ' +
      'AND A.DOCID = C.DOCID AND C.DOCMOD = '#39'CXC'#39' AND A.CIAID = D.CIAID' +
      '(+) AND A.LOCID = D.LOCID(+) AND A.TINID = D.TINID(+) AND A.ALMI' +
      'D = D.ALMID(+) AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(' +
      '+) AND T.TIE_ID LIKE '#39'%'#39' AND T.TIE_ID LIKE '#39'%'#39' ) VISTA GROUP BY ' +
      'CIAID, TIE_ID, TIE_DES, FACFECHA ORDER BY CIAID, TIE_ID, FACFECH' +
      'A'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLC1
    Left = 456
    Top = 18
  end
  object dspGraf: TDataSetProvider
    DataSet = qryGraf
    ResolveToDataSet = True
    Left = 488
    Top = 16
  end
  object cdsRep: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGraf'
    Left = 536
    Top = 16
  end
  object dsRep: TDataSource
    DataSet = cdsRep
    Left = 584
    Top = 24
  end
end
