unit FAC384;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, wwdbedit, Grids, Wwdbigrd, Wwdbgrid;

type
  TFBuscarFactura = class(TForm)
    dbgBoletas: TwwDBGrid;
    dbeCliente: TwwDBEdit;
    Label1: TLabel;
    dbeNombre: TwwDBEdit;
    dbeFPago: TwwDBEdit;
    dbeNumero: TwwDBEdit;
    dbeTM: TwwDBEdit;
    dbeImporte: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure dbgBoletasDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBuscarFactura: TFBuscarFactura;

implementation

{$R *.dfm}

USES FACDM;

procedure TFBuscarFactura.FormActivate(Sender: TObject);
begin
   dbeCliente.DataSource:=DMFAC.dsQry9;
   dbeNombre.DataSource :=DMFAC.dsQry9;
   dbeFPago.DataSource  :=DMFAC.dsQry9;
   dbeNumero.DataSource :=DMFAC.dsQry9;
   dbeTM.DataSource     :=DMFAC.dsQry9;
   dbeImporte.DataSource:=DMFAC.dsQry9;
   dbgBoletas.DataSource:=DMFAC.dsQry5;
end;

procedure TFBuscarFactura.dbgBoletasDblClick(Sender: TObject);
var
  xSQL : String;
begin
  if MessageDlg(' ¿ Esta seguro(a) de Relacionar Pago a Boleta/Factura ? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
     xSQL:='Update FAC305 SET DOCPAG='''   +DMFAC.cdsQry9.FieldByName('DOCPAG').AsString   +''', '
          +                  'NUMDOCPAG='''+DMFAC.cdsQry9.FieldByName('NUMDOCPAG').AsString+''' '
          +'Where CIAID='''   +DMFAC.cdsQry5.FieldByName('CIAID').AsString+''' '
          +  'AND DOCID='''   +DMFAC.cdsQry5.FieldByName('DOCID').AsString   +''' '
          +  'AND FACSERIE='''+DMFAC.cdsQry5.FieldByName('FACSERIE').AsString+''' '
          +  'AND NFAC='''    +DMFAC.cdsQry5.FieldByName('NFAC').AsString    +''' '
          +  'AND FACFECHA='''+DMFAC.cdsQry5.FieldByName('FACFECHA').AsString+''' ';
      try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      except
         ShowMessage('Error al Grabar');
         Exit;
      end;

      xSQL:='UPDATE CXC_ING_VAR_SER '
           +  'SET CIAFAC='''   +DMFAC.cdsQry5.FieldByName('CIAID').AsString+''', '
           +      'DOCID='''    +DMFAC.cdsQry5.FieldByName('DOCID').AsString+''', '
           +      'SERIE='''    +DMFAC.cdsQry5.FieldByName('FACSERIE').AsString +''', '
           +      'NODOC='''    +DMFAC.cdsQry5.FieldByName('NFAC').AsString     +''', '
           +      'FECFAC='''   +DMFAC.cdsQry5.FieldByName('FACFECHA').AsString +''', '
           +      'USUDOC='''   +DMFAC.cdsQry5.FieldByName('FACUSER').AsString+''', '
           +      'FECREGDOC='''+DMFAC.cdsQry5.FieldByName('FACFREG').AsString+''' '
           +'WHERE DOCPAG='   +Quotedstr(DMFAC.cdsQry9.FieldByName('DOCPAG').AsString   )+' '
           +  'AND NUMDOCPAG='+Quotedstr(DMFAC.cdsQry9.FieldByName('NUMDOCPAG').AsString)+' '
           +  'AND NODOC IS NULL';
      try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      except
         ShowMessage('Error al Grabar');
         Exit;
      end;
      ShowMessage('ok');
   end;
end;

end.
