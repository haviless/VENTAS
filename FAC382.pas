unit FAC382;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, Grids, Wwdbigrd, Wwdbgrid,
  Mask;

type
  TFTransfCredito = class(TForm)
    dbgRecibos: TwwDBGrid;
    dtpFecha: TwwDBDateTimePicker;
    bbtnFiltrar: TBitBtn;
    bbtnTranfTodo: TBitBtn;
    bbtnTransfUno: TBitBtn;
    meReg: TMaskEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    bbtnBuscaAnu: TBitBtn;
    procedure bbtnFiltrarClick(Sender: TObject);
    procedure bbtnTranfTodoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnTransfUnoClick(Sender: TObject);
    procedure bbtnBuscaAnuClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    cCpto   : String;
    cFecIni : String;
  public
    { Public declarations }
    cImporte : String;
  end;

var
  FTransfCredito: TFTransfCredito;

implementation

{$R *.dfm}

uses FacDM;


procedure TFTransfCredito.bbtnFiltrarClick(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='Select CREFOTORG, CREDID, A.TMONID, CREMONINS CREMTOOTOR, TIPCREID, '
       +   '''AS'' CLAUXID, ASOID, ASODNI, ASOAPENOM, B.CPTOID, B.CPTODES '
       +'From CRE301 A, CAJA201 B '
       +'WHERE CREFOTORG>='''+cFecIni+''' AND CREFOTORG<='''+dtpFecha.Text+''' '
       + ' AND TIPCREID IN (''91'',''92'') AND NOT CREESTID IN (''13'',''04'') '
       + ' AND CREMONINS>='+cImporte+' AND A.CIAID=''02'' '
       + ' AND '''+cCpto+'''=B.CPTOID AND ARTID IS NOT NULL '
       + ' AND NOT EXISTS( SELECT NUMDOCPAG FROM CXC_ING_VAR_SER C '
       +                  'WHERE FORPAG=''CREDITOS'' AND CREDID=C.NUMDOCPAG ) '
       +'ORDER BY CREDID';
{       +'Union all '
       +'Select CREFOTORG, CREDID, A.TMONID, CREMTOOTOR, TIPCREID, '
       +   '''AS'' CLAUXID, ASOID, ASODNI, ASOAPENOM, B.CPTOID, B.CPTODES '
       +'From CRE301 A, CAJA201 B '
       +'WHERE CREFOTORG>='''+cFecIni+''' AND CREFOTORG<='''+dtpFecha.Text+''' '
       + ' AND TIPCREID IN (''13'') AND NOT CREESTID IN (''13'',''04'') '
       + ' AND ''IN0051''=B.CPTOID AND ARTID IS NOT NULL '
       + ' AND NOT EXISTS( SELECT NUMDOCPAG FROM CXC_ING_VAR_SER C '
       +                  'WHERE FORPAG=''CREDITOS'' AND CREDID=C.NUMDOCPAG ) ';}
  DMFAC.cdsQry12.Close;
  DMFAC.cdsQry12.DataRequest( xSQL );
  DMFAC.cdsQry12.Open;

  meReg.Text:= IntToStr(DMFAC.cdsQry12.RecordCount);
end;

procedure TFTransfCredito.bbtnTranfTodoClick(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='Insert into CXC_ING_VAR_SER( CIAID, CLAUXID, CLIEID, RUCDNI, NOMBRE, CPTOID, TMONID, '
       +   'IMPORTE, FORPAG, FECPAG, TIPCAM, USUREG, FECREG, DOCPAG, NUMDOCPAG ) '
       +'Select A.CIAID, ''AS'' CLAUXID, ASOID, ASODNI, ASOAPENOM, ''IN0136'' CPTOID, A.TMONID, '
       +   'CREMONINS IMPORTE, ''CREDITOS'', CREFOTORG, TCAMVOV, USUARIO, FREG, ''67'' DOCID, CREDID '
       +'From CRE301 A, CAJA201 B, TGE107 C '
       +'WHERE CREFOTORG>='''+cFecIni+''' AND CREFOTORG<='''+dtpFecha.Text+''' '
       + ' AND TIPCREID IN ( ''91'',''92'' ) AND NOT CREESTID IN (''13'',''04'') '
       + ' AND CREMONINS>='+cImporte+' AND A.CIAID=''02'' '
       + ' AND '''+cCpto+'''=B.CPTOID AND ARTID IS NOT NULL '
       + ' AND NOT EXISTS( SELECT NUMDOCPAG FROM CXC_ING_VAR_SER C '
       +                  'WHERE FORPAG=''CREDITOS'' AND CREDID=C.NUMDOCPAG ) '
       + ' AND FREG=FECHA ';
{       +'Union all '
       +'Select A.CIAID, ''AS'' CLAUXID, ASOID, ASODNI, ASOAPENOM, ''IN0051'' CPTOID, A.TMONID, '
       +   'CREMTOOTOR, ''CREDITO'', CREFOTORG, TCAMVOV, USUARIO, FREG, ''67'' DOCID, CREDID '
       +'From CRE301 A, CAJA201 B, TGE107 C '
       +'WHERE CREFOTORG>='''+cFecIni+''' AND CREFOTORG<='''+dtpFecha.Text+''' '
       + ' AND TIPCREID IN (''13'') AND NOT CREESTID IN (''13'',''04'') '
       + ' AND ''IN0051''=B.CPTOID AND ARTID IS NOT NULL '
       + ' AND NOT EXISTS( SELECT NUMDOCPAG FROM CXC_ING_VAR_SER C '
       +                  'WHERE FORPAG=''CREDITOS'' AND CREDID=C.NUMDOCPAG ) '
       + ' AND FREG=FECHA ';}

  DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);

  bbtnFiltrarClick(self);

  ShowMessage('ok');
end;

procedure TFTransfCredito.FormCreate(Sender: TObject);
var
   xSQL : String;
begin
  dbgRecibos.DataSource:=DMFAC.dsQry12;

  dtpFecha.Date:=DATE;

  cCpto   := 'IN0136';  //'IN0050';
  cFecIni := '01/01/2010';   //'20/01/2006'

// encinas 2006  xSQL:='select * from CAJA201 where CPTOID=''IN0050''';
  xSQL:='select * from CAJA201 where CPTOID='''+cCpto+'''';
  DMFAC.cdsQry6.Close;
  DMFAC.cdsQry6.DataRequest(xSql);
  DMFAC.cdsQry6.Open;

// encinas 2006  cImporte:=DMFAC.cdsQry6.FieldByname('IMPORTE').AsString;
//  cImporte:=DMFAC.cdsQry6.FieldByname('IMP_02').AsString;
  cImporte:='100';

  bbtnFiltrarClick(self);
end;

procedure TFTransfCredito.bbtnTransfUnoClick(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='Insert into CXC_ING_VAR_SER( CIAID, CLAUXID, CLIEID, RUCDNI, NOMBRE, CPTOID, TMONID, '
       +   'IMPORTE, FORPAG, FECPAG, TIPCAM, USUREG, FECREG, DOCPAG, NUMDOCPAG ) '
       +'Select A.CIAID, ''AS'' CLAUXID, ASOID, ASODNI, ASOAPENOM, '
       +   ''''+DMFAC.cdsQry12.FieldByName('CPTOID').AsString+''' CPTOID, A.TMONID, '
       +   DMFAC.cdsQry12.FieldByName('CREMTOOTOR').AsString+' IMPORTE, '
       +   '''CREDITOS'', CREFOTORG, '
       +   'TCAMVOV, USUARIO, FREG, ''67'' DOCID, CREDID '
       +'From CRE301 A, CAJA201 B, TGE107 C '
       +'WHERE CREFOTORG>='''+cFecIni+''' AND CREFOTORG<='''+dtpFecha.Text+''' '
       + ' AND TIPCREID IN ( '''+DMFAC.cdsQry12.FieldByName('TIPCREID').AsString+''' ) '
       + ' AND NOT CREESTID IN (''13'',''04'') AND A.CIAID=''02'' '
       + ' AND A.CREDID='''+DMFAC.cdsQry12.FieldByName('CREDID').AsString+''''
       + ' AND '''+DMFAC.cdsQry12.FieldByName('CPTOID').AsString+'''=B.CPTOID AND ARTID IS NOT NULL '
       + ' AND NOT EXISTS( SELECT NUMDOCPAG FROM CXC_ING_VAR_SER C '
       +                  'WHERE FORPAG=''CREDITOS'' AND CREDID=C.NUMDOCPAG ) '
       + ' AND FREG=FECHA '
       +'ORDER BY CREFOTORG, CREDID';

  DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);

  bbtnFiltrarClick(self);

  ShowMessage('ok');
end;

procedure TFTransfCredito.bbtnBuscaAnuClick(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='Select CREFOTORG, CREDID, A.TMONID, CREMONINS CREMTOOTOR, TIPCREID, '
       +   '''AS'' CLAUXID, ASOID, ASODNI, ASOAPENOM, B.CPTOID, B.CPTODES '
       +'From CRE301 A, CAJA201 B '
       +'WHERE CREFOTORG>='''+cFecIni+''' AND CREFOTORG<='''+dtpFecha.Text+''' '
       + ' AND TIPCREID IN (''91'',''92'') AND CREESTID IN (''13'',''04'') '
       + ' AND CREMONINS>='+cImporte+' AND A.CIAID=''02'' '
       + ' AND '''+cCpto+'''=B.CPTOID AND ARTID IS NOT NULL '
       + ' AND EXISTS( SELECT NUMDOCPAG FROM CXC_ING_VAR_SER C '
       +              'WHERE FORPAG=''CREDITOS'' AND CREDID=C.NUMDOCPAG ) ';
{       +'Union all '
       +'Select CREFOTORG, CREDID, A.TMONID, CREMTOOTOR, TIPCREID, '
       +   '''AS'' CLAUXID, ASOID, ASODNI, ASOAPENOM, B.CPTOID, B.CPTODES '
       +'From CRE301 A, CAJA201 B '
       +'WHERE CREFOTORG>='''+cFecIni+''' AND CREFOTORG<='''+dtpFecha.Text+''' '
       + ' AND TIPCREID IN (''13'') AND CREESTID IN (''13'',''04'') '
       + ' AND ''IN0051''=B.CPTOID AND ARTID IS NOT NULL '
       + ' AND EXISTS( SELECT NUMDOCPAG FROM CXC_ING_VAR_SER C '
       +              'WHERE FORPAG=''CREDITOS'' AND CREDID=C.NUMDOCPAG ) ';}

  DMFAC.cdsQry12.Close;
  DMFAC.cdsQry12.DataRequest( xSQL );
  DMFAC.cdsQry12.Open;

  meReg.Text:= IntToStr(DMFAC.cdsQry12.RecordCount);end;

procedure TFTransfCredito.BitBtn1Click(Sender: TObject);
var
   xSQL : String;
begin
  if MessageDlg(' ¿ Esta seguro(a) de Eliminar Credito ? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
     xSQL:='Delete from CXC_ING_VAR_SER '
          +'WHERE NUMDOCPAG='''+DMFAC.cdsQry12.FieldByName('CREDID').AsString+''' '
          +  'and CLIEID='''   +DMFAC.cdsQry12.FieldByName('ASOID').AsString   +'''';
     DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);

     bbtnBuscaAnuClick( self );
  end;
end;

end.
