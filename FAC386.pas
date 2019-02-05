unit FAC386;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, wwdbedit, Grids, Wwdbigrd, Wwdbgrid;

type
  TFBuscarPagos = class(TForm)
    dbeCliente: TwwDBEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    dbgTransf: TwwDBGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBuscarPagos: TFBuscarPagos;

implementation

{$R *.dfm}

USES FACDM;

procedure TFBuscarPagos.BitBtn1Click(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='SELECT A.*, B.CPTODES '
       +'FROM CXC_ING_VAR_SER A, CAJA201 B '
       +'WHERE NOMBRE LIKE '''+dbeCliente.Text+'%'' AND B.CPTOID=A.CPTOID '
       +'Order by FORPAG, NUMDOCPAG';
  DMFAC.cdsQry5.Close;
  DMFAC.cdsQry5.DataRequest( xSQL );
  DMFAC.cdsQry5.Open;

  if DMFAC.cdsQry5.Recordcount=0 then
  begin
     ShowMessage('No existen Facturas Generadas para el Cliente');
     Exit;
  end;
end;

procedure TFBuscarPagos.FormActivate(Sender: TObject);
begin
  dbgTransf.DataSource:=DMFAC.dsQry5;
end;

end.
