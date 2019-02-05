unit FAC361;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Wwdatsrc, DBClient, wwclient, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, wwdblook;

type
  TFActVendProforma = class(TForm)
    dbgActProf: TwwDBGrid;
    cdsActProf: TwwClientDataSet;
    dsActProf: TwwDataSource;
    cdsVendedores: TwwClientDataSet;
    dsVendedores: TwwDataSource;
    dblcVendedor: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure dblcVendedorExit(Sender: TObject);
    procedure AbreProformas;
    procedure dblcVendedorEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   FActVendProforma: TFActVendProforma;
   xVez, xSQL, xProforma : String;

implementation

uses FacDM;

{$R *.dfm}

procedure TFActVendProforma.FormShow(Sender: TObject);
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

   xVez := '1';
   AbreProformas;
end;

procedure TFActVendProforma.dblcVendedorExit(Sender: TObject);
begin
   if not cdsActProf.Modified then exit;
   if MessageDlg('Se procederá a cambiar el Vendedor para esta Proforma.'+chr(13)
                +'de '+ cdsActProf.FieldByName('VENOMBRES').AsString+chr(13)
                +' a '+ cdsVendedores.FieldByName('VENOMBRES').AsString+chr(13)
                +'¿Desea Continuar con el cambo?',mtConfirmation, [mbYes, mbNo], 0)=mrNo then
   begin
      cdsActProf.CancelUpdates;
      exit;
   end;

   xVez := '2';
   cdsActProf.FieldByName('VENOMBRES').ReadOnly := False;
   cdsActProf.Edit;
   cdsActProf.FieldByName('VENOMBRES').AsString := cdsVendedores.FieldByName('VENOMBRES').AsString;
   cdsActProf.Post;
   cdsActProf.FieldByName('VENOMBRES').ReadOnly := True;
   xSQL := 'update FAC311 '
          +'   set VEID='+quotedstr(cdsActProf.FieldByName('VEID').AsString)
          +' where CIAID='+quotedstr('04')
          +'   and PROFID='+quotedstr(cdsActProf.FieldByName('PROFID').AsString);
   try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
      ShowMessage('No se actualizó cambio de Vendedor');
      exit;
   end;
   cdsActProf.SetKey;
   cdsActProf.FieldByName('PROFID').AsString := xProforma;
   cdsActProf.Gotokey;

   AbreProformas;
end;

procedure TFActVendProforma.AbreProformas;
begin
   xSQL := 'select FAC311.PROFID, FAC311.PROFFECHA, FAC311.CLAUXID, FAC311.CLIEID, TGE204.CLIEDES, '
          +'       FAC311.VEID, CXC203.VENOMBRES, '
          +'       FAC311.PROFUSER, TGE006.USERNOM, '
          +'       FAC311.PROFSIT '
          +'  from FAC311, CXC203, TGE006, TGE204 '
          +' where FAC311.CIAID=''04'' and FAC311.PROFFECHA>=''01/01/2013'' '
          +'   and CXC203.CIAID=FAC311.CIAID and CXC203.VEID=FAC311.VEID '
          +'   and TGE006.USERID=FAC311.PROFUSER '
          +'   and TGE204.CIAID(+)=''04'' and TGE204.CLIEID(+)=FAC311.CLIEID '
          +' order by FAC311.PROFID ';
   cdsActProf.Close;
   cdsActProf.DataRequest(xSQL);
   cdsActProf.Open;
   cdsActProf.IndexFieldNames := 'PROFID';

   cdsActProf.FieldByName('PROFID').ReadOnly := True;
   cdsActProf.FieldByName('PROFFECHA').ReadOnly := True;
   cdsActProf.FieldByName('CLIEID').ReadOnly := True;
   cdsActProf.FieldByName('VEID').ReadOnly := False;
   cdsActProf.FieldByName('VENOMBRES').ReadOnly := True;
   cdsActProf.FieldByName('PROFUSER').ReadOnly := True;
   cdsActProf.FieldByName('USERNOM').ReadOnly := True;
   cdsActProf.FieldByName('PROFSIT').ReadOnly := True;
   dblcVendedor.DataSource := dsActProf;
   dblcVendedor.DataField  := 'VEID';

   dbgActProf.DataSource := dsActProf;
   dbgActProf.Selected.Clear;
   dbgActProf.Selected.Add('PROFID'#9'12'#9'Proforma'#9'F');
   dbgActProf.Selected.Add('PROFFECHA'#9'10'#9'Fecha'#9'F');
   dbgActProf.Selected.Add('CLIEID'#9'10'#9'Cod.Cliente'#9'F');
   dbgActProf.Selected.Add('CLIEDES'#9'40'#9'Cliente'#9'F');
   dbgActProf.Selected.Add('VEID'#9'7'#9'Cod.Vend'#9'F');
   dbgActProf.Selected.Add('VENOMBRES'#9'30'#9'Vendedor'#9'F');
   dbgActProf.Selected.Add('PROFUSER'#9'15'#9'Cod.Usu'#9'F');
   dbgActProf.Selected.Add('USERNOM'#9'30'#9'Usuario'#9'F');
   dbgActProf.Selected.Add('PROFSIT'#9'15'#9'Situación'#9'F');
   dbgActProf.ApplySelected;
   dbgActProf.SetControlType('VEID',fctCustom,'dblcVendedor');

   if xVez<> '1' then
   begin
      cdsActProf.SetKey;
      cdsActProf.FieldByName('PROFID').AsString := xProforma;
      cdsActProf.Gotokey;
   end;
end;

procedure TFActVendProforma.dblcVendedorEnter(Sender: TObject);
begin
   xProforma := cdsActProf.FieldByName('PROFID').AsString;
end;

end.
