unit FAC804;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, wwdblook, ppEndUsr,
  ppBands, ppCache, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DB, ppCtrls, ppVar, ppPrnabl, ppParameter, Mask, wwdbedit,
  Wwdbdlg, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid;

type
  TFVentaPorUsuario = class(TForm)
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Rango: TGroupBox;
    Label1: TLabel;
    dtpInicio: TwwDBDateTimePicker;
    Label3: TLabel;
    dtpFin: TwwDBDateTimePicker;
    gbOpc: TGroupBox;
    Label6: TLabel;
    dblcLinCom: TwwDBLookupCombo;
    Edit1: TEdit;
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
    Label34: TLabel;
    dblcdServicio: TwwDBLookupComboDlg;
    dbeServicios: TwwDBEdit;
    BitBtn1: TBitBtn;
    bbtnRep2: TBitBtn;
    Label4: TLabel;
    dblcdVendedor: TwwDBLookupComboDlg;
    dbeVendedores: TwwDBEdit;
    BBtnRptVendedores: TBitBtn;
    ppr2: TppReport;
    ppParameterList2: TppParameterList;
    ppd2: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppDBText5: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel39: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText22: TppDBText;
    ppLabel40: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel41: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppLabel42: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBText23: TppDBText;
    ppDBCalc9: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel43: TppLabel;
    ppDBText24: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDB2: TppDBPipeline;
    bbtnRepN1: TBitBtn;
    bbtnRepN2: TBitBtn;
    Label5: TLabel;
    dblcTienda: TwwDBLookupCombo;
    edtTienda: TEdit;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    cbLiq: TCheckBox;
    bbtnExcUsu: TBitBtn;
    dbgExp: TwwDBGrid;
    bbtnExcVen: TBitBtn;
    cbDiseno: TCheckBox;
    procedure bbtnRep2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTInvEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure dblcdServicioEnter(Sender: TObject);
    procedure dblcdVendedorExit(Sender: TObject);
    procedure dblcdServicioChange(Sender: TObject);
    procedure dblcdVendedorChange(Sender: TObject);
    procedure BBtnRptVendedoresClick(Sender: TObject);
    procedure bbtnRepN1Click(Sender: TObject);
    procedure bbtnRepN2Click(Sender: TObject);
    procedure dblcTiendaExit(Sender: TObject);
    procedure dblcTiendaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dtpInicioExit(Sender: TObject);
    procedure cbLiqClick(Sender: TObject);
    procedure bbtnExcUsuClick(Sender: TObject);
    procedure bbtnExcVenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure cargarUsuarios(ICiaID:string);
    procedure cargarVendedores(ICiaID:string);
    procedure SQL_Venta_por_Usuario;
    procedure SQL_Venta_por_Vendedor;
    function isDxsValidos(ITipo:string='USUARIOS'):boolean;
  public
    { Public declarations }
  end;

var
  FVentaPorUsuario: TFVentaPorUsuario;

implementation

{$R *.dfm}

uses FacDM, oaVE3000;

(******************************************************************************)
procedure TFVentaPorUsuario.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

(******************************************************************************)
procedure TFVentaPorUsuario.dblcTInvEnter(Sender: TObject);
begin
  if edtCia.Text='' then dblcCia.SetFocus;
end;

(******************************************************************************)
procedure TFVentaPorUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMFAC.cdsQry12.IndexFieldNames:='';
   DMFAC.cdsRepo2.Close;
   DMFAC.cdsRepo3.Close;
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry17.Close;
end;

(******************************************************************************)
procedure TFVentaPorUsuario.dblcdServicioEnter(Sender: TObject);
begin
   if dblcCia.Text='' then
   begin
      ShowMessage('Debe Elegir la Compañía');
      dblcCia.SetFocus;
      Exit;
   end;
end;

(******************************************************************************)
(******************************************************************************)
(******************************************************************************)
procedure TFVentaPorUsuario.cargarUsuarios(ICiaID:string);
var xSQL: string;
begin
   xSQL:= '  select FACUSER, B.USERNOM from ( '
         +'  Select FACUSER from FAC305 WHERE CIAID='''+ICiaID+''' GROUP BY FACUSER ) A, TGE006 B '
         +'  WHERE A.FACUSER=B.USERID '
         +'  ORDER BY FACUSER';
   DMFAC.cdsRepo2.Close;
   DMFAC.cdsRepo2.DataRequest( xSQL );
   DMFAC.cdsRepo2.Open;
   dblcdServicio.LookupTable:= DMFAC.cdsRepo2;
end;

(******************************************************************************)
procedure TFVentaPorUsuario.cargarVendedores(ICiaID:string);
var xSQL:string;
begin
   xSQL:='SELECT B.VEID, B.VENOMBRES '
        +' FROM ( SELECT VEID  '
        +'          FROM FAC305 '
        +'     	   WHERE CIAID='''+ICiaID+''' '
        +'   	     GROUP BY VEID ) A, CXC203 B'
        +' WHERE A.VEID  = B.VEID '
        +'   AND B.CIAID = '''+ICiaID+'''  AND NVL(VESTATUS,''N'')=''S'' '
        +' ORDER BY B.VEID ';
   DMFAC.cdsRepo3.Close;
   DMFAC.cdsRepo3.DataRequest( xSQL );
   DMFAC.cdsRepo3.Open;
   dblcdVendedor.LookupTable:= DMFAC.cdsRepo3;
end;

(******************************************************************************)
procedure TFVentaPorUsuario.FormCreate(Sender: TObject);
var
   xSQL : String;
begin
   bbtnExcUsu.Visible:=False;
   bbtnExcVen.Visible:=False;
   xSQL:='Select nvl(VEFLAGGADM,''N'') ACEPTAR, nvl(VEFLAG,''N'') SUPERVISOR, nvl(VECUENTA,''N'') ESTADISTICA, '
        +   'nvl(VEFCORP,''N'') ADMTIENDA, nvl(VEFLCOM,''N'') ANULAR, nvl(FLAGDESC,''N'') DSCTO '
        +'From FAC206 A, CXC203 B '
        +'Where A.USERID='''+DMFAC.wUsuario+''' AND A.CIAID=B.CIAID(+) AND A.VEID=B.VEID(+)';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(xSQL);
   try
      DMFAC.cdsQry3.Open;
      if (DMFAC.cdsQry3.FieldByname('ADMTIENDA').AsString='S') or (DMFAC.cdsQry3.FieldByname('SUPERVISOR').AsString='S') or
         (DMFAC.cdsQry3.FieldByname('ESTADISTICA').AsString='S')  then
      begin
         bbtnExcUsu.Visible:=True;
         bbtnExcVen.Visible:=True;
      end;
   except
      ShowMessage('Error : Falta registrar a Usuario en Tabla de Usuario de Ventas (CXC203/FAC206)');
      Exit;
   end;


   dblcCia.LookupTable      := DMFAC.cdsCia;
   dblcTienda.LookupTable   := DMFAC.cdsTienda;

   dblcCia.Enabled:=True;
   if DMFAC.cdsCia.RecordCount=1 then
   begin
         dblcCia.Enabled:=False;
         cargarUsuarios(DMFAC.cdsCia.FieldByName('CIAID').AsString);
         cargarVendedores(DMFAC.cdsCia.FieldByName('CIAID').AsString);
   end;
   dtpInicio.Date:=Date;
   dtpFin.Date   :=Date;
   dblcCia.Text :=DMFAC.cdsCia.FieldByName('CIAID').AsString;
   edtCia.Text  :=DMFAC.cdsCia.FieldByName('CIADES').AsString;
end;

(******************************************************************************)
procedure TFVentaPorUsuario.dblcCiaExit(Sender: TObject);
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
   cargarUsuarios(dblcCia.Text);
   cargarVendedores(dblcCia.Text);
end;

(******************************************************************************)
function TFVentaPorUsuario.isDxsValidos(ITipo:string):boolean;
label GSalir;
begin
   if dblcCia.text='' then
   begin
      dblcCia.enabled:=True;
      dblcCia.SetFocus;
      showmessage('Ingrese Compañía');
      goto GSalir;
   end;

   if dtpInicio.date=0 then
   begin
      dtpInicio.SetFocus;
      showmessage('Ingrese Fecha de Inicio');
      goto GSalir;
   end;

   if dtpFin.date=0 then
   begin
      dtpFin.SetFocus;
      showmessage('Ingrese Fecha Final');
      goto GSalir;
   end;

   if dtpFin.date<dtpInicio.date then
   begin
      dtpFin.SetFocus;
      showmessage('La Fecha Final no puede ser menor que la Fecha de Inicio');
      goto GSalir;
   end;
   (*  se comenta esto para q  muestre todo
   if ITipo = 'VENDEDORES' then
     begin
        if dblcdVendedor.text='' then
          begin
            dblcdVendedor.SetFocus;
            showmessage('Ingrese Código del Vendedor');
            goto GSalir;
          end;
     end
   else
     begin
        if dblcdServicio.text='' then
          begin
            dblcdServicio.SetFocus;
            showmessage('Ingrese Código del Usuario');
            goto GSalir;
          end;
     end;
     *)
   result:= true;
   exit;
GSalir:
   result:= false;
   exit;
end;
(******************************************************************************)
procedure TFVentaPorUsuario.bbtnRep2Click(Sender: TObject);
var
   x10: integer;
   xSQL : String;
begin
   if not isDxsValidos() then exit;
	 Screen.Cursor:=crHourGlass;

   xSQL := 'update FAC305 '
          +'set FECINI=null '
          +'where CIAID='+QuotedStr(dblcCia.text)+' '
          +'  and FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''') '
          +'  and FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)   +''') '
          +'  and FACUSER LIKE '''+dblcdServicio.Text+'%'' '
          +'  and ALMID like ''%'' and FACESTADO in (''ACEPTADO'',''ANULADO'') '
          +'  and NUMINI is null and fecini is not null';
   try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   xSQL:='SELECT A.CIAID, A.DOCID, C.DOCDES, A.FACSERIE, A.NFAC, A.FACFECHA, '
        +  'A.FACESTADO, A.FPAGOID, B.DCCOMDES, '
        +  'CASE WHEN A.FACESTADO=''ACEPTADO'' and FPAGOID IN (''01'',''11'') THEN A.FACTOTMN-nvl(A.INICIAL,0) ELSE 0 END IMPEFE, '
        +  'CASE WHEN A.FACESTADO=''ACEPTADO'' and FPAGOID IN (''03'',''12'') THEN A.FACTOTMN-nvl(A.INICIAL,0) ELSE 0 END IMPCRE, '
        +  'CASE WHEN A.FACESTADO=''ACEPTADO'' and FPAGOID IN (''08'',''09'',''19'') THEN A.FACTOTMN-nvl(A.INICIAL,0) ELSE 0 END IMPCREPL, '
        +  'CASE WHEN A.FACESTADO=''ACEPTADO'' and FPAGOID IN (''05'',''07'',''10'',''13'') THEN A.FACTOTMN-nvl(A.INICIAL,0) ELSE 0 END IMPOTR, '
        +  'CASE WHEN A.FACESTADO=''ACEPTADO'' and FPAGOID IN (''14'',''15'',''16'',''17'',''18'') THEN A.FACTOTMN-nvl(A.INICIAL,0) ELSE 0 END IMPTARJ, '
        +  'CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.INICIAL ELSE 0 END INICIAL, '
        +  'CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.FACTOTMN ELSE 0 END FACTOTMN, '
        +  'CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.FACTOTMN-NVL(A.INICIAL,0) ELSE 0 END IMPORTE, '
        +  'A.CLIEDES, ''BAZAR Y REPRESENTACIONES'' CIADES, A.ALMID, D.ALMDES, '
        +  'CASE WHEN A.OFDESID IS NULL THEN ''01'' ELSE A.OFDESID END OFDESID, F.OFDESNOM, '
        +  'A.FACUSER, USERNOM, INICIAL, FECINI, NUMINI, '
        +  '''DESDE '+dtpInicio.Text+' HASTA '+dtpFin.Text+''' RANGO '
        +'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, APO110 F, TGE006 G '
        +'WHERE A.CIAID='+QuotedStr(dblcCia.text)+' '
        + ' and A.FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''') '
        +  'and A.FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)   +''') '
        +  'and A.FACUSER LIKE '''+dblcdServicio.Text+'%'' '
        +  'and A.ALMID like ''%'' and A.FACESTADO in (''ACEPTADO'',''ANULADO'') '
        +  'and A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
        +  'and A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
        +  'and F.OFDESID=CASE WHEN A.OFDESID IS NULL THEN ''01'' ELSE A.OFDESID END '
        +  'and A.FACUSER=G.USERID '
        +'ORDER BY A.FACUSER, FACFECHA, DOCID, FACSERIE, NFAC';

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
   ppR1.TEMPLATE.FileName:=ExtractFilePath(application.ExeName)+DMFAC.wRutaRpt+'\VentaUsuarios.rtm';
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

(******************************************************************************)
procedure TFVentaPorUsuario.BitBtn1Click(Sender: TObject);
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

   if dblcdServicio.text='' then
   begin
      dblcdServicio.SetFocus;
      Raise Exception.Create('Ingrese Código del Servicio');
   end;

	 Screen.Cursor:=crHourGlass;

   xSQL:='SELECT D.CIADES, A.*, E.CCNODOC, E.CCMTOORI, ''INCLUYE CON N.CREDITO'' TITNC, '
        +  '''NC'' TITNC2, CASE WHEN E.CCNODOC IS NULL THEN '' '' ELSE ''NC'' END NC, '
        +  '''DESDE '+dtpInicio.Text+' HASTA '+dtpFin.Text+''' RANGO '
        +'FROM FAC306 A, FAC305 B, TGE101 D, TGE205 L, CXC304 C, CXC301 E '
        +'WHERE A.CIAID='+QuotedStr(dblcCia.text)+' and A.TINID=''00'' '
        + ' and A.ARTID like ''%'+dblcdServicio.text+''' '
        + ' AND A.CIAID=B.CIAID AND A.DOCID=B.DOCID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
        + ' AND B.FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''''+') '
        +  'AND B.FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)+''''+') '
        +  'AND B.FACESTADO=''ACEPTADO'' '
        +  'AND (A.CIAID=D.CIAID(+)) '
        +  'AND (L.CIAID(+)=A.CIAID and L.TINID(+)=A.TINID AND L.ARTID(+)=A.ARTID) '
        +  'AND A.CIAID=C.CIAID(+) AND A.DOCID=C.DOCID(+) AND A.FACSERIE=C.CCSERIE(+) '
        +  'AND A.NFAC=C.CCNODOC(+) AND C.CIAID=E.CIAID(+) AND C.TCANJEID=E.TCANJEID(+) '
        +  'AND C.CCCANJE=E.CCCANJE(+) AND E.CCESTADO(+)=''P'' '
        +'ORDER BY A.CIAID, A.FACFECHA, A.DOCID, A.FACSERIE, A.NFAC';

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
   ppR1.TEMPLATE.FileName:=ExtractFilePath(application.ExeName)+DMFAC.wRutaRpt+'\VentaConcesiones.rtm';
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

(******************************************************************************)
procedure TFVentaPorUsuario.dblcdVendedorExit(Sender: TObject);
begin
end;

(******************************************************************************)
procedure TFVentaPorUsuario.dblcdServicioChange(Sender: TObject);
begin
   dbeServicios.Text:= DMFAC.cdsRepo2.FieldByName('USERNOM').AsString
end;

(******************************************************************************)
procedure TFVentaPorUsuario.dblcdVendedorChange(Sender: TObject);
begin
   dbeVendedores.Text:= DMFAC.cdsRepo3.FieldByName('VENOMBRES').AsString
end;

(******************************************************************************)
procedure TFVentaPorUsuario.BBtnRptVendedoresClick(Sender: TObject);
var
   x10: integer;
   xSQL : String;
begin
   if not isDxsValidos('VENDEDORES') then exit;
	 Screen.Cursor:=crHourGlass;

   xSQL:= ' SELECT A.CIAID, A.DOCID, C.DOCDES, A.FACSERIE, A.NFAC, A.FACFECHA, '
         +'        A.FACESTADO, A.FPAGOID, B.DCCOMDES, '
         +'        CASE '
         +'	          WHEN (A.FACESTADO=''ACEPTADO'') AND (A.FPAGOID IN (''01'',''11'')) THEN A.FACTOTMN - NVL(A.INICIAL,0) '
         +'     		  ELSE 0 '
         +' 	   END IMPEFE, '
         +'        CASE '
         +' 	      WHEN (A.FACESTADO=''ACEPTADO'') AND (A.FPAGOID IN (''03'',''12'')) THEN A.FACTOTMN - NVL(A.INICIAL,0) '
         +' 		  ELSE 0 '
         +' 	   END IMPCRE, '
         +'        CASE '
         +' 	      WHEN (A.FACESTADO=''ACEPTADO'') AND (A.FPAGOID IN (''08'',''09'')) THEN A.FACTOTMN - NVL(A.INICIAL,0) '
         +' 		  ELSE 0 '
         +' 	   END IMPCREPL, '
         +'        CASE '
         +' 	      WHEN (A.FACESTADO=''ACEPTADO'') AND (A.FPAGOID IN (''05'',''07'',''10'',''13'')) THEN A.FACTOTMN - NVL(A.INICIAL,0) '
         +' 		  ELSE 0 '
         +' 	   END IMPOTR, '
         +'        CASE '
         +' 	      WHEN (A.FACESTADO=''ACEPTADO'') AND (A.FPAGOID IN (''14'',''15'')) THEN A.FACTOTMN - NVL(A.INICIAL,0) '
         +' 		  ELSE 0 '
         +' 	   END IMPTARJ, '
         +'        CASE '
         +' 	      WHEN A.FACESTADO=''ACEPTADO'' THEN A.INICIAL '
         +' 		  ELSE 0 '
         +' 	   END INICIAL, '
         +'        CASE '
         +' 	      WHEN A.FACESTADO=''ACEPTADO'' THEN A.FACTOTMN '
         +' 		  ELSE 0 '
         +' 	   END FACTOTMN, '
         +'        CASE '
         +' 	      WHEN A.FACESTADO=''ACEPTADO'' THEN A.FACTOTMN-NVL(A.INICIAL,0) '
         +' 		  ELSE 0 '
         +' 	   END IMPORTE, '
         +'        A.CLIEDES, ''BAZAR Y REPRESENTACIONES'' CIADES, A.ALMID, D.ALMDES, '
         +'        CASE '
         +' 	      WHEN A.OFDESID IS NULL THEN ''01'' '
         +' 		  ELSE A.OFDESID '
         +' 	   END OFDESID, F.OFDESNOM, '
         +'        A.FACUSER, USERNOM, INICIAL, FECINI, NUMINI, '
         +'        CASE '
         +' 	      WHEN A.VEID<>H.VEID THEN H.VEID '
         +' 	      ELSE A.VEID '
         +' 	   END VEID, '
         +' 	   G.VENOMBRES, H.PROFUSER, '
         +'      ''DESDE '+dtpInicio.Text+' HASTA '+dtpFin.Text+''' RANGO '
         +'   FROM FAC305 A, TGE180 B, TGE110 C, '
         +'        TGE151 D, APO110 F, TGE006 G, '
         +'        FAC311 H, CXC203 G '
         +'  WHERE A.CIAID = '+QuotedStr(dblcCia.text)+' '
         +'    AND A.FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''',''DD/MM/YYYY'') '
         +'    AND A.FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)   +''',''DD/MM/YYYY'') '
         +'    AND A.VEID LIKE '''+dblcdVendedor.Text+'%'' '
         +'    AND A.ALMID LIKE ''%'' '
         +'    AND A.FACESTADO IN (''ACEPTADO'',''ANULADO'') '
         +'    AND A.CIAID = B.CIAID '
         +'    AND A.FPAGOID = B.CCOMERID '
         +'    AND A.DOCID = C.DOCID '
         +'    AND C.DOCMOD = ''CXC'' '
         +'    AND A.CIAID = D.CIAID(+) '
         +'    AND A.LOCID = D.LOCID(+) '
         +'    AND A.TINID = D.TINID(+) '
         +'    AND A.ALMID = D.ALMID(+) '
         +'    AND F.OFDESID = (CASE WHEN A.OFDESID IS NULL THEN ''01'' ELSE A.OFDESID END) '
         +'    AND A.FACUSER = G.USERID '
         +'    AND G.CIAID = '+QuotedStr(dblcCia.text)
         +'    AND A.CIAID = H.CIAID(+) '
         +'    AND A.PROFID = H.PROFID(+) '
         +'    AND (CASE WHEN A.VEID<>H.VEID THEN H.VEID ELSE A.VEID END) = G.VEID '
         +'    ORDER BY (CASE WHEN A.VEID<>H.VEID THEN H.VEID ELSE A.VEID END), FACFECHA, DOCID, FACSERIE, NFAC ';

   DMFAC.cdsQry17.Close;
   DMFAC.cdsQry17.IndexFieldNames := '';
   DMFAC.cdsQry17.Filter := '';
   DMFAC.cdsQry17.Filtered := False;
   DMFAC.cdsQry17.DataRequest(xSQL);
   DMFAC.cdsQry17.Open;

   if DMFAC.cdsQry17.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      showmessage('No existen Registros a mostrar');
      exit;
   end;

   ppdb2.DataSource :=DMFAC.dsQry17;
   ppR2.TEMPLATE.FileName:=ExtractFilePath(application.ExeName)+DMFAC.wRutaRpt+'\VentaVendedores.rtm';
   ppR2.template.LoadFromFile;

	 Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
      ppd2.showmodal
   else
      ppR2.Print;

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

(******************************************************************************)

procedure TFVentaPorUsuario.bbtnRepN1Click(Sender: TObject);
var
   x10: integer;
   xSQL, xSQL1, xSQL2 : String;
   xTit1 : String;
begin
   if not isDxsValidos() then exit;
	   Screen.Cursor:=crHourGlass;

   xSQL2:='';
   xSQL := 'update FAC305 '
          +'set FECINI=null '
          +'where CIAID='+QuotedStr(dblcCia.text)+' '
          +'  and FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''') '
          +'  and FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)   +''') '
          +'  and FACUSER LIKE '''+dblcdServicio.Text+'%'' '
          +'  and ALMID like ''%'' and FACESTADO in (''ACEPTADO'',''ANULADO'') '
          +'  and NUMINI is null and fecini is not null';
   try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   SQL_Venta_por_Usuario;

   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   ppdb1.DataSource :=DMFAC.dsQry3;
   ppR1.DataPipeline:=ppdb1;
   ppR1.TEMPLATE.FileName:=ExtractFilePath(application.ExeName)+DMFAC.wRutaRpt+'\VentaUsuariosNew.rtm';
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


procedure TFVentaPorUsuario.SQL_Venta_por_Usuario;
var
   x10: integer;
   xSQL, xSQL1, xSQL2 : String;
   xTit1 : String;
begin
   xSQL:='SELECT A.CIAID, A.DOCID, C.DOCDES, C.DOCABR, A.FACSERIE, A.NFAC, A.FACFECHA, '
        +  'A.FACESTADO, A.FPAGOID, B.DCCOMDES, '
        +  'CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.INICIAL ELSE 0 END INICIAL, '
        +  'CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.FACTOTMN ELSE 0 END FACTOTMN, '
        +  'CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.FACTOTMN-NVL(A.INICIAL,0) ELSE 0 END IMPORTE, '
        + ' CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.FACMTOMN ELSE 0 END FACMTOMN, '
        +'  CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.FACIGVMN ELSE  0 END FACIGVMN, '
        +  'A.CLIEDES, ''BAZAR Y REPRESENTACIONES'' CIADES, A.ALMID, D.ALMDES, '
        +  'A.FACUSER, USERNOM, FECINI, NUMINI, ';

   // Rango de fechas
   if dtpInicio.Text=dtpFin.Text then
   xSQL:=xSQL
        +  '''FECHA '+dtpInicio.Text+''' RANGO, '
   else
   xSQL:=xSQL
        +  '''DESDE '+dtpInicio.Text+' HASTA '+dtpFin.Text+''' RANGO, ';

   // Titulo de Reporte
   if cbLiq.Checked then
   begin
      if dblcTienda.Text<>'' then
      begin
         xSQL :=xSQL
               +'''VENTAS POR USUARIO - CONSOLIDADO POR TIENDA'' TITULO_REP, ';
         xTit1:='''VENTAS POR USUARIO - CONSOLIDADO POR TIENDA'' TITULO_REP, ';
      end
      else
      begin
         xSQL :=xSQL
               +'''VENTAS POR USUARIO - CONSOLIDADO GENERAL'' TITULO_REP, ';
         xTit1:='''VENTAS POR USUARIO - CONSOLIDADO GENERAL'' TITULO_REP, ';
      end;
   end
   else
   begin
      if dblcdServicio.Text<>'' then
      begin
         xSQL :=xSQL
               +'''VENTAS POR USUARIO'' TITULO_REP, ';
         xTit1:='''VENTAS POR USUARIO'' TITULO_REP, ';
      end
      else
      begin
         if dblcTienda.Text<>'' then
         begin
            xSQL :=xSQL
                  +'''VENTAS POR USUARIO - CONSOLIDADO POR TIENDA'' TITULO_REP, ';
            xTit1:='''VENTAS POR USUARIO - CONSOLIDADO POR TIENDA'' TITULO_REP, ';
         end
         else
         begin
            xSQL :=xSQL
                  +'''VENTAS POR USUARIO - CONSOLIDADO GENERAL'' TITULO_REP, ';
            xTit1:='''VENTAS POR USUARIO - CONSOLIDADO GENERAL'' TITULO_REP, ';
         end;
      end;
   end;

   xSQL:=xSQL
     // Inicio HPC_201602_FAC
     // 21/03/2016 Considera Estado de Documento para considerar Importes
        +  'case when A.FACESTADO=''ACEPTADO'' then IMPEFE else 0.00 end IMPEFE, '
        +  'case when A.FACESTADO=''ACEPTADO'' then IMPCRE else 0.00 end IMPCRE , '
        +  'case when A.FACESTADO=''ACEPTADO'' then IMPNCR else 0.00 end IMPNCR , '
        +  'case when A.FACESTADO=''ACEPTADO'' then IMPCREPL else 0.00 end IMPCREPL , '
        +  'case when A.FACESTADO=''ACEPTADO'' then IMPOTR else 0.00 end IMPOTR , '
        +  'case when A.FACESTADO=''ACEPTADO'' then IMPTARJ else 0.00 end IMPTARJ , '
        +  'case when A.FACESTADO=''ACEPTADO'' then IMPTOT else 0.00 end IMPTOT , '
     // Fin HPC_201602_FAC
        +  'REGEFE, REGCRE, REGNCR, REGCREPL, REGOTR, REGTARJ, IMPDEP, REGDEP, '
        + 'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
        +'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, TGE006 G, FAC_TIENDA T, '
        + '( SELECT CIAID, DOCID, FACSERIE, NFAC, '
        +   ' SUM(CASE WHEN FPAGOID IN (''21'')                             THEN MTODOCLOC ELSE 0 END ) IMPDEP, '
        +   ' SUM(CASE WHEN FPAGOID IN (''01'',''11'')                      THEN MTODOCLOC ELSE 0 END ) IMPEFE, '
        +   ' SUM(CASE WHEN FPAGOID IN (''03'',''12'')                      THEN MTODOCLOC ELSE 0 END ) IMPCRE, '
        +   ' SUM(CASE WHEN FPAGOID IN (''20'')                             THEN MTODOCLOC ELSE 0 END ) IMPNCR, '
        +   ' SUM(CASE WHEN FPAGOID IN (''08'',''09'',''19'')               THEN MTODOCLOC ELSE 0 END ) IMPCREPL, '
        +   ' SUM(CASE WHEN FPAGOID IN (''05'',''07'',''10'',''13'')        THEN MTODOCLOC ELSE 0 END ) IMPOTR, '
        +   ' SUM(CASE WHEN FPAGOID IN (''14'',''15'',''16'',''17'',''18'') THEN MTODOCLOC ELSE 0 END ) IMPTARJ, '
        +   ' SUM( MTODOCLOC ) IMPTOT, '
        +   ' SUM(CASE WHEN FPAGOID IN (''21'')                             THEN 1 ELSE 0 END ) REGDEP, '
        +   ' SUM(CASE WHEN FPAGOID IN (''01'',''11'')                      THEN 1 ELSE 0 END ) REGEFE, '
        +   ' SUM(CASE WHEN FPAGOID IN (''03'',''12'')                      THEN 1 ELSE 0 END ) REGCRE, '
        +   ' SUM(CASE WHEN FPAGOID IN (''20'')                             THEN 1 ELSE 0 END ) REGNCR, '
        +   ' SUM(CASE WHEN FPAGOID IN (''08'',''09'',''19'')               THEN 1 ELSE 0 END ) REGCREPL, '
        +   ' SUM(CASE WHEN FPAGOID IN (''05'',''07'',''10'',''13'')        THEN 1 ELSE 0 END ) REGOTR, '
        +   ' SUM(CASE WHEN FPAGOID IN (''14'',''15'',''16'',''17'',''18'') THEN 1 ELSE 0 END ) REGTARJ '
        +   'FROM FAC_FOR_PAG '
        +   'WHERE NVL(BORRADO,''N'')=''N'' '
        +   'GROUP BY CIAID, DOCID, FACSERIE, NFAC ) H '
        +'WHERE A.CIAID='+QuotedStr(dblcCia.text)+' '
        + ' and A.FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''') '
        +  'and A.FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)   +''') ';

   if dblcdServicio.Text<>'' then
      xSQL:=xSQL+  'and A.FACUSER = '''+dblcdServicio.Text+''' ';

   xSQL:=xSQL
        +  'and A.ALMID like ''%'' and A.FACESTADO in (''ACEPTADO'',''ANULADO'') '
        +  'and A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
        +  'and A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
        +  'and A.FACUSER=G.USERID(+) '
        +  'and A.CIAID=H.CIAID(+) AND A.DOCID=H.DOCID(+) AND A.FACSERIE=H.FACSERIE(+) AND A.NFAC=H.NFAC(+) '
        +'  and D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
        +'  and T.TIE_ID LIKE '''+dblcTienda.Text+'%'' ';

  xSQL2:=' UNION ALL '
        +'SELECT A.CIAID, A.DOCID, C.DOCDES, C.DOCABR, CCSERIE,  CCNODOC,  CCFCMPRB FACFECHA, '
        + '      CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
        + '      '''' FPAGOID, '''' DCCOMDES, 0.00 INICIAL, '
        + '      CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 FACTOTMN, '
        + '      CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 IMPORTE, '
        + '      CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 FACMTOMN, '
        + '      CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCIGV,0) ELSE 0 END*-1 FACIGVMN, '
        + '      A.CLIEDES, ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, '
        + '  CCUSER, CCUSER, NULL FECINI, NULL NUMINI, '
        //+ '  A.VEID, G.VENOMBRES, '''' PROFUSER, '
        + '  ''DESDE '+dtpInicio.Text+' HASTA '+dtpFin.Text+''' RANGOF, '
        + xTit1
        + '  CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 IMPEFE, 0 IMPCRE, 0 IMPNCR, 0 IMPCREPL, 0 IMPOTR, 0 IMPTARJ, CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 IMPTOT, '
        + '  1 REGEFE, 0 REGCRE, 0 REGNCR, 0 REGCREPL, 0 REGOTR, 0 REGTARJ, 0 IMPDEP, 0 REGDEP, '
        + '  NVL(T.TIE_ID,S.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
        +'FROM CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T, CXC203 G '
        +'WHERE A.CIAID='+ QuotedStr(dblcCia.Text) +' AND A.DOCID=''27'' '
        +'    AND A.CCFCMPRB>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''',''DD/MM/YYYY'') '
        +'    AND A.CCFCMPRB<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)   +''',''DD/MM/YYYY'') ';

   if dblcdServicio.Text<>'' then
      xSQL2:=xSQL2+  'and A.CCUSER ='''+dblcdServicio.Text+''' ';

   xSQL2:=xSQL2
        + '   AND CCFLAGTDOC=''D'' '
        + '   AND A.DOCID = C.DOCID   AND C.DOCMOD = ''CXC'' '
        + '   AND A.CIAID=S.CIAID AND A.CCPEDIDO=NISAID(+) AND NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) '
        + '   AND TRIID=''15'' AND NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
        + '   AND NISSIT=''ACEPTADO'' '
        + '   AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
        + '   AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
        + '   AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
        + '   AND A.VEID=G.VEID '

        +'ORDER BY TIE_ID, FACUSER, FACFECHA, DOCID, FACSERIE, NFAC';

   xSQL:=xSQL+xSQL2;
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
end;


procedure TFVentaPorUsuario.bbtnRepN2Click(Sender: TObject);
var
   x10: integer;
   xSQL : String;
begin
   if not isDxsValidos('VENDEDORES') then exit;
      Screen.Cursor:=crHourGlass;

   SQL_Venta_por_Vendedor;

   if DMFAC.cdsQry17.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      showmessage('No existen Registros a mostrar');
      exit;
   end;

   ppdb2.DataSource :=DMFAC.dsQry17;
   ppR2.TEMPLATE.FileName:=ExtractFilePath(application.ExeName)+DMFAC.wRutaRpt+'\VentaVendedoresCom.rtm';
   ppR2.template.LoadFromFile;

	 Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
      ppd2.showmodal
   else
      ppR2.Print;

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


procedure TFVentaPorUsuario.SQL_Venta_por_Vendedor;
var
   xSQL : String;
begin
   xSQL:='SELECT A.CIAID, A.DOCID, C.DOCDES, C.DOCABR, A.FACSERIE, A.NFAC, A.FACFECHA, A.FACESTADO, A.FPAGOID, B.DCCOMDES, '
         +'  CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.INICIAL ELSE 0 END INICIAL, '
         +'  CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.FACTOTMN ELSE 0 END FACTOTMN, '
         + ' CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.FACMTOMN ELSE 0 END FACMTOMN, '
         +'  CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.FACTOTMN-NVL(A.INICIAL,0) ELSE 0 END IMPORTE, '
         +'  CASE WHEN A.FACESTADO=''ACEPTADO'' THEN A.FACIGVMN   ELSE  0 END FACIGVMN, '
         +'  A.CLIEDES, ''BAZAR Y REPRESENTACIONES'' CIADES, A.ALMID, D.ALMDES, '
         +'  A.FACUSER, USERNOM, INICIAL, FECINI, NUMINI, '
         //+'  CASE WHEN A.VEID<>H.VEID THEN H.VEID ELSE A.VEID END VEID, '
         +'  A.VEID VEID, '
         +'  G.VENOMBRES, H.PROFUSER, ';

   // Rango de fechas
   if dtpInicio.Text=dtpFin.Text then
   xSQL:=xSQL
        +  '''FECHA '+dtpInicio.Text+''' RANGOF, '
   else
   xSQL:=xSQL
        +  '''DESDE '+dtpInicio.Text+' HASTA '+dtpFin.Text+''' RANGOF, ';

   // Titulo de Reporte
   if cbLiq.Checked then
   begin
      if dblcTienda.Text<>'' then
         xSQL:=xSQL
              +  '''VENTAS POR VENDEDOR - CONSOLIDADO POR TIENDA'' TITULO_REP, '
      else
         xSQL:=xSQL
              +  '''VENTAS POR VENDEDOR - CONSOLIDADO GENERAL'' TITULO_REP, ';
   end
   else
   begin
      if dblcdVendedor.Text<>'' then
         xSQL:=xSQL
              +  '''VENTAS POR VENDEDOR'' TITULO_REP, '
      else
         if dblcTienda.Text<>'' then
            xSQL:=xSQL
                 +  '''VENTAS POR VENDEDOR - CONSOLIDADO POR TIENDA'' TITULO_REP, '
         else
            xSQL:=xSQL
                 +  '''VENTAS POR VENDEDOR - CONSOLIDADO GENERAL'' TITULO_REP, ';
   end;


   xSQL:=xSQL
         +'  IMPEFE, IMPCRE, IMPNCR, IMPCREPL, IMPOTR, IMPTARJ, IMPTOT, '
         +'  NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         +'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, TGE006 G, FAC311 H, CXC203 G, FAC_TIENDA T, '
         + '( SELECT CIAID, DOCID, FACSERIE, NFAC, '
         +   ' SUM(CASE WHEN FPAGOID IN (''01'',''11'') THEN MTODOCLOC ELSE 0 END ) IMPEFE, '
         +   ' SUM(CASE WHEN FPAGOID IN (''03'',''12'') THEN MTODOCLOC ELSE 0 END ) IMPCRE, '
         +   ' SUM(CASE WHEN FPAGOID IN (''20'')        THEN MTODOCLOC ELSE 0 END ) IMPNCR, '
         +   ' SUM(CASE WHEN FPAGOID IN (''08'',''09'',''19'') THEN MTODOCLOC ELSE 0 END ) IMPCREPL, '
         +   ' SUM(CASE WHEN FPAGOID IN (''05'',''07'',''10'',''13'') THEN MTODOCLOC ELSE 0 END ) IMPOTR, '
         +   ' SUM(CASE WHEN FPAGOID IN (''14'',''15'',''16'',''17'',''18'') THEN MTODOCLOC ELSE 0 END ) IMPTARJ, '
         +   ' SUM( MTODOCLOC ) IMPTOT '
         +'FROM FAC_FOR_PAG '
         +'WHERE NVL(BORRADO,''N'')=''N'' '
         +'GROUP BY CIAID, DOCID, FACSERIE, NFAC ) P '
         +'WHERE A.CIAID = '+QuotedStr(dblcCia.text)+' '
         +'    AND A.FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''',''DD/MM/YYYY'') '
         +'    AND A.FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)   +''',''DD/MM/YYYY'') '
         +'    AND A.VEID LIKE '''+dblcdVendedor.Text+'%'' '
         +'    AND A.ALMID LIKE ''%'' '
         +'    AND A.FACESTADO IN (''ACEPTADO'',''ANULADO'') '
         +'    AND A.CIAID = B.CIAID AND A.FPAGOID = B.CCOMERID '
         +'    AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
         +'    AND A.CIAID = D.CIAID(+) AND A.LOCID = D.LOCID(+) AND A.TINID = D.TINID(+) AND A.ALMID = D.ALMID(+) '
         +'    AND A.FACUSER = G.USERID(+) '
         +'    AND G.CIAID = '+QuotedStr(dblcCia.text)
         +'    AND A.CIAID = H.CIAID(+) AND A.PROFID = H.PROFID(+) '
         //+'    AND (CASE WHEN A.VEID<>H.VEID THEN H.VEID ELSE A.VEID END) = G.VEID '
         +'    AND A.CIAID=G.CIAID(+) AND A.VEID=G.VEID(+) '
         +'    and A.CIAID=P.CIAID(+) AND A.DOCID=P.DOCID(+) AND A.FACSERIE=P.FACSERIE(+) AND A.NFAC=P.NFAC(+) '
         +'    and D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         +'    and T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
         +' UNION ALL '

         +'SELECT A.CIAID, A.DOCID, C.DOCDES, C.DOCABR, CCSERIE,  CCNODOC,  CCFCMPRB FACFECHA, '
         + '      CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
         + '      '''' FPAGOID, '''' DCCOMDES, 0.00 INICIAL, '
         + '      CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 FACTOTMN, '
         + '      CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 FACMTOMN, '
         + '      CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 IMPORTE, '
         + '      CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCIGV,0) ELSE 0 END*-1 FACIGVMN, '
         + '      A.CLIEDES, ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, '
         + '  CCUSER, CCUSER, 0.00 INICIAL, NULL FECINI, NULL NUMINI, '
         + '  A.VEID, G.VENOMBRES, '''' PROFUSER, ';

   // Rango de fechas
   if dtpInicio.Text=dtpFin.Text then
   xSQL:=xSQL
        +  '''FECHA '+dtpInicio.Text+''' RANGOF, '
   else
   xSQL:=xSQL
        +  '''DESDE '+dtpInicio.Text+' HASTA '+dtpFin.Text+''' RANGOF, ';

   // Titulo de Reporte
   if cbLiq.Checked then
   begin
      if dblcTienda.Text<>'' then
         xSQL:=xSQL
              +  '''VENTAS POR VENDEDOR - CONSOLIDADO POR TIENDA'' TITULO_REP, '
      else
         xSQL:=xSQL
              +  '''VENTAS POR VENDEDOR - CONSOLIDADO GENERAL'' TITULO_REP, ';
   end
   else
   begin
      if dblcdVendedor.Text<>'' then
         xSQL:=xSQL
              +  '''VENTAS POR VENDEDOR'' TITULO_REP, '
      else
         if dblcTienda.Text<>'' then
            xSQL:=xSQL
                 +  '''VENTAS POR VENDEDOR - CONSOLIDADO POR TIENDA'' TITULO_REP, '
         else
            xSQL:=xSQL
                 +  '''VENTAS POR VENDEDOR - CONSOLIDADO GENERAL'' TITULO_REP, ';
   end;

   xSQL:=xSQL
         + '  0 IMPEFE, 0 IMPCRE, CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 IMPNCR, 0 IMPCREPL, 0 IMPOTR, 0 IMPTARJ, CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 IMPTOT, '
         + '  NVL(T.TIE_ID,S.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         +'FROM CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T, CXC203 G '
         +'WHERE A.CIAID='+ QuotedStr(dblcCia.Text) +' AND A.DOCID=''27'' '
         + '   AND A.CCFCMPRB>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''',''DD/MM/YYYY'') '
         + '   AND A.CCFCMPRB<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)   +''',''DD/MM/YYYY'') '
         + '   AND A.VEID LIKE '''+dblcdVendedor.Text+'%'' '
         + '   AND A.DOCID = C.DOCID   AND C.DOCMOD = ''CXC'' '
         + '   AND A.CIAID=S.CIAID AND A.CCPEDIDO=NISAID(+) AND NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) '
         + '   AND TRIID=''15'' AND NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
         + '   AND NISSIT=''ACEPTADO'' '
         + '   AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
         + '   AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + '   AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
         + '   AND A.VEID=G.VEID '
         +'ORDER BY TIE_ID, VEID, FACFECHA, DOCID, FACSERIE, NFAC ';

   DMFAC.cdsQry17.Close;
   DMFAC.cdsQry17.IndexFieldNames := '';
   DMFAC.cdsQry17.Filter := '';
   DMFAC.cdsQry17.Filtered := False;
   DMFAC.cdsQry17.DataRequest(xSQL);
   DMFAC.cdsQry17.Open;

end;

procedure TFVentaPorUsuario.dblcTiendaExit(Sender: TObject);
begin
   edtTienda.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC_TIENDA', 'TIE_DES', 'CIAID=' + QuotedStr(dblcCia.text) + ' AND TIE_ID='+QuotedStr(dblcTienda.Text), 'TIE_DES');
end;

procedure TFVentaPorUsuario.dblcTiendaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFVentaPorUsuario.dtpInicioExit(Sender: TObject);
begin
   if dtpFin.date<dtpInicio.date then
      dtpFin.date:=dtpInicio.date;
end;

procedure TFVentaPorUsuario.cbLiqClick(Sender: TObject);
begin
   if cbLiq.Checked then
   begin
      dtpFin.Enabled       :=False;
      dblcdServicio.Enabled:=False;
      dblcdVendedor.Enabled:=False;

      dtpFin.date       :=dtpInicio.date;
      dblcdServicio.Text:='';
      dblcdVendedor.Text:='';
   end
   else
   begin
      dtpFin.Enabled       :=True;
      dblcdServicio.Enabled:=True;
      dblcdVendedor.Enabled:=True;
   end;

end;

procedure TFVentaPorUsuario.bbtnExcUsuClick(Sender: TObject);
var
   x10: integer;
   xSQL, xSQL1, xSQL2 : String;
   xTit1 : String;
begin
   if not isDxsValidos() then exit;
	   Screen.Cursor:=crHourGlass;

   xSQL2:='';   
   xSQL := 'update FAC305 '
          +'set FECINI=null '
          +'where CIAID='+QuotedStr(dblcCia.text)+' '
          +'  and FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''') '
          +'  and FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)   +''') '
          +'  and FACUSER LIKE '''+dblcdServicio.Text+'%'' '
          +'  and ALMID like ''%'' and FACESTADO in (''ACEPTADO'',''ANULADO'') '
          +'  and NUMINI is null and fecini is not null';
   try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   SQL_Venta_por_Usuario;

   if DMFAC.cdsQry3.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      Raise Exception.Create('No existen Registros a mostrar');
   end;

   dbgExp.DataSource:=DMFAC.dsQry3;

   try
      DMFAC.ExportaGridExcel(dbgExp,'Ventas por Usuario');
   except
      on Ex: Exception do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   end;
end;

procedure TFVentaPorUsuario.bbtnExcVenClick(Sender: TObject);
var
   x10: integer;
   xSQL : String;
begin
   if not isDxsValidos('VENDEDORES') then exit;
      Screen.Cursor:=crHourGlass;

   SQL_Venta_por_Vendedor;

   if DMFAC.cdsQry17.RecordCount=0 then
   begin
      Screen.Cursor:=crDefault;
      showmessage('No existen Registros a mostrar');
      exit;
   end;

   dbgExp.DataSource:=DMFAC.dsQry17;

   try
      DMFAC.ExportaGridExcel(dbgExp,'Ventas por Vendedor');
   except
      on Ex: Exception do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   end;
end;

procedure TFVentaPorUsuario.FormShow(Sender: TObject);
begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));
// cbDiseno.Visible := True ;
end;

end.
