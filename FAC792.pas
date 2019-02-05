unit Fac792;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, ppEndUsr, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppBands, ppViewr,
  ppCtrls, ppPrnabl, ppVar, wwdblook,pptypes;

type
  TFToolVtaNta = class(TForm)
    pnlTool: TPanel;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtpDesde: TDateTimePicker;
    dtpHasta: TDateTimePicker;
    Z2bbtnKdxValInv: TBitBtn;
    Z1sbKardex: TBitBtn;
    DBData: TppDBPipeline;
    ppVentaNta: TppReport;
    Diseno: TppDesigner;
    rdgTipo: TRadioGroup;
    ppHeaderBand1: TppHeaderBand;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    GroupBox1: TGroupBox;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    Timer1: TTimer;
    procedure Z1sbKardexClick(Sender: TObject);
    procedure ppVentaNtaPreviewFormCreate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FToolVtaNta: TFToolVtaNta;
	xSQL : String;
   xAccesoBotones : Boolean;

implementation

uses oaVE3000, FacDM;

{$R *.DFM}

procedure TFToolVtaNta.Z1sbKardexClick(Sender: TObject);
var
	sVeid,sDesde,sHasta : String;
	Y,M,D : word;
	xTotal : Double;
	x10 : Integer;
begin
  if dtpDesde.Date=0 then
    raise exception.Create('Falta Fecha de Inicio!!!');
  if dtpHasta.Date=0 then
    raise exception.Create('Falta Fecha Final!!!');

  if (dtpDesde.Date>dtpHasta.Date) then
  begin
    dtpHasta.Date := dtpDesde.Date;
    dtpHasta.setfocus;
    raise exception.Create('Error: Fecha Final debe ser mayor/igual'+#13+' a la Fecha de Inicio');
  end;

  if length(dblcTMon.Text)=0 then
    raise exception.Create('Seleccione Moneda');

  Screen.Cursor:=crHourGlass;
  sDesde := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dtpDesde.Date) );
  sHasta := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dtpHasta.Date) );
  DBData.DataSource := Mtx.FMant.ds2;
  sVeid := DMFAC.BuscaQry('dspUltTGE','CXC203','VEID','VEFCORP='+quotedstr('S'),'VEID');

	xTotal:=0;
	DecodeDate(dtpHasta.Date, Y, M, D);
	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
	xSQL:='SELECT FAC.GRARID, LIN.GRARDES, '+
				'SUM(CASE WHEN  FAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO/DFACTCAM ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO*DFACTCAM ELSE 0 END '+
        ' END END) MONTOIMP, '+
				'SUM(CASE WHEN  FAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO/DFACTCAM ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO*DFACTCAM ELSE 0 END'+
        ' END END) MONTONAC, '+
				'SUM(CASE WHEN  FAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO/DFACTCAM ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO*DFACTCAM ELSE 0 END '+
        ' END END) + '+
				'SUM(CASE WHEN  FAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO/DFACTCAM ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO*DFACTCAM ELSE 0 END'+
        ' END END) TOTAL, '+
				'0.00 PORC '+
				'FROM FAC306 FAC '+
				'LEFT JOIN FAC305 CFAC ON (CFAC.CIAID=FAC.CIAID AND CFAC.CLIEID=FAC.CLIEID AND CFAC.FACSERIE=FAC.FACSERIE AND CFAC.NFAC=FAC.NFAC ) '+
				'LEFT JOIN TGE205 ART ON (FAC.CIAID=ART.CIAID AND FAC.ARTID=ART.ARTID ) '+
				'LEFT JOIN TGE131 LIN ON (LIN.CIAID=FAC.CIAID AND LIN.GRARID=FAC.GRARID  AND LIN.GRARID=ART.GRARID) '+
				'WHERE CFAC.FACESTADO<>''ANULADO'' '+
        'AND CFAC.FACESTADO=''ACEPTADO'' '+
				'AND CFAC.FACFECHA>='+sDesde+
				'AND CFAC.FACFECHA<='+sHasta;
        //'AND CFAC.FACMM='+QuotedStr(DMFAC.StrZero(InttoStr(M),2))+' ';
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
	xSQL:='SELECT FAC.GRARID, LIN.GRARDES, '+
				'SUM(CASE WHEN  FAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO/DFACTCAM ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO*DFACTCAM ELSE 0 END '+
        ' END END) MONTOIMP, '+
				'SUM(CASE WHEN  FAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO/DFACTCAM ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO*DFACTCAM ELSE 0 END'+
        ' END END) MONTONAC, '+
				'SUM(CASE WHEN  FAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO/DFACTCAM ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO*DFACTCAM ELSE 0 END '+
        ' END END) + '+
				'SUM(CASE WHEN  FAC.TMONID='+Quotedstr(dblcTMon.Text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO/DFACTCAM ELSE '+
				' CASE WHEN  FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO*DFACTCAM ELSE 0 END'+
        ' END END) TOTAL, '+
				'0.00 PORC '+
				'FROM FAC306 FAC, FAC305 CFAC, TGE205 ART, TGE131 LIN '+
				'WHERE CFAC.FACESTADO<>''ANULADO'' '+
        'AND CFAC.FACESTADO=''ACEPTADO'' '+
				'AND CFAC.FACFECHA>='+sDesde+' '+
				'AND CFAC.FACFECHA<='+sHasta+' '+
        'AND CFAC.CIAID=FAC.CIAID AND CFAC.CLIEID=FAC.CLIEID AND CFAC.FACSERIE=FAC.FACSERIE AND CFAC.NFAC=FAC.NFAC '+
        'AND FAC.CIAID=ART.CIAID AND FAC.ARTID=ART.ARTID '+
        'AND LIN.CIAID=FAC.CIAID AND LIN.TINID=FAC.TINID AND LIN.GRARID=FAC.GRARID  AND LIN.GRARID=ART.GRARID';
  end;

	if rdgTipo.ItemIndex = 1 then
		xSQL:=xSQL+' AND CFAC.VEID<>'''+sVeid+''' ';
	xSQL:=xSQL+' GROUP BY FAC.GRARID, LIN.GRARDES';

	Mtx.UsuarioSQL.Clear;
	Mtx.UsuarioSQL.Add(xSQL) ;
	Mtx.NewQuery;

	GReporte.FMant.cds2.First;
	while not GReporte.FMant.cds2.Eof do
	begin
		xTotal:=GReporte.FMant.cds2.FieldByName('TOTAL').AsFloat + xTotal;
		GReporte.FMant.cds2.Next;
	end;

	GReporte.FMant.cds2.First;
	while not GReporte.FMant.cds2.Eof do
	begin
		GReporte.FMant.cds2.Edit;
    if xTotal > 0 then
		  GReporte.FMant.cds2.FieldByName('PORC').AsFloat:=(GReporte.FMant.cds2.FieldByName('TOTAL').AsFloat/xTotal)*100
    else
		  GReporte.FMant.cds2.FieldByName('PORC').AsFloat:=0;
		GReporte.FMant.cds2.Post;
		GReporte.FMant.cds2.Next;
	end;

	ppVentaNta.Template.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\RepVentaNta.rtm' ;
	ppVentaNta.Template.LoadFromFile;

	ppLabel5.Caption:='Del Mes de '+DMFAC.NombreMes(M)+' del '+InttoStr(Y);
	ppLabel12.Caption:=DMFAC.wUsuario;
	if rdgTipo.ItemIndex = 0 then
		ppLabel13.Caption:='Incluye Corporativa'
	else
		ppLabel13.Caption:='No Incluye Corporativa';

	//Diseno.ShowModal;
	ppVentaNta.Print;
	ppVentaNta.Stop;
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

procedure TFToolVtaNta.ppVentaNtaPreviewFormCreate(Sender: TObject);
begin
	ppVentaNta.PreviewForm.ClientHeight := 500;
	ppVentaNta.PreviewForm.ClientWidth  := 650;
	TppViewer(ppVentaNta.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
end;

procedure TFToolVtaNta.FormCreate(Sender: TObject);
var
  Y,M,D :word;
  xMes,xFechaIni : string;

begin
  DecodeDate(Date,Y,M,D);
  if M<10 then
     xMes:='0'+inttostr(M)
  else
     xMes:=inttostr(M);

  xFechaIni := '01/'+xMes+'/'+inttostr(Y);

  dtpDesde.date := strtodate(xFechaIni);
  dtpHasta.date := Date;

end;

procedure TFToolVtaNta.dblcTMonExit(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'TMONID='+Quotedstr(dblcTMon.Text)
             +' and (TMON_LOC='+Quotedstr('L')+' or TMON_LOC='+Quotedstr('E')+')';
   edtTMon.Text:=DMFAC.BuscaQry('dspUltTGE','TGE103','TMONDES',xWhere,'TMONDES');

end;

procedure TFToolVtaNta.Timer1Timer(Sender: TObject);
begin
{   FVariables.w_NombreForma := 'FToolVtaNta';}
// Inicio HPC_201311_FAC
// incluye al usuario de tipo administrador en el destroy del timer
{
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolVtaNta);
      xAccesoBotones := True;
   end;
}
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then
   else
   begin
      if not xAccesoBotones then
      begin
         DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolVtaNta);
         xAccesoBotones := True;
      end;
   end;
// Fin HPC_201311_FAC
   Timer1.Destroy;
end;

end.
