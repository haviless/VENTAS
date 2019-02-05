unit FAC800;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, wwdblook, ppEndUsr,
  ppBands, ppCache, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DB, ppCtrls, ppVar, ppPrnabl, ppParameter, Mask, wwdbedit,
  Wwdbdlg;

type
  TFVentaConcesiones = class(TForm)
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
    cbDiseno: TCheckBox;
    procedure bbtnRep2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTInvEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcdServicioExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVentaConcesiones: TFVentaConcesiones;

implementation

{$R *.dfm}

uses FacDM, oaVE3000;

procedure TFVentaConcesiones.bbtnRep2Click(Sender: TObject);
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

   xSQL:='SELECT C.CCNODOC, D.CIADES, A.*, '
        +  '''DESDE '+dtpInicio.Text+' HASTA '+dtpFin.Text+''' RANGO '
        +'FROM FAC306 A, FAC305 B, TGE101 D, TGE205 L '
        +'WHERE A.CIAID='+QuotedStr(dblcCia.text)+' and A.TINID=''00'' '
        + ' and A.ARTID like ''%'+dblcdServicio.text+''' '
        + ' AND A.CIAID=B.CIAID AND A.DOCID=B.DOCID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
        + ' AND B.FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''''+') '
        +  'AND B.FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)+''''+') '
        +  'AND B.FACESTADO=''ACEPTADO'' '
        +  'AND (A.CIAID=D.CIAID(+)) '
        +  'AND (L.CIAID(+)=A.CIAID and L.TINID(+)=A.TINID AND L.ARTID(+)=A.ARTID) '
        +'ORDER BY A.CIAID, A.FACFECHA, A.DOCID, A.FACSERIE, A.NFAC';

   xSQL:='SELECT D.CIADES, A.*, '
        +  ''' '' CCNODOC, '' '' CCMTOORI, '' '' TITNC, '' '' TITNC2, '' '' NC, '
        +  '''DESDE '+dtpInicio.Text+' HASTA '+dtpFin.Text+''' RANGO '
        +'FROM FAC306 A, FAC305 B, TGE101 D, TGE205 L '
        +'WHERE A.CIAID='+QuotedStr(dblcCia.text)+' and A.TINID=''00'' '
        + ' and A.ARTID like ''%'+dblcdServicio.text+''' '
        + ' AND A.CIAID=B.CIAID AND A.DOCID=B.DOCID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
        + ' AND B.FACFECHA>='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpInicio.date)+''''+') '
        +  'AND B.FACFECHA<='+DMFAC.wRepFuncDate+''''+ FORMATDATETIME(DMFAC.wFormatFecha,dtpFin.date)+''''+') '
        +  'AND B.FACESTADO=''ACEPTADO'' '
        +  'AND (A.CIAID=D.CIAID(+)) '
        +  'AND (L.CIAID(+)=A.CIAID and L.TINID(+)=A.TINID AND L.ARTID(+)=A.ARTID) '
        +  'AND NOT EXISTS '
        +      '( SELECT C.CCNODOC FROM CXC304 C, CXC301 E '
        +        'WHERE A.CIAID=C.CIAID(+) AND A.DOCID=C.DOCID(+) AND A.FACSERIE=C.CCSERIE(+) AND A.NFAC=C.CCNODOC(+) '
        +          'AND C.CIAID=E.CIAID(+) AND C.TCANJEID=E.TCANJEID(+) AND C.CCCANJE=E.CCCANJE(+) AND E.CCESTADO=''P'' '
        +      ') '
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

procedure TFVentaConcesiones.FormCreate(Sender: TObject);
var
   xSQL : String;
begin

  dblcCia.LookupTable      := DMFAC.cdsCia;

  dblcCia.Enabled:=True;
  if DMFAC.cdsCia.RecordCount=1 then
  begin
     dblcCia.Enabled:=False;
     xSQL:='Select CIAID, ARTID, ARTDES from TGE205 where CIAID='''+DMFAC.cdsCia.FieldByName('CIAID').AsString+''' AND CONCESION=''S''';
     DMFAC.cdsRepo2.Close;
     DMFAC.cdsRepo2.DataRequest( xSQL );
     DMFAC.cdsRepo2.Open;
     dblcdServicio.LookupTable:= DMFAC.cdsRepo2;
  end;

  dtpInicio.Date:=Date;
  dtpFin.Date   :=Date;
  dblcCia.Text :=DMFAC.cdsCia.FieldByName('CIAID').AsString;
  edtCia.Text  :=DMFAC.cdsCia.FieldByName('CIADES').AsString;
end;

procedure TFVentaConcesiones.dblcCiaExit(Sender: TObject);
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
   xSQL:='Select CIAID, ARTID, ARTDES from TGE205 where CIAID='''+dblcCia.Text+''' AND CONCESION=''S''';
   DMFAC.cdsRepo2.Close;
   DMFAC.cdsRepo2.DataRequest( xSQL );
   DMFAC.cdsRepo2.Open;
   dblcdServicio.LookupTable:= DMFAC.cdsRepo2;
end;

procedure TFVentaConcesiones.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFVentaConcesiones.dblcTInvEnter(Sender: TObject);
begin
  if edtCia.Text='' then dblcCia.SetFocus;
end;

procedure TFVentaConcesiones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMFAC.cdsQry12.IndexFieldNames:='';
end;

procedure TFVentaConcesiones.dblcdServicioExit(Sender: TObject);
begin
   dbeServicios.Text:= DMFAC.cdsRepo2.FieldByName('ARTDES').AsString;
end;

procedure TFVentaConcesiones.BitBtn1Click(Sender: TObject);
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

procedure TFVentaConcesiones.FormShow(Sender: TObject);
begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));
end;

end.
