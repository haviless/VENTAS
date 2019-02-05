unit Fac793;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, wwdblook, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppBands, ppCtrls,
  ppVar, ppPrnabl;

type
  TFToolCompraAcum = class(TForm)
    pnlTool: TPanel;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtpDesde: TDateTimePicker;
    dtpHasta: TDateTimePicker;
    Z1sbKardex: TBitBtn;
    rdgTipo: TRadioGroup;
    rgLinea: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtIni: TEdit;
    edtFin: TEdit;
    dblcdLinea: TwwDBLookupCombo;
    ppDBCompraAcum: TppDBPipeline;
    ppRCompraAcum: TppReport;
    ppdbReporte2: TppDBPipeline;
    pprReporte2: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplblPeriodo: TppLabel;
    pplblLinea: TppLabel;
    ppLabel5: TppLabel;
    pplblMontoIni: TppLabel;
    pplblMontoFin: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine1: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    pplblUser: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel10: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    pplblPeriodo2: TppLabel;
    pplblLinea2: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLine2: TppLine;
    ppSystemVariable6: TppSystemVariable;
    pplblUser2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText11: TppDBText;
    ppDBText8: TppDBText;
    ppLabel27: TppLabel;
    ppDBText9: TppDBText;
    ppLabel28: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel22: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBText15: TppDBText;
    Timer1: TTimer;
    procedure rgLineaClick(Sender: TObject);
    procedure rgLineaExit(Sender: TObject);
    procedure Z1sbKardexClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   FToolCompraAcum: TFToolCompraAcum;
   xAccesoBotones : Boolean;

implementation

uses FacDM, oaVE3000;

{$R *.DFM}

procedure TFToolCompraAcum.rgLineaClick(Sender: TObject);
begin
   if rgLinea.ItemIndex=0 then
      dblcdLinea.Enabled := false
   else
      if rgLinea.ItemIndex=1 then
        dblcdLinea.Enabled := true;

end;

procedure TFToolCompraAcum.rgLineaExit(Sender: TObject);
begin
   if rgLinea.ItemIndex=0 then
      dblcdLinea.Enabled := false
   else
      if rgLinea.ItemIndex=1 then
        dblcdLinea.Enabled := true;

end;

procedure TFToolCompraAcum.Z1sbKardexClick(Sender: TObject);
var
  xSQL, xSQL2, sDesde, sHasta, xMes, sVeid : string;
  Y, M, D : word;
  i, x10 : integer;
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

  Decodedate(dtpHasta.Date,Y,M,D);
  xMes := DMFAC.NombreMes(M);

  if length(edtIni.text)=0 then
     raise exception.Create('Ingrese un Monto Inicial');

  if length(edtFin.text)=0 then
     raise exception.Create('Ingrese un Monto Final');

  if strtofloat(edtIni.text)>strtofloat(edtFin.text) then
  begin
     edtFin.text := edtIni.text;
     edtFin.SetFocus;
     raise exception.Create('Error: Monto Final debe ser mayor/igual'+#13+' al Monto Inicial');
  end;

  Screen.Cursor:=crHourGlass;
  sVeid := DMFAC.BuscaQry('dspUltTGE','CXC203','VEID','VEFCORP='+quotedstr('S'),'VEID');
  sDesde := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dtpDesde.Date) );
  sHasta := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dtpHasta.Date) );

  ppRCompraAcum.template.fileName := ExtractFilePath( application.ExeName ) +DMFAC.wRutaRpt+ '\CompraAcumulada.rtm';

	ppRCompraAcum.template.LoadFromFile;
  ppDBCompraAcum.DataSource := DMFAC.dsRepDPed;

  ppRReporte2.template.fileName := ExtractFilePath( application.ExeName ) +DMFAC.wRutaRpt+ '\CompraDetallada.rtm';

	ppRReporte2.template.LoadFromFile;
  ppDBReporte2.DataSource := DMFAC.dsKdx;

  pplblPeriodo.Caption := 'DEL MES DE '+xMes +' DEL '+inttostr(Y);
  pplblPeriodo2.Caption := 'DEL MES DE '+xMes +' DEL '+inttostr(Y);
  pplblUser.Caption := DMFAC.wUsuario;
  pplblUser2.Caption := DMFAC.wUsuario;
  if rgLinea.ItemIndex= 0 then
  begin
     pplblLinea.Caption:= ' BROCHAS';
     pplblLinea2.Caption:= ' BROCHAS'
  end
  else
  begin
     pplblLinea.Caption:= ' LINEA '+dblcdLinea.Text;
     pplblLinea2.Caption:= ' LINEA '+dblcdLinea.Text;
  end;

  pplblMontoIni.Caption := edtIni.Text;
  pplblMontoFin.Caption := edtFin.Text;

	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
    if rgLinea.ItemIndex=0 then
    begin
      xSQL:= 'SELECT DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, SUM(DFACMTOME +DFACMTOME*0.18) MONTO, ''AAAA'' ORDEN, '' '' ZVTADES '+
             'FROM FAC306 DFAC '+
             'LEFT JOIN TGE204 CLIE ON DFAC.CLIEID=CLIE.CLIEID '+
             'LEFT JOIN FAC305 CFAC ON CFAC.CIAID=DFAC.CIAID AND CFAC.FACSERIE=DFAC.FACSERIE AND CFAC.NFAC=DFAC.NFAC '+
             'LEFT JOIN TGE205 ART ON DFAC.ARTID=ART.ARTID '+
             'WHERE CFAC.FACESTADO<>''ANULADO'' '+
             'AND DFAC.GRARID=''02'' AND ART.ARTSPRO=''NACIONAL'' '+
             'AND CFAC.FACFECHA>='+sDesde+' '+
             'AND CFAC.FACFECHA<='+sHasta;
      if rdgTipo.itemindex=1 then
        xSQL := xSQL+ ' AND DFAC.VEID<>'+Quotedstr(sVeid);

      xSQL := xSQL+' GROUP BY DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES'+
                   ' HAVING SUM(DFAC.DFACMTOME+DFAC.DFACMTOME*0.18)>='+''+edtIni.text+''+
                   ' AND SUM(DFAC.DFACMTOME+DFAC.DFACMTOME*0.18)<='+''+edtFin.text+''+
                   ' ORDER BY MONTO DESC';

      xSQL2:='SELECT DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, CLIE.CLIETELF, CLIE.CLIEDIR, CLIE.CLIEFAX, '+
             'CFAC.FACFECHA, CFAC.FACSERIE||CFAC.NFAC NROFACTURA, CFAC.GUIASERIE||CFAC.GUIANUM NROGUIA, '+
             'SUM(DFACMTOME +DFACMTOME*0.18) MONTO, ''AAAA'' ORDEN, ZON.ZVTADES '+
             'FROM FAC306 DFAC '+
             'LEFT JOIN TGE204 CLIE ON  DFAC.CLIEID=CLIE.CLIEID '+
             'LEFT JOIN FAC305 CFAC ON  CFAC.CIAID=DFAC.CIAID AND CFAC.FACSERIE=DFAC.FACSERIE AND CFAC.NFAC=DFAC.NFAC '+
             'LEFT JOIN TGE205 ART ON DFAC.ARTID=ART.ARTID '+
             'LEFT JOIN FAC106 ZON ON ZON.ZVTAID=CLIE.ZONVTAID '+
             'WHERE CFAC.FACESTADO<>''ANULADO'' '+
             'AND DFAC.GRARID=''02'' AND ART.ARTSPRO=''NACIONAL'' '+
             'AND CFAC.FACFECHA>='+sDesde+' '+
             'AND CFAC.FACFECHA<='+sHasta;

      if rdgTipo.itemindex=1 then
         xSQL2:= xSQL2+' AND DFAC.VEID<>'+Quotedstr(sVeid);

      xSQL2:= xSQL2+'GROUP BY DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, CLIE.CLIETELF, CLIE.CLIEDIR, CLIE.CLIEFAX, CFAC.FACFECHA, '+
                    'CFAC.FACSERIE||CFAC.NFAC, CFAC.GUIASERIE||CFAC.GUIANUM, ZON.ZVTADES '+
                    'ORDER BY MONTO DESC';
    end
    else
    if rgLinea.ItemIndex=1 then
    begin
      xSQL:='SELECT DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, SUM(DFACMTOME +DFACMTOME*0.18) MONTO, ''AAAA'' ORDEN, '' '' ZVTADES '+
            'FROM FAC306 DFAC '+
            'LEFT JOIN TGE204 CLIE ON  DFAC.CLIEID=CLIE.CLIEID'+
            'LEFT JOIN FAC305 CFAC ON  CFAC.CIAID=DFAC.CIAID AND   CFAC.FACSERIE=DFAC.FACSERIE AND CFAC.NFAC=DFAC.NFAC '+
            'LEFT JOIN TGE205 ART ON DFAC.ARTID=ART.ARTID AND DFAC.GRARID=ART.GRARID '+
            'WHERE CFAC.FACESTADO<>''ANULADO'' '+
            'AND DFAC.GRARID='+Quotedstr(dblcdLinea.text)+
            'AND CFAC.FACFECHA>='+sDesde+
            'AND CFAC.FACFECHA<='+sHasta;
      if rdgTipo.itemindex=1 then
        xSQL := xSQL+ ' AND DFAC.VEID<>''50''';
      xSQL := xSQL +' GROUP BY DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES '+
                    ' HAVING SUM(DFACMTOME +DFACMTOME*0.18)>='+''+edtIni.text+''+
                    ' AND SUM(DFACMTOME +DFACMTOME*0.18)<='+''+edtFin.text+''+
                    ' ORDER BY MONTO DESC';

      xSQL2:='SELECT DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, CLIE.CLIETELF, CLIE.CLIEDIR, CLIE.CLIEFAX, '+
             'CFAC.FACFECHA, CFAC.FACSERIE||CFAC.NFAC NROFACTURA, CFAC.GUIASERIE||CFAC.GUIANUM NROGUIA, '+
             'SUM(DFACMTOME +DFACMTOME*0.18) MONTO, ''AAAA'' ORDEN, ZON.ZVTADES '+
             'FROM FAC306 DFAC '+
             'LEFT JOIN TGE204 CLIE ON DFAC.CLIEID=CLIE.CLIEID '+
             'LEFT JOIN FAC305 CFAC ON CFAC.CIAID=DFAC.CIAID AND CFAC.FACSERIE=DFAC.FACSERIE AND CFAC.NFAC=DFAC.NFAC '+
             'LEFT JOIN TGE205 ART ON DFAC.ARTID=ART.ARTID AND DFAC.GRARID=ART.GRARID '+
             'LEFT JOIN FAC106 ZON ON ZON.ZVTAID=CLIE.ZONVTAID '+
             'WHERE CFAC.FACESTADO<>''ANULADO'' '+
             'AND DFAC.GRARID='+Quotedstr(dblcdLinea.text)+' '+
             'AND CFAC.FACFECHA>='+sDesde+' '+
             'AND CFAC.FACFECHA<='+sHasta;
      if rdgTipo.itemindex=1 then
      xSQL2:= xSQL2+' AND DFAC.VEID<>'+Quotedstr(sVeid);

      xSQL2:= xSQL2+ ' GROUP BY DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, CLIE.CLIETELF, CLIE.CLIEDIR, CLIE.CLIEFAX, CFAC.FACFECHA,'+
                     ' CFAC.FACSERIE||CFAC.NFAC, CFAC.GUIASERIE||CFAC.GUIANUM, ZON.ZVTADES'+
                     ' ORDER BY MONTO DESC';

    end;
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
    if rgLinea.ItemIndex=0 then
    begin
      xSQL:= 'SELECT DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, SUM(DFACMTOME +DFACMTOME*0.18) MONTO, ''AAAA'' ORDEN, '' '' ZVTADES '+
             'FROM FAC306 DFAC, TGE204 CLIE, FAC305 CFAC, TGE205 ART '+
             'WHERE CFAC.FACESTADO<>''ANULADO'' '+
             'AND DFAC.GRARID=''02'' AND ART.ARTSPRO=''NACIONAL'' '+
             'AND CFAC.FACFECHA>='+sDesde+' '+
             'AND CFAC.FACFECHA<='+sHasta+' '+
             'AND DFAC.CLIEID=CLIE.CLIEID '+
             'AND CFAC.CIAID=DFAC.CIAID AND CFAC.FACSERIE=DFAC.FACSERIE AND CFAC.NFAC=DFAC.NFAC '+
             'AND DFAC.CIAID=ART.CIAID AND DFAC.TINID=ART.TINID AND DFAC.ARTID=ART.ARTID';
      if rdgTipo.itemindex=1 then
        xSQL := xSQL+ ' AND DFAC.VEID<>'+Quotedstr(sVeid);

      xSQL := xSQL+' GROUP BY DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES'+
                   ' HAVING SUM(DFAC.DFACMTOME+DFAC.DFACMTOME*0.18)>='+''+edtIni.text+''+
                   ' AND SUM(DFAC.DFACMTOME+DFAC.DFACMTOME*0.18)<='+''+edtFin.text+''+
                   ' ORDER BY MONTO DESC';

      xSQL2:='SELECT DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, CLIE.CLIETELF, CLIE.CLIEDIR, CLIE.CLIEFAX, '+
             'CFAC.FACFECHA, CFAC.FACSERIE||CFAC.NFAC NROFACTURA, CFAC.GUIASERIE||CFAC.GUIANUM NROGUIA, '+
             'SUM(DFACMTOME +DFACMTOME*0.18) MONTO, ''AAAA'' ORDEN, ZON.ZVTADES '+
             'FROM FAC306 DFAC, TGE204 CLIE, FAC305 CFAC, TGE205 ART, FAC106 ZON '+
             'WHERE CFAC.FACESTADO<>''ANULADO'' '+
             'AND DFAC.GRARID=''02'' AND ART.ARTSPRO=''NACIONAL'' '+
             'AND CFAC.FACFECHA>='+sDesde+' '+
             'AND CFAC.FACFECHA<='+sHasta+' '+
             'AND DFAC.CLIEID=CLIE.CLIEID '+
             'AND CFAC.CIAID=DFAC.CIAID AND CFAC.FACSERIE=DFAC.FACSERIE AND CFAC.NFAC=DFAC.NFAC '+
             'AND DFAC.CIAID=ART.CIAID AND DFAC.TINID=ART.TINID AND DFAC.ARTID=ART.ARTID '+
             'AND ZON.ZVTAID=CLIE.ZONVTAID';

      if rdgTipo.itemindex=1 then
         xSQL2:= xSQL2+' AND DFAC.VEID<>'+Quotedstr(sVeid);

      xSQL2:= xSQL2+'GROUP BY DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, CLIE.CLIETELF, CLIE.CLIEDIR, CLIE.CLIEFAX, CFAC.FACFECHA, '+
                    'CFAC.FACSERIE||CFAC.NFAC, CFAC.GUIASERIE||CFAC.GUIANUM, ZON.ZVTADES '+
                    'ORDER BY MONTO DESC';
    end
    else
    if rgLinea.ItemIndex=1 then
    begin
      xSQL:='SELECT DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, SUM(DFACMTOME +DFACMTOME*0.18) MONTO, ''AAAA'' ORDEN, '' '' ZVTADES '+
            'FROM FAC306 DFAC, TGE204 CLIE, FAC305 CFAC, TGE205 ART '+
            'WHERE CFAC.FACESTADO<>''ANULADO'' '+
            'AND DFAC.GRARID='+Quotedstr(dblcdLinea.text)+' '+
            'AND CFAC.FACFECHA>='+sDesde+' '+
            'AND CFAC.FACFECHA<='+sHasta+' '+
            'AND DFAC.CLIEID=CLIE.CLIEID '+
            'AND CFAC.CIAID=DFAC.CIAID AND CFAC.FACSERIE=DFAC.FACSERIE AND CFAC.NFAC=DFAC.NFAC '+
            'AND DFAC.CIAID=ART.CIAID AND DFAC.TINID=ART.TINID AND DFAC.ARTID=ART.ARTID AND DFAC.GRARID=ART.GRARID';
      if rdgTipo.itemindex=1 then
        xSQL := xSQL+ ' AND DFAC.VEID<>''50''';
      xSQL := xSQL +' GROUP BY DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES'+
                    ' HAVING SUM(DFACMTOME +DFACMTOME*0.18)>='+''+edtIni.text+''+
                    ' AND SUM(DFACMTOME +DFACMTOME*0.18)<='+''+edtFin.text+''+
                    ' ORDER BY MONTO DESC';

      xSQL2:='SELECT DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, CLIE.CLIETELF, CLIE.CLIEDIR, CLIE.CLIEFAX, '+
             'CFAC.FACFECHA, CFAC.FACSERIE||CFAC.NFAC NROFACTURA, CFAC.GUIASERIE||CFAC.GUIANUM NROGUIA, '+
             'SUM(DFACMTOME +DFACMTOME*0.18) MONTO, ''AAAA'' ORDEN, ZON.ZVTADES '+
             'FROM FAC306 DFAC, TGE204 CLIE, FAC305 CFAC, TGE205 ART, FAC106 ZON '+
             'WHERE CFAC.FACESTADO<>''ANULADO'' '+
             'AND DFAC.GRARID='+Quotedstr(dblcdLinea.text)+' '+
             'AND CFAC.FACFECHA>='+sDesde+' '+
             'AND CFAC.FACFECHA<='+sHasta+' '+
             'AND DFAC.CLIEID=CLIE.CLIEID '+
             'AND CFAC.CIAID=DFAC.CIAID AND CFAC.FACSERIE=DFAC.FACSERIE AND CFAC.NFAC=DFAC.NFAC '+
             'AND DFAC.CIAID=ART.CIAID AND DFAC.TINID=ART.TINID AND DFAC.ARTID=ART.ARTID AND DFAC.GRARID=ART.GRARID '+
             'AND ZON.ZVTAID=CLIE.ZONVTAID';
      if rdgTipo.itemindex=1 then
      xSQL2:= xSQL2+' AND DFAC.VEID<>'+Quotedstr(sVeid);

      xSQL2:= xSQL2+ ' GROUP BY DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, CLIE.CLIETELF, CLIE.CLIEDIR, CLIE.CLIEFAX, CFAC.FACFECHA,'+
                     ' CFAC.FACSERIE||CFAC.NFAC, CFAC.GUIASERIE||CFAC.GUIANUM, ZON.ZVTADES'+
                     ' ORDER BY MONTO DESC';

    end;
  end;
	GReporte.UsuarioSQL.Clear;
	GReporte.UsuarioSQL.Add(xSQL) ;
	GReporte.NewQuery;
  if GReporte.FMant.cds2.RecordCount=0 then
  begin
     Screen.Cursor:=crDefault;
     raise exception.Create('No se encontraron datos para imprimir')
  end;


  Screen.Cursor:=crHourGlass;
  GReporte.FMant.cds2.DisableControls;

  i:=0;
  GReporte.FMant.cds2.First;
  While not GReporte.FMant.cds2.Eof do
  begin
      i:= i+1;
      GReporte.FMant.cds2.Edit;
      GReporte.FMant.cds2.FieldByName('ORDEN').AsString := DMFAC.StrZero(inttostr(i),4);
      GReporte.FMant.cds2.Post;
      GReporte.FMant.cds2.Next;
  end;

  DMFAC.cdsKdx.Close;
  DMFAC.cdsKdx.DataRequest(xSQL2);
  DMFAC.cdsKdx.Open;

  GReporte.FMant.cds2.IndexFieldNames :='CLIERUC';


  DMFAC.cdsKdx.First;
  while not DMFAC.cdsKdx.Eof do
  begin
  	GReporte.FMant.cds2.Setkey;
   	GReporte.FMant.cds2.FieldByName('CLIERUC').AsString:= DMFAC.cdsKdx.FieldByName('CLIERUC').AsString;
	  if GReporte.FMant.cds2.GotoKey then
    begin
      DMFAC.cdsKdx.Edit;
      DMFAC.cdsKdx.FieldByName('ORDEN').AsString:= GReporte.FMant.cds2.FieldByName('ORDEN').AsString;
      DMFAC.cdsKdx.Post
    end
    else
    begin
      DMFAC.cdsKdx.Edit;
      DMFAC.cdsKdx.FieldByName('ORDEN').AsString:= '9999';
      DMFAC.cdsKdx.Post
    end;
    DMFAC.cdsKdx.Next;
  end;

  DMFAC.cdsKdx.Filtered := false;
  DMFAC.cdsKdx.Filter := 'ORDEN <>''9999''';
  DMFAC.cdsKdx.Filtered := true;



  DMFAC.cdsKdx.IndexFieldNames :='';
  DMFAC.cdsKdx.IndexFieldNames := 'ORDEN';

  GReporte.FMant.cds2.IndexFieldNames:='';
  GReporte.FMant.cds2.EnableControls;


  if GReporte.FMant.cds2.RecordCount>0 then
  begin
     Screen.Cursor:=crDefault;
     ppRCompraAcum.Print;
     ppRCompraAcum.Stop;

     ppRReporte2.Print;
     ppRReporte2.Stop;
     x10:=Self.ComponentCount-1;
     while x10>=0 do
     begin
        if Self.Components[ x10 ].ClassName='TppGroup' then
        begin
          Self.Components[ x10 ].Free ;
        end;
        x10:=x10-1;
     end;

  end
  else
  begin
     Screen.Cursor:=crDefault;
     Showmessage('No se encontraron datos para imprimir');

  end;
end;

procedure TFToolCompraAcum.Timer1Timer(Sender: TObject);
begin
 {  FVariables.w_NombreForma := 'FToolCompraAcum';}
// Inicio HPC_201311_FAC
// incluye al usuario de tipo administrador en el destroy del timer
{
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolCompraAcum);
      xAccesoBotones := True;
   end;
}
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then
   else
   begin
      if not xAccesoBotones then
      begin
         DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolCompraAcum);
         xAccesoBotones := True;
      end;
   end;
// Fin HPC_201311_FAC
   Timer1.Destroy;
end;

end.

