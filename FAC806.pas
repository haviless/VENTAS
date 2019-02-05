unit FAC806;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, wwdblook, ppEndUsr,
  ppBands, ppCache, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DB, ppCtrls, ppVar, ppPrnabl, ppParameter, Mask, wwdbedit,
  Wwdbdlg, Grids, DBGrids;

type
  TFVentaUtilidad = class(TForm)
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Rango: TGroupBox;
    Label1: TLabel;
    dtpInicio: TwwDBDateTimePicker;
    Label3: TLabel;
    dtpFin: TwwDBDateTimePicker;
    bbtnRep2: TBitBtn;
    gbOpc: TGroupBox;
    Label6: TLabel;
    dblcLinCom: TwwDBLookupCombo;
    Edit1: TEdit;
    ppdb1: TppDBPipeline;
    ppr1: TppReport;
    ppd1: TppDesigner;
    ppParameterList1: TppParameterList;
    gbOpciones: TGroupBox;
    Label34: TLabel;
    dblcdServicio: TwwDBLookupComboDlg;
    dbeServicios: TwwDBEdit;
    ppHeaderBand2: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppDBText12: TppDBText;
    ppLabel18: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel19: TppLabel;
    ppDBText16: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    bbtnExcel1: TBitBtn;
    dtgData: TDBGrid;
    cbDiseno: TCheckBox;
    procedure bbtnRep2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTInvEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcdServicioExit(Sender: TObject);
    procedure bbtnExcel1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVentaUtilidad: TFVentaUtilidad;

implementation

{$R *.dfm}

uses FacDM, oaVE3000;

procedure TFVentaUtilidad.bbtnRep2Click(Sender: TObject);
var
   x10: integer;
   xSQL : String;
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
   {
   if dblcdServicio.text='' then
   begin
      dblcdServicio.SetFocus;
      Raise Exception.Create('Ingrese Código del Servicio');
   end;
   }
	 Screen.Cursor:=crHourGlass;

   xSQL:='select A.CIAID, A.FACFECHA, A.DOCID, H.DOCDES, A.FACSERIE, '
        +  'A.NFAC, B.ARTID, B.ARTDES, A.TINID TIPO_INVENTARIO, '
        +  'CASE WHEN A.TINID=''00'' THEN ''CONC'' ELSE ''ALM'' END TIPO_VENTA, '
        +  'B.GRARID ART_GRUPO, B.FAMID ART_FAMILIA, B.SFAMID ART_SUBFAMILIA, '
        +  'D.PROV, E.PROVDES, A.CLAUXID, A.CLIEID, A.CLIEDES, '
        +  'A.OFDESID, F.OFDESNOM, A.FPAGOID, G.DCCOMDES, '
        +  'CASE WHEN A.FACESTADO=''ANULADO'' THEN ''ANU'' ELSE ''OK'' END FACESTADO, '
        +  'A.TIPOADQ, DFACIMP1, DFACDCTO, A.TMONID MONEDA_VENTA, M.NISAFREG FEC_ULT_COMPRA, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN B.DFACCANTG ELSE 0 END CANT_VEND, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN C.ARTPCG ELSE 0 END COSTO_UNI, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN ROUND( B.DFACCANTG * C.ARTPCG,2 ) ELSE 0 END COSTO_TOT, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN B.DFACPREUMN ELSE 0 END PRE_UNI, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN B.DFACDTOMN2 ELSE 0 END DCTO_VTA, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN B.DFACMTOMN ELSE 0 END SUBTOTAL, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN B.DFACVTOTMN ELSE 0 END TOTAL_VENTA, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN NVL(B.DFACMTOMN-ROUND( B.DFACCANTG * C.ARTPCG,2 ),0) ELSE 0 END  UTILIDAD, '
        +  '''DESDE '+dtpInicio.Text+' HASTA '+dtpFin.Text+''' RANGO, '
        +  ''''+edtCia.Text+''' CIADES '
        +'From FAC305 A, ' //--CABECERA DE FACTURA/BOLETA
        +     'FAC306 B, ' //--DETALLE DE FACTURA/BOLETA
        +     'LOG315 C, ' //--NOTA DE SALIDA COSTO
        +     'TGE205 D, '//--MAESTRO DE ARTICULOS
        +     'TGE201 E, '//--MAESTRO DE PROVEEDORES
        +     'APO110 F, '//--MAESTRO DE OFIDES
        +     'TGE180 G, '//--MAESTRO DE TIPO DE VENTA
        +     'TGE110 H, '//--MAESTRO DE TIPO DE DOCUMENTOS
        +   '( SELECT DD.CIAID, DD.ARTID, MAX(CC.NISAFREG) NISAFREG '
        +     'FROM LOG315 DD, LOG314 CC '
        +     'WHERE DD.CIAID='+QuotedStr(dblcCia.text)+' and DD.NISATIP=''INGRESO'' '
        +       'and DD.TRIID IN (''01'',''02'',''09'',''11'',''16'') and DD.NISSIT=''ACEPTADO'' '
        +       'and DD.CIAID=CC.CIAID AND DD.NISATIP=CC.NISATIP AND DD.NISAID=CC.NISAID '
        +       'GROUP BY DD.CIAID, DD.ARTID ) M '
        +'WHERE A.CIAID='+QuotedStr(dblcCia.text)+' '
        +  'AND A.FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''''+') '
        +  'AND A.FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)+''''+') '
        +  'AND A.FACESTADO IN (''ACEPTADO'',''ANULADO'') '
        +  'AND A.CIAID=B.CIAID(+) AND A.DOCID=B.DOCID(+) AND A.FACSERIE=B.FACSERIE(+) '
        +  'AND A.NFAC=B.NFAC(+) '
        +  'AND B.CIAID=C.CIAID(+) AND B.ALMID=C.ALMID(+) AND C.NISATIP(+)=''SALIDA'' '
        +  'AND CASE WHEN B.FACFECHA>=''22/02/2008'' THEN B.DOCID ELSE '''' END||B.FACSERIE||B.NFAC=C.NISAID(+) AND B.ARTID=C.ARTID(+) '
        +  'AND B.CIAID=D.CIAID(+) AND B.TINID=D.TINID(+) AND B.ARTID=D.ARTID(+) '
        +  'AND E.CLAUXID(+)=''P'' AND D.PROV=E.PROV(+) '
        +  'AND A.OFDESID=F.OFDESID(+) '
        +  'AND A.CIAID=G.CIAID(+) AND A.TIPVTAID=G.SCOMERID(+) AND A.FPAGOID=CCOMERID(+) '
        +  'AND A.DOCID=H.DOCID(+) '
        +  'and B.ARTID=M.ARTID(+) '
        +'ORDER BY A.FACFECHA, A.DOCID, A.FACSERIE, A.NFAC';
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

   ppdb1.DataSource :=DMFAC.dsQry3;
   ppR1.DataPipeline:=ppdb1;
   ppR1.TEMPLATE.FileName:=ExtractFilePath(application.ExeName)+DMFAC.wRutaRpt+'\VentaUtilidad.rtm';
   ppR1.template.LoadFromFile;

	 Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
      ppd1.showmodal
   else
      ppR1.Print;

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

procedure TFVentaUtilidad.FormCreate(Sender: TObject);
var
   xSQL : String;
begin

  DMFAC.cdsQry3.Close;

  dblcCia.LookupTable      := DMFAC.cdsCia;
  //dblcdServicio.LookupTable:= DMFAC.cdsRepo2;

  dblcCia.Enabled:=True;
 { if DMFAC.cdsCia.RecordCount=1 then
  begin
     dblcCia.Enabled:=False;
     xSQL:='Select CIAID, ARTID, ARTDES from TGE205 where CIAID='''+DMFAC.cdsCia.FieldByName('CIAID').AsString+''' AND CONCESION=''S''';
     DMFAC.cdsRepo2.Close;
     DMFAC.cdsRepo2.DataRequest( xSQL );
     DMFAC.cdsRepo2.Open;
  end; }

  dtpInicio.Date:=Date;
  dtpFin.Date   :=Date;
  dblcCia.Text :=DMFAC.cdsCia.FieldByName('CIAID').AsString;
  edtCia.Text  :=DMFAC.cdsCia.FieldByName('CIADES').AsString;
end;

procedure TFVentaUtilidad.dblcCiaExit(Sender: TObject);
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
   edtCia.Text:=DMFAC.cdsCia.FieldByName('CIADES').AsString;

 { xSQL:='Select CIAID, ARTID, ARTDES from TGE205 where CIAID='''+dblcCia.Text+''' AND CONCESION=''S''';
  DMFAC.cdsRepo2.Close;
  DMFAC.cdsRepo2.DataRequest( xSQL );
  DMFAC.cdsRepo2.Open;}
end;

procedure TFVentaUtilidad.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFVentaUtilidad.dblcTInvEnter(Sender: TObject);
begin
  if edtCia.Text='' then dblcCia.SetFocus;
end;

procedure TFVentaUtilidad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMFAC.cdsQry12.IndexFieldNames:='';
end;

procedure TFVentaUtilidad.dblcdServicioExit(Sender: TObject);
begin
   if dblcdServicio.Text<>'' then
      dbeServicios.Text:= DMFAC.cdsRepo2.FieldByName('ARTDES').AsString
   else
      dbeServicios.Text:= '';
end;

procedure TFVentaUtilidad.bbtnExcel1Click(Sender: TObject);
var
   xSQL : String;
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
   // sar 2008-JC-0074   /   DAD-HN-2008-10-0013
   xSQL:='select A.CIAID, A.FACFECHA, A.DOCID, H.DOCDES, A.FACSERIE, '
        +  'A.NFAC, B.ARTID, B.ARTDES, A.TINID TIPO_INVENTARIO, '
        +  'CASE WHEN A.TINID=''00'' THEN ''CONC'' ELSE ''ALM'' END TIPO_VENTA, '
        +  'B.GRARID ART_GRUPO, B.FAMID ART_FAMILIA, B.SFAMID ART_SUBFAMILIA, '
        +  'CASE WHEN A.FACESTADO=''ANULADO'' THEN ''ANU'' ELSE ''OK'' END FACESTADO, '
        +  'A.TIPOADQ, A.TMONID MONEDA_VENTA, M.NISAFREG FEC_ULT_COMPRA, '
        +  'D.PROV, E.PROVDES, D.MARCA MARCA_ID, MARDES MARCA_NOMBRE, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN B.DFACCANTG ELSE 0 END CANT_VEND, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN C.ARTPCG ELSE 0 END COSTO_UNI, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN ROUND( B.DFACCANTG * C.ARTPCG,2 ) ELSE 0 END COSTO_TOT, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN B.DFACPREUMN ELSE 0 END PRE_UNI, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN B.DFACDTOMN2 ELSE 0 END DCTO_VTA, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN B.DFACMTOMN ELSE 0 END SUBTOTAL, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN B.DFACVTOTMN ELSE 0 END TOTAL_VENTA, '
        +  'CASE WHEN FACESTADO=''ACEPTADO'' THEN NVL(B.DFACMTOMN-ROUND( B.DFACCANTG * C.ARTPCG,2 ),0) ELSE 0 END  UTILIDAD, '
        +  '''DESDE '+dtpInicio.Text+' HASTA '+dtpFin.Text+''' RANGO, '
        +  ''''+edtCia.Text+''' CIADES '
        +'From FAC305 A, '     //--CABECERA DE FACTURA/BOLETA
        +     'FAC306 B, '     //--DETALLE DE FACTURA/BOLETA
        +     'LOG315 C, '     //--NOTA DE SALIDA COSTO
        +     'TGE205 D, '     //--MAESTRO DE ARTICULOS
        +     'TGE201 E, '     //--MAESTRO DE PROVEEDORES
        +     'ALM_MAR_ART T, '// MARCAR DE ARTICULO
        +     'APO110 F, '     //--MAESTRO DE OFIDES
        +     'TGE180 G, '     //--MAESTRO DE TIPO DE VENTA
        +     'TGE110 H, '     //--MAESTRO DE TIPO DE DOCUMENTOS
        +   '( SELECT DD.CIAID, DD.ARTID, MAX(CC.NISAFREG) NISAFREG '
        +     'FROM LOG315 DD, LOG314 CC '
        +     'WHERE DD.CIAID='+QuotedStr(dblcCia.text)+' and DD.NISATIP=''INGRESO'' '
        +       'and DD.TRIID IN (''01'',''02'',''09'',''11'',''16'') and DD.NISSIT=''ACEPTADO'' '
        +       'and DD.CIAID=CC.CIAID AND DD.NISATIP=CC.NISATIP AND DD.NISAID=CC.NISAID '
        +       'GROUP BY DD.CIAID, DD.ARTID ) M '
        +'WHERE A.CIAID='+QuotedStr(dblcCia.text)+' '
        +  'AND A.FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''''+') '
        +  'AND A.FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)+''''+') '
        +  'AND A.FACESTADO IN (''ACEPTADO'',''ANULADO'') '
        +  'AND A.CIAID=B.CIAID(+) AND A.DOCID=B.DOCID(+) AND A.FACSERIE=B.FACSERIE(+) '
        +  'AND A.NFAC=B.NFAC(+) '
        +  'AND B.CIAID=C.CIAID(+) AND B.ALMID=C.ALMID(+) AND C.NISATIP(+)=''SALIDA'' '
        +  'AND CASE WHEN B.FACFECHA>=''22/02/2008'' THEN B.DOCID ELSE '''' END||B.FACSERIE||B.NFAC=C.NISAID(+) AND B.ARTID=C.ARTID(+) '
        +  'AND B.CIAID=D.CIAID(+) AND B.TINID=D.TINID(+) AND B.ARTID=D.ARTID(+) '
        +  'AND E.CLAUXID(+)=''P'' AND D.PROV=E.PROV(+) '
        +  'AND A.OFDESID=F.OFDESID(+) '
        +  'AND A.CIAID=G.CIAID(+) AND A.TIPVTAID=G.SCOMERID(+) AND A.FPAGOID=CCOMERID(+) '
        +  'AND A.DOCID=H.DOCID(+) '
        +  'and B.ARTID=M.ARTID(+) '
        +  'and D.MARCA=T.MARCA(+) '
        +'ORDER BY A.FACFECHA, A.DOCID, A.FACSERIE, A.NFAC';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;

	 Screen.Cursor:=crDefault;

   dtgData.DataSource:=DMFAC.dsQry3;

   If DMFAC.cdsQry3.RecordCount > 0 Then
   begin
      try
         DMFAC.HojaExcel('VENTAS',DMFAC.dsQry3, dtgData);
      except
         		on Ex: Exception do
          			Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
      end;
   end
   else
      MessageDlg('No existe información para esta Consulta ', mtInformation,[mbOk],0);
end;

procedure TFVentaUtilidad.FormShow(Sender: TObject);
begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));
end;

end.
