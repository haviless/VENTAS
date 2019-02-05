Unit Fac377;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Fac379
// FORMULARIO               : FFormaPago
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Ventana de formas de pago
//

// Actualizaciones:
// HPC_201701_FAC 30/06/2017  Creación de Formulario-  Facturación Electrónica
// HPC_201801_FAC 21/03/2018  Retiro de componente dblcdClie
// HPC_201802_FAC 02/07/2018  Elimina posibles Formas de Pago anteriores
//                02/07/2018  Busca Número de Documento en archivo de Boletas y Facturas
// HPC_201804_FAC 05/07/2018  Controla retorno de error luego de generar las Cuentas por Cobrar
//                05/07/2018  Si hay errores en la ACEPTACION retorna Factura a Estado Anterior
// HPC_201805_FAC 08/08/2018  habilita panel de importe porque se pueden hacer pagos parciales con otras formas de pago
//                            Si cambia Forma de Pago puede salir de edición y validación del importe
//                            En acumulación de Totales, transfiere mensaje a rutina que envió a ejecutar AcumulaTotCabecera
//                            Mensaje de error al actualizar Maestro de Auxiliares Contables
//                15/08/2018  valida que forma de pago escogida tenga definición en Dinámicas Contables
//                15/08/2018  si se invoca al cambio de moneda en forma de pago se borrará la forma de pago y pondrá foco a Tipo de Moneda
//                16/08/2018  agrega 2 campos para controlar saldos en MN y ME
//  

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Buttons, Wwdbigrd, wwdbdatetimepicker, Wwdbdlg, StdCtrls, Grids,
   Wwdbgrid, Mask, wwdbedit, wwdblook, ExtCtrls, DB;

Type
   TFFormaPago = Class(TForm)
      pnlFPago: TPanel;
      pnlTodo: TPanel;
      dbgPago: TwwDBGrid;
      Panel3: TPanel;
      Label1: TLabel;
      dbeSaldo: TwwDBEdit;
      bbtnRegCanc: TBitBtn;
      bbtnOK: TBitBtn;
      bbtnCanc: TBitBtn;
      dbgAdicFPago: TwwIButton;
      pnlDoc: TPanel;
      lblDocFPago: TLabel;
      dblcTDocFPago: TwwDBLookupCombo;
      dbeDoc: TwwDBEdit;
      lblSerieFPago: TLabel;
      dbeSerieDP: TwwDBEdit;
      dbeOpe: TwwDBEdit;
      lblNumDocfPago: TLabel;
      lblFecFPago: TLabel;
      dtpFecOpe: TwwDBDateTimePicker;
      pnlTip: TPanel;
      lblFPago: TLabel;
      dblcFPago: TwwDBLookupCombo;
      edtFPago: TEdit;
      dblcDoc: TwwDBLookupComboDlg;
      lblBusca: TLabel;
      pnlImp: TPanel;
      lblTMonFPago: TLabel;
      dblcTMon: TwwDBLookupCombo;
      edtTMon: TEdit;
      lblImporteFPago: TLabel;
      dbeImp: TwwDBEdit;
      stTitulo: TStaticText;
   // Inicio FAC-201806
   // 16/10/2018 retira rutina que no se usa
      //btnGeneraCxC: TButton;
   // Fin FAC-201806
      pnlNFact: TPanel;
      gbGuia: TGroupBox;
      lblSerieGuia: TLabel;
      lblNumGuia: TLabel;
      dblcSerieGuia: TwwDBLookupCombo;
      dbeNumGuia: TwwDBEdit;
      gbNumFac: TGroupBox;
      lblSerie: TLabel;
      lblNumeroDoc: TLabel;
      dblcSerieConf: TwwDBLookupCombo;
      dbeNFacConf: TEdit;
      lblTipoMoneda: TLabel;
      edtMoneda: TEdit;
      lblImporte: TLabel;
      dbeMonto: TwwDBEdit;
      lblTipoDocumento: TLabel;
      edtTDoc: TEdit;
      lblFormaPagoGral: TLabel;
      Z2bbtnAcepta: TBitBtn;
      Procedure FormCreate(Sender: TObject);
      Procedure dbgAdicFPagoClick(Sender: TObject);
      Procedure bbtnCancClick(Sender: TObject);
      Procedure bbtnOKClick(Sender: TObject);
      Procedure dblcFPagoExit(Sender: TObject);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure dblcDocExit(Sender: TObject);
      Procedure dbgPagoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgPagoDblClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnRegCancClick(Sender: TObject);
      Procedure dblcTDocFPagoExit(Sender: TObject);
      Procedure dblcDocEnter(Sender: TObject);
      Procedure dblcFPagoEnter(Sender: TObject);
      Procedure dbeImpExit(Sender: TObject);
   // Inicio FAC-201806
   // 16/10/2018 retira rutina que no se usa
      //Procedure btnGeneraCxCClick(Sender: TObject);
   // Fin FAC_201806
      Procedure dblcFPagoChange(Sender: TObject);
      Procedure dbeImpChange(Sender: TObject);
      Procedure dbeNFacConfKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcSerieGuiaExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure Z2bbtnAceptaClick(Sender: TObject);
   Private
    { Private declarations }
      sConP: String;
      xsNumComprobante: String;
      Procedure FiltraPagos;
      Procedure SumarPagos;
   // Inicio FAC-201806
   // 16/10/2018 retira rutina que no se usa
      //Procedure fg_VerificaGeneraCxC;
      Function fg_EliminarCxC: Boolean;
   // Fin FAC-201806

   // Inicio HPC_201801_FAC
   // define nro documento de factura
      Procedure NuevoNroDoc;
   // Fin HPC_201801_FAC
   Public
    { Public declarations }
   End;

Var
   FFormaPago: TFFormaPago;

Implementation

{$R *.dfm}

Uses FacDM, FAC370, oaVE2000;

Procedure TFFormaPago.FormCreate(Sender: TObject);
Var
   sSQL: String;
Begin
   dblcFPago.DataSource := DMFAC.dsDetComision;
   dblcFPago.LookupTable := DMFAC.cdsCComer;

   dblcTMon.DataSource := DMFAC.dsDetComision;
   dblcTMon.LookupTable := DMFAC.cdsTMon;

   dblcTDocFPago.DataSource := DMFAC.dsDetComision;
   dblcTDocFPago.LookupTable := DMFAC.cdsTDoc;

   dbgPago.DataSource := DMFAC.dsDetComision;
   dbeImp.DataSource := DMFAC.dsDetComision;
   dbeSerieDP.DataSource := DMFAC.dsDetComision;
   dbeOpe.DataSource := DMFAC.dsDetComision;
   dtpFecOpe.DataSource := DMFAC.dsDetComision;
   dbeSaldo.DataSource := DMFAC.dsQry17;
End;

Procedure TFFormaPago.FiltraPagos;
Var
   sSQL: String;
Begin
   sSQL := 'Select A.CIAID, TIPPAG, DOCID, FACSERIE, NFAC, ITEM, FPAGOID, B.DCCOMDES, '
      + '          DOCPAG, SERDOCPAG, NUMDOCPAG, FECDOCPAG, TMONPAID, MTOPAGORI, '
      + '          MTODOCORI, MTODOCLOC, MTODOCEXT, BORRADO, USUARIO, FECREG '
      + '     from DB2ADMIN.FAC_FOR_PAG A, DB2ADMIN.TGE180 B '
      + '    Where A.CIAID=' + quotedstr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
      + '      and DOCID=' + quotedstr(DMFAC.cdsFact2.FieldByname('DOCID').AsString)
      + '      and FACSERIE=' + quotedstr(DMFAC.cdsFact2.FieldByname('FACSERIE').AsString)
      + '      and NFAC=' + quotedstr(DMFAC.cdsFact2.FieldByname('NFAC').AsString)
      + '      and nvl(BORRADO,''N'')=''N'' '
      + '      and A.CIAID=B.CIAID(+) AND A.FPAGOID=B.CCOMERID(+)';
   DMFAC.cdsDetComision.Close;
   DMFAC.cdsDetComision.dataRequest(sSQL);
   DMFAC.cdsDetComision.Open;

// Inicio HPC_201805_FAC
// 16/08/2018 agrega 2 campos para controlar saldos en MN y ME
   sSQL := 'Select 0.00 saldo, 0.00 SALDOMN, 0.00 SALDOME from DUAL';
   DMFAC.cdsQry17.Close;
   DMFAC.cdsQry17.dataRequest(sSQL);
   DMFAC.cdsQry17.Open;

   dbgPago.Selected.Clear;
   dbgPago.Selected.Add('FPAGOID'#9'02'#9'Id');
   dbgPago.Selected.Add('DCCOMDES'#9'16'#9'F.Pago');
   dbgPago.Selected.Add('DOCPAG'#9'02'#9'Dc');
   dbgPago.Selected.Add('SERDOCPAG'#9'03'#9'Serie');
   dbgPago.Selected.Add('NUMDOCPAG'#9'16'#9'Número');
   dbgPago.Selected.Add('FECDOCPAG'#9'10'#9'Fecha');
   dbgPago.Selected.Add('TMONPAID'#9'02'#9'TM');
   dbgPago.Selected.Add('MTOPAGORI'#9'09'#9'Importe');
   dbgPago.Selected.Add('MTODOCORI'#9'10'#9'Imp.Pago');
   dbgPago.RedrawGrid;

// Inicio FAC-201806
// 26/10/2018 cambia display de importes a 2 dígitos
   {
// Importes a 4 dígitos
   TNumericField(DMFAC.cdsFact2.FieldByName('FACTOTMO')).DisplayFormat := '###,###,##0.0000';
   TNumericField(DMFAC.cdsDetComision.FieldByName('MTODOCORI')).DisplayFormat := '###,###,##0.0000';
   TNumericField(DMFAC.cdsDetComision.FieldByName('MTODOCORI')).EditFormat := '########0.0000';
   TNumericField(DMFAC.cdsQry17.FieldByName('SALDO')).DisplayFormat := '###,###,##0.0000';
   TNumericField(DMFAC.cdsQry17.FieldByName('SALDO')).EditFormat := '########0.0000';
   }
   TNumericField(DMFAC.cdsFact2.FieldByName('FACTOTMO')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMFAC.cdsDetComision.FieldByName('MTODOCORI')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMFAC.cdsDetComision.FieldByName('MTODOCORI')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsQry17.FieldByName('SALDO')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMFAC.cdsQry17.FieldByName('SALDO')).EditFormat := '########0.00';
// Fin FAC-201806
// Fin HPC_201805_FAC

   SumarPagos;
// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
   {
   If (Abs(DMFAC.cdsQry17.FieldByname('SALDO').asFloat) <= 0.1) And (DMFAC.cdsFact2.FieldByname('CIAID').AsString = '16') Then
   Begin
      btnGeneraCxC.Visible := True;
   End
   Else
   Begin
      btnGeneraCxC.Visible := False;
   End;
   }
// Fin FAC-201806
End;

Procedure TFFormaPago.SumarPagos;
Var
   sSQL: String;
   dTotal: Double;
   dSaldo: Double;
// Inicio HPC_201805_FAC
// 16/08/2018 control de saldos en MN y ME
   dTotalMN, dTotalME : Double;
   dSaldoMN, dSaldoME : Double;
// Fin HPC_201805_FAC
Begin
   dTotal := 0;
// Inicio HPC_201805_FAC
// 16/08/2018 control de saldos en MN y ME
   DMFAC.cdsDetComision.First;
   While Not DMFAC.cdsDetComision.Eof Do
   Begin
      dTotal := dTotal + DMFAC.cdsDetComision.FieldByname('MTODOCORI').asFloat;
      dTotalMN := dTotalMN + DMFAC.cdsDetComision.FieldByname('MTODOCLOC').asFloat;
      dTotalME := dTotalME + DMFAC.cdsDetComision.FieldByname('MTODOCEXT').asFloat;
      DMFAC.cdsDetComision.Next;
   End;
   DMFAC.cdsDetComision.First;

   dbgPago.ColumnByName('MTOPAGORI').FooterValue := 'PAGADO';
// Inicio FAC-201806
// 26/10/2018 cambia display de importes a 2 dígitos
   {
   dbgPago.ColumnByName('MTODOCORI').FooterValue := FloattoStrF(dTotal, ffnumber, 15, 4);
   dSaldo := FRound(DMFAC.cdsFact2.FieldByname('FACTOTMO').AsFloat - dTotal, 10, 4);
   dSaldoMN := FRound(DMFAC.cdsFact2.FieldByname('FACTOTMN').AsFloat - dTotalMN, 15, 4);
   dSaldoME := FRound(DMFAC.cdsFact2.FieldByname('FACTOTME').AsFloat - dTotalME, 15, 4);
   }
   dbgPago.ColumnByName('MTODOCORI').FooterValue := FloattoStrF(dTotal, ffnumber, 15, 2);
   dSaldo := FRound(DMFAC.cdsFact2.FieldByname('FACTOTMO').AsFloat - dTotal, 10, 2);
   dSaldoMN := FRound(DMFAC.cdsFact2.FieldByname('FACTOTMN').AsFloat - dTotalMN, 15, 2);
   dSaldoME := FRound(DMFAC.cdsFact2.FieldByname('FACTOTME').AsFloat - dTotalME, 15, 2);
// Fin FAC-201806

   DMFAC.cdsQry17.Edit;
   DMFAC.cdsQry17.FieldByname('SALDO').asFloat := dSaldo;
   DMFAC.cdsQry17.FieldByname('SALDOMN').asFloat := dSaldoMN;
   DMFAC.cdsQry17.FieldByname('SALDOME').asFloat := dSaldoME;
// Fin HPC_201805_FAC
   DMFAC.cdsQry17.Post;
End;

Procedure TFFormaPago.dbgAdicFPagoClick(Sender: TObject);
Var
   dSaldo: Double;
Begin
// Inicio HPC_201804_FAC
// No permite añadir mas formas de pago si ya no hay saldo
   If Strtofloat(StringReplace(dbeSaldo.Text, ',', '', [rfReplaceAll]))=0 Then
   Begin
      ShowMessage('Ya no hay saldo para añadir mas Formas de Pago');
      Exit;
   End;
// Fin HPC_201804_FAC

   pnlFPago.Visible := true;
   dbeImp.Enabled := True;
   bbtnOK.Visible := true;
   pnlTip.Enabled := True;
   pnlTodo.Enabled := False;
   pnlImp.Enabled := False;
   pnlDoc.Enabled := False;
   DMFAC.cdsDetComision.Insert;
   DMFAC.cdsDetComision.FieldByName('TMONPAID').AsString := DMFAC.cdsFact2.FieldByname('TMONID').AsString;
   DMFAC.cdsDetComision.FieldByName('CIAID').AsString := DMFAC.cdsFact2.FieldByname('CIAID').AsString;
   DMFAC.cdsDetComision.FieldByName('DOCID').AsString := DMFAC.cdsFact2.FieldByname('DOCID').AsString;
   DMFAC.cdsDetComision.FieldByName('FACSERIE').AsString := DMFAC.cdsFact2.FieldByname('FACSERIE').AsString;
   DMFAC.cdsDetComision.FieldByName('NFAC').AsString := DMFAC.cdsFact2.FieldByname('NFAC').AsString;
   DMFAC.cdsDetComision.FieldByName('MTOPAGORI').AsFloat := DMFAC.cdsQry17.FieldByname('SALDO').AsFloat;
   edtFPago.text := '';
   edtTMon.text := '';
   dbeDoc.text := '';
   dblcFPago.SetFocus;
End;

Procedure TFFormaPago.bbtnCancClick(Sender: TObject);
Begin
   pnlFPago.Visible := False;
   pnlTodo.Enabled := True;
   FiltraPagos;
End;

Procedure TFFormaPago.bbtnOKClick(Sender: TObject);
Var
   xSQL: String;
   nReg: Integer;
   dImpMO, dImpMN, dImpME: Double;
// Inicio HPC_201805_FAC
// 16/08/2018 Compara Importe Pagodo vs Saldo en la misma Moneda del Documento de Venta
   dSaldo : Double;
// Fin HPC_201805_FAC
Begin
// Inicio HPC_201805_FAC
// 16/08/2018 Compara Importe Pagodo vs Saldo en la misma Moneda del Documento de Venta
// Diferencia entre saldo final ME vs Importe Equivalente
   {
   If Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) >
      StrToFloat(StringReplace(dbeSaldo.Text, ',', '', [rfReplaceAll])) Then
   Begin
      ShowMessage('Importe no debe ser mayor a ' + dbeSaldo.Text);
      bbtnOk.Enabled := False;
   End
   Else
   Begin
      bbtnOk.Enabled := True;

      If ((sConP = 'CR') Or (sConP = 'NC')) And (dbeOpe.TEXT = '') Then
      Begin
         ShowMessage('DEBE SELECCIONAR DOCUMENTO');
         Exit;
      End;

      If DMFAC.cdsFact2.FieldByName('TMONID').AsString = 'N' Then
      Begin
         If DMFAC.cdsFact2.FieldByName('TMONID').AsString = dblcTMon.Text Then
         Begin
            dImpMO := Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll]));
            dImpMN := Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll]));
            dImpME := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) / DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 2);
         End
         Else
         Begin
            dImpMO := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) * DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 2);
            dImpMN := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) * DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 2);
            dImpME := Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll]));
         End;
      End
      Else
      Begin
         If DMFAC.cdsFact2.FieldByName('TMONID').AsString = dblcTMon.Text Then
         Begin
            dImpMO := Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll]));
            dImpME := Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll]));
            dImpMN := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) * DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 2);
         End
         Else
         Begin
            dImpMO := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) / DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 2);
            dImpME := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) / DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 2);
            dImpMN := Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll]));
         End;
      End;

      If dImpMO > DMFAC.cdsQry17.FieldByname('SALDO').asFloat Then
      Begin
         ShowMessage('El Importe (' + trim(Floattostrf(dImpMO, ffnumber, 15, 2)) + ') es Mayor al Saldo del Documento (' + dbeSaldo.Text + '). Verificar...');
         If Not (sSupervisor = 'S') Then
            Exit;
      End;

      If dImpMO < 0 Then
      Begin
         ShowMessage('El Importe (' + trim(Floattostrf(dImpMO, ffnumber, 15, 2)) + ') es menor que 0. Verificar...');
         Exit;
      End;

      pnlFPago.Visible := False;
      pnlTodo.Enabled := True;

      nReg := DMFAC.cdsDetComision.RecordCount + 1;

      xSQL := 'insert into DB2ADMIN.FAC_FOR_PAG( CIAID, DOCID, FACSERIE, NFAC, ITEM, FPAGOID, '
         + '                         TIPPAG, DOCPAG, SERDOCPAG, NUMDOCPAG, TMONPAID, MTOPAGORI, FECDOCPAG, '
         + '                         MTODOCORI, MTODOCLOC, MTODOCEXT, BORRADO, USUARIO, FECREG ) '
         + 'values ( ' + quotedstr(DMFAC.cdsFact2.FieldByname('CIAID').AsString) + ', '
         + quotedstr(DMFAC.cdsDetComision.FieldByName('DOCID').AsString) + ', '
         + quotedstr(DMFAC.cdsDetComision.FieldByName('FACSERIE').AsString) + ', '
         + quotedstr(DMFAC.cdsDetComision.FieldByName('NFAC').AsString) + ', '
         + inttostr(nReg) + ', '
         + quotedstr(dblcFPago.Text) + ', '
         + quotedstr(sConP) + ', '
         + quotedstr(dblcTDocFPago.Text) + ', '
         + quotedstr(dbeSerieDP.Text) + ', '
         + quotedstr(dbeOpe.Text) + ', '
         + quotedstr(dblcTMon.Text) + ', '
         + StringReplace(dbeImp.Text, ',', '', [rfReplaceAll]) + ', '
         + quotedstr(dtpFecOpe.text) + ', '
         + Floattostr(dImpMO) + ', '
         + Floattostr(dImpMN) + ', '
         + Floattostr(dImpME) + ', '
         + ' ''N'', '
         + quotedstr(DMFAC.wUsuario) + ', '
         + '           Sysdate)';
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      FiltraPagos;
   End;
   }


   bbtnOk.Enabled := True;

   If ((sConP = 'CR') Or (sConP = 'NC')) And (dbeOpe.TEXT = '') Then
   Begin
      ShowMessage('DEBE SELECCIONAR DOCUMENTO');
      Exit;
   End;

// Inicio FAC-201806
// 26/10/2018 Importe a 2 decimales
   dSaldo := FRound(StrToFloat(StringReplace(dbeSaldo.Text, ',', '', [rfReplaceAll])),15,2);
// Fin FAC-201806

   If DMFAC.cdsFact2.FieldByName('TMONID').AsString = 'N' Then
   Begin
   // Si Documento de Venta es en Soles y se paga en Soles
      If DMFAC.cdsFact2.FieldByName('TMONID').AsString = dblcTMon.Text Then
      Begin
      // Inicio FAC-201806
      // 26/10/2018 Importe Equivalente en dólares

         dImpMO := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])),15,2);
         dImpMN := dImpMO;
         If dImpMN < dSaldo Then
         Begin
            dImpME := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) / DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 2);
         End
         Else
         Begin // Si se está cubriendo todo el Saldo
            dImpME := DMFAC.cdsQry17.FieldByname('SALDOME').asFloat;
         End;
         {
         dImpMO := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])),15,4);
         dImpMN := dImpMO;
         dImpME := FRound(dImpMO / DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 4);
         }
      // Fin FAC-201806
      End
      Else
   // Si Documento de Venta es en Soles y se paga en Dólares
      Begin
      // Inicio FAC-201806
      // 26/10/2018 Importe Equivalente en soles
         dImpMO := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) * DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 2);
         dImpMN := dImpMO;
         If dImpMO < dSaldo Then
         Begin
            dImpME := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])),15,2);
         End
         Else
         Begin // Si se está cubriendo todo el Saldo
            dImpME := DMFAC.cdsQry17.FieldByname('SALDOME').asFloat;
         End;

         {
         dImpMO := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) * DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 4);
         dImpMN := dImpMO;
         dImpME := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])),15,4);
         }
      // Fin FAC-201806
      End;

      If dImpMN > dSaldo Then
      Begin
         ShowMessage('Importe no debe ser mayor a ' + dbeSaldo.Text);
         dbeImp.Enabled := True;
         dbeImp.SetFocus;
         Exit;
      End;
   End
   Else
   Begin
   // Si Documento de Venta es en Dólares y se paga en Dólares
      If DMFAC.cdsFact2.FieldByName('TMONID').AsString = dblcTMon.Text Then
      Begin
      // Inicio FAC-201806
      // 26/10/2018 Importe Equivalente en soles

         dImpMO := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])),15,4);
         dImpME := dImpMO;
         If dImpMO < dSaldo Then
         Begin
            dImpMN := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) * DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 4);
         End
         Else
         Begin
            dImpMN := DMFAC.cdsQry17.FieldByname('SALDOMN').asFloat;
         End;
         {
         dImpMO := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])),15,4);
         dImpME := dImpMO;
         dImpMN := FRound(dImpMO * DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 4);
         }
      // Fin FAC-201806
      End
      Else
      Begin
      // Si Documento de Venta es en Dólares y se paga en Soles
      // Inicio FAC-201806
      // 26/10/2018 Importe Equivalente en soles

         dImpMO := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) / DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 4);
         dImpME := dImpMO;
         If dImpMO < dSaldo Then
         Begin
            dImpMN := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])),15,4);
         End
         Else
         Begin
            dImpMN := DMFAC.cdsQry17.FieldByname('SALDOMN').asFloat;
         End;
         {
         dImpMO := FRound(Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) / DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 4);
         dImpME := dImpMO;
         dImpMN := FRound(dImpMO * DMFAC.cdsFact2.FieldByname('FACTCAM').AsFloat, 15, 4);
         }
      // Fin FAC-201806
      End;

      If dImpME > dSaldo Then
      Begin
         ShowMessage('Importe no debe ser mayor a ' + dbeSaldo.Text);
         dbeImp.Enabled := True;
         dbeImp.SetFocus;
         Exit;
      End;

   End;

   If dImpMO > DMFAC.cdsQry17.FieldByname('SALDO').asFloat Then
   Begin
      ShowMessage('El Importe (' + trim(Floattostrf(dImpMO, ffnumber, 15, 4)) + ') es Mayor al Saldo del Documento (' + dbeSaldo.Text + '). Verificar...');
      If Not (sSupervisor = 'S') Then
         Exit;
   End;

   If dImpMO < 0 Then
   Begin
      ShowMessage('El Importe (' + trim(Floattostrf(dImpMO, ffnumber, 15, 4)) + ') es menor que 0. Verificar...');
      Exit;
   End;

   pnlFPago.Visible := False;
   pnlTodo.Enabled := True;

   nReg := DMFAC.cdsDetComision.RecordCount + 1;

   xSQL := 'insert into DB2ADMIN.FAC_FOR_PAG(CIAID, DOCID, FACSERIE, NFAC, ITEM, FPAGOID, '
      + '                                    TIPPAG, DOCPAG, SERDOCPAG, NUMDOCPAG, TMONPAID, MTOPAGORI, FECDOCPAG, '
      + '                                    MTODOCORI, MTODOCLOC, MTODOCEXT, BORRADO, USUARIO, FECREG ) '
      + '   values ( ' + quotedstr(DMFAC.cdsFact2.FieldByname('CIAID').AsString) + ', '
      +                  quotedstr(DMFAC.cdsDetComision.FieldByName('DOCID').AsString) + ', '
      +                  quotedstr(DMFAC.cdsDetComision.FieldByName('FACSERIE').AsString) + ', '
      +                  quotedstr(DMFAC.cdsDetComision.FieldByName('NFAC').AsString) + ', '
      +                  inttostr(nReg) + ', '
      +                  quotedstr(dblcFPago.Text) + ', '
      +                  quotedstr(sConP) + ', '
      +                  quotedstr(dblcTDocFPago.Text) + ', '
      +                  quotedstr(dbeSerieDP.Text) + ', '
      +                  quotedstr(dbeOpe.Text) + ', '
      +                  quotedstr(dblcTMon.Text) + ', '
      +                  Floattostr(dImpMO) + ', '
      +                  quotedstr(dtpFecOpe.text) + ', '
      +                  Floattostr(dImpMO) + ', '
      +                  Floattostr(dImpMN) + ', '
      +                  Floattostr(dImpME) + ', '
      +                  '''N'', '
      +                  quotedstr(DMFAC.wUsuario) + ', '
      +                  'Sysdate'
      + '           )';
   DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   FiltraPagos;
// Fin HPC_201805_FAC
End;

Procedure TFFormaPago.dblcFPagoExit(Sender: TObject);
Var
   xSQL: String;
Begin
   dbeImp.Enabled := True;
   bbtnOk.Enabled := True;
// Inicio HPC_201805_FAC
// 15/08/2018 si se invoca al cambio de moneda se borrará la forma de pago y saldrá de esgte evento
   {
   xSQL := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString) + ' AND CCOMERID =' + QuotedStr(dblcFPago.Text);
   DMFAC.BuscaQry('dspUltTGE', 'TGE180', 'DCCOMDES, DCCOMPORC, DCOMMTOMAX, CONDPID', xSQL, 'DCCOMDES');
   edtFPago.Text := DMFAC.cdsQry.FieldByName('DCCOMDES').AsString;
   }
   edtFPago.Text := '';
   If bbtnCanc.Focused Then Exit;

   xSQL := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString) + ' AND CCOMERID =' + QuotedStr(dblcFPago.Text);
   DMFAC.BuscaQry('dspUltTGE', 'TGE180', 'DCCOMDES, DCCOMPORC, DCOMMTOMAX, CONDPID', xSQL, 'DCCOMDES');
   edtFPago.Text := DMFAC.cdsQry.FieldByName('DCCOMDES').AsString;
{
   If bbtnCanc.Focused Then Exit;
}
// Fin HPC_201805_FAC

   If edtFPago.Text = '' Then
   Begin
      ShowMessage('Debe elegir una forma de pago');
      dblcFPago.SetFocus;
      Exit;
   End;

   DMFAC.cdsQry18.Close;
   sConP := DMFAC.cdsQry.FieldByName('CONDPID').AsString;

// Inicio HPC_201805_FAC
// 15/08/2018 valida que forma de pago escogida tenga definición en Dinámicas Contables
   xSQL := 'Select count(CPTOCAB) NUMREGS '
      + '     from DB2ADMIN.CXC208 '
      + '    where CIAID  = '+QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
      + '      and DOCID  = '+QuotedStr(DMFAC.cdsFact2.FieldByname('DOCID').AsString)
      + '      and TMONID = '+QuotedStr(dblcTMon.Text)
      + '      and CPTOCCOMER = '+Quotedstr(dblcFPago.Text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If (DMFAC.cdsQry.RecordCount=0) or (DMFAC.cdsQry.FieldByName('NUMREGS').AsInteger=0) Then
   Begin
      If MessageDlg('No hay dinámica contable para la combinación: Cía='+QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
         + ' - Doc='+QuotedStr(DMFAC.cdsFact2.FieldByname('DOCID').AsString)
         + ' - Moneda='+QuotedStr(dblcTMon.Text)
         + ' - Forma de Pago='+Quotedstr(dblcFPago.Text)+chr(13)
         + '¿Desea cambiar de Moneda?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         If dblcTMon.Text='N' then
            DMFAC.cdsDetComision.FieldByName('TMONPAID').AsString := 'D'
         Else
         Begin
            DMFAC.cdsDetComision.FieldByName('TMONPAID').AsString := 'N';
         End;
      End;
      dblcFPago.SetFocus;
      Exit;
   End;

   lblBusca.Visible := False;
   pnlImp.Enabled := true;
   pnlDoc.Enabled := False;

   DMFAC.cdsDetComision.FieldByName('TIPPAG').AsString := '';
   DMFAC.cdsDetComision.FieldByName('DOCPAG').AsString := '';
   DMFAC.cdsDetComision.FieldByName('SERDOCPAG').AsString := '';
   DMFAC.cdsDetComision.FieldByName('NUMDOCPAG').AsString := '';
//   DMFAC.cdsDetComision.FieldByName('TMONPAID').AsString := '';
   DMFAC.cdsDetComision.FieldByName('MTOPAGORI').AsString := '';
   DMFAC.cdsDetComision.FieldByName('FECDOCPAG').AsString := '';
   dblcTDocFPagoExit(Self);
   dblcTMonExit(Self);
   DMFAC.cdsDetComision.FieldByName('MTOPAGORI').AsFloat := DMFAC.cdsQry17.FieldByname('SALDO').AsFloat;
//   DMFAC.cdsDetComision.FieldByName('TMONPAID').AsString := DMFAC.cdsFact2.FieldByname('TMONID').AsString;

// habilita panel para evitar error en focus
   pnlDoc.Enabled  := True;
   dblcDoc.Enabled := True;
   dblcDoc.Visible := True;
// Fin HPC_201805_FAC

   If sConP = 'EF' Then
   Begin
      dblcDoc.Selected.Clear;
      xSQL := 'Select ciaid, docid, ccserie, ccnodoc, clauxid, clieid, NCOMTOORI, CCFEMIS, TMONID '
         + '  from DB2ADMIN.CXC303 '
         + ' where CLIEID=' + quotedstr(DMFAC.cdsFact2.FieldByname('CLIEID').AsString)
         + '   and NCOESTADO IN (''C'') AND CCFEMIS>=''01/01/2010'' ';
      DMFAC.cdsQry18.Close;
      DMFAC.cdsQry18.DataRequest(xSQL);
      DMFAC.cdsQry18.Open;
      dblcDoc.Selected.Add('CCNODOC'#9'12'#9'Recibo Caja');
      dblcDoc.Selected.Add('CCFEMIS'#9'11'#9'Fecha');
      dblcDoc.Selected.Add('TMONID'#9'3'#9'TM');
      dblcDoc.Selected.Add('NCOMTOORI'#9'9'#9'Importe');

      lblBusca.Visible := True;
      pnlImp.Enabled := False;
      dblcDoc.SetFocus;
      dblcDoc.AutoDropDown := true;
   End;

   If sConP = 'CR' Then
   Begin
      dblcDoc.Selected.Clear;
      xSQL := 'Select ASOID, CREDID, ASOAPENOM, CREFOTORG, CREMTOOTOR, CREMTOGIR-nvl(TOTUSA,0) CREMTOGIR, CREMTONABO, TMONID '
         + '     From DB2ADMIN.CRE301 A, '
         + '         (Select NUMDOCPAG, sum(MTODOCORI) TOTUSA  '
         + '            from DB2ADMIN.FAC_FOR_PAG B '
         + '           where NOT BORRADO=''S'' AND TIPPAG=''CR'' '
         + '             and FECDOCPAG>=' + quotedstr(DatetoStr(FFactSGuia.dtpFFac.Date - 4500))
         + '           group by NUMDOCPAG ) C '
         + '    Where ASOID=' + quotedstr(DMFAC.cdsFact2.FieldByname('CLIEID').AsString)
         + '      and CREFOTORG>=''' + DatetoStr(FFactSGuia.dtpFFac.Date - 4500) + ''' '
         + '      and TIPCREID in (Select TIPCREID '
         + '                         from DB2ADMIN.FAC_CRED_X_CCOMER '
         + '                        where CIAID=' + quotedstr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
         + '                          and CCOMERID=' + quotedstr(dblcFPago.Text)
         + '                       ) '
         + '      and NOT CREESTID IN (''13'',''04'') '
         + '      and not EXISTS(Select NUMDOCPAG '
         + '                       from DB2ADMIN.FAC_FOR_PAG B '
         + '                      where A.CREDID=NUMDOCPAG AND NOT BORRADO=''S'' AND TIPPAG=''CR'' '
         + '                      group by NUMDOCPAG '
         + '                     having sum(mtodocori)>a.CREMTOGIR) '
         + '      and A.CREDID=C.NUMDOCPAG(+)';
      DMFAC.cdsQry18.Close;
      DMFAC.cdsQry18.DataRequest(xSQL);
      DMFAC.cdsQry18.Open;
   // Inicio HPC_201805_FAC
   // 15/08/2018 valida que cds esté abierto
      If DMFAC.cdsQry18.RecordCount=0 Then
      Begin
         ShowMessage('No hay creditos sociales otorgados para el Cliente');
         dblcFPago.SetFocus;
         Exit;
      End;
   // Fin HPC_201805_FAC
      dblcDoc.Selected.Add('CREDID'#9'16'#9'Crédito');
      dblcDoc.Selected.Add('CREFOTORG'#9'11'#9'Fecha');
      dblcDoc.Selected.Add('TMONID'#9'3'#9'TM');
      dblcDoc.Selected.Add('CREMTOGIR'#9'9'#9'Importe');

      lblBusca.Visible := True;
      pnlImp.Enabled := False;
      dblcDoc.SetFocus;
      dblcDoc.AutoDropDown := true;
   End;

   If sConP = 'NC' Then
   Begin
      dbeImp.Enabled := False;
      dblcDoc.Selected.Clear;
      xSQL := 'Select DOCID, CCSERIE, CCNODOC, CCFEMIS, TMONID, trunc(CCSALORI,2) CCMTOORI '
         + '  from DB2ADMIN.CXC301 '
         + ' WHERE CIAID=''' + DMFAC.cdsFact2.FieldByname('CIAID').AsString + ''' '
         + '   AND DOCID=''27'' '
         + '   AND CLAUXID=''' + DMFAC.cdsFact2.FieldByname('CLAUXID').AsString + ''' '
         + '   AND CLIEID=''' + DMFAC.cdsFact2.FieldByname('CLIEID').AsString + ''' '
         + '   AND CCESTADO IN (''P'') AND CCFEMIS>=''01/01/2010'' '
         + '   AND NOT EXISTS (Select * from DB2ADMIN.FAC_FOR_PAG B '
         + '                    where CCSERIE=B.SERDOCPAG and CCNODOC=B.NUMDOCPAG AND NVL(BORRADO,''N'')<>''S'' AND TIPPAG=''NC'')';
      DMFAC.cdsQry18.Close;
      DMFAC.cdsQry18.DataRequest(xSQL);
      DMFAC.cdsQry18.Open;
      dblcDoc.Selected.Add('CCSERIE'#9'5'#9'Serie');
      dblcDoc.Selected.Add('CCNODOC'#9'12'#9'N.Crédito');
      dblcDoc.Selected.Add('CCFEMIS'#9'11'#9'Fecha');
      dblcDoc.Selected.Add('TMONID'#9'3'#9'TM');
      dblcDoc.Selected.Add('CCMTOORI'#9'9'#9'Importe');

      lblBusca.Visible := True;
      pnlImp.Enabled := False;
      dblcDoc.SetFocus;
      dblcDoc.AutoDropDown := true;
   End;

   If Not DMFAC.cdsQry18.Active Then
   Begin
   // Inicio HPC_201804_FAC
   // Deshabilitra si cdsQry18 está desactivo
      dblcDoc.Enabled := False;
   // Fin HPC_201804_FAC

      dblcDoc.Visible := False;
// Inicio HPC_201805_FAC
// habilita panel porque se pueden hacer pagos parciales
   End
   Else
   Begin
      pnlImp.Enabled := True;
// Fin HPC_201805_FAC
   End;
End;

Procedure TFFormaPago.dblcTMonExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'TMONID=' + Quotedstr(dblcTMon.Text)
      + ' and (TMON_LOC=' + Quotedstr('L') + ' or TMON_LOC=' + Quotedstr('E') + ')';
   edtTMon.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');

// Inicio HPC_201805_FAC
// 15/08/2018 valida que forma de pago escogida tenga definición en Dinámicas Contables
   xWhere := 'Select count(CPTOCAB) NUMREGS '
      + '     from DB2ADMIN.CXC208 '
      + '    where CIAID  = '+QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
      + '      and DOCID  = '+QuotedStr(DMFAC.cdsFact2.FieldByname('DOCID').AsString)
      + '      and TMONID = '+QuotedStr(dblcTMon.Text)
      + '      and CPTOCCOMER = '+Quotedstr(dblcFPago.Text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xWhere);
   DMFAC.cdsQry.Open;
   If (DMFAC.cdsQry.RecordCount=0) or (DMFAC.cdsQry.FieldByName('NUMREGS').AsInteger=0) Then
   Begin
      If MessageDlg('No hay dinámica contable para la combinación: Cía='+QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
         + ' - Doc='+QuotedStr(DMFAC.cdsFact2.FieldByname('DOCID').AsString)
         + ' - Moneda='+QuotedStr(dblcTMon.Text)
         + ' - Forma de Pago='+Quotedstr(dblcFPago.Text)+chr(13)
         + '¿Desea cambiar de Moneda?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         If dblcTMon.Text='N' then
            DMFAC.cdsDetComision.FieldByName('TMONPAID').AsString := 'D'
         Else
         Begin
            DMFAC.cdsDetComision.FieldByName('TMONPAID').AsString := 'N';
         End;
      End;
      dblcFPago.SetFocus;
      Exit;
   End;
// Fin HPC_201805_FAC
End;

Procedure TFFormaPago.dblcDocExit(Sender: TObject);
Var
   xCampo1, xCampo2: currency;
Begin
   pnlImp.Enabled := True;

   If dblcDoc.text = '' Then Exit;

   pnlImp.Enabled := False;
   dbeImp.Text := StringReplace(dbeImp.Text, ',', '', [rfReplaceAll]);

   DMFAC.cdsDetComision.Edit;
   If sConP = 'EF' Then
   Begin
      DMFAC.cdsDetComision.FieldByName('TIPPAG').AsString := sConP;
      DMFAC.cdsDetComision.FieldByName('DOCPAG').AsString := DMFAC.cdsQry18.FieldByname('DOCID').AsString;
      DMFAC.cdsDetComision.FieldByName('SERDOCPAG').AsString := DMFAC.cdsQry18.FieldByname('CCSERIE').AsString;
      DMFAC.cdsDetComision.FieldByName('NUMDOCPAG').AsString := DMFAC.cdsQry18.FieldByname('CCNODOC').AsString;
      DMFAC.cdsDetComision.FieldByName('TMONPAID').AsString := DMFAC.cdsQry18.FieldByname('TMONID').AsString;
      DMFAC.cdsDetComision.FieldByName('MTOPAGORI').AsString := DMFAC.cdsQry18.FieldByname('NCOMTOORI').AsString;
      DMFAC.cdsDetComision.FieldByName('FECDOCPAG').AsString := DMFAC.cdsQry18.FieldByname('CCFEMIS').AsString;
      dblcTDocFPagoExit(Self);
      dblcTMonExit(Self);
   End;
   If sConP = 'CR' Then
   Begin
      pnlImp.Enabled := tRUE;
      DMFAC.cdsDetComision.FieldByName('TIPPAG').AsString := sConP;
      DMFAC.cdsDetComision.FieldByName('DOCPAG').AsString := '66';
      DMFAC.cdsDetComision.FieldByName('SERDOCPAG').AsString := '';
      DMFAC.cdsDetComision.FieldByName('NUMDOCPAG').AsString := DMFAC.cdsQry18.FieldByname('CREDID').AsString;
      DMFAC.cdsDetComision.FieldByName('TMONPAID').AsString := DMFAC.cdsQry18.FieldByname('TMONID').AsString;
      DMFAC.cdsDetComision.FieldByName('MTOPAGORI').AsString := DMFAC.cdsQry18.FieldByname('CREMTOGIR').AsString;
      DMFAC.cdsDetComision.FieldByName('FECDOCPAG').AsString := DMFAC.cdsQry18.FieldByname('CREFOTORG').AsString;
      dblcTDocFPagoExit(Self);
      dblcTMonExit(Self);
   End;

   If sConP = 'NC' Then
   Begin
      pnlImp.Enabled := True;
      DMFAC.cdsDetComision.FieldByName('TIPPAG').AsString := sConP;
      DMFAC.cdsDetComision.FieldByName('DOCPAG').AsString := DMFAC.cdsQry18.FieldByname('DOCID').AsString;
      DMFAC.cdsDetComision.FieldByName('SERDOCPAG').AsString := DMFAC.cdsQry18.FieldByname('CCSERIE').AsString;
      DMFAC.cdsDetComision.FieldByName('NUMDOCPAG').AsString := DMFAC.cdsQry18.FieldByname('CCNODOC').AsString;
      DMFAC.cdsDetComision.FieldByName('TMONPAID').AsString := DMFAC.cdsQry18.FieldByname('TMONID').AsString;
      DMFAC.cdsDetComision.FieldByName('MTOPAGORI').Asfloat := DMFAC.cdsQry18.FieldByname('CCMTOORI').Asfloat;
      DMFAC.cdsDetComision.FieldByName('FECDOCPAG').AsString := DMFAC.cdsQry18.FieldByname('CCFEMIS').AsString;
      xCampo1 := DMFAC.cdsQry18.FieldByName('CCMTOORI').asfloat;
      dbeSaldo.Text := StringReplace(dbeSaldo.Text, ',', '', [rfReplaceAll]);
      xCampo2 := StrToFloat(dbeSaldo.Text);

      If xCampo1 > xCampo2 Then
      Begin
         ShowMessage('Importe no debe ser mayor a ' + dbeSaldo.Text);
         bbtnOk.Enabled := False;
      End
      Else
         bbtnOk.Enabled := True;

      dblcTDocFPagoExit(Self);
      dblcTMonExit(Self);
   End;
End;

Procedure TFFormaPago.dbgPagoKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Var
   xSQL: String;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg('¿Esta Seguro de Eliminar Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
      // Inicio HPC_201802_FAC
      // Borra registro de forma de pago en forma física
         {
         xSQL := 'update DB2ADMIN.FAC_FOR_PAG '
            + '      Set BORRADO=''S'' '
            + '    where CIAID=''' + DMFAC.cdsDetComision.FieldByName('CIAID').AsString + ''' '
            + '      and DOCID=''' + DMFAC.cdsDetComision.FieldByName('DOCID').AsString + ''' '
            + '      and FACSERIE=''' + DMFAC.cdsDetComision.FieldByName('FACSERIE').AsString + ''' '
            + '      and NFAC=''' + DMFAC.cdsDetComision.FieldByName('NFAC').AsString + ''' '
            + ' and item=' + DMFAC.cdsDetComision.FieldByName('ITEM').AsString;
         }
         xSQL := 'Delete from DB2ADMIN.FAC_FOR_PAG '
            + '    where CIAID='+quotedstr(DMFAC.cdsDetComision.FieldByName('CIAID').AsString)
            + '      and DOCID='+quotedstr(DMFAC.cdsDetComision.FieldByName('DOCID').AsString)
            + '      and FACSERIE='+quotedstr(DMFAC.cdsDetComision.FieldByName('FACSERIE').AsString)
            + '      and NFAC='+quotedstr(DMFAC.cdsDetComision.FieldByName('NFAC').AsString)
            + '      and ITEM='+DMFAC.cdsDetComision.FieldByName('ITEM').AsString;
      // Fin HPC_201802_FAC
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);

         FiltraPagos;
      End;
   End;
End;

Procedure TFFormaPago.dbgPagoDblClick(Sender: TObject);
Var
   xSQL: String;
   xWhere: String;
Begin
   xSQL := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString) + ' AND CCOMERID =' + QuotedStr(dblcFPago.Text);
   DMFAC.BuscaQry('dspUltTGE', 'TGE180', 'DCCOMDES, DCCOMPORC, DCOMMTOMAX, CONDPID', xSQL, 'DCCOMDES');
   edtFPago.Text := DMFAC.cdsQry.FieldByName('DCCOMDES').AsString;

   xWhere := 'TMONID=' + Quotedstr(dblcTMon.Text)
      + ' and (TMON_LOC=' + Quotedstr('L') + ' or TMON_LOC=' + Quotedstr('E') + ')';
   edtTMon.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');

   dbeDoc.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCDES', 'DOCID=' + QuotedStr(dblcTDocFPago.Text), 'DOCDES');

   bbtnOK.Visible := False;
   pnlFPago.Visible := True;
   pnlTodo.Enabled := False;
   pnlTip.Enabled := False;
End;

Procedure TFFormaPago.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFFormaPago.bbtnRegCancClick(Sender: TObject);
Begin
   If DMFAC.cdsQry17.FieldByname('SALDO').asFloat <> 0 Then
   Begin
      If MessageDlg('Falta completar la Forma de Pago' + #13
         + 'Está seguro de salir ............? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
      Begin
         Exit;
      End;
   End;
   Close;
End;

Procedure TFFormaPago.dblcTDocFPagoExit(Sender: TObject);
Begin
   dbeDoc.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCDES', 'DOCID=' + QuotedStr(dblcTDocFPago.Text), 'DOCDES');
End;

Procedure TFFormaPago.dblcDocEnter(Sender: TObject);
Begin
// Inicio HPC_201804_FAC
// Sólo apertura cds si componente está habilitado
   If dblcDoc.Enabled Then
      DMFAC.cdsQry18.Open;
// Fin HPC_201804_FAC
End;

Procedure TFFormaPago.dblcFPagoEnter(Sender: TObject);
Begin
   dblcDoc.Visible := True;
End;

Procedure TFFormaPago.dbeImpExit(Sender: TObject);
Begin
   If bbtnCanc.Focused Then Exit;

// Inicio HPC_201805_FAC
// Si cambia Forma de Pago puede salir
   If dblcFPago.Focused Then Exit;
// Fin HPC_201805_FAC

   If sConP = 'CR' Then
   Begin
      If Strtofloat(StringReplace(dbeImp.Text, ',', '', [rfReplaceAll])) > DMFAC.cdsQry18.FieldByname('CREMTOGIR').AsFloat Then
      Begin
         ShowMessage('Importe no debe ser mayor a ' + DMFAC.cdsQry18.FieldByname('CREMTOGIR').AsString);
         dbeImp.SetFocus;
      End;
   End;
End;

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
{
Procedure TFFormaPago.fg_VerificaGeneraCxC;
Var
   xsSql: String;
Begin
   //Verifico que no tenga detalle la cxc
   xsSql := ' Select * '
      + '   from DB2ADMIN.CXC302 '
      + '  where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
      + '    and CCANOMES=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
      + '    and DOCID=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString)
      + '    and CCSERIE=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString)
      + '    and CCNODOC=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xsSql);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount = 0 Then
   Begin
      btnGeneraCxCClick(Self);
   End;

End;
}
// Fin FAC-201806

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
{
Procedure TFFormaPago.btnGeneraCxCClick(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := 'Select * '
      + '  from DB2ADMIN.CXC312 '
      + ' where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
      + '   and ' + QuotedStr(DMFAC.cdsFact2.FieldByname('FACFECHA').AsString) + ' >= CNSPRICIE '
      + '   and ' + QuotedStr(DMFAC.cdsFact2.FieldByname('FACFECHA').AsString) + ' <=CNSULTCIE '
      + '   and ESTVEN = ' + QuotedStr('I')
      + ' order BY CNSULTCIE DESC';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xsSql);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No Existe Periodo Operativo en Cuentas por Cobrar o está Cerrado');
      Exit;
   End;
   If fg_EliminarCxC = False Then
   Begin
      Exit;
   End;
   FFactSGuia.TransferenciaCxC_VC(xsNumComprobante);
   Close;
End;
}
// Fin FAC-201806

Function TFFormaPago.fg_EliminarCxC: Boolean;
Var
   xsSql: String;
Begin
   xsNumComprobante := '';
   xsSql := ' Select T.* '
      + '   from DB2ADMIN.CXC301 T, DB2ADMIN.CXC302 R'
      + '  where T.CIAID = R.CIAID '
      + '    and T.CCANOMES = R.CCANOMES '
      + '    and T.TDIARID = R.TDIARID '
      + '    and T.CCNOREG = R.CCNOREG '
      + '    and T.CIAID = ' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
      + '    and T.CCANOMES = ' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
      + '    and T.DOCID = ' + QuotedStr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString)
      + '    and T.CCSERIE = ' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString)
      + '    and T.CCNODOC = ' + QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xsSql);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount > 0 Then
   Begin
      xsNumComprobante := DMFAC.cdsQry.fieldbyname('CCNOREG').AsString;
      If MessageDlg('Se eliminará los datos de CxC.' + #13 +
         'Desea Continuar? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
      Begin
         Result := False;
         Exit;
      End;
   End;

   xsSql := ' Delete from DB2ADMIN.CXC301 '
      + '  where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
      + '    and CCANOMES=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
      + '    and DOCID=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString)
      + '    and CCSERIE=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString)
      + '    and CCNODOC=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      Screen.Cursor := crDefault;
   End;

   xsSql := ' Delete from DB2ADMIN.CXC302 '
      + '  where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
      + '    and CCANOMES=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
      + '    and DOCID=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString)
      + '    and CCSERIE=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString)
      + '    and CCNODOC=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      Screen.Cursor := crDefault;
   End;

   If xsNumComprobante <> '' Then
   Begin
      xsSql := 'Delete from DB2ADMIN.CNT301 '
         + ' where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
         + '   and CNTANOMM=' + DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString
         + '   and TDIARID=' + QuotedStr('09')
         + '   and CNTCOMPROB=' + QuotedStr(xsNumComprobante);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xsSql);
      Except
         Screen.Cursor := crDefault;
      End;
      xsSql := 'Delete from DB2ADMIN.CNT311 '
         + ' where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
         + '   and CNTANOMM=' + DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString
         + '   and TDIARID=' + QuotedStr('09')
         + '   and CNTCOMPROB=' + QuotedStr(xsNumComprobante);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xsSql);
      Except
         Screen.Cursor := crDefault;
      End;

      xsSql := 'Delete from DB2ADMIN.CNT300 '
         + ' where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
         + '   and CNTANOMM=' + DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString
         + '   and TDIARID=' + QuotedStr('09')
         + '   and CNTCOMPROB=' + QuotedStr(xsNumComprobante);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xsSql);
      Except
         Screen.Cursor := crDefault;
      End;
   End;
   Result := True;
End;

Procedure TFFormaPago.dblcFPagoChange(Sender: TObject);
Begin
   dbeImp.Enabled := True;
   bbtnOk.Enabled := True;
End;

Procedure TFFormaPago.dbeImpChange(Sender: TObject);
Begin
   bbtnOk.Enabled := True;
End;

Procedure TFFormaPago.dbeNFacConfKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Not (Key In ['0'..'9', #8]) Then
      Key := #0;
End;

Procedure TFFormaPago.dblcSerieGuiaExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If dblcSerieGuia.text = '' Then
   Begin
      Raise Exception.Create('Ingrese Serie de Guía');
   End;
   If length(dblcSerieGuia.text) > 0 Then
   Begin
      xSQL := 'FLAGV=' + quotedStr('G') + ' and SERIEID=' + quotedstr(dblcSerieGuia.Text);
      dbeNumGuia.text := inttostr(strtoint(DMFAC.BuscaQry('dspUltTGE', 'FAC103', '*', xSQL, 'SERIENUM')) + 1);
   End;
End;

Procedure TFFormaPago.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin
   edtTDoc.Text := FFactSGuia.edtTDoc.Text;
   dblcSerieConf.Text := FFactSGuia.dblcSerie.Text;
// Inicio HPC_201804_FAC
// 05/07/2018 sólo para Facturas en estado INICIAL
   dbeNFacConf.text := DMFAC.cdsFact2.FieldByName('NFAC').AsString;
   Z2bbtnAcepta.Enabled := False;
//   dbeNFacConf.text := FFactSGuia.dbeNFac.Text;

   If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString='INICIAL' then
   Begin
   // Inicio HPC_201801_FAC
   // Define Nro.Factura
   //   dbeNFacConf.Text := xNumeroReal;
      NuevoNroDoc;
   // Fin HPC_201801_FAC
      Z2bbtnAcepta.Enabled := True;

      edtMoneda.Text := FFactSGuia.edtTMon.Text;
      dbeMonto.Text := floattostr(DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat);

   // Actualiza FAC_FOR_PAG solo para Almacén 31 (WEB)
      If (FFactSGuia.dblcCia.text = '04') And (FFactSGuia.dblcAlmacen.Text = '31') Then
      Begin
         xSQL := 'Select DOCID, FACSERIE, NFAC '
            + '     from DB2ADMIN.FAC_FOR_PAG '
            + '    where CIAID=' + QuotedStr(FFactSGuia.dblcCia.text)
            + '      and DOCID=' + QuotedStr('99')
            + '      and FACSERIE=' + QuotedStr('999')
            + '      and NFAC=' + quotedstr(FFactSGuia.dblcdProf.Text);
         DMFAC.cdsQry.Close;
         DMFAC.cdsQry.dataRequest(xSQL);
         DMFAC.cdsQry.Open;
         If DMFAC.cdsQry.RecordCount > 0 Then
         Begin
            xSQL := 'update DB2ADMIN.FAC_FOR_PAG '
               + '      set DOCID   =' + quotedstr(FFactSGuia.dblcTdoc.Text) + ', '
               + '          FACSERIE=' + quotedstr(FFactSGuia.dblcSerie.Text) + ', '
               + '          NFAC    =' + quotedstr(FFactSGuia.dbeNFac.text)
               + '    where CIAID=' + QuotedStr(FFactSGuia.dblcCia.text)
               + '      and DOCID=' + QuotedStr('99')
               + '      and FACSERIE=' + QuotedStr('999')
               + '      and NFAC=' + quotedstr(FFactSGuia.dblcdProf.Text);
            Try
               DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('Error al intentar actualizar FAC_FOR_PAG proveniente de Proforma de Tienda Virtual');
               exit;
            End;
         End;
      End;

      dblcSerieConf.DataSource := DMFAC.dsFact2;
      dblcSerieGuia.LookupTable := DMFAC.cdsSerieG;

   // Inicio HPC_201802_FAC
   // 02/07/2018 Elimina posibles Formas de Pago anteriores
      xSQL := 'Delete from DB2ADMIN.FAC_FOR_PAG '
         + '    where CIAID=' + QuotedStr(FFactSGuia.dblcCia.text)
         + '      and DOCID=' + QuotedStr(FFactSGuia.dblcTDoc.Text)
         + '      and FACSERIE=' + QuotedStr(dblcSerieConf.Text)
         + '      and (NFAC=' + quotedstr(FFactSGuia.dbeNFac.Text)
         + '        or NFAC='+quotedstr(dbeNFacConf.Text)+')';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
      End;
   // Fin HPC_201802_FAC
   End;
// Fin HPC_201804_FAC

   FiltraPagos;
End;

Procedure TFFormaPago.Z2bbtnAceptaClick(Sender: TObject);
Var
   xSQL, xsSql, cNumFacAnt: String;
   xPrecio, xCantG, xImporte1, xTotD1, xSubTot1, xTotD2, xTot, xTMonto, xTDscto: double;
   nCont: Integer;
Begin
   If Length(dbeNFacConf.text) < DMFAC.wAnchoFact Then
   Begin
      ShowMessage('Longitud del Número debe ser ' + IntToStr(DMFAC.wAnchoFact));
   // Inicio HPC_201801_FAC
   // reDefine Nro.Factura
   //      dbeNFacConf.SetFocus;
      NuevoNroDoc;
   // Fin HPC_201801_FAC
      Exit;
   End;

   xSql := 'Select * '
      + '  from DB2ADMIN.CXC312 '
      + ' where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
      + '   and ' + QuotedStr(DMFAC.cdsFact2.FieldByname('FACFECHA').AsString) + ' >= CNSPRICIE '
      + '   and ' + QuotedStr(DMFAC.cdsFact2.FieldByname('FACFECHA').AsString) + ' <=CNSULTCIE '
      + '   and ESTVEN = ' + QuotedStr('I')
      + ' order BY CNSULTCIE DESC';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSql);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No Existe Periodo Operativo en Cuentas por Cobrar o está Cerrado');
      Screen.Cursor := crDefault;
      exit;
   End;

// Inicio HPC_201805_FAC
// Pasa ACEPTACION de Documento de Venta a Procedimiento almacenado
   xSQL := 'Select FN_FAC_VALIDA_FAC('
      + quotedstr(FFactSGuia.dblcCia.Text)+','
      + quotedstr(FFactSGuia.dblcTDoc.Text)+','
      + quotedstr(dblcSerieConf.Text)+','
      + quotedstr(FFactSGuia.dbeNFac.Text)+') RESULTADO from DUAL';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No ha pasado la validación de Datos');
      Exit;
   End;
   If DMFAC.cdsQry.FieldByName('RESULTADO').AsString<>'OK' Then
   Begin
      ShowMessage(DMFAC.cdsQry.FieldByName('RESULTADO').AsString);
      Exit;
   End;

   xSQL := 'Begin '
      + '      SP_FAC_ACEPTA_VTA('+ quotedstr(FFactSGuia.dblcCia.Text)+','
      +                             quotedstr(FFactSGuia.dblcTDoc.Text)+','
      +                             quotedstr(dblcSerieConf.Text)+','
      +                             quotedstr(FFactSGuia.dbeNFac.Text)+');'
      + '   End;';
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se ha generado la ACEPTACIÓN de la Factura');
      Exit;
   End;

   xSQL := 'Select NFAC '
     + '      from DB2ADMIN.FAC305 '
     + '     where CIAID='+ quotedstr(FFactSGuia.dblcCia.Text)
     + '       and DOCID='+ quotedstr(FFactSGuia.dblcTDoc.Text)
     + '       and FACSERIE='+ quotedstr(dblcSerieConf.Text)
     + '       and PEDIDO='+ quotedstr(FFactSGuia.dbeNFac.Text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No se ha podido realizar la ACEPTACIÓN del Documento con éxito (1)');
      Exit;
   End;
   If length(DMFAC.cdsQry.FieldByName('NFAC').AsString)=0 Then
   Begin
      ShowMessage('No se ha podido realizar la ACEPTACIÓN del Documento con éxito (2)');
      Exit;
   End;
   ShowMessage('Se ha generado el Documento de Venta : '+DMFAC.cdsQry.FieldByName('NFAC').AsString);
   dbeNFacConf.Text := DMFAC.cdsQry.FieldByName('NFAC').AsString;

(*

   xSQL := 'Select CIAID, FACSERIE, NFAC '
      + '     from DB2ADMIN.FAC305 '
      + '    where CIAID=' + Quotedstr(FFactSGuia.dblcCia.Text)
      + '      and DOCID=' + Quotedstr(FFactSGuia.dblcTDoc.Text)
      + '      and FACSERIE=' + Quotedstr(dblcSerieConf.Text)
      + '      and NFAC=' + Quotedstr(dbeNFacConf.text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount > 0 Then
   Begin
      ShowMessage('El número de Documento ya fue Usado...');
   // Inicio HPC_201801_FAC
   // reDefine Nro.Factura
   //      dbeNFacConf.SetFocus;
      NuevoNroDoc;
   // Fin HPC_201801_FAC
      Exit;
   End;

   If DMFAC.cdsQry17.FieldByname('SALDO').asFloat <> 0 Then
   Begin
      ShowMessage('Falta completar la Forma de Pago');
      dbgPago.SetFocus;
      Exit;
   End;

   DMFAC.DCOM1.AppServer.IniciaTransaccion;
   xContinuaGrab := True;

// Inicio HPC_201804_FAC
// 09/07/2018 Elimina Nro de Documento en Detalle si se encuentra
   xSQL := 'Select CIAID, FACSERIE, NFAC '
      + '     from DB2ADMIN.FAC306 '
      + '    where CIAID=' + Quotedstr(FFactSGuia.dblcCia.Text)
      + '      and DOCID=' + Quotedstr(FFactSGuia.dblcTDoc.Text)
      + '      and FACSERIE=' + Quotedstr(dblcSerieConf.Text)
      + '      and NFAC=' + Quotedstr(dbeNFacConf.text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := 'Delete from DB2ADMIN.FAC306 '
         + '    where CIAID=' + Quotedstr(FFactSGuia.dblcCia.Text)
         + '      and DOCID=' + Quotedstr(FFactSGuia.dblcTDoc.Text)
         + '      and FACSERIE=' + Quotedstr(dblcSerieConf.Text)
         + '      and NFAC=' + Quotedstr(dbeNFacConf.text);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
         If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error al intentar actualizar Archivos de Números de Serie de Boleta/Fact');
         exit;
      End;
   End;
// Fin HPC_201801_FAC

// Actualiza Número de Documento de Venta
   If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xFact) Then
   Begin
      xSQL := 'Update DB2ADMIN.FAC103 '
         + '      Set NUMREAL=' + dbeNFacConf.text
         + '    where CIAID=' + QuotedStr(FFactSGuia.dblcCia.text)
         + '      and FLAGV = ''F'' '
         + '      and SERIEID=' + QuotedStr(FFactSGuia.dblcSerie.Text);
   End;

   If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xBol) Then
   Begin
      xSQL := 'Update DB2ADMIN.FAC103 '
         + '      Set NUMREAL=' + dbeNFacConf.text
         + '    where CIAID=' + QuotedStr(FFactSGuia.dblcCia.text)
         + '      and FLAGV = ''B'' '
         + '      and SERIEID=' + QuotedStr(FFactSGuia.dblcSerie.Text);
   End;

   If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xTick) Then
   Begin
      xSQL := 'Update DB2ADMIN.FAC103 '
         + '      Set NUMREAL=' + dbeNFacConf.text
         + '    where CIAID=' + QuotedStr(FFactSGuia.dblcCia.text)
         + '      and FLAGV = ''T'' '
         + '      and SERIEID=' + QuotedStr(FFactSGuia.dblcSerie.Text);
      FFactSGuia.Z2bbtnImprime.Enabled := False;
      FFactSGuia.bbtnTicket.Enabled := True;
   End;

   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   // Inicio HPC_201804_FAC
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Error al intentar actualizar Archivos de Números de Serie de Boleta/Fact');
      exit;
   // Fin HPC_201804_FAC
   End;

   wwNumFacAnt := FFactSGuia.dbeNFac.Text;

// Actualiza Forma de Pago
   xSQL := 'Update DB2ADMIN.FAC_FOR_PAG '
      + '      Set NFAC=' + quotedstr(dbeNFacConf.Text)
      + '    where CIAID=' + QuotedStr(FFactSGuia.dblcCia.text)
      + '      and DOCID=' + quotedstr(FFactSGuia.dblcTdoc.Text)
      + '      and FACSERIE=' + quotedstr(FFactSGuia.dblcSerie.Text)
      + '      and NFAC=' + quotedstr(FFactSGuia.dbeNFac.Text);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   // Inicio HPC_201804_FAC
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Error al intentar actualizar el Número de Boleta/Fact en Detalle de Forma de Pago');
      exit;
   // Fin HPC_201804_FAC
   End;

// Actualiza Número de Factura en Archivo FAC305 CABECERA
   xSQL := 'Update DB2ADMIN.FAC305 '
      + '      set NFAC=' + quotedstr(dbeNFacConf.text) + ','
      + '          FACUSER   = ' + quotedstr(DMFAC.wUsuario) + ','
      + '          FACESTADO = ''ACEPTADO'', '
      + '          FACFREG   = trunc(sysdate) '
      + '    where CIAID=' + QuotedStr(FFactSGuia.dblcCia.text)
      + '      and DOCID=' + quotedstr(FFactSGuia.dblcTdoc.Text)
      + '      and FACSERIE=' + quotedstr(FFactSGuia.dblcSerie.Text)
      + '      and NFAC=' + quotedstr(FFactSGuia.dbeNFac.Text);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   // Inicio HPC_201804_FAC
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Error al intentar actualizar el Número de Boleta/Fact en Cabecera de Boleta/Factura');
      exit;
   // Fin HPC_201804_FAC
   End;

// Inicio HPC_201804_FAC
// cambia sólo archivo mientras no termine de realizar todas las actualizaciones
//   cNumFacAnt := FFactSGuia.dbeNFac.text;
   DMFAC.cdsFact2.Edit;
   DMFAC.cdsFact2.FieldByName('NFAC').AsString := dbeNFacConf.text;
   DMFAC.cdsFact2.Post;
   FFactSGuia.dbeNFac.Text := DMFAC.cdsFact2.FieldByName('NFAC').AsString;
// Fin HPC_201804_FAC

   xContinuaGrab := True;

   FFactSGuia.AcumulaTotCabecera;
   If Not xContinuaGrab Then
   Begin
   // Inicio HPC_201804_FAC
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
      DMFAC.cdsFact2.Post;
      FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      exit;
   // Fin HPC_201804_FAC
   End;

// Actualiza Detalle, Nota de Salida, Stock, etc.
   Errorcount := 0;

// Inicio HPC_201804_FAC
// pasa asignación de valor cNumFacAnt antes del cambio del valor de la variable FFactSGuia.dbeNFac.text
//   cNumFacAnt := FFactSGuia.dbeNFac.text;
// Fin HPC_201804_FAC

// Actualiza Numero de Factura en Detalle de Series y Barras desde Almacen LOG332
   xSQL := 'Update DB2ADMIN.LOG332 '
      + '      Set NFAC=' + QuotedStr(Trim(dbeNFacConf.text))
      + '    where CIAID=' + QuotedStr(FFactSGuia.dblcCia.Text)
      + '      and LOCID=' + QuotedStr(FFactSGuia.dblcLocal.Text)
      + '      and TINID=' + QuotedStr(FFactSGuia.dblcTInv.Text)
      + '      and ENTREGADO=' + QuotedStr('S')
      + '      and DOCID=' + QuotedStr(FFactSGuia.dblcTdoc.Text)
      + '      and FACSERIE=' + QuotedStr(FFactSGuia.dblcSerie.Text)
      + '      and NFAC=' + QuotedStr(wwNumFacAnt);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   // Inicio HPC_201804_FAC
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Error al intentar actualizar Archivos de  Series y Barras desde Almacen (LOG332)');
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
      DMFAC.cdsFact2.Post;
      FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
      exit;
   // Fin HPC_201804_FAC
   End;

// Actualiza Numero de Factura en la Tabla de Observación FAC313
   xSql := 'Update DB2ADMIN.FAC313 '
      + '      Set NFAC=' + quotedstr(dbeNFacConf.text)
      + '    Where CIAID =' + QuotedStr(FFactSGuia.dblcCia.Text)
      + '      and DOCID =' + QuotedStr(FFactSGuia.dblcTDoc.Text)
      + '      and FACSERIE =' + QuotedStr(FFactSGuia.dblcSerie.Text)
      + '      and NFAC =' + quotedstr(wwNumFacAnt);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSql);
   Except
   // Inicio HPC_201804_FAC
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Error al intentar actualizar Archivos de Observaciones (FAC313-NFAC)');
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
      DMFAC.cdsFact2.Post;
      FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
      exit;
   // Fin HPC_201804_FAC
   End;

   xSQL := 'Update DB2ADMIN.FAC306 '
      + '      set NFAC=' + QuotedStr(dbeNFacConf.text) + ','
      + '          DFACESTADO=''ACEPTADO'' '
      + '    where CIAID=' + QuotedStr(Trim(FFactSGuia.dblcCia.Text))
      + '      and DOCID=' + quotedstr(FFactSGuia.dblcTdoc.Text)
      + '      and FACSERIE=' + QuotedStr(Trim(FFactSGuia.dblcSerie.Text))
      + '      and NFAC=' + QuotedStr(Trim(wwNumFacAnt));
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   // Inicio HPC_201804_FAC
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Error al intentar actualizar Archivos de Detalle (FAC306-NFAC)');
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
      DMFAC.cdsFact2.Post;
      FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
      exit;
   // Fin HPC_201804_FAC
   End;

   DMFAC.cdsDetFact2.First;
   While Not DMFAC.cdsDetFact2.EOF Do
   Begin
      DMFAC.cdsDetFact2.Edit;
      DMFAC.cdsDetFact2.FieldByName('NFAC').AsString := dbeNFacConf.Text;
      DMFAC.cdsDetFact2.Post;
      DMFAC.cdsDetFact2.Next;
   End;

   FFactSGuia.dbeNFac.text := dbeNFacConf.text;

   Screen.Cursor := crHourGlass;

   xContinuaGrab := True;

   If FFactSGuia.sTipoRQS = 'C' Then
   Begin
      FFactSGuia.GeneraMovKardex;
      If Not xContinuaGrab Then
      Begin
      // Inicio HPC_201804_FAC
      // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
         Screen.Cursor := crDefault;
         If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
         If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
         DMFAC.cdsFact2.Post;
         FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
         exit;
      // Fin HPC_201804_FAC
      End;

      FFactSGuia.ActualizaSaldos1;
      If Not xContinuaGrab Then
      Begin
      // Inicio HPC_201804_FAC
      // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
         Screen.Cursor := crDefault;
         If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
         If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
         DMFAC.cdsFact2.Post;
         FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
         exit;
      // Fin HPC_201804_FAC
      End;
   End;

   If length(FFactSGuia.dblcdProf.Text) > 0 Then
   Begin
   // Inicio HPC_201801_FAC
   // Retiro de componente dblcdClie
      {
      xSQL := ' Update DB2ADMIN.FAC311 '
         + '       set PROFSIT=''ATENDIDO'' '
         + '     where CIAID=' + Quotedstr(FFactSGuia.dblcCia.Text)
         + '       and CLIEID=' + Quotedstr(FFactSGuia.dblcdClie.Text)
         + '       and PROFID=' + Quotedstr(FFactSGuia.dblcdProf.Text);
      }
      xSQL := ' Update DB2ADMIN.FAC311 '
         + '       set PROFSIT=''ATENDIDO'' '
         + '     where CIAID=' + Quotedstr(FFactSGuia.dblcCia.Text)
         + '       and CLIEID=' + Quotedstr(FFactSGuia.dblcdAso.Text)
         + '       and PROFID=' + Quotedstr(FFactSGuia.dblcdProf.Text);
   // Fin HPC_201801_FAC
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
      // Inicio HPC_201804_FAC
      // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
         Screen.Cursor := crDefault;
         If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
         If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Error al intentar actualizar Archivo de Proformas (cabecera)');
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
         DMFAC.cdsFact2.Post;
         FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
         exit;
      // Fin HPC_201804_FAC
      End;
   End;

// Si boleta fue Generada desde un Pago actualizar el Pago
   If DMFAC.cdsFact2.FieldByName('NUMDOCPAG').AsString <> '' Then
   Begin
      xSQL := 'Update DB2ADMIN.CXC_ING_VAR_SER '
         + '      set CIAFAC=''' + FFactSGuia.dblcCia.Text + ''', '
         + '          DOCID=''' + FFactSGuia.dblcTDoc.Text + ''', '
         + '          SERIE=''' + FFactSGuia.dblcSerie.Text + ''', '
         + '          NODOC=''' + FFactSGuia.dbeNFac.Text + ''', '
         + '          FECFAC=''' + FFactSGuia.dtpFFac.Text + ''', '
         + '          USUDOC=''' + DMFAC.wUsuario + ''', '
         + '          FECREGDOC=SYSDATE '
         + '    where DOCPAG=' + Quotedstr(DMFAC.cdsFact2.FieldByName('DOCPAG').AsString)
         + '      and NUMDOCPAG=' + Quotedstr(DMFAC.cdsFact2.FieldByName('NUMDOCPAG').AsString)
         + '      and NODOC IS NULL';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
      // Inicio HPC_201804_FAC
      // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
         Screen.Cursor := crDefault;
         If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
         If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('Documento de Pago ya fue Facturado por Otro Usuario');
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
         DMFAC.cdsFact2.Post;
         FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
         exit;
      // Fin HPC_201804_FAC
      End;
   End;

   If FFactSGuia.dblcTClie.Text = '01' Then
   Begin
   // Inicio HPC_201801_FAC
   // Retiro de componente dblcdClie
   //   xSQL := 'Select CLIEID from DB2ADMIN.TGE204 where CLIEID=''' + FFactSGuia.dblcdClie.Text + ''' ';
      xSQL := 'Select CLIEID from DB2ADMIN.TGE204 where CLIEID=''' + FFactSGuia.dblcdAso.Text + ''' ';
   // Fin HPC_201801_FAC
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      If DMFAC.cdsQry.RecordCount = 0 Then
      Begin
      // Eliminó si existe en CNT201
      // Inicio HPC_201801_FAC
      // Retiro de componente dblcdClie
      //   xSQL := 'Delete DB2ADMIN.CNT201 Where CLAUXID=''AS'' and AUXID=''' + FFactSGuia.dblcdClie.Text + ''' ';
         xSQL := 'Delete DB2ADMIN.CNT201 Where CLAUXID=''AS'' and AUXID=''' + FFactSGuia.dblcdAso.Text + ''' ';
      // Fin HPC_201801_FAC
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            Screen.Cursor := crDefault;
         End;

      // Inserto en CNT201
      // Inicio HPC_201801_FAC
      // Retiro de componente dblcdClie
         xSQL := ' Insert into DB2ADMIN.CNT201(AUXID, AUXNOMB, AUXABR, PAISID, AUXDIR, AUXCZIP, '
            + '                       AUXTELF,CLAUXID, PROVRETIGV, AUXDNI, ACTIVO) '
            + '    Select ASOID AUXID, ASOAPENOM AUXNOMB, '
            + '           substr(ASOAPEPAT||'' ''||ASONOMBRES,1,15) AUXABR, '
            + '           ''01'' PAISID, SUBSTR(TRIM(ASODIR),1,100) AUXDIR, ZIPID AUXCZIP, '
            + '           ASOTELF1 AUXTELF,'
            + '           ''AS'' CLAUXID, ''S'' PROVRETIGV, ASODNI AUXDNI, ''S'' ACTIVO '
            + '      from DB2ADMIN.APO201 '
      //      + '     where ASOID=''' + FFactSGuia.dblcdClie.Text + ''' ';
            + '     where ASOID=''' + FFactSGuia.dblcdAso.Text + ''' ';
      // Fin HPC_201801_FAC
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            Screen.Cursor := crDefault;
         // Inicio HPC_201804_FAC
         // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
            Screen.Cursor := crDefault;
            If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
            If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
            DMFAC.DCOM1.AppServer.RetornaTransaccion;
            DMFAC.cdsFact2.Edit;
            DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
            DMFAC.cdsFact2.Post;
            FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
            exit;
         // Fin HPC_201804_FAC
         End;

      // Inserto en TGE204
         xSQL := ' Insert into DB2ADMIN.TGE204(CLIEID, CLIERUC, PAISID, CLIEDIR, CLIEABR, CLIECZIP, '
            + '                       CLIETELF, CLAUXID, VEID, DPTOID,CIUDID, CIAID, ZONVTAID, '
            + '                       CLIEDES, CLIECODAUX, USEID, CLIECODMOD, TVTAID,FREG, HREG, '
            + '                       CLIEAPEPAT, CLIEAPEMAT, CLIENOMBRE,ACTIVO, TDOC_ID_SUNAT) '
            + '    Select ASOID CLIEID, ASODNI CLIERUC, ''01'' PAISID, '
            + '           substr(trim(ASODIR),1,100) CLIEDIR, '
            + '           substr(ASOAPEPAT||'' ''||ASONOMBRES,1,15) CLIEABR, ZIPID CLIECZIP,'
            + '           ASOTELF1 CLIETELF, ''AS'' CLAUXID, ''000'' VEID, DPTOID,CIUDID, '
            + '           ''02'' CIAID, ''01001'' ZONVTAID, ASOAPENOM CLIEDES,'
            + '           ASOCODAUX CLIECODAUX, USEID, ASOCODMOD CLIECODMOD,''01'' TVTAID, '
            + '           trunc(sysdate) FREG, sysdate HREG,ASOAPEPAT CLIEAPEPAT,'
            + '           ASOAPEMAT CLIEAPEMAT, ASONOMBRES CLIENOMBRE,''S'' ACTIVO, '
            + '           ''01'' TDOC_ID_SUNAT '
            + '      From DB2ADMIN.APO201 '
         // Inicio HPC_201801_FAC
         // Retiro de componente dblcdClie
         //   + '     Where ASOID=''' + FFactSGuia.dblcdClie.Text + ''' ';
            + '     Where ASOID=''' + FFactSGuia.dblcdAso.Text + ''' ';
         // Fin HPC_201801_FAC
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            Screen.Cursor := crDefault;
         // Inicio HPC_201804_FAC
         // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
            Screen.Cursor := crDefault;
            If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
            If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
            DMFAC.DCOM1.AppServer.RetornaTransaccion;
            DMFAC.cdsFact2.Edit;
            DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
            DMFAC.cdsFact2.Post;
            FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
            exit;
         // Fin HPC_201804_FAC
         End;
      End;
   End;

   If fg_EliminarCxC = False Then
   Begin
      Screen.Cursor := crDefault;
   // Inicio HPC_201804_FAC
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
      DMFAC.cdsFact2.Post;
      FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
      exit;
   // Fin HPC_201804_FAC
   End;

   If sTipoPago <> 'VC' Then
   Begin
      FFactSGuia.TransferenciaCxC(xsNumComprobante);
   End
   Else
   Begin
      FFactSGuia.TransferenciaCxC_VC(xsNumComprobante);
   End;

// Inicio HPC_201804_FAC
// 05/07/2018  Controla retorno de error luego de generar las Cuentas por Cobrar
   If Not xContinuaGrab Then
   Begin
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
      DMFAC.cdsFact2.Post;
      FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
      exit;
   End;
// Fin HPC_201804_FAC

//    FFactSGuia.TransferenciaCxC(xsNumComprobante);

// Inicio HPC_201804_FAC
// 05/07/2018 cambia campo de numero de factura por variable
// AQUI CONSISTENCIAR CUENTA POR COBRAR, TOTAL_DEBE DEBE SER IGUAL QUE TOTAL_HABER
   xsSql := 'Select sum(MONTOCAB) MONTOCAB, sum(DEBE) DEBE, sum(HABER) HABER '
      + '      from ( '
      + '            Select CCMTOORI MONTOCAB, 0.00 DEBE, 0.00 HABER from CXC301 '
      + '             where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
      + '               and CCANOMES=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
      + '               and DOCID=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString)
      + '               and CCSERIE=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString)
//      + '               and CCNODOC=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString)
      + '               and CCNODOC=' + QuotedStr(dbeNFacConf.Text)
      + '             union all '
      + '            Select 0.00 MONTOCAB, '
      + '                   sum(case when CCDH=''D'' then CCMTOORI else 0.00 end) DEBE, '
      + '                   sum(case when CCDH=''H'' then CCMTOORI else 0.00 end) HABER '
      + '              from DB2ADMIN.CXC302 '
      + '             where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByname('CIAID').AsString)
      + '               and CCANOMES=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
      + '               and DOCID=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString)
      + '               and CCSERIE=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString)
//      + '               and CCNODOC=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString)
      + '               and CCNODOC=' + QuotedStr(dbeNFacConf.Text)
      + '    ) ';
// Fin HPC_201804_FAC
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xsSql);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No generó correctamente la CXC, 1');
   // Inicio HPC_201804_FAC
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
      DMFAC.cdsFact2.Post;
      FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
      exit;
   // Fin HPC_201804_FAC
   End;
   If (DMFAC.cdsQry.FieldByName('DEBE').AsFloat = 0) Or
      (DMFAC.cdsQry.FieldByName('HABER').AsFloat = 0) Or
      (DMFAC.cdsQry.FieldByName('MONTOCAB').AsFloat = 0) Then
   Begin
      ShowMessage('No generó correctamente la CXC, 2');
   // Inicio HPC_201804_FAC
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
      DMFAC.cdsFact2.Post;
      FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
      exit;
   // Fin HPC_201804_FAC
   End;
   If ((DMFAC.cdsQry.FieldByName('DEBE').AsFloat - DMFAC.cdsQry.FieldByName('HABER').AsFloat) <> 0) Or
      (abs(DMFAC.cdsQry.FieldByName('DEBE').AsFloat - DMFAC.cdsQry.FieldByName('MONTOCAB').AsFloat) > 0.01) Then
   Begin
      ShowMessage('No generó correctamente la CXC, 3');
   // Inicio HPC_201804_FAC
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
      DMFAC.cdsFact2.Post;
      FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
      exit;
   // Fin HPC_201804_FAC
   End;

   If Not xContinuaGrab Then
   Begin
   // Inicio HPC_201804_FAC
   // 05/07/2018 Si hay errores retorna Factura a Estado Anterior
      Screen.Cursor := crDefault;
      If DMFAC.cdsFact2.Modified Then DMFAC.cdsFact2.CancelUpdates;
      If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then DMFAC.cdsDetFact2.CancelUpdates;
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('NFAC').AsString := wwNumFacAnt; //cNumFacAnt;
      DMFAC.cdsFact2.Post;
      FFactSGuia.dbeNFac.Text := wwNumFacAnt; //cNumFacAnt;
      exit;
   // Fin HPC_201804_FAC
   End;
   DMFAC.DCOM1.AppServer.GrabaTransaccion;
*)
// Fin HPC_201805_FAC

   FFactSGuia.SelecImpresDest;

   DMFAC.cdsFact2.Edit;
   DMFAC.cdsFact2.FieldByName('FACESTADO').AsString := 'ACEPTADO';
   DMFAC.cdsFact2.FieldByName('NFAC').AsString := dbeNFacConf.text;
   DMFAC.cdsFact2.Post;

// Inicio HPC_201804_FAC
// actualiza Nro. de Factura en pantalla principal
   FFactSGuia.dbeNFac.Text := DMFAC.cdsFact2.FieldByName('NFAC').AsString;
// Edit HPC_201804_FAC

   wSQL := 'CIAID =' + QuotedStr(FFactSGuia.dblcCia.Text)
      + ' and DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + ' and FACSERIE =' + QuotedStr(dblcSerieConf.Text)
      + ' and NFAC =' + QuotedStr(dbeNFacConf.Text)
      + ' Order by DFACITEM';
   Filtracds(DMFAC.cdsDetFact2, 'Select * from DB2ADMIN.FAC306 where ' + wSQL);

// Inicio FAC-201806
// 26/10/2018 cambia display de importes a 2 dígitos
   {
// Inicio HPC_201805_FAC
// Importes a 4 dígitos
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).EditFormat := '########0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).EditFormat := '########0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).EditFormat := '########0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).EditFormat := '########0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).EditFormat := '########0.0000';
// Fin HPC_201805_FAC
   }
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).EditFormat := '########0.00';

// 16/10/2018 retira actualización de filtro para evitar errores de filtro con dagtos de factura/boleta generada
{
   If DMFAC.wTipoAdicion = 'xFiltro' Then
   Begin
      DMFAC.ActualizaFiltro(GFactura, DMFAC.cdsFact2, 'M');
   End;
}
// Fin HPC_201806_FAC

   Screen.Cursor := crDefault;
   FFactSGuia.Label11.caption := 'Número Factura';
   FFactSGuia.btnActReg.Enabled := False;
   bbtnRegCanc.Click();

End;

// Inicio HPC_201801_FAC
// determina número máximo de factura
procedure TFFormaPago.NuevoNroDoc;
Var
   xSQL: String;
// Inicio HPC_201802_FAC
// variables para búsqueda de Nro calculado en todos los Estados
   xNroMaximo : String;
// Fin HPC_201802_FAC
begin
// Inicio HPC_201804_FAC
// 09/07/2018 Busca sin prefijo 'T' en la cabecera
   xSQL := 'Select nvl(max(NFAC),''0'') NUMERO from FAC305 '
      + '    where CIAID='+quotedstr(FFactSGuia.dblcCia.text)
      + '      and DOCID='+quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + '      and FACSERIE='+quotedstr(FFactSGuia.dblcSerie.Text)
   //   + '      and FACESTADO<>''INICIAL'' ';
      + '      and substr(NFAC,1,1)<>''T'' ';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount=0 then
      dbeNFacConf.Text := '0'
   Else
      dbeNFacConf.Text := DMFAC.cdsQry.FieldByName('NUMERO').AsString;

// Busca en cabecera de Cuentas por Cobrar
   xSQL := 'Select nvl(max(CCNODOC),''0'') NUMERO from CXC301 '
      + '    where CIAID='+quotedstr(FFactSGuia.dblcCia.text)
      + '      and DOCID='+quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + '      and CCSERIE='+quotedstr(FFactSGuia.dblcSerie.Text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount>0 then
   Begin
      If strtoint(DMFAC.cdsQry.FieldByName('NUMERO').AsString)>strtoint(dbeNFacConf.Text) Then
         dbeNFacConf.Text := DMFAC.cdsQry.FieldByName('NUMERO').AsString;
   End;

// Busca en dabecera de Cuentas por Cobrar
   xSQL := 'Select nvl(max(CCNODOC),''0'') NUMERO from CXC302 '
      + '    where CIAID='+quotedstr(FFactSGuia.dblcCia.text)
      + '      and DOCID='+quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + '      and CCSERIE='+quotedstr(FFactSGuia.dblcSerie.Text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount>0 then
   Begin
      If strtoint(DMFAC.cdsQry.FieldByName('NUMERO').AsString)>strtoint(dbeNFacConf.Text) Then
         dbeNFacConf.Text := DMFAC.cdsQry.FieldByName('NUMERO').AsString;
   End;
// Fin HPC_201804_FAC

   dbeNFacConf.Text := DMFAC.StrZero(IntToStr(StrToInt(dbeNFacConf.Text) + 1), DMFAC.wAnchoFact);

// Inicio HPC_201802_FAC
// 02/07/2018 Busca Número de Documento en archivo de Boletas y Facturas
   xNroMaximo := copy('999999999999', 1, DMFAC.wAnchoFact);
   While dbeNFacConf.Text<xNroMaximo Do
   Begin
      xSQL := 'Select NFAC NUMERO from DB2ADMIN.FAC305 '
         + '    where CIAID='+quotedstr(FFactSGuia.dblcCia.text)
         + '      and DOCID='+quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
         + '      and FACSERIE='+quotedstr(FFactSGuia.dblcSerie.Text)
         + '      and NFAC='+quotedstr(dbeNFacConf.Text);
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      If DMFAC.cdsQry.RecordCount=0 then
         Break;
      dbeNFacConf.Text := DMFAC.StrZero(IntToStr(StrToInt(dbeNFacConf.Text) + 1), DMFAC.wAnchoFact);
   End;
// Fin HPC_201802_FAC

end;
// Fin HPC_201801_FAC

End.

