unit Fac790;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, wwdbdatetimepicker, Buttons, wwdblook, ComCtrls,
  ppEndUsr, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport,
  ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, MsgDlgs;

type
  TFToolRepDocs = class(TForm)
    pcDocumento: TPageControl;
    tsGuia: TTabSheet;
    tsBoleta: TTabSheet;
    tsFactura: TTabSheet;
    bvGFecha: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbdtpGFecIni: TwwDBDateTimePicker;
    dbdtpGFecFin: TwwDBDateTimePicker;
    bbtnGOk: TBitBtn;
    bbtnGPrint: TBitBtn;
    bvFFecha: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbdtpFFecIni: TwwDBDateTimePicker;
    dbdtpFFecFin: TwwDBDateTimePicker;
    bvFSerie: TBevel;
    bbtnFOk: TBitBtn;
    chkFTodos: TCheckBox;
    dblcFSerie: TwwDBLookupCombo;
    Label10: TLabel;
    Bevel5: TBevel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Bevel6: TBevel;
    Label14: TLabel;
    Label15: TLabel;
    bvGuia: TBevel;
    chkGTodos: TCheckBox;
    dblcGSerie: TwwDBLookupCombo;
    Label8: TLabel;
    Bevel7: TBevel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    dbdtpBFecIni: TwwDBDateTimePicker;
    dbdtpBFecFin: TwwDBDateTimePicker;
    bbtnBOk: TBitBtn;
    bbtnBPrint: TBitBtn;
    Bevel8: TBevel;
    chkBTodos: TCheckBox;
    dblcBSerie: TwwDBLookupCombo;
    Label20: TLabel;
    ppDBRepGuias: TppDBPipeline;
    ppRepGuias: TppReport;
    ppdbRepFactura: TppDBPipeline;
    ppRepFactura: TppReport;
    ppdbRepBoleta: TppDBPipeline;
    ppRepBoleta: TppReport;
    chkGLote: TCheckBox;
    chkFLote: TCheckBox;
    chkBLote: TCheckBox;
    bbtnVendedor: TBitBtn;
    GroupBox3: TGroupBox;
    chkFSector: TCheckBox;
    dblcFSector: TwwDBLookupCombo;
    edtFSector: TEdit;
    GroupBox1: TGroupBox;
    chkGSector: TCheckBox;
    dblcGSector: TwwDBLookupCombo;
    edtGSector: TEdit;
    Label7: TLabel;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    chkBSector: TCheckBox;
    dblcBSector: TwwDBLookupCombo;
    edtBSector: TEdit;
    Label19: TLabel;
    ppReporte: TppReport;
    dbpReporte: TppDBPipeline;
    ppDesigner1: TppDesigner;
    bbtnFPrint: TBitBtn;
    ppHeaderBand4: TppHeaderBand;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppLabel16: TppLabel;
    ppLabel43: TppLabel;
    ppLabel47: TppLabel;
    pplPeriodo: TppLabel;
    pplZona: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppDBText42: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppDBText43: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    pplblRango: TppLabel;
    pplblCia: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLine5: TppLine;
    pplblSerie: TppLabel;
    pplblUser: TppLabel;
    ppLabel6: TppLabel;
    pplblGSector: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine4: TppLine;
    ppDBText8: TppDBText;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    pplblTotal: TppLabel;
    ppDBText27: TppDBText;
    ppHeaderBand2: TppHeaderBand;
    ppLabel9: TppLabel;
    pplblFFecha: TppLabel;
    pplblFCia: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLine1: TppLine;
    pplblFSerie: TppLabel;
    pplblFUser: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    pplblFSector: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppLine2: TppLine;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText10: TppDBText;
    ppDBText17: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText9: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBCalc2: TppDBCalc;
    pplblFTotal: TppLabel;
    ppDBText28: TppDBText;
    ppHeaderBand3: TppHeaderBand;
    ppLabel12: TppLabel;
    pplblBFecha: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppLine3: TppLine;
    ppLabel42: TppLabel;
    pplblbUser: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    pplblBSector: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLine6: TppLine;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand3: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText18: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel46: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBText29: TppDBText;
    bbtnPedVendedor: TBitBtn;
    ppDBPedVendedor: TppDBPipeline;
    pprRPedVendedor: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel76: TppLabel;
    ppLine7: TppLine;
    pplblZona: TppLabel;
    pplblDesde: TppLabel;
    pplblHasta: TppLabel;
    ppLine8: TppLine;
    ppLabel75: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    pplblPUser: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    bbtnPedRechazado: TBitBtn;
    ppDBPedRechazado: TppDBPipeline;
    pprPedRechazado: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    ppSystemVariable16: TppSystemVariable;
    ppSystemVariable17: TppSystemVariable;
    ppLabel83: TppLabel;
    pplblPRUser: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLine9: TppLine;
    ppLabel93: TppLabel;
    pplblPRSector: TppLabel;
    pplblPRDesde: TppLabel;
    pplblPRHasta: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppGroupFooterBand6: TppGroupFooterBand;
    Timer1: TTimer;
    procedure bbtnGOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnGPrintClick(Sender: TObject);
    procedure ppRepGuiasPrintingComplete(Sender: TObject);
    procedure dbdtpGFecFinExit(Sender: TObject);
    procedure dbdtpFFecFinExit(Sender: TObject);
    procedure dbdtpBFecFinExit(Sender: TObject);
    procedure chkBTodosClick(Sender: TObject);
    procedure chkFTodosClick(Sender: TObject);
    procedure chkGTodosClick(Sender: TObject);
    procedure bbtnFOkClick(Sender: TObject);
    procedure bbtnFPrintClick(Sender: TObject);
    procedure bbtnBOkClick(Sender: TObject);
    procedure bbtnBPrintClick(Sender: TObject);
    procedure chkFSectorClick(Sender: TObject);
    procedure dblcFSectorExit(Sender: TObject);
    procedure dblcGSectorExit(Sender: TObject);
    procedure chkGSectorClick(Sender: TObject);
    procedure dblcBSectorExit(Sender: TObject);
    procedure bbtnVendedorClick(Sender: TObject);
    procedure chkBSectorClick(Sender: TObject);
    procedure bbtnPedVendedorClick(Sender: TObject);
    procedure bbtnPedRechazadoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    xFlagGImp : boolean;
    xFiltraG, xFiltraF, xFiltraB : boolean;
  public
    { Public declarations }
  end;

var
   FToolRepDocs: TFToolRepDocs;
   xAccesoBotones : Boolean;

implementation

uses oaVE3000, FacDM;

{$R *.DFM}

procedure TFToolRepDocs.bbtnGOkClick(Sender: TObject);
var
  xSQL, xSQL1, xSQL2, sZona1, sZona2, sFecha, sDesde, sHasta : string;
begin
  if dbdtpGFecIni.Date=0 then
  begin
    dbdtpGFecIni.SetFocus;
    Showmessage('Falta Fecha Inicial de Reporte');
    exit;
  end;

  if dbdtpGFecFin.Date=0 then
  begin
    dbdtpGFecFin.SetFocus;
    Showmessage('Falta Fecha Final de Reporte');
    exit;
  end;

  if (dbdtpGFecIni.Date>dbdtpGFecFin.Date) then
  begin
    dbdtpGFecFin.Date := dbdtpGFecIni.Date;
    dbdtpGFecFin.setfocus;
    raise exception.Create('Error: F.Final debe ser mayor/igual'+#13+' a la Fecha de Inicio');
  end;

  if (chkGtodos.Checked = false) then
  begin
    if length(dblcGSerie.Text)=0 then
    begin
      Showmessage('Falta Ingresar Serie');
      exit;
    end;
  end;

  if (chkGSector.Checked = false) then
  begin
    if length(dblcGSector.Text)=0 then
    begin
      Showmessage('Falta Ingresar Sector Comercial');
      exit;
    end;
  end;

  sFecha   :=quotedStr(formatdatetime(DMFAC.wFormatFecha,Date));
  sDesde   :=quotedStr(formatdatetime(DMFAC.wFormatFecha,dbdtpGFecIni.DateTime));
  sHasta   :=quotedStr(formatdatetime(DMFAC.wFormatFecha,dbdtpGFecFin.DateTime));

	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
    //PARA GUIAS DE VENTA Q TENGAN NOTA DE INGRESO POR ANULACION, N/C , DEVOLUCION, ETC
    xSQL1:='SELECT A.GREMFECHA FECHA, A.SERIE, A.NGUIA, A.SERIE||A.NGUIA NROGUIA, B.FACSERIE FACTURASERIE, '+
           'B.NFAC FACTURANRO, A.TIPVTAID, A.CIAID, A.VEID, '+
           'B.FACSERIE||B.NFAC NROFACTURA, A.PEDIDO, A.CLIEID, A.CLIEDES, C.DCCOMDES FPAGO, '+
           'CASE WHEN GREMESTADO=''ANULADO'' THEN ''GUIA ANULADA'' ELSE  T.TRIABR END OBSERVACION, E.TVTADES '+
           'FROM FAC303 A '+
           'LEFT JOIN FAC305 B ON (A.SERIE=B.GUIASERIE AND A.NGUIA=B.GUIANUM) '+
           'LEFT JOIN TGE180 C ON (A.CIAID=C.CIAID AND A.TIPVTAID=C.SCOMERID AND A.FPAGOID=C.CCOMERID) '+
           'LEFT JOIN TGE208 D ON (D.TRIID=A.TRIID) '+
           'LEFT JOIN FAC105 E ON (A.TIPVTAID=E.TVTAID) '+
           'LEFT JOIN LOG314 L ON (L.NISANDOC=A.SERIENGUIA AND L.NISATIP=''INGRESO'') '+
           'LEFT JOIN TGE208 T ON (T.TRIID=L.TRIID) '+
           'WHERE A.GREMFECHA>='+sDesde+' '+
           'AND A.GREMFECHA<='+sHasta+' '+
           'AND COALESCE(A.GREMINGDEV,'''')=''S''';
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
    //PARA GUIAS DE VENTA Q TENGAN NOTA DE INGRESO POR ANULACION, N/C , DEVOLUCION, ETC
    xSQL1:='SELECT A.GREMFECHA FECHA, A.SERIE, A.NGUIA, A.SERIE||A.NGUIA  NROGUIA, B.FACSERIE FACTURASERIE, '+
           'B.NFAC FACTURANRO, A.TIPVTAID, A.CIAID, A.VEID, '+
           'B.FACSERIE||B.NFAC NROFACTURA, A.PEDIDO, A.CLIEID, A.CLIEDES, C.DCCOMDES FPAGO, '+
           'CASE WHEN GREMESTADO=''ANULADO'' THEN ''GUIA ANULADA'' ELSE T.TRIABR END OBSERVACION, E.TVTADES '+
           'FROM FAC303 A, FAC305 B, TGE180 C, TGE208 D, FAC105 E, LOG314 L, TGE208 T '+
           'WHERE A.GREMFECHA>='+sDesde+' '+
           'AND A.GREMFECHA<='+sHasta+' '+
           'AND NVL(A.GREMINGDEV,'''')=''S'' '+
           'AND A.SERIE=B.GUIASERIE AND A.NGUIA=B.GUIANUM '+
           'AND A.CIAID=C.CIAID AND A.TIPVTAID=C.SCOMERID AND A.FPAGOID=C.CCOMERID '+
           'AND D.TRIID=A.TRIID '+
           'AND A.TIPVTAID=E.TVTAID '+
           'AND L.NISANDOC=A.SERIENGUIA AND L.NISATIP=''INGRESO'' '+
           'AND T.TRIID=L.TRIID';
  end;

  if (chkGtodos.Checked= false) then
  begin
    if length(dblcGSerie.Text)>0 then
      xSQL1 := xSQL1+ ' AND A.SERIE='+quotedstr(dblcGSerie.text);
  end;

  if (chkGLote.Checked= True) then
    xSQL1 := xSQL1+ ' AND '+DMFAC.wReplacCeros+'(A.GREMIMPREP,'''')<>''S'' ';

  if chkGSector.checked then
    sZona1:=''
  else
    sZona1:=' AND A.TIPVTAID='+QuotedStr(dblcGSector.text);

  xSQL1 := xSQL1+sZona1;

  //	XSQL2
  //PARA GUIAS DE VENTA Q NO TENGAN NOTA DE INGRESO
	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
    xSQL2:='SELECT A.GREMFECHA FECHA, A.SERIE, A.NGUIA, A.SERIE||A.NGUIA NROGUIA, B.FACSERIE FACTURASERIE, '+
           'B.NFAC FACTURANRO, A.TIPVTAID, A.CIAID, A.VEID, '+
           'B.FACSERIE||B.NFAC NROFACTURA, A.PEDIDO, A.CLIEID, A.CLIEDES, C.DCCOMDES FPAGO, '+
           'CASE WHEN GREMESTADO=''ANULADO'' THEN ''GUIA ANULADA'' ELSE CASE WHEN A.TRIID<>'+Quotedstr(DMFAC.wTransVta)+' THEN T.TRIABR ELSE '''' '+
           'END END OBSERVACION, E.TVTADES '+
           'FROM FAC303 A '+
           'LEFT JOIN FAC305 B ON (A.SERIE=B.GUIASERIE AND A.NGUIA=B.GUIANUM) '+
           'LEFT JOIN TGE180 C ON (A.CIAID=C.CIAID AND A.TIPVTAID=C.SCOMERID AND A.FPAGOID=C.CCOMERID) '+
           'LEFT JOIN TGE208 D ON (D.TRIID=A.TRIID) '+
           'LEFT JOIN FAC105 E ON (A.TIPVTAID=E.TVTAID) '+
           'LEFT JOIN LOG314 L ON (L.NISAID=A.SERIENGUIA AND L.NISATIP=''SALIDA'') '+
           'LEFT JOIN TGE208 T ON (T.TRIID=L.TRIID) '+
           'WHERE A.GREMFECHA>='+sDesde+' '+
           'AND A.GREMFECHA<='+sHasta+' '+
           'AND COALESCE(A.GREMINGDEV,'''')<>''S''';
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
    xSQL2:='SELECT A.GREMFECHA FECHA, A.SERIE, A.NGUIA, A.SERIE||A.NGUIA NROGUIA, B.FACSERIE FACTURASERIE, B.NFAC FACTURANRO, '+
           'A.TIPVTAID, A.CIAID, A.VEID, '+
           'B.FACSERIE||B.NFAC NROFACTURA, A.PEDIDO, A.CLIEID, A.CLIEDES, C.DCCOMDES FPAGO, '+
           'CASE WHEN GREMESTADO=''ANULADO'' THEN ''GUIA ANULADA'' ELSE CASE WHEN A.TRIID<>'+Quotedstr(DMFAC.wTransVta)+' THEN T.TRIABR ELSE '''' '+
           'END END OBSERVACION, E.TVTADES '+
           'FROM FAC303 A, FAC305 B, TGE180 C, TGE208 D, FAC105 E, LOG314 L, TGE208 T '+
           'WHERE A.GREMFECHA>='+sDesde+' '+
           'AND A.GREMFECHA<='+sHasta+' '+
           'AND NVL(A.GREMINGDEV,'''')<>''S'' '+
           'AND A.SERIE=B.GUIASERIE AND A.NGUIA=B.GUIANUM '+
           'AND A.CIAID=C.CIAID AND A.TIPVTAID=C.SCOMERID AND A.FPAGOID=C.CCOMERID '+
           'AND D.TRIID=A.TRIID '+
           'AND A.TIPVTAID=E.TVTAID '+
           'AND L.NISAID=A.SERIENGUIA AND L.NISATIP=''SALIDA'' '+
           'AND T.TRIID=L.TRIID';
  end;

  if (chkGtodos.Checked= false) then
  begin
    if length(dblcGSerie.Text)>0 then
      xSQL2 := xSQL2+ ' AND A.SERIE='+quotedstr(dblcGSerie.text);
  end;

  if (chkGLote.Checked= True) then
    xSQL2 := xSQL2+ ' AND '+DMFAC.wReplacCeros+'(A.GREMIMPREP,'''')<>''S'' ';

  if chkGSector.checked then
    sZona2:=''
  else
    sZona2:=' AND A.TIPVTAID='+QuotedStr(dblcGSector.text);

  xSQL2 := xSQL2+sZona2;

  xSQL :='SELECT FECHA, SERIE, NGUIA, NROGUIA, FACTURASERIE, FACTURANRO, TIPVTAID, CIAID, VEID, NROFACTURA, '+
         'PEDIDO, CLIEID, CLIEDES, FPAGO, OBSERVACION, TVTADES FROM( '+
         xSQL1+' UNION ALL '+xSQL2+' )XX ORDER BY FECHA, SERIE, NGUIA';

  GReporte.FMant.cds2.IndexFieldNames :='';
  
  GReporte.UsuarioSQL.Clear;
  GReporte.UsuarioSQL.Add(xSQL) ;
  GReporte.NewQuery;
  if GReporte.FMant.cds2.RecordCount>0 then
  begin
    xFiltraG := true;
  end;
  xFiltraF := false;
  xFiltraB := false;
end;

procedure TFToolRepDocs.FormCreate(Sender: TObject);
var
  xSQL : string;
begin
   xFiltraG := false;
   xFiltraF := false;
   xFiltraB := false;
   dblcGSerie.Clear;
   dblcGSerie.Selected.Add('SERIEID'#9'12'#9'Serie');
   dblcGSerie.Selected.Add('SERIEDES'#9'12'#9'Descripción.');

   xSQL := ' SELECT SERIEID,SERIEDES FROM FAC103'
           +' WHERE FLAGV=''G''';
   DMFAC.cdsQry1.Close;
   DMFAC.cdsQry1.Filter:='';
   DMFAC.cdsQry1.IndexFieldNames:='';
   DMFAC.cdsQry1.DataRequest(xSQL);
   DMFAC.cdsQry1.Open;
   DMFAC.cdsQry1.IndexFieldNames:='SERIEID';
   dblcGSerie.LookupTable := DMFAC.cdsQry1;
   dblcGSerie.LookupField := 'SERIEID';
   //*

   dblcFSerie.Clear;
   dblcFSerie.Selected.Add('SERIEID'#9'12'#9'Serie');
   dblcFSerie.Selected.Add('SERIEDES'#9'12'#9'Descripción.');

   xSQL := ' SELECT SERIEID,SERIEDES FROM FAC103'
           +' WHERE FLAGV=''F''';
   DMFAC.cdsQry2.Close;
   DMFAC.cdsQry2.Filter:='';
   DMFAC.cdsQry2.IndexFieldNames:='';
   DMFAC.cdsQry2.DataRequest(xSQL);
   DMFAC.cdsQry2.Open;
   DMFAC.cdsQry2.IndexFieldNames:='SERIEID';
   dblcFSerie.LookupTable := DMFAC.cdsQry2;
   dblcFSerie.LookupField := 'SERIEID';
   //*
   dblcBSerie.Clear;
   dblcBSerie.Selected.Add('SERIEID'#9'12'#9'Serie');
   dblcBSerie.Selected.Add('SERIEDES'#9'12'#9'Descripción.');


   xSQL := ' SELECT SERIEID,SERIEDES FROM FAC103'
           +' WHERE FLAGV=''B''';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.Filter:='';
   DMFAC.cdsQry3.IndexFieldNames:='';
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   DMFAC.cdsQry3.IndexFieldNames:='SERIEID';
   dblcBSerie.LookupTable := DMFAC.cdsQry3;
   dblcBSerie.LookupField := 'SERIEID';

   xSQL := 'Select TVTAID, TVTADES, TVTAFLAG from FAC105';
   DMFAC.cdsQry5.Close;
   DMFAC.cdsQry5.Filter:='';
   DMFAC.cdsQry5.IndexFieldNames:='';
   DMFAC.cdsQry5.DataRequest(xSQL);
   DMFAC.cdsQry5.Open;
   dblcGSector.LookUpTable := DMFAC.cdsQry5;
   dblcGSector.LookUpField := 'TVTAID';
   dblcGSector.Selected.Clear;
   dblcGSector.Selected.Add('TVTAID'#9'2'#9'ID'#9'F');
   dblcGSector.Selected.Add('TVTADES'#9'20'#9'Zona'#9'F');

   dblcFSector.LookUpTable := DMFAC.cdsQry5;
   dblcFSector.LookUpField := 'TVTAID';
   dblcFSector.Selected.Clear;
   dblcFSector.Selected.Add('TVTAID'#9'2'#9'ID'#9'F');
   dblcFSector.Selected.Add('TVTADES'#9'20'#9'Zona'#9'F');

   dblcBSector.LookUpTable := DMFAC.cdsQry5;
   dblcBSector.LookUpField := 'TVTAID';
   dblcBSector.Selected.Clear;
   dblcBSector.Selected.Add('TVTAID'#9'2'#9'ID'#9'F');
   dblcBSector.Selected.Add('TVTADES'#9'20'#9'Zona'#9'F');
end;

procedure TFToolRepDocs.bbtnGPrintClick(Sender: TObject);
var
  //xNReg : integer;
  sSQL : string;
begin
  if xFiltraG then
  begin
    ppDBRepGuias.DataSource := GReporte.FMant.ds2;

    ppRepGuias.template.fileName := ExtractFilePath( application.ExeName ) +DMFAC.wRutaRpt+ '\GuiasEmitidas.rtm' ;

    GReporte.FMant.cds2.DisableControls;

    if GReporte.FMant.cds2.RecordCount= 0 then
    begin
      Showmessage('No se encontraron datos para imprimir');
      exit;
    end
    else
    begin
      ppRepGuias.template.LoadFromFile;
      pplblUser.caption  := DMFAC.wUsuario;
      pplblRango.caption := 'DEL '+ Datetostr(dbdtpGFecIni.DateTime)
                           + ' AL '+Datetostr(dbdtpGFecFin.DateTime);
      if length(dblcGSerie.text)>0 then
        pplblSerie.Caption := 'SERIE : '+dblcGSerie.text;

      if chkGSector.Checked then
        pplblGSector.Caption := 'TODOS'
      else
        pplblGSector.Caption := edtGSector.text;

      ppRepGuias.Print;

      if (xFlagGImp= True) then
      begin
        GReporte.FMant.cds2.First;

        while not GReporte.FMant.cds2.Eof do
        begin
          sSQL := 'UPDATE FAC303 SET GREMIMPREP=''S'''
                + ' WHERE SERIE='+Quotedstr(GReporte.FMant.cds2.fieldbyname('SERIE').AsString)
                + ' AND NGUIA='+Quotedstr(GReporte.FMant.cds2.fieldbyname('NGUIA').AsString)
                + ' AND CLIEID='+Quotedstr(GReporte.FMant.cds2.fieldbyname('CLIEID').AsString);
          try
            DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
          except
          end;
          GReporte.FMant.cds2.Next;
        end;
        ShowMessage('Reporte Impreso');
      end;
    end;
    GReporte.FMant.cds2.EnableControls;
  end
  else
    raise exception.Create('Filtre los datos para la consulta');
end;

procedure TFToolRepDocs.ppRepGuiasPrintingComplete(Sender: TObject);
begin
   xFlagGImp:= true;
end;

procedure TFToolRepDocs.dbdtpGFecFinExit(Sender: TObject);
begin
   if (dbdtpGFecIni.Date>dbdtpGFecFin.Date) then
    begin
       dbdtpGFecFin.Date := dbdtpGFecIni.Date;
       dbdtpGFecFin.setfocus;
       raise exception.Create('Error: Fecha Final debe ser mayor/igual'+#13+' a la Fecha de Inicio');
    end;

end;

procedure TFToolRepDocs.dbdtpFFecFinExit(Sender: TObject);
begin
   if (dbdtpFFecIni.Date>dbdtpFFecFin.Date) then
    begin
       dbdtpFFecFin.Date := dbdtpFFecIni.Date;
       dbdtpFFecFin.setfocus;
       raise exception.Create('Error: Fecha Final debe ser mayor/igual'+#13+' a la Fecha de Inicio');
    end;
end;

procedure TFToolRepDocs.dbdtpBFecFinExit(Sender: TObject);
begin
  if (dbdtpBFecIni.Date>dbdtpBFecFin.Date) then
  begin
    dbdtpBFecFin.Date := dbdtpBFecIni.Date;
    dbdtpBFecFin.setfocus;
      raise exception.Create('Error: Fecha Final debe ser mayor/igual'+#13+' a la Fecha de Inicio');
  end;
end;

procedure TFToolRepDocs.chkBTodosClick(Sender: TObject);
begin
  if chkBtodos.Checked = true then
  begin
    dblcBSerie.Enabled := false;
    dblcBSerie.Text    := '';
  end
  else
    dblcBSerie.Enabled := true;
end;

procedure TFToolRepDocs.chkFTodosClick(Sender: TObject);
begin
  if chkFtodos.Checked = true then
  begin
    dblcFSerie.Enabled := false;
    dblcFSerie.Text    := '';
  end
  else
    dblcFSerie.Enabled := true;
end;

procedure TFToolRepDocs.chkGTodosClick(Sender: TObject);
begin
  if chkGtodos.Checked = true then
  begin
    dblcGSerie.Enabled := false;
    dblcGSerie.Text    := '';
  end
  else
    dblcGSerie.Enabled := true;
end;

procedure TFToolRepDocs.bbtnFOkClick(Sender: TObject);
var
  xSQL,xSQL1,sFecha,sZona,sDesde,sHasta,xFact: string;
begin
  if dbdtpFFecIni.Date=0 then
  begin
    dbdtpFFecIni.SetFocus;
    Showmessage('Falta Fecha Inicial de Reporte');
    exit;
  end;
  if dbdtpFFecFin.Date=0 then
  begin
    dbdtpFFecFin.SetFocus;
    Showmessage('Falta Fecha Final de Reporte');
    exit;
  end;

  if (dbdtpFFecIni.Date>dbdtpFFecFin.Date) then
  begin
    dbdtpFFecFin.Date := dbdtpFFecIni.Date;
    dbdtpFFecFin.setfocus;
    raise exception.Create('Error: F.Final debe ser mayor/igual'+#13+' a la Fecha de Inicio');
  end;

  if (chkFtodos.Checked = false) then
  begin
    if length(dblcFSerie.Text)=0 then
    begin
      Showmessage('Falta Ingresar Serie');
      exit;
    end;
  end;

  if (chkFSector.Checked = false) then
  begin
    if length(dblcFSector.Text)=0 then
    begin
      Showmessage('Falta Ingresar Sector Comercial');
      exit;
    end;
  end;

  sFecha   :=quotedStr(formatdatetime(DMFAC.wFormatFecha,Date));
  sDesde   :=quotedStr(formatdatetime(DMFAC.wFormatFecha,dbdtpFFecIni.DateTime));
  sHasta   :=quotedStr(formatdatetime(DMFAC.wFormatFecha,dbdtpFFecFin.DateTime));
  xFact    :=DMFAC.BuscaQry('dspUltTGE','TGE110','DOCID','DOCMOD=''CXC'' AND DOCTIPREG=''F''','DOCID');

  if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
  begin
    ////   xSQL := 'SELECT A.FACFECHA FECHA,A.GUIASERIE SERIE,A.GUIANUM NGUIA , A.GUIASERIE||A.GUIANUM  NROGUIA, B.FACSERIE,B.NFAC,A.TIPVTAID,A.CIAID,A.VEID,'
    xSQL := 'SELECT A.FACFECHA FECHA,A.GUIASERIE SERIE,A.GUIANUM NGUIA , A.GUIASERIE||A.GUIANUM  NROGUIA, A.FACSERIE FACTURASERIE,A.NFAC FACTURANRO,A.TIPVTAID,A.CIAID,A.VEID,'
             +' A.FACSERIE||A.NFAC NROFACTURA,A.PEDIDO,A.CLIEID,A.CLIEDES,C.DCCOMDES FPAGO,'
             +' CASE WHEN FACESTADO=''ANULADO'' THEN ''DOC. ANULADO'' ELSE '''' END OBSERVACION,E.TVTADES'
             +' FROM FAC305 A LEFT JOIN FAC303 B ON (A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC)'
             +' LEFT JOIN TGE180 C ON(A.CIAID=C.CIAID AND A.TIPVTAID=C.SCOMERID AND A.FPAGOID=C.CCOMERID)'
             +' LEFT JOIN FAC105 E ON(A.TIPVTAID=E.TVTAID)'
             +' WHERE A.FACFECHA>='+sDesde
             +' AND A.FACFECHA<='+sHasta
             +' AND A.DOCID='+Quotedstr(xFact);
  end
  else
  if (DMFAC.SRV_D = 'ORACLE') then
  begin
    xSQL := 'SELECT A.FACFECHA FECHA, A.GUIASERIE SERIE, A.GUIANUM NGUIA, A.GUIASERIE||A.GUIANUM  NROGUIA, A.FACSERIE FACTURASERIE, '+
            'A.NFAC FACTURANRO, A.TIPVTAID, A.CIAID, A.VEID, A.FACSERIE||A.NFAC NROFACTURA, A.PEDIDO, A.CLIEID, A.CLIEDES, C.DCCOMDES FPAGO, '+
            'CASE WHEN FACESTADO=''ANULADO'' THEN ''DOC. ANULADO'' ELSE '''' END OBSERVACION, E.TVTADES '+
            'FROM FAC305 A, FAC303 B, TGE180 C, FAC105 E '+
            'WHERE A.FACFECHA>='+sDesde+' '+
            'AND A.FACFECHA<='+sHasta+' '+
            'AND A.DOCID='+Quotedstr(xFact)+' '+
            'AND A.FACSERIE=B.FACSERIE(+) AND A.NFAC=B.NFAC(+) '+
            'AND A.CIAID=C.CIAID(+) AND A.TIPVTAID=C.SCOMERID(+) AND A.FPAGOID=C.CCOMERID(+) '+
            'AND A.TIPVTAID=E.TVTAID(+)';
  end;

  if (chkFtodos.Checked= false) then
  begin
    if length(dblcFSerie.Text)>0 then
      xSQL := xSQL+ ' AND A.FACSERIE='+quotedstr(dblcfSerie.text);
  end;

  if chkFSector.checked then
     sZona:=''
  else
     sZona:=' AND A.TIPVTAID='+QuotedStr(dblcFSector.text);


  xSQL := xSQL+sZona+ ' ORDER BY A.FACFECHA, A.FACSERIE, A.NFAC';

  GReporte.UsuarioSQL.Clear;
  GReporte.UsuarioSQL.Add(xSQL) ;
  GReporte.NewQuery;
  sZona :='';

  if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
  begin
    xSQL1 :='SELECT A.CCFEMIS FECHA, '''' SERIE, '''' NGUIA, '''' NROGUIA, ' +
            'A.CCSERIE FACTURASERIE, A.CCNODOC FACTURANRO, A.TVTAID TIPVTAID, A.CIAID, A.VEID, '+
            'A.CCSERIE||A.CCNODOC NROFACTURA, A.CCPEDIDO PEDIDO, A.CLIEID, A.CLIEDES, B.DCCOMDES FPAGO, '+
            'CASE WHEN CCESTADO=''A'' THEN ''DOC. ANULADO'' ELSE D.CPTOABR END OBSERVACION,C.TVTADES '+
            'FROM CXC301 A '+
            'LEFT JOIN TGE180 B ON (A.CIAID=B.CIAID AND A.TVTAID=B.SCOMERID AND A.CCOMERID=B.CCOMERID) '+
            'LEFT JOIN FAC105 C ON (A.TVTAID=C.TVTAID) '+
            'INNER JOIN CXC208 D ON(A.CIAID=D.CIAID AND A.CCPTOTOT=D.CPTOCAB) '+
            'WHERE A.CCFEMIS>='+sDesde+' '+
            'AND A.CCFEMIS<='+sHasta+' '+
            'AND A.DOCID='+Quotedstr(xFact)+' '+
            'AND COALESCE(A.CCFLAGVTA,'''')<>''S''';
  end
  else
  if (DMFAC.SRV_D = 'ORACLE') then
  begin
    xSQL1 :='SELECT A.CCFEMIS FECHA, '''' SERIE, '''' NGUIA, '''' NROGUIA, '+
            'A.CCSERIE FACTURASERIE, A.CCNODOC FACTURANRO, A.TVTAID TIPVTAID, A.CIAID, A.VEID, '+
            'A.CCSERIE||A.CCNODOC NROFACTURA, A.CCPEDIDO PEDIDO, A.CLIEID, A.CLIEDES, B.DCCOMDES FPAGO, '+
            'CASE WHEN CCESTADO=''A'' THEN ''DOC. ANULADO'' ELSE D.CPTOABR END OBSERVACION, C.TVTADES '+
            'FROM CXC301 A, TGE180 B, FAC105 C, CXC208 D '+
            'WHERE A.CCFEMIS>='+sDesde+' '+
            'AND A.CCFEMIS<='+sHasta+' '+
            'AND A.DOCID='+Quotedstr(xFact)+' '+
            'AND NVL(A.CCFLAGVTA,'''')<>''S'' '+
            'AND A.CIAID=B.CIAID AND A.TVTAID=B.SCOMERID AND A.CCOMERID=B.CCOMERID '+
            'AND A.TVTAID=C.TVTAID '+
            'AND A.CIAID=D.CIAID AND A.CCPTOTOT=D.CPTOCAB';
  end;
  
  if (chkFtodos.Checked= false) then
  begin
    if length(dblcFSerie.Text)>0 then
       xSQL1 := xSQL1+ ' AND A.CCSERIE='+quotedstr(dblcfSerie.text);
  end;

  if chkFSector.checked then
    sZona:=''
  else
    sZona:=' AND A.TVTAID='+QuotedStr(dblcFSector.text);

  xSQL1 := xSQL1+sZona+ ' ORDER BY A.CCFEMIS, A.CCSERIE, A.CCNODOC';

  GReporte.FMant.cds2.Filtered := false;

  DMFAC.cdsQry7.Close;
  DMFAC.cdsQry7.DataRequest(xSQL1);
  DMFAC.cdsQry7.Open;
  if DMFAC.cdsQry7.RecordCount>0 then
  begin
    while not DMFAC.cdsQry7.Eof do
    begin
      GReporte.FMant.cds2.Insert;
      GReporte.FMant.cds2.FieldByName('FECHA').AsDatetime      := DMFAC.cdsQry7.FieldByName('FECHA').AsDatetime;
      GReporte.FMant.cds2.FieldByName('SERIE').AsString        := DMFAC.cdsQry7.FieldByName('SERIE').AsString;
      GReporte.FMant.cds2.FieldByName('NGUIA').AsString        := DMFAC.cdsQry7.FieldByName('NGUIA').AsString;
      GReporte.FMant.cds2.FieldByName('NROGUIA').AsString      := DMFAC.cdsQry7.FieldByName('NROGUIA').AsString;
      GReporte.FMant.cds2.FieldByName('FACTURASERIE').AsString := DMFAC.cdsQry7.FieldByName('FACTURASERIE').AsString;
      GReporte.FMant.cds2.FieldByName('FACTURANRO').AsString   := DMFAC.cdsQry7.FieldByName('FACTURANRO').AsString;
      GReporte.FMant.cds2.FieldByName('TIPVTAID').AsString     := DMFAC.cdsQry7.FieldByName('TIPVTAID').AsString;
      GReporte.FMant.cds2.FieldByName('CIAID').AsString        := DMFAC.cdsQry7.FieldByName('CIAID').AsString;
      GReporte.FMant.cds2.FieldByName('VEID').AsString         := DMFAC.cdsQry7.FieldByName('VEID').AsString;
      GReporte.FMant.cds2.FieldByName('NROFACTURA').AsString   := DMFAC.cdsQry7.FieldByName('NROFACTURA').AsString;
      GReporte.FMant.cds2.FieldByName('PEDIDO').AsString       := DMFAC.cdsQry7.FieldByName('PEDIDO').AsString;
      GReporte.FMant.cds2.FieldByName('CLIEID').AsString       := DMFAC.cdsQry7.FieldByName('CLIEID').AsString;
      GReporte.FMant.cds2.FieldByName('CLIEDES').AsString      := DMFAC.cdsQry7.FieldByName('CLIEDES').AsString;
      GReporte.FMant.cds2.FieldByName('FPAGO').AsString        := DMFAC.cdsQry7.FieldByName('FPAGO').AsString;
      GReporte.FMant.cds2.FieldByName('OBSERVACION').AsString  := DMFAC.cdsQry7.FieldByName('OBSERVACION').AsString;
      GReporte.FMant.cds2.FieldByName('TVTADES').AsString      := DMFAC.cdsQry7.FieldByName('TVTADES').AsString;
      GReporte.FMant.cds2.Post;
      DMFAC.cdsQry7.Next;
    end;
  end;

  if GReporte.FMant.cds2.RecordCount>0 then
  begin
    xFiltraF := true;
  end;
  GReporte.FMant.cds2.IndexFieldNames :='FECHA;FACTURASERIE;FACTURANRO';

  xFiltraG := false;
  xFiltraB := false;
end;

procedure TFToolRepDocs.bbtnFPrintClick(Sender: TObject);
begin
  if xFiltraF then
  begin
    ppDBRepFactura.DataSource := GReporte.FMant.ds2;
    ppRepFactura.template.fileName := ExtractFilePath( application.ExeName ) +DMFAC.wRutaRpt+ '\FacturasEmitidas.rtm' ;
    //xNReg:= GReporte.FMant.cds2.RecordCount;
    GReporte.FMant.cds2.DisableControls;
    if GReporte.FMant.cds2.RecordCount= 0 then
    begin
      Showmessage('No se encontraron datos para imprimir');
      exit;
    end
    else
    begin
      ppRepFactura.template.LoadFromFile;
      pplblUser.caption  := DMFAC.wUsuario;
      pplblFFEcha.caption := 'DEL '+Datetostr(dbdtpFFecIni.DateTime)
                           + ' AL '+Datetostr(dbdtpFFecFin.DateTime);
      if length(dblcFSerie.text)>0 then
        pplblFSerie.Caption := 'SERIE : '+dblcFSerie.text;

      if chkFSector.Checked then
        pplblFSector.Caption := 'TODOS'
      else
        pplblFSector.Caption := edtFSector.text;
      ppRepFactura.Print;
      {if (xFlagFImp= True) then begin
           DMFAC.cdsQry6.First;
           while not DMFAC.cdsQry6.Eof do begin
                 sSQL := 'UPDATE FAC303 SET GREMIMPREP=''S'''
                       + ' WHERE SERIE='+Quotedstr(DMFAC.cdsQry6.fieldbyname('SERIE').AsString)
                       + ' AND NGUIA='+Quotedstr(DMFAC.cdsQry6.fieldbyname('NGUIA').AsString);
                 try
                  DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
                 except
                 end;
                 DMFAC.cdsQry6.Next;
           end;
           ShowMessage('Reporte Impreso');
        end;}
    end;
    GReporte.FMant.cds2.EnableControls;
  end
  else
    raise exception.Create('Filtre los datos para la Consulta');
end;

procedure TFToolRepDocs.bbtnBOkClick(Sender: TObject);
var
  xSQL, sFecha, sZona, sDesde, sHasta, xBol : string;
begin
  if dbdtpBFecIni.Date=0 then
  begin
    dbdtpBFecIni.SetFocus;
    Showmessage('Falta Fecha Inicial de Reporte');
    exit;
  end;
  if dbdtpBFecFin.Date=0 then
  begin
    dbdtpBFecFin.SetFocus;
    Showmessage('Falta Fecha Final de Reporte');
    exit;
  end;

  if (dbdtpBFecIni.Date>dbdtpBFecFin.Date) then
  begin
    dbdtpBFecFin.Date := dbdtpBFecIni.Date;
    dbdtpBFecFin.setfocus;
    raise exception.Create('Error: F.Final debe ser mayor/igual'+#13+' a la Fecha de Inicio');
  end;

  if (chkBtodos.Checked = false) then
  begin
    if length(dblcBSerie.Text)=0 then
    begin
      Showmessage('Falta Ingresar Serie');
      exit;
    end;
  end;

  if (chkBSector.Checked = false) then
  begin
    if length(dblcBSector.Text)=0 then
    begin
      Showmessage('Falta Ingresar Sector Comercial');
      exit;
    end;
  end;

  sFecha   :=quotedStr(formatdatetime(DMFAC.wFormatFecha,Date));
  sDesde   :=quotedStr(formatdatetime(DMFAC.wFormatFecha,dbdtpBFecIni.DateTime));
  sHasta   :=quotedStr(formatdatetime(DMFAC.wFormatFecha,dbdtpBFecFin.DateTime));
  xBol     :=DMFAC.BuscaQry('dspUltTGE','TGE110','DOCID','DOCMOD=''CXC'' AND DOCTIPREG=''B''','DOCID');

	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
    //   xSQL := 'SELECT A.FACFECHA FECHA,A.GUIASERIE SERIE,A.GUIANUM NGUIA , A.GUIASERIE||A.GUIANUM  NROGUIA, B.FACSERIE,B.NFAC,A.TIPVTAID,A.CIAID,A.VEID,'
    xSQL:='SELECT A.FACFECHA FECHA, A.GUIASERIE SERIE, A.GUIANUM NGUIA, A.GUIASERIE||A.GUIANUM  NROGUIA, '+
          'A.FACSERIE FACTURASERIE, A.NFAC FACTURANRO, A.TIPVTAID, A.CIAID, A.VEID, '+
          'A.FACSERIE||A.NFAC NROFACTURA, A.PEDIDO, A.CLIEID, A.CLIEDES, C.DCCOMDES FPAGO, '+
          'CASE WHEN FACESTADO=''ANULADO'' THEN ''DOC. ANULADO'' ELSE '''' END OBSERVACION, E.TVTADES '+
          'FROM FAC305 A '+
          'LEFT JOIN FAC303 B ON (A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC) '+
          'LEFT JOIN TGE180 C ON (A.CIAID=C.CIAID AND A.TIPVTAID=C.SCOMERID AND A.FPAGOID=C.CCOMERID) '+
          'LEFT JOIN FAC105 E ON (A.TIPVTAID=E.TVTAID) '+
          'WHERE A.FACFECHA>='+sDesde+' '+
          'AND A.FACFECHA<='+sHasta+' '+
          'AND A.DOCID='+Quotedstr(xBol);
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
    xSQL:='SELECT A.FACFECHA FECHA, A.GUIASERIE SERIE, A.GUIANUM NGUIA, A.GUIASERIE||A.GUIANUM NROGUIA, '+
          'A.FACSERIE FACTURASERIE, A.NFAC FACTURANRO, A.TIPVTAID, A.CIAID, A.VEID, '+
          'A.FACSERIE||A.NFAC NROFACTURA, A.PEDIDO, A.CLIEID, A.CLIEDES, C.DCCOMDES FPAGO, '+
          'CASE WHEN FACESTADO=''ANULADO'' THEN ''DOC. ANULADO'' ELSE '''' END OBSERVACION, E.TVTADES '+
          'FROM FAC305 A, FAC303 B, TGE180 C, FAC105 E '+
          'WHERE A.FACFECHA>='+sDesde+' '+
          'AND A.FACFECHA<='+sHasta+' '+
          'AND A.DOCID(+)='+Quotedstr(xBol)+' '+
          'AND A.FACSERIE=B.FACSERIE(+) AND A.NFAC=B.NFAC(+) '+
          'AND A.CIAID=C.CIAID(+) AND A.TIPVTAID=C.SCOMERID(+) AND A.FPAGOID=C.CCOMERID(+) '+
          'AND A.TIPVTAID=E.TVTAID(+)';
  end;

  if (chkBtodos.Checked= false) then
  begin
    if length(dblcBSerie.Text)>0 then
      xSQL := xSQL+ ' AND A.FACSERIE='+quotedstr(dblcBSerie.text);
  end;

  if chkBSector.checked then
    sZona:=''
  else
    sZona:=' AND A.TIPVTAID='+QuotedStr(dblcBSector.text);
  {if (chkBLote.Checked= True) then
    xSQL := xSQL+ ' AND COALESCE(A.FACIMPREP,'''')=''S'' ';}
  //   xSQL := xSQL+sZona+ ' ORDER BY TVTADES,A.FACSERIE,A.NFAC';
  xSQL := xSQL+sZona+ ' ORDER BY A.FACFECHA, A.FACSERIE, A.NFAC';

  GReporte.FMant.cds2.IndexFieldNames :='';

  GReporte.UsuarioSQL.Clear;
  GReporte.UsuarioSQL.Add(xSQL) ;
  GReporte.NewQuery;
  if GReporte.FMant.cds2.RecordCount>0 then
  begin
    xFiltraB := true;
  end;
  xFiltraG := false;
  xFiltraF := false;
end;

procedure TFToolRepDocs.bbtnBPrintClick(Sender: TObject);
begin
  if xFiltraB then
  begin
    ppDBRepBoleta.DataSource := GReporte.FMant.ds2;
    ppRepBoleta.template.fileName := ExtractFilePath( application.ExeName ) +DMFAC.wRutaRpt+ '\BoletasEmitidas.rtm' ;
    //xNReg:= GReporte.FMant.cds2.RecordCount;
    GReporte.FMant.cds2.DisableControls;
    if GReporte.FMant.cds2.RecordCount= 0 then
    begin
      Showmessage('No se Encontraron Datos para Imprimir');
      exit;
    end
    else
    begin
      ppRepBoleta.template.LoadFromFile;
      pplblBUser.caption  := DMFAC.wUsuario;
      pplblBFecha.caption := 'DEL '+Datetostr(dbdtpBFecIni.DateTime)
                           + ' AL '+Datetostr(dbdtpBFecFin.DateTime);
      if length(dblcBSerie.text)>0 then
        pplblSerie.Caption := 'SERIE : '+dblcBSerie.text;

      if chkBSector.Checked then
        pplblBSector.Caption := 'TODOS'
      else
        pplblBSector.Caption := edtBSector.text;
      ppRepBoleta.Print;
      {if (xFlagFImp= True) then begin
           DMFAC.cdsQry6.First;
           while not DMFAC.cdsQry6.Eof do begin
                 sSQL := 'UPDATE FAC303 SET GREMIMPREP=''S'''
                       + ' WHERE SERIE='+Quotedstr(DMFAC.cdsQry6.fieldbyname('SERIE').AsString)
                       + ' AND NGUIA='+Quotedstr(DMFAC.cdsQry6.fieldbyname('NGUIA').AsString);
                 try
                  DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
                 except
                 end;
                 DMFAC.cdsQry6.Next;
           end;
           ShowMessage('Reporte Impreso');
        end;}
    end;
    GReporte.FMant.cds2.EnableControls;
  end
  else
    raise exception.Create('Filtre los datos para la Consulta');
end;

procedure TFToolRepDocs.chkFSectorClick(Sender: TObject);
begin
  if chkFSector.checked then
  begin
    dblcFSector.Text:='';
    edtFSector.Text:='';
    dblcFSector.enabled:=False;
    edtFSector.enabled:=False;
  end
  else
  begin
    dblcFSector.enabled:=True;
    edtFSector.enabled:=True;
  end;

end;

procedure TFToolRepDocs.dblcFSectorExit(Sender: TObject);
begin
  edtFSector.Text:=DMFAC.DisplayDescrip('FAC105','TVTADES','TVTAID',dblcFSector.Text);
  if edtFSector.text='' then
  begin
    Raise Exception.Create('Ingrese Sector Comercial');
  end;

end;

procedure TFToolRepDocs.dblcGSectorExit(Sender: TObject);
begin
  edtGSector.Text:=DMFAC.DisplayDescrip('FAC105','TVTADES','TVTAID',dblcGSector.Text);
  if edtGSector.text='' then
  begin
    Raise Exception.Create('Ingrese Sector Comercial');
  end;
end;

procedure TFToolRepDocs.chkGSectorClick(Sender: TObject);
begin
  if chkGSector.checked then
  begin
    dblcGSector.Text:='';
    edtGSector.Text:='';
    dblcGSector.enabled:=False;
    edtGSector.enabled:=False;
  end
  else
  begin
    dblcGSector.enabled:=True;
    edtGSector.enabled:=True;
  end;
end;

procedure TFToolRepDocs.dblcBSectorExit(Sender: TObject);
begin
  edtBSector.Text:=DMFAC.DisplayDescrip('FAC105','TVTADES','TVTAID',dblcBSector.Text);
  if edtBSector.text='' then
  begin
    Raise Exception.Create('Ingrese Sector Comercial');
  end;
end;

procedure TFToolRepDocs.bbtnVendedorClick(Sender: TObject);
var
  sZona,sSQL:string;
begin
  screen.Cursor := crHourGlass;
  if chkFSector.checked then
    sZona:=''
  else
    sZona:=' AND TIPVTAID='+QuotedStr(dblcFSector.text);

  if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
  begin
    sSQL:='SELECT F.VEID, V.VENOMBRES, F.FACFECHA, D.DOCABR, F.DOCID, F.FACSERIE||F.NFAC NFACTURA, '+
          'F.GUIASERIE||F.GUIANUM GUIA, F.PEDIDO, FPAGOID, P.DCCOMDES, F.CLIEID, F.CLIEDES, '+
          'F.TMONID, M.TMONABR, CASE WHEN FACESTADO=''ANULADO'' THEN ''ANULADO'' ELSE '''' END ESTADO, '+
          'CASE WHEN F.FACESTADO=''ACEPTADO'' THEN COALESCE(F.FACMTOMO,0) ELSE 0 END FACMTOMO '+
          'FROM FAC305 F '+
          'LEFT JOIN CXC203 V ON V.VEID=F.VEID AND V.CIAID=F.CIAID '+
          'LEFT JOIN TGE110 D ON D.DOCID=F.DOCID AND D.DOCMOD=''CXC'' '+
          'LEFT JOIN TGE180 P ON P.CIAID=F.CIAID AND P.CCOMERID=F.FPAGOID AND P.SCOMERID=F.TIPVTAID '+
          'LEFT JOIN TGE103 M ON M.TMONID=F.TMONID '+
          'WHERE FACFECHA BETWEEN '+DMFAC.wRepFuncDate+QuotedStr(FORMATDATETIME(DMFAC.wFormatFecha,dbdtpFFecIni.Date))+
          ') AND '+DMFAC.wRepFuncDate+QuotedStr(FORMATDATETIME(DMFAC.wFormatFecha,dbdtpFFecFin.Date))+')';
  end
  else
  if DMFAC.SRV_D = 'ORACLE' then
  begin
    sSQL:='SELECT F.VEID, V.VENOMBRES, F.FACFECHA, D.DOCABR, F.DOCID, F.FACSERIE||F.NFAC NFACTURA, '+
          'F.GUIASERIE||F.GUIANUM GUIA, F.PEDIDO, FPAGOID, P.DCCOMDES, F.CLIEID, F.CLIEDES, '+
          'F.TMONID, M.TMONABR, CASE WHEN FACESTADO=''ANULADO'' THEN ''ANULADO'' ELSE '''' END ESTADO, '+
          'CASE WHEN F.FACESTADO=''ACEPTADO'' THEN NVL(F.FACMTOMO,0) ELSE 0 END FACMTOMO '+
          'FROM FAC305 F, CXC203 V, TGE110 D, TGE180 P, TGE103 M '+
          'WHERE FACFECHA BETWEEN '+DMFAC.wRepFuncDate+QuotedStr(FormatDateTime(DMFAC.wFormatFecha,dbdtpFFecIni.Date))+
          ') AND '+DMFAC.wRepFuncDate+QuotedStr(FormatDateTime(DMFAC.wFormatFecha,dbdtpFFecFin.Date))+') '+
          'AND V.VEID=F.VEID AND V.CIAID=F.CIAID '+
          'AND D.DOCID=F.DOCID AND D.DOCMOD=''CXC'' '+
          'AND P.CIAID=F.CIAID AND P.CCOMERID=F.FPAGOID AND P.SCOMERID=F.TIPVTAID '+
          'AND M.TMONID=F.TMONID';
  end;

  sSQL := sSQL+sZona+' ORDER BY F.VEID, F.FACSERIE, NFACTURA';
  DMFAC.cdsQry4.IndexFieldNames :='';
  DMFAC.cdsQry4.Filter :='';
  DMFAC.cdsQry4.Close;
  DMFAC.cdsQry4.DataRequest(sSQL);
  DMFAC.cdsQry4.Open;
  dbpReporte.DataSource:=DMFAC.dsQry4;

  if DMFAC.cdsQry3.RecordCount=0 then
  begin
    screen.Cursor := crDefault;
    Raise Exception.Create('No hay datos que mostras');
  end;

  ppReporte.template.fileName := ExtractFilePath( application.ExeName ) +DMFAC.wRutaRpt+ '\RepEmi.rtm' ;
  ppReporte.template.LoadFromFile;

  pplPeriodo.caption:='DEL '+DateToStr(dbdtpFFecIni.date)+' AL '+DateToStr(dbdtpFFecFin.date);

  if chkFSector.checked then
    pplZona.caption:='DE LIMA Y PROVINCIAS'
  else
    pplZona.caption:='DE '+edtFSector.text;

  screen.Cursor := crDefault;
  ppReporte.print;
  //ppDesigner1.Show;
end;

procedure TFToolRepDocs.chkBSectorClick(Sender: TObject);
begin
  if chkBSector.checked then
  begin
    dblcBSector.Text:='';
    edtBSector.Text:='';
    dblcBSector.enabled:=False;
    edtBSector.enabled:=False;
  end
  else
  begin
    dblcBSector.enabled:=True;
    edtBSector.enabled:=True;
  end;
end;

procedure TFToolRepDocs.bbtnPedVendedorClick(Sender: TObject);
var
  xSQL, sVeid, sDesde, sHasta, sZona : string;
begin
  if dbdtpGFecIni.Date=0 then
    raise exception.Create('Falta Fecha de Inicio!!!');
  if dbdtpGFecFin.Date=0 then
    raise exception.Create('Falta Fecha Final!!!');

  if (dbdtpGFecIni.Date>dbdtpGFecFin.Date) then
  begin
    dbdtpGFecFin.Date := dbdtpGFecIni.Date;
    dbdtpGFecFin.setfocus;
    raise exception.Create('Error: Fecha Final debe ser mayor/igual'+#13+' a la Fecha de Inicio');
  end;

  if (chkGSector.Checked = false) then
  begin
    if length(dblcGSector.Text)=0 then
    begin
      Showmessage('Falta Ingresar Sector Comercial');
      exit;
    end;
  end;

  Screen.Cursor:=crHourGlass;
	sVeid := DMFAC.BuscaQry('dspUltTGE','CXC203','VEID','VEFCORP='+quotedstr('S'),'VEID');
  sDesde := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dbdtpGFecIni.Date) );
  sHasta := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dbdtpGFecFin.Date) );

	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
    xSQL := 'SELECT P.PEDIDO, P.VEID, V.VENOMBRES, P.CLIEID, P.CLIEDES, Z.ZVTADES, P.PEDFECHA, G.GREMFECHA, '+
            'P.PEDESTADO, P.PEDSIT, G.SERIENGUIA, G.TMONID, G.GREMMTOMO '+
            'FROM FAC301 P '+
            'LEFT JOIN FAC303 G ON P.PEDIDO=G.PEDIDO AND P.CLIEID=G.CLIEID '+
            'LEFT JOIN FAC106 Z ON P.ZONVTAID=Z.ZVTAID '+
            'LEFT JOIN CXC203 V ON V.VEID=P.VEID '+
            'WHERE  P.PEDFECHA>='+sDesde+' '+
            'AND P.PEDFECHA<='+sHasta;
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
    xSQL := 'SELECT P.PEDIDO, P.VEID, V.VENOMBRES, P.CLIEID, P.CLIEDES, Z.ZVTADES, P.PEDFECHA, G.GREMFECHA, '+
            'P.PEDESTADO, P.PEDSIT, G.SERIENGUIA, G.TMONID, G.GREMMTOMO '+
            'FROM FAC301 P, FAC303 G, FAC106 Z, CXC203 V '+
            'WHERE  P.PEDFECHA>='+sDesde+' '+
            'AND P.PEDFECHA<='+sHasta+' '+
            'AND P.PEDIDO=G.PEDIDO AND P.CLIEID=G.CLIEID '+
            'AND P.ZONVTAID=Z.ZVTAID '+
            'AND V.VEID=P.VEID';
  end;
  if chkGSector.checked then
    sZona:=''
  else
    sZona:=' AND P.TIPVTAID='+QuotedStr(dblcGSector.text);

  xSQL := xSQL+sZona+' ORDER BY P.VEID, P.PEDIDO';
  DMFAC.cdsQry4.IndexFieldNames :='';
  DMFAC.cdsQry4.Filter:='';
  DMFAC.cdsQry4.Close;
  DMFAC.cdsQry4.DataRequest(xSQL);
  DMFAC.cdsQry4.Open;
  if DMFAC.cdsQry4.RecordCount=0 then
  begin
    screen.Cursor := crDefault;
    raise exception.Create('No se Encontraron Datos para Imprimir');
  end;

  ppDBPedVendedor.DataSource := DMFAC.dsQry4;
  pprRPedVendedor.template.fileName := ExtractFilePath( application.ExeName ) +DMFAC.wRutaRpt+ '\PedidosxVendedor.rtm' ;
  pprRPedVendedor.template.LoadFromFile;
  pplblPUser.caption := DMFAC.wUsuario;
  pplblDesde.caption := Datetostr(dbdtpGFecIni.DateTime);
  pplblHasta.caption := Datetostr(dbdtpGFecFin.DateTime);

  if chkGSector.Checked then
    pplblZona.Caption := 'TODOS'
  else
    pplblZona.Caption := edtGSector.text;

  pprRPedVendedor.Print;
  pprRPedVendedor.Stop;
  screen.Cursor := crDefault;
end;

procedure TFToolRepDocs.bbtnPedRechazadoClick(Sender: TObject);
var
   xSQL,sVeid,sDesde,sHasta,sZona : string;
begin
  {Showmessage('En construcción....')
  exit;}
  if dbdtpGFecIni.Date=0 then
    raise exception.Create('Falta Fecha de Inicio!!!');
  if dbdtpGFecFin.Date=0 then
    raise exception.Create('Falta Fecha Final!!!');

  if (dbdtpGFecIni.Date>dbdtpGFecFin.Date) then
  begin
    dbdtpGFecFin.Date := dbdtpGFecIni.Date;
    dbdtpGFecFin.setfocus;
    raise exception.Create('Error: Fecha Final debe ser mayor/igual'+#13+' a la Fecha de Inicio');
  end;

  if (chkGSector.Checked = false) then
  begin
    if length(dblcGSector.Text)=0 then
    begin
      Showmessage('Falta Ingresar Sector Comercial');
      exit;
    end;
  end;

  Screen.Cursor:=crHourGlass;
	sVeid := DMFAC.BuscaQry('dspUltTGE','CXC203','VEID','VEFCORP='+quotedstr('S'),'VEID');
  sDesde := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dbdtpGFecIni.Date) );
  sHasta := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dbdtpGFecFin.Date) );

	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
    xSQL := 'SELECT P.VEID, V.VENOMBRES, P.PEDIDO, P.PEDFECHA, P.CLIEID, P.CLIERUC, P.CLIEDES, P.PEDSIT, '+
            'CASE WHEN H.HOJTSOLCXC=''S'' AND H.HOJTVBCXC=''N'' THEN ''S'' ELSE '+
            'CASE WHEN H.HOJTSOLCXC=''S'' AND H.HOJTVBCXC=''S'' THEN ''N'' ELSE ''N'' END END INTCXC, '+
            'CASE WHEN H.HOJTSOLLOG=''S'' AND H.HOJTVBLOG=''N'' THEN ''S'' ELSE '+
            'CASE WHEN H.HOJTSOLLOG=''S'' AND H.HOJTVBLOG=''S'' THEN ''N'' ELSE ''N'' END END INTLOG, '+
            'H.HOJOBS OBSERVACION '+
            'FROM FAC301 P '+
            'LEFT JOIN FAC309 H ON P.CIAID=H.CIAID AND P.PEDIDO=H.PEDIDO '+
            'LEFT JOIN CXC203 V ON V.CIAID=P.CIAID AND V.VEID=P.VEID '+
            'WHERE (P.PEDSIT=''INTERRUMPIDO'' OR P.PEDSIT=''DEVUELTO'') '+
            'AND P.PEDFECHA>='+sDesde+' '+
            'AND P.PEDFECHA<='+sHasta;
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
    xSQL := 'SELECT P.VEID, V.VENOMBRES, P.PEDIDO, P.PEDFECHA, P.CLIEID, P.CLIERUC, P.CLIEDES, P.PEDSIT, '+
            'CASE WHEN H.HOJTSOLCXC=''S'' AND H.HOJTVBCXC=''N'' THEN ''S'' ELSE '+
            'CASE WHEN H.HOJTSOLCXC=''S'' AND H.HOJTVBCXC=''S'' THEN ''N'' ELSE ''N'' END END INTCXC, '+
            'CASE WHEN H.HOJTSOLLOG=''S'' AND H.HOJTVBLOG=''N'' THEN ''S'' ELSE '+
            'CASE WHEN H.HOJTSOLLOG=''S'' AND H.HOJTVBLOG=''S'' THEN ''N'' ELSE ''N'' END END INTLOG, '+
            'H.HOJOBS OBSERVACION '+
            'FROM FAC301 P, FAC309 H, CXC203 V '+
            'WHERE (P.PEDSIT=''INTERRUMPIDO'' OR P.PEDSIT=''DEVUELTO'') '+
            'AND P.PEDFECHA>='+sDesde+' '+
            'AND P.PEDFECHA<='+sHasta+' '+
            'AND P.CIAID=H.CIAID AND P.PEDIDO=H.PEDIDO '+
            'AND V.CIAID=P.CIAID AND V.VEID=P.VEID';
  end;
  if chkGSector.checked then
     sZona:=''
  else
     sZona:=' AND P.TIPVTAID='+QuotedStr(dblcGSector.text);

  xSQL := xSQL+sZona+' ORDER BY P.VEID,P.PEDIDO';
  DMFAC.cdsQry4.IndexFieldNames :='';
  DMFAC.cdsQry4.Filter:='';
  DMFAC.cdsQry4.Close;
  DMFAC.cdsQry4.DataRequest(xSQL);
  DMFAC.cdsQry4.Open;
  if DMFAC.cdsQry4.RecordCount=0 then
  begin
    screen.Cursor := crDefault;
    raise exception.Create('No se encontraron datos para imprimir');
  end;

  ppDBPedRechazado.DataSource := DMFAC.dsQry4;
  pprPedRechazado.template.fileName := ExtractFilePath( application.ExeName ) +DMFAC.wRutaRpt+ '\PedidosRechazados.rtm' ;
  pprPedRechazado.template.LoadFromFile;
  pplblPRUser.caption  := DMFAC.wUsuario;
  pplblPRDesde.caption := Datetostr(dbdtpGFecIni.DateTime);
  pplblPRHasta.caption := Datetostr(dbdtpGFecFin.DateTime);

  if chkGSector.Checked then
    pplblPRSector.Caption := 'TODOS'
  else
    pplblPRSector.Caption := edtGSector.text;

  pprPedRechazado.Print;
  pprPedRechazado.Stop;
  screen.Cursor := crDefault;
end;

procedure TFToolRepDocs.Timer1Timer(Sender: TObject);
begin
 {  FVariables.w_NombreForma := 'FToolRepDocs';}
// Inicio HPC_201311_FAC
// incluye al usuario de tipo administrador en el destroy del timer
{
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolRepDocs);
      xAccesoBotones := True;
   end;
}
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then
   else
   begin
      if not xAccesoBotones then
      begin
         DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolRepDocs);
         xAccesoBotones := True;
      end;
   end;
// Fin HPC_201311_FAC
   Timer1.Destroy;
end;

procedure TFToolRepDocs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMFAC.cdsQry4.Close;
end;

end.

