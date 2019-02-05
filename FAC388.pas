Unit FAC388;

// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Fac370
// FORMULARIO               : FFactSGuia
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Ventana de Facturación
//

// Actualizaciones:
// HPC_201306_FAC  Se cambia de código genérico de C9999 a 33333333.
// HPC_201406_FAC  Se trunca Dirección de Cliente a 100 caracteres
//
// HPC_201701_FAC 30/06/2017  Adecuaciones para facturación Electrónica

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, Mask, wwdbedit, Wwdbdlg,
   wwdblook, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mant, DB;

Type
   TFGenFactura = Class(TForm)
      Label36: TLabel;
      dblcTdoc: TwwDBLookupCombo;
      lblFCanje: TLabel;
      dtpFFac: TwwDBDateTimePicker;
      Label10: TLabel;
      dblcSerie: TwwDBLookupCombo;
      edtTDoc: TEdit;
      BitBtn1: TBitBtn;
      BitBtn2: TBitBtn;
      Bevel1: TBevel;
      dbeClientePago: TwwDBEdit;
      Label2: TLabel;
      lblTit1: TLabel;
      dbgDetalle: TwwDBGrid;
      Label1: TLabel;
      pnlCambia: TPanel;
      Label6: TLabel;
      dblcTClie: TwwDBLookupCombo;
      Label4: TLabel;
      dblcdClieRuc: TwwDBLookupComboDlg;
      EdtTClie: TEdit;
      edtDireccion: TwwDBEdit;
      Label23: TLabel;
      dblcdClie: TwwDBLookupComboDlg;
      lblTipoCliente: TLabel;
      Label5: TLabel;
      edtClie: TwwDBEdit;
      cbCambia: TCheckBox;
      dblcdAso: TwwDBEdit;
      btnExec: TButton;
      pnlDet: TPanel;
      cbDet: TCheckBox;
      Label3: TLabel;
      dbeDetrac: TwwDBEdit;
      Procedure FormCreate(Sender: TObject);
      Procedure dblcTdocExit(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dblcTClieExit(Sender: TObject);
      Procedure dblcdClieExit(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure cbCambiaClick(Sender: TObject);
      Procedure dblcdAsoExit(Sender: TObject);
      Procedure btnExecClick(Sender: TObject);
      Procedure cbDetClick(Sender: TObject);
   Private
    { Private declarations }
      cCia, cDoc, cSer: String;
   Public
    { Public declarations }
   End;

Var
   FGenFactura: TFGenFactura;

Implementation

{$R *.dfm}

Uses FacDM, FAC374, oaVe2000, Fac771, FAC392;

Procedure TFGenFactura.FormCreate(Sender: TObject);
Var
   xSQL: String;
   xWhere, xFiltro, xClauxId: String;
Begin
   xSQL := 'SELECT * FROM TGE110 WHERE DOCMOD =''CXC'' AND (DOCTIPREG=''F'' OR DOCTIPREG=''B'')';
   If Not DMFAC.cdsTDoc.Active Then
      Filtracds(DMFAC.cdsTDoc, xSQL);

   DMFAC.FiltraTabla(DMFAC.cdsTClie, 'FAC121', 'TCLIEID');

   dblcTdoc.LookupTable := DMFAC.cdsTDoc;
   dblcTClie.LookupTable := DMFAC.cdsTClie;
   dblcdClie.LookupTable := DMFAC.cdsClie;
   dblcSerie.LookupTable := DMFAC.cdsSerie;
   dbgDetalle.DataSource := DMFAC.dsQry10;

   xSQL := 'Select * from FAC206 Where USERID=''' + DMFAC.wUsuario + '''';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;

   cCia := DMFAC.cdsQry3.FieldByName('CIAID').AsString;
   cDoc := DMFAC.cdsQry3.FieldByName('DOCID').AsString;
   cSer := DMFAC.cdsQry3.FieldByName('FACSERIE').AsString;

   dblcTClie.Text := FCobroServicios.cTClie;
   dblcTClieExit(self);

End;

Procedure TFGenFactura.dblcTdocExit(Sender: TObject);
Var
   xx, cWhere: String;
Begin
   edtTDoc.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCDES', 'DOCID=' + QuotedStr(dblcTdoc.Text), 'DOCDES');

   xx := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCTIPREG', 'DOCMOD=''CXC'' AND DOCID=' + QuotedStr(dblcTdoc.Text), 'DOCTIPREG');

   cWhere := ' CIAID=' + QuotedStr(cCia) + ' AND FLAGV=' + QuotedStr(xx) + ' AND ACTIVIDAD=''S'' ';
   DMFAC.FiltraTabla(DMFAC.cdsSerie, 'FAC103', 'SERIEID', cWhere);

   dblcSerie.Text := cSer;
End;

Procedure TFGenFactura.FormActivate(Sender: TObject);
Var
   xSQL: String;
Begin

   dbeClientePago.Text := DMFAC.cdsQry9.FieldByName('NOMBRE').AsString;

   dblcTdocExit(self);

   xSQL := 'Select 0.00 IMPDET From DUAL';
   DMFAC.cdsQryDet.Close;
   DMFAC.cdsQryDet.DataRequest(xSQL);
   DMFAC.cdsQryDet.Open;

   xSQL := 'Select sum(A.IMPORTE) importe '
      + 'From CXC_ING_VAR_SER A, CAJA201 B '
      + 'WHERE DOCPAG=' + Quotedstr(DMFAC.cdsQry9.FieldByName('DOCPAG').AsString) + ' '
      + 'AND NUMDOCPAG=' + Quotedstr(DMFAC.cdsQry9.FieldByName('NUMDOCPAG').AsString) + ' '
      + 'AND NOMBRE=' + Quotedstr(DMFAC.cdsQry9.FieldByName('NOMBRE').AsString) + ' '
      + 'AND CLIEID=' + Quotedstr(DMFAC.cdsQry9.FieldByName('CLIEID').AsString) + ' '
      + 'AND A.CPTOID=B.CPTOID(+)';
   DMFAC.cdsQry10.Close;
   DMFAC.cdsQry10.DataRequest(xSQL);
   DMFAC.cdsQry10.Open;

   dbgDetalle.ColumnByName('IMPORTE').FooterValue := floattostrf(DMFAC.cdsQry10.FieldByName('IMPORTE').AsFloat, ffNumber, 10, 2);

   xSQL := 'Select A.CPTOID, B.CPTODES, A.TMONID, A.IMPORTE '
      + 'From CXC_ING_VAR_SER A, CAJA201 B '
      + 'WHERE DOCPAG=' + Quotedstr(DMFAC.cdsQry9.FieldByName('DOCPAG').AsString) + ' '
      + 'AND NUMDOCPAG=' + Quotedstr(DMFAC.cdsQry9.FieldByName('NUMDOCPAG').AsString) + ' '
      + 'AND NOMBRE=' + Quotedstr(DMFAC.cdsQry9.FieldByName('NOMBRE').AsString) + ' '
      + 'AND CLIEID=' + Quotedstr(DMFAC.cdsQry9.FieldByName('CLIEID').AsString) + ' '
      + 'AND A.CPTOID=B.CPTOID(+)';
   DMFAC.cdsQry10.Close;
   DMFAC.cdsQry10.DataRequest(xSQL);
   DMFAC.cdsQry10.Open;
End;

// Inicio HPC_201701_FAC
//        Redefine variable Global xTipCli

Procedure TFGenFactura.dblcTClieExit(Sender: TObject);
Var
   xWhere, xFiltro, xClauxId: String;
Begin
   xWhere := 'TCLIEID =' + '''' + dblcTClie.Text + '''';
   edtTClie.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'CLAUXID,TCLIEDES,TCLIEFLAG', xWhere, 'TCLIEDES');
   xClauxId := DMFAC.cdsQry.FieldByName('CLAUXID').AsString;
   DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;

// Si es Cliente
   If DMFAC.xTipCli = 'S' Then
   Begin
      dblcdClie.Visible := True;
      dblcdAso.Visible := False;
      btnExec.Visible := False;
      xFiltro := 'SELECT CLIEID, CLIEDES, CLIERUC, CLAUXID, TMONID, CLIECREMAX, CLIECREDISP, CLIECREUTI,'
         + 'ZONVTAID, VEID, SITCLIEID, DESCLIEID, CLIEDIR, CLIETELF, TIPPERID, CLIECOND, CLIEDNI '
         + 'FROM TGE204 WHERE CLAUXID=' + QuotedStr(xClauxId);
      DMFAC.cdsClie.Close;
      DMFAC.cdsClie.DataRequest(xFiltro);
      DMFAC.cdsClie.Open;
      DMFAC.cdsClie.IndexFieldNames := 'CLIEID';
   End
   Else
   Begin
      // si es Asociado
      dblcdClie.Visible := False;
      dblcdAso.Visible := True;
      btnExec.Visible := True;
   End;
End;
// Fin HPC_201701_FAC

Procedure TFGenFactura.dblcdClieExit(Sender: TObject);
Var
   xWhere: String;
Begin
// Inicio HPC_201306_FAC
//   if dblcdClie.Text<>'C9999' then
   If dblcdClie.Text <> '33333333' Then
// Fin HPC_201306_FAC
   Begin
      xWhere := 'CLAUXID=' + QuotedStr('C') + ' AND CLIEID =' + QuotedStr(dblcdClie.Text);
      edtClie.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE204', '*', xWhere, 'CLIEDES');
      edtDireccion.Text := DMFAC.cdsQry.FieldByName('CLIEDIR').AsString;
      dblcdClieRuc.Text := DMFAC.cdsQry.FieldByName('CLIERUC').AsString;
  // Inicio HPC_201306_FAC
      If DMFAC.cdsQry.FieldByName('TDOC_ID_SUNAT').AsString = '01' Then
         If length(DMFAC.cdsQry.FieldByName('CLIEDNI').AsString) > 0 Then
            dblcdClieRuc.Text := DMFAC.cdsQry.FieldByName('CLIEDNI').AsString
         Else
            dblcdClieRuc.Text := DMFAC.cdsQry.FieldByName('CLIERUC').AsString
      Else
         dblcdClieRuc.Text := DMFAC.cdsQry.FieldByName('CLIERUC').AsString;
  // Fin HPC_201306_FAC
   End;
End;

Procedure TFGenFactura.BitBtn1Click(Sender: TObject);
Var
   xSQL: String;
Begin
   If dblcSerie.Text = '' Then
   Begin
      ShowMessage('Debe Seleccionar Serie de la Factura');
      Exit;
   End;

   If dblcTdoc.Text = DMFAC.wsFact Then
   Begin
      If dblcdClieRuc.Text = '' Then
      Begin
         ShowMessage('Debe Seleccionar un Cliente que tenga R.U.C.');
         Exit;
      End;

      If Length(dblcdClieRuc.Text) <> 11 Then
      Begin
         ShowMessage('Error en la Longitud del R.U.C.');
         Exit;
      End;
   End;

   If dblcTClie.Text = '01' Then // Asociado
   Begin
      xSQL := 'ASOID=' + QuotedStr(dblcdAso.Text);
      DMFAC.BuscaQry('dspUltTGE', 'APO201', '*', xSQL, 'ASOID');
      If dblcdAso.Text <> DMFAC.cdsQry.FieldByName('ASOID').AsString Then
      Begin
         ShowMessage('Error : No existe Asociado');
         Exit;
      End;
   End
   Else
   Begin
      DMFAC.cdsClie.IndexFieldNames := 'CLIEID';
      DMFAC.cdsClie.SetKey;
      DMFAC.cdsClie.FieldbyName('CLIEID').AsString := dblcdClie.Text;
      If Not DMFAC.cdsClie.GotoKey Then
      Begin
         ShowMessage('Error : No existe Cliente');
         Exit;
      End;
   End;

   If MessageDlg(' ¿ Esta seguro(a) de Generar Factura ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      bFactura := True;
      Close;
   End;
End;

Procedure TFGenFactura.BitBtn2Click(Sender: TObject);
Begin
   Close;
End;

Procedure TFGenFactura.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFGenFactura.cbCambiaClick(Sender: TObject);
Begin
   If cbCambia.Checked Then
      pnlCambia.Enabled := True
   Else
      pnlCambia.Enabled := False;
End;

Procedure TFGenFactura.dblcdAsoExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'SELECT ASOID, ASOAPENOMDNI, ASODIR, ASODNI, ASORUC '
      + 'FROM APO201 WHERE ASOID=' + QuotedStr(dblcdAso.Text);
   DMFAC.cdsAsocia.Close;
   DMFAC.cdsAsocia.DataRequest(xSQL);
   DMFAC.cdsAsocia.Open;

   dblcdAso.Text := DMFAC.cdsAsocia.FieldByName('ASOID').AsString;
   edtclie.Text := Trim(DMFAC.cdsAsocia.FieldByName('ASOAPENOMDNI').AsString);

// Inicio HPC_201406_FAC
// toma sólo los 100 primeros caracteres de la Dirección
   edtDireccion.Text := copy(DMFAC.cdsAsocia.FieldByName('ASODIR').AsString, 1, 100);
   edtDireccion.Text := stringreplace(edtDireccion.Text, '''', '', [rfReplaceAll]);

// Fin HPC_201406_FAC

   If dblcTdoc.Text = DMFAC.wsBol Then
      dblcdClieRuc.Text := Trim(DMFAC.cdsAsocia.FieldByName('ASODNI').AsString)
   Else
      dblcdClieRuc.Text := Trim(DMFAC.cdsAsocia.FieldByName('ASORUC').AsString);
End;

Procedure TFGenFactura.btnExecClick(Sender: TObject);
Begin
   Try
      DMFAC.cdsAsocia.Close;
      FBuscaAsociado := TFBuscaAsociado.Create(Self);
      Try
         FBuscaAsociado.ShowModal;
      Except
      End;
   Finally
      FBuscaAsociado.Free;
   End;
End;

Procedure TFGenFactura.cbDetClick(Sender: TObject);
Begin

   If dbgDetalle.ColumnByName('IMPORTE').FooterValue = '' Then
   Begin
      ShowMessage('No se puede usar esta opción');
      Exit;
   End;

   If cbDet.Checked Then
   Begin
      pnlDet.Enabled := True;
      DMFAC.cdsQryDet.Edit;
      DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat := strtofloat(dbgDetalle.ColumnByName('IMPORTE').FooterValue) * 12 / 88;
      DMFAC.cdsQryDet.Post;
   End
   Else
   Begin
      pnlDet.Enabled := False;
      DMFAC.cdsQryDet.Edit;
      DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat := 0;
      DMFAC.cdsQryDet.Post
   End;

End;

End.

