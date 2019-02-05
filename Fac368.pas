unit Fac368;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Fac368
// FORMULARIO               : FMaesClieCorto
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Ventana de mantenimiento de clientes
//

// Actualizaciones:
// HPC_201210_FAC 29/10/2012  Se implemtentó la funcionalidad que obtiene
//                            automáticamente el código del cliente
// HPC_201302_FAC 14/02/2013  Se cambio rutina de código automatico de cliente para usar funcion F_C0D_CLIENTE
//                            en vez de rutina del Delphi
// HPC_201311_FAC 11/12/2013  Se Modificó el Maestro de Clientes para que se pueda ingresar el N° de Identidad
//                            para el Tipo de Identidad "Otros" y se habilitó el tipo de Documentos

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Mask, wwdbedit, wwdblook, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Buttons, DB, wwdbdatetimepicker, Wwdbdlg,Wwdatsrc,
  wwClient, wwcheckbox;

type
  TFMaesClieCorto = class(TForm)
    pnlPrincipal: TPanel;
    Panel1: TPanel;
    pcMaestro: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    Label4: TLabel;
    Label13: TLabel;
    dbeTelef: TwwDBEdit;
    dbeMail: TwwDBEdit;
    pnlCab: TPanel;
    Label46: TLabel;
    dblcClAux: TwwDBLookupCombo;
    dbeClAux: TwwDBEdit;
    dbeClie: TwwDBEdit;
    Label25: TLabel;
    Label17: TLabel;
    dblcTipPer: TwwDBLookupCombo;
    dbeTipPer: TwwDBEdit;
    Label47: TLabel;
    dblcCia: TwwDBLookupCombo;
    dbeCia: TwwDBEdit;
    lblNombreCorto: TLabel;
    dbeAbr: TwwDBEdit;
    lblDocIdentidad: TLabel;
    dbeDocIdentidad: TwwDBEdit;
    pnlPie: TPanel;
    Z2bbtnOK: TBitBtn;
    Z2bbtnCancel: TBitBtn;
    lblRuc: TLabel;
    dbeRuc: TwwDBEdit;
    lblRazonSocial: TLabel;
    dbeRazSoc: TwwDBEdit;
    Label65: TLabel;
    lblNombre: TLabel;
    dbeNombres: TwwDBEdit;
    lblNombre2: TLabel;
    dbesNombres: TwwDBEdit;
    lblApPaterno: TLabel;
    dbeapepat: TwwDBEdit;
    lblApMaterno: TLabel;
    dbeapemat: TwwDBEdit;
    cbActivo: TwwCheckBox;
    Label11: TLabel;
    dbeDirCom: TwwDBEdit;
    dblcPais: TwwDBLookupCombo;
    Label29: TLabel;
    dbePais: TwwDBEdit;
    Label21: TLabel;
    dblcDeparta: TwwDBLookupCombo;
    dbeDeparta: TwwDBEdit;
    Label22: TLabel;
    dblcdProvinc: TwwDBLookupComboDlg;
    dbeProvinc: TwwDBEdit;
    dblcdDistrito: TwwDBLookupComboDlg;
    Label23: TLabel;
    dbeDistrito: TwwDBEdit;
    lblTDocIdentidad: TLabel;
    dblcTDocIdentidad: TwwDBLookupCombo;
    edtTDocIdentidad: TwwDBEdit;
    procedure Regresa2;
    procedure Regresa3;
    procedure Regresa4;
    procedure Regresa5;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z2bbtnCancelClick(Sender: TObject);
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure dbeClieExit(Sender: TObject);
    procedure dblcClAuxExit(Sender: TObject);
    procedure dblcTipPerExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcPaisExit(Sender: TObject);
    procedure dblcDepartaExit(Sender: TObject);
    procedure NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcdDistritoExit(Sender: TObject);
    procedure dblcdProvincExit(Sender: TObject);
    procedure dbeRucExit(Sender: TObject);
    procedure dbeNombresExit(Sender: TObject);
    procedure dbesNombresExit(Sender: TObject);
    procedure dbeapepatExit(Sender: TObject);
    procedure dbeapematExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pcMaestroChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dbeDocIdentidadExit(Sender: TObject);
    procedure dblcTDocIdentidadExit(Sender: TObject);
  private
    { Private declarations }
     wModif   : String;
     sPerNat  : string;
     xCliedes : string;
   procedure LimpiaEdits;
   Function ValidaCliente :Boolean;
   function ExisteDuplicado:Boolean;
   procedure RegistroNuevo;
   procedure ActualizaClieDes;
   procedure CargaDataSource;
   //INICIO HPC_201210_FAC
   Function fg_ObtieneCodCliente: String;
   Procedure fg_HabilitaTipoPersona(wgTipoPersona :String);
    procedure fg_DefaultCampos(wgTipoPersona :String);
    function fg_ValidaDocIdentidad(wgTipoDoc :String) : Boolean;
   //FIN HPC_201210_FAC
  public
    { Public declarations }
     xCiaClie : String;
  end;

var
  FMaesClieCorto: TFMaesClieCorto;
  xErrorValida : boolean;

implementation

{$R *.DFM}

Uses FACDM, oaVE2000;

procedure TFMaesClieCorto.RegistroNuevo;
var
   xSql : String;
begin
  //INICIO HPC_201210_FAC
  //dbeClie.Enabled := True;
  //FIN HPC_201210_FAC
  dbeCia.Text     :='';
  dbePais.Text    :='';
  dbeDeparta.Text :='';
  dbeProvinc.Text :='';
  dbeDistrito.Text:='';
  dbeTipPer.Text  :='';
  dbeClaux.Text   :='';

  DMFAC.cdsClie.Insert;
  DMFAC.cdsClie.FieldByName('ACTIVO').AsString :='S';
  //DMFAC.cdsClie.FieldByName('CIAID').AsString  :=DMFAC.cdsFact2.FieldByName('CIAID').AsString;
  DMFAC.cdsClie.FieldByName('CIAID').AsString  :=xCiaClie;
  DMFAC.cdsClie.FieldByName('CLAUXID').AsString:='C';
  wModif:='N';

  //INICIO HPC_201210_FAC
  //dblcClAux.Enabled:=True;
  //FIN HPC_201210_FAC

  xSQL := 'CIAID='''+dblcCia.Text+'''';
  dbeCia.Text:=DMFAC.BuscaQry('dspUltTGE','TGE101','*',xSQL,'CIADES');

  dblcTipPer.SetFocus;
end;


procedure TFMaesClieCorto.Regresa2;
begin
   pnlCab.Enabled := True;
   pnlPie.Enabled := True;
end;


procedure TFMaesClieCorto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMFAC.cdsProvinc.Filter:='';
   DMFAC.cdsProvinc.Filtered:=False;

   DMFAC.cdsDistrito.Filter:='';
   DMFAC.cdsDistrito.Filtered:=False;

   DMFAC.cdsClie.CancelUpdates;
   DMFAC.cdsClie.Cancel;
end;

procedure TFMaesClieCorto.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key := #0;
      perform(CM_Dialogkey, VK_TAB, 0);
   end;
end;

procedure TFMaesClieCorto.Regresa3;
begin
   pnlCab.Enabled := True;
   pnlPie.Enabled := True;
end;

procedure TFMaesClieCorto.Z2bbtnCancelClick(Sender: TObject);
begin
    if DMFAC.cdsClie.State=dsInsert then DMFAC.cdsClie.Delete;
    close
end;

procedure TFMaesClieCorto.Z2bbtnOKClick(Sender: TObject);
var
	 xWhere, xCliente : string;
	 xPerNat : string;
begin
   if DMFAC.cdsClie.State= dsBrowse then
      DMFAC.cdsClie.Edit;
   if Length(dbeapepat.text)>0 then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=dbeapepat.text;
   if Length(dbeapemat.text)>0 then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(dbeapepat.text+' '+dbeapemat.text);
   if Length(dbeNombres.text)>0 then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(trim(dbeapepat.text+' '+dbeapemat.text)+' '+dbeNombres.text);
   if Length(dbesNombres.text)>0 then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(trim(trim(dbeapepat.text+' '+dbeapemat.text)+' '+dbeNombres.text)
                                                  +' '+dbesNombres.text);
	 Screen.Cursor:=crHourGlass;

   if trim(dbeRuc.text)='' then dbeRuc.text:='';
   //INICIO HPC_201210_FAC
   If DMFAC.wModo = 'A' Then
   Begin
   // Inicio HPC_201311_FAC
      If dblcTipPer.Text <> '00' Then
      Begin
         DMFAC.cdsClie.FieldByName('CLIEID').AsString := fg_ObtieneCodCliente;
      End;
   // Fin HPC_201311_FAC
      DMFAC.cdsClie.FieldByName('CLAUXID').AsString := 'C';
      dbeClieExit(dbeClie);
   End;
   //FIN HPC_201210_FAC
// Valida que RUC no se esté registrando al mismo momento para la misma Clase de Auxiliar
   if (trim(dbeRuc.text)<>'') then
   begin
      if (length(trim(dbeRuc.text))<>11) then
      begin
         Screen.Cursor:=crdefault;
         ShowMessage('Longitud del RUC es incorrecta');
         dbeRuc.SetFocus;
         exit;
      end;
      xWhere := 'CLAUXID='+quotedstr(dblcClAux.Text)
               +' and CLIEID<>'+QuotedStr(dbeClie.text)
               +' and CLIERUC='+QuotedStr(dbeRUC.text);
      if dbeRuc.text=DMFAC.BuscaQry('dspUltTGE','TGE204','CLIEID,CLIEDES,CLIERUC',xWhere,'CLIERUC') then
      begin
         dbeRuc.SetFocus;
         Screen.Cursor:=crdefault;
         //INICIO HPC_201210_FAC
         //Raise Exception.Create('RUC asignado al Cliente: '+DMFAC.cdsQry.FieldByName('CLIEID').AsString+' '+DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
         ShowMessage('RUC asignado al Cliente: '+DMFAC.cdsQry.FieldByName('CLIEID').AsString+' '+DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
         Exit;
         //FIN HPC_201210_FAC
      end;
      xWhere := '';
   end;

   if (sPerNat='N') and (length(trim(dbeRazSoc.text))>0) then
   begin
      xWhere := 'CLAUXID='+quotedstr(dblcClAux.Text)
          +' and CLIEID<>'+QuotedStr(dbeClie.text)
          +' and CLIEDES='+QuotedStr(dbeRazSoc.text);
      if dbeRazSoc.text=DMFAC.BuscaQry('dspUltTGE','TGE204','CLIEID,CLIEDES,CLIERUC',xWhere,'CLIEDES') then
      begin
         dbeRazSoc.SetFocus;
         Screen.Cursor:=crdefault;
         //INICIO HPC_201210_FAC
         //Raise Exception.Create('Razón Social asignada al Cliente: '+DMFAC.cdsQry.FieldByName('CLIEID').AsString+' '+DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
         ShowMessage('Razón Social asignada al Cliente: '+DMFAC.cdsQry.FieldByName('CLIEID').AsString+' '+DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
         Exit;
         //FIN HPC_201210_FAC
      end;
      xWhere := '';
   end;

   if (sPerNat='S') then
   begin
      if length(trim(dbeDocIdentidad.text))<=0 then
      begin
         Screen.Cursor:=crdefault;
         ShowMessage('Cliente es persona Natural. Debe ingresar el DNI...');
         Exit;
      end;
      if length(trim(dbeNombres.text))<=0 then
      begin
         Screen.Cursor:=crdefault;
         ShowMessage('Cliente es persona Natural. Debe ingresar los nombres...');
         Exit;
      end;
      if length(trim(dbeapepat.text))<=0 then
      begin
         Screen.Cursor:=crdefault;
         ShowMessage('Cliente es persona Natural. Debe ingresar el Apellido Paterno...');
         Exit;
      end;
      if length(trim(dbeapemat.text))<=0 then
      begin
         Screen.Cursor:=crdefault;
         ShowMessage('Cliente es persona Natural. Debe ingresar el Apellido Materno...');
         Exit;
      end;
   end;

   If ValidaCliente = False Then
   Begin
      Screen.Cursor:=crdefault;   
      Exit;
   End;;

   if xErrorValida then exit;

	 if (DMFAC.wModo='A') and (dblcClAux.Enabled) then
	 begin
          xWhere:='CLAUXID='''+dblcClAux.Text+''' and CLIEID='''+dbeClie.Text+'''';
		  xCliente:=DMFAC.BuscaQry('dspUltTGE','TGE204','CLIEID',xWhere,'CLIEID');
		  if xCliente=dbeClie.Text then
      begin
         Screen.Cursor:=crdefault;
         //INICIO  HPC_201210_FAC
         //Raise Exception.Create(' Cliente ya Registrado ');
         ShowMessage(' Cliente ya Registrado ');
         Exit;
         //FIN HPC_201210_FAC

      end;
	  	dblcClAux.Enabled:=False;
	  	dbeClie.Enabled  :=False;
	 end;

   if DMFAC.cdsClie.State= dsBrowse then
      DMFAC.cdsClie.Edit;

   if DMFAC.cdsClie.FieldByName('TVTAID').AsString = '' then
      DMFAC.cdsClie.FieldByName('TVTAID').AsString  :='01';

   if DMFAC.cdsClie.FieldByName('ZONVTAID').AsString='' then
      DMFAC.cdsClie.FieldByName('ZONVTAID').AsString:='01001';

      DMFAC.cdsClie.FieldByName('USERID').AsString  :=DMFAC.wUsuario;
      DMFAC.cdsClie.FieldByName('FREG').AsDateTime  :=DMFAC.DateS;
      DMFAC.cdsClie.FieldByName('HREG').AsDateTime  :=Time;

      DMFAC.cdsPost( DMFAC.cdsClie );

      DMFAC.AplicaDatos( DMFAC.cdsClie, 'CLIENTE' );
      DMFAC.GrabaAuxConta( DMFAC.cdsClie );
      Screen.Cursor:=crDefault;
      ShowMessage('Grabación Exitosa');
      Close;

end;

procedure TFMaesClieCorto.dbeClieExit(Sender: TObject);
begin
   if Z2bbtnCancel.Focused then Exit;
   if length(dbeClie.Text)=0 then
   begin
      dbeClie.SetFocus;
      Raise Exception.Create(' Falta Código del Cliente ');
   end;
   if dbeClie.text=DMFAC.BuscaQry('dspUltTGE','TGE204','CLIEID','CLIEID='+QuotedStr(dbeClie.text)+' AND CIAID='+QuotedStr(dblcCia.text),'CLIEID') then
   begin
     dbeClie.SetFocus;
     Raise Exception.Create('Cliente ya existe');
   end;
   //INICIO HPC_201210_FAC
   //if (DMCXC.wModo='A') and (sPerNat<>'S') then
   //DMCXC.cdsClie.FieldByName('CLIERUC').AsString:=dbeClie.text;
   //FIN HPC_201210_FAC

end;

procedure TFMaesClieCorto.dblcClAuxExit(Sender: TObject);
var
   xWhere : string;
begin
   if Z2bbtnCancel.Focused then Exit;
   xWhere:='ClAuxId='''+dblcClAux.Text+''' and MODULO LIKE ''%'+DMFAC.wModulo+'%''';
   dbeClAux.Text:=DMFAC.BuscaQry('dspUltTGE','TGE102','*',xWhere,'CLAUXABR');
   if length(dbeClAux.Text)=0 then
   begin
      ShowMessage('Falta Clase de Auxiliar');
      //dbeClAux.SetFocus;
   end;
end;

procedure TFMaesClieCorto.dblcTipPerExit(Sender: TObject);
var
   xWhere : String;
begin
   if Length( dblcTipPer.Text )=0 then Exit;
   xWhere := 'TIPPERID='''+dblcTipPer.Text+'''';
	dbeTipPer.Text:=DMFAC.BuscaQry('dspUltTGE','TGE109','*',xWhere,'TIPPERDES');
	sPerNat:=DMFAC.cdsQry.FieldByName('TIPPERS').AsString;
	if Length(dbeTipPer.Text)=0 then
   begin
      ShowMessage('Código de Tipo de Persona No Existe');
      dblcTipPer.Text:='';
      //dblcTipPer.SetFocus;
   end;
   //INICIO HPC_201210_FAC
   If DMFAC.wModo = 'A' Then
   Begin
   // Inicio HPC_201311_FAC
      {
      If dblcTipPer.Text = '00' Then
      Begin
         ShowMessage('Código de Tipo de Persona Restringido');
         dblcTipPer.Text:='';
         Exit;
      End;
      }
      If dblcTipPer.Text <> '00' Then
      Begin
         DMFAC.cdsClie.FieldByName('CLIEID').AsString := fg_ObtieneCodCliente;
      End;
   // Fin HPC_201311_FAC
      DMFAC.cdsClie.FieldByName('CLAUXID').AsString := 'C';
      dblcClAuxExit(dblcClAux);
      fg_DefaultCampos(dblcTipPer.Text);
   End
   Else If DMFAC.wModo = 'M' Then
   Begin
      fg_DefaultCampos(dblcTipPer.Text);
   End;
   fg_HabilitaTipoPersona(dblcTipPer.Text);
   //FIN HPC_201210_FAC
end;

procedure TFMaesClieCorto.dblcCiaExit(Sender: TObject);
var
   xWhere : String;
begin
   if Length( dblcCia.Text )=0 then Exit;

   xWhere := 'CIAID='''+dblcCia.Text+'''';
   dbeCia.Text:=DMFAC.BuscaQry('dspUltTGE','TGE101','*',xWhere,'CIADES');
   if Length(dbeCia.Text)=0 then
   begin
      ShowMessage('Compañía No Existe');
      dblcCia.Text:='';
      //dblcCia.SetFocus;
   end;
end;

procedure TFMaesClieCorto.dblcPaisExit(Sender: TObject);
var
   xWhere : string;
begin
   if length(dblcPais.Text)=0 then exit;
   xWhere := 'PAISID = '+''''+dblcPais.Text+'''';
   dbePais.Text:=DMFAC.BuscaQry('dspUltTGE','TGE118','*',xWhere,'PAISDES');
   if Length(dbePais.Text)=0 then
   begin
      ShowMessage('Código de País No Existe');
      dblcPais.Text:='';
      dblcPais.SetFocus;
      exit;
   end;

   if DMFAC.cdsQry.FieldByName('FNACIONAL').AsString<>'S' then
   begin
      dblcDeparta.Enabled:=False;
      dblcdProvinc.Enabled:=False;
      dblcdDistrito.Enabled:=False;
      DMFAC.cdsClie.FieldByName('DPTOID').AsString:='';
      DMFAC.cdsClie.FieldByName('CIUDID').AsString:='';
      DMFAC.cdsClie.FieldByName('CLIECZIP').AsString:='';
      dbeDeparta.Text:='';
      dbeProvinc.Text:='';
      dbeDistrito.Text:='';
   end
   else
   begin
      dblcDeparta.Enabled:=True;
      dblcdProvinc.Enabled:=True;
      dblcdDistrito.Enabled:=True;
   end;
end;

procedure TFMaesClieCorto.dblcDepartaExit(Sender: TObject);
begin
   if length(dblcDeparta.Text)=0 then exit;

   DMFAC.cdsDpto.SetKey;
   DMFAC.cdsDpto.FieldByName('DPTOID').AsString:=dblcDeparta.Text;
   if not DMFAC.cdsDpto.GotoKey then
   begin
      ShowMessage('Código de Departamento No Existe');
      dblcDeparta.Text:='';
      dblcDeparta.SetFocus;
      exit;
   end;
   dbeDeparta.Text := DMFAC.cdsDpto.FieldByName('DPTODES').AsString;
   DMFAC.cdsProvinc.Filter:='DPTOID='+quotedstr(dblcDeparta.Text);
   DMFAC.cdsProvinc.Filtered:=True;
   DMFAC.cdsProvinc.First;
end;

procedure TFMaesClieCorto.LimpiaEdits;
begin
  dbeCia.Text     :='';
  dbePais.Text    :='';
  dbeDeparta.Text :='';
  dbeProvinc.Text :='';
  dbeDistrito.Text:='';
  dbeTipPer.Text  :='';
end;

procedure TFMaesClieCorto.Regresa4;
begin
   pnlCab.Enabled := True;
   pnlPie.Enabled := True;
end;

procedure TFMaesClieCorto.NotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

function TFMaesClieCorto.ExisteDuplicado:Boolean;
var
   cdsLC:TwwClientDataSet;
   Y1, M1, D : Word;
   Y2, M2 : Word;
   flag:boolean;
begin
   flag:=False;
   decodedate(DMFAC.cdsLineaCredito.FieldByName('ULTFECHA').AsDateTime, Y1, M1 , D );

   cdsLC := TwwClientDataSet.create(self) ;
   cdsLC.CloneCursor(DMFAC.cdsLineaCredito,False) ;
   cdsLC.First;
   while not cdsLC.EOF do
   begin
     DecodeDate(cdsLC.FieldByName('ULTFECHA').AsDateTime, Y2, M2 , D );
     if (Y2=Y1) AND (M2=M1) then
     begin
       flag:=True;
       cdsLC.Last;
     end;
     cdsLC.Next;
   end;
  result:=Flag;
end;

procedure TFMaesClieCorto.dblcdDistritoExit(Sender: TObject);
begin
   if length(dblcdDistrito.Text)=0 then exit;

   DMFAC.cdsDistrito.SetKey;
   DMFAC.cdsDistrito.FieldByName('ZIPID').AsString:=dblcdDistrito.Text;
   if not DMFAC.cdsDistrito.GotoKey then
   begin
      ShowMessage('Código de Distrito No Existe');
      dblcdDistrito.Text:='';
      dblcdDistrito.SetFocus;
      exit;
   end;
   dbeDistrito.Text := DMFAC.cdsDistrito.FieldByName('ZIPDES').AsString;

end;

procedure TFMaesClieCorto.dblcdProvincExit(Sender: TObject);
begin
   if length(dblcdProvinc.Text)=0 then exit;

   DMFAC.cdsProvinc.SetKey;
   DMFAC.cdsProvinc.FieldByName('CIUDID').AsString:=dblcdProvinc.Text;
   if not DMFAC.cdsProvinc.GotoKey then
   begin
      ShowMessage('Código de Provincia No Existe');
      dblcdProvinc.Text:='';
      dblcdProvinc.SetFocus;
      exit;
   end;
   dbeProvinc.Text := DMFAC.cdsProvinc.FieldByName('CIUDDES').AsString;

   DMFAC.cdsDistrito.Filter:='DPTOID='+quotedstr(dblcDeparta.Text)
                     +' and CIUDID='+quotedstr(dblcdProvinc.Text);
   DMFAC.cdsDistrito.Filtered:=True;
   DMFAC.cdsDistrito.First;
end;

Function TFMaesClieCorto.ValidaCliente :Boolean;
begin
   xErrorValida := False;
   If DMFAC.cdsClie.FieldByName('TIPPERID').AsString='02' then //Persona Jurídica
   Begin
      If Length(DMFAC.cdsClie.FieldByName('PAISID').AsString) = 0 Then
      Begin
         ShowMessage('Ingrese el País del Cliente');
         Result := False;
         Exit;
      End;

      If DMFAC.cdsClie.FieldByName('PAISID').AsString = '01' Then
      Begin
         If Length(DMFAC.cdsClie.FieldByName('DPTOID').AsString) = 0 Then
         Begin
            ShowMessage('Ingrese el Departamento');
            Result := False;
            Exit;
         End;
         If Length(DMFAC.cdsClie.FieldByName('DPTOID').AsString) = 0 Then
         Begin
            ShowMessage('Ingrese el Departamento');
            Result := False;
            Exit;
         End;
         If Length(DMFAC.cdsClie.FieldByName('CIUDID').AsString) = 0 Then
         Begin
            ShowMessage('Ingrese la Provincia');
            Result := False;
            Exit;
         End;
         If Length(DMFAC.cdsClie.FieldByName('CLIECZIP').AsString) = 0 Then
         Begin
            ShowMessage('Ingrese el Distrito');
            Result := False;
            Exit;
         End;
      End;

   End;

   If DMFAC.cdsClie.FieldByName('TIPPERID').AsString='03' then //NO domiciliados
	 Begin
      If (Length(DMFAC.cdsClie.FieldByName('CLIEAPEPAT').AsString) = 0)
         Or (Length(DMFAC.cdsClie.FieldByName('CLIENOMBRE').AsString) = 0) Then
      Begin
		     Screen.Cursor:=crDefault;
		     dblcTDocIdentidad.SetFocus;
         xErrorValida := True;
         //INICIO HPC_201210_FAC
		     //Raise Exception.Create('Ingrese los datos del Nombre y Apellido Paterno');
         ShowMessage('Ingrese los datos del Nombre y Apellido Paterno');
         Result := False;
         Exit;
         //FIN HPC_201210_FAC
      End;

      If (DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString <> '04') And
         (DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString <> '07') And
         (DMFAC.cdsClie.FieldByName('TIPPERID').AsString='03') Then
      Begin
         ShowMessage('Los No Domiciliados sólo pueden tener como tipo de documento :'+#13+
                      '04-Carnet de Extranjería'+#13+
                      '07-Pasaporte');
         Result := False;
         Exit;
      End; 
	 End;

   //FIN HPC_201210_FAC
   if DMFAC.cdsClie.FieldByName('CLIEID').AsString='' then
   begin
	    Screen.Cursor:=crDefault;
      dbeClie.SetFocus;
      xErrorValida := True;
      //INICIO HPC_201210_FAC
      //Raise Exception.Create('Ingrese Código de Cliente');
      ShowMessage('Ingrese Código de Cliente');
      Result := False;
      Exit;
      //FIN HPC_201210_FAC
   end;

	 if dblcTipPer.text='' then
	 begin
		  Screen.Cursor:=crDefault;
		  dbeClie.SetFocus;
      xErrorValida := True;
      //INICIO HPC_201210_FAC
      //Raise Exception.Create('Ingrese Tipo de Persona');
      ShowMessage('Ingrese Tipo de Persona');
      Result := False;
      Exit;
      //FIN HPC_201210_FAC

	 end;
   //INICIO HPC_201210_FAC
   //if (sPerNat<>'S') and (length(trim(dbeRazSoc.Text))=0) then
   if (DMFAC.cdsClie.FieldByName('TIPPERID').AsString='02') and (length(trim(dbeRazSoc.Text))=0) then
   //FIN HPC_201210_FAC
   begin
      Screen.Cursor:=crdefault;
      ShowMessage('Razón Social es obligatoria para una Persona Jurídica');
      dbeRazSoc.SetFocus;
      xErrorValida := True;
      Result := False;
      exit;
   end;
   //INICIO HPC_201210_FAC
   //if (sPerNat<>'S') and (length(trim(dbeRuc.Text))=0) then
   if (DMFAC.cdsClie.FieldByName('TIPPERID').AsString='02') and (length(trim(dbeRuc.Text))=0) then
   //FIN HPC_201210_FAC
   begin
      Screen.Cursor:=crdefault;
      ShowMessage('El RUC es obligatorio para una Persona Jurídica');
      dbeRazSoc.SetFocus;
      xErrorValida := True;
      Result := False;
      exit;
   end;

	if (sPerNat='S') AND ((dbeDocIdentidad.text='') and (dbeRuc.Text='')) then
	begin
		 Screen.Cursor:=crDefault;
		 pcMaestro.ActivePage := TabSheet1;
		 dbeDocIdentidad.SetFocus;
     xErrorValida := True;
     //INICIO HPC_201210_FAC
     //Raise Exception.Create('Ingrese D.N.I o  R.U.C');
     ShowMessage('Ingrese D.N.I o  R.U.C');
     Result := False;
     Exit;
     //FIN HPC_201210_FAC

	end;

   //INICIO HPC_201210_FAC
   If DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString='' Then
	 Begin
		  Screen.Cursor:=crDefault;
		  dblcTDocIdentidad.SetFocus;
      xErrorValida := True;
      //INICIO HPC_201210_FAC
		  //Raise Exception.Create('Ingrese el tipo de documento');
      ShowMessage('Ingrese el tipo de documento');
      Result := False;
      Exit;
      //FIN HPC_201210_FAC
	 End;
   If DMFAC.cdsClie.FieldByName('CLIEDNI').AsString='' Then
	 Begin
		  Screen.Cursor:=crDefault;
		  dblcTDocIdentidad.SetFocus;
      xErrorValida := True;
      //INICIO HPC_201210_FAC
		  //Raise Exception.Create('Ingrese el Nº de Documento');
      ShowMessage('Ingrese el Nº de Documento');
      Result := False;
      Exit;
      //FIN HPC_201210_FAC

	 End;
   If DMFAC.cdsClie.FieldByName('CLIEDIR').AsString='' Then
	 Begin
		  Screen.Cursor:=crDefault;
		  dbeDirCom.SetFocus;
      xErrorValida := True;
      ShowMessage('Ingrese la dirección del Cliente');
      Result := False;
      Exit;
   End;

   Result := True;
end;

procedure TFMaesClieCorto.Regresa5;
begin
   pnlCab.Enabled := True;
   pnlPie.Enabled := True;
end;

procedure TFMaesClieCorto.dbeRucExit(Sender: TObject);
begin
   if (sPerNat='N') AND (dbeRuc.text='') then
   begin
     dbeRuc.SetFocus;
     Raise Exception.Create('Persona Jurídica Exige RUC');
   end;

   if (length(trim(dbeRuc.text))>0) and (length(trim(dbeRuc.text))<>11) then
   begin
      ShowMessage('Longitud del RUC es incorrecta');
      dbeRuc.SetFocus;
      exit;
   end;

   if (trim(dbeRuc.text)<>'') then
   begin
      if (length(trim(dbeRuc.text))<>11) then
      begin
         ShowMessage('Longitud del RUC es incorrecta');
         dbeRuc.SetFocus;
         exit;
      end;
   end;

   if (dbeRuc.text<>'') then
   if dbeRuc.text=DMFAC.BuscaQry('dspUltTGE','TGE204','CLIEID,CLIEDES,CLIERUC','CLIEID<>'+QuotedStr(dbeClie.text)+' AND CLIERUC='+QuotedStr(dbeRUC.text),'CLIERUC') then
   begin
     dbeRuc.SetFocus;
     Raise Exception.Create('RUC asignado al Cliente: '+DMFAC.cdsQry.FieldByName('CLIEID').AsString+' '+DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
   end;
   //INICIO HPC_201210_FAC
   DMFAC.cdsClie.FieldByName('CLIEDNI').AsString := dbeRuc.Text ;
   //FIN HPC_201210_FAC
end;

procedure TFMaesClieCorto.ActualizaClieDes;
var sSQL:string;
  i:integer;
  tablas:array[1..18] of String;
begin

tablas[1]:='CXC309';
tablas[2]:='CXC310';
tablas[3]:='CXC317';
tablas[4]:='CXC319';
tablas[5]:='CXC321';
tablas[6]:='CXC501';
tablas[7]:='CXP310';
tablas[8]:='CXP312';
tablas[9]:='FAC301';
tablas[10]:='FAC303';
tablas[11]:='FAC305';
tablas[12]:='FAC309';
tablas[13]:='FAC311';
tablas[14]:='FAC401';
tablas[15]:='FAC503';
tablas[16]:='FAC505';
tablas[17]:='LOG314';
tablas[18]:='CXC301';

  for i:=1 to 18 do
  begin
    sSQL:=' UPDATE '+tablas[i]+' SET CLIEDES='+QuotedStr(DMFAC.cdsClie.FieldByName('CLIEDES').AsString)+' WHERE CIAID='+QuotedStr(DMFAC.cdsClie.FieldByName('CIAID').AsString)+' AND CLAUXID='+QuotedStr(DMFAC.cdsClie.FieldByName('CLAUXID').AsString)+' AND CLIEID='+QuotedStr(DMFAC.cdsClie.FieldByName('CLIEID').AsString);
    try
      DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
    except
    end;
  end;

end;

procedure TFMaesClieCorto.dbeNombresExit(Sender: TObject);
begin
  if Length(dbeapepat.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=dbeapepat.text;
  if Length(dbeapemat.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(dbeapepat.text+' '+dbeapemat.text);
  if Length(dbeNombres.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(trim(dbeapepat.text+' '+dbeapemat.text)+' '+dbeNombres.text);
  if Length(dbesNombres.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(trim(trim(dbeapepat.text+' '+dbeapemat.text)+' '+dbeNombres.text)
                                               +' '+dbesNombres.text);
end;

procedure TFMaesClieCorto.dbesNombresExit(Sender: TObject);
begin
  if Length(dbeapepat.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=dbeapepat.text;
  if Length(dbeapemat.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(dbeapepat.text+' '+dbeapemat.text);
  if Length(dbeNombres.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(trim(dbeapepat.text+' '+dbeapemat.text)+' '+dbeNombres.text);
  if Length(dbesNombres.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(trim(trim(dbeapepat.text+' '+dbeapemat.text)+' '+dbeNombres.text)
                                               +' '+dbesNombres.text);
end;

procedure TFMaesClieCorto.dbeapepatExit(Sender: TObject);
begin
  if Length(dbeapepat.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=dbeapepat.text;
  if Length(dbeapemat.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(dbeapepat.text+' '+dbeapemat.text);
  if Length(dbeNombres.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(trim(dbeapepat.text+' '+dbeapemat.text)+' '+dbeNombres.text);
  if Length(dbesNombres.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(trim(trim(dbeapepat.text+' '+dbeapemat.text)+' '+dbeNombres.text)
                                               +' '+dbesNombres.text);
end;

procedure TFMaesClieCorto.dbeapematExit(Sender: TObject);
begin
  if Length(dbeapepat.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=dbeapepat.text;
  if Length(dbeapemat.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(dbeapepat.text+' '+dbeapemat.text);
  if Length(dbeNombres.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(trim(dbeapepat.text+' '+dbeapemat.text)+' '+dbeNombres.text);
  if Length(dbesNombres.text)>0 then
     DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=trim(trim(trim(dbeapepat.text+' '+dbeapemat.text)+' '+dbeNombres.text)
                                               +' '+dbesNombres.text);
end;

procedure TFMaesClieCorto.FormShow(Sender: TObject);
var
   xSQL: String;
   dsClieClone:TwwDataSource;
   cdsClieClone:TwwClientDataSet;
begin
   DMFAC.AccesosUsuarios( DMFAC.wModulo,DMFAC.wUsuario,'2',Screen.ActiveForm.Name );
   //INICIO HPC_201210_FAC
   Filtracds( DMFAC.cdsTDocSunat,'SELECT * FROM SUNAT101 ');
   dblcTDocIdentidad.DataField := 'TDOC_ID_SUNAT';
   dblcTDocIdentidad.LookupTable := DMFAC.cdsTDocSunat;
   dblcTDocIdentidad.LookupField := 'TIPDOCID';

   dblcTDocIdentidad.Selected.Clear;
   dblcTDocIdentidad.Selected.Add('TIPDOCID'#9'3'#9'Id'#9'F');
   dblcTDocIdentidad.Selected.Add('TIPDOCDES'#9'20'#9'Descripción'#9'F');
   //FIN HPC_201210_FAC
   pcMaestro.ActivePageIndex:=0;
   if DMFAC.wModo = 'A' then
   begin
      dblcDeparta.Enabled:=True;
      dblcdProvinc.Enabled:=True;
      dblcdDistrito.Enabled:=True;
      LimpiaEdits;
      RegistroNuevo;
   end else
   begin
     wModif:='S';
     DMFAC.cdsClie.Edit;
     LimpiaEdits;
     dblcCiaExit(Sender);
     dblcPaisExit(Sender);
     dblcDepartaExit(Sender);
     dblcdProvincExit(Sender);
     dblcdDistritoExit(Sender);
     dblcTipPerExit(Sender);
     dblcClAuxExit(Sender);
     dblcClAux.Enabled:=False;
     dbeClie.Enabled  :=False;
     //dbeRazSoc.SetFocus;

     xCliedes:=DMFAC.cdsClie.FieldByName('CLIEDES').AsString;

     xSQL:= 'Select * From CXC403 Where CLIEID='+QuotedStr(dbeClie.Text)+
            ' AND CIAID='+QuotedStr(dblcCia.text);
     DMFAC.cdsLineaCredito.Close;
     DMFAC.cdsLineaCredito.DataRequest(xSQL);
     DMFAC.cdsLineaCredito.Open;
     DMFAC.cdsLineaCredito.IndexFieldNames:='CIAID;CLIEID;ULTFECHA';


     xSQL:= 'Select * From FAC110 Where CLIEID='+QuotedStr(dbeClie.Text)+' AND CIAID='+QuotedStr(dblcCia.text);
     DMFAC.cdsDireccion.Close;
     DMFAC.cdsDireccion.DataRequest(xSQL);
     DMFAC.cdsDireccion.Open;

     xSQL:= 'Select * From TGE210 Where CLIEID='+''''+dbeClie.Text+'''';
     DMFAC.cdsMiemEmpre.Close;
     DMFAC.cdsMiemEmpre.DataRequest(xSQL);
     DMFAC.cdsMiemEmpre.Open;

     xSQL:= 'Select * From TGE211 Where CLIEID='+''''+dbeClie.Text+'''';
     DMFAC.cdsBienes.Close;
     DMFAC.cdsBienes.DataRequest(xSQL);
     DMFAC.cdsBienes.Open;

   end;
end;

procedure TFMaesClieCorto.FormCreate(Sender: TObject);
begin
  //DMFAC.FiltraTabla( DMFAC.cdsVende,   'CXC203', 'VeId');
  CargaDatasource;
end;

procedure TFMaesClieCorto.CargaDataSource;
begin
  dbeTelef.DataSource      := DMFAC.dsClie;
  dbeMail.DataSource       := DMFAC.dsClie;
  dbeAbr.DataSource        := DMFAC.dsClie;
  dbeDocIdentidad.DataSource        := DMFAC.dsClie;
  dbeNombres.DataSource    := DMFAC.dsClie;
  dbesNombres.DataSource   := DMFAC.dsClie;
  dbeapepat.DataSource     := DMFAC.dsClie;
  dbeapemat.DataSource     := DMFAC.dsClie;
  dbeDirCom.DataSource     := DMFAC.dsClie;
  dblcPais.DataSource      := DMFAC.dsClie;
  dblcDeparta.DataSource   := DMFAC.dsClie;
  dblcdDistrito.DataSource := DMFAC.dsClie;
  dblcdProvinc.DataSource  := DMFAC.dsClie;

  cbActivo.DataSource      := DMFAC.dsClie;

  dblcClAux.DataSource     := DMFAC.dsClie;
  dbeClie.DataSource       := DMFAC.dsClie;
  dblcTipPer.DataSource    := DMFAC.dsClie;
  dblcCia.DataSource       := DMFAC.dsClie;
  dbeRuc.DataSource        := DMFAC.dsClie;
  dbeRazSoc.DataSource     := DMFAC.dsClie;
  //INICIO HPC_201210_FAC
  dblcTDocIdentidad.DataSource := DMFAC.dsClie;
  //FIN HPC_201210_FAC
  dblcPais.LookupTable     := DMFAC.cdsPais;
  dblcDeparta.LookupTable  := DMFAC.cdsDpto;
  dblcdDistrito.LookupTable:= DMFAC.cdsDistrito;
  dblcdProvinc.LookupTable := DMFAC.cdsProvinc;
  dblcClAux.LookupTable    := DMFAC.cdsClAux;
  dblcTipPer.LookupTable   := DMFAC.cdsTipPer;
  dblcCia.LookupTable      := DMFAC.cdsCia;
end;

procedure TFMaesClieCorto.pcMaestroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   AllowChange := True;

end;
//INICIO HPC_201210_FAC
Function TFMaesClieCorto.fg_ObtieneCodCliente: String;
var
   {xsInicio :String;
   xnSecuencia :Double ;
   xsCodClienteNew :String;
   xsFinal :String;}
   xsSql :String;
Begin
// Inicio HPC_201302_FAC
   xsSql:='Select F_C0D_CLIENTE from dual ';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xsSql);
   DMFAC.cdsQry.Open;
   Result := DMFAC.cdsQry.FieldByname('F_C0D_CLIENTE').asstring;

 {  xnSecuencia := 1;
   xsFinal := 'NO';
   While xsFinal = 'NO' Do
   Begin
      xsCodClienteNew := 'C'+StringOfChar('0',7-Length(FloatToStr(xnSecuencia))) + FloatToStr(xnSecuencia) ;
      xsSql := ' CLIEID = ' + QuotedStr(xsCodClienteNew);
      If Length(DMFAC.BuscaQRY('dspTGE','TGE204','CLIEID',xsSql,'CLIEID'))>0 Then
      Begin
         xnSecuencia := xnSecuencia + 1;
      End
      Else
      Begin
         xsFinal := 'SI';
         Result := xsCodClienteNew;
      End;
   End; }
// Fin HPC_201302_FAC
End;


Procedure TFMaesClieCorto.fg_HabilitaTipoPersona(wgTipoPersona :String);
Begin
// Inicio HPC_201311_FAC
   If (wgTipoPersona = '00')  Then //Persona Natural y otros
   Begin
      lblRuc.Enabled := False;
      lblRazonSocial.Enabled := False;
      //lblGrupo.Enabled := False;
      lblNombreCorto.Enabled := False;

      dbeRuc.Enabled := False;
      dbeRazSoc.Enabled := False;
      //dblcdGrupo.Enabled := False;
      dbeAbr.Enabled := False;
      dbeTelef.Enabled := True;
      //dbeFax.Enabled := True;
      dbeDocIdentidad.Enabled := True;

      lblNombre.Enabled := True;
      lblNombre2.Enabled := True;
      lblApPaterno.Enabled := True;
      lblApMaterno.Enabled := True;
      dbeNombres.Enabled := True;
      dbesNombres.Enabled := True;
      dbeapepat.Enabled := True;
      dbeapemat.Enabled := True;

      lblTDocIdentidad.Enabled := True;
      lblDocIdentidad.Enabled := True;
      dblcTDocIdentidad.Enabled := True;
      dbeDocIdentidad.Enabled := True;
      If  (DMFAC.wModo = 'A')  And (wgTipoPersona = '00')Then
      Begin
         dbeClie.Enabled := True;
      End;
   End
   Else 
// Fin HPC_201311_FAC
   If (wgTipoPersona = '01') Then //Persona Natural y otros
   Begin
      lblRuc.Enabled := False;
      lblRazonSocial.Enabled := False;
      //lblGrupo.Enabled := False;
      lblNombreCorto.Enabled := False;

      dbeRuc.Enabled := False;
      dbeRazSoc.Enabled := False;
      //dblcdGrupo.Enabled := False;
      dbeAbr.Enabled := False;
      dbeTelef.Enabled := True;
      //dbeFax.Enabled := True;
      dbeDocIdentidad.Enabled := True;

      lblNombre.Enabled := True;
      lblNombre2.Enabled := True;
      lblApPaterno.Enabled := True;
      lblApMaterno.Enabled := True;
      dbeNombres.Enabled := True;
      dbesNombres.Enabled := True;
      dbeapepat.Enabled := True;
      dbeapemat.Enabled := True;

      lblTDocIdentidad.Enabled := False;
      lblDocIdentidad.Enabled := True;
      dblcTDocIdentidad.Enabled := False;
      dbeDocIdentidad.Enabled := True;
   // Inicio HPC_201311_FAC
      If  (DMFAC.wModo = 'A')  And (wgTipoPersona = '00')Then
      Begin
         dbeClie.Enabled := True;
      End;
   // Fin HPC_201311_FAC
   End
   Else If (wgTipoPersona = '02') Then //Persona Juridica
   Begin
      lblRuc.Enabled := True;
      lblRazonSocial.Enabled := True;
      //lblGrupo.Enabled := False;
      lblNombreCorto.Enabled := True;

      dbeRuc.Enabled := True;
      dbeRazSoc.Enabled := True;
      //dblcdGrupo.Enabled := False;
      dbeAbr.Enabled := True;
      dbeTelef.Enabled := True;
      //dbeFax.Enabled := True;
      dbeDocIdentidad.Enabled := False;

      lblNombre.Enabled := False;
      lblNombre2.Enabled := False;
      lblApPaterno.Enabled := False;
      lblApMaterno.Enabled := False;
      dbeNombres.Enabled := False;
      dbesNombres.Enabled := False;
      dbeapepat.Enabled := False;
      dbeapemat.Enabled := False;

      lblTDocIdentidad.Enabled := False;
      lblDocIdentidad.Enabled := False;
      dblcTDocIdentidad.Enabled := False;
      dbeDocIdentidad.Enabled := False;
   End
   Else If (wgTipoPersona = '03') Then //No domiciliado
   Begin
      lblRuc.Enabled := False;
      lblRazonSocial.Enabled := False;
      //lblGrupo.Enabled := False;
      lblNombreCorto.Enabled := False;      

      dbeRuc.Enabled := False;
      dbeRazSoc.Enabled := False;
      //dblcdGrupo.Enabled := False;
      dbeAbr.Enabled := False;
      dbeTelef.Enabled := True;
      //dbeFax.Enabled := True;
      dbeDocIdentidad.Enabled := False;

      lblNombre.Enabled := True;
      lblNombre2.Enabled := True;
      lblApPaterno.Enabled := True;
      lblApMaterno.Enabled := True;      
      dbeNombres.Enabled := True;
      dbesNombres.Enabled := True;
      dbeapepat.Enabled := True;
      dbeapemat.Enabled := True;

      lblTDocIdentidad.Enabled := True;
      lblDocIdentidad.Enabled := True;
      dblcTDocIdentidad.Enabled := True;
      dbeDocIdentidad.Enabled := True;
   End;
End;
//FIN HPC_201210_FAC
Procedure TFMaesClieCorto.dblcTDocIdentidadExit(Sender: TObject);
Var
   xsSql :String;
Begin
   If Length( dblcTDocIdentidad.Text )=0 Then Exit;
   xsSql := 'TIPDOCID='+Quotedstr(dblcTDocIdentidad.Text);
	 edtTDocIdentidad.Text:=DMFAC.BuscaQry('dspTGE','SUNAT101','*',xsSql,'TIPDOCDES');
   //DMFAC.cdsClie.FieldByName('CLIEDNI').AsString := '' ;


   dbeDocIdentidad.MaxLength := DMFAC.cdsQry.FieldByName('VALIDALONG').Value ;

End;

Procedure TFMaesClieCorto.fg_DefaultCampos(wgTipoPersona :String);
Begin
// Inicio HPC_201311_FAC
   DMFAC.cdsTDocSunat.Filter := '';
   DMFAC.cdsTDocSunat.Filtered := True;
   If wgTipoPersona = '01' Then //Persona Natural
   Begin
      DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString := '01' ;
      DMFAC.cdsClie.FieldByName('CLIERUC').AsString := '' ;
      dblcTDocIdentidadExit(dblcTDocIdentidad);
   End
   Else If wgTipoPersona = '02' Then //Persona Jurídica
   Begin
      DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString := '06' ;
      DMFAC.cdsClie.FieldByName('CLIEAPEPAT').AsString := '' ;
      DMFAC.cdsClie.FieldByName('CLIEAPEMAT').AsString := '' ;
      DMFAC.cdsClie.FieldByName('CLIENOMBRE').AsString := '' ;
      DMFAC.cdsClie.FieldByName('CLIENOMBRE1').AsString := '' ;
      dblcTDocIdentidadExit(dblcTDocIdentidad);
   End
   Else If wgTipoPersona = '03' Then //no domiciliada
   Begin
      DMFAC.cdsTDocSunat.Filter := 'TIPDOCID = '+QuotedStr('04')+ ' OR TIPDOCID = '+QuotedStr('07') ;
      DMFAC.cdsTDocSunat.Filtered := True;
      DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString := '07' ;
      DMFAC.cdsClie.FieldByName('CLIERUC').AsString := '' ;
      dblcTDocIdentidadExit(dblcTDocIdentidad);
   End   
   Else  If wgTipoPersona = '00' Then //Otros
   Begin
      DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString := '00' ;
      DMFAC.cdsClie.FieldByName('CLIEAPEPAT').AsString := '' ;
      DMFAC.cdsClie.FieldByName('CLIEAPEMAT').AsString := '' ;
      DMFAC.cdsClie.FieldByName('CLIENOMBRE').AsString := '' ;
      DMFAC.cdsClie.FieldByName('CLIENOMBRE1').AsString := '' ;
      DMFAC.cdsClie.FieldByName('CLIERUC').AsString := '' ;
      DMFAC.cdsClie.FieldByName('CLIEDNI').AsString := '' ;
   End;
// Fin HPC_201311_FAC
End;
Function TFMaesClieCorto.fg_ValidaDocIdentidad(wgTipoDoc :String) : Boolean;
Var
   xsSql :String;
   xnLongitudCampo : Integer ;
   xsMensaje :String;
Begin
   xsSql := 'TIPDOCID='+Quotedstr(wgTipoDoc);
	 xnLongitudCampo:= StrToInt( DMFAC.BuscaQry('dspTGE','SUNAT101','*',xsSql,'VALIDALONG'));

   xsMensaje := '';
   If (wgTipoDoc = '01') And (Length(DMFAC.cdsClie.FieldByName('CLIEDNI').AsString) <> xnLongitudCampo) Then
   Begin
      xsMensaje := 'El DNI debe tener ' + IntToStr(xnLongitudCampo)+' dígitos';
   End;

   If (wgTipoDoc = '06') And (Length(DMFAC.cdsClie.FieldByName('CLIEDNI').AsString) <> xnLongitudCampo) Then
   Begin
      xsMensaje := 'El RUC debe tener ' + IntToStr(xnLongitudCampo)+' dígitos';
   End;

   If Length(xsMensaje) >0 Then
   Begin
      ShowMessage(xsMensaje);
      Result := False;
   End
   Else
   Begin
      Result := True;
   End;

End;
//FIN HPC_201210_FAC

Procedure TFMaesClieCorto.dbeDocIdentidadExit(Sender: TObject);
//INICIO HPC_201210_FAC
Var
   xsSql :String;
//FIN HPC_201210_FAC
begin
   if (sPerNat='S') AND (dbeDocIdentidad.text='') then
   begin
      dbeDocIdentidad.SetFocus;
      ShowMessage('Persona Natural Exige Nº de Documento');
      Exit;
   end;

   //INICIO HPC_201210_FAC
   If fg_ValidaDocIdentidad(DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString ) = False Then
   Begin
      dbeDocIdentidad.SetFocus;
      Exit;
   End;

   (*if (length(trim(dbeDocIdentidad.text))>0) and (length(trim(dbeDocIdentidad.text))<>8) then
   begin
      ShowMessage('Longitud del DNI es incorrecta');
      dbeDocIdentidad.SetFocus;
      exit;
   end;*)
   xsSql := 'CLIEID <> ' + QuotedStr(dbeClie.text) + ' AND CLIEDNI='+QuotedStr(dbeDocIdentidad.text);
   //FIN HPC_201210_FAC
   if (dbeDocIdentidad.text<>'') then
      //INICIO HPC_201210_FAC
      //if dbeDocIdentidad.text=DMCXC.BuscaQry('dspTGE','TGE204','CLIEID,CLIEDES,CLIEDNI','CLIEID<>'+QuotedStr(dbeClie.text)+' AND CLIEDNI='+QuotedStr(dbeDocIdentidad.text),'CLIEDNI') then
      if dbeDocIdentidad.text=DMFAC.BuscaQry('dspTGE','TGE204','CLIEID,CLIEDES,CLIEDNI',xsSql,'CLIEDNI') then
      //FIN HPC_201210_FAC
      begin
         dbeDocIdentidad.SetFocus;
         ShowMessage('DNI fue asignado al Cliente: '+DMFAC.cdsQry.FieldByName('CLIEID').AsString+' '+DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
         Exit;
      end;

End;



end.


