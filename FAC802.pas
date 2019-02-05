unit FAC802;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, wwdblook, ppEndUsr,
  ppBands, ppCache, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DB, ppCtrls, ppVar, ppPrnabl, ppParameter, Mask, wwdbedit,
  Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, DBGrids;

type
  TFVentaPorArticulo = class(TForm)
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Rango: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    bbtnRep2: TBitBtn;
    ppdb1: TppDBPipeline;
    ppr1: TppReport;
    ppd1: TppDesigner;
    ppParameterList1: TppParameterList;
    ppHeaderBand2: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppDBText12: TppDBText;
    ppLabel18: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc2: TppDBCalc;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    gbOpciones: TGroupBox;
    dtpInicio: TwwDBDateTimePicker;
    dtpFin: TwwDBDateTimePicker;
    Label4: TLabel;
    dblcAlmacen: TwwDBLookupCombo;
    edtAlmacen: TEdit;
    gbArticulo: TGroupBox;
    Label34: TLabel;
    dblcdServicio: TwwDBLookupComboDlg;
    dbeServicios: TwwDBEdit;
    dbgArticulos: TwwDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    dblcLinCom: TwwDBLookupCombo;
    dbeLinCom: TEdit;
    bbtnCantTie: TBitBtn;
    Label7: TLabel;
    dblcTienda: TwwDBLookupCombo;
    edtTienda: TEdit;
    bbtnImpTie: TBitBtn;
    bbtnCantGen: TBitBtn;
    bbtnImpGen: TBitBtn;
    bbtnExcelDV: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    dtgData: TDBGrid;
    bbtnMarTie: TBitBtn;
    bbtnMarGen: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    cbDiseno: TCheckBox;
    procedure bbtnRep2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTInvEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcdServicioExit(Sender: TObject);
    procedure dblcdServicioEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure dblcAlmacenEnter(Sender: TObject);
    procedure dblcLinComEnter(Sender: TObject);
    procedure dblcAlmacenExit(Sender: TObject);
    procedure dblcLinComNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcAlmacenNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcLinComExit(Sender: TObject);
    procedure bbtnCantTieClick(Sender: TObject);
    procedure bbtnImpTieClick(Sender: TObject);
    procedure bbtnCantGenClick(Sender: TObject);
    procedure bbtnImpGenClick(Sender: TObject);
    procedure bbtnExcelDVClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure bbtnMarTieClick(Sender: TObject);
    procedure bbtnMarGenClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVentaPorArticulo: TFVentaPorArticulo;

implementation

{$R *.dfm}

uses FacDM, oaVE3000;

procedure TFVentaPorArticulo.bbtnRep2Click(Sender: TObject);
var
   x10: integer;
   xSQL, cWhereArticulo, cWhereLinComer : String;
begin
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   end;

   if dtpInicio.date=0 then
   begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   end;

   if dtpFin.date=0 then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   end;

   if dtpFin.date<dtpInicio.date then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   end;

	 Screen.Cursor:=crHourGlass;

   cWhereArticulo:='';
   DMFAC.cdsQry13.First;
   while not DMFAC.cdsQry13.Eof do
   begin
      cWhereArticulo:=cWhereArticulo+''''+DMFAC.cdsQry13.FieldByName('ARTID').AsString+''', ';
      DMFAC.cdsQry13.Next;
   end;

   if cWhereArticulo<>'' then
   begin
      cWhereArticulo:=Copy(cWhereArticulo,1,Length(cWhereArticulo)-2);
      cWhereArticulo:=' AND A.ARTID IN ( '+cWhereArticulo+' ) ';
   end;

   xSQL:='SELECT B.CIAID, B.LOCID, B.TINID, B.ALMID, A.GRARID, A.FAMID, A.SFAMID, '
        +  'A.ARTID, A.ARTDES, A.DFACCANTG, A.TMONID, A.DFACMTOMO, A.UNMIDG, '
        +  'B.FACSERIE, B.NFAC, B.FACFECHA, B.FACUSER, B.CLIEID, B.CLIEDES, '
        +  'C.DOCABR DOCDES, D.CIADES, E.LOCDES, F.TINDES, G.ALMDES, H.GRARDES, '
        +  'I.FAMDES, J.SFAMDES, K.TMONABR, '
        +  'ROUND( ROUND(NVL(A.DFACVTOTMO,0)*CASE WHEN A.TMONID=''D'' THEN B.FACTCAM ELSE 1 END,2) / A.DFACCANTG,3) PU, '
        +  'ROUND(NVL(A.DFACVTOTMO,0)*CASE WHEN A.TMONID=''D'' THEN B.FACTCAM ELSE 1 END, 2 ) PT '
        +'FROM FAC306 A, FAC305 B, TGE110 C, TGE101 D, TGE126 E, TGE152 F, TGE151 G, '
        +     'TGE131 H, TGE169 I, TGE170 J, TGE103 K '
        +'WHERE A.CIAID=B.CIAID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
        //+ ' and A.TINID='+quotedstr(dblcTInv.text)
        + ' AND B.CIAID='+QuotedStr(dblcCia.text)
        + ' AND B.FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''''+')'
        + ' AND B.FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)+''''+')'
        + ' AND B.FACESTADO=''ACEPTADO'' AND B.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
        + ' and A.ALMID like '''+dblcAlmacen.text+'%'' '
        +   cWhereArticulo
//        +   cWhereLinComer
        + ' AND (A.CIAID=D.CIAID(+)) ' // Compañía
        + ' AND (A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+)) ' // Localidad
        + ' AND (A.CIAID=F.CIAID(+) AND A.TINID=F.CIAID(+)) ' // Tipo de Inventario
        + ' AND (A.CIAID=G.CIAID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+)) ' // Almacén
        + ' AND (A.CIAID=H.CIAID(+) AND A.TINID=H.TINID(+) AND A.GRARID=H.GRARID(+)) ' // Línea
        + ' AND (A.CIAID=I.CIAID(+) AND A.TINID=I.TINID(+) AND A.GRARID=I.GRARID(+) '
        + ' AND A.FAMID=I.FAMID(+)) ' // Familia
        + ' AND (A.CIAID=J.CIAID(+) AND A.TINID=J.TINID(+) AND A.GRARID=J.GRARID(+) '
        + ' AND A.FAMID=J.FAMID(+) AND A.SFAMID=J.SFAMID(+)) ' // SubFamilia
        + ' AND (A.TMONID=K.TMONID(+)) ' // Moneda
        +'ORDER BY A.ARTID, B.FACFECHA, B.DOCID, B.FACSERIE, B.NFAC ';

        // SE AÑADIO LA LINEA COMERCIAL
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   ppdb1.DataSource:=DMFAC.dsQry3;
   ppr1.DataPipeline:=ppdb1;
   ppr1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\VentadeArticulos.rtm' ;
   ppr1.template.LoadFromFile;

	 Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
      ppd1.showmodal
   else
      ppr1.Print;


   x10:=Self.ComponentCount-1;
   while x10>=0 do
   begin
      if Self.Components[ x10 ].ClassName='TppGroup' then
      begin
         Self.Components[ x10 ].Free ;
      end;
      x10:=x10-1;
   end;
end;

procedure TFVentaPorArticulo.FormCreate(Sender: TObject);
var
   xSQL : String;
begin

  dblcCia.LookupTable      := DMFAC.cdsCia;
  dblcdServicio.LookupTable:= DMFAC.cdsVende;
  dblcAlmacen.LookupTable  := DMFAC.cdsAlmacen;
  dblcLinCom.LookupTable   := DMFAC.cdsLC;
  dbgArticulos.DataSource  := DMFAC.dsQry13;

  dblcCia.Enabled:=True;
  if DMFAC.cdsCia.RecordCount=1 then
     dblcCia.Enabled:=False;
  dblcCia.Text :=DMFAC.cdsCia.FieldByName('CIAID').AsString;
  edtCia.Text  :=DMFAC.cdsCia.FieldByName('CIADES').AsString;
  dtpInicio.Date:=Date;
  dtpFin.Date   :=Date;

  xSQL:='Select ARTID, ARTDES FROM TGE205 WHERE CIAID=''ZZ'' AND ARTID=''ZXCASD''';
  DMFAC.cdsQry13.Close;
  DMFAC.cdsQry13.DataRequest( xSQL );
  DMFAC.cdsQry13.Open;
end;

procedure TFVentaPorArticulo.dblcCiaExit(Sender: TObject);
var
   xSQL : String;
begin
   if DMFAC.cdsCia.IndexFieldNames<>'CIAID' then
      DMFAC.cdsCia.IndexFieldNames:='CIAID';
   DMFAC.cdsCia.SetKey;
   DMFAC.cdsCia.FieldByName('CIAID').AsString:=dblcCia.Text;
   if not DMFAC.cdsCia.GotoKey then
   begin
      ShowMessage('Compañía No encontrada en Relación, Reintente!');
      dblcCia.SetFocus;
      exit;
   end;

  xSQL:='Select CIAID, ARTID, ARTDES from TGE205 where CIAID='''+dblcCia.Text+'''';
  DMFAC.cdsVende.Close;
  DMFAC.cdsVende.DataRequest( xSQL );
  DMFAC.cdsVende.Open;
end;

procedure TFVentaPorArticulo.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFVentaPorArticulo.dblcTInvEnter(Sender: TObject);
var
  xSQL : String;
begin
  if edtCia.Text='' then dblcCia.SetFocus;

// Tipo de Inventario
   xSQL:='SELECT * FROM TGE152 WHERE CIAID='+QuotedStr(dblcCia.Text)+' and TINVENTAS=''S'' ';
   DMFAC.cdsTInven.close;
   DMFAC.cdsTInven.DataRequest( xSQL );
   DMFAC.cdsTInven.open;
end;

procedure TFVentaPorArticulo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMFAC.cdsQry12.IndexFieldNames:='';
end;

procedure TFVentaPorArticulo.dblcdServicioExit(Sender: TObject);
var
   xWhere : String;
begin
	xWhere:='CIAID='+quotedstr(dblcCIA.Text)
         +' AND ARTID='+quotedstr(dblcdServicio.Text);
  dbeServicios.Text:=DMFAC.BuscaQry('dspUltTGE','TGE205','ARTDES', xWhere, 'ARTDES');
end;

procedure TFVentaPorArticulo.dblcdServicioEnter(Sender: TObject);
var
  xSQL : String;
begin
  if DMFAC.cdsVende.active then Exit;

  xSQL:='Select CIAID, ARTID, ARTDES from TGE205 where CIAID='''+dblcCia.Text+'''';
  DMFAC.cdsVende.Close;
  DMFAC.cdsVende.DataRequest( xSQL );
  DMFAC.cdsVende.Open;
end;

procedure TFVentaPorArticulo.BitBtn1Click(Sender: TObject);
begin
  DMFAC.cdsQry13.Append;
  DMFAC.cdsQry13.FieldByName('ARTID').AsString :=dblcdServicio.Text;
  DMFAC.cdsQry13.FieldByName('ARTDES').AsString:=dbeServicios.Text;
  DMFAC.cdsQry13.Post;
end;

procedure TFVentaPorArticulo.BitBtn2Click(Sender: TObject);
begin
  DMFAC.cdsQry13.Delete;
end;

procedure TFVentaPorArticulo.BitBtn3Click(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='Select ARTID, ARTDES FROM TGE205 WHERE CIAID=''ZZ'' AND ARTID=''ZXCASD''';
  DMFAC.cdsQry13.Close;
  DMFAC.cdsQry13.DataRequest( xSQL );
  DMFAC.cdsQry13.Open;
end;

procedure TFVentaPorArticulo.dblcAlmacenEnter(Sender: TObject);
begin
  if edtCia.Text ='' then dblcCia.SetFocus;

   DMFAC.FiltraTabla(DMFAC.cdsAlmacen,'TGE151', 'ALMID',
       'CIAID='+quotedstr(dblcCia.Text)+' and ALMVTA=''S'' ');
end;

procedure TFVentaPorArticulo.dblcLinComEnter(Sender: TObject);
begin
   DMFAC.FiltraTabla(DMFAC.cdsLC,'ALM_LIN_COM', 'LINCOM');
end;

procedure TFVentaPorArticulo.dblcAlmacenExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'CIAID='+QuotedStr(dblcCia.text)+' AND ALMID='+QuotedStr(dblcAlmacen.Text);
   edtAlmacen.Text:= DMFAC.BuscaQry('dspUltTGE','TGE151','ALMDES',xWhere,'ALMDES');
end;

procedure TFVentaPorArticulo.dblcLinComNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFVentaPorArticulo.dblcAlmacenNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFVentaPorArticulo.dblcLinComExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'LINCOM='+QuotedStr(dblcLinCom.text);
   dbeLinCom.Text:= DMFAC.BuscaQry('dspUltTGE','ALM_LIN_COM','LINCOMDES',xWhere,'LINCOMDES');
end;

procedure TFVentaPorArticulo.bbtnCantTieClick(Sender: TObject);
var
   x10: integer;
   xSQL, cWhereArticulo, cWhereLinComer : String;
   sDesde, sHasta : String;
begin
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   end;

   if dtpInicio.date=0 then
   begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   end;

   if dtpFin.date=0 then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   end;

   if dtpFin.date<dtpInicio.date then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   end;

	 Screen.Cursor:=crHourGlass;

   cWhereArticulo:='';
   DMFAC.cdsQry13.First;
   while not DMFAC.cdsQry13.Eof do
   begin
      cWhereArticulo:=cWhereArticulo+''''+DMFAC.cdsQry13.FieldByName('ARTID').AsString+''', ';
      DMFAC.cdsQry13.Next;
   end;

   if cWhereArticulo<>'' then
   begin
      cWhereArticulo:=Copy(cWhereArticulo,1,Length(cWhereArticulo)-2);
      cWhereArticulo:=' AND A.ARTID IN ( '+cWhereArticulo+' ) ';
   end;


   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpInicio.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpFin.DateTime));

   xSQL:='SELECT * FROM ( '
        +'SELECT CIAID, CIADES, TIE_ID, TIE_DES, ARTID, ARTDES, ALMID, ALMDES, RANGOF, MARCA, MARDES, '
//        +   'SUM( DFACCANTG) CANTIDAD, SUM((DFACVTOTMN)) TOTAL_VENTA, '
        +   'SUM( DFACCANTG) CANTIDAD,   SUM((DFACMTOMN)) TOTAL_VENTA, '
//        +   '10000-SUM( DFACCANTG) ORDEN_CAN, 10000000-SUM((DFACVTOTMN)) ORDEN_TOT FROM ( '
        +   '10000-SUM( DFACCANTG) ORDEN_CAN, 10000000-SUM((DFACMTOMN)) ORDEN_TOT FROM ( '
        +'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACTOTMN  END FACTOTMN, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACMTOMN  END FACMTOMN, '
        +  'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
        +  'A.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
//        +  'X.DFACCANTG, X.ARTID, X.DFACVTOTMN, X.ARTDES, M.MARCA, ZZ.MARDES '
        +  'X.DFACCANTG, X.ARTID, X.DFACMTOMN, X.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM FAC305 A, FAC306 X, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)
        + ' AND A.FACFECHA >= ' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
        + ' and A.ALMID like '''+dblcAlmacen.text+'%'' and A.FACESTADO in (''ACEPTADO'') '
        + ' and A.CIAID=X.CIAID(+) AND A.DOCID=X.DOCID(+) AND A.FACSERIE=X.FACSERIE(+) AND A.NFAC=X.NFAC(+) '
        + ' AND A.CIAID = B.CIAID AND A.FPAGOID = B.CCOMERID  AND A.DOCID = C.DOCID  AND C.DOCMOD = ''CXC'' '
        + ' AND A.CIAID = D.CIAID(+) AND A.LOCID = D.LOCID(+) AND A.TINID = D.TINID(+) AND A.ALMID = D.ALMID(+) '
        + ' AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'UNION ALL '
        +'SELECT A.CIAID, A.CCSERIE, A.CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN ''ACEPTADO'' WHEN A.CCESTADO = ''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCMTOLOC, 0) ELSE 0 END * -1 FACTOTMN, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCGRAVAD, 0) + NVL(A.CCNOGRAV, 0) ELSE 0 END * -1 FACMTOMN, '
        +  'A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES,  S.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, S.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
//        +  'DFACCANTG*(-1) CANT, F.ARTID, F.DFACVTOTMN*(-1) TOTAL, F.ARTDES, M.MARCA, ZZ.MARDES '
        +  'DFACCANTG*(-1) CANT, F.ARTID, F.DFACMTOMN*(-1) TOTAL, F.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM CXC301 A, TGE110 C, LOG314 S, LOG315 X, TGE151 D, FAC_TIENDA T, CXC304 Z, FAC306 F, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)+' AND A.DOCID = ''27'' '
        + ' AND A.CCFCMPRB >= ' + sDesde + ' AND A.CCFCMPRB<=' + sHasta + ' '
        +  'AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
        +  'AND A.CIAID = S.CIAID  AND A.CCPEDIDO = S.NISAID(+)  AND S.NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) AND S.TRIID=''15'' '
        +  'AND S.NISAFREG BETWEEN CCFCMPRB - 15 AND CCFCMPRB + 1  AND S.NISSIT = ''ACEPTADO'' '
        +  'AND S.CIAID=X.CIAID(+) AND S.TINID=X.TINID(+) AND S.ALMID=X.ALMID(+) AND S.NISATIP=X.NISATIP(+) AND S.NISAID=X.NISAID(+) '
        +  'AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
        +  'AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) and T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        +  'AND A.CIAID=Z.CIAID(+) AND A.TCANJEID=Z.TCANJEID(+) AND A.CCCANJE=Z.CCCANJE(+) '
        +  'AND Z.CIAID=F.CIAID(+) AND Z.DOCID=F.DOCID(+) AND Z.CCSERIE=FACSERIE(+) AND Z.CCNODOC=F.NFAC(+) AND X.ARTID=F.ARTID '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'ORDER BY TIE_ID, ARTID, FACFECHA, DFACCANTG DESC '
        +' ) A '
        +'group by CIAID, CIADES, TIE_ID, TIE_DES, MARCA, MARDES, ARTID, ARTDES, ALMID, ALMDES, RANGOF '
        +' ) B '
        +'order by CIAID, TIE_ID, ORDEN_CAN';


        // SE AÑADIO LA LINEA COMERCIAL
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := 'TIE_ID;ORDEN_CAN';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   ppdb1.DataSource:=DMFAC.dsQry3;
   ppr1.DataPipeline:=ppdb1;
   ppr1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\VentadeArticulosResumen.rtm' ;
   ppr1.template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
      ppd1.showmodal
   else
      ppr1.Print;

   DMFAC.cdsQry3.IndexFieldNames := '';

   x10:=Self.ComponentCount-1;
   while x10>=0 do
   begin
      if Self.Components[ x10 ].ClassName='TppGroup' then
      begin
         Self.Components[ x10 ].Free ;
      end;
      x10:=x10-1;
   end;
end;

procedure TFVentaPorArticulo.bbtnImpTieClick(Sender: TObject);
var
   x10: integer;
   xSQL, cWhereArticulo, cWhereLinComer : String;
   sDesde, sHasta : String;
begin
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   end;

   if dtpInicio.date=0 then
   begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   end;

   if dtpFin.date=0 then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   end;

   if dtpFin.date<dtpInicio.date then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   end;

	 Screen.Cursor:=crHourGlass;

   cWhereArticulo:='';
   DMFAC.cdsQry13.First;
   while not DMFAC.cdsQry13.Eof do
   begin
      cWhereArticulo:=cWhereArticulo+''''+DMFAC.cdsQry13.FieldByName('ARTID').AsString+''', ';
      DMFAC.cdsQry13.Next;
   end;

   if cWhereArticulo<>'' then
   begin
      cWhereArticulo:=Copy(cWhereArticulo,1,Length(cWhereArticulo)-2);
      cWhereArticulo:=' AND A.ARTID IN ( '+cWhereArticulo+' ) ';
   end;


   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpInicio.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpFin.DateTime));

   xSQL:='SELECT * FROM ( '
        +'SELECT CIAID, CIADES, TIE_ID, TIE_DES, ARTID, ARTDES, ALMID, ALMDES, RANGOF, MARCA, MARDES, '
        +   'SUM( DFACCANTG) CANTIDAD, SUM(DFACVTOTMN) TOTAL_VENTA, '
        +   '10000-SUM( DFACCANTG) ORDEN_CAN, 10000000-SUM(DFACVTOTMN) ORDEN_TOT FROM ( '
        +'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACTOTMN  END FACTOTMN, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACMTOMN  END FACMTOMN, '
        +  'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
        +  'A.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'X.DFACCANTG, X.ARTID, X.DFACVTOTMN, X.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM FAC305 A, FAC306 X, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)
        + ' AND A.FACFECHA >= ' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
        + ' and A.ALMID like '''+dblcAlmacen.text+'%'' and A.FACESTADO in (''ACEPTADO'') '
        + ' and A.CIAID=X.CIAID(+) AND A.DOCID=X.DOCID(+) AND A.FACSERIE=X.FACSERIE(+) AND A.NFAC=X.NFAC(+) '
        + ' AND A.CIAID = B.CIAID AND A.FPAGOID = B.CCOMERID  AND A.DOCID = C.DOCID  AND C.DOCMOD = ''CXC'' '
        + ' AND A.CIAID = D.CIAID(+) AND A.LOCID = D.LOCID(+) AND A.TINID = D.TINID(+) AND A.ALMID = D.ALMID(+) '
        + ' AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'UNION ALL '
        +'SELECT A.CIAID, A.CCSERIE, A.CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN ''ACEPTADO'' WHEN A.CCESTADO = ''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCMTOLOC, 0) ELSE 0 END * -1 FACTOTMN, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCGRAVAD, 0) + NVL(A.CCNOGRAV, 0) ELSE 0 END * -1 FACMTOMN, '
        +  'A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES,  S.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, S.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'DFACCANTG*(-1) CANT, F.ARTID, F.DFACVTOTMN*(-1) TOTAL, F.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM CXC301 A, TGE110 C, LOG314 S, LOG315 X, TGE151 D, FAC_TIENDA T, CXC304 Z, FAC306 F, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)+' AND A.DOCID = ''27'' '
        + ' AND A.CCFCMPRB >= ' + sDesde + ' AND A.CCFCMPRB<=' + sHasta + ' '
        +  'AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
        +  'AND A.CIAID = S.CIAID  AND A.CCPEDIDO = S.NISAID(+)  AND S.NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) AND S.TRIID=''15'' '
        +  'AND S.NISAFREG BETWEEN CCFCMPRB - 15 AND CCFCMPRB + 1  AND S.NISSIT = ''ACEPTADO'' '
        +  'AND S.CIAID=X.CIAID(+) AND S.TINID=X.TINID(+) AND S.ALMID=X.ALMID(+) AND S.NISATIP=X.NISATIP(+) AND S.NISAID=X.NISAID(+) '
        +  'AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
        +  'AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) and T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        +  'AND A.CIAID=Z.CIAID(+) AND A.TCANJEID=Z.TCANJEID(+) AND A.CCCANJE=Z.CCCANJE(+) '
        +  'AND Z.CIAID=F.CIAID(+) AND Z.DOCID=F.DOCID(+) AND Z.CCSERIE=FACSERIE(+) AND Z.CCNODOC=F.NFAC(+) AND X.ARTID=F.ARTID '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'ORDER BY TIE_ID, ARTID, FACFECHA, DFACCANTG DESC '
        +' ) A '
        +'group by CIAID, CIADES, TIE_ID, TIE_DES, MARCA, MARDES, ARTID, ARTDES, ALMID, ALMDES, RANGOF '
        +' ) B '
        +'order by CIAID, TIE_ID, ORDEN_TOT';


        // SE AÑADIO LA LINEA COMERCIAL
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := 'TIE_ID;ORDEN_TOT';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   ppdb1.DataSource:=DMFAC.dsQry3;
   ppr1.DataPipeline:=ppdb1;
   ppr1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\VentadeArticulosRes_tot.rtm' ;
   ppr1.template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
      ppd1.showmodal
   else
      ppr1.Print;

   DMFAC.cdsQry3.IndexFieldNames := '';

   x10:=Self.ComponentCount-1;
   while x10>=0 do
   begin
      if Self.Components[ x10 ].ClassName='TppGroup' then
      begin
         Self.Components[ x10 ].Free ;
      end;
      x10:=x10-1;
   end;
end;

procedure TFVentaPorArticulo.bbtnCantGenClick(Sender: TObject);
var
   x10: integer;
   xSQL, cWhereArticulo, cWhereLinComer : String;
   sDesde, sHasta : String;
begin
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   end;

   if dtpInicio.date=0 then
   begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   end;

   if dtpFin.date=0 then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   end;

   if dtpFin.date<dtpInicio.date then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   end;

	 Screen.Cursor:=crHourGlass;

   cWhereArticulo:='';
   DMFAC.cdsQry13.First;
   while not DMFAC.cdsQry13.Eof do
   begin
      cWhereArticulo:=cWhereArticulo+''''+DMFAC.cdsQry13.FieldByName('ARTID').AsString+''', ';
      DMFAC.cdsQry13.Next;
   end;

   if cWhereArticulo<>'' then
   begin
      cWhereArticulo:=Copy(cWhereArticulo,1,Length(cWhereArticulo)-2);
      cWhereArticulo:=' AND A.ARTID IN ( '+cWhereArticulo+' ) ';
   end;


   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpInicio.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpFin.DateTime));

   xSQL:='SELECT * FROM ( '
        +'SELECT CIAID, CIADES, ARTID, ARTDES, RANGOF, MARCA, MARDES, '
        +   'SUM( DFACCANTG) CANTIDAD, SUM(DFACVTOTMN) TOTAL_VENTA, '
        +   '10000-SUM( DFACCANTG) ORDEN_CAN, 10000000-SUM(DFACVTOTMN) ORDEN_TOT FROM ( '
        +'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACTOTMN  END FACTOTMN, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACMTOMN  END FACMTOMN, '
        +  'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
        +  'A.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'X.DFACCANTG, X.ARTID, X.DFACVTOTMN, X.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM FAC305 A, FAC306 X, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)
        + ' AND A.FACFECHA >= ' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
        + ' and A.ALMID like '''+dblcAlmacen.text+'%'' and A.FACESTADO in (''ACEPTADO'') '
        + ' and A.CIAID=X.CIAID(+) AND A.DOCID=X.DOCID(+) AND A.FACSERIE=X.FACSERIE(+) AND A.NFAC=X.NFAC(+) '
        + ' AND A.CIAID = B.CIAID AND A.FPAGOID = B.CCOMERID  AND A.DOCID = C.DOCID  AND C.DOCMOD = ''CXC'' '
        + ' AND A.CIAID = D.CIAID(+) AND A.LOCID = D.LOCID(+) AND A.TINID = D.TINID(+) AND A.ALMID = D.ALMID(+) '
        + ' AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'UNION ALL '
        +'SELECT A.CIAID, A.CCSERIE, A.CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN ''ACEPTADO'' WHEN A.CCESTADO = ''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCMTOLOC, 0) ELSE 0 END * -1 FACTOTMN, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCGRAVAD, 0) + NVL(A.CCNOGRAV, 0) ELSE 0 END * -1 FACMTOMN, '
        +  'A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES,  S.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, S.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'DFACCANTG*(-1) CANT, F.ARTID, F.DFACVTOTMN*(-1) TOTAL, F.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM CXC301 A, TGE110 C, LOG314 S, LOG315 X, TGE151 D, FAC_TIENDA T, CXC304 Z, FAC306 F, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)+' AND A.DOCID = ''27'' '
        + ' AND A.CCFCMPRB >= ' + sDesde + ' AND A.CCFCMPRB<=' + sHasta + ' '
        +  'AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
        +  'AND A.CIAID = S.CIAID  AND A.CCPEDIDO = S.NISAID(+)  AND S.NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) AND S.TRIID=''15'' '
        +  'AND S.NISAFREG BETWEEN CCFCMPRB - 15 AND CCFCMPRB + 1  AND S.NISSIT = ''ACEPTADO'' '
        +  'AND S.CIAID=X.CIAID(+) AND S.TINID=X.TINID(+) AND S.ALMID=X.ALMID(+) AND S.NISATIP=X.NISATIP(+) AND S.NISAID=X.NISAID(+) '
        +  'AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
        +  'AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) and T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        +  'AND A.CIAID=Z.CIAID(+) AND A.TCANJEID=Z.TCANJEID(+) AND A.CCCANJE=Z.CCCANJE(+) '
        +  'AND Z.CIAID=F.CIAID(+) AND Z.DOCID=F.DOCID(+) AND Z.CCSERIE=FACSERIE(+) AND Z.CCNODOC=F.NFAC(+) AND X.ARTID=F.ARTID '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'ORDER BY TIE_ID, ARTID, FACFECHA, DFACCANTG DESC '
        +' ) A '
        +'group by CIAID, CIADES, ARTID, ARTDES, RANGOF, MARCA, MARDES '
        +' ) B '
        +'order by CIAID, ORDEN_CAN';


        // SE AÑADIO LA LINEA COMERCIAL
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := 'ORDEN_CAN';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   ppdb1.DataSource:=DMFAC.dsQry3;
   ppr1.DataPipeline:=ppdb1;
   ppr1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\VentadeArticulosResumen_Gen.rtm' ;
   ppr1.template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
      ppd1.showmodal
   else
      ppr1.Print;

   DMFAC.cdsQry3.IndexFieldNames := '';

   x10:=Self.ComponentCount-1;
   while x10>=0 do
   begin
      if Self.Components[ x10 ].ClassName='TppGroup' then
      begin
         Self.Components[ x10 ].Free ;
      end;
      x10:=x10-1;
   end;
end;

procedure TFVentaPorArticulo.bbtnImpGenClick(Sender: TObject);
var
   x10: integer;
   xSQL, cWhereArticulo, cWhereLinComer : String;
   sDesde, sHasta : String;
begin
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   end;

   if dtpInicio.date=0 then
   begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   end;

   if dtpFin.date=0 then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   end;

   if dtpFin.date<dtpInicio.date then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   end;

	 Screen.Cursor:=crHourGlass;

   cWhereArticulo:='';
   DMFAC.cdsQry13.First;
   while not DMFAC.cdsQry13.Eof do
   begin
      cWhereArticulo:=cWhereArticulo+''''+DMFAC.cdsQry13.FieldByName('ARTID').AsString+''', ';
      DMFAC.cdsQry13.Next;
   end;

   if cWhereArticulo<>'' then
   begin
      cWhereArticulo:=Copy(cWhereArticulo,1,Length(cWhereArticulo)-2);
      cWhereArticulo:=' AND A.ARTID IN ( '+cWhereArticulo+' ) ';
   end;


   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpInicio.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpFin.DateTime));

   xSQL:='SELECT * FROM ( '
        +'SELECT CIAID, CIADES, ARTID, ARTDES, RANGOF, MARCA, MARDES, '
        +   'SUM( DFACCANTG) CANTIDAD, SUM(DFACVTOTMN) TOTAL_VENTA, '
        +   '10000-SUM( DFACCANTG) ORDEN_CAN, 10000000-SUM(DFACVTOTMN) ORDEN_TOT FROM ( '
        +'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACTOTMN  END FACTOTMN, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACMTOMN  END FACMTOMN, '
        +  'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
        +  'A.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'X.DFACCANTG, X.ARTID, X.DFACVTOTMN, X.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM FAC305 A, FAC306 X, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)
        + ' AND A.FACFECHA >= ' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
        + ' and A.ALMID like '''+dblcAlmacen.text+'%'' and A.FACESTADO in (''ACEPTADO'') '
        + ' and A.CIAID=X.CIAID(+) AND A.DOCID=X.DOCID(+) AND A.FACSERIE=X.FACSERIE(+) AND A.NFAC=X.NFAC(+) '
        + ' AND A.CIAID = B.CIAID AND A.FPAGOID = B.CCOMERID  AND A.DOCID = C.DOCID  AND C.DOCMOD = ''CXC'' '
        + ' AND A.CIAID = D.CIAID(+) AND A.LOCID = D.LOCID(+) AND A.TINID = D.TINID(+) AND A.ALMID = D.ALMID(+) '
        + ' AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'UNION ALL '
        +'SELECT A.CIAID, A.CCSERIE, A.CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN ''ACEPTADO'' WHEN A.CCESTADO = ''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCMTOLOC, 0) ELSE 0 END * -1 FACTOTMN, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCGRAVAD, 0) + NVL(A.CCNOGRAV, 0) ELSE 0 END * -1 FACMTOMN, '
        +  'A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES,  S.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, S.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'DFACCANTG*(-1) CANT, F.ARTID, F.DFACVTOTMN*(-1) TOTAL, F.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM CXC301 A, TGE110 C, LOG314 S, LOG315 X, TGE151 D, FAC_TIENDA T, CXC304 Z, FAC306 F, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)+' AND A.DOCID = ''27'' '
        + ' AND A.CCFCMPRB >= ' + sDesde + ' AND A.CCFCMPRB<=' + sHasta + ' '
        +  'AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
        +  'AND A.CIAID = S.CIAID  AND A.CCPEDIDO = S.NISAID(+)  AND S.NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) AND S.TRIID=''15'' '
        +  'AND S.NISAFREG BETWEEN CCFCMPRB - 15 AND CCFCMPRB + 1  AND S.NISSIT = ''ACEPTADO'' '
        +  'AND S.CIAID=X.CIAID(+) AND S.TINID=X.TINID(+) AND S.ALMID=X.ALMID(+) AND S.NISATIP=X.NISATIP(+) AND S.NISAID=X.NISAID(+) '
        +  'AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
        +  'AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) and T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        +  'AND A.CIAID=Z.CIAID(+) AND A.TCANJEID=Z.TCANJEID(+) AND A.CCCANJE=Z.CCCANJE(+) '
        +  'AND Z.CIAID=F.CIAID(+) AND Z.DOCID=F.DOCID(+) AND Z.CCSERIE=FACSERIE(+) AND Z.CCNODOC=F.NFAC(+) AND X.ARTID=F.ARTID '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'ORDER BY TIE_ID, ARTID, FACFECHA, DFACCANTG DESC '
        +' ) A '
        +'group by CIAID, CIADES, ARTID, ARTDES, RANGOF, MARCA, MARDES '
        +' ) B '
        +'order by CIAID, ORDEN_TOT';


        // SE AÑADIO LA LINEA COMERCIAL
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := 'ORDEN_TOT';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   ppdb1.DataSource:=DMFAC.dsQry3;
   ppr1.DataPipeline:=ppdb1;
   ppr1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\VentadeArticulosRes_tot_gen.rtm' ;
   ppr1.template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
      ppd1.showmodal
   else
      ppr1.Print;

   DMFAC.cdsQry3.IndexFieldNames := '';

   x10:=Self.ComponentCount-1;
   while x10>=0 do
   begin
      if Self.Components[ x10 ].ClassName='TppGroup' then
      begin
         Self.Components[ x10 ].Free ;
      end;
      x10:=x10-1;
   end;
end;


procedure TFVentaPorArticulo.bbtnExcelDVClick(Sender: TObject);
var
   x10: integer;
   xSQL, cWhereArticulo, cWhereLinComer : String;
   sDesde, sHasta : String;
begin
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   end;

   if dtpInicio.date=0 then
   begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   end;

   if dtpFin.date=0 then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   end;

   if dtpFin.date<dtpInicio.date then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   end;

   Screen.Cursor:=crHourGlass;

   cWhereArticulo:='';
   DMFAC.cdsQry13.First;
   while not DMFAC.cdsQry13.Eof do
   begin
      cWhereArticulo:=cWhereArticulo+''''+DMFAC.cdsQry13.FieldByName('ARTID').AsString+''', ';
      DMFAC.cdsQry13.Next;
   end;

   if cWhereArticulo<>'' then
   begin
      cWhereArticulo:=Copy(cWhereArticulo,1,Length(cWhereArticulo)-2);
      cWhereArticulo:=' AND A.ARTID IN ( '+cWhereArticulo+' ) ';
   end;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpInicio.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpFin.DateTime));

   xSQL:='SELECT * FROM ( '
        +'SELECT CIAID, CIADES, TIE_ID, TIE_DES, ARTID, ARTDES, ALMID, ALMDES, RANGOF, MARCA, MARDES, '
        +   'SUM( DFACCANTG) CANTIDAD, SUM(DFACVTOTMN) TOTAL_VENTA, '
        +   '10000-SUM( DFACCANTG) ORDEN_CAN, 10000000-SUM(DFACVTOTMN) ORDEN_TOT FROM ( '
        +'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACTOTMN  END FACTOTMN, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACMTOMN  END FACMTOMN, '
        +  'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
        +  'A.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'X.DFACCANTG, X.ARTID, X.DFACVTOTMN, X.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM FAC305 A, FAC306 X, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)
        + ' AND A.FACFECHA >= ' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
        + ' and A.ALMID like '''+dblcAlmacen.text+'%'' and A.FACESTADO in (''ACEPTADO'') '
        + ' and A.CIAID=X.CIAID(+) AND A.DOCID=X.DOCID(+) AND A.FACSERIE=X.FACSERIE(+) AND A.NFAC=X.NFAC(+) '
        + ' AND A.CIAID = B.CIAID AND A.FPAGOID = B.CCOMERID  AND A.DOCID = C.DOCID  AND C.DOCMOD = ''CXC'' '
        + ' AND A.CIAID = D.CIAID(+) AND A.LOCID = D.LOCID(+) AND A.TINID = D.TINID(+) AND A.ALMID = D.ALMID(+) '
        + ' AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'UNION ALL '
        +'SELECT A.CIAID, A.CCSERIE, A.CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN ''ACEPTADO'' WHEN A.CCESTADO = ''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCMTOLOC, 0) ELSE 0 END * -1 FACTOTMN, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCGRAVAD, 0) + NVL(A.CCNOGRAV, 0) ELSE 0 END * -1 FACMTOMN, '
        +  'A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES,  S.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, S.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'DFACCANTG*(-1) CANT, F.ARTID, F.DFACVTOTMN*(-1) TOTAL, F.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM CXC301 A, TGE110 C, LOG314 S, LOG315 X, TGE151 D, FAC_TIENDA T, CXC304 Z, FAC306 F, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)+' AND A.DOCID = ''27'' '
        + ' AND A.CCFCMPRB >= ' + sDesde + ' AND A.CCFCMPRB<=' + sHasta + ' '
        +  'AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
        +  'AND A.CIAID = S.CIAID  AND A.CCPEDIDO = S.NISAID(+)  AND S.NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) AND S.TRIID=''15'' '
        +  'AND S.NISAFREG BETWEEN CCFCMPRB - 15 AND CCFCMPRB + 1  AND S.NISSIT = ''ACEPTADO'' '
        +  'AND S.CIAID=X.CIAID(+) AND S.TINID=X.TINID(+) AND S.ALMID=X.ALMID(+) AND S.NISATIP=X.NISATIP(+) AND S.NISAID=X.NISAID(+) '
        +  'AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
        +  'AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) and T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        +  'AND A.CIAID=Z.CIAID(+) AND A.TCANJEID=Z.TCANJEID(+) AND A.CCCANJE=Z.CCCANJE(+) '
        +  'AND Z.CIAID=F.CIAID(+) AND Z.DOCID=F.DOCID(+) AND Z.CCSERIE=FACSERIE(+) AND Z.CCNODOC=F.NFAC(+) AND X.ARTID=F.ARTID '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'ORDER BY TIE_ID, ARTID, FACFECHA, DFACCANTG DESC '
        +' ) A '
        +'group by CIAID, CIADES, TIE_ID, TIE_DES, MARCA, MARDES, ARTID, ARTDES, ALMID, ALMDES, RANGOF '
        +' ) B '
        +'order by CIAID, TIE_ID, ORDEN_CAN';


        // SE AÑADIO LA LINEA COMERCIAL
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := 'TIE_ID;ORDEN_CAN';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   dtgData.DataSource:=DMFAC.dsQry3;

   try
      DMFAC.HojaExcel('Ranking x Cantidad x Tienda',DMFAC.dsQry3, dtgData);
   except
      on Ex: Exception do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   end;
end;

procedure TFVentaPorArticulo.BitBtn8Click(Sender: TObject);
var
   x10: integer;
   xSQL, cWhereArticulo, cWhereLinComer : String;
   sDesde, sHasta : String;
begin
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   end;

   if dtpInicio.date=0 then
   begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   end;

   if dtpFin.date=0 then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   end;

   if dtpFin.date<dtpInicio.date then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   end;

	 Screen.Cursor:=crHourGlass;

   cWhereArticulo:='';
   DMFAC.cdsQry13.First;
   while not DMFAC.cdsQry13.Eof do
   begin
      cWhereArticulo:=cWhereArticulo+''''+DMFAC.cdsQry13.FieldByName('ARTID').AsString+''', ';
      DMFAC.cdsQry13.Next;
   end;

   if cWhereArticulo<>'' then
   begin
      cWhereArticulo:=Copy(cWhereArticulo,1,Length(cWhereArticulo)-2);
      cWhereArticulo:=' AND A.ARTID IN ( '+cWhereArticulo+' ) ';
   end;


   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpInicio.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpFin.DateTime));

   xSQL:='SELECT * FROM ( '
        +'SELECT CIAID, CIADES, ARTID, ARTDES, RANGOF, MARCA, MARDES, '
        +   'SUM( DFACCANTG) CANTIDAD, SUM(DFACVTOTMN) TOTAL_VENTA, '
        +   '10000-SUM( DFACCANTG) ORDEN_CAN, 10000000-SUM(DFACVTOTMN) ORDEN_TOT FROM ( '
        +'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACTOTMN  END FACTOTMN, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACMTOMN  END FACMTOMN, '
        +  'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
        +  'A.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'X.DFACCANTG, X.ARTID, X.DFACVTOTMN, X.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM FAC305 A, FAC306 X, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)
        + ' AND A.FACFECHA >= ' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
        + ' and A.ALMID like '''+dblcAlmacen.text+'%'' and A.FACESTADO in (''ACEPTADO'') '
        + ' and A.CIAID=X.CIAID(+) AND A.DOCID=X.DOCID(+) AND A.FACSERIE=X.FACSERIE(+) AND A.NFAC=X.NFAC(+) '
        + ' AND A.CIAID = B.CIAID AND A.FPAGOID = B.CCOMERID  AND A.DOCID = C.DOCID  AND C.DOCMOD = ''CXC'' '
        + ' AND A.CIAID = D.CIAID(+) AND A.LOCID = D.LOCID(+) AND A.TINID = D.TINID(+) AND A.ALMID = D.ALMID(+) '
        + ' AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'UNION ALL '
        +'SELECT A.CIAID, A.CCSERIE, A.CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN ''ACEPTADO'' WHEN A.CCESTADO = ''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCMTOLOC, 0) ELSE 0 END * -1 FACTOTMN, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCGRAVAD, 0) + NVL(A.CCNOGRAV, 0) ELSE 0 END * -1 FACMTOMN, '
        +  'A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES,  S.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, S.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'DFACCANTG*(-1) CANT, F.ARTID, F.DFACVTOTMN*(-1) TOTAL, F.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM CXC301 A, TGE110 C, LOG314 S, LOG315 X, TGE151 D, FAC_TIENDA T, CXC304 Z, FAC306 F, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)+' AND A.DOCID = ''27'' '
        + ' AND A.CCFCMPRB >= ' + sDesde + ' AND A.CCFCMPRB<=' + sHasta + ' '
        +  'AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
        +  'AND A.CIAID = S.CIAID  AND A.CCPEDIDO = S.NISAID(+)  AND S.NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) AND S.TRIID=''15'' '
        +  'AND S.NISAFREG BETWEEN CCFCMPRB - 15 AND CCFCMPRB + 1  AND S.NISSIT = ''ACEPTADO'' '
        +  'AND S.CIAID=X.CIAID(+) AND S.TINID=X.TINID(+) AND S.ALMID=X.ALMID(+) AND S.NISATIP=X.NISATIP(+) AND S.NISAID=X.NISAID(+) '
        +  'AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
        +  'AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) and T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        +  'AND A.CIAID=Z.CIAID(+) AND A.TCANJEID=Z.TCANJEID(+) AND A.CCCANJE=Z.CCCANJE(+) '
        +  'AND Z.CIAID=F.CIAID(+) AND Z.DOCID=F.DOCID(+) AND Z.CCSERIE=FACSERIE(+) AND Z.CCNODOC=F.NFAC(+) AND X.ARTID=F.ARTID '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'ORDER BY TIE_ID, ARTID, FACFECHA, DFACCANTG DESC '
        +' ) A '
        +'group by CIAID, CIADES, ARTID, ARTDES, RANGOF, MARCA, MARDES '
        +' ) B '
        +'order by CIAID, ORDEN_CAN';


   // SE AÑADIO LA LINEA COMERCIAL
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := 'ORDEN_CAN';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   dtgData.DataSource:=DMFAC.dsQry3;

   try
      DMFAC.HojaExcel('Ranking x Cantidad x General',DMFAC.dsQry3, dtgData);
   except
      on Ex: Exception do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   end;
end;

procedure TFVentaPorArticulo.BitBtn9Click(Sender: TObject);
var
   x10: integer;
   xSQL, cWhereArticulo, cWhereLinComer : String;
   sDesde, sHasta : String;
begin
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   end;

   if dtpInicio.date=0 then
   begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   end;

   if dtpFin.date=0 then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   end;

   if dtpFin.date<dtpInicio.date then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   end;

	 Screen.Cursor:=crHourGlass;

   cWhereArticulo:='';
   DMFAC.cdsQry13.First;
   while not DMFAC.cdsQry13.Eof do
   begin
      cWhereArticulo:=cWhereArticulo+''''+DMFAC.cdsQry13.FieldByName('ARTID').AsString+''', ';
      DMFAC.cdsQry13.Next;
   end;

   if cWhereArticulo<>'' then
   begin
      cWhereArticulo:=Copy(cWhereArticulo,1,Length(cWhereArticulo)-2);
      cWhereArticulo:=' AND A.ARTID IN ( '+cWhereArticulo+' ) ';
   end;


   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpInicio.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpFin.DateTime));

   xSQL:='SELECT * FROM ( '
        +'SELECT CIAID, CIADES, TIE_ID, TIE_DES, ARTID, ARTDES, ALMID, ALMDES, RANGOF, MARCA, MARDES, '
        +   'SUM( DFACCANTG) CANTIDAD, SUM(DFACVTOTMN) TOTAL_VENTA, '
        +   '10000-SUM( DFACCANTG) ORDEN_CAN, 10000000-SUM(DFACVTOTMN) ORDEN_TOT FROM ( '
        +'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACTOTMN  END FACTOTMN, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACMTOMN  END FACMTOMN, '
        +  'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
        +  'A.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'X.DFACCANTG, X.ARTID, X.DFACVTOTMN, X.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM FAC305 A, FAC306 X, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)
        + ' AND A.FACFECHA >= ' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
        + ' and A.ALMID like '''+dblcAlmacen.text+'%'' and A.FACESTADO in (''ACEPTADO'') '
        + ' and A.CIAID=X.CIAID(+) AND A.DOCID=X.DOCID(+) AND A.FACSERIE=X.FACSERIE(+) AND A.NFAC=X.NFAC(+) '
        + ' AND A.CIAID = B.CIAID AND A.FPAGOID = B.CCOMERID  AND A.DOCID = C.DOCID  AND C.DOCMOD = ''CXC'' '
        + ' AND A.CIAID = D.CIAID(+) AND A.LOCID = D.LOCID(+) AND A.TINID = D.TINID(+) AND A.ALMID = D.ALMID(+) '
        + ' AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'UNION ALL '
        +'SELECT A.CIAID, A.CCSERIE, A.CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN ''ACEPTADO'' WHEN A.CCESTADO = ''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCMTOLOC, 0) ELSE 0 END * -1 FACTOTMN, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCGRAVAD, 0) + NVL(A.CCNOGRAV, 0) ELSE 0 END * -1 FACMTOMN, '
        +  'A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES,  S.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, S.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'DFACCANTG*(-1) CANT, F.ARTID, F.DFACVTOTMN*(-1) TOTAL, F.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM CXC301 A, TGE110 C, LOG314 S, LOG315 X, TGE151 D, FAC_TIENDA T, CXC304 Z, FAC306 F, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)+' AND A.DOCID = ''27'' '
        + ' AND A.CCFCMPRB >= ' + sDesde + ' AND A.CCFCMPRB<=' + sHasta + ' '
        +  'AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
        +  'AND A.CIAID = S.CIAID  AND A.CCPEDIDO = S.NISAID(+)  AND S.NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) AND S.TRIID=''15'' '
        +  'AND S.NISAFREG BETWEEN CCFCMPRB - 15 AND CCFCMPRB + 1  AND S.NISSIT = ''ACEPTADO'' '
        +  'AND S.CIAID=X.CIAID(+) AND S.TINID=X.TINID(+) AND S.ALMID=X.ALMID(+) AND S.NISATIP=X.NISATIP(+) AND S.NISAID=X.NISAID(+) '
        +  'AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
        +  'AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) and T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        +  'AND A.CIAID=Z.CIAID(+) AND A.TCANJEID=Z.TCANJEID(+) AND A.CCCANJE=Z.CCCANJE(+) '
        +  'AND Z.CIAID=F.CIAID(+) AND Z.DOCID=F.DOCID(+) AND Z.CCSERIE=FACSERIE(+) AND Z.CCNODOC=F.NFAC(+) AND X.ARTID=F.ARTID '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'ORDER BY TIE_ID, ARTID, FACFECHA, DFACCANTG DESC '
        +' ) A '
        +'group by CIAID, CIADES, TIE_ID, TIE_DES, MARCA, MARDES, ARTID, ARTDES, ALMID, ALMDES, RANGOF '
        +' ) B '
        +'order by CIAID, TIE_ID, ORDEN_TOT';


        // SE AÑADIO LA LINEA COMERCIAL
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := 'TIE_ID;ORDEN_TOT';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   dtgData.DataSource:=DMFAC.dsQry3;

   try
      DMFAC.HojaExcel('Ranking x Importe x Tienda',DMFAC.dsQry3, dtgData);
   except
      on Ex: Exception do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   end;
end;

procedure TFVentaPorArticulo.BitBtn10Click(Sender: TObject);
var
   x10: integer;
   xSQL, cWhereArticulo, cWhereLinComer : String;
   sDesde, sHasta : String;
begin
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   end;

   if dtpInicio.date=0 then
   begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   end;

   if dtpFin.date=0 then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   end;

   if dtpFin.date<dtpInicio.date then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   end;

	 Screen.Cursor:=crHourGlass;

   cWhereArticulo:='';
   DMFAC.cdsQry13.First;
   while not DMFAC.cdsQry13.Eof do
   begin
      cWhereArticulo:=cWhereArticulo+''''+DMFAC.cdsQry13.FieldByName('ARTID').AsString+''', ';
      DMFAC.cdsQry13.Next;
   end;

   if cWhereArticulo<>'' then
   begin
      cWhereArticulo:=Copy(cWhereArticulo,1,Length(cWhereArticulo)-2);
      cWhereArticulo:=' AND A.ARTID IN ( '+cWhereArticulo+' ) ';
   end;


   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpInicio.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpFin.DateTime));

   xSQL:='SELECT * FROM ( '
        +'SELECT CIAID, CIADES, ARTID, ARTDES, RANGOF, MARCA, MARDES, '
        +   'SUM( DFACCANTG) CANTIDAD, SUM(DFACVTOTMN) TOTAL_VENTA, '
        +   '10000-SUM( DFACCANTG) ORDEN_CAN, 10000000-SUM(DFACVTOTMN) ORDEN_TOT FROM ( '
        +'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACTOTMN  END FACTOTMN, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACMTOMN  END FACMTOMN, '
        +  'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
        +  'A.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'X.DFACCANTG, X.ARTID, X.DFACVTOTMN, X.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM FAC305 A, FAC306 X, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)
        + ' AND A.FACFECHA >= ' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
        + ' and A.ALMID like '''+dblcAlmacen.text+'%'' and A.FACESTADO in (''ACEPTADO'') '
        + ' and A.CIAID=X.CIAID(+) AND A.DOCID=X.DOCID(+) AND A.FACSERIE=X.FACSERIE(+) AND A.NFAC=X.NFAC(+) '
        + ' AND A.CIAID = B.CIAID AND A.FPAGOID = B.CCOMERID  AND A.DOCID = C.DOCID  AND C.DOCMOD = ''CXC'' '
        + ' AND A.CIAID = D.CIAID(+) AND A.LOCID = D.LOCID(+) AND A.TINID = D.TINID(+) AND A.ALMID = D.ALMID(+) '
        + ' AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'UNION ALL '
        +'SELECT A.CIAID, A.CCSERIE, A.CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN ''ACEPTADO'' WHEN A.CCESTADO = ''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCMTOLOC, 0) ELSE 0 END * -1 FACTOTMN, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCGRAVAD, 0) + NVL(A.CCNOGRAV, 0) ELSE 0 END * -1 FACMTOMN, '
        +  'A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES,  S.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, S.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'DFACCANTG*(-1) CANT, F.ARTID, F.DFACVTOTMN*(-1) TOTAL, F.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM CXC301 A, TGE110 C, LOG314 S, LOG315 X, TGE151 D, FAC_TIENDA T, CXC304 Z, FAC306 F, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)+' AND A.DOCID = ''27'' '
        + ' AND A.CCFCMPRB >= ' + sDesde + ' AND A.CCFCMPRB<=' + sHasta + ' '
        +  'AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
        +  'AND A.CIAID = S.CIAID  AND A.CCPEDIDO = S.NISAID(+)  AND S.NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) AND S.TRIID=''15'' '
        +  'AND S.NISAFREG BETWEEN CCFCMPRB - 15 AND CCFCMPRB + 1  AND S.NISSIT = ''ACEPTADO'' '
        +  'AND S.CIAID=X.CIAID(+) AND S.TINID=X.TINID(+) AND S.ALMID=X.ALMID(+) AND S.NISATIP=X.NISATIP(+) AND S.NISAID=X.NISAID(+) '
        +  'AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
        +  'AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) and T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        +  'AND A.CIAID=Z.CIAID(+) AND A.TCANJEID=Z.TCANJEID(+) AND A.CCCANJE=Z.CCCANJE(+) '
        +  'AND Z.CIAID=F.CIAID(+) AND Z.DOCID=F.DOCID(+) AND Z.CCSERIE=FACSERIE(+) AND Z.CCNODOC=F.NFAC(+) AND X.ARTID=F.ARTID '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'ORDER BY TIE_ID, ARTID, FACFECHA, DFACCANTG DESC '
        +' ) A '
        +'group by CIAID, CIADES, ARTID, ARTDES, RANGOF, MARCA, MARDES '
        +' ) B '
        +'order by CIAID, ORDEN_TOT';


        // SE AÑADIO LA LINEA COMERCIAL
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := 'ORDEN_TOT';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   dtgData.DataSource:=DMFAC.dsQry3;

   try
      DMFAC.HojaExcel('Ranking x Importe x General',DMFAC.dsQry3, dtgData);
   except
      on Ex: Exception do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   end;
end;

procedure TFVentaPorArticulo.bbtnMarTieClick(Sender: TObject);
var
   x10: integer;
   xSQL, cWhereArticulo, cWhereLinComer : String;
   sDesde, sHasta : String;
begin
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   end;

   if dtpInicio.date=0 then
   begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   end;

   if dtpFin.date=0 then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   end;

   if dtpFin.date<dtpInicio.date then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   end;

	 Screen.Cursor:=crHourGlass;

   cWhereArticulo:='';
   DMFAC.cdsQry13.First;
   while not DMFAC.cdsQry13.Eof do
   begin
      cWhereArticulo:=cWhereArticulo+''''+DMFAC.cdsQry13.FieldByName('ARTID').AsString+''', ';
      DMFAC.cdsQry13.Next;
   end;

   if cWhereArticulo<>'' then
   begin
      cWhereArticulo:=Copy(cWhereArticulo,1,Length(cWhereArticulo)-2);
      cWhereArticulo:=' AND A.ARTID IN ( '+cWhereArticulo+' ) ';
   end;


   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpInicio.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpFin.DateTime));

   xSQL:='SELECT * FROM ( '
        +'SELECT CIAID, CIADES, TIE_ID, TIE_DES, ARTID, ARTDES, ALMID, ALMDES, RANGOF, MARCA, MARDES, '
        +   'SUM( DFACCANTG) CANTIDAD, SUM(DFACVTOTMN) TOTAL_VENTA, '
        +   '10000-SUM( DFACCANTG) ORDEN_CAN, 10000000-SUM(DFACVTOTMN) ORDEN_TOT FROM ( '
        +'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACTOTMN  END FACTOTMN, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACMTOMN  END FACMTOMN, '
        +  'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
        +  'A.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'X.DFACCANTG, X.ARTID, X.DFACVTOTMN, X.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM FAC305 A, FAC306 X, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)
        + ' AND A.FACFECHA >= ' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
        + ' and A.ALMID like '''+dblcAlmacen.text+'%'' and A.FACESTADO in (''ACEPTADO'') '
        + ' and A.CIAID=X.CIAID(+) AND A.DOCID=X.DOCID(+) AND A.FACSERIE=X.FACSERIE(+) AND A.NFAC=X.NFAC(+) '
        + ' AND A.CIAID = B.CIAID AND A.FPAGOID = B.CCOMERID  AND A.DOCID = C.DOCID  AND C.DOCMOD = ''CXC'' '
        + ' AND A.CIAID = D.CIAID(+) AND A.LOCID = D.LOCID(+) AND A.TINID = D.TINID(+) AND A.ALMID = D.ALMID(+) '
        + ' AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '

        +'UNION ALL '
        +'SELECT A.CIAID, A.CCSERIE, A.CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN ''ACEPTADO'' WHEN A.CCESTADO = ''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCMTOLOC, 0) ELSE 0 END * -1 FACTOTMN, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCGRAVAD, 0) + NVL(A.CCNOGRAV, 0) ELSE 0 END * -1 FACMTOMN, '
        +  'A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES,  S.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, S.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'DFACCANTG*(-1) CANT, F.ARTID, F.DFACVTOTMN*(-1) TOTAL, F.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM CXC301 A, TGE110 C, LOG314 S, LOG315 X, TGE151 D, FAC_TIENDA T, CXC304 Z, FAC306 F, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)+' AND A.DOCID = ''27'' '
        + ' AND A.CCFCMPRB >= ' + sDesde + ' AND A.CCFCMPRB<=' + sHasta + ' '
        +  'AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
        +  'AND A.CIAID = S.CIAID  AND A.CCPEDIDO = S.NISAID(+)  AND S.NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) AND S.TRIID=''15'' '
        +  'AND S.NISAFREG BETWEEN CCFCMPRB - 15 AND CCFCMPRB + 1  AND S.NISSIT = ''ACEPTADO'' '
        +  'AND S.CIAID=X.CIAID(+) AND S.TINID=X.TINID(+) AND S.ALMID=X.ALMID(+) AND S.NISATIP=X.NISATIP(+) AND S.NISAID=X.NISAID(+) '
        +  'AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
        +  'AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) and T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        +  'AND A.CIAID=Z.CIAID(+) AND A.TCANJEID=Z.TCANJEID(+) AND A.CCCANJE=Z.CCCANJE(+) '
        +  'AND Z.CIAID=F.CIAID(+) AND Z.DOCID=F.DOCID(+) AND Z.CCSERIE=FACSERIE(+) AND Z.CCNODOC=F.NFAC(+) AND X.ARTID=F.ARTID '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'ORDER BY TIE_ID, ARTID, FACFECHA, DFACCANTG DESC '
        +' ) A '
        +'group by CIAID, CIADES, TIE_ID, TIE_DES, MARCA, MARDES, ARTID, ARTDES, ALMID, ALMDES, RANGOF '
        +' ) B '
        +'order by CIAID, TIE_ID, MARDES, ORDEN_CAN';


        // SE AÑADIO LA LINEA COMERCIAL
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := 'TIE_ID;MARDES;ORDEN_CAN';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   ppdb1.DataSource:=DMFAC.dsQry3;
   ppr1.DataPipeline:=ppdb1;
   ppr1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\VentadeArticulosRes_Mar_Tie.rtm' ;
   ppr1.template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
      ppd1.showmodal
   else
      ppr1.Print;

   DMFAC.cdsQry3.IndexFieldNames := '';

   x10:=Self.ComponentCount-1;
   while x10>=0 do
   begin
      if Self.Components[ x10 ].ClassName='TppGroup' then
      begin
         Self.Components[ x10 ].Free ;
      end;
      x10:=x10-1;
   end;
end;

procedure TFVentaPorArticulo.bbtnMarGenClick(Sender: TObject);
var
   x10: integer;
   xSQL, cWhereArticulo, cWhereLinComer : String;
   sDesde, sHasta : String;
begin
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   end;

   if dtpInicio.date=0 then
   begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   end;

   if dtpFin.date=0 then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   end;

   if dtpFin.date<dtpInicio.date then
   begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   end;

	 Screen.Cursor:=crHourGlass;

   cWhereArticulo:='';
   DMFAC.cdsQry13.First;
   while not DMFAC.cdsQry13.Eof do
   begin
      cWhereArticulo:=cWhereArticulo+''''+DMFAC.cdsQry13.FieldByName('ARTID').AsString+''', ';
      DMFAC.cdsQry13.Next;
   end;

   if cWhereArticulo<>'' then
   begin
      cWhereArticulo:=Copy(cWhereArticulo,1,Length(cWhereArticulo)-2);
      cWhereArticulo:=' AND A.ARTID IN ( '+cWhereArticulo+' ) ';
   end;


   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpInicio.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpFin.DateTime));

   xSQL:='SELECT * FROM ( '
        +'SELECT CIAID, CIADES, ARTID, ARTDES, RANGOF, MARCA, MARDES, '
        +   'SUM( DFACCANTG) CANTIDAD, SUM(DFACVTOTMN) TOTAL_VENTA, '
        +   '10000-SUM( DFACCANTG) ORDEN_CAN, 10000000-SUM(DFACVTOTMN) ORDEN_TOT FROM ( '
        +'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACTOTMN  END FACTOTMN, '
        +  'CASE WHEN A.FACESTADO <> ''ACEPTADO'' THEN 0 ELSE A.FACMTOMN  END FACMTOMN, '
        +  'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
        +  'A.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'X.DFACCANTG, X.ARTID, X.DFACVTOTMN, X.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM FAC305 A, FAC306 X, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)
        + ' AND A.FACFECHA >= ' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
        + ' and A.ALMID like '''+dblcAlmacen.text+'%'' and A.FACESTADO in (''ACEPTADO'') '
        + ' and A.CIAID=X.CIAID(+) AND A.DOCID=X.DOCID(+) AND A.FACSERIE=X.FACSERIE(+) AND A.NFAC=X.NFAC(+) '
        + ' AND A.CIAID = B.CIAID AND A.FPAGOID = B.CCOMERID  AND A.DOCID = C.DOCID  AND C.DOCMOD = ''CXC'' '
        + ' AND A.CIAID = D.CIAID(+) AND A.LOCID = D.LOCID(+) AND A.TINID = D.TINID(+) AND A.ALMID = D.ALMID(+) '
        + ' AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'UNION ALL '
        +'SELECT A.CIAID, A.CCSERIE, A.CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN ''ACEPTADO'' WHEN A.CCESTADO = ''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCMTOLOC, 0) ELSE 0 END * -1 FACTOTMN, '
        +  'CASE WHEN A.CCESTADO IN (''P'', ''C'') THEN NVL(A.CCGRAVAD, 0) + NVL(A.CCNOGRAV, 0) ELSE 0 END * -1 FACMTOMN, '
        +  'A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES,  S.ALMID, D.ALMDES, '
        +  '''DEL '+datetoStr(dtpInicio.Date) + ' AL ' + datetoStr(dtpFin.Date)+ ''' RANGOF, '
        +  'NVL(T.TIE_ID, S.ALMID) TIE_ID, NVL(T.TIE_DES, D.ALMDES) TIE_DES, '
        +  'DFACCANTG*(-1) CANT, F.ARTID, F.DFACVTOTMN*(-1) TOTAL, F.ARTDES, M.MARCA, ZZ.MARDES '
        +'FROM CXC301 A, TGE110 C, LOG314 S, LOG315 X, TGE151 D, FAC_TIENDA T, CXC304 Z, FAC306 F, TGE205 M, ALM_MAR_ART ZZ '
        +'WHERE A.CIAID = '+ QuotedStr(dblcCia.Text)+' AND A.DOCID = ''27'' '
        + ' AND A.CCFCMPRB >= ' + sDesde + ' AND A.CCFCMPRB<=' + sHasta + ' '
        +  'AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
        +  'AND A.CIAID = S.CIAID  AND A.CCPEDIDO = S.NISAID(+)  AND S.NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) AND S.TRIID=''15'' '
        +  'AND S.NISAFREG BETWEEN CCFCMPRB - 15 AND CCFCMPRB + 1  AND S.NISSIT = ''ACEPTADO'' '
        +  'AND S.CIAID=X.CIAID(+) AND S.TINID=X.TINID(+) AND S.ALMID=X.ALMID(+) AND S.NISATIP=X.NISATIP(+) AND S.NISAID=X.NISAID(+) '
        +  'AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
        +  'AND D.CIAID = T.CIAID(+) AND D.TIE_ID = T.TIE_ID(+) and T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        +  'AND A.CIAID=Z.CIAID(+) AND A.TCANJEID=Z.TCANJEID(+) AND A.CCCANJE=Z.CCCANJE(+) '
        +  'AND Z.CIAID=F.CIAID(+) AND Z.DOCID=F.DOCID(+) AND Z.CCSERIE=FACSERIE(+) AND Z.CCNODOC=F.NFAC(+) AND X.ARTID=F.ARTID '
        + ' AND X.CIAID=M.CIAID(+) AND X.TINID=M.TINID(+) AND X.ARTID=M.ARTID(+) '
        + ' AND M.MARCA=ZZ.MARCA(+) '
        +'ORDER BY TIE_ID, ARTID, FACFECHA, DFACCANTG DESC '
        +' ) A '
        +'group by CIAID, CIADES, MARCA, MARDES, ARTID, ARTDES, RANGOF '
        +' ) B '
        +'order by CIAID, MARDES, ORDEN_TOT';


        // SE AÑADIO LA LINEA COMERCIAL
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := 'MARDES,ORDEN_TOT';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   ppdb1.DataSource:=DMFAC.dsQry3;
   ppr1.DataPipeline:=ppdb1;
   ppr1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\VentadeArticulosRes_Mar_Gen.rtm' ;
   ppr1.template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
      ppd1.showmodal
   else
      ppr1.Print;

   DMFAC.cdsQry3.IndexFieldNames := '';

   x10:=Self.ComponentCount-1;
   while x10>=0 do
   begin
      if Self.Components[ x10 ].ClassName='TppGroup' then
      begin
         Self.Components[ x10 ].Free ;
      end;
      x10:=x10-1;
   end;
end;

procedure TFVentaPorArticulo.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
    begin
      Key := #0;
      Perform(CM_DialogKey,VK_TAB,0);
    end;
end;

procedure TFVentaPorArticulo.FormShow(Sender: TObject);
begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));
end;

end.
