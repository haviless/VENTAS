unit FAC380;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, Grids, Wwdbigrd, Wwdbgrid,
  Mask;

type
  TFTransfRecibos = class(TForm)
    dbgRecibos: TwwDBGrid;
    dtpFecha: TwwDBDateTimePicker;
    bbtnFiltrar: TBitBtn;
    bbtnTranfTodo: TBitBtn;
    bbtnTransfUno: TBitBtn;
    meReg: TMaskEdit;
    Label1: TLabel;
    procedure bbtnFiltrarClick(Sender: TObject);
    procedure bbtnTranfTodoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnTransfUnoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTransfRecibos: TFTransfRecibos;

implementation

{$R *.dfm}

uses FacDM;


procedure TFTransfRecibos.bbtnFiltrarClick(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='Select CCFEMIS, CCNODOC, A.TMONID, NCOMTOORI, '
       +   'CLAUXID, CLIEID, CLIERUC, A.CCNOMB, A.CPTOID, B.CPTODES '
       +'From CXC303 A, CAJA201 B '
       +'WHERE A.CIAID=''02'' and CCFEMIS='''+dtpFecha.Text+''' AND NCOESTADO=''C'' '
       + ' AND A.CPTOID=B.CPTOID AND ARTID IS NOT NULL '
       + ' AND NOT EXISTS( SELECT NUMDOCPAG FROM CXC_ING_VAR_SER C '
       +                  'WHERE FORPAG=''CAJA'' AND A.CCNODOC=C.NUMDOCPAG ) '
       +'ORDER BY CCFEMIS, CCNODOC';

  DMFAC.cdsQry12.Close;
  DMFAC.cdsQry12.DataRequest( xSQL );
  DMFAC.cdsQry12.Open;

  meReg.Text:= IntToStr(DMFAC.cdsQry12.RecordCount);
end;

procedure TFTransfRecibos.bbtnTranfTodoClick(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='Insert into CXC_ING_VAR_SER( CIAID, CLAUXID, CLIEID, RUCDNI, NOMBRE, CPTOID, TMONID, '
       +   'IMPORTE, FORPAG, FECPAG, TIPCAM, USUREG, FECREG, DOCPAG, NUMDOCPAG ) '
       +'Select A.CIAID, CLAUXID, CLIEID, CLIERUC, A.CCNOMB, A.CPTOID, A.TMONID, NCOMTOORI, ''CAJA'', '
       +   'CCFEMIS, NCOTCAMB, NCOUSER, NCOFREG, DOCID, CCNODOC '
       +'From CXC303 A, CAJA201 B '
       +'WHERE A.CIAID=''02'' and CCFEMIS='''+dtpFecha.Text+''' and NCOESTADO=''C'' '
       + ' AND A.CPTOID=B.CPTOID AND ARTID IS NOT NULL '
       + ' AND NOT EXISTS( SELECT NUMDOCPAG FROM CXC_ING_VAR_SER C '
       +                  'WHERE FORPAG=''CAJA'' AND A.CCNODOC=C.NUMDOCPAG ) '
       +'ORDER BY CCFEMIS, CCNODOC';

  DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);

  bbtnFiltrarClick(self);

  ShowMessage('ok');
end;

procedure TFTransfRecibos.FormCreate(Sender: TObject);
begin
  dbgRecibos.DataSource:=DMFAC.dsQry12;

  dtpFecha.Date:=DATE;

  bbtnFiltrarClick(self);
end;

procedure TFTransfRecibos.bbtnTransfUnoClick(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='Insert into CXC_ING_VAR_SER( CIAID, CLAUXID, CLIEID, RUCDNI, NOMBRE, CPTOID, TMONID, '
       +   'IMPORTE, FORPAG, FECPAG, TIPCAM, USUREG, FECREG, DOCPAG, NUMDOCPAG ) '
       +'Select A.CIAID, CLAUXID, CLIEID, CLIERUC, A.CCNOMB, A.CPTOID, A.TMONID, NCOMTOORI, ''CAJA'', '
       +   'CCFEMIS, NCOTCAMB, NCOUSER, NCOFREG, DOCID, CCNODOC '
       +'From CXC303 A, CAJA201 B '
       +'WHERE A.CIAID=''02'' and CCFEMIS='''+dtpFecha.Text+''' AND NCOESTADO=''C'' '
       + ' AND A.CCNODOC='''+DMFAC.cdsQry12.FieldByName('CCNODOC').AsString+'''' 
       + ' AND A.CPTOID=B.CPTOID AND ARTID IS NOT NULL '
       +'ORDER BY CCFEMIS, CCNODOC';

  DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);

  bbtnFiltrarClick(self);

  ShowMessage('ok');
end;

end.
