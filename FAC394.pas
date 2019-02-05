unit FAC394;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, wwdblook, ExtCtrls,
  Mask, wwdbedit, Spin;

type
  TFCombos = class(TForm)
    pnlDet: TPanel;
    dbgDet: TwwDBGrid;
    pnlCab: TPanel;
    dbgCab: TwwDBGrid;
    Label1: TLabel;
    dblcLPrecio: TwwDBLookupCombo;
    edtLPrecio: TEdit;
    Label14: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    bbtnRegOk: TBitBtn;
    Label6: TLabel;
    dblcTinid: TwwDBLookupCombo;
    edtTinid: TEdit;
    bbtnMostrar: TBitBtn;
    Panel1: TPanel;
    dbeCod: TwwDBEdit;
    dbeNombre: TwwDBEdit;
    Panel2: TPanel;
    Label3: TLabel;
    dbePrePub: TwwDBEdit;
    Label2: TLabel;
    dbeStock: TwwDBEdit;
    pnlVenta: TPanel;
    Label4: TLabel;
    bbtnVenta: TBitBtn;
    seCant: TSpinEdit;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTinidExit(Sender: TObject);
    procedure bbtnMostrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcLPrecioExit(Sender: TObject);
    procedure CalculaFooter;
    procedure bbtnRegOkClick(Sender: TObject);
    procedure dblcLPrecioEnter(Sender: TObject);
    procedure dbgCabRowChanged(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure dbgCabDblClick(Sender: TObject);
    procedure bbtnVentaClick(Sender: TObject);
  private
    { Private declarations }
    procedure CostoDeArticulo;
    function StockCombo : Double;
  public
    { Public declarations }
  end;

var
  FCombos: TFCombos;

implementation

{$R *.dfm}

uses FACDM, oaVE2000;

procedure TFCombos.dblcCiaExit(Sender: TObject);
var
  xSQL : String;
begin
  edtCia.Text:= DMFAC.BuscaQry('dspUltTGE','TGE101','CIADES, FLAG','CIAID='+QuotedStr(dblcCia.Text),'CIADES');
	if length(edtCia.Text)=0 then
	begin
		ShowMessage('Compañía no Existe');
		dblcCia.Text:='';
		dblcCia.SetFocus;
	end;

  xSQL:='SELECT * FROM FAC101 '
       +'WHERE CIAID='+quotedStr(dblcCia.Text)+' and TLISTAFLAG=''S''';
	DMFAC.cdsTLista.Close;
	DMFAC.cdsTLista.DataRequest( xSQL );
	DMFAC.cdsTLista.Open;

	{DMFAC.cdsTInven.Close;
	DMFAC.cdsTInven.DataRequest('SELECT * FROM TGE152 WHERE CIAID='''+dblcCia.Text+''' and tinid='''+dblcTinid.Text+''' AND TINVENTAS=''S''');
	DMFAC.cdsTInven.Open;}
end;

procedure TFCombos.dblcTinidExit(Sender: TObject);
var
  xWhere : String;
begin
  xWhere := 'CIAID='+quotedstr(dblcCia.Text)+' and TINID='+quotedstr(dblcTinid.text);
	edtTinid.Text:= DMFAC.BuscaQry('dspUltTGE','TGE152','TINDES',xWhere,'TINDES');
	if length(edtTinid.text)=0 then
	begin
		Showmessage('Ingrese el Tipo de Inventario');
		dblcTinid.SetFocus;
	end;
end;

procedure TFCombos.bbtnMostrarClick(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Select A.*, 0.00 STOCK, 0.00 CANT from FAC_COM_CAB A '
        +'Where CIAID='''+dblcCia.Text+''' AND TINID='''+dblcTinid.Text+''' AND ACTIVO=''S'' '
        +'ORDER BY CODCOM';
   DMFAC.cdsCabPed.Close;
   DMFAC.cdsCabPed.DataRequest( xSQL );
   DMFAC.cdsCabPed.Open;

   if DMFAC.cdsTLista.RecordCount>0 then
   begin
      dblcLPrecio.Text:=DMFAC.cdsTLista.FieldByname('TLISTAID').AsString;
      dblcLPrecioExit(self);
   end;
end;

procedure TFCombos.FormCreate(Sender: TObject);
var
   xSQL : String;
begin
   dbgCab.DataSource:=DMFAC.dsCabPed;
   dbgDet.DataSource:=DMFAC.dsDetPed;

   xSQL:='Select 0.00 PREVEN, 0.00 PREPUB, 0.00 STOCK from DUAL';
   DMFAC.cdsTReg.Close;
   DMFAC.cdsTReg.DataRequest( xSQL );
   DMFAC.cdsTReg.Open;

end;

procedure TFCombos.dblcLPrecioExit(Sender: TObject);
var
 	xWhere : String;
begin
	if length(dblcLPrecio.text)=0 then
		raise exception.create('Seleccione una Lista de Precios');
	xWhere := 'TLISTAID='+quotedstr(dblcLPrecio.Text)+' AND CIAID='+QuotedStr(dblcCia.Text);

	edtLPrecio.Text:=DMFAC.Buscaqry('dspUltTGE','FAC101','TLISTADES',xWhere,'TLISTADES');
end;

procedure TFCombos.CalculaFooter;
var
   dPreVen, dPrePub, dCosto : double;
begin

  dPreVen:=0;
  dPrePub:=0;
  dCosto:=0;

  DMFAC.cdsDetPed.DisableControls;
  DMFAC.cdsDetPed.First ;
  while not DMFAC.cdsDetPed.Eof do
  begin
     dPreVen:=dPreVen+DMFAC.cdsDetPed.FieldByName('PREVEN').AsFloat;
     dPrePub:=dPrePub+DMFAC.cdsDetPed.FieldByName('PREPUB').AsFloat;
     dCosto :=dCosto +DMFAC.cdsDetPed.FieldByName('COSTO').AsFloat;
     DMFAC.cdsDetPed.Next;
  end;

  DMFAC.cdsTReg.Edit;
  DMFAC.cdsTReg.FieldByname('PREVEN').AsFloat:=dPreVen;
  DMFAC.cdsTReg.FieldByname('PREPUB').AsFloat:=dPrePub;
  DMFAC.cdsTReg.Post;

  DMFAC.cdsDetPed.First;
  DMFAC.cdsDetPed.EnableControls;
end;


procedure TFCombos.bbtnRegOkClick(Sender: TObject);
VAR
  xSQL  : String;
begin

  xSQL:='select A.*, 0.00 STOCK, 0.00 COSTO from FAC_COM_DET A '
        +'Where CIAID='''   +dblcCia.Text+''' AND TINID='''+dblcTinid.Text  +''' '
        +  'and CODCOM='''  +DMFAC.cdsCabPed.FieldByname('CODCOM').AsString+''' '
        +  'and TLISTAID='''+dblcLPrecio.Text +''' ';
  DMFAC.cdsDetPed.Close;
  DMFAC.cdsDetPed.DataRequest( xSQL );
  DMFAC.cdsDetPed.Open;
  DMFAC.cdsDetPed.EnableControls;

  DMFAC.cdsTReg.Edit;
  DMFAC.cdsTReg.FieldByName('STOCK').AsFloat:=StockCombo;
  DMFAC.cdsTReg.Post;

  CalculaFooter;
end;

Function TFCombos.StockCombo : Double;
var
  dCont : Double;
begin
  dCont:=0;
  if DMFAC.cdsDetPed.RecordCount>0 then
     dCont:=10000;
  DMFAC.cdsDetPed.First;
  while not DMFAC.cdsDetPed.Eof do
  begin
     CostoDeArticulo;
     DMFAC.cdsDetPed.Edit;
     DMFAC.cdsDetPed.FieldByName('STOCK').AsFloat:=DMFAC.cdsQry10.FieldByName('STKSACTG').AsFloat;

     if DMFAC.cdsQry10.FieldByName('STKSACTG').AsFloat<dCont then
        dCont:=DMFAC.cdsQry10.FieldByName('STKSACTG').AsFloat;
     {
     if DMFAC.cdsDetPed.FieldByName('TMONID').AsString=DMFAC.wTMonLoc then
        DMFAC.cdsDetPed.FieldByName('COSTO').AsFloat:=DMFAC.cdsQry10.FieldByName('PFS').AsFloat
     else
        DMFAC.cdsDetPed.FieldByName('COSTO').AsFloat:=DMFAC.cdsQry10.FieldByName('PFD').AsFloat;
     }
     DMFAC.cdsDetPed.Post;
     DMFAC.cdsDetPed.Next;
  end;
  Result:=dCont
end;


procedure TFCombos.CostoDeArticulo;
var
   xSQL, cFecha, cAno : String;
begin
   cFecha:=DateToStr(Date);
   cAno  :=Copy( cFecha,7,4);
   xSQL:='Select B.NISSIT, B.NISAFREG, A.CIAID, A.TINID, A.ALMID, A.TDAID, A.NISAID, A.NISATIP, '
        +  'KDXCNTG, A.ARTPCG PFS, ROUND(A.ARTPCG/D.TCAMVBC,2) PFD, D.TCAMVBC TC, '
        +  'S.ALMID, S.STKSACTG '
        +'From LOG315 A, LOG314 B, TGE205 C, TGE107 D, LOG316 S '
        +'Where A.CIAID='''+DMFAC.cdsDetPed.FieldByname('CIAID').AsString+''' '
        +  'AND A.TINID='''+DMFAC.cdsDetPed.FieldByname('TINID').AsString+''' '
        +  'AND A.ARTID='''+DMFAC.cdsDetPed.FieldByname('ARTID').AsString+''' '
        +  'AND A.NISATIP=''INGRESO'' '
        +  'and A.NISAFREG>=''01/01/2005'' '
        +  'and A.CIAID=B.CIAID and A.TINID=B.TINID and A.TDAID=B.TDAID and A.ALMID=B.ALMID '
        +  'and A.NISATIP=B.NISATIP and A.NISAID=B.NISAID and B.NISSIT=''ACEPTADO'' '
        +  'and A.CIAID=C.CIAID(+) and A.TINID=C.TINID(+) and A.ARTID=C.ARTID(+) '
        +  'and B.NISAFREG=D.FECHA(+) '
        +  'and A.CIAID=S.CIAID(+) and A.TINID=S.TINID(+) and A.ARTID=S.ARTID(+) '
        +  'and S.STKANO(+)='''+cAno+''' and STKSACTG(+)>0 '
        +'ORDER BY B.NISAFREG DESC';

   xSQL:='Select S.CIAID, S.TINID, S.ARTID, S.ALMID, S.STKSACTG '
        +'From LOG316 S '
        +'Where S.CIAID='''+DMFAC.cdsDetPed.FieldByname('CIAID').AsString+''' '
        +  'AND S.TINID='''+DMFAC.cdsDetPed.FieldByname('TINID').AsString+''' '
        +  'AND S.ARTID='''+DMFAC.cdsDetPed.FieldByname('ARTID').AsString+''' '
        +  'and S.STKANO(+)='''+cAno+''' and STKSACTG(+)>0 ';
   DMFAC.cdsQry10.Close;
   DMFAC.cdsQry10.IndexFieldNames:='';
   DMFAC.cdsQry10.DataRequest( xSQL );
   DMFAC.cdsQry10.Open;
end;

procedure TFCombos.dblcLPrecioEnter(Sender: TObject);
begin
  DMFAC.cdsDetPed.Close;
end;

procedure TFCombos.dbgCabRowChanged(Sender: TObject);
begin
  DMFAC.cdsDetPed.Close;
  DMFAC.cdsTReg.Edit;
  DMFAC.cdsTReg.FieldByName('STOCK').AsFloat:=0;

  bbtnRegOkClick(Self);
end;

procedure TFCombos.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
	begin
		key := #0;
		perform(CM_Dialogkey, VK_TAB, 0);
	end;
end;

procedure TFCombos.FormActivate(Sender: TObject);
begin

   //dblcCia.Text  :=DMFAC.cdsCIA.FieldByname('CIAID').AsString;
   dblcCiaExit(self);
   //dblcTinid.Text:=DMFAC.cdsTInven.FieldByname('TINID').AsString;
   dblcTinidExit(self);

   dblcCia.Enabled  :=False;
   dblcTinid.Enabled:=False;
   if cFlgComb='V' then
   begin
      dblcLPrecio.Enabled:=False;
      pnlVenta.Visible   :=True;
      bbtnMostrarClick(self);
      bbtnRegOkClick(Self);
   end;
   if cFlgComb='C' then
   begin
      pnlVenta.Visible   :=False;
      bbtnMostrarClick(self);
      bbtnRegOkClick(Self);
   end;
end;

procedure TFCombos.dbgCabDblClick(Sender: TObject);
begin
  if cFlgComb='V' then
  begin

     if seCant.Value<=0 then
     begin
        ShowMessage('Cantidad debe ser Mayor a Cero. Verificar...');
        Exit;
     end;

     if DMFAC.cdsTReg.FieldByName('STOCK').AsInteger<seCant.Value then
     begin
        ShowMessage('Stock no cubre la Cantidad a vender. Verificar...');
        Exit;
     end;

     if StockCombo<=0 then
     begin
        ShowMessage('Combo no tiene Stock. Verificar...');
        Exit;
     end;
     fSelCom:=True;
     Close;
  end;
end;

procedure TFCombos.bbtnVentaClick(Sender: TObject);
begin
   dbgCabDblClick(Self)
end;

end.
