unit FAC807;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, wwdblook, ppEndUsr,
  ppBands, ppCache, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DB, ppCtrls, ppVar, ppPrnabl, ppParameter, Mask, wwdbedit,
  Wwdbdlg, Grids, DBGrids;

type
  TFSeguimientoCompra = class(TForm)
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
    ppd1: TppDesigner;
    gbOpciones: TGroupBox;
    Label34: TLabel;
    dblcdServicio: TwwDBLookupComboDlg;
    dbeServicios: TwwDBEdit;
    bbtnExcel1: TBitBtn;
    dtgData: TDBGrid;
    ppr1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
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
  FSeguimientoCompra: TFSeguimientoCompra;

implementation

{$R *.dfm}

uses FacDM, oaVE3000;

procedure TFSeguimientoCompra.bbtnRep2Click(Sender: TObject);
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

   xSQL:='SELECT a.*, e.cpfemis fecha_fac, e.cpnodoc '
        +'FROM ( '
        +  'select a.ciaid, a.prov, a.provdes, a.odcid, odcfemi, a.numrequsu, '
        +    'b.artid, f.artdes, b.dodccnt, b.dodcpun, b.dodcimp, b.imptot, '
        +    'c.urqid, case when c.urqautofreg is null then c.urqfreg else c.urqautofreg end fecha_req, '
        +    'd.nisaid, d.nisafreg fecha_ing, d.nisandoc, '
        +    'Substr(d.nisandoc,1,instr(d.nisandoc,''-'')-1) CPSERIE, '
        +    'TO_CHAR(TO_NUMBER(TRIM(Substr(d.nisandoc,instr(d.nisandoc,''-'')+1)))) CPNODOC, '
        +    ''''+edtCia.Text+''' CIADES,'
        +    ''''+'Desde '+dtpInicio.text+' hasta '+dtpFin.Text+''' RANGO '
        +  'from log304 a, log305 b, log306 c, log314 d, tge205 f '
        +  'where a.ciaid='+QuotedStr(dblcCia.text)
        +    'and odcfemi>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''''+') '
        +    'and odcfemi<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)+''''+') '
        +    'and a.odcest in (''ATENDIDO'',''ACEPTADO'') '
        +    'and a.ciaid=b.ciaid(+) and a.odcid=b.odcid(+) '
        +    'and a.ciaid=c.ciaid(+) and trim(substr(a.numrequsu,1,8))=c.urqid(+) '
        +    'and a.ciaid=d.ciaid(+) and d.nisatip(+)=''INGRESO'' and a.odcid=d.nispord(+) '
        +    'and b.ciaid=f.ciaid(+) and b.artid=f.artid(+) '
        +') A, cxp301 e '
        +'WHERE e.ciaid(+)=a.ciaid and e.cpserie(+)=a.cpserie '
        +  'and e.cpnodoc(+) like ''%''||a.cpnodoc and a.prov=e.prov(+) ';

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
   ppR1.TEMPLATE.FileName:=ExtractFilePath(application.ExeName)+DMFAC.wRutaRpt+'\SeguimientoCompras.rtm';
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

procedure TFSeguimientoCompra.FormCreate(Sender: TObject);
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

procedure TFSeguimientoCompra.dblcCiaExit(Sender: TObject);
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

procedure TFSeguimientoCompra.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFSeguimientoCompra.dblcTInvEnter(Sender: TObject);
begin
  if edtCia.Text='' then dblcCia.SetFocus;
end;

procedure TFSeguimientoCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMFAC.cdsQry12.IndexFieldNames:='';
end;

procedure TFSeguimientoCompra.dblcdServicioExit(Sender: TObject);
begin
   if dblcdServicio.Text<>'' then
      dbeServicios.Text:= DMFAC.cdsRepo2.FieldByName('ARTDES').AsString
   else
      dbeServicios.Text:= '';
end;

procedure TFSeguimientoCompra.bbtnExcel1Click(Sender: TObject);
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
   xSQL:='SELECT a.*, e.cpfemis fecha_fac, e.cpnodoc '
        +'FROM ( '
        +  'select a.ciaid, a.prov, a.provdes, a.odcid, odcfemi, a.numrequsu, '
        +    'b.artid, f.artdes, b.dodccnt, b.dodcpun, b.dodcimp, b.imptot, '
        +    'c.urqid, case when c.urqautofreg is null then c.urqfreg else c.urqautofreg end fecha_req, '
        +    'd.nisaid, d.nisafreg fecha_ing, d.nisandoc, '
        +    'Substr(d.nisandoc,1,instr(d.nisandoc,''-'')-1) CPSERIE, '
        +    'TO_CHAR(TO_NUMBER(TRIM(Substr(d.nisandoc,instr(d.nisandoc,''-'')+1)))) CPNODOC, '
        +    ''''+edtCia.Text+''' CIADES,'
        +    ''''+'Desde '+dtpInicio.text+' hasta '+dtpFin.Text+''' RANGO '
        +  'from log304 a, log305 b, log306 c, log314 d, tge205 f '
        +  'where a.ciaid='+QuotedStr(dblcCia.text)
        +    'and odcfemi>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''''+') '
        +    'and odcfemi<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)+''''+') '
        +    'and a.odcest in (''ATENDIDO'',''ACEPTADO'') '
        +    'and a.ciaid=b.ciaid(+) and a.odcid=b.odcid(+) '
        +    'and a.ciaid=c.ciaid(+) and trim(substr(a.numrequsu,1,8))=c.urqid(+) '
        +    'and a.ciaid=d.ciaid(+) and d.nisatip(+)=''INGRESO'' and a.odcid=d.nispord(+) '
        +    'and b.ciaid=f.ciaid(+) and b.artid=f.artid(+) '
        +') A, cxp301 e '
        +'WHERE e.ciaid(+)=a.ciaid and e.cpserie(+)=a.cpserie '
        +  'and e.cpnodoc(+) like ''%''||a.cpnodoc and a.prov=e.prov(+) ';

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

procedure TFSeguimientoCompra.FormShow(Sender: TObject);
begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));
end;

end.
