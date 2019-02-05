Unit Fac270;

// Actualizaciones
// HPC_201604_FAC 19/10/2016 Cambio de Tabla de Saldos de Stock de LOG316 a LOG337 y LOG319

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Mask, wwdbedit, StdCtrls, Buttons, Wwdbdlg, wwdblook, ExtCtrls, dbCtrls,
   wwdbdatetimepicker, db, ComCtrls, Grids, Wwdbigrd, Wwdbgrid;

Type
   TFLPrecio = Class(TForm)
      pnlCabecera: TPanel;
      Label7: TLabel;
      Label8: TLabel;
      Label15: TLabel;
      Label16: TLabel;
      Label17: TLabel;
      Label18: TLabel;
      Label19: TLabel;
      Label26: TLabel;
      Label29: TLabel;
      Label30: TLabel;
      Bevel1: TBevel;
      Z2bbtnCancel: TBitBtn;
      gbUmg: TGroupBox;
      Label12: TLabel;
      Label25: TLabel;
      Label11: TLabel;
      dbePrecioG: TwwDBEdit;
      dbeUmg: TwwDBEdit;
      dbePrecioIGV: TwwDBEdit;
      gbUmu: TGroupBox;
      Label24: TLabel;
      Label27: TLabel;
      dbeUmu: TwwDBEdit;
      dbePrecioU: TwwDBEdit;
      pnl1: TPanel;
      Label14: TLabel;
      Label1: TLabel;
      dblcCia: TwwDBLookupCombo;
      dblcLPrecio: TwwDBLookupCombo;
      pnl3: TPanel;
      Label2: TLabel;
      Label5: TLabel;
      dblcdArticulo: TwwDBLookupComboDlg;
      dblcTMon: TwwDBLookupCombo;
      pnl2: TPanel;
      Label6: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      dblcTinid: TwwDBLookupCombo;
      dblcLinea: TwwDBLookupCombo;
      dblcFamilia: TwwDBLookupCombo;
      dbgStock: TwwDBGrid;
      Label20: TLabel;
      dbeCiaDes: TwwDBEdit;
      dbeTListaDes: TwwDBEdit;
      dbeTinDes: TwwDBEdit;
      dbeLineaDes: TwwDBEdit;
      dbeFamDes: TwwDBEdit;
      dbeArtDes: TwwDBEdit;
      dbeTMonDes: TwwDBEdit;
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Z2bbtnCancelClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dbeDsctoGExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbeDsctoUExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
      wModif: String;
      Procedure MuestraDetalle;
   Public
    { Public declarations }
      wContenido: boolean;
   End;

Var
   FLPrecio: TFLPrecio;
   xCrea: boolean;
Implementation

Uses FacDm, oaVe2000;

{$R *.DFM}

Procedure TFLPrecio.Z2bbtnCancelClick(Sender: TObject);
Begin
   close
End;

Procedure TFLPrecio.FormActivate(Sender: TObject);
Var
   xWhere: String;
   a, m, d: word;
Begin
   MuestraDetalle;
End;

Procedure TFLPrecio.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_Dialogkey, VK_TAB, 0);
   End;
End;

Procedure TFLPrecio.dbeDsctoGExit(Sender: TObject);
Var
   xWhere, xBase: String;
   xPinc, xPdsc, xPrecio: double;
   xPBaseG, xIncG, xDsctoG: double;
Begin
   If Not Z2bbtnCancel.focused Then
   Begin
      If xCrea Then Exit;

      xPinc := 0;
      xPDsc := 0;
      xWhere := 'TLISTAID=''' + dblcLPrecio.Text + '''';
      xBase := DMFAC.BuscaQry('dspTLista', 'FAC101', '*', xWhere, 'TLISTABASE');
      If xBase = 'S' Then
      Begin
         xPinc := xPBaseG * xIncG;
         xPDsc := xPBaseG * xDsctoG;
         xPrecio := (xPBaseG + xPinc) - xPDsc;
         DMFAC.cdsLPrecio.fieldbyname('LPREPREGMO').value := FRound(xPrecio, 15, 2);
      End
      Else
         If xBase = '' Then
         Begin
//           dbePrecioG.enabled := true;
           //dbePrecioG.setfocus;
         End;
{      if wcontenido then
         dbeUmU.setfocus
      else
          Z2bbtnOK.setfocus;}
   End;
End;

Procedure TFLPrecio.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
{   DMFAC.CdsLPreciO.CancelUpdates;
   DMFAC.cdsArticulo.Filtered := False;}
End;

Procedure TFLPrecio.dbeDsctoUExit(Sender: TObject);
Var
   xWhere, xBase: String;
   xPinc, xPdsc, xPrecio: real;
   xPBaseU, xIncU, xDsctoU: double;
Begin

   xPinc := 0;
   xPDsc := 0;
   xWhere := 'TLISTAID=''' + dblcLPrecio.Text + '''';
   xBase := DMFAC.BuscaQry('dspTLista', 'FAC101', '*', xWhere, 'TLISTABASE');
   If xBase = 'S' Then
   Begin
      xPinc := xPBaseU * xIncU;
      xPDsc := xPBaseU * xDsctoU;
      xPrecio := xPBaseU + xPinc - xPDsc;
      DMFAC.cdsLPrecio.fieldbyname('LPREPREUMO').value := FRound(xPrecio, 15, 2);
   End
   Else
      If xBase = '' Then
      Begin
//        dbePrecioU.enabled := true;
//        dbePrecioU.setfocus;
      End;
End;

Procedure TFLPrecio.MuestraDetalle;
Var
   xSQL, sAno, sMes: String;
   xAno, xMes, xDia: word;
Begin
   DecodeDate(DMFAC.DateS, xAno, xMes, xDia);
   sAno := IntToStr(xAno);
   sMes := DMFAC.StrZero(IntToStr(xMes), 2);

// actualiza Grid con Stocks de todos los almacenes de la Compañía
   xSQL := 'SELECT A.ALMID,B.ALMDES,A.ARTID,A.STKFIN STKSACTG '
      + 'FROM LOG319 A,TGE151 B'
      + ' WHERE A.CIAID=' + QuotedStr(dblcCia.Text)
      + ' AND A.TINID=' + QuotedStr(dblcTinId.Text)
      + ' AND A.ARTID=' + QuotedStr(dblcdArticulo.Text)
      + ' AND A.LOGANOMM=' + QuotedStr(sAno + sMes)
      + ' AND A.CIAID=B.CIAID AND A.ALMID = B.ALMID'
      + ' and B.TINID=A.TINID ';
   DMFAC.cdsQry4.Close;
   DMFAC.cdsQry4.IndexFieldNames := '';
   DMFAC.cdsQry4.Filter := '';
   DMFAC.cdsQry4.Filtered := False;
   DMFAC.cdsQry4.DataRequest(xSQL);
   DMFAC.cdsQry4.Open;

   dbgStock.Selected.Clear;
   dbgStock.Selected.Add('ALMID'#9'3'#9'Id'#9'F');
   dbgStock.Selected.Add('ALMDES'#9'20'#9'Almacén'#9'F');
   dbgStock.Selected.Add('STKSACTG'#9'15'#9'Saldo Act.'#9'F');
   dbgStock.DataSource := DMFAC.dsQry4;
   dbgStock.SetFocus;

End;

Procedure TFLPrecio.FormShow(Sender: TObject);
Begin
   DMFAC.AccesosUsuarios(DMFAC.wModulo, DMFAC.wUsuario, '2', Screen.ActiveForm.Name);
End;

End.

