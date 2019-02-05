Unit Fac200;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Fac200
// FORMULARIO               : FMaesClie
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Ventana de mantenimiento de clientes
//

// Actualizaciones:
// HPC_201210_FAC 29/10/2012  Se implemtentó la funcionalidad que obtiene
//                            automáticamente el código del cliente
// HPC_201302_FAC 14/02/2013  Se cambio rutina de código automatico de cliente para usar funcion F_C0D_CLIENTE
//                            en vez de rutina del Delphi
// HPC_201507_FAC 24/11/2015 Entrega al área de Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls, ComCtrls, Mask, wwdbedit, wwdblook, DBCtrls, Grids,
   Wwdbigrd, Wwdbgrid, Buttons, DB, wwdbdatetimepicker, Wwdbdlg, Wwdatsrc,
   wwClient, wwcheckbox;

Type
   TFMaesClie = Class(TForm)
      pnlPrincipal: TPanel;
      Panel1: TPanel;
      pcMaestro: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      Panel3: TPanel;
      Label4: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      dbeTelef: TwwDBEdit;
      dbeFax: TwwDBEdit;
      dbeMail: TwwDBEdit;
      Panel5: TPanel;
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
      tsDireccion: TTabSheet;
      pnlDireccion: TPanel;
      Label11: TLabel;
      dbeDirCom: TwwDBEdit;
      Label12: TLabel;
      dbeDirLeg: TwwDBEdit;
      Label29: TLabel;
      dblcPais: TwwDBLookupCombo;
      dbePais: TwwDBEdit;
      Label21: TLabel;
      dblcDeparta: TwwDBLookupCombo;
      dbeDeparta: TwwDBEdit;
      Label22: TLabel;
      dbeProvinc: TwwDBEdit;
      Label23: TLabel;
      dbeDistrito: TwwDBEdit;
      TabSheet4: TTabSheet;
      Panel4: TPanel;
      Label5: TLabel;
      dblcVende: TwwDBLookupCombo;
      dbeVende: TwwDBEdit;
      Label3: TLabel;
      dbeContac: TwwDBEdit;
      Label9: TLabel;
      dblcConPago: TwwDBLookupCombo;
      dbeCondPago: TwwDBEdit;
      Label20: TLabel;
      dbeCapSoc: TwwDBEdit;
      Label18: TLabel;
      dblcSecEco: TwwDBLookupCombo;
      dbeSecEco: TwwDBEdit;
      Label16: TLabel;
      dbeCIUU: TwwDBEdit;
      Label1: TLabel;
      dbeGarantias: TwwDBEdit;
      lblNombreCorto: TLabel;
      dbeAbr: TwwDBEdit;
      lblDocIdentidad: TLabel;
      dbeDocIdentidad: TwwDBEdit;
      pnlPie: TPanel;
      Z2bbtnOK: TBitBtn;
      Z2bbtnCancel: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      tsDireccionEntrega: TTabSheet;
      pnlLEntrega: TPanel;
      Label50: TLabel;
      Label51: TLabel;
      lblRuc: TLabel;
      dbeRuc: TwwDBEdit;
      lblRazonSocial: TLabel;
      dbeRazSoc: TwwDBEdit;
      lblGrupo: TLabel;
      Label28: TLabel;
      dbeGirador: TwwDBEdit;
      Label30: TLabel;
      dbeRepres: TwwDBEdit;
      Label19: TLabel;
      dblcVinculo: TwwDBLookupCombo;
      dbeVinculo: TwwDBEdit;
      Label6: TLabel;
      dblcGiro: TwwDBLookupCombo;
      dbeGiro: TwwDBEdit;
      Label2: TLabel;
      dblcClasif: TwwDBLookupCombo;
      dbeClasif: TwwDBEdit;
      edtSecNta: TEdit;
      edtZonNta: TEdit;
      dblcSecVta: TwwDBLookupCombo;
      dblcdGrupo: TwwDBLookupComboDlg;
      Label24: TLabel;
      pnlBienes: TPanel;
      Label40: TLabel;
      Label41: TLabel;
      Label42: TLabel;
      Label43: TLabel;
      Label44: TLabel;
      Label45: TLabel;
      dbeBien: TwwDBEdit;
      dbeDescripcion: TwwDBEdit;
      dblcTipoBien: TwwDBLookupCombo;
      dbeTipoBien: TwwDBEdit;
      dbeValorMiembro: TwwDBEdit;
      dbmDetalleBien: TDBMemo;
      Z2bbtnOK3: TBitBtn;
      Z2bbtnCancel3: TBitBtn;
      pnlMiembros: TPanel;
      Label31: TLabel;
      Label33: TLabel;
      Label34: TLabel;
      Label35: TLabel;
      Label36: TLabel;
      Label37: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      dbeMiembro: TwwDBEdit;
      dbeNombre: TwwDBEdit;
      dblcOcupac: TwwDBLookupCombo;
      dbeOcupac: TwwDBEdit;
      dbeSueldo: TwwDBEdit;
      dbeDomicMiembro: TwwDBEdit;
      dbeTelfMiembro: TwwDBEdit;
      Z2bbtnCancel2: TBitBtn;
      Z2bbtnOK2: TBitBtn;
      dtpFecNacMiembro: TwwDBDateTimePicker;
      dbgMiembros: TwwDBGrid;
      wwDBGrid2IButton: TwwIButton;
      Label32: TLabel;
      dbgBienes: TwwDBGrid;
      wwDBGrid1IButton: TwwIButton;
      tsLineaCredito: TTabSheet;
      Panel6: TPanel;
      dbgLineaCredito: TwwDBGrid;
      ibInsertaLineaCredito: TwwIButton;
      pnlLineaCredito: TPanel;
      Label15: TLabel;
      Z2bbtnOKLC: TBitBtn;
      Z2bbtnCancelLC: TBitBtn;
      Label54: TLabel;
      dbeLineaCreditoMax: TwwDBEdit;
      Label55: TLabel;
      dbdtpUltFecha: TwwDBDateTimePicker;
      Label56: TLabel;
      dbeLineaCreditoMin: TwwDBEdit;
      Label57: TLabel;
      dblcTMonid: TwwDBLookupCombo;
      edtTMonId: TEdit;
      dblcdDistrito: TwwDBLookupComboDlg;
      dblcdProvinc: TwwDBLookupComboDlg;
      Label49: TLabel;
      dblcMoneda: TwwDBLookupCombo;
      edtMoneda: TEdit;
      Label7: TLabel;
      dbeCredMax: TwwDBEdit;
      dbeCredMin: TwwDBEdit;
      Label8: TLabel;
      Label53: TLabel;
      dblcLPrecio: TwwDBLookupCombo;
      edtLPrecio: TEdit;
      dbgLugarEntrega: TwwDBGrid;
      ibLugarEntrega: TwwIButton;
      dblcZonVta: TwwDBLookupComboDlg;
      dblcCIUU: TwwDBLookupComboDlg;
      dblcSituacion: TwwDBLookupCombo;
      dbeSitClie: TwwDBEdit;
      Label63: TLabel;
      Label64: TLabel;
      dbeAvalNomb: TwwDBEdit;
      Label65: TLabel;
      Label66: TLabel;
      Label67: TLabel;
      Label68: TLabel;
      dbeAvalDir: TwwDBEdit;
      dbeAvalDoc: TwwDBEdit;
      dbeAvalTelf: TwwDBEdit;
      TabSheet3: TTabSheet;
      Panel7: TPanel;
      Label69: TLabel;
      dbeComentario: TwwDBEdit;
      lblNombre: TLabel;
      dbeNombres: TwwDBEdit;
      lblNombre2: TLabel;
      dbesNombres: TwwDBEdit;
      lblApPaterno: TLabel;
      dbeapepat: TwwDBEdit;
      lblApMaterno: TLabel;
      dbeapemat: TwwDBEdit;
      pnlLugarEntrega: TPanel;
      Label58: TLabel;
      Label59: TLabel;
      Label60: TLabel;
      Label61: TLabel;
      Label62: TLabel;
      dbeIdDireccionEntrega: TwwDBEdit;
      dbeDirecionEntrega: TwwDBEdit;
      edtZonaLE: TEdit;
      dblcdDistritoLE: TwwDBLookupComboDlg;
      edtDistritoLE: TwwDBEdit;
      Z2bbtnOKLE: TBitBtn;
      Z2bbtnCancelLE: TBitBtn;
      dblcZonaLE: TwwDBLookupComboDlg;
      cbActivo: TwwCheckBox;
      lblTDocIdentidad: TLabel;
      dblcTDocIdentidad: TwwDBLookupCombo;
      edtTDocIdentidad: TwwDBEdit;
      Procedure wwDBGrid2IButtonClick(Sender: TObject);
      Procedure dbgMiembrosDblClick(Sender: TObject);
      Procedure Z2bbtnCancel2Click(Sender: TObject);
      Procedure Z2bbtnOK2Click(Sender: TObject);
      Procedure Regresa2;
      Procedure Regresa3;
      Procedure Regresa4;
      Procedure Regresa5;
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Z2bbtnCancel3Click(Sender: TObject);
      Procedure Z2bbtnOK3Click(Sender: TObject);
      Procedure wwDBGrid1IButtonClick(Sender: TObject);
      Procedure dbgBienesDblClick(Sender: TObject);
      Procedure Z2bbtnCancelClick(Sender: TObject);
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure dblcOcupacChange(Sender: TObject);
      Procedure dblcOcupacExit(Sender: TObject);
      Procedure dblcTipoBienExit(Sender: TObject);
      Procedure dbeMiembroExit(Sender: TObject);
      Procedure dbeBienExit(Sender: TObject);
      Procedure dbeClieExit(Sender: TObject);
      Procedure dblcClAuxExit(Sender: TObject);
      Procedure dblcTipPerExit(Sender: TObject);
      Procedure dblcGiroExit(Sender: TObject);
      Procedure dblcClasifExit(Sender: TObject);
      Procedure dblcVinculoExit(Sender: TObject);
      Procedure dblcConPagoExit(Sender: TObject);
      Procedure dbgMiembrosKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgBienesKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcPaisExit(Sender: TObject);
      Procedure dblcDepartaExit(Sender: TObject);
      Procedure dblcVendeExit(Sender: TObject);
      Procedure dblcSecEcoExit(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure dblcMonedaExit(Sender: TObject);
      Procedure dblcLPrecioExit(Sender: TObject);
      Procedure dblcSecVtaExit(Sender: TObject);
      Procedure dbeRazSocExit(Sender: TObject);
      Procedure ibInsertaLineaCreditoClick(Sender: TObject);
      Procedure Z2bbtnOKLCClick(Sender: TObject);
      Procedure Z2bbtnCancelLCClick(Sender: TObject);
      Procedure dbgLineaCreditoDblClick(Sender: TObject);
      Procedure dbgLineaCreditoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbdtpUltFechaEnter(Sender: TObject);
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcTMonidExit(Sender: TObject);
      Procedure dblcdDistritoExit(Sender: TObject);
      Procedure dblcdProvincExit(Sender: TObject);
      Procedure ibLugarEntregaClick(Sender: TObject);
      Procedure dblcdDistritoLEExit(Sender: TObject);
      Procedure dbgLugarEntregaKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgLugarEntregaDblClick(Sender: TObject);
      Procedure Z2bbtnOKLEClick(Sender: TObject);
      Procedure Z2bbtnCancelLEClick(Sender: TObject);
      Procedure dbeRucExit(Sender: TObject);
      Procedure dblcZonVtaExit(Sender: TObject);
      Procedure dblcCIUUExit(Sender: TObject);
      Procedure dblcZonaLEExit(Sender: TObject);
      Procedure dblcSituacionExit(Sender: TObject);
      Procedure dbeNombresExit(Sender: TObject);
      Procedure dbesNombresExit(Sender: TObject);
      Procedure dbeapepatExit(Sender: TObject);
      Procedure dbeapematExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure pcMaestroChanging(Sender: TObject; Var AllowChange: Boolean);
      Procedure dbeDocIdentidadExit(Sender: TObject);
      Procedure dblcTDocIdentidadExit(Sender: TObject);

   Private
    { Private declarations }
      wModif: String;
      sPerNat: String;
      xCliedes: String;
      Procedure LimpiaEdits;
      Function ValidaCliente: Boolean;
      Function ExisteDuplicado: Boolean;
      Procedure RegistroNuevo;
      Procedure ActualizaClieDes;
      Procedure CargaDataSource;
   //INICIO HPC_201210_FAC
      Function fg_ObtieneCodCliente: String;
      Procedure fg_HabilitaTipoPersona(wgTipoPersona: String);
      Procedure fg_DefaultCampos(wgTipoPersona: String);
      Function fg_ValidaDocIdentidad(wgTipoDoc: String): Boolean;
   //FIN HPC_201210_FAC
   Public
    { Public declarations }
   End;

Var
   FMaesClie: TFMaesClie;
   xErrorValida: boolean;

Implementation

{$R *.DFM}

Uses FACDM, oaVE2000;

Procedure TFMaesClie.RegistroNuevo;
Var
   xSql: String;
Begin
  //INICIO HPC_201210_FAC
  //dbeClie.Enabled := True;
  //FIN HPC_201210_FAC
   dbeCia.Text := '';
   dbePais.Text := '';
   dbeDeparta.Text := '';
   dbeProvinc.Text := '';
   dbeDistrito.Text := '';
   dbeVende.Text := '';
   dbeCondPago.Text := '';
   dbeTipPer.Text := '';
   dbeGiro.Text := '';
   dbeClasif.Text := '';
   dbeVinculo.Text := '';
   dbeSecEco.Text := '';
   dbeCIUU.Text := '';
   dbeClaux.Text := '';

   DMFAC.cdsClie.Insert;
   DMFAC.cdsClie.FieldByName('ACTIVO').AsString := 'S';
   DMFAC.cdsClieComent.Close;
   DMFAC.cdsClieComent.DataRequest('SELECT * FROM TGE218 WHERE CLIEID=''XXX'' ');
   DMFAC.cdsClieComent.Open;
   DMFAC.cdsClieComent.Insert;
   wModif := 'N';

  // Sector Comercial  TVTAID (Lima, Provincia)        DMFAC.cdsZona
   If DMFAC.cdsZona.recordcount = 1 Then
   Begin
      DMFAC.cdsClie.FieldByName('TVTAID').AsString := DMFAC.cdsZona.FieldByName('TVTAID').AsString;
      edtSecNta.Text := DMFAC.DisplayDescrip('FAC105', 'TVTADES', 'TVTAID', dblcSecVta.text);
   End;
// Zona de Venta     ZONVTAID (Distrito)             DMFAC.cdsZona1
   If DMFAC.cdsZona1.recordcount = 1 Then
   Begin
      DMFAC.cdsClie.FieldByName('ZONVTAID').AsString := DMFAC.cdsZona1.FieldByName('ZVTAID').AsString;
      edtZonNta.Text := DMFAC.DisplayDescrip('FAC106', 'ZVTADES', 'ZVTAID', dblcZonVta.text);
   End;
// Vendedor          VEID                            DMFAC.cdsVende
   If DMFAC.cdsVende.recordcount = 1 Then
   Begin
      DMFAC.cdsClie.FieldByName('VEID').AsString := DMFAC.cdsVende.FieldByName('VEID').AsString;
      dbeVende.Text := DMFAC.BuscaQry('dspUltTGE', 'CXC203', '*', 'VEID = ' + QuotedStr(dblcVende.Text), 'VENOMBRES');
   End;

   xSQL := 'Select * From CXC403 Where CLIEID=' + QuotedStr('PQRSTU');
   DMFAC.cdsLineaCredito.Close;
   DMFAC.cdsLineaCredito.DataRequest(xSQL);
   DMFAC.cdsLineaCredito.Open;
   DMFAC.cdsLineaCredito.IndexFieldNames := 'CIAID;CLIEID;ULTFECHA';

  //INICIO HPC_201210_FAC
  //dblcClAux.Enabled:=True;
  //FIN HPC_201210_FAC

   xSQL := 'Select * From FAC110 Where CLIEID=' + QuotedStr('FMZC');
   DMFAC.cdsDireccion.Close;
   DMFAC.cdsDireccion.DataRequest(xSQL);
   DMFAC.cdsDireccion.Open;

   xSQL := 'Select * From TGE210 Where CLIEID=' + '''' + ' ' + '''';
   DMFAC.cdsMiemEmpre.Close;
   DMFAC.cdsMiemEmpre.DataRequest(xSQL);
   DMFAC.cdsMiemEmpre.Open;

   xSQL := 'Select * From TGE211 Where CLIEID=' + '''' + ' ' + '''';
   DMFAC.cdsBienes.Close;
   DMFAC.cdsBienes.DataRequest(xSQL);
   DMFAC.cdsBienes.Open;
   dblcCia.SetFocus;
End;

Procedure TFMaesClie.wwDBGrid2IButtonClick(Sender: TObject);
Begin
   If (DMFAC.wModo = 'A') And (length(dbeClie.Text) = 0) Then
      Raise Exception.Create(' Cliente no Registrado ');

   pnlCab.Enabled := False;
   pnlPie.Enabled := False;
   dbgMiembros.Enabled := False;
   dbgBienes.Enabled := False;
   pnlMiembros.Visible := True;

   DMFAC.cdsMiemEmpre.Insert;
   DMFAC.cdsMiemEmpre.FieldByName('CLIEID').AsString := dbeClie.Text;

   dbeMiembro.Text := '';
   dbeMiembro.Setfocus;
End;

Procedure TFMaesClie.dbgMiembrosDblClick(Sender: TObject);
Begin
   If DMFAC.cdsMiemEmpre.RecordCount = 0 Then Exit;

   pnlMiembros.Visible := True;
   pnlMiembros.SetFocus;
   dbgMiembros.Enabled := False;

   dbeMiembro.Enabled := False;
   DMFAC.cdsMiemEmpre.Edit;
End;

Procedure TFMaesClie.Z2bbtnCancel2Click(Sender: TObject);
Begin
   If DMFAC.cdsMiemEmpre.State = dsInsert Then DMFAC.cdsMiemEmpre.Delete;
   Regresa2;
End;

Procedure TFMaesClie.Z2bbtnOK2Click(Sender: TObject);
Var
   xWhere, xMiembro: String;
Begin
   xWhere := 'CLIEID=' + '''' + dbeClie.Text + '''' + ' AND MIEMID = ' + '''' + dbeMiembro.Text + '''';
   xMiembro := DMFAC.BuscaQry('dspUltTGE', 'TGE210', '*', xWhere, 'MIEMID');
   If (DMFAC.wModo = 'A') And (xMiembro = dbeMiembro.Text) Then
      Raise Exception.Create(' Miembro ya Registrado ');

   If length(dbeNombre.Text) = 0 Then
      Raise Exception.Create(' Nombre no Registrado ');

   Screen.Cursor := crHourGlass;

   DMFAC.cdsPost(DMFAC.cdsMiemEmpre);

   DMFAC.AplicaDatos(DMFAC.cdsMiemEmpre, 'MIEMEMPRE');

   Regresa2;

   Screen.Cursor := crDefault;
End;

Procedure TFMaesClie.Regresa2;
Begin
   pnlCab.Enabled := True;
   pnlPie.Enabled := True;
   dbgMiembros.Enabled := True;
   pnlMiembros.Visible := False;
   dbeMiembro.Enabled := True;
   dbgMiembros.Setfocus;
End;

Procedure TFMaesClie.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   If (DMFAC.cdsLineaCredito.Modified) Or (DMFAC.cdsLineaCredito.ChangeCount > 0) Then
   Begin
      If MessageDlg('¿Los Datos de Línea de Crédito se perderán. Desea Continuar', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMFAC.cdsZona1.Filter := '';
         DMFAC.cdsZona1.Filtered := False;
         pcMaestro.ActivePageIndex := 0;
      End;
   End;
   DMFAC.cdsProvinc.Filter := '';
   DMFAC.cdsProvinc.Filtered := False;

   DMFAC.cdsDistrito.Filter := '';
   DMFAC.cdsDistrito.Filtered := False;

   DMFAC.cdsClie.CancelUpdates;
   DMFAC.cdsClie.Cancel;
   DMFAC.cdsClie.Close;
   {FVariables.w_VE_Registro := False;
   FVariables.w_Num_Formas:=FVariables.w_Num_Formas-1;}
   Action := CAFree;
End;

Procedure TFMaesClie.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_Dialogkey, VK_TAB, 0);
   End;
End;

Procedure TFMaesClie.Z2bbtnCancel3Click(Sender: TObject);
Begin
   If DMFAC.cdsBienes.State = dsInsert Then DMFAC.cdsBienes.Delete;
   Regresa3;
End;

Procedure TFMaesClie.Z2bbtnOK3Click(Sender: TObject);
Var
   xWhere, xBien: String;
Begin
   xWhere := 'CLIEID=' + '''' + dbeClie.Text + '''' + ' AND BIENID = ' + '''' + dbeBien.Text + '''';
   xBien := DMFAC.BuscaQry('dspUltTGE', 'TGE211', '*', xWhere, 'BIENID');
   If (DMFAC.wModo = 'A') And (xBien = dbeBien.Text) Then
      Raise Exception.Create(' Bien ya Registrado ');

   If length(dbeNombre.Text) = 0 Then
      Raise Exception.Create(' Descripción no Registrada ');
   If length(dblcTipoBien.Text) = 0 Then
      Raise Exception.Create(' Tipo de Bien no Registrado ');

   Screen.Cursor := crHourGlass;

   DMFAC.cdsPost(DMFAC.cdsBienes);

   DMFAC.AplicaDatos(DMFAC.cdsBienes, 'BIENES');

   Regresa3;

   Screen.Cursor := crDefault;
End;

Procedure TFMaesClie.wwDBGrid1IButtonClick(Sender: TObject);
Begin
   If (DMFAC.wModo = 'A') And (length(dbeClie.Text) = 0) Then
      Raise Exception.Create(' Cliente no Registrado ');

   pnlCab.Enabled := False;
   pnlPie.Enabled := False;
   dbgMiembros.Enabled := False;
   dbgBienes.Enabled := False;
   pnlBienes.Visible := True;

   DMFAC.cdsBienes.Insert;
   DMFAC.cdsBienes.FieldByName('CLIEID').AsString := dbeClie.Text;

   dbeBien.Text := '';
   dbeBien.Setfocus;
End;

Procedure TFMaesClie.dbgBienesDblClick(Sender: TObject);
Var
   xWhere: String;
Begin
   If DMFAC.cdsBienes.RecordCount = 0 Then Exit;

   pnlBienes.Visible := True;
   pnlBienes.SetFocus;
   dbgBienes.Enabled := False;

   dbeBien.Enabled := False;

   xWhere := 'TIPBIENID = ' + '''' + dblcTipOBien.Text + '''';
   dbeTipoBien.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE164', '*', xWhere, 'TIPBIENDES');

   DMFAC.cdsBienes.Edit;
End;

Procedure TFMaesClie.Regresa3;
Begin
   pnlCab.Enabled := True;
   pnlPie.Enabled := True;
   dbgBienes.Enabled := True;
   pnlBienes.Visible := False;
   dbeBien.Enabled := True;
   dbgBienes.Setfocus;
End;

Procedure TFMaesClie.Z2bbtnCancelClick(Sender: TObject);
Begin
   If DMFAC.cdsClie.State = dsInsert Then DMFAC.cdsClie.Delete;
   close
End;

Procedure TFMaesClie.Z2bbtnOKClick(Sender: TObject);
Var
   xWhere, xCliente: String;
   xPerNat: String;
Begin
   If DMFAC.cdsClie.State = dsBrowse Then
      DMFAC.cdsClie.Edit;
   If Length(dbeapepat.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := dbeapepat.text;
   If Length(dbeapemat.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(dbeapepat.text + ' ' + dbeapemat.text);
   If Length(dbeNombres.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(trim(dbeapepat.text + ' ' + dbeapemat.text) + ' ' + dbeNombres.text);
   If Length(dbesNombres.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(trim(trim(dbeapepat.text + ' ' + dbeapemat.text) + ' ' + dbeNombres.text)
         + ' ' + dbesNombres.text);
   Screen.Cursor := crHourGlass;

   If trim(dbeRuc.text) = '' Then dbeRuc.text := '';
   //INICIO HPC_201210_FAC
   If DMFAC.wModo = 'A' Then
   Begin
      If dblcTipPer.Text <> '00' Then
      Begin
         DMFAC.cdsClie.FieldByName('CLIEID').AsString := fg_ObtieneCodCliente;
      End;
      DMFAC.cdsClie.FieldByName('CLAUXID').AsString := 'C';
      dbeClieExit(dbeClie);
   End;
   //FIN HPC_201210_FAC
// Valida que RUC no se esté registrando al mismo momento para la misma Clase de Auxiliar
   If (trim(dbeRuc.text) <> '') Then
   Begin
      If (length(trim(dbeRuc.text)) <> 11) Then
      Begin
         Screen.Cursor := crdefault;
         ShowMessage('Longitud del RUC es incorrecta');
         dbeRuc.SetFocus;
         exit;
      End;
      xWhere := 'CLAUXID=' + quotedstr(dblcClAux.Text)
         + ' and CLIEID<>' + QuotedStr(dbeClie.text)
         + ' and CLIERUC=' + QuotedStr(dbeRUC.text);
      If dbeRuc.text = DMFAC.BuscaQry('dspUltTGE', 'TGE204', 'CLIEID,CLIEDES,CLIERUC', xWhere, 'CLIERUC') Then
      Begin
         dbeRuc.SetFocus;
         Screen.Cursor := crdefault;
         //INICIO HPC_201210_FAC
         //Raise Exception.Create('RUC asignado al Cliente: '+DMFAC.cdsQry.FieldByName('CLIEID').AsString+' '+DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
         ShowMessage('RUC asignado al Cliente: ' + DMFAC.cdsQry.FieldByName('CLIEID').AsString + ' ' + DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
         Exit;
         //FIN HPC_201210_FAC
      End;
      xWhere := '';
   End;

   If (sPerNat = 'N') And (length(trim(dbeRazSoc.text)) > 0) Then
   Begin
      xWhere := 'CLAUXID=' + quotedstr(dblcClAux.Text)
         + ' and CLIEID<>' + QuotedStr(dbeClie.text)
         + ' and CLIEDES=' + QuotedStr(dbeRazSoc.text);
      If dbeRazSoc.text = DMFAC.BuscaQry('dspUltTGE', 'TGE204', 'CLIEID,CLIEDES,CLIERUC', xWhere, 'CLIEDES') Then
      Begin
         dbeRazSoc.SetFocus;
         Screen.Cursor := crdefault;
         //INICIO HPC_201210_FAC
         //Raise Exception.Create('Razón Social asignada al Cliente: '+DMFAC.cdsQry.FieldByName('CLIEID').AsString+' '+DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
         ShowMessage('Razón Social asignada al Cliente: ' + DMFAC.cdsQry.FieldByName('CLIEID').AsString + ' ' + DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
         Exit;
         //FIN HPC_201210_FAC
      End;
      xWhere := '';
   End;

   If ValidaCliente = False Then
   Begin
      Screen.Cursor := crdefault;
      Exit;
   End;
   //if xErrorValida then exit;

   If (DMFAC.wModo = 'A') And (dblcClAux.Enabled) Then
   Begin
      xWhere := 'CLAUXID=''' + dblcClAux.Text + ''' and CLIEID=''' + dbeClie.Text + '''';
      xCliente := DMFAC.BuscaQry('dspUltTGE', 'TGE204', 'CLIEID', xWhere, 'CLIEID');
      If xCliente = dbeClie.Text Then
      Begin
         Screen.Cursor := crdefault;
         //INICIO HPC_201210_FAC
         //Raise Exception.Create(' Cliente ya Registrado ');
         ShowMessage(' Cliente ya Registrado ');
         Exit;
         //FIN HPC_201210_FAC
      End;
      dblcClAux.Enabled := False;
      dbeClie.Enabled := False;
   End;

   If DMFAC.cdsClie.State = dsBrowse Then
      DMFAC.cdsClie.Edit;
   DMFAC.cdsClie.FieldByName('USERID').AsString := DMFAC.wUsuario;
   DMFAC.cdsClie.FieldByName('FREG').AsDateTime := DMFAC.DateS;
   DMFAC.cdsClie.FieldByName('HREG').AsDateTime := Time;
   If (DMFAC.wModo = 'A') Then
      DMFAC.cdsClie.FieldByName('FLAGMOV').AsString := 'N';

   If (DMFAC.cdsClieComent.State In [dsEdit, dsInsert]) And (Length(dbeComentario.text) > 0) Then
   Begin
      DMFAC.cdsClieComent.FieldByName('CIAID').AsString := dblcCia.text;
      DMFAC.cdsClieComent.FieldByName('CLAUXID').AsString := dblcClAux.text;
      DMFAC.cdsClieComent.FieldByName('CLIEID').AsString := dbeClie.text;
      DMFAC.cdsClieComent.FieldByName('CLIECOMEN').AsString := dbeComentario.text;
      DMFAC.cdsClieComent.Post;
   End;
   DMFAC.cdsClieComent.DataRequest('SELECT * FROM TGE218 WHERE CIAID=' + QuotedStr(dblcCia.text) + ' AND CLIEID=' + QuotedStr(dbeClie.text));
   DMFAC.ControlTran(9, DMFAC.cdsClieComent, 'X'); //DMFAC.AplicaDatos( DMFAC.cdsClieComent, 'CLIENTE' );

   DMFAC.cdsPost(DMFAC.cdsClie);

   DMFAC.cdsClie.DataRequest('SELECT * FROM TGE204 WHERE CLIEID=' + QuotedStr(DMFAC.cdsClie.FieldByName('CLIEID').AsString));
   If xCliedes <> DMFAC.cdsClie.FieldByName('CLIEDES').AsString Then
   Begin
      ActualizaClieDes;
   End;

   DMFAC.AplicaDatos(DMFAC.cdsClie, 'CLIENTE');
   DMFAC.AplicaDatos(DMFAC.cdsLineaCredito, 'LINEA');
   DMFAC.AplicaDatos(DMFAC.cdsDireccion, 'DIRECCION');
   DMFAC.GrabaAuxConta(DMFAC.cdsClie);

   Screen.Cursor := crDefault;
   If DMFAC.wTipoAdicion = 'xFiltro' Then
   Begin
      DMFAC.ActualizaFiltro(Mantc, DMFAC.cdsClie, DMFAC.wModo);
   End;
   ShowMessage('Grabación Exitosa');

   If DMFAC.wModo = 'A' Then Z2bbtnNuevo.Enabled := True;
End;

Procedure TFMaesClie.dblcOcupacChange(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'OCUPID = ' + '''' + dblcOcupac.Text + '''';
   dbeOcupac.Text := DMFAC.BuscaQry('dspUltTGE', 'RRHH101', '*', xWhere, 'OCUPDES');
End;

Procedure TFMaesClie.dblcOcupacExit(Sender: TObject);
Begin
   If Z2bbtnCancel2.Focused Then Exit;

   If length(dbeOcupac.Text) = 0 Then
   Begin
      ShowMessage('Falta Ocupación');
      dblcOcupac.SetFocus;
   End;
End;

Procedure TFMaesClie.dblcTipoBienExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Z2bbtnCancel3.Focused Then Exit;

   xWhere := 'TIPBIENID = ' + '''' + dblcTipOBien.Text + '''';
   dbeTipoBien.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE164', '*', xWhere, 'TIPBIENDES');

   If length(dbeTipoBien.Text) = 0 Then
   Begin
      ShowMessage('Falta Tipo Bien');
      dblcTipoBien.SetFocus;
   End;
End;

Procedure TFMaesClie.dbeMiembroExit(Sender: TObject);
Begin
   If Z2bbtnCancel2.Focused Then Exit;

   If length(dbeMiembro.Text) = 0 Then
   Begin
      ShowMessage('Falta Miembro');
      dbeMiembro.SetFocus;
   End;
End;

Procedure TFMaesClie.dbeBienExit(Sender: TObject);
Begin
   If Z2bbtnCancel3.Focused Then Exit;

   If length(dbeBien.Text) = 0 Then
   Begin
      ShowMessage('Falta Bien');
      dbeBien.SetFocus;
   End;
End;

Procedure TFMaesClie.dbeClieExit(Sender: TObject);
Begin
   If Z2bbtnCancel.Focused Then Exit;
   If length(dbeClie.Text) = 0 Then
   Begin
      dbeClie.SetFocus;
      Raise Exception.Create(' Falta Código del Cliente ');
   End;

   If dbeClie.text = DMFAC.BuscaQry('dspUltTGE', 'TGE204', 'CLIEID', 'CLIEID=' + QuotedStr(dbeClie.text) + ' AND CIAID=' + QuotedStr(dblcCia.text), 'CLIEID') Then
   Begin
      dbeClie.SetFocus;
      Raise Exception.Create('Cliente ya existe');
   End;
   //INICIO HPC_201210_FAC
   //if (DMCXC.wModo='A') and (sPerNat<>'S') then
   //DMCXC.cdsClie.FieldByName('CLIERUC').AsString:=dbeClie.text;
   //FIN HPC_201210_FAC
End;

Procedure TFMaesClie.dblcClAuxExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Z2bbtnCancel.Focused Then Exit;
   xWhere := 'ClAuxId=''' + dblcClAux.Text + ''' and MODULO LIKE ''%' + DMFAC.wModulo + '%''';
   dbeClAux.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE102', '*', xWhere, 'CLAUXABR');
   If length(dbeClAux.Text) = 0 Then
   Begin
      ShowMessage('Falta Clase de Auxiliar');
      //dbeClAux.SetFocus;
   End;
End;

Procedure TFMaesClie.dblcTipPerExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Length(dblcTipPer.Text) = 0 Then Exit;
   xWhere := 'TIPPERID=''' + dblcTipPer.Text + '''';
   dbeTipPer.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE109', '*', xWhere, 'TIPPERDES');
   sPerNat := DMFAC.cdsQry.FieldByName('TIPPERS').AsString;
   If Length(dbeTipPer.Text) = 0 Then
   Begin
      ShowMessage('Código de Tipo de Persona No Existe');
      dblcTipPer.Text := '';
      //dblcTipPer.SetFocus;
   End;
   //INICIO HPC_201210_FAC
   If DMFAC.wModo = 'A' Then
   Begin
      {If dblcTipPer.Text = '00' Then
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
      DMFAC.cdsClie.FieldByName('CLAUXID').AsString := 'C';
      dblcClAuxExit(dblcClAux);
      fg_DefaultCampos(dblcTipPer.Text);
   End
   Else
      If DMFAC.wModo = 'M' Then
      Begin
         fg_DefaultCampos(dblcTipPer.Text);
      End;
   fg_HabilitaTipoPersona(dblcTipPer.Text);
   //FIN HPC_201210_FAC
End;

Procedure TFMaesClie.dblcGiroExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Length(dblcGiro.Text) = 0 Then Exit;
   xWhere := 'GIROID=''' + dblcGiro.Text + '''';
   dbeGiro.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE116', '*', xWhere, 'GIRODES');
   If Length(dbeGiro.Text) = 0 Then
   Begin
      ShowMessage('Código de Giro de Empresa No Existe');
      dblcGiro.Text := '';
      dblcGiro.SetFocus;
   End;
End;

Procedure TFMaesClie.dblcClasifExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Length(dblcClasif.Text) = 0 Then Exit;
   xWhere := 'CLASIFID=''' + dblcClasif.Text + '''';
   dbeClasif.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE132', '*', xWhere, 'CLASIFDES');
   If Length(dbeClasif.Text) = 0 Then
   Begin
      ShowMessage('Código de Clasificación No Existe');
      dblcClasif.Text := '';
      dblcClasif.SetFocus;
   End;
End;

Procedure TFMaesClie.dblcVinculoExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Length(dblcVinculo.Text) = 0 Then Exit;
   xWhere := 'VINCID=''' + dblcVinculo.Text + '''';
   dbeVinculo.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE133', '*', xWhere, 'VINCDES');
   If Length(dbeVinculo.Text) = 0 Then
   Begin
      ShowMessage('Código de Relación con la Empresa No Existe');
      dblcVinculo.Text := '';
      dblcVinculo.SetFocus;
   End;
End;

Procedure TFMaesClie.dblcConPagoExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Length(dblcConPago.Text) = 0 Then Exit;
   xWhere := 'CONDPID=''' + dblcConPago.Text + '''';
   dbeCondPago.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE166', '*', xWhere, 'CONDPDES');
   If Length(dbeCondPago.Text) = 0 Then
   Begin
      ShowMessage('Código de Condición de Pago No Existe');
      dblcConPago.Text := '';
      dblcConPago.SetFocus;
   End;
End;

Procedure TFMaesClie.dbgMiembrosKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg('¿Esta Seguro de Eliminar Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMFAC.cdsMiemEmpre.Delete;

         DMFAC.AplicaDatos(DMFAC.cdsMiemEmpre, 'MIEMEMPRE');
      End;
   End;
End;

Procedure TFMaesClie.dbgBienesKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg('¿Esta Seguro de Eliminar Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMFAC.cdsBienes.Delete;

         DMFAC.AplicaDatos(DMFAC.cdsBienes, 'MIEMEMPRE');
      End;
   End;
End;

Procedure TFMaesClie.dblcCiaExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Length(dblcCia.Text) = 0 Then Exit;

   xWhere := 'CIAID=''' + dblcCia.Text + '''';
   dbeCia.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE101', '*', xWhere, 'CIADES');
   If Length(dbeCia.Text) = 0 Then
   Begin
      ShowMessage('Compañía No Existe');
      dblcCia.Text := '';
      //dblcCia.SetFocus;
   End;
End;

Procedure TFMaesClie.dblcPaisExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If length(dblcPais.Text) = 0 Then exit;
   xWhere := 'PAISID = ' + '''' + dblcPais.Text + '''';
   dbePais.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE118', '*', xWhere, 'PAISDES');
   If Length(dbePais.Text) = 0 Then
   Begin
      ShowMessage('Código de País No Existe');
      dblcPais.Text := '';
      dblcPais.SetFocus;
      exit;
   End;

   If DMFAC.cdsQry.FieldByName('FNACIONAL').AsString <> 'S' Then
   Begin
      dblcDeparta.Enabled := False;
      dblcdProvinc.Enabled := False;
      dblcdDistrito.Enabled := False;
      DMFAC.cdsClie.FieldByName('DPTOID').AsString := '';
      DMFAC.cdsClie.FieldByName('CIUDID').AsString := '';
      DMFAC.cdsClie.FieldByName('CLIECZIP').AsString := '';
      dbeDeparta.Text := '';
      dbeProvinc.Text := '';
      dbeDistrito.Text := '';
   End
   Else
   Begin
      dblcDeparta.Enabled := True;
      dblcdProvinc.Enabled := True;
      dblcdDistrito.Enabled := True;
   End;
End;

Procedure TFMaesClie.dblcDepartaExit(Sender: TObject);
Begin
   If length(dblcDeparta.Text) = 0 Then exit;

   DMFAC.cdsDpto.SetKey;
   DMFAC.cdsDpto.FieldByName('DPTOID').AsString := dblcDeparta.Text;
   If Not DMFAC.cdsDpto.GotoKey Then
   Begin
      ShowMessage('Código de Departamento No Existe');
      dblcDeparta.Text := '';
      dblcDeparta.SetFocus;
      exit;
   End;
   dbeDeparta.Text := DMFAC.cdsDpto.FieldByName('DPTODES').AsString;
   DMFAC.cdsProvinc.Filter := 'DPTOID=' + quotedstr(dblcDeparta.Text);
   DMFAC.cdsProvinc.Filtered := True;
   DMFAC.cdsProvinc.First;
End;

Procedure TFMaesClie.dblcVendeExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If length(dblcVende.Text) = 0 Then exit;
   xWhere := 'VEID = ' + '''' + dblcVende.Text + '''';
   dbeVende.Text := DMFAC.BuscaQry('dspUltTGE', 'CXC203', '*', xWhere, 'VENOMBRES');
   If Length(dbeVende.Text) = 0 Then
   Begin
      ShowMessage('Código de Vendedor No Existe');
      dblcVende.Text := '';
      dblcVende.SetFocus;
   End;
End;

Procedure TFMaesClie.dblcSecEcoExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If length(dblcSecEco.Text) = 0 Then exit;
   xWhere := 'SECECOID = ' + '''' + dblcSecEco.Text + '''';
   dbeSecEco.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE163', '*', xWhere, 'SECECODES');
   If Length(dbeSecEco.Text) = 0 Then
   Begin
      ShowMessage('Código de Sector Económico No Existe');
      dblcSecEco.Text := '';
      dblcSecEco.SetFocus;
   End;
End;

Procedure TFMaesClie.Z2bbtnNuevoClick(Sender: TObject);
Begin
   Filtracds(DMFAC.cdsClie, 'Select * from TGE204 Where CLIEID=''''');
   RegistroNuevo;
   Z2bbtnNuevo.Enabled := False;
End;

Procedure TFMaesClie.LimpiaEdits;
Begin
   dbeCia.Text := '';
   dbePais.Text := '';
   dbeDeparta.Text := '';
   dbeProvinc.Text := '';
   dbeDistrito.Text := '';
   dbeVende.Text := '';
   dbeCondPago.Text := '';
   dbeTipPer.Text := '';
   dbeGiro.Text := '';
   dbeClasif.Text := '';
   dbeVinculo.Text := '';
   dbeSecEco.Text := '';
   dbeCIUU.Text := '';
   dbeComentario.text := '';
End;

Procedure TFMaesClie.dblcMonedaExit(Sender: TObject);
Begin
   edtMoneda.Text := DMFAC.DisplayDescrip('TGE103', 'TMONABR', 'TMONID', dblcMoneda.text);
End;

Procedure TFMaesClie.dblcLPrecioExit(Sender: TObject);
Begin
   edtLPrecio.Text := DMFAC.DisplayDescrip('FAC101', 'TLISTADES', 'TLISTAID', dblcLPrecio.text);
End;

Procedure TFMaesClie.dblcSecVtaExit(Sender: TObject);
Begin
   If Z2bbtnCancel.focused Then exit;
//  if (Sender as TWincontrol).TabOrder>ActiveControl.TabOrder then Exit;

   edtSecNta.Text := DMFAC.DisplayDescrip('FAC105', 'TVTADES', 'TVTAID', dblcSecVta.text);
   If Length(edtSecNta.text) = 0 Then
   Begin
      ShowMessage('Sector Comercial No existe');
      dblcSecVta.Text := '';
      dblcSecVta.SetFocus;
   End;
   DMFAC.cdsZona1.Filter := 'TVTAID=' + QuotedStr(dblcSecVta.Text);
   DMFAC.cdsZona1.Filtered := True;
End;

Procedure TFMaesClie.dbeRazSocExit(Sender: TObject);
Begin
   dbeGirador.Text := dbeRazSoc.Text;
   DMFAC.cdsClie.FieldByName('CLIEGIRA').AsString := dbeRazSoc.Text;
End;

Procedure TFMaesClie.ibInsertaLineaCreditoClick(Sender: TObject);
Begin
   If (DMFAC.wModo = 'A') And (length(dbeClie.Text) = 0) Then
      Raise Exception.Create(' Cliente no Registrado ');

   pnlCab.Enabled := False;
   pnlPie.Enabled := False;
   pnlLineaCredito.Visible := True;
   dbgLineaCredito.Enabled := False;
   edtTMonId.Clear;
   DMFAC.cdsLineaCredito.Insert;
   DMFAC.cdsLineaCredito.FieldByName('CIAID').AsString := dblcCia.Text;
   DMFAC.cdsLineaCredito.FieldByName('CLIEID').AsString := dbeClie.Text;
   dblcTMonid.SetFocus;

End;

Procedure TFMaesClie.Z2bbtnOKLCClick(Sender: TObject);
Var
   xWhere, xMiembro: String;
Begin
  //BUSCAR SI FECHA YA FUE REGISTRADA.
   If DMFAC.cdsLineaCredito.FieldByName('ULTFECHA').AsDateTime <= 0 Then
   Begin
      dbdtpUltFecha.SetFocus;
      Raise Exception.Create('Ingrese Fecha');
   End;

   If DMFAC.cdsLineaCredito.FieldByName('CLIECREMAX').AsFloat < 0 Then
   Begin
      dbeLineaCreditoMax.SetFocus;
      Raise Exception.Create('Ingrese Monto Máximo');
   End;

   If (DMFAC.cdsLineaCredito.FieldByName('CLIECREMIN').AsFloat > DMFAC.cdsLineaCredito.FieldByName('CLIECREMIN').AsFloat) Or
      (DMFAC.cdsLineaCredito.FieldByName('CLIECREMIN').AsFloat < 0) Then
   Begin
      dbeLineaCreditoMin.SetFocus;
      Raise Exception.Create('Ingrese Monto Mínimo');
   End;

   If DMFAC.cdsLineaCredito.state = dsInsert Then
   Begin
      If ExisteDuplicado Then
         Raise Exception.Create(' Cliente ya tiene un registro para este mes');
   End;

   Screen.Cursor := crHourGlass;
   DMFAC.cdsLineaCredito.FieldByName('FREG').AsDateTime := DMFAC.DateS;
   DMFAC.cdsLineaCredito.FieldByName('HREG').AsDateTime := Time;
   DMFAC.cdsLineaCredito.FieldByName('USERID').AsString := DMFAC.wUsuario;

   DMFAC.cdsPost(DMFAC.cdsLineaCredito);

   DMFAC.cdsLineaCredito.Last;
   If DMFAC.cdsClie.State = dsBrowse Then
      DMFAC.cdsClie.Edit;
   DMFAC.cdsClie.FieldByName('CLIECREMAX').AsFloat := DMFAC.cdsLineaCredito.FieldByName('CLIECREMAX').AsFloat;
   DMFAC.cdsClie.FieldByName('CLIECREMIN').AsFloat := DMFAC.cdsLineaCredito.FieldByName('CLIECREMIN').AsFloat;
   DMFAC.cdsClie.FieldByName('TMONID').AsString := DMFAC.cdsLineaCredito.FieldByName('TMONID').AsString;

   Regresa4;
   dblcMonedaExit(Nil);
   Screen.Cursor := crDefault;

End;

Procedure TFMaesClie.Z2bbtnCancelLCClick(Sender: TObject);
Begin
   If DMFAC.cdsLineaCredito.State = dsInsert Then
      DMFAC.cdsLineaCredito.Delete;
   Regresa4;
End;

Procedure TFMaesClie.Regresa4;
Begin
   pnlCab.Enabled := True;
   pnlPie.Enabled := True;
   dbgLineaCredito.Enabled := True;
   pnlLineaCredito.Visible := False;
End;

Procedure TFMaesClie.dbgLineaCreditoDblClick(Sender: TObject);
Begin
   If DMFAC.cdsLineaCredito.RecordCount = 0 Then Exit;

   pnlLineaCredito.Visible := True;
   dbgLineaCredito.Enabled := False;

   DMFAC.cdsLineaCredito.Edit;
   If DMFAC.cdsLineaCredito.state = dsEdit Then
      dbdtpUltFecha.enabled := False
   Else
      dbdtpUltFecha.enabled := True;

   dblcTMonidExit(Sender);
   dbeLineaCreditoMax.SetFocus;
End;

Procedure TFMaesClie.dbgLineaCreditoKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg('¿Esta Seguro de Eliminar Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMFAC.cdsLineaCredito.Delete;
      End;
   End;
End;

Procedure TFMaesClie.dbdtpUltFechaEnter(Sender: TObject);
Begin
   If DMFAC.cdsLineaCredito.state = dsInsert Then
      DMFAC.cdsLineaCredito.FieldByName('ULTFECHA').AsDateTime := DMFAC.DateS;
End;

Procedure TFMaesClie.NotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFMaesClie.dblcTMonidExit(Sender: TObject);
Begin
   If Z2bbtnCancelLC.focused Then exit;
   If dblcTMonid.text = '' Then
   Begin
      dblcTmonId.SetFocus;
      Raise Exception.Create('Ingrese Moneda');
   End;

   edtTmonid.text := DMFAC.cdsTMon.FieldByName('TMONABR').AsString;
End;

Function TFMaesClie.ExisteDuplicado: Boolean;
Var
   cdsLC: TwwClientDataSet;
   Y1, M1, D: Word;
   Y2, M2: Word;
   flag: boolean;
Begin
   flag := False;
   decodedate(DMFAC.cdsLineaCredito.FieldByName('ULTFECHA').AsDateTime, Y1, M1, D);

   cdsLC := TwwClientDataSet.create(self);
   cdsLC.CloneCursor(DMFAC.cdsLineaCredito, False);
   cdsLC.First;
   While Not cdsLC.EOF Do
   Begin
      DecodeDate(cdsLC.FieldByName('ULTFECHA').AsDateTime, Y2, M2, D);
      If (Y2 = Y1) And (M2 = M1) Then
      Begin
         flag := True;
         cdsLC.Last;
      End;
      cdsLC.Next;
   End;
   result := Flag;
End;

Procedure TFMaesClie.dblcdDistritoExit(Sender: TObject);
Begin
   If length(dblcdDistrito.Text) = 0 Then exit;

   DMFAC.cdsDistrito.SetKey;
   DMFAC.cdsDistrito.FieldByName('ZIPID').AsString := dblcdDistrito.Text;
   If Not DMFAC.cdsDistrito.GotoKey Then
   Begin
      ShowMessage('Código de Distrito No Existe');
      dblcdDistrito.Text := '';
      dblcdDistrito.SetFocus;
      exit;
   End;
   dbeDistrito.Text := DMFAC.cdsDistrito.FieldByName('ZIPDES').AsString;

End;

Procedure TFMaesClie.dblcdProvincExit(Sender: TObject);
Begin
   If length(dblcdProvinc.Text) = 0 Then exit;

   DMFAC.cdsProvinc.SetKey;
   DMFAC.cdsProvinc.FieldByName('CIUDID').AsString := dblcdProvinc.Text;
   If Not DMFAC.cdsProvinc.GotoKey Then
   Begin
      ShowMessage('Código de Provincia No Existe');
      dblcdProvinc.Text := '';
      dblcdProvinc.SetFocus;
      exit;
   End;
   dbeProvinc.Text := DMFAC.cdsProvinc.FieldByName('CIUDDES').AsString;

   DMFAC.cdsDistrito.Filter := 'DPTOID=' + quotedstr(dblcDeparta.Text)
      + ' and CIUDID=' + quotedstr(dblcdProvinc.Text);
   DMFAC.cdsDistrito.Filtered := True;
   DMFAC.cdsDistrito.First;
End;

Function TFMaesClie.ValidaCliente: Boolean;
Begin
   xErrorValida := False;
   If DMFAC.cdsClie.FieldByName('TIPPERID').AsString = '02' Then //Persona Jurídica
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
   If (DMFAC.cdsClie.FieldByName('TIPPERID').AsString = '03') Or
      (DMFAC.cdsClie.FieldByName('TIPPERID').AsString = '01') Then //NO domiciliados
   Begin
      If (Length(DMFAC.cdsClie.FieldByName('CLIEAPEPAT').AsString) = 0)
         Or (Length(DMFAC.cdsClie.FieldByName('CLIENOMBRE').AsString) = 0) Then
      Begin
         Screen.Cursor := crDefault;
         dblcTDocIdentidad.SetFocus;
         xErrorValida := True;
       //Raise Exception.Create('Ingrese los datos del Nombre y Apellido Paterno');
         ShowMessage('Ingrese los datos del Nombre y Apellido Paterno');
         Result := False;
         Exit;
      End;
      If (DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString <> '04') And
         (DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString <> '07') And
         (DMFAC.cdsClie.FieldByName('TIPPERID').AsString = '03') Then
      Begin
         ShowMessage('Los No Domiciliados sólo pueden tener como tipo de documento :' + #13 +
            '04-Carnet de Extranjería' + #13 +
            '07-Pasaporte');
         Result := False;
         Exit;
      End;
   End;

   //FIN HPC_201210_FAC

   If DMFAC.cdsClie.FieldByName('CLIEID').AsString = '' Then
   Begin
      Screen.Cursor := crDefault;
      dbeClie.SetFocus;
      xErrorValida := True;
      //INICIO HPC_201210_FAC
    //Raise Exception.Create('Ingrese Código de Cliente');
      ShowMessage('Ingrese Código de Cliente');
      Result := False;
      Exit;
      //FIN HPC_201210_FAC
   End;

   If dblcTipPer.text = '' Then
   Begin
      Screen.Cursor := crDefault;
      dbeClie.SetFocus;
      xErrorValida := True;
      //INICIO HPC_201210_FAC
    //Raise Exception.Create('Ingrese Tipo de Persona');
      ShowMessage('Ingrese Tipo de Persona');
      Result := False;
      Exit;
      //FIN HPC_201210_FAC
   End;
   //INICIO HPC_201210_FAC
   //if (sPerNat<>'S') and (length(trim(dbeRazSoc.Text))=0) then
   If (DMFAC.cdsClie.FieldByName('TIPPERID').AsString = '02') And (length(trim(dbeRazSoc.Text)) = 0) Then
   //FIN HPC_201210_FAC
   Begin
      Screen.Cursor := crdefault;
      ShowMessage('Razón Social es obligatoria para una Persona Jurídica');
      dbeRazSoc.SetFocus;
      xErrorValida := True;
      Result := False;
      exit;
   End;
   //INICIO HPC_201210_FAC
   //if (sPerNat<>'S') and (length(trim(dbeRuc.Text))=0) then
   If (DMFAC.cdsClie.FieldByName('TIPPERID').AsString = '02') And (length(trim(dbeRuc.Text)) = 0) Then
   //FIN HPC_201210_FAC
   Begin
      Screen.Cursor := crdefault;
      ShowMessage('El RUC es obligatorio para una Persona Jurídica');
      dbeRazSoc.SetFocus;
      xErrorValida := True;
      Result := False;
      exit;
   End;

   If (sPerNat = 'S') And ((dbeDocIdentidad.text = '') And (dbeRuc.Text = '')) Then
   Begin
      Screen.Cursor := crDefault;
      pcMaestro.ActivePage := TabSheet1;
      dbeDocIdentidad.SetFocus;
      xErrorValida := True;
      //INICIO HPC_201210_FAC
    //Raise Exception.Create('Ingrese D.N.I o  R.U.C');
      ShowMessage('Ingrese D.N.I o  R.U.C');
      Result := False;
      Exit;
      //FIN HPC_201210_FAC
   End;

   If DMFAC.cdsClie.FieldByName('TVTAID').AsString = '' Then
   Begin
      If DMFAC.cdsZona.recordcount = 1 Then
      Begin
         DMFAC.cdsClie.FieldByName('TVTAID').AsString := DMFAC.cdsZona.FieldByName('TVTAID').AsString;
         edtSecNta.Text := DMFAC.DisplayDescrip('FAC105', 'TVTADES', 'TVTAID', dblcSecVta.text);
      End
      Else
      Begin
         pcMaestro.ActivePage := tsDireccion;
         Screen.Cursor := crDefault;
         dblcSecVta.SetFocus;
         xErrorValida := True;
        //INICIO HPC_201210_FAC
      //Raise Exception.Create('Ingrese Sector Comercial');
         ShowMessage('Ingrese Sector Comercial');
         Result := False;
         Exit;
        //FIN HPC_201210_FAC
      End;
   End;

   If DMFAC.cdsClie.FieldByName('ZONVTAID').AsString = '' Then
   Begin
      If DMFAC.cdsZona1.recordcount = 1 Then
      Begin
         DMFAC.cdsClie.FieldByName('ZONVTAID').AsString := DMFAC.cdsZona1.FieldByName('ZVTAID').AsString;
         edtZonNta.Text := DMFAC.DisplayDescrip('FAC106', 'ZVTADES', 'ZVTAID', dblcZonVta.text);
      End
      Else
      Begin
         pcMaestro.ActivePage := tsDireccion;
         Screen.Cursor := crDefault;
         dblcZonVta.SetFocus;
         xErrorValida := True;
        //INICIO HPC_201210_FAC
      //Raise Exception.Create('Ingrese Zona de Venta');
         ShowMessage('Ingrese Zona de Venta');
         Result := False;
         Exit;
        //FIN HPC_201210_FAC
      End;
   End;
   If DMFAC.cdsDireccion.RecordCount = 0 Then
   Begin
      If length(trim(DMFAC.cdsClie.FieldByName('CLIEDIR').AsString)) = 0 Then
      Begin
         pcMaestro.ActivePage := tsDireccion;
         Screen.Cursor := crDefault;
         xErrorValida := True;
        //INICIO HPC_201210_FAC
      //Raise Exception.Create('Ingrese Dirección del Cliente');
         ShowMessage('Ingrese Dirección del Cliente');
         Result := False;
         Exit;
        //FIN HPC_201210_FAC
      End;
      DMFAC.cdsDireccion.Insert;
      DMFAC.cdsDireccion.FieldByName('CIAID').AsString := dblcCia.Text;
      DMFAC.cdsDireccion.FieldByName('CLIEID').AsString := dbeClie.Text;
      DMFAC.cdsDireccion.FieldByName('CLIERUC').AsString := dbeRuc.Text;
      DMFAC.cdsDireccion.FieldByName('CLIEDIRID').AsString := '01'; // ojo: es el 1er correlativo, no es código duro
      DMFAC.cdsDireccion.FieldByName('CLIEDIRENT').AsString := DMFAC.cdsClie.FieldByName('CLIEDIR').AsString;
      DMFAC.cdsDireccion.FieldByName('ZIPID').AsString := DMFAC.cdsClie.FieldByName('CLIECZIP').AsString;
      DMFAC.cdsDireccion.FieldByName('ZVTAID').AsString := DMFAC.cdsClie.FieldByName('ZONVTAID').AsString;
//    pcMaestro.ActivePage:=tsDireccionEntrega;
//    Screen.Cursor:=crDefault;
//    Raise Exception.Create('Ingrese lugares de entrega');
   End;
   If (DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString = '') And (dblcTipPer.Text <> '00') Then
   Begin
      Screen.Cursor := crDefault;
      dblcTDocIdentidad.SetFocus;
      xErrorValida := True;
    //Raise Exception.Create('Ingrese el tipo de documento');
      ShowMessage('Ingrese el tipo de documento');
      Result := False;
      Exit;
   End;
   If (DMFAC.cdsClie.FieldByName('CLIEDNI').AsString = '') And (dblcTipPer.Text <> '00') Then
   Begin
      Screen.Cursor := crDefault;
      dblcTDocIdentidad.SetFocus;
      xErrorValida := True;
    //Raise Exception.Create('Ingrese el Nº de Documento');
      ShowMessage('Ingrese el Nº de Documento');
      Result := False;
      Exit;
   End;
   Result := True;
End;

Procedure TFMaesClie.ibLugarEntregaClick(Sender: TObject);
Begin
   If (DMFAC.wModo = 'A') And (length(dbeClie.Text) = 0) Then
      Raise Exception.Create(' Cliente no Registrado ');

   pnlCab.Enabled := False;
   pnlPie.Enabled := False;
   pnlLugarEntrega.Visible := True;
   dbgLugarEntrega.Enabled := False;

   edtDistritoLE.Clear;
   edtZonaLE.Clear;

   DMFAC.cdsDireccion.Insert;
   DMFAC.cdsDireccion.FieldByName('CIAID').AsString := dblcCia.Text;
   DMFAC.cdsDireccion.FieldByName('CLIEID').AsString := dbeClie.Text;
   DMFAC.cdsDireccion.FieldByName('CLIERUC').AsString := dbeRuc.Text;
   dbeIdDireccionEntrega.SetFocus;
End;

Procedure TFMaesClie.dblcdDistritoLEExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If length(dblcdDistritoLE.Text) = 0 Then
      exit;

   xWhere := 'ZIPID = ' + '''' + dblcdDistritoLE.Text + '''';
   edtDistritoLE.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE122', 'ZIPID,ZIPDES', xWhere, 'ZIPDES');
   If Length(edtDistritoLE.Text) = 0 Then
   Begin
      ShowMessage('Código de Distrito No Existe');
      dblcdDistritoLE.Text := '';
      dblcdDistritoLE.SetFocus;
   End;
End;

Procedure TFMaesClie.dbgLugarEntregaKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If DMFAC.cdsDireccion.RecordCount > 0 Then
         If MessageDlg('¿Esta Seguro de Eliminar Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            DMFAC.cdsDireccion.Delete;
         End;
   End;
End;

Procedure TFMaesClie.dbgLugarEntregaDblClick(Sender: TObject);
Begin
   If DMFAC.cdsDireccion.RecordCount = 0 Then Exit;

   pnlLugarEntrega.Visible := True;
   dbgLugarEntrega.Enabled := False;

   DMFAC.cdsDireccion.Edit;
   dblcdDistritoLEExit(Sender);
   dblcZonaLEExit(Sender);
   dbeIdDireccionEntrega.SetFocus;
End;

Procedure TFMaesClie.Z2bbtnOKLEClick(Sender: TObject);
Var
   xWhere, xMiembro: String;
Begin
   If dbeIdDireccionEntrega.text = '' Then
   Begin
      dbeIdDireccionEntrega.SetFocus;
      Raise Exception.Create('ID');
   End;

   If dbeDirecionEntrega.text = '' Then
   Begin
      dbeDirecionEntrega.SetFocus;
      Raise Exception.Create('Ingrese Lugar de Entrega');
   End;
   DMFAC.cdsDireccion.Post;

   Screen.Cursor := crHourGlass;

   Regresa5;
   Screen.Cursor := crDefault;

End;

Procedure TFMaesClie.Z2bbtnCancelLEClick(Sender: TObject);
Begin
   If DMFAC.cdsDireccion.State = dsInsert Then
      DMFAC.cdsDireccion.Delete;
   Regresa5;
End;

Procedure TFMaesClie.Regresa5;
Begin
   pnlCab.Enabled := True;
   pnlPie.Enabled := True;
   dbgLugarEntrega.Enabled := True;
   pnlLugarEntrega.Visible := False;
End;

Procedure TFMaesClie.dbeRucExit(Sender: TObject);
Begin
   If (sPerNat = 'N') And (dbeRuc.text = '') Then
   Begin
      dbeRuc.SetFocus;
      Raise Exception.Create('Persona Jurídica Exige RUC');
   End;

   If (length(trim(dbeRuc.text)) > 0) And (length(trim(dbeRuc.text)) <> 11) Then
   Begin
      ShowMessage('Longitud del RUC es incorrecta');
      dbeRuc.SetFocus;
      exit;
   End;

   If (trim(dbeRuc.text) <> '') Then
   Begin
      If (length(trim(dbeRuc.text)) <> 11) Then
      Begin
         ShowMessage('Longitud del RUC es incorrecta');
         dbeRuc.SetFocus;
         exit;
      End;
   End;

   If (dbeRuc.text <> '') Then
      If dbeRuc.text = DMFAC.BuscaQry('dspUltTGE', 'TGE204', 'CLIEID,CLIEDES,CLIERUC', 'CLIEID<>' + QuotedStr(dbeClie.text) + ' AND CLIERUC=' + QuotedStr(dbeRUC.text), 'CLIERUC') Then
      Begin
         dbeRuc.SetFocus;
         Raise Exception.Create('RUC asignado al Cliente: ' + DMFAC.cdsQry.FieldByName('CLIEID').AsString + ' ' + DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
      End;
   //INICIO HPC_201210_FAC
   DMFAC.cdsClie.FieldByName('CLIEDNI').AsString := dbeRuc.Text;
   //FIN HPC_201210_FAC
End;

Procedure TFMaesClie.dblcZonVtaExit(Sender: TObject);
Begin
   If Z2bbtnCancel.focused Then exit;
//  if (Sender as TWincontrol).TabOrder>ActiveControl.TabOrder then Exit;

   edtZonNta.Text := DMFAC.DisplayDescrip('FAC106', 'ZVTADES', 'ZVTAID', dblcZonVta.text);
   If Length(edtZonNta.text) = 0 Then
   Begin
      ShowMessage('Zona de Venta No existe');
      dblcZonVta.Text := '';
      dblcZonVta.SetFocus;
   End;
End;

Procedure TFMaesClie.dblcCIUUExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Length(dblcCIUU.Text) = 0 Then Exit;

   xWhere := 'CIUUID=''' + dblcCIUU.Text + '''';
   dbeCIUU.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE176', '*', xWhere, 'CIUUDES');
End;

Procedure TFMaesClie.dblcZonaLEExit(Sender: TObject);
Begin
   edtZonaLE.Text := DMFAC.DisplayDescrip('FAC106', 'ZVTADES', 'ZVTAID', dblcZonaLE.text);
   If Length(edtZonaLE.text) = 0 Then
   Begin
      ShowMessage('Zona de Venta No existe');
      dblcZonaLE.Text := '';
      dblcZonaLE.SetFocus;
   End;
End;

Procedure TFMaesClie.dblcSituacionExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Length(dblcSituacion.Text) = 0 Then Exit;
   xWhere := 'SITCLIEID=''' + dblcSituacion.Text + '''';
   dbeSitClie.Text := DMFAC.BuscaQry('dspUltTGE', 'CXC111', '*', xWhere, 'SITCLIEDES');
   If Length(dbeSitClie.Text) = 0 Then
   Begin
      ShowMessage('Situación No Existe');
      dblcSituacion.Text := '';
      dblcSituacion.SetFocus;
   End;
End;

Procedure TFMaesClie.ActualizaClieDes;
Var
   sSQL: String;
   i: integer;
   tablas: Array[1..18] Of String;
Begin

   tablas[1] := 'CXC309';
   tablas[2] := 'CXC310';
   tablas[3] := 'CXC317';
   tablas[4] := 'CXC319';
   tablas[5] := 'CXC321';
//INICIO HPC_201210_FAC
//tablas[6]:='CXC501';
//tablas[7]:='CXP310';
//tablas[8]:='CXP312';
//FIN HPC_201210_FAC
   tablas[6] := 'FAC301';
   tablas[7] := 'FAC303';
   tablas[8] := 'FAC305';
   tablas[9] := 'FAC309';
   tablas[10] := 'FAC311';
   tablas[11] := 'FAC401';
   tablas[12] := 'FAC503';
   tablas[13] := 'FAC505';
   tablas[14] := 'LOG314';
   tablas[15] := 'CXC301';

   For i := 1 To 15 Do
   Begin
      sSQL := ' UPDATE ' + tablas[i] + ' SET CLIEDES=' + QuotedStr(DMFAC.cdsClie.FieldByName('CLIEDES').AsString) + ' WHERE CIAID=' + QuotedStr(DMFAC.cdsClie.FieldByName('CIAID').AsString) + ' AND CLAUXID=' + QuotedStr(DMFAC.cdsClie.FieldByName('CLAUXID').AsString) + ' AND CLIEID=' + QuotedStr(DMFAC.cdsClie.FieldByName('CLIEID').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
   End;

End;

Procedure TFMaesClie.dbeNombresExit(Sender: TObject);
Begin
   If Length(dbeapepat.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := dbeapepat.text;
   If Length(dbeapemat.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(dbeapepat.text + ' ' + dbeapemat.text);
   If Length(dbeNombres.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(trim(dbeapepat.text + ' ' + dbeapemat.text) + ' ' + dbeNombres.text);
   If Length(dbesNombres.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(trim(trim(dbeapepat.text + ' ' + dbeapemat.text) + ' ' + dbeNombres.text)
         + ' ' + dbesNombres.text);
End;

Procedure TFMaesClie.dbesNombresExit(Sender: TObject);
Begin
   If Length(dbeapepat.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := dbeapepat.text;
   If Length(dbeapemat.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(dbeapepat.text + ' ' + dbeapemat.text);
   If Length(dbeNombres.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(trim(dbeapepat.text + ' ' + dbeapemat.text) + ' ' + dbeNombres.text);
   If Length(dbesNombres.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(trim(trim(dbeapepat.text + ' ' + dbeapemat.text) + ' ' + dbeNombres.text)
         + ' ' + dbesNombres.text);
End;

Procedure TFMaesClie.dbeapepatExit(Sender: TObject);
Begin
   If Length(dbeapepat.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := dbeapepat.text;
   If Length(dbeapemat.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(dbeapepat.text + ' ' + dbeapemat.text);
   If Length(dbeNombres.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(trim(dbeapepat.text + ' ' + dbeapemat.text) + ' ' + dbeNombres.text);
   If Length(dbesNombres.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(trim(trim(dbeapepat.text + ' ' + dbeapemat.text) + ' ' + dbeNombres.text)
         + ' ' + dbesNombres.text);
End;

Procedure TFMaesClie.dbeapematExit(Sender: TObject);
Begin
   If Length(dbeapepat.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := dbeapepat.text;
   If Length(dbeapemat.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(dbeapepat.text + ' ' + dbeapemat.text);
   If Length(dbeNombres.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(trim(dbeapepat.text + ' ' + dbeapemat.text) + ' ' + dbeNombres.text);
   If Length(dbesNombres.text) > 0 Then
      DMFAC.cdsClie.FieldByName('CLIEDES').AsString := trim(trim(trim(dbeapepat.text + ' ' + dbeapemat.text) + ' ' + dbeNombres.text)
         + ' ' + dbesNombres.text);
End;

Procedure TFMaesClie.FormShow(Sender: TObject);
Var
   xSQL: String;
   dsClieClone: TwwDataSource;
   cdsClieClone: TwwClientDataSet;
Begin
   DMFAC.AccesosUsuarios(DMFAC.wModulo, DMFAC.wUsuario, '2', Screen.ActiveForm.Name);
   //DMFAC.cdsNivel.IndexFieldNames:='Nivel';
   //INICIO HPC_201210_FAC
   Filtracds(DMFAC.cdsTDocSunat, 'SELECT * FROM SUNAT101 ');
   dblcTDocIdentidad.DataSource := DMFAC.dsClie;
   dblcTDocIdentidad.DataField := 'TDOC_ID_SUNAT';
   dblcTDocIdentidad.LookupTable := DMFAC.cdsTDocSunat;
   dblcTDocIdentidad.LookupField := 'TIPDOCID';

   dblcTDocIdentidad.Selected.Clear;
   dblcTDocIdentidad.Selected.Add('TIPDOCID'#9'3'#9'Id'#9'F');
   dblcTDocIdentidad.Selected.Add('TIPDOCDES'#9'20'#9'Descripción'#9'F');
   //FIN HPC_201210_FAC

   dsClieClone := TwwDataSource.create(self);
   cdsClieclone := TwwClientDataSet.create(self);
   cdsClieClone.CloneCursor(DMFAC.cdsClie, False);
   dblcdGrupo.LookupTable := cdsClieClone;
   dblcdGrupo.LookupField := 'GRUPOID';

   pcMaestro.ActivePageIndex := 0;
   Z2bbtnNuevo.Enabled := False;
   If DMFAC.wModo = 'A' Then
   Begin
      dblcDeparta.Enabled := True;
      dblcdProvinc.Enabled := True;
      dblcdDistrito.Enabled := True;
      LimpiaEdits;
      RegistroNuevo;
   End
   Else
   Begin
      wModif := 'S';
      DMFAC.cdsClie.Edit;
      LimpiaEdits;
      dblcCiaExit(Sender);
      dblcPaisExit(Sender);
      dblcDepartaExit(Sender);
      dblcdProvincExit(Sender);
      dblcdDistritoExit(Sender);
      dblcVendeExit(Sender);
      dblcConPagoExit(Sender);
      dblcTipPerExit(Sender);
      dblcGiroExit(Sender);
      dblcClasifExit(Sender);
      dblcVinculoExit(Sender);
      dblcSecEcoExit(Sender);
      dblcCIUUExit(Sender);
      dblcClAuxExit(Sender);
      dblcSecVtaExit(Sender);
      dblcZonVtaExit(Sender);
      dblcLPrecioExit(Sender);
      dblcSituacionExit(Sender);
      dblcClAux.Enabled := False;
      dbeClie.Enabled := False;
     //dbeRazSoc.SetFocus;

      xCliedes := DMFAC.cdsClie.FieldByName('CLIEDES').AsString;

      xSQL := 'Select * From CXC403 Where CLIEID=' + QuotedStr(dbeClie.Text) +
         ' AND CIAID=' + QuotedStr(dblcCia.text);
      DMFAC.cdsLineaCredito.Close;
      DMFAC.cdsLineaCredito.DataRequest(xSQL);
      DMFAC.cdsLineaCredito.Open;
      DMFAC.cdsLineaCredito.IndexFieldNames := 'CIAID;CLIEID;ULTFECHA';

      xSQL := 'Select * From FAC110 Where CLIEID=' + QuotedStr(dbeClie.Text) + ' AND CIAID=' + QuotedStr(dblcCia.text);
      DMFAC.cdsDireccion.Close;
      DMFAC.cdsDireccion.DataRequest(xSQL);
      DMFAC.cdsDireccion.Open;

      xSQL := 'Select * From TGE210 Where CLIEID=' + '''' + dbeClie.Text + '''';
      DMFAC.cdsMiemEmpre.Close;
      DMFAC.cdsMiemEmpre.DataRequest(xSQL);
      DMFAC.cdsMiemEmpre.Open;

      xSQL := 'Select * From TGE211 Where CLIEID=' + '''' + dbeClie.Text + '''';
      DMFAC.cdsBienes.Close;
      DMFAC.cdsBienes.DataRequest(xSQL);
      DMFAC.cdsBienes.Open;

      xSQL := 'Select * From TGE218 Where CLIEID=' + '''' + dbeClie.Text + '''';
      DMFAC.cdsClieComent.Close;
      DMFAC.cdsClieComent.DataRequest(xSQL);
      DMFAC.cdsClieComent.Open;
      dbeComentario.text := DMFAC.cdsClieComent.FieldByName('CLIECOMEN').AsString;
      DMFAC.cdsClieComent.Edit;
   End;
End;

Procedure TFMaesClie.FormCreate(Sender: TObject);
Begin
   DMFAC.FiltraTabla(DMFAC.cdsVende, 'CXC203', 'VeId');
   CargaDatasource;
End;

Procedure TFMaesClie.CargaDataSource;
Begin
   dbeTelef.DataSource := DMFAC.dsClie;
   dbeFax.DataSource := DMFAC.dsClie;
   dbeMail.DataSource := DMFAC.dsClie;
   dbeAbr.DataSource := DMFAC.dsClie;
   dbeDocIdentidad.DataSource := DMFAC.dsClie;
   dbeGirador.DataSource := DMFAC.dsClie;
   dbeRepres.DataSource := DMFAC.dsClie;
   dblcVinculo.DataSource := DMFAC.dsClie;
   dblcGiro.DataSource := DMFAC.dsClie;
   dblcClasif.DataSource := DMFAC.dsClie;
   dblcSituacion.DataSource := DMFAC.dsClie;
   dbeNombres.DataSource := DMFAC.dsClie;
   dbesNombres.DataSource := DMFAC.dsClie;
   dbeapepat.DataSource := DMFAC.dsClie;
   dbeapemat.DataSource := DMFAC.dsClie;
   dbeDirCom.DataSource := DMFAC.dsClie;
   dbeDirLeg.DataSource := DMFAC.dsClie;
   dblcPais.DataSource := DMFAC.dsClie;
   dblcDeparta.DataSource := DMFAC.dsClie;
   dblcSecVta.DataSource := DMFAC.dsClie;
   dblcdDistrito.DataSource := DMFAC.dsClie;
   dblcdProvinc.DataSource := DMFAC.dsClie;
   dblcZonVta.DataSource := DMFAC.dsClie;
   dblcVende.DataSource := DMFAC.dsClie;
   dbeContac.DataSource := DMFAC.dsClie;
   dblcConPago.DataSource := DMFAC.dsClie;
   dbeCapSoc.DataSource := DMFAC.dsClie;
   dblcSecEco.DataSource := DMFAC.dsClie;
   dbeGarantias.DataSource := DMFAC.dsClie;
   dblcCIUU.DataSource := DMFAC.dsClie;
   dbeAvalNomb.DataSource := DMFAC.dsClie;
   dbeAvalDir.DataSource := DMFAC.dsClie;
   dbeAvalDoc.DataSource := DMFAC.dsClie;
   dbeAvalTelf.DataSource := DMFAC.dsClie;

   cbActivo.DataSource := DMFAC.dsClie;

   dbgLineaCredito.DataSource := DMFAC.dsLineaCredito;
   dbeLineaCreditoMax.DataSource := DMFAC.dsLineaCredito;
   dbdtpUltFecha.DataSource := DMFAC.dsLineaCredito;
   dbeLineaCreditoMin.DataSource := DMFAC.dsLineaCredito;
   dblcTMonid.DataSource := DMFAC.dsLineaCredito;
   dblcMoneda.DataSource := DMFAC.dsClie;
   dbeCredMax.DataSource := DMFAC.dsClie;
   dbeCredMin.DataSource := DMFAC.dsClie;
   dblcLPrecio.DataSource := DMFAC.dsClie;
   dbgLugarEntrega.DataSource := DMFAC.dsDireccion;
   dbeIdDireccionEntrega.DataSource := DMFAC.dsDireccion;
   dbeDirecionEntrega.DataSource := DMFAC.dsDireccion;
   dblcdDistritoLE.DataSource := DMFAC.dsDireccion;
   dblcZonaLE.DataSource := DMFAC.dsDireccion;
   dbgMiembros.DataSource := DMFAC.dsMiemEmpre;
   dbeMiembro.DataSource := DMFAC.dsMiemEmpre;
   dbeNombre.DataSource := DMFAC.dsMiemEmpre;
   dblcOcupac.DataSource := DMFAC.dsMiemEmpre;
   dbeSueldo.DataSource := DMFAC.dsMiemEmpre;
   dbeDomicMiembro.DataSource := DMFAC.dsMiemEmpre;
   dbeTelfMiembro.DataSource := DMFAC.dsMiemEmpre;
   dbgBienes.DataSource := DMFAC.dsBienes;
   dbeBien.DataSource := DMFAC.dsBienes;
   dbeDescripcion.DataSource := DMFAC.dsBienes;
   dblcTipoBien.DataSource := DMFAC.dsBienes;
   dbeTipoBien.DataSource := DMFAC.dsBienes;
   dbeValorMiembro.DataSource := DMFAC.dsBienes;
   dbmDetalleBien.DataSource := DMFAC.dsBienes;
   dblcClAux.DataSource := DMFAC.dsClie;
   dblcClAux.LookupTable := DMFAC.cdsClAux;
   dbeClie.DataSource := DMFAC.dsClie;
   dblcTipPer.DataSource := DMFAC.dsClie;
   dblcCia.DataSource := DMFAC.dsClie;
   dbeRuc.DataSource := DMFAC.dsClie;
   dbeRazSoc.DataSource := DMFAC.dsClie;
   dblcdGrupo.DataSource := DMFAC.dsClie;
   dblcVinculo.LookupTable := DMFAC.cdsVinculo;
   dblcGiro.LookupTable := DMFAC.cdsGiro;
   dblcClasif.LookupTable := DMFAC.cdsClasif;
   dblcSituacion.LookupTable := DMFAC.cdsSitClie;
   dblcPais.LookupTable := DMFAC.cdsPais;
   dblcDeparta.LookupTable := DMFAC.cdsDpto;
   dblcSecVta.LookupTable := DMFAC.cdsZona;
   dblcdDistrito.LookupTable := DMFAC.cdsDistrito;
   dblcdProvinc.LookupTable := DMFAC.cdsProvinc;
   dblcZonVta.LookupTable := DMFAC.cdsZona1;
   dblcVende.LookupTable := DMFAC.cdsVende;
   dblcConPago.LookupTable := DMFAC.cdsCondP;
   dblcSecEco.LookupTable := DMFAC.cdsSecEco;
   dblcCIUU.LookupTable := DMFAC.cdsCIUU;
   dblcTMonid.LookupTable := DMFAC.cdsTMon;
   dblcMoneda.LookupTable := DMFAC.cdsTMon;
   dblcLPrecio.LookupTable := DMFAC.cdsTLista;
   dblcdDistritoLE.LookupTable := DMFAC.cdsDistrito;
   dblcZonaLE.LookupTable := DMFAC.cdsZona1;
   dblcOcupac.LookupTable := DMFAC.cdsCargos;
   dblcTipoBien.LookupTable := DMFAC.cdsTipBien;
   dblcTipPer.LookupTable := DMFAC.cdsTipPer;
   dblcCia.LookupTable := DMFAC.cdsCia;
End;

Procedure TFMaesClie.pcMaestroChanging(Sender: TObject;
   Var AllowChange: Boolean);
Begin
   AllowChange := True;
   If pnlLineaCredito.Visible Then
   Begin
      AllowChange := False;
      pcMaestro.ActivePageIndex := 3;
   End;

   If pnlLugarEntrega.Visible Then
   Begin
      AllowChange := False;
      pcMaestro.ActivePageIndex := 4;
   End;

   If (pnlMiembros.Visible) Or (pnlBienes.Visible) Then
   Begin
      AllowChange := False;
      pcMaestro.ActivePageIndex := 5;
   End;

End;

Procedure TFMaesClie.dbeDocIdentidadExit(Sender: TObject);
//INICIO HPC_201210_FAC
Var
   xsSql: String;
//FIN HPC_201210_FAC
Begin
   If (sPerNat = 'S') And (dbeDocIdentidad.text = '') Then
   Begin
      dbeDocIdentidad.SetFocus;
      ShowMessage('Persona Natural Exige Nº de Documento');
      Exit;
   End;

   //INICIO HPC_201210_FAC
   If fg_ValidaDocIdentidad(DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString) = False Then
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
   xsSql := 'CLIEID <> ' + QuotedStr(dbeClie.text) + ' AND CLIEDNI=' + QuotedStr(dbeDocIdentidad.text);
   //FIN HPC_201210_FAC
   If (dbeDocIdentidad.text <> '') Then
      //INICIO HPC_201210_FAC
      //if dbeDocIdentidad.text=DMCXC.BuscaQry('dspTGE','TGE204','CLIEID,CLIEDES,CLIEDNI','CLIEID<>'+QuotedStr(dbeClie.text)+' AND CLIEDNI='+QuotedStr(dbeDocIdentidad.text),'CLIEDNI') then
      If dbeDocIdentidad.text = DMFAC.BuscaQry('dspTGE', 'TGE204', 'CLIEID,CLIEDES,CLIEDNI', xsSql, 'CLIEDNI') Then
      //FIN HPC_201210_FAC
      Begin
         dbeDocIdentidad.SetFocus;
         ShowMessage('DNI fue asignado al Cliente: ' + DMFAC.cdsQry.FieldByName('CLIEID').AsString + ' ' + DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
         Exit;
      End;
End;
//INICIO HPC_201210_FAC

Function TFMaesClie.fg_ObtieneCodCliente: String;
Var
   {xsInicio :String;
   xnSecuencia :Double ;
   xsCodClienteNew :String;
   xsFinal :String;}
   xsSql: String;
Begin
// Inicio HPC_201302_FAC
   xsSql := 'Select F_C0D_CLIENTE from DUAL';
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

Procedure TFMaesClie.fg_HabilitaTipoPersona(wgTipoPersona: String);
Begin
   If (wgTipoPersona = '00') Then //Persona Natural
   Begin
      lblRuc.Enabled := False;
      lblRazonSocial.Enabled := False;
      lblGrupo.Enabled := False;
      lblNombreCorto.Enabled := False;

      dbeRuc.Enabled := TRUE;
      dbeRazSoc.Enabled := TRUE;
      dblcdGrupo.Enabled := False;
      dbeAbr.Enabled := False;
      dbeTelef.Enabled := True;
      dbeFax.Enabled := True;
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
      If (DMFAC.wModo = 'A') And (wgTipoPersona = '00') Then
      Begin
         dbeClie.Enabled := True;
      End;

   End
   Else
      If (wgTipoPersona = '01') Then //Persona Natural
      Begin
         lblRuc.Enabled := False;
         lblRazonSocial.Enabled := False;
         lblGrupo.Enabled := False;
         lblNombreCorto.Enabled := False;

         dbeRuc.Enabled := False;
         dbeRazSoc.Enabled := False;
         dblcdGrupo.Enabled := False;
         dbeAbr.Enabled := False;
         dbeTelef.Enabled := True;
         dbeFax.Enabled := True;
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
         If (DMFAC.wModo = 'A') And (wgTipoPersona = '00') Then
         Begin
            dbeClie.Enabled := True;
         End;

      End
      Else
         If (wgTipoPersona = '02') Then //Persona Juridica
         Begin
            lblRuc.Enabled := True;
            lblRazonSocial.Enabled := True;
            lblGrupo.Enabled := False;
            lblNombreCorto.Enabled := True;

            dbeRuc.Enabled := True;
            dbeRazSoc.Enabled := True;
            dblcdGrupo.Enabled := False;
            dbeAbr.Enabled := True;
            dbeTelef.Enabled := True;
            dbeFax.Enabled := True;
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
         Else
            If (wgTipoPersona = '03') Then //No domiciliado
            Begin
               lblRuc.Enabled := False;
               lblRazonSocial.Enabled := False;
               lblGrupo.Enabled := False;
               lblNombreCorto.Enabled := False;

               dbeRuc.Enabled := False;
               dbeRazSoc.Enabled := False;
               dblcdGrupo.Enabled := False;
               dbeAbr.Enabled := False;
               dbeTelef.Enabled := True;
               dbeFax.Enabled := True;
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

Procedure TFMaesClie.dblcTDocIdentidadExit(Sender: TObject);
Var
   xsSql: String;
Begin
   If Length(dblcTDocIdentidad.Text) = 0 Then Exit;
   xsSql := 'TIPDOCID=' + Quotedstr(dblcTDocIdentidad.Text);
   edtTDocIdentidad.Text := DMFAC.BuscaQry('dspTGE', 'SUNAT101', '*', xsSql, 'TIPDOCDES');
   dbeDocIdentidad.MaxLength := DMFAC.cdsQry.FieldByName('VALIDALONG').Value;

End;

Procedure TFMaesClie.fg_DefaultCampos(wgTipoPersona: String);
Begin
   DMFAC.cdsTDocSunat.Filter := '';
   DMFAC.cdsTDocSunat.Filtered := True;
   If wgTipoPersona = '01' Then //Persona Natural
   Begin
      DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString := '01';
      DMFAC.cdsClie.FieldByName('CLIERUC').AsString := '';
      dblcTDocIdentidadExit(dblcTDocIdentidad);
   End
   Else
      If wgTipoPersona = '02' Then //Persona Jurídica
      Begin
         DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString := '06';
         DMFAC.cdsClie.FieldByName('CLIEAPEPAT').AsString := '';
         DMFAC.cdsClie.FieldByName('CLIEAPEMAT').AsString := '';
         DMFAC.cdsClie.FieldByName('CLIENOMBRE').AsString := '';
         DMFAC.cdsClie.FieldByName('CLIENOMBRE1').AsString := '';
         dblcTDocIdentidadExit(dblcTDocIdentidad);
      End
      Else
         If wgTipoPersona = '03' Then //no domiciliada
         Begin
            DMFAC.cdsTDocSunat.Filter := 'TIPDOCID = ' + QuotedStr('04') + ' OR TIPDOCID = ' + QuotedStr('07');
            DMFAC.cdsTDocSunat.Filtered := True;
            DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString := '07';
            DMFAC.cdsClie.FieldByName('CLIERUC').AsString := '';
            dblcTDocIdentidadExit(dblcTDocIdentidad);
         End
         Else
            If wgTipoPersona = '00' Then //Otros
            Begin
               DMFAC.cdsClie.FieldByName('TDOC_ID_SUNAT').AsString := '00';
               DMFAC.cdsClie.FieldByName('CLIEAPEPAT').AsString := '';
               DMFAC.cdsClie.FieldByName('CLIEAPEMAT').AsString := '';
               DMFAC.cdsClie.FieldByName('CLIENOMBRE').AsString := '';
               DMFAC.cdsClie.FieldByName('CLIENOMBRE1').AsString := '';
               DMFAC.cdsClie.FieldByName('CLIERUC').AsString := '';
               DMFAC.cdsClie.FieldByName('CLIEDNI').AsString := '';
            End;
End;

Function TFMaesClie.fg_ValidaDocIdentidad(wgTipoDoc: String): Boolean;
Var
   xsSql: String;
   xnLongitudCampo: Integer;
   xsMensaje: String;
Begin
   xsSql := 'TIPDOCID=' + Quotedstr(wgTipoDoc);
   xnLongitudCampo := StrToInt(DMFAC.BuscaQry('dspTGE', 'SUNAT101', '*', xsSql, 'VALIDALONG'));

   xsMensaje := '';
   If (wgTipoDoc = '01') And (Length(DMFAC.cdsClie.FieldByName('CLIEDNI').AsString) <> xnLongitudCampo) Then
   Begin
      xsMensaje := 'El DNI debe tener ' + IntToStr(xnLongitudCampo) + ' dígitos';
   End;

   If (wgTipoDoc = '06') And (Length(DMFAC.cdsClie.FieldByName('CLIEDNI').AsString) <> xnLongitudCampo) Then
   Begin
      xsMensaje := 'El RUC debe tener ' + IntToStr(xnLongitudCampo) + ' dígitos';
   End;

   If Length(xsMensaje) > 0 Then
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

End.

