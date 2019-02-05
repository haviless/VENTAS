unit FAC390;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wwdbdatetimepicker, StdCtrls, ExtCtrls, Buttons, Grids,
  Wwdbigrd, Wwdbgrid, Mask, wwdbedit;

type
  TFActualizaDatos = class(TForm)
    pnlConfirma: TPanel;
    gbOrigen: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbeNombre: TwwDBEdit;
    dbeDNI: TwwDBEdit;
    dbeNumdoc: TwwDBEdit;
    dbeForPag: TwwDBEdit;
    dbeFecha: TwwDBEdit;
    gbConfirma: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    dbeNombreConf: TwwDBEdit;
    dbeDNIConf: TwwDBEdit;
    bbtnConfirmar: TBitBtn;
    BitBtn1: TBitBtn;
    pnlBusca: TPanel;
    dbeBusNom: TwwDBEdit;
    dbeBusDNI: TwwDBEdit;
    dbgDatos: TwwDBGrid;
    bbtnBuscar: TBitBtn;
    dtpFecha: TwwDBDateTimePicker;
    bbtnBuscarDNI: TBitBtn;
    bbtnBuscarFec: TBitBtn;
    bbtnNomMod: TBitBtn;
    dbeBusNomMod: TwwDBEdit;
    bbtnDNIMod: TBitBtn;
    dbeBusDNIMod: TwwDBEdit;
    rgEvento: TRadioGroup;
    btnAgregar: TBitBtn;
    procedure bbtnBuscarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDatosDblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtnBuscarDNIClick(Sender: TObject);
    procedure bbtnBuscarFecClick(Sender: TObject);
    procedure bbtnNomModClick(Sender: TObject);
    procedure bbtnDNIModClick(Sender: TObject);
    procedure rgEventoClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
  private
    { Private declarations }
    cSQLUlt : String;
    cConcepto : String;
  public
    { Public declarations }
  end;

var
  FActualizaDatos: TFActualizaDatos;

implementation

{$R *.dfm}

uses FacDM, FAC902;

procedure TFActualizaDatos.bbtnBuscarClick(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Select CIAID, CLAUXID, CLIEID, RUCDNI, NOMBRE, FORPAG, FECPAG, USUREG, '
        +  'DOCPAG, NUMDOCPAG, NOMCON, DNICON, USUCON, FECCON, ROWID '
        +'From CXC_ING_VAR_SER '
        +'Where NOMBRE LIKE '''+dbeBusNom.Text+'%'' '
        +   cConcepto
        +'Order by NOMBRE';
  DMFAC.cdsQry9.Close;
  DMFAC.cdsQry9.DataRequest(xSql);
  DMFAC.cdsQry9.Open;
  cSQLUlt:=xSql;
end;

procedure TFActualizaDatos.FormActivate(Sender: TObject);
begin
   DMFAC.cdsQry5.Close;
   DMFAC.cdsQry9.Close;
   dbgDatos.DataSource:=DMFAC.dsQry9;
   dbeForPag.DataSource:=DMFAC.dsQry5;
   dbeFecha.DataSource:=DMFAC.dsQry5;
   dbeNumdoc.DataSource:=DMFAC.dsQry5;
   dbeNombre.DataSource:=DMFAC.dsQry5;
   dbeDNI.DataSource:=DMFAC.dsQry5;
   dbeNombreConf.DataSource:=DMFAC.dsQry5;
   dbeDNIConf.DataSource:=DMFAC.dsQry5;

   rgEvento.ItemIndex:=3;
   rgEventoClick(Self);
end;

procedure TFActualizaDatos.dbgDatosDblClick(Sender: TObject);
var
  xSQL : String;
begin
   xSQL:='Select CIAID, CLAUXID, CLIEID, RUCDNI, NOMBRE, FORPAG, FECPAG, USUREG, '
        +  'DOCPAG, NUMDOCPAG, NOMCON, DNICON, USUCON, FECCON, '
        +  'CASE WHEN DOCPAG=''37'' THEN ''EFECTIVO EN CAJA'' '
        +       'WHEN DOCPAG=''66'' THEN ''CUENTA RECAUDADORA'' '
        +       'WHEN DOCPAG=''67'' THEN ''SISTEMAS DE CREDITOS'' '
        +       'WHEN DOCPAG=''68'' THEN ''CHEQUE'' ELSE ''OTROS'' END FORMAPAGO '
        +'From CXC_ING_VAR_SER '
        +'Where NOMBRE='''   +DMFAC.cdsQry9.FieldByName('NOMBRE').AsString   +''' '
        +  'AND NUMDOCPAG='''+DMFAC.cdsQry9.FieldByName('NUMDOCPAG').AsString+''' '
        +  'AND FORPAG='''   +DMFAC.cdsQry9.FieldByName('FORPAG').AsString   +''' '
        +  'AND ROWID='''    +DMFAC.cdsQry9.FieldByName('ROWID').AsString    +''' ';
  DMFAC.cdsQry5.Close;
  DMFAC.cdsQry5.DataRequest( xSQL );
  DMFAC.cdsQry5.Open;

  DMFAC.cdsQry5.Edit;
  if DMFAC.cdsQry5.FieldByName('NOMCON').AsString='' then
     DMFAC.cdsQry5.FieldByName('NOMCON').AsString:=DMFAC.cdsQry5.FieldByName('NOMBRE').AsString;

  if DMFAC.cdsQry5.FieldByName('DNICON').AsString='' then
     DMFAC.cdsQry5.FieldByName('DNICON').AsString:=DMFAC.cdsQry5.FieldByName('RUCDNI').AsString;
  DMFAC.cdsQry5.Post;

  pnlBusca.Enabled   :=False;
  pnlBusca.Color     :=$00C4E6E3;
  pnlConfirma.Enabled:=True;
  pnlConfirma.Color  :=$009BBFBA;

end;

procedure TFActualizaDatos.bbtnConfirmarClick(Sender: TObject);
var
   xSQL : String;
begin
  try
    xSQL:='Insert Into FAC_LOG_INS_ENC( NOMCON, DNICON, USUCON, FECCON ) '
         +'Select NOMCON, DNICON, USUCON, FECCON FROM CXC_ING_VAR_SER '
         +'Where NOMBRE='''   +DMFAC.cdsQry5.FieldByName('NOMBRE').AsString   +''' '
         +  'AND NUMDOCPAG='''+DMFAC.cdsQry5.FieldByName('NUMDOCPAG').AsString+''' '
         +  'AND FORPAG='''   +DMFAC.cdsQry5.FieldByName('FORPAG').AsString   +''' '
        +   cConcepto
         +  'AND NOMCON IS NOT NULL ';
    DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);

    xSQL:='Update CXC_ING_VAR_SER '
         +  'SET NOMCON='''+DMFAC.cdsQry5.FieldByName('NOMCON').AsString+''', '
         +      'DNICON='''+DMFAC.cdsQry5.FieldByName('DNICON').AsString+''', '
         +      'USUCON='''+DMFAC.wUsuario+''', FECCON=SYSDATE '
         +'Where NOMBRE='''   +DMFAC.cdsQry5.FieldByName('NOMBRE').AsString   +''' '
         +  'AND NUMDOCPAG='''+DMFAC.cdsQry5.FieldByName('NUMDOCPAG').AsString+''' '
         +  'AND FORPAG='''   +DMFAC.cdsQry5.FieldByName('FORPAG').AsString   +''' '
         +   cConcepto+' '
         +  'AND ROWID='''    +DMFAC.cdsQry9.FieldByName('ROWID').AsString    +''' ';
    DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
  except
    ShowMessage('Error al Actualizar');
    Exit;
  end;

  DMFAC.cdsQry9.Close;
  DMFAC.cdsQry9.DataRequest(cSQLUlt);
  DMFAC.cdsQry9.Open;

  pnlBusca.Enabled   :=True;
  pnlBusca.Color     :=$009BBFBA;
  pnlConfirma.Enabled:=False;
  pnlConfirma.Color  :=$00C4E6E3;

  ShowMessage('Datos Confirmados');

  DMFAC.cdsQry5.Close;
end;

procedure TFActualizaDatos.BitBtn1Click(Sender: TObject);
begin
  DMFAC.cdsQry5.Close;
  pnlBusca.Enabled   :=True;
  pnlBusca.Color     :=$009BBFBA;
  pnlConfirma.Enabled:=False;
  pnlConfirma.Color  :=$00C4E6E3;
end;

procedure TFActualizaDatos.bbtnBuscarDNIClick(Sender: TObject);
var
   xSQL : String;
begin

   if dbeBusDNI.Text='' then
   begin
      ShowMessage('Debe Ingresar el DNI');
      Exit;
   end;

   xSQL:='Select CIAID, CLAUXID, CLIEID, RUCDNI, NOMBRE, FORPAG, FECPAG, USUREG, '
        +  'DOCPAG, NUMDOCPAG, NOMCON, DNICON, USUCON, FECCON, ROWID '
        +'From CXC_ING_VAR_SER '
        +'Where RUCDNI LIKE '''+dbeBusDNI.Text+'%'' '
        +   cConcepto
        +'Order by RUCDNI, NOMBRE';
   DMFAC.cdsQry9.Close;
   DMFAC.cdsQry9.DataRequest(xSql);
   DMFAC.cdsQry9.Open;
   cSQLUlt:=xSql;
end;

procedure TFActualizaDatos.bbtnBuscarFecClick(Sender: TObject);
var
   xSQL : String;
begin
   if dtpFecha.Date=0 then
   begin
      ShowMessage('Debe Ingresar Fecha');
      Exit;
   end;

   xSQL:='Select CIAID, CLAUXID, CLIEID, RUCDNI, NOMBRE, FORPAG, FECPAG, USUREG, '
        +  'DOCPAG, NUMDOCPAG, NOMCON, DNICON, USUCON, FECCON, ROWID '
        +'From CXC_ING_VAR_SER '
        +'Where FECPAG = '''+DateToStr(dtpFecha.Date)+''' '
        +   cConcepto
        +'Order by FECPAG, NOMBRE';

  DMFAC.cdsQry9.Close;
  DMFAC.cdsQry9.DataRequest(xSql);
  DMFAC.cdsQry9.Open;
  cSQLUlt:=xSql;
end;

procedure TFActualizaDatos.bbtnNomModClick(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Select CIAID, CLAUXID, CLIEID, RUCDNI, NOMBRE, FORPAG, FECPAG, USUREG, '
        +  'DOCPAG, NUMDOCPAG, NOMCON, DNICON, USUCON, FECCON, ROWID '
        +'From CXC_ING_VAR_SER '
        +'Where NOMCON LIKE '''+dbeBusNomMod.Text+'%'' '
        +   cConcepto
        +'Order by NOMCON';
  DMFAC.cdsQry9.Close;
  DMFAC.cdsQry9.DataRequest(xSql);
  DMFAC.cdsQry9.Open;
  cSQLUlt:=xSql;
end;

procedure TFActualizaDatos.bbtnDNIModClick(Sender: TObject);
var
   xSQL : String;
begin

   if dbeBusDNIMod.Text='' then
   begin
      ShowMessage('Debe Ingresar el DNI');
      Exit;
   end;

   xSQL:='Select CIAID, CLAUXID, CLIEID, RUCDNI, NOMBRE, FORPAG, FECPAG, USUREG, '
        +  'DOCPAG, NUMDOCPAG, NOMCON, DNICON, USUCON, FECCON, ROWID '
        +'From CXC_ING_VAR_SER '
        +'Where DNICON LIKE '''+dbeBusDNIMod.Text+'%'' '
        +   cConcepto
        +'Order by DNICON, NOMCON';
   DMFAC.cdsQry9.Close;
   DMFAC.cdsQry9.DataRequest(xSql);
   DMFAC.cdsQry9.Open;
   cSQLUlt:=xSql;
end;

procedure TFActualizaDatos.rgEventoClick(Sender: TObject);
begin
   if rgEvento.ItemIndex=0 then cConcepto :=' and CPTOID IN (''IN0151'') ';
   if rgEvento.ItemIndex=1 then cConcepto :=' and CPTOID IN (''IN0152'') ';
   if rgEvento.ItemIndex=2 then cConcepto :=' and CPTOID IN (''IN0050'') ';
   if rgEvento.ItemIndex=3 then cConcepto :=' and CPTOID IN (''IN0136'',''IN0137'') and FECPAG>=''01/01/2010'' ';
end;

procedure TFActualizaDatos.btnAgregarClick(Sender: TObject);
var
    frm:TFIngParticipantesEncinas;
begin
    frm:= TFIngParticipantesEncinas.create(self);
    try
        frm.showmodal();
    finally
        frm:=nil;
    end;
end;

end.
