unit FAC362;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Wwdatsrc, DBClient, wwclient, StdCtrls, wwdblook, Grids,
  Wwdbigrd, Wwdbgrid, Buttons, wwdbdatetimepicker;

type
  TFActVendFactura = class(TForm)
    dbgActBolyFac: TwwDBGrid;
    dblcVendedor: TwwDBLookupCombo;
    cdsBolyFac: TwwClientDataSet;
    dsBolyFac: TwwDataSource;
    cdsVendedores: TwwClientDataSet;
    dsVendedores: TwwDataSource;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    wwDBDateTimePicker2: TwwDBDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Seleccionar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure AbreBoletasyFact;
    procedure dblcVendedorEnter(Sender: TObject);
    procedure dblcVendedorExit(Sender: TObject);
    procedure SeleccionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   FActVendFactura: TFActVendFactura;
   xVez, xSQL, xSerie, xFactura : String;

implementation

uses FacDM;

{$R *.dfm}

procedure TFActVendFactura.FormShow(Sender: TObject);
var
   xDia, xMes, xAno : word;
   xFecha1, xFecha2 : tdatetime;
begin
   xSQL := 'select VEID,VENOMBRES from CXC203 where CIAID=''04'' and VESTATUS=''S'' ';
   cdsVendedores.Close;
   cdsVendedores.DataRequest(xSQL);
   cdsVendedores.Open;
   dblcVendedor.LookupTable := cdsVendedores;
   dblcVendedor.LookupField := 'VEID';
   dblcVendedor.Selected.Clear;
   dblcVendedor.Selected.Add('VEID'#9'5'#9'Vendedor'#9'F');
   dblcVendedor.Selected.Add('VENOMBRES'#9'30'#9'Nombres'#9'F');

   decodedate(date,xAno,xMes,xDia);

   wwDBDateTimePicker1.date := strtodate('01/'+DMFAC.strzero(inttostr(xMes),2)+'/'+inttostr(xAno));
   if xMes=12 then
   begin
      xMes := 1;
      xAno := xAno+1;
   end
   else
      xMes := xMes+1;
   wwDBDateTimePicker2.date := strtodate('01/'+DMFAC.strzero(inttostr(xMes),2)+'/'+inttostr(xAno))-1;

   xVez := '1';
   AbreBoletasyFact;
end;

procedure TFActVendFactura.AbreBoletasyFact;
begin
   xSQL := 'select FAC305.FACSERIE, FAC305.NFAC, FAC305.FACFECHA, FAC305.CLAUXID, FAC305.CLIEID, TGE204.CLIEDES, '
          +'       FAC305.VEID, CXC203.VENOMBRES, '
          +'       FAC305.FACUSER, TGE006.USERNOM, '
          +'       FAC305.FACESTADO '
          +'  from FAC305, CXC203, TGE006, TGE204 '
          +'  where FAC305.CIAID=''04'' '
          +'    and CXC203.CIAID=FAC305.CIAID and CXC203.VEID=FAC305.VEID '
          +'    and TGE006.USERID=FAC305.FACUSER '
          +'    and TGE204.CIAID(+)=''04'' and TGE204.CLIEID(+)=FAC305.CLIEID '
          +'    and FAC305.FACFECHA>='+quotedstr(datetostr(wwDBDateTimePicker1.date))
          +'    and FAC305.FACFECHA<='+quotedstr(datetostr(wwDBDateTimePicker2.date))
          +'  order by FAC305.FACSERIE, FAC305.NFAC ';
   cdsBolyFac.Close;
   cdsBolyFac.DataRequest(xSQL);
   cdsBolyFac.Open;
   cdsBolyFac.IndexFieldNames := 'FACSERIE;NFAC';

   cdsBolyFac.FieldByName('FACSERIE').ReadOnly := True;
   cdsBolyFac.FieldByName('NFAC').ReadOnly := True;
   cdsBolyFac.FieldByName('FACFECHA').ReadOnly := True;
   cdsBolyFac.FieldByName('CLIEID').ReadOnly := True;
   cdsBolyFac.FieldByName('CLIEDES').ReadOnly := True;
   cdsBolyFac.FieldByName('VEID').ReadOnly := False;
   cdsBolyFac.FieldByName('VENOMBRES').ReadOnly := True;
   cdsBolyFac.FieldByName('FACUSER').ReadOnly := True;
   cdsBolyFac.FieldByName('USERNOM').ReadOnly := True;
   cdsBolyFac.FieldByName('FACESTADO').ReadOnly := True;
   dblcVendedor.DataSource := dsBolyFac;
   dblcVendedor.DataField  := 'VEID';

   dbgActBolyFac.DataSource := dsBolyFac;
   dbgActBolyFac.Selected.Clear;
   dbgActBolyFac.Selected.Add('FACSERIE'#9'12'#9'Serie'#9'F');
   dbgActBolyFac.Selected.Add('NFAC'#9'12'#9'NºFac'#9'F');
   dbgActBolyFac.Selected.Add('FACFECHA'#9'10'#9'Fecha'#9'F');
   dbgActBolyFac.Selected.Add('CLIEID'#9'10'#9'Cod.Cliente'#9'F');
   dbgActBolyFac.Selected.Add('CLIEDES'#9'40'#9'Cliente'#9'F');
   dbgActBolyFac.Selected.Add('VEID'#9'7'#9'Cod.Vend'#9'F');
   dbgActBolyFac.Selected.Add('VENOMBRES'#9'30'#9'Vendedor'#9'F');
   dbgActBolyFac.Selected.Add('FACUSER'#9'15'#9'Cod.Usu'#9'F');
   dbgActBolyFac.Selected.Add('USERNOM'#9'30'#9'Usuario'#9'F');
   dbgActBolyFac.Selected.Add('FACESTADO'#9'15'#9'Situación'#9'F');
   dbgActBolyFac.ApplySelected;
   dbgActBolyFac.SetControlType('VEID',fctCustom,'dblcVendedor');

   if xVez<> '1' then
   begin
      cdsBolyFac.SetKey;
      cdsBolyFac.FieldByName('FACSERIE').AsString := xSerie;
      cdsBolyFac.FieldByName('NFAC').AsString := xFactura;
      cdsBolyFac.Gotokey;
   end;
end;

procedure TFActVendFactura.dblcVendedorEnter(Sender: TObject);
begin
   xSerie   := cdsBolyFac.FieldByName('FACSERIE').AsString;
   xFactura := cdsBolyFac.FieldByName('NFAC').AsString;
end;

procedure TFActVendFactura.dblcVendedorExit(Sender: TObject);
begin
   if not cdsBolyFac.Modified then exit;
   if MessageDlg('Se procederá a cambiar el Vendedor para esta Proforma.'+chr(13)
                +'de '+ cdsBolyFac.FieldByName('VENOMBRES').AsString+chr(13)
                +' a '+ cdsVendedores.FieldByName('VENOMBRES').AsString+chr(13)
                +'¿Desea Continuar con el cambo?',mtConfirmation, [mbYes, mbNo], 0)=mrNo then
   begin
      cdsBolyFac.CancelUpdates;
      exit;
   end;

   xVez := '2';
   cdsBolyFac.FieldByName('VENOMBRES').ReadOnly := False;
   cdsBolyFac.Edit;
   cdsBolyFac.FieldByName('VENOMBRES').AsString := cdsVendedores.FieldByName('VENOMBRES').AsString;
   cdsBolyFac.Post;
   cdsBolyFac.FieldByName('VENOMBRES').ReadOnly := True;
   xSQL := 'update FAC305 '
          +'   set VEID='+quotedstr(cdsBolyFac.FieldByName('VEID').AsString)
          +' where CIAID='+quotedstr('04')
          +'   and FACSERIE='+quotedstr(cdsBolyFac.FieldByName('FACSERIE').AsString)
          +'   and NFAC='+quotedstr(cdsBolyFac.FieldByName('NFAC').AsString);
   try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
      ShowMessage('No se actualizó cambio de Vendedor');
      exit;
   end;
   cdsBolyFac.SetKey;
   cdsBolyFac.FieldByName('FACSERIE').AsString := xSerie;
   cdsBolyFac.FieldByName('NFAC').AsString := xFactura;
   cdsBolyFac.Gotokey;

   AbreBoletasyFact;
end;

procedure TFActVendFactura.SeleccionarClick(Sender: TObject);
begin
   AbreBoletasyFact;
end;

end.
