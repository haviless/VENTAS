unit Fac797;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdbdatetimepicker, Buttons, ExtCtrls, ppCache, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands,
  ppVar, Spin, wwdblook;

type
  TFToolCostoVta = class(TForm)
    pnl: TPanel;
    bvFechas: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    bbtnFiltrar: TBitBtn;
    dbdtpFecIni: TwwDBDateTimePicker;
    dbdtpFecFin: TwwDBDateTimePicker;
    BitBtn1: TBitBtn;
    pprRCostoVta: TppReport;
    ppDBCostoVta: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    pplblPeriodo: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    pplblUser: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel6: TppLabel;
    ppDBText8: TppDBText;
    ppLine3: TppLine;
    Timer1: TTimer;
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    procedure bbtnFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   FToolCostoVta: TFToolCostoVta;
   xAccesoBotones : Boolean;

implementation

uses FacDM, oaVE3000;

{$R *.DFM}

procedure TFToolCostoVta.bbtnFiltrarClick(Sender: TObject);
var
  sDesde, sHasta : string;
  xSQL, xMes, xAnoMM : string;
  Y, M, D :word;
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

  Screen.Cursor:=crHourGlass;
  sDesde := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dbdtpFecIni.Date) );
  sHasta := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dbdtpFecFin.Date) );
  Decodedate(dbdtpFecFin.Date,Y,M,D);
  xAnoMM:= IntToStr(Y)+xMes;

	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
    xSQL:= 'SELECT  DET.TRIID,T.TRIDES,DET.GRARID,L.GRARDES, '+
           '        DEC(SUM(CASE WHEN ART.ARTSPRO=''NACIONAL'' THEN  DET.KDXCNTG*DET.ARTPCG ELSE 0 END),15,2) TOTNAC, '+
           '        DEC(SUM( CASE WHEN ART.ARTSPRO=''IMPORTADO'' THEN  DET.KDXCNTG*DET.ARTPCG  ELSE 0 END ),15,2) TOTIMP, '+
           '        DEC(SUM(CASE WHEN ART.ARTSPRO=''NACIONAL'' THEN  DET.KDXCNTG*DET.ARTPCG ELSE 0 END),15,2) + '+
           '        DEC(SUM( CASE WHEN ART.ARTSPRO=''IMPORTADO'' THEN  DET.KDXCNTG*DET.ARTPCG  ELSE 0 END ),15,2) TOTAL '+
           'FROM LOG315 DET '+
           //' LEFT JOIN LOG314 CAB ON CAB.CIAID=DET.CIAID AND CAB.NISAID=DET.NISAID AND CAB.TRIID=DET.TRIID AND CAB.TDAID=DET.TDAID '+
           'LEFT JOIN TGE205 ART ON DET.CIAID=ART.CIAID AND DET.ARTID=ART.ARTID '+
           '                 LEFT JOIN TGE208 T ON T.TRIID=DET.TRIID '+
           '                 LEFT JOIN TGE131 L ON L.GRARID=DET.GRARID '+
           'WHERE DET.NISAFREG>='+sDesde+
           'AND DET.NISAFREG<='+sHasta+
           'AND COALESCE(ART.FLAGVAR,'''')<>''A'' '+
           'AND COALESCE(DET.NISSIT,'''')=''ACEPTADO'' '+
           //' AND CAB.NISSIT=''ACEPTADO'' ' +
           'GROUP BY DET.TRIID,T.TRIDES,DET.GRARID,L.GRARDES ';
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
    xSQL:= 'SELECT DET.TRIID, T.TRIDES, DET.GRARID, L.GRARDES, '+
           'TRUNC(SUM(CASE WHEN ART.ARTSPRO=''NACIONAL'' THEN  DET.KDXCNTG*DET.ARTPCG ELSE 0 END),2) TOTNAC, '+
           'TRUNC(SUM(CASE WHEN ART.ARTSPRO=''IMPORTADO'' THEN  DET.KDXCNTG*DET.ARTPCG  ELSE 0 END ),2) TOTIMP, '+
           'TRUNC(SUM(CASE WHEN ART.ARTSPRO=''NACIONAL'' THEN  DET.KDXCNTG*DET.ARTPCG ELSE 0 END),2) + '+
           'TRUNC(SUM(CASE WHEN ART.ARTSPRO=''IMPORTADO'' THEN  DET.KDXCNTG*DET.ARTPCG  ELSE 0 END ),2) TOTAL '+
           'FROM LOG315 DET, TGE205 ART, TGE208 T, TGE131 L '+
           'WHERE DET.NISAFREG>='+sDesde+
           'AND DET.NISAFREG<='+sHasta+
           'AND NVL(ART.FLAGVAR,'''')<>''A'' '+
           'AND NVL(DET.NISSIT,'''')=''ACEPTADO'' '+
           'AND T.TRIID=DET.TRIID '+
           'AND L.GRARID=DET.GRARID '+
           'AND DET.CIAID=ART.CIAID AND DET.TINID=ART.TINID AND DET.ARTID=ART.ARTID '+
           'GROUP BY DET.TRIID, T.TRIDES, DET.GRARID, L.GRARDES ';
  end;
  Screen.Cursor:=crDefault;
  GReporte.UsuarioSQL.Clear;
  GReporte.UsuarioSQL.Add(xSQL) ;
  GReporte.NewQuery;
end;

procedure TFToolCostoVta.FormCreate(Sender: TObject);
var
   Y,M,D : word;
   xMes,xFechaIni : string;
   wAno,wMes,wDia:Word;
begin
  DecodeDate(Date,Y,M,D);
  if M<10 then
     xMes:='0'+inttostr(M)
  else
     xMes:=inttostr(M);

  xFechaIni := '01/'+xMes+'/'+inttostr(Y);

  dbdtpFecIni.date := strtodate(xFechaIni);
  dbdtpFecFin.date := Date;

  DecodeDate(date, wAno, wMes, wDia);
  speAno.Text:=InttoStr(wAno);
  speMM.Text:=InttoStr(wMes);
end;

procedure TFToolCostoVta.BitBtn1Click(Sender: TObject);
var
  Y,M,D : word;
  xMes : string;
begin
   Decodedate(dbdtpFecFin.Date,Y,M,D);
   xMes := DMFAC.NombreMes(M);

   if GReporte.FMant.cds2.RecordCount=0 then exit;
   Screen.Cursor:=crHourGlass;
   pprRCostoVta.template.fileName := ExtractFilePath( application.ExeName ) +DMFAC.wRutaRpt+ '\CostoVta.rtm';

	 pprRCostoVta.template.LoadFromFile;
   ppDBCostoVta.DataSource := GReporte.FMant.ds2;
   pplblPeriodo.Caption := 'DEL MES DE '+xMes +' DEL '+inttostr(Y);

   if GReporte.FMant.cds2.recordcount>0 then
   begin
   	  Screen.Cursor:=crDefault;
    	pprRCostoVta.Print;
   	  pprRCostoVta.Stop;
   end
   else
   begin
      raise exception.create('No se encontraron datos para imprimir');
   	  Screen.Cursor:=crDefault;
   end;

end;

procedure TFToolCostoVta.Timer1Timer(Sender: TObject);
begin
{   FVariables.w_NombreForma := 'FToolCostoVta';}
// Inicio HPC_201311_FAC
// incluye al usuario de tipo administrador en el destroy del timer
{
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolCostoVta);
      xAccesoBotones := True;
   end;
}
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then
   else
   begin
      if not xAccesoBotones then
      begin
         DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolCostoVta);
         xAccesoBotones := True;
      end;
   end;
// Fin HPC_201311_FAC
   Timer1.Destroy;
end;

procedure TFToolCostoVta.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text := DMFAC.BuscaQry('dspUltTGE','TGE101','CIADES','CIAID='+QuotedStr(DMFAC.cdsCia.FieldByName('CIAID').AsString),'CIADES');
end;

procedure TFToolCostoVta.BitBtn2Click(Sender: TObject);
var
   xSQL   : String;
   xAnoMM : String;
begin

   speMM.Text:=DMFAC.StrZero(speMM.Text,2);
   xAnoMM:=speAno.Text+speMM.Text;

   xSQL:='SELECT NVL(J.SFAMDES,''Servicios''), SUM(DFACMTOMN) VENTA, SUM(DFACIMPMTN1) IGV, '
        +   'sum(dfacvtotmn) TOTAL '
        +'FROM fac305 A, FAC306 B, TGE170 J '
        +'Where A.ciaid='''+dblcCia.Text+''' and A.facanomes='''+xAnoMM+''' AND A.facestado=''ACEPTADO'' '
        +  'AND A.CIAID=B.CIAID AND A.DOCID=B.DOCID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
        +  'AND (B.CIAID=J.CIAID(+) AND B.TINID=J.TINID(+) AND B.GRARID=J.GRARID(+) '
        +  'AND B.FAMID=J.FAMID(+) AND B.SFAMID=J.SFAMID(+)) '
        +  'AND NOT EXISTS( SELECT X.CCNODOC '
        +                  'FROM ( SELECT B.CIAID, B.DOCID, B.CCSERIE, B.CCNODOC, A.CCMTOLOC '
        +                         'FROM CXC301 A, CXC304 B '
        +                         'WHERE A.CIAID='''+dblcCia.Text+''' AND A.CCANOMES='''+xAnoMM+''' '
        +                         '  AND A.DOCID=''27'' '
        +                         '  AND A.CCESTADO=''P'' '
        +                         '  AND A.CIAID=B.CIAID AND A.TCANJEID=B.TCANJEID '
        +                         '  AND A.CCCANJE=B.CCCANJE ) X '
        +                  'WHERE A.CIAID=X.CIAID AND A.DOCID=X.DOCID AND A.FACSERIE=X.CCSERIE '
        +                    'AND A.NFAC=X.CCNODOC '
        +                ') '
        +'GROUP BY J.SFAMDES '
        +'ORDER BY J.SFAMDES';
end;

end.

