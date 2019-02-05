Unit Fac110;

// Actualizaciones
// HPC_201507_FAC 24/11/2015 Entrega al área de Control de Calidad

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Mask, wwdbedit, Buttons, ExtCtrls, wwdbdatetimepicker;

Type
   TFTCambio = Class(TForm)
      lblTCambio: TLabel;
      bbtnCalc: TBitBtn;
      Panel1: TPanel;
      lblMontoMN: TLabel;
      dbeMontoMN: TwwDBEdit;
      lblMontoME: TLabel;
      dbeMontoME: TwwDBEdit;
      dtpFecha: TwwDBDateTimePicker;
      Procedure FormShow(Sender: TObject);
      Procedure dbeMontoMNExit(Sender: TObject);
      Procedure dbeMontoMEExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnCalcClick(Sender: TObject);
      Procedure dtpFechaExit(Sender: TObject);
      Procedure dtpFechaChange(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FTCambio: TFTCambio;
   wTCambio: double;

Implementation

{$R *.dfm}
Uses FACDM;

Procedure TFTCambio.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin
   DMFAC.AccesosUsuarios(DMFAC.wModulo, DMFAC.wUsuario, '2', Screen.ActiveForm.Name);
//   xSQL := 'Select TCAMVBC from TGE107 where FECHA=to_date(SYSDATE) '
// Armando dice que es T.Cambio Compra pero Isabel y Rosa dicen que es Venta
// el programa de facturación siempre ha estado tomando venta

   xSQL := 'Select TCAMVBV, FECHA from TGE107 where FECHA=to_date(SYSDATE) '
      + '   and TMONID=' + quotedstr(DMFAC.wTMonExt);
   DMFAC.cdsQry8.Close;
   DMFAC.cdsQry8.Filter := '';
   DMFAC.cdsQry8.Filtered := False;
   DMFAC.cdsQry8.IndexFieldNames := '';
   DMFAC.cdsQry8.DataRequest(xSQL);
   DMFAC.cdsQry8.Open;
   wTCambio := 1;
   If DMFAC.cdsQry8.RecordCount = 1 Then
   Begin

      dtpFecha.Date := DMFAC.cdsQry8.FieldByName('FECHA').AsDateTime;

      lblTCambio.Caption := 'Tipo de Cambio S/.' + FloatToStrF(DMFAC.cdsQry8.fieldByName('TCAMVBV').AsFloat, ffNumber, 15, 4);
      wTCambio := DMFAC.cdsQry8.fieldByName('TCAMVBV').AsFloat;
      lblMontoMN.Visible := True;
      lblMontoME.Visible := True;
      dbeMontoMN.Visible := True;
      dbeMontoME.Visible := True;
      xSQL := 'Select 0.00 MONTOMN, 0.00 MONTOME from TGE901';
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.Filter := '';
      DMFAC.cdsQry.Filtered := False;
      DMFAC.cdsQry.IndexFieldNames := '';
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      dbeMONTOMN.DataSource := DMFAC.dsQry;
      dbeMONTOMN.DataField := 'MONTOMN';
      dbeMONTOME.DataSource := DMFAC.dsQry;
      dbeMONTOME.DataField := 'MONTOME';
      dbeMONTOMN.SetFocus;
   End
   Else
   Begin
      lblTCambio.Caption := 'No hay Tipo de Cambio para Hoy';
      lblMontoMN.Visible := False;
      lblMontoME.Visible := False;
      dbeMontoMN.Visible := False;
      dbeMontoME.Visible := False;
   End;
End;

Procedure TFTCambio.dbeMontoMNExit(Sender: TObject);
Begin
   If bbtnCalc.Focused Then exit;
   If length(trim(dbeMontoMN.Text)) > 0 Then
      If DMFAC.cdsQry.FieldByName('MONTOMN').AsFloat > 0 Then
         DMFAC.cdsQry.FieldByName('MONTOME').AsFloat :=
            FRound(DMFAC.cdsQry.FieldByName('MONTOMN').AsFloat / wTCambio, 15, 2);
   If Not dtpFecha.Focused Then
      dbeMontoME.SetFocus;
End;

Procedure TFTCambio.dbeMontoMEExit(Sender: TObject);
Begin
   If bbtnCalc.Focused Then exit;
   If length(trim(dbeMontoME.Text)) > 0 Then
      If DMFAC.cdsQry.FieldByName('MONTOME').AsFloat > 0 Then
         DMFAC.cdsQry.FieldByName('MONTOMN').AsFloat :=
            FRound(DMFAC.cdsQry.FieldByName('MONTOME').AsFloat * wTCambio, 15, 2);
   If Not dtpFecha.Focused Then
      dbeMontoMN.SetFocus;
End;

Procedure TFTCambio.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.Filter := '';
   DMFAC.cdsQry.Filtered := False;
   DMFAC.cdsQry.IndexFieldNames := '';
   Action := CAFree;
End;

Procedure TFTCambio.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFTCambio.bbtnCalcClick(Sender: TObject);
Begin
   winexec('CALC.EXE', 1);
End;

Procedure TFTCambio.dtpFechaExit(Sender: TObject);
Var
   xSQL: String;
Begin
   Exit;
   If dtpFecha.Date = 0 Then Exit;

   xSQL := 'Select TCAMVBV, FECHA from TGE107 where FECHA=''' + DateToStr(dtpFecha.Date) + ''' '
      + ' and TMONID=' + quotedstr(DMFAC.wTMonExt);
   DMFAC.cdsQry8.Close;
   DMFAC.cdsQry8.Filter := '';
   DMFAC.cdsQry8.Filtered := False;
   DMFAC.cdsQry8.IndexFieldNames := '';
   DMFAC.cdsQry8.DataRequest(xSQL);
   DMFAC.cdsQry8.Open;
   wTCambio := 1;
   If DMFAC.cdsQry8.RecordCount = 1 Then
   Begin
      lblTCambio.Caption := 'Tipo de Cambio S/.' + FloatToStrF(DMFAC.cdsQry8.fieldByName('TCAMVBV').AsFloat, ffNumber, 15, 4);
      wTCambio := DMFAC.cdsQry8.fieldByName('TCAMVBV').AsFloat;
      lblMontoMN.Visible := True;
      lblMontoME.Visible := True;
      dbeMontoMN.Visible := True;
      dbeMontoME.Visible := True;
      xSQL := 'Select 0.00 MONTOMN, 0.00 MONTOME from TGE901';
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.Filter := '';
      DMFAC.cdsQry.Filtered := False;
      DMFAC.cdsQry.IndexFieldNames := '';
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      dbeMONTOMN.DataSource := DMFAC.dsQry;
      dbeMONTOMN.DataField := 'MONTOMN';
      dbeMONTOME.DataSource := DMFAC.dsQry;
      dbeMONTOME.DataField := 'MONTOME';
      dbeMONTOMN.SetFocus;
   End
   Else
   Begin
      lblTCambio.Caption := 'No hay Tipo de Cambio para Hoy';
      lblMontoMN.Visible := False;
      lblMontoME.Visible := False;
      dbeMontoMN.Visible := False;
      dbeMontoME.Visible := False;
   End;
End;

Procedure TFTCambio.dtpFechaChange(Sender: TObject);
Var
   xSQL: String;
Begin
   If dtpFecha.Date = 0 Then Exit;

   xSQL := 'Select TCAMVBV, FECHA from TGE107 where FECHA=''' + DateToStr(dtpFecha.Date) + ''' '
      + ' and TMONID=' + quotedstr(DMFAC.wTMonExt);
   DMFAC.cdsQry8.Close;
   DMFAC.cdsQry8.Filter := '';
   DMFAC.cdsQry8.Filtered := False;
   DMFAC.cdsQry8.IndexFieldNames := '';
   DMFAC.cdsQry8.DataRequest(xSQL);
   DMFAC.cdsQry8.Open;
   wTCambio := 1;
   If DMFAC.cdsQry8.RecordCount = 1 Then
   Begin
      lblTCambio.Caption := 'Tipo de Cambio S/.' + FloatToStrF(DMFAC.cdsQry8.fieldByName('TCAMVBV').AsFloat, ffNumber, 15, 4);
      wTCambio := DMFAC.cdsQry8.fieldByName('TCAMVBV').AsFloat;
      lblMontoMN.Visible := True;
      lblMontoME.Visible := True;
      dbeMontoMN.Visible := True;
      dbeMontoME.Visible := True;
      xSQL := 'Select 0.00 MONTOMN, 0.00 MONTOME from TGE901';
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.Filter := '';
      DMFAC.cdsQry.Filtered := False;
      DMFAC.cdsQry.IndexFieldNames := '';
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      dbeMONTOMN.DataSource := DMFAC.dsQry;
      dbeMONTOMN.DataField := 'MONTOMN';
      dbeMONTOME.DataSource := DMFAC.dsQry;
      dbeMONTOME.DataField := 'MONTOME';
      //dbeMONTOMN.SetFocus;
   End
   Else
   Begin
      lblTCambio.Caption := 'No hay Tipo de Cambio para Hoy';
      lblMontoMN.Visible := False;
      lblMontoME.Visible := False;
      dbeMontoMN.Visible := False;
      dbeMontoME.Visible := False;
   End;
End;

End.

