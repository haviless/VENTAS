unit FAC799;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, wwdblook, ppEndUsr,
  ppBands, ppCache, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DB, ppCtrls, ppVar, ppPrnabl, ppParameter;

type
  TFLineaComer = class(TForm)
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Label5: TLabel;
    dblcTInv: TwwDBLookupCombo;
    edtTinv: TEdit;
    Label4: TLabel;
    dblcAlmacen: TwwDBLookupCombo;
    edtAlmacen: TEdit;
    gbRango: TGroupBox;
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
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBText10: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    cbDiseno: TCheckBox;
    procedure bbtnRep2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTInvExit(Sender: TObject);
    procedure dblcAlmacenExit(Sender: TObject);
    procedure dblcAlmacenEnter(Sender: TObject);
    procedure dblcTInvEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLineaComer: TFLineaComer;

implementation

{$R *.dfm}

uses FacDM, oaVE3000;

procedure TFLineaComer.bbtnRep2Click(Sender: TObject);
var
   x10, x:integer;
   xSQL, xWhere, xOrder : String;
   dTotal : Double;
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

   xSQL:='SELECT B.CIAID, B.TINID, B.ALMID, T.LINCOM, A.ARTID, A.ARTDES, L.UNMIDG, L.TIPART, T.TIPARTDES, '
        +  'SUM(NVL(A.DFACCANTG,0)) VENTA, SUM(NVL(A.DFACMTOMN,0)) IMPMN, SUM(NVL(A.DFACMTOME,0)) IMPME, '
        +  ''''+dtpInicio.Text+''' FECINI, '''+dtpFin.Text+''' FECFIN, '
        +  '''DESDE '+dtpInicio.Text+' HASTA '+dtpFin.Text+''' RANGO, '
        +  'D.CIADES, F.TINDES, G.ALMDES, Z.LINCOMDES, '
        +  '0.00 TOTAL, 0.00 TOTLINCOM, 0.0000 PORPAR, 0.0000 PORCON, 0.0000 PORCONDESC '
        +'FROM FAC306 A, FAC305 B, TGE101 D, TGE152 F, TGE151 G, TGE205 L, '
        +   'ALM_TIP_ART T, ALM_LIN_COM Z '
        +'WHERE A.CIAID='+QuotedStr(dblcCia.text)
        + ' and A.TINID='+quotedstr(dblcTInv.text)
        + ' and A.ALMID like ''%'+dblcAlmacen.text+''' '
        + ' AND A.CIAID=B.CIAID AND A.DOCID=B.DOCID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
        + ' AND B.FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''''+') '
        +  'AND B.FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)+''''+') '
        +  'AND B.FACESTADO=''ACEPTADO'' '
        +  'AND (A.CIAID=D.CIAID(+)) '
        +  'AND (A.CIAID=F.CIAID(+) AND A.TINID=F.TINID(+)) '
        +  'AND (A.CIAID=G.CIAID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+)) '
        +  'AND (L.CIAID(+)=A.CIAID and L.TINID(+)=A.TINID AND L.ARTID(+)=A.ARTID) '
        +  'AND (L.TIPART=T.TIPART(+)) '
        +  'AND T.LINCOM LIKE '''+dblcLinCom.Text+'%'' '
        +  'AND T.LINCOM=Z.LINCOM '
        +'GROUP BY B.CIAID, B.TINID, B.ALMID, T.LINCOM, A.ARTID, A.ARTDES, L.UNMIDG, L.TIPART, T.TIPARTDES, '
        +  'D.CIADES, F.TINDES, G.ALMDES, Z.LINCOMDES '
        +'ORDER BY T.LINCOM, PORCON DESC';

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

   xSQL:='Select LINCOM, 0.00 TOTLINCOM '
        +'FROM ( '+xSQL+' ) '
        +'GROUP BY LINCOM';
   DMFAC.cdsQry4.Close;
   DMFAC.cdsQry4.IndexFieldNames := '';
   DMFAC.cdsQry4.Filter := '';
   DMFAC.cdsQry4.Filtered := False;
   DMFAC.cdsQry4.DataRequest(xSQL);
   DMFAC.cdsQry4.Open;

   dTotal:=0;
   DMFAC.cdsQry3.First;
   while not DMFAC.cdsQry3.Eof do
   begin
      dTotal:=dTotal+DMFAC.cdsQry3.FieldByname('IMPMN').AsFloat;
      DMFAC.cdsQry3.Next;
   end;

   DMFAC.cdsQry3.First;
   while not DMFAC.cdsQry3.Eof do
   begin
      DMFAC.cdsQry3.Edit;
      DMFAC.cdsQry3.fieldByName('TOTAL').AsFloat:=dTotal;
      DMFAC.cdsQry3.Next;
   end;

   DMFAC.cdsQry3.First;
   while not DMFAC.cdsQry3.Eof do
   begin
     DMFAC.cdsQry4.First;
     while not DMFAC.cdsQry4.Eof do
     begin
       if DMFAC.cdsQry4.FieldByName('LINCOM').AsString=DMFAC.cdsQry3.FieldByName('LINCOM').AsString then
       begin
          DMFAC.cdsQry4.Edit;
          DMFAC.cdsQry4.FieldByname('TOTLINCOM').AsFloat:=DMFAC.cdsQry4.FieldByname('TOTLINCOM').AsFloat
                                                         +DMFAC.cdsQry3.FieldByname('IMPMN').AsFloat;
          DMFAC.cdsQry4.Post;
          Break;
       end;
       DMFAC.cdsQry4.Next;
     end;
     DMFAC.cdsQry3.Next;
   end;

   DMFAC.cdsQry4.First;
   while not DMFAC.cdsQry4.Eof do
   begin
      DMFAC.cdsQry3.First;
      while not DMFAC.cdsQry3.Eof do
      begin
         if DMFAC.cdsQry4.FieldByName('LINCOM').AsString=DMFAC.cdsQry3.FieldByName('LINCOM').AsString then
         begin
            DMFAC.cdsQry3.Edit;
            DMFAC.cdsQry3.FieldByname('TOTLINCOM').AsFloat:=DMFAC.cdsQry4.FieldByname('TOTLINCOM').AsFloat;
            DMFAC.cdsQry3.Post;
         end;
         DMFAC.cdsQry3.Next;
      end;
      DMFAC.cdsQry4.Next;
   end;

   // CALCULA PORCENTAJES
   DMFAC.cdsQry3.First;
   while not DMFAC.cdsQry3.Eof do
   begin
      DMFAC.cdsQry3.Edit;
      if DMFAC.cdsQry3.fieldByName('TOTAL').AsFloat>0 then
         DMFAC.cdsQry3.fieldByName('PORPAR').AsFloat:=DMFAC.cdsQry3.fieldByName('TOTLINCOM').AsFloat
                                                     /DMFAC.cdsQry3.fieldByName('TOTAL').AsFloat*100;
      if DMFAC.cdsQry3.fieldByName('TOTLINCOM').AsFloat>0 then
         DMFAC.cdsQry3.fieldByName('PORCON').AsFloat:=DMFAC.cdsQry3.fieldByName('IMPMN').AsFloat
                                                     /DMFAC.cdsQry3.fieldByName('TOTLINCOM').AsFloat*100;
      DMFAC.cdsQry3.fieldByName('PORCONDESC').AsFloat:=1000-DMFAC.cdsQry3.fieldByName('PORCON').AsFloat;
      DMFAC.cdsQry3.Next;
   end;

   DMFAC.cdsQry3.IndexFieldNames:='LINCOM;PORCONDESC';

   ppdb1.DataSource:=DMFAC.dsQry3;
   ppR1.DataPipeline:=ppdb1;
   ppR1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\VentaPorLineaComer.rtm' ;
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

procedure TFLineaComer.FormCreate(Sender: TObject);
var
   xSQL : String;
begin

   // TIPO DE ARTICULO
  DMFAC.cdsQry12.IndexFieldNames:='';
  xSQL:='SELECT * FROM ALM_LIN_COM ORDER BY LINCOMDES';
  DMFAC.cdsQry12.Close;
  DMFAC.cdsQry12.DataRequest( xSQL );
  DMFAC.cdsQry12.Open;
  DMFAC.cdsQry12.IndexFieldNames:='LINCOMDES';


  dblcCia.LookupTable     := DMFAC.cdsCia;
  dblcTInv.LookupTable    := DMFAC.cdsTInven;
  dblcAlmacen.LookupTable := DMFAC.cdsAlmacen;
  dblcLinCom.LookupTable  := DMFAC.cdsQry12;

  dblcCia.Enabled:=True;
  if DMFAC.cdsCia.RecordCount=1 then
     dblcCia.Enabled:=False;
  dblcCia.Text :=DMFAC.cdsCia.FieldByName('CIAID').AsString;
  edtCia.Text  :=DMFAC.cdsCia.FieldByName('CIADES').AsString;

  DMFAC.FiltraTabla(DMFAC.cdsTInven, 'TGE152', 'TINID', 'CIAID='+quotedstr(dblcCia.Text));
  dblcTInv.Enabled:=True;
  if DMFAC.cdsTInven.RecordCount=1 then
     dblcTInv.Enabled:=False;
  dblcTInv.Text:=DMFAC.cdsTInven.FieldByname('TINID').AsString;
  edtTinv.Text :=DMFAC.cdsTInven.FieldByName('TINDES').AsString;

  DMFAC.FiltraTabla(DMFAC.cdsAlmacen,'TGE151', 'ALMID',
       'CIAID='+quotedstr(dblcCia.Text)+' and TINID='+quotedstr(dblcTInv.Text)+' and ALMVTA=''S'' AND ACTIVO=''S''');
  dblcAlmacen.Enabled:=True;
  if DMFAC.cdsAlmacen.RecordCount=1 then
     dblcAlmacen.Enabled:=False;
  dblcAlmacen.Text:=DMFAC.cdsAlmacen.FieldByname('ALMID').AsString;
  edtAlmacen.Text :=DMFAC.cdsAlmacen.FieldByName('ALMDES').AsString;

end;

procedure TFLineaComer.dblcCiaExit(Sender: TObject);
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
   edtCia.Text:= DMFAC.cdsCia.FieldByName('CIADES').AsString;
   DMFAC.FiltraTabla(DMFAC.cdsTInven, 'TGE152', 'TINID', 'CIAID='+quotedstr(dblcCia.Text));
end;

procedure TFLineaComer.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFLineaComer.dblcTInvExit(Sender: TObject);
begin
   if DMFAC.cdsTInven.IndexFieldNames<>'TINID' then
      DMFAC.cdsTInven.IndexFieldNames:='TINID';
   DMFAC.cdsTInven.SetKey;
   DMFAC.cdsTInven.FieldByName('TINID').AsString:=dblcTInv.Text;
   if not DMFAC.cdsTInven.GotoKey then
   begin
      ShowMessage('Tipo de Inventario NO encontrado en relación, reintente');
      dblcTInv.SetFocus;
      exit;
   end;
   edtTinv.Text := DMFAC.cdsTInven.FieldByName('TINDES').AsString;
   DMFAC.FiltraTabla(DMFAC.cdsAlmacen,'TGE151', 'ALMID',
       'CIAID='+quotedstr(dblcCia.Text)+' and TINID='+quotedstr(dblcTInv.Text)+' and ALMVTA=''S'' AND ACTIVO=''S''');
end;

procedure TFLineaComer.dblcAlmacenExit(Sender: TObject);
begin
   if DMFAC.cdsAlmacen.IndexFieldNames<>'ALMID' then
      DMFAC.cdsAlmacen.IndexFieldNames:='ALMID';

   if dblcAlmacen.Text='' then
   begin
      edtAlmacen.Text := '';
      Exit;
   end;

   DMFAC.cdsAlmacen.SetKey;
   DMFAC.cdsAlmacen.FieldByName('ALMID').AsString:=dblcAlmacen.Text;
   if not DMFAC.cdsAlmacen.GotoKey then
   begin
      ShowMessage('Almacén NO encontrado, reintente');
      dblcAlmacen.SetFocus;
      exit;
   end;
   edtAlmacen.Text := DMFAC.cdsAlmacen.FieldByName('ALMDES').AsString;
end;

procedure TFLineaComer.dblcAlmacenEnter(Sender: TObject);
begin
  if edtTinv.Text='' then dblcTInv.SetFocus;
end;

procedure TFLineaComer.dblcTInvEnter(Sender: TObject);
begin
  if edtCia.Text='' then dblcCia.SetFocus;
end;

procedure TFLineaComer.FormActivate(Sender: TObject);
begin
  if dblcAlmacen.Text<>'' then
     dtpInicio.SetFocus;

end;

procedure TFLineaComer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMFAC.cdsQry4.Close;
   DMFAC.cdsQry12.IndexFieldNames:='';
end;

procedure TFLineaComer.FormShow(Sender: TObject);
begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));
end;

end.
