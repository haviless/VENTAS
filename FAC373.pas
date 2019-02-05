unit FAC373;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdblook, Mask, wwdbedit, db,
  MsgDlgs, wwdbdatetimepicker;

type
  TFMontoInicial = class(TForm)
    bbtnRegOk: TBitBtn;
    bbtnRegCanc: TBitBtn;
    dbeMonto: TwwDBEdit;
    Label1: TLabel;
    Label39: TLabel;
    dbeOpe: TwwDBEdit;
    Label38: TLabel;
    dtpFecOpe: TwwDBDateTimePicker;
    procedure bbtnRegCancClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnRegOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeMontoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    cCia : String;
  end;

var
  FMontoInicial: TFMontoInicial;

implementation

uses FacDM, oaVE2000, Fac370;

{$R *.dfm}


procedure TFMontoInicial.bbtnRegCancClick(Sender: TObject);
begin
   Close;
end;

procedure TFMontoInicial.FormShow(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'SELECT 0.00 INICIAL, ''                    '' NUMINI, SYSDATE FECINI FROM DUAL';
   Filtracds( DMFAC.cdsQry9, xWhere );

   DMFAC.cdsQry9.Edit;
   DMFAC.cdsQry9.FieldByName('INICIAL').AsFloat  :=DMFAC.cdsFact2.FieldByName('INICIAL').AsFloat;
   DMFAC.cdsQry9.FieldByName('NUMINI').AsString  :=DMFAC.cdsFact2.FieldByName('NUMINI').AsString;
   DMFAC.cdsQry9.FieldByName('FECINI').AsDateTime:=DMFAC.cdsFact2.FieldByName('FECINI').AsDateTime;
   DMFAC.cdsQry9.Post;
   TNumericField(DMFAC.cdsQry9.FieldByName('INICIAL')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsQry9.FieldByName('INICIAL')).EditFormat    := '########0.00';
   dbeMonto.DataSource :=DMFAC.dsQry9;
   dbeOpe.DataSource   :=DMFAC.dsQry9;
   dtpFecOpe.DataSource:=DMFAC.dsQry9;
end;

procedure TFMontoInicial.bbtnRegOkClick(Sender: TObject);
var
   xSQL, xWhere, xCtaTot, xCPtoTot, xxCcosId : String;
begin

   xSQL:='Select CC_CONTA FROM CXC301 '
        +'WHERE CIAID='''  +DMFAC.cdsFact2.FieldByName('CIAID').AsString   +''' '
        +  'AND CCSERIE='''+DMFAC.cdsFact2.FieldByName('FACSERIE').AsString+''' '
        +  'AND CCNODOC='''+DMFAC.cdsFact2.FieldByName('NFAC').AsString    +''' ';
   FiltraCDS(DMFAC.cdsReporte,xSQL);

   if DMFAC.cdsQry9.FieldByName('INICIAL').AsFloat>DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat then
   begin
      ShowMessage('Importe no puede ser mayor al monto de la Boleta/Factura, Revisar...');
      Exit;
   end;
   {
   if DMFAC.cdsReporte.FieldByName('CC_CONTA').AsString='S' then
   begin
      ShowMessage('NO se puede cambiar el Importe de Cuota Inicial / Nota de Crédito, Factura ya fue transferida a Contabilidad');
      Exit;
   end;
   }
   if MessageDlg('Cambiar el Importe de Cuota Inicial / Nota de Crédito'+chr(13)
                +'                 ¿Esta Seguro?    ',mtConfirmation, [mbYes, mbNo], 0)=mrNo then
   begin
      Exit;
   end;

   Errorcount:=0;
   DMFAC.DCOM1.AppServer.IniciaTransaccion;
   DMFAC.cdsFact2.Edit;
   DMFAC.cdsFact2.FieldByName('INICIAL').AsFloat  :=DMFAC.cdsQry9.FieldByName('INICIAL').AsFloat;
   DMFAC.cdsFact2.FieldByName('NUMINI').AsString  :=DMFAC.cdsQry9.FieldByName('NUMINI').AsString;
   DMFAC.cdsFact2.FieldByName('FECINI').AsDateTime:=DMFAC.cdsQry9.FieldByName('FECINI').AsDateTime;
   DMFAC.cdsFact2.Post;
   DMFAC.ControlTran( 0, DMFAC.cdsFact2, 'FACSGUIA');
   DMFAC.ControlTran( 8, nil, '' );
   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.Open;
   Close;
end;

procedure TFMontoInicial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   TNumericField(DMFAC.cdsQry9.FieldByName('INICIAL')).DisplayFormat := '';
   TNumericField(DMFAC.cdsQry9.FieldByName('INICIAL')).EditFormat    := '';
end;

procedure TFMontoInicial.dbeMontoExit(Sender: TObject);
begin
   DMFAC.cdsQry9.Edit;
   DMFAC.cdsQry9.FieldByName('INICIAL').AsFloat:=FRound( DMFAC.cdsQry9.FieldByName('INICIAL').AsFloat,15,2);
   DMFAC.cdsQry9.Post;
end;

procedure TFMontoInicial.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
    begin
      Key := #0;
      Perform(CM_DialogKey,VK_TAB,0);
    end;
end;

end.
