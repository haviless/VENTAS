unit Fac796;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, StdCtrls, Buttons, wwdblook, ExtCtrls, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppCtrls,
  ppVar, ppPrnabl, ppBands, Grids, Wwdbigrd, Wwdbgrid;

type
  TFToolComision = class(TForm)
    pnl: TPanel;
    Bevel1: TBevel;
    bvFechas: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    bbtnFiltrar: TBitBtn;
    dbdtpFecIni: TwwDBDateTimePicker;
    dbdtpFecFin: TwwDBDateTimePicker;
    BitBtn1: TBitBtn;
    ppDBComision: TppDBPipeline;
    pprRComision: TppReport;
    ppDBComisionDet: TppDBPipeline;
    pprRComisionDet: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel17: TppLabel;
    pplPeriodoDet: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    pplblUserDet: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppLabel22: TppLabel;
    ppDBText9: TppDBText;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel32: TppLabel;
    ppDBText17: TppDBText;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLine6: TppLine;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    pplPeriodo: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine1: TppLine;
    pplblUsuario: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel16: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLine3: TppLine;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel14: TppLabel;
    ppDBText1: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel15: TppLabel;
    ppDBText7: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppLine2: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    Timer1: TTimer;
    procedure bbtnFiltrarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   FToolComision: TFToolComision;
   xAccesoBotones : Boolean;

implementation

uses FacDM, oaVE3000;

{$R *.DFM}

procedure TFToolComision.bbtnFiltrarClick(Sender: TObject);
var
  sDesde,sHasta : string;
  xSQL,xMes,xAnoMM : string;
  Y,M,D :word;
begin
  if dbdtpFecIni.Date=0 then
    raise exception.Create('Falta Fecha de Inicio!!!');
  if dbdtpFecfin.Date=0 then
    raise exception.Create('Falta Fecha Final!!!');

  if (dbdtpFecIni.Date>dbdtpFecFin.Date) then
  begin
    dbdtpFecFin.Date := dbdtpFecIni.Date;
    dbdtpFecFin.setfocus;
    raise exception.Create('Error: Fecha Final debe ser mayor/igual'+#13+' a la Fecha de Inicio');
  end;

  if length(dblcTMon.Text)=0 then
    raise exception.Create('Seleccione Moneda');

  Screen.Cursor:=crHourGlass;

  sDesde := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dbdtpFecIni.Date) );
  sHasta := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dbdtpFecFin.Date) );
  Decodedate(dbdtpFecFin.Date,Y,M,D);
  xAnoMM:= IntToStr(Y)+xMes;
  ////COMISIONES RESUMIDAS DE FACT, BOLETAS
	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
    xSQL:='SELECT S.TVTADES, CFAC.VEID, V.VENOMBRES, '+
          'SUM( CASE WHEN DFAC.TMONID='+Quotedstr(dblcTMon.Text)+' THEN (COALESCE(ART.ARTCOMVTA,0)*COALESCE(DFACMTOMO,0))/100 ELSE '+
          'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' THEN (COALESCE(ART.ARTCOMVTA,0)*COALESCE(DFACMTOMO,0))/CFAC.FACTCAM/ 100 ELSE '+
          'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFACMTOMO,0)) *CFAC.FACTCAM/ 100 ELSE 0 END '+
          'END END)COMIBRUTA, '+
          'SUM(CASE WHEN DFAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND CFAC.FACESTADO=''ANULADO'' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFAC.DFACMTOMO,0))/100 ELSE '+
          'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+ ' AND CFAC.FACESTADO=''ANULADO'' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFAC.DFACMTOMO,0))/CFAC.FACTCAM/100 ELSE '+
          'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+ ' AND CFAC.FACESTADO=''ANULADO'' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFAC.DFACMTOMO,0))*CFAC.FACTCAM/100 ELSE 0 END'+
          'END END)COMIANU,'+
          'SUM(CASE WHEN DFAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND CFAC.FACESTADO=''ACEPTADO'' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFAC.DFACMTOMO,0))/100 ELSE '+
          'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+ ' AND CFAC.FACESTADO=''ACEPTADO'' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFAC.DFACMTOMO,0))/CFAC.FACTCAM/100 ELSE '+
          'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+ ' AND CFAC.FACESTADO=''ACEPTADO'' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFAC.DFACMTOMO,0))*CFAC.FACTCAM/100 ELSE 0 END '+
          'END END)COMINETA '+
          'FROM FAC306 DFAC '+
          'LEFT JOIN FAC305 CFAC ON( DFAC.CIAID=CFAC.CIAID AND DFAC.CLIEID=CFAC.CLIEID AND DFAC.FACSERIE=CFAC.FACSERIE AND DFAC.NFAC=CFAC.NFAC) '+
          'LEFT JOIN TGE205 ART ON ( ART.CIAID=DFAC.CIAID AND DFAC.ARTID=ART.ARTID) '+
          'LEFT JOIN CXC203 V ON (CFAC.CIAID=V.CIAID AND CFAC.VEID=V.VEID) '+
          'LEFT JOIN FAC105 S ON S.TVTAID=V.VETIPO '+
          'WHERE CFAC.FACFECHA>='+sDesde+' '+
          'AND CFAC.FACFECHA<='+sHasta+' '+
          'GROUP BY S.TVTADES,CFAC.VEID, V.VENOMBRES';
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
    xSQL:='SELECT S.TVTADES, CFAC.VEID, V.VENOMBRES, '+
          'SUM( CASE WHEN DFAC.TMONID='+Quotedstr(dblcTMon.Text)+' THEN (NVL(ART.ARTCOMVTA,0)*NVL(DFACMTOMO,0))/100 ELSE '+
          'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' THEN (NVL(ART.ARTCOMVTA,0)*NVL(DFACMTOMO,0))/CFAC.FACTCAM/ 100 ELSE '+
          'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFACMTOMO,0)) *CFAC.FACTCAM/ 100 ELSE 0 END '+
          'END END) COMIBRUTA, '+
          'SUM(CASE WHEN DFAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND CFAC.FACESTADO=''ANULADO'' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFAC.DFACMTOMO,0))/100 ELSE '+
          'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+ ' AND CFAC.FACESTADO=''ANULADO'' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFAC.DFACMTOMO,0))/CFAC.FACTCAM/100 ELSE '+
          'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+ ' AND CFAC.FACESTADO=''ANULADO'' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFAC.DFACMTOMO,0))*CFAC.FACTCAM/100 ELSE 0 END '+
          'END END)COMIANU,'+
          'SUM(CASE WHEN DFAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND CFAC.FACESTADO=''ACEPTADO'' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFAC.DFACMTOMO,0))/100 ELSE '+
          'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+ ' AND CFAC.FACESTADO=''ACEPTADO'' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFAC.DFACMTOMO,0))/CFAC.FACTCAM/100 ELSE '+
          'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+ ' AND CFAC.FACESTADO=''ACEPTADO'' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFAC.DFACMTOMO,0))*CFAC.FACTCAM/100 ELSE 0 END '+
          'END END)COMINETA '+
          'FROM FAC306 DFAC, FAC305 CFAC, TGE205 ART, CXC203 V, FAC105 S '+
          'WHERE CFAC.FACFECHA>='+sDesde+' '+
          'AND CFAC.FACFECHA<='+sHasta+' '+
          'AND DFAC.CIAID=CFAC.CIAID AND DFAC.CLIEID=CFAC.CLIEID AND DFAC.FACSERIE=CFAC.FACSERIE AND DFAC.NFAC=CFAC.NFAC '+
          'AND ART.CIAID=DFAC.CIAID AND DFAC.ARTID=ART.ARTID '+
          'AND CFAC.CIAID=V.CIAID AND CFAC.VEID=V.VEID '+
          'AND S.TVTAID=V.VETIPO '+
          'GROUP BY S.TVTADES,CFAC.VEID, V.VENOMBRES';
  end;

  GReporte.UsuarioSQL.Clear;
  GReporte.UsuarioSQL.Add(xSQL) ;
  GReporte.NewQuery;
  Screen.Cursor:=crHourGlass;

  /////////////////////RESUMIDO  CON NOTAS DE CREDITO CON GUIAS DE SOL,
  //NO SE ESTA CALCULANDO AQULLAS NOTAS DE CREDITO HACEN REFERENCIA A GUIAS Q NO ESTAN EN SOL
	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
    xSQL :=  ' SELECT  S.TVTADES,NC.VEID,V.VENOMBRES, '
    ///////////////////////
    {+' SUM( CASE WHEN GV.TMONID='+Quotedstr(dblcTMon.Text)+' THEN ((COLAESCE(GV.GREMPREVMO,0)*COALESCE(NI.KDXCNTG,0))*COALESCE(AR.ARTCOMVTA,0))/100 ELSE '
    +'      CASE WHEN GV.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' THEN ((COLAESCE(GV.GREMPREVMO,0)*COALESCE(NI.KDXCNTG,0))*COALESCE(AR.ARTCOMVTA,0))/100/CFAC.FACTCAM/100 ELSE '
    +'      CASE WHEN GV.TMONID='+Quotedstr(DMFAC.wTMonExt)+' THEN ((COLAESCE(GV.GREMPREVMO,0)*COALESCE(NI.KDXCNTG,0))*COALESCE(AR.ARTCOMVTA,0))/100*CFAC.FACTCAM/100 ELSE 0 END '
    +' END END)COMIBRUTA,'}
    ////////////////////////
    //+' SUM ((GV.GREMPREVMO*NI.KDXCNTG*AR.ARTCOMVTA)/100) COMIANU '
    +' SUM (((GV.GREMPREVMO*NI.KDXCNTG)*AR.ARTCOMVTA)/100) COMIANU '
    +' FROM CXC301 NC '
    +' LEFT JOIN LOG315 NI ON (NC.CIAID=NI.CIAID AND NI.NISAID=NC.CCPEDIDO  ) '
    +' INNER  JOIN FAC304 GV ON (NI.CIAID=NC.CIAID AND NI.NISANDOC= RTRIM(LTRIM(GV.SERIE))||RTRIM(LTRIM(GV.NGUIA) )AND NI.ARTID=GV.ARTID  )'
    +' INNER  JOIN CXC208 CP ON (NC.CIAID=CP.CIAID  AND  NC.CCPTOTOT=CP.CPTOCAB AND CP. CPTODEVALM=''S'')'
    +' LEFT JOIN TGE110 DC ON (DC.DOCID=NC.DOCID)'
    +' LEFT JOIN TGE205 AR ON (AR.ARTID=GV.ARTID AND AR.ARTID=NI.ARTID)'
    +' LEFT JOIN CXC203 V ON (V.CIAID=NC.CIAID AND V.VEID=NC.VEID)'
    +' LEFT JOIN  FAC105 S ON(S.TVTAID=V.VETIPO)'
    +' WHERE NC.DOCID='+Quotedstr(DMFAC.wsNCre)
    +' AND NC.CCFEMIS>='+sDesde
    +'  AND NC.CCFEMIS<='+sHasta
    +' AND (NC.CCESTADO=''P'' OR NC.CCESTADO=''C'') '
    +' AND NI.NISATIP=''INGRESO'' '
    +' AND NI.TRIID='+Quotedstr(DMFAC.wNIxNC)
    +' GROUP BY S.TVTADES,NC.VEID,V.VENOMBRES';
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
    xSQL:='SELECT S.TVTADES, NC.VEID, V.VENOMBRES, '+
          'SUM (((GV.GREMPREVMO*NI.KDXCNTG)*AR.ARTCOMVTA)/100) COMIANU '+
          'FROM CXC301 NC, LOG315 NI, FAC304 GV, CXC208 CP, TGE110 DC, TGE205 AR, CXC203 V, FAC105 S '+
          'WHERE NC.DOCID='+Quotedstr(DMFAC.wsNCre)+' '+
          'AND NC.CCFEMIS>='+sDesde+' '+
          'AND NC.CCFEMIS<='+sHasta+' '+
          'AND (NC.CCESTADO=''P'' OR NC.CCESTADO=''C'') '+
          'AND NI.NISATIP=''INGRESO'' '+
          'AND NI.TRIID='+Quotedstr(DMFAC.wNIxNC)+' '+
          'AND NC.CIAID=NI.CIAID AND NI.NISAID=NC.CCPEDIDO '+
          'AND NI.CIAID=NC.CIAID AND NI.NISANDOC= RTRIM(LTRIM(GV.SERIE))||RTRIM(LTRIM(GV.NGUIA) )AND NI.ARTID=GV.ARTID '+
          'AND NC.CIAID=CP.CIAID  AND  NC.CCPTOTOT=CP.CPTOCAB AND CP. CPTODEVALM=''S'' '+
          'AND DC.DOCID=NC.DOCID '+
          'AND AR.ARTID=GV.ARTID AND AR.ARTID=NI.ARTID '+
          'AND V.CIAID=NC.CIAID AND V.VEID=NC.VEID '+
          'AND S.TVTAID=V.VETIPO '+
          'GROUP BY S.TVTADES, NC.VEID, V.VENOMBRES';
  end;
  DMFAC.cdsQry2.IndexFieldNames := '';
  DMFAC.cdsQry2.Filter          := '';
  DMFAC.cdsQry2.Close;
  DMFAC.cdsQry2.DataRequest(xSQL);
  DMFAC.cdsQry2.Open;
  DMFAC.cdsQry2.IndexFieldNames := 'VEID';
  if DMFAC.cdsQry2.RecordCount>0 then
  begin

    GReporte.FMant.cds2.first;
    While not GReporte.FMant.cds2.Eof do
    begin
      DMFAC.cdsQry2.SetKey;
      DMFAC.cdsQry2.FieldByName('VEID').AsString := GReporte.FMant.cds2.FieldByName('VEID').AsString;
      if DMFAC.cdsQry2.GotoKey then
      begin
        GReporte.FMant.cds2.Edit ;
        GReporte.FMant.cds2.FieldByName('COMIANU').AsFloat   := FRound(GReporte.FMant.cds2.FieldByName('COMIANU').AsFloat+DMFAC.cdsQry2.FieldByName('COMIANU').AsFloat,15,2);
        GReporte.FMant.cds2.FieldByName('COMINETA').AsFloat  := FRound(GReporte.FMant.cds2.FieldByName('COMIBRUTA').AsFloat-GReporte.FMant.cds2.FieldByName('COMIANU').AsFloat,15,2);
        GReporte.FMant.cds2.Post;
      end;
      GReporte.FMant.cds2.Next;
    end;
  end;
  ////////////////////////////////////////////////////////////

  ///DETALLADO CON FACTURAS, BOLETAS/////////////////////////////////////////////
	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
    xSQL:='SELECT  S.TVTADES,CFAC.VEID, V.VENOMBRES, CFAC.CLIEID,CFAC.CLIEDES,D.DOCABR,CFAC.FACSERIE||CFAC.NFAC NRODOC,CFAC.PEDIDO,'
         +'SUM( CASE WHEN DFAC.TMONID='+Quotedstr(dblcTMon.Text)+' THEN (COALESCE(ART.ARTCOMVTA,0)*COALESCE(DFACMTOMO,0))/100 ELSE    '
         +'     CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' THEN (COALESCE(ART.ARTCOMVTA,0)*COALESCE(DFACMTOMO,0))/CFAC.FACTCAM/ 100 ELSE '
         +'     CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFACMTOMO,0)) *CFAC.FACTCAM/ 100 ELSE 0 END '
         +'    END END)COMIBRUTA,'
         +'SUM(CASE WHEN DFAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND CFAC.FACESTADO=''ANULADO'' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFAC.DFACMTOMO,0))/100 ELSE '
         +'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND CFAC.FACESTADO=''ANULADO'' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFAC.DFACMTOMO,0))/CFAC.FACTCAM/100 ELSE '
         +'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND CFAC.FACESTADO=''ANULADO'' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFAC.DFACMTOMO,0))*CFAC.FACTCAM/100 ELSE 0 END '
         +'END END)COMIANU,'
         +'SUM(CASE WHEN DFAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND CFAC.FACESTADO=''ACEPTADO'' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFAC.DFACMTOMO,0))/100 ELSE '
         +'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND CFAC.FACESTADO=''ACEPTADO'' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFAC.DFACMTOMO,0))/CFAC.FACTCAM/100 ELSE '
         +'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND CFAC.FACESTADO=''ACEPTADO'' THEN (COALESCE(ART.ARTCOMVTA,0)* COALESCE(DFAC.DFACMTOMO,0))*CFAC.FACTCAM/100 ELSE 0 END '
         +'END END)COMINETA '
         +'FROM FAC306 DFAC LEFT JOIN FAC305 CFAC ON( DFAC.CIAID=CFAC.CIAID AND DFAC.CLIEID=CFAC.CLIEID AND DFAC.FACSERIE=CFAC.FACSERIE AND DFAC.NFAC=CFAC.NFAC) '
         +'LEFT JOIN TGE205 ART ON (ART.CIAID=DFAC.CIAID AND  DFAC.ARTID=ART.ARTID )'
         +'LEFT JOIN CXC203 V ON CFAC.CIAID=V.CIAID AND CFAC.VEID=V.VEID'
         +'LEFT JOIN FAC105 S ON S.TVTAID=V.VETIPO'
         +'LEFT JOIN TGE110 D ON CFAC.DOCID=D.DOCID '
         +'WHERE CFAC.FACFECHA>='+sDesde
         +'AND  CFAC.FACFECHA<='+sHasta
         +'GROUP BY S.TVTADES,CFAC.VEID, V.VENOMBRES,CFAC.CLIEID,CFAC.CLIEDES,D.DOCABR,CFAC.FACSERIE||CFAC.NFAC,CFAC.PEDIDO ';
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
    xSQL:= 'SELECT S.TVTADES, CFAC.VEID, V.VENOMBRES, CFAC.CLIEID, CFAC.CLIEDES, D.DOCABR, CFAC.FACSERIE||CFAC.NFAC NRODOC, CFAC.PEDIDO, '+
           'SUM(CASE WHEN DFAC.TMONID='+Quotedstr(dblcTMon.Text)+' THEN (NVL(ART.ARTCOMVTA,0)*NVL(DFACMTOMO,0))/100 ELSE '+
           'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' THEN (NVL(ART.ARTCOMVTA,0)*NVL(DFACMTOMO,0))/CFAC.FACTCAM/ 100 ELSE '+
           'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFACMTOMO,0)) *CFAC.FACTCAM/ 100 ELSE 0 END '+
           'END END) COMIBRUTA, '+
           'SUM(CASE WHEN DFAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND CFAC.FACESTADO=''ANULADO'' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFAC.DFACMTOMO,0))/100 ELSE '+
           'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND CFAC.FACESTADO=''ANULADO'' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFAC.DFACMTOMO,0))/CFAC.FACTCAM/100 ELSE '+
           'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND CFAC.FACESTADO=''ANULADO'' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFAC.DFACMTOMO,0))*CFAC.FACTCAM/100 ELSE 0 END '+
           'END END) COMIANU, '+
           'SUM(CASE WHEN DFAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND CFAC.FACESTADO=''ACEPTADO'' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFAC.DFACMTOMO,0))/100 ELSE '+
           'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND CFAC.FACESTADO=''ACEPTADO'' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFAC.DFACMTOMO,0))/CFAC.FACTCAM/100 ELSE '+
           'CASE WHEN DFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND CFAC.FACESTADO=''ACEPTADO'' THEN (NVL(ART.ARTCOMVTA,0)* NVL(DFAC.DFACMTOMO,0))*CFAC.FACTCAM/100 ELSE 0 END '+
           'END END) COMINETA '+
           'FROM FAC306 DFAC, FAC305 CFAC, TGE205 ART, CXC203 V, FAC105 S, TGE110 D '+
           'WHERE CFAC.FACFECHA>='+sDesde+' '+
           'AND  CFAC.FACFECHA<='+sHasta+' '+
           'AND DFAC.CIAID=CFAC.CIAID AND DFAC.CLIEID=CFAC.CLIEID AND DFAC.FACSERIE=CFAC.FACSERIE AND DFAC.NFAC=CFAC.NFAC '+
           'AND ART.CIAID=DFAC.CIAID AND  DFAC.ARTID=ART.ARTID '+
           'AND CFAC.CIAID=V.CIAID AND CFAC.VEID=V.VEID '+
           'AND S.TVTAID=V.VETIPO '+
           'AND CFAC.DOCID=D.DOCID '+
           'GROUP BY S.TVTADES, CFAC.VEID, V.VENOMBRES, CFAC.CLIEID, CFAC.CLIEDES, D.DOCABR, CFAC.FACSERIE||CFAC.NFAC, CFAC.PEDIDO';
  end;
  DMFAC.cdsKdx.IndexFieldNames := '';
  DMFAC.cdsKdx.Filter          := '';
  DMFAC.cdsKdx.Close;
  DMFAC.cdsKdx.DataRequest(xSQL);
  DMFAC.cdsKdx.Open;
  /////////////////////// DETALLADO  CON NOTAS DE CREDITO CON DOCUMENTOS EN SOL
  ////NO SE SACO COMISION DE LAS N.CRED. Q PORQUE NO SE TIENEN GUIA A Q RELACIONARSE DATA
  ////*
	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
    xSQL:='SELECT  S.TVTADES,NC.VEID,V.VENOMBRES,NC.CLIEID,NC.CLIEDES,DC.DOCABR, NC.CCSERIE||NC.CCNODOC NRODOC, GV.PEDIDO, '+
          'SUM (((GV.GREMPREVMO*NI.KDXCNTG)*AR.ARTCOMVTA)/100) COMIANU '+
          'FROM CXC301 NC '+
          'LEFT JOIN LOG315 NI ON (NC.CIAID=NI.CIAID AND NI.NISAID=NC.CCPEDIDO) '+
          'INNER  JOIN FAC304 GV ON (NI.CIAID=NC.CIAID AND NI.NISANDOC= RTRIM(LTRIM(GV.SERIE))||RTRIM(LTRIM(GV.NGUIA) )AND NI.ARTID=GV.ARTID ) '+
          'INNER  JOIN CXC208 CP ON (NC.CIAID=CP.CIAID  AND  NC.CCPTOTOT=CP.CPTOCAB AND CP. CPTODEVALM=''S'') '+
          'LEFT JOIN TGE110 DC ON (DC.DOCID=NC.DOCID) '+
          'LEFT JOIN TGE205 AR ON (AR.ARTID=GV.ARTID AND AR.ARTID=NI.ARTID) '+
          'LEFT JOIN CXC203 V ON (V.CIAID=NC.CIAID AND V.VEID=NC.VEID) '+
          'LEFT JOIN FAC105 S ON S.TVTAID=V.VETIPO '+
          'WHERE NC.DOCID='+Quotedstr(DMFAC.wsNCre)+' '+
          'AND NC.CCFEMIS>='+sDesde+' '+
          'AND NC.CCFEMIS<='+sHasta+' '+
          'AND (NC.CCESTADO=''P'' OR NC.CCESTADO=''C'') '+
          'AND NI.NISATIP=''INGRESO'' AND '+
          'NI.TRIID='+Quotedstr(DMFAC.wNIxNC)+' '+
          'GROUP BY S.TVTADES,NC.VEID,V.VENOMBRES,NC.CLIEID,NC.CLIEDES,DC.DOCABR, NC.CCSERIE||NC.CCNODOC,GV.PEDIDO';
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
    xSQL:='SELECT S.TVTADES, NC.VEID, V.VENOMBRES, NC.CLIEID, NC.CLIEDES, DC.DOCABR, NC.CCSERIE||NC.CCNODOC NRODOC, GV.PEDIDO, '+
          'SUM (((GV.GREMPREVMO*NI.KDXCNTG)*AR.ARTCOMVTA)/100) COMIANU '+
          'FROM CXC301 NC, LOG315 NI, FAC304 GV, CXC208 CP, TGE110 DC, TGE205 AR, CXC203 V, FAC105 S '+
          'WHERE NC.DOCID='+Quotedstr(DMFAC.wsNCre)+' '+
          'AND NC.CCFEMIS>='+sDesde+' '+
          'AND NC.CCFEMIS<='+sHasta+' '+
          'AND (NC.CCESTADO=''P'' OR NC.CCESTADO=''C'') '+
          'AND NI.NISATIP=''INGRESO'' AND NI.TRIID='+Quotedstr(DMFAC.wNIxNC)+' '+
          'AND NC.CIAID=NI.CIAID AND NI.NISAID=NC.CCPEDIDO '+
          'AND NI.CIAID=NC.CIAID AND NI.NISANDOC= RTRIM(LTRIM(GV.SERIE))||RTRIM(LTRIM(GV.NGUIA) )AND NI.ARTID=GV.ARTID '+
          'AND NC.CIAID=CP.CIAID  AND  NC.CCPTOTOT=CP.CPTOCAB AND CP. CPTODEVALM=''S'' '+
          'AND DC.DOCID=NC.DOCID '+
          'AND AR.ARTID=GV.ARTID AND AR.ARTID=NI.ARTID '+
          'AND V.CIAID=NC.CIAID AND V.VEID=NC.VEID '+
          'AND S.TVTAID=V.VETIPO '+
          'GROUP BY S.TVTADES,NC.VEID,V.VENOMBRES,NC.CLIEID,NC.CLIEDES,DC.DOCABR, NC.CCSERIE||NC.CCNODOC,GV.PEDIDO';
  end;
  DMFAC.cdsQry7.IndexFieldNames := '';
  DMFAC.cdsQry7.Filter          := '';
  DMFAC.cdsQry7.Close;
  DMFAC.cdsQry7.DataRequest(xSQL);
  DMFAC.cdsQry7.Open;
  if DMFAC.cdsQry7.RecordCount>0 then
  begin
    DMFAC.cdsQry7.First;
    while not DMFAC.cdsQry7.Eof do
    begin
      DMFAC.cdsKdx.Insert;
      DMFAC.cdsKdx.FieldByName('TVTADES').AsString  := DMFAC.cdsQry7.FieldByName('TVTADES').AsString;
      DMFAC.cdsKdx.FieldByName('VEID').AsString     := DMFAC.cdsQry7.FieldByName('VEID').AsString    ;
      DMFAC.cdsKdx.FieldByName('VENOMBRES').AsString := DMFAC.cdsQry7.FieldByName('VENOMBRES').AsString;
      DMFAC.cdsKdx.FieldByName('CLIEID').AsString   := DMFAC.cdsQry7.FieldByName('CLIEID').AsString     ;
      DMFAC.cdsKdx.FieldByName('CLIEDES').AsString  := DMFAC.cdsQry7.FieldByName('CLIEDES').AsString    ;
      DMFAC.cdsKdx.FieldByName('DOCABR').AsString   := DMFAC.cdsQry7.FieldByName('DOCABR').AsString     ;
      DMFAC.cdsKdx.FieldByName('NRODOC').AsString   := DMFAC.cdsQry7.FieldByName('NRODOC').AsString     ;
      DMFAC.cdsKdx.FieldByName('PEDIDO').AsString   := DMFAC.cdsQry7.FieldByName('PEDIDO').AsString     ;
      DMFAC.cdsKdx.FieldByName('COMIBRUTA').AsFloat := 0;
      DMFAC.cdsKdx.FieldByName('COMINETA').AsFloat  := 0;
      DMFAC.cdsKdx.FieldByName('COMIANU').AsFloat   := DMFAC.cdsQry7.FieldByName('COMIANU').AsFloat     ;
      DMFAC.cdsKdx.Post;
      DMFAC.cdsQry7.Next;
    end;
  end;
  DMFAC.cdsKdx.IndexFieldNames := 'TVTADES;VEID';
  Screen.Cursor:=crDefault;
end;

procedure TFToolComision.BitBtn1Click(Sender: TObject);
var
  Y,M,D : word;
  xMes : string;
begin
   Decodedate(dbdtpFecFin.Date,Y,M,D);
   xMes := DMFAC.NombreMes(M);

   if GReporte.FMant.cds2.RecordCount=0 then exit;
   Screen.Cursor:=crHourGlass;
   pprRComision.template.fileName := ExtractFilePath( application.ExeName ) +DMFAC.wRutaRpt+ '\RepComision.rtm';
   pprRComisionDet.template.fileName := ExtractFilePath( application.ExeName ) +DMFAC.wRutaRpt+ '\RepComisionDet.rtm';

	 pprRComision.template.LoadFromFile;
	 pprRComisionDet.template.LoadFromFile;
   ppDBComision.DataSource := GReporte.FMant.ds2;
   ppDBComisionDet.DataSource := DMFAC.dsKdx;
   pplPeriodo.Caption := 'DEL MES DE '+xMes +' DEL '+inttostr(Y);
//   pplPeriodoDet.Caption := 'DEL MES DE '+xMes +' DEL '+inttostr(Y);
//   pplMoneda.Caption:=DMFAC.BuscaQry('dspUltTGE','TGE103','TMONDES','TMONID='+Quotedstr(dblcTMon.Text),'TMONDES');

   if GReporte.FMant.cds2.recordcount>0 then
   begin
   	  Screen.Cursor:=crDefault;
    	pprRComision.Print;
      pprRComisionDet.Print;
   	  pprRComisionDet.Stop;
   end
   else
   begin
      raise exception.create('No se encontraron datos para imprimir');
   	  Screen.Cursor:=crDefault;
   end;

end;

procedure TFToolComision.FormCreate(Sender: TObject);
var
   Y,M,D : word;
   xMes,xFechaIni : string;
begin
  DecodeDate(Date,Y,M,D);
  if M<10 then
     xMes:='0'+inttostr(M)
  else
     xMes:=inttostr(M);

  xFechaIni := '01/'+xMes+'/'+inttostr(Y);

  dbdtpFecIni.date := strtodate(xFechaIni);
  dbdtpFecFin.date := Date;

end;

procedure TFToolComision.Timer1Timer(Sender: TObject);
begin
{   FVariables.w_NombreForma := 'FToolComision';}
// Inicio HPC_201311_FAC
// incluye al usuario de tipo administrador en el destroy del timer
{
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolComision);
      xAccesoBotones := True;
   end;
}
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then
   else
   begin
      if not xAccesoBotones then
      begin
         DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolComision);
         xAccesoBotones := True;
      end;
   end;
// Fin HPC_201311_FAC
   Timer1.Destroy;
end;

end.

