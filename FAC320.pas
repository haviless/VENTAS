unit FAC320;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Fac320
// FORMULARIO               : TFNCredito
// FECHA DE CREACION        : 05/07/2018
// AUTOR                    : Paúl Cabanillas
// OBJETIVO                 : Formulario para generar Nota de Crédito
//

// Actualizaciones:
// HPC_201805_FAC 03/09/2018 Actualiza display de detalle de comprobante


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, CheckLst, wwdblook, fcButton,
  fcImgBtn, fcShapeBtn, Wwdbdlg,



   Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit,
   Db, DBClient, wwclient, Wwdatsrc, wwdbdatetimepicker,
   DBTables, wwDialog, wwidlg;


type
  TFNCredito = class(TForm)
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dblcCia: TEdit;
    dblcSerie: TEdit;
    dblcNfac: TEdit;
    dblcNI: TEdit;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label1: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dblcTotPa: TComboBox;
    dblcTipNC: TwwDBLookupCombo;
    dblcTdoc: TEdit;
    sbtnGenerar: TfcShapeBtn;
    sbtnCancelar: TfcShapeBtn;
    cbDevMerca: TCheckBox;
    edtTipoNC: TEdit;
    dblcdNisa: TwwDBLookupComboDlg;
    dbgDetalleNIngreso: TwwDBGrid;
    Panel1: TPanel;
    dblcMntPa: TEdit;
    Label2: TLabel;
    dblcTdocdes: TEdit;
    dblcClieDes: TEdit;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure FormCreate(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnGenerarClick(Sender: TObject);
    procedure GeneraTxtFactElec;
    procedure sbtnCancelarClick(Sender: TObject);
    procedure cbDevMercaExit(Sender: TObject);
    procedure cbDevMercaClick(Sender: TObject);
    procedure dblcTipNCExit(Sender: TObject);
    procedure dblcdNisaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdNisaCloseDialog(Dialog: TwwLookupDlg);
    procedure dblcTotPaExit(Sender: TObject);
    procedure dblcTotPaClick(Sender: TObject);
    procedure dblcTipNCClick(Sender: TObject);
    procedure dblcTipNCChange(Sender: TObject);
 // Inicio HPC_201805_FAC
 // 03/09/2018 Actualiza display de detalle de comprobante
    procedure MuestraDetalleNC;
 // Fin HPC_201805_FAC
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNCredito: TFNCredito;
//
  wIP_Impresora : String;
  xImpdefault   : String;
  wId_Rutadest  : String;
  xTienda  : String;
  xPVenta  : String;
  xEnvioSunat : String;
  xSQL : String;
  xTindId : String;
  xTotalComp : Double;

implementation

{$R *.dfm}

Uses FacDM, Fac370, oaVE2000, Fac700;



Procedure TFNCredito.FormCreate(Sender: TObject);
Begin

// Cargando Tipo de Nota de Crédito
//   DMFAC.cdsQry14.close;
//   DMFAC.cdsQry14.DataRequest('Select TIP_NC_COD, TIP_NC_DES from db2admin.SUNAT_CAT_09 order by TIP_NC_COD');
//   DMFAC.cdsQry14.Open;
//   dblcTipNC.LookupTable := DMFAC.cdsQry14;
//   dblcTipNC.LookupField := 'TIP_NC_COD';
//   dblcTipNC.Selected.Clear;
//   dblcTipNC.Selected.Add('TIP_NC_COD'#9'10'#9'Tipo N/C'#9'F');
//   dblcTipNC.Selected.Add('TIP_NC_DES'#9'30'#9'Descripción'#9'F');

End;

Procedure TFNCredito.FormShow(Sender: TObject);
Var
   x_Usuario  : String;

begin
   xEnvioSunat := '';
// Pintando Variables
   dblcCia.Text    :=   GFactura.FMant.cds2.FieldByName('CIAID').AsString;
   dblcTdoc.Text   :=   GFactura.FMant.cds2.FieldByName('DOCID').AsString;
   If dblcTdoc.Text = '24' Then dblcTdocdes.Text := 'Factura' ;
   If dblcTdoc.Text = '25' Then dblcTdocdes.Text := 'Boleta' ;
   If dblcTdoc.Text = '27' Then dblcTdocdes.Text := 'Nota de Crédito' ;
   If dblcTdoc.Text = '26' Then dblcTdocdes.Text := 'Nota de Débito' ;
   dblcSerie.Text   :=   GFactura.FMant.cds2.FieldByName('FACSERIE').AsString;
   dblcNfac.Text    :=   GFactura.FMant.cds2.FieldByName('NFAC').AsString;
   dblcClieDes.Text :=   GFactura.FMant.cds2.FieldByName('CLIEDES').AsString;
   xTotalComp       :=   GFactura.FMant.cds2.FieldByName('FACTOTMO').AsFloat;
   xTindId          :=   GFactura.FMant.cds2.FieldByName('TINID').AsString;
   x_Usuario        :=   DMFAC.wUsuario;


// Cargando Tipo de Nota de Crédito
   DMFAC.cdsQry14.close;
   DMFAC.cdsQry14.DataRequest('Select TIP_NC_COD, TIP_NC_DES from db2admin.SUNAT_CAT_09 order by TIP_NC_COD');
   DMFAC.cdsQry14.Open;
   dblcTipNC.LookupTable := DMFAC.cdsQry14;
   dblcTipNC.LookupField := 'TIP_NC_COD';
   dblcTipNC.Selected.Clear;
   dblcTipNC.Selected.Add('TIP_NC_COD'#9'10'#9'Tipo N/C'#9'F');
   dblcTipNC.Selected.Add('TIP_NC_DES'#9'30'#9'Descripción'#9'F');
//
 // Inicio HPC_201805_FAC
 // 03/09/2018 Actualiza display de detalle de comprobante
//   If  (dblcCia.Text = '04') and (xTindId = '20') Then
   If ((FNCredito.dblcCia.text='04') and (xTindId = '20')) or
      ((FNCredito.dblcCia.text='21') and (xTindId = '26')) Then

   begin
       cbDevMerca.Checked := True;
       dblcdNisa.Enabled    := True;
       dblcdNisa.SetFocus;
   end
   else
   begin
       cbDevMerca.Checked := False;
       dblcdNisa.Enabled    := False;
       MuestraDetalleNC;
   end;

//   dbgDetalleNIngreso.Visible := False;
 // Fin HPC_201805_FAC
end;


procedure TFNCredito.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;



procedure TFNCredito.FormActivate(Sender: TObject);
begin
// Cargando Tipo de Nota de Crédito
//   DMFAC.cdsQry14.close;
//   DMFAC.cdsQry14.DataRequest('Select TIP_NC_COD, TIP_NC_DES from db2admin.SUNAT_CAT_09 order by TIP_NC_COD');
//   DMFAC.cdsQry14.Open;
//   dblcTipNC.LookupTable := DMFAC.cdsQry14;
//   dblcTipNC.LookupField := 'TIP_NC_COD';
//   dblcTipNC.Selected.Clear;
//   dblcTipNC.Selected.Add('TIP_NC_COD'#9'10'#9'Tipo N/C'#9'F');
//   dblcTipNC.Selected.Add('TIP_NC_DES'#9'30'#9'Descripción'#9'F');

end;

procedure TFNCredito.sbtnGenerarClick(Sender: TObject);
begin
      If length(dblcTipNC.text) = 0 Then
      Begin
         dblcTipNC.SetFocus;
         Raise Exception.Create('Ingrese Motivo de Nota de Crédito');
      End;
      //
      If MessageDlg('¿Seguro de Generar Nota de Crédito ?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
      Begin
      //pnlImprDest.visible := False;
          xEnvioSunat := '';
          If (copy(dblcSerie.Text,1,1) = 'B') or (copy(dblcSerie.Text,1,1) = 'F') Then
             GeneraTxtFactElec
          Else
          begin
             xEnvioSunat := '1';
             ShowMessage('Comprobante de Referencia Manual... Utilice Opción Anterior!');
          End;

//      if xSigueGrab then
//         ShowMessage(' Registro  Aceptado ');

          If xEnvioSunat <> '1' Then
             ShowMessage('Comprobante Electrónico fue Enviado a Sunat');
             exit;
      End;
//
end;

procedure TFNCredito.GeneraTxtFactElec;
var
   xItemIn: String;
   xfArchivoTexto: TextFile;
   xsNombreTxt, xCarpeta, xsClave, xTDocSunat : String;
   v_ciaid_sal, v_docid_sal, v_serie_sal, v_nodoc_sal, v_cod_error, v_des_error, v_cbDevMerca : String;
begin

 Begin
      If  cbDevMerca.Checked = True Then
          v_cbDevMerca := 'S'
      else
          v_cbDevMerca := 'N';
      // Dispara Procedimiento para generar NC
      DMFAC.DCOM1.AppServer.IniciaTransaccion;
      xSQL :=  ' Declare v_err_num varchar2(20); v_err_msg varchar2(500);'
           +   ' Begin db2admin.SP_FAC_FE_GEN_NC('
           + QuotedStr(dblcCia.Text)   + ','
           + QuotedStr(dblcTdoc.Text)  + ','
           + QuotedStr(dblcSerie.Text) + ','
           + QuotedStr(dblcNfac.Text)   + ','
           + QuotedStr(v_cbDevMerca)  + ','
           + QuotedStr(dblcdNisa.Text)   + ','
           + QuotedStr(dblcTotPa.Text)   + ','
           + QuotedStr(dblcMntPa.Text)   + ','
           + QuotedStr(dblcTipNC.Text)   + ','
           + QuotedStr(DMFAC.wUsuario) + ','
           + 'v_err_num, v_err_msg); End;' ;
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo generar Nota de Crédito');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         xEnvioSunat := '1';
         exit;
      End;
   End;

   // Valida Respuesta en LOG

   // Determina el ültimo Item del LOG
   xSQL :=  ' Select MAX(ITEM_IN) ITEM '
         +  ' From  db2admin.FAC_FE_GEN_LOG '
         +  ' Where CIAID_IN = ' + QuotedStr(dblcCia.Text)
         +  '   And DOCID_IN = ' + QuotedStr(dblcTdoc.Text)
         +  '   And SERIE_IN = ' + QuotedStr(dblcSerie.Text)
         +  '   And NODOC_IN = ' + QuotedStr(dblcNfac.Text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   xItemIn := DMFAC.cdsQry.FieldByName('ITEM').AsString;

   // Determina Código de Error
   xSQL :=  ' Select COD_ERROR, substr(DES_ERROR,1,80) DES_ERROR, CIAID_SAL, DOCID_SAL, SERIE_SAL, NODOC_SAL'
         +  ' From  db2admin.FAC_FE_GEN_LOG '
         +  ' Where CIAID_IN = ' + QuotedStr(dblcCia.Text)
         +  '   And DOCID_IN = ' + QuotedStr(dblcTdoc.Text)
         +  '   And SERIE_IN = ' + QuotedStr(dblcSerie.Text)
         +  '   And NODOC_IN = ' + QuotedStr(dblcNfac.Text)
         +  '   And ITEM_IN  = ' + QuotedStr(xItemIn);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   v_cod_error := DMFAC.cdsQry.FieldByName('COD_ERROR').AsString;
   v_des_error := DMFAC.cdsQry.FieldByName('DES_ERROR').AsString;
   v_ciaid_sal := DMFAC.cdsQry.FieldByName('CIAID_SAL').AsString;
   v_docid_sal := DMFAC.cdsQry.FieldByName('DOCID_SAL').AsString;
   v_serie_sal := DMFAC.cdsQry.FieldByName('SERIE_SAL').AsString;
   v_nodoc_sal := DMFAC.cdsQry.FieldByName('NODOC_SAL').AsString;


   If v_cod_error = '00' then
   Begin
      // Resolviendo Tienda / Id Impresora
      wIP_Impresora := '';
      xSQL := 'Select TIE_ID, PVTA_ID '
            + '  From db2admin.fac103 t '
            + '  Where CIAID   = ' + QuotedStr(dblcCia.Text)
            + '   And  DOCID   = ' + QuotedStr(dblcTdoc.Text)
            + '   And  SERIEID = ' + QuotedStr(dblcSerie.Text);

      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;

      xTienda := DMFAC.cdsQry.FieldByName('TIE_ID').AsString;
      xPVenta := DMFAC.cdsQry.FieldByName('PVTA_ID').AsString;

      // Resolviendo Impresora de Destino(Default)
      xSQL := 'Select T.IMP_ID, T.IMP_DES, T.IMP_IP, T.IMP_RUTAID '
            + '  From db2admin.FAC_FE_IMPR t, DB2ADMIN.FAC_FE_PVTA r '
            + '  Where r.CIAID   = ' + QuotedStr(dblcCia.Text)
            + '   And  r.TIE_ID  = ' + QuotedStr(xTienda)
            + '   And  r.PVTA_ID = ' + QuotedStr(xPVenta)
            + '   And  t.IMP_ID  = r.IMP_ID '
            + '   And  nvl(t.IMP_ACTIVO,''N'')=''S'' ' ;
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      xImpdefault   := DMFAC.cdsQry.FieldByName('IMP_DES').AsString;
      wIP_Impresora := DMFAC.cdsQry.FieldByName('IMP_IP').AsString;
      wId_Rutadest  := DMFAC.cdsQry.FieldByName('IMP_RUTAID').AsString;

      if DMFAC.DCOM1.AppServer.GenTxtFAC(v_ciaid_sal, v_docid_sal, v_serie_sal, v_nodoc_sal, wId_Rutadest)='OK' then
      Begin
         xEnvioSunat := '' ;
         ShowMessage('Nota de Crédito Electrónica se generó correctamente : '+v_serie_sal +'-'+ v_nodoc_sal);
      End
      Else
      Begin
   // Inicio HPC_201805_FAC
   // 03/09/2018 Actualiza display de detalle de comprobante
         ShowMessage('Archivo TXT  para NC : ' +v_serie_sal +'-'+ v_nodoc_sal + ' NO se Generó! ' + chr(13)
                     +'Por favor REENVIE comprobante desde  Módulo CXC');
   // Fin HPC_201805_FAC
         Exit;
      End;

   End
   Else
   Begin
      xEnvioSunat := '1';
      ShowMessage('Error en Proceso : '+v_cod_error +'-'+ v_des_error);
      Exit;
   End;
end;


procedure TFNCredito.sbtnCancelarClick(Sender: TObject);
begin
   Screen.Cursor := crDefault;
   Close;
end;

procedure TFNCredito.cbDevMercaExit(Sender: TObject);
begin
   If  cbDevMerca.Checked = True Then
   begin
       dblcdNisa.Enabled    := True;
       Label5.Enabled       := True;
       dblcdNisa.SetFocus;
   end
   else
   begin
       dblcdNisa.Enabled    := False;
       Label5.Enabled       := False;

       If  (dblcCia.Text = '04') and (xTindId = '00') Then
       begin
           Label6.Enabled       := False;
           dblcTotPa.Enabled    := False;
           dblcTipNC.SetFocus;
       end
       else
       begin
           Label6.Enabled       := True;
           dblcTotPa.Enabled    := True;
           dblcTotPa.SetFocus;
       end;
   end;
end;

procedure TFNCredito.cbDevMercaClick(Sender: TObject);
begin
   If  cbDevMerca.Checked = True Then
   begin
       dblcdNisa.Enabled    := True;
       Label5.Enabled       := True;
       Label6.Enabled       := False;
       dblcTotPa.Enabled    := False;
       dblcMntPa.Enabled    := False;
       dblcdNisa.SetFocus;
//////////////////
      sSQL := 'Select LOG314.NISAID, LOG314.NISAFREG FECHA, LOG314.NISANDOC DOC_REFER, LOG314.DOCID, '
            + '       LOG314.NISNPED PEDIDO, LOG314.TDAID, '
            + '       TGE157.TDADES, round(sum(nvl(LOG315.ARTPCG*LOG315.KDXCNTG,0)),2) MONTODEV '
            + '  from LOG314, TGE157, TGE208, LOG315 '
            + ' where TGE157.TDAID(+)=LOG314.TDAID '
            + '   and LOG314.CIAID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('CIAID').AsString)
            + '   and LOG314.NISATIP=''INGRESO'' '
            + '   and LOG314.CLIEID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('CLIEID').AsString)
            + '   and NVL(LOG314.FLAGNC,''XX'')<>''P'' '
            + '   and NVL(LOG314.FLAGNC,''XX'')<>''I'' '
            + '   and TGE208.TRISGT=''I'' '
            + '   and TGE208.TRIDEVFACT=''S'' '
            + '   and LOG314.TRIID=TGE208.TRIID'
            + '   and LOG315.CIAID=LOG314.CIAID and LOG315.NISATIP=LOG314.NISATIP '
            + '   and LOG315.NISAID=LOG314.NISAID '
            + ' group by LOG314.NISAID, LOG314.NISAFREG, LOG314.NISANDOC, LOG314.DOCID,'
            + '          LOG314.NISNPED, LOG314.TDAID, TGE157.TDADES ';
      DMFAC.cdsQry3.Close;
      DMFAC.cdsQry3.DataRequest(sSQL);
      DMFAC.cdsQry3.Open;
      dblcdNisa.LookupTable := DMFAC.cdsQry3;
      dblcdNisa.LookupField := 'NISAID';
      dblcdNisa.Selected.Clear;
      dblcdNisa.Selected.Add('NISAID'#9'10'#9'Nota~Ingreso'#9'F');
      dblcdNisa.Selected.Add('FECHA'#9'10'#9'Fecha'#9'F');
      dblcdNisa.Selected.Add('DOC_REFER'#9'12'#9'Doc. Referen.'#9'F');
      dblcdNisa.Selected.Add('TDAID'#9'7'#9'Tipo Doc~Almacén'#9'F');
      dblcdNisa.Selected.Add('TDADES'#9'15'#9'Descripción'#9'F');
      dblcdNisa.Text := '';

//////////////////
   end
   else
   begin
       dblcdNisa.Enabled    := False;
       Label5.Enabled       := False;
       Label6.Enabled       := True;
       dblcTotPa.Enabled    := True;
       dblcMntPa.Text    := '';
       dblcdNisa.Text    := '';
    // Inicio HPC_201805_FAC
    // 03/09/2018 Actualiza display de detalle de comprobante
       //dbgDetalleNIngreso.Visible := False;
    // Fin HPC_201805_FAC
       //dblcdNisa.SetFocus;
   end;
end;

procedure TFNCredito.dblcTipNCExit(Sender: TObject);
begin
   If length(dblcTipNC.text) = 0 Then
   Begin
      dblcTipNC.SetFocus;
      Raise Exception.Create('Ingrese Motivo para Nota de Crédito');
   End;
   edtTipoNC.Text := DMFAC.cdsQry14.FieldByName('TIP_NC_DES').AsString;
   sbtnGenerar.SetFocus;
end;

procedure TFNCredito.dblcdNisaExit(Sender: TObject);
begin
 //  dblcTipNC.SetFocus;
end;

procedure TFNCredito.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
   Begin
      If self.ActiveControl Is TDBMemo Then Exit;
      If self.ActiveControl Is TMemo Then Exit;
      Key := #0;
      Perform(CM_DialogKey, VK_TAB, 0);
   End;
end;

procedure TFNCredito.dblcdNisaCloseDialog(Dialog: TwwLookupDlg);
Var
   xTotal : double;
begin
// Inicio HPC_201805_FAC
// 03/09/2018 Actualiza display de detalle de comprobante
   If ((FNCredito.dblcCia.text='04') and (xTindId = '20')) or
      ((FNCredito.dblcCia.text='21') and (xTindId = '26')) Then
   Begin
      xSQL := 'Select LOG315.ARTID, TGE205.ARTDES, LOG315.KDXCNTG, FAC306.DFACVTOTMO '
         + '     from DB2ADMIN.LOG315, DB2ADMIN.TGE205, DB2ADMIN.FAC306 '
         + '    where LOG315.CIAID='+quotedstr(FNCredito.dblcCia.text)
         + '      and LOG315.NISATIP=''INGRESO'' '
         + '      and LOG315.NISAID='+quotedstr(DMFAC.cdsQry3.FieldByName('NISAID').AsString)
         + '      and TGE205.CIAID=LOG315.CIAID and TGE205.ARTID=LOG315.ARTID '
         + '      and FAC306.CIAID=LOG315.CIAID '
         + '         and FAC306.DOCID='+quotedstr(FNCredito.dblcTdoc.Text)
         + '         and FAC306.FACSERIE='+quotedstr(FNCredito.dblcSerie.Text)
         + '         and FAC306.NFAC='+quotedstr(FNCredito.dblcNfac.Text)
         + '         and FAC306.ARTID=LOG315.ARTID';
      DMFAC.cdsQry4.Close;
      DMFAC.cdsQry4.DataRequest(xSQL);
      DMFAC.cdsQry4.Open;

      xTotal := 0;
      DMFAC.cdsQry4.First;
      While not DMFAC.cdsQry4.EOF do
      Begin
         xTotal := xTotal + DMFAC.cdsQry4.FieldByName('DFACVTOTMO').AsFloat;
         DMFAC.cdsQry4.Next;
      End;

      dbgDetalleNIngreso.Visible := True;
      dbgDetalleNIngreso.DataSource := DMFAC.dsQry4;
      dbgDetalleNIngreso.Selected.Clear;
      dbgDetalleNIngreso.Selected.Add('ARTID'#9'10'#9'Artículo'#9'F');
      dbgDetalleNIngreso.Selected.Add('ARTDES'#9'50'#9'Descripción'#9'F');
      dbgDetalleNIngreso.Selected.Add('KDXCNTG'#9'10'#9'Cantidad'#9'F');
      dbgDetalleNIngreso.Selected.Add('DFACVTOTMO'#9'12'#9'Precio'#9'F');
      dbgDetalleNIngreso.ApplySelected;

      TNumericField(DMFAC.cdsQry4.FieldByName('DFACVTOTMO')).DisplayFormat := '######,##0.00';
      dbgDetalleNIngreso.ColumnByName('ARTDES').FooterValue:='Total NC : ';
      dbgDetalleNIngreso.ColumnByName('DFACVTOTMO').FooterValue:=floattostrf(xTotal, ffNumber, 10, 2);
      dbgDetalleNIngreso.ApplySelected;

      If xTotal < xTotalComp Then
      begin
         dblcTotPa.Text := 'P' ;
         dblcMntPa.Text :=  FloatToStr(xTotal);
      end
      else
         dblcTotPa.Text := 'T';
   End
   Else
   Begin
      xSQL := 'Select ARTID, ARTDES, DFACCANTG, DFACVTOTMO'
         + '     from DB2ADMIN.FAC306 '
         + '    where FAC306.CIAID='+quotedstr(FNCredito.dblcCia.text)
         + '      and FAC306.DOCID='+quotedstr(FNCredito.dblcTdoc.Text)
         + '      and FAC306.FACSERIE='+quotedstr(FNCredito.dblcSerie.Text)
         + '      and FAC306.NFAC='+quotedstr(FNCredito.dblcNfac.Text);

      DMFAC.cdsQry4.Close;
      DMFAC.cdsQry4.DataRequest(xSQL);
      DMFAC.cdsQry4.Open;

      xTotal := 0;
      DMFAC.cdsQry4.First;
      While not DMFAC.cdsQry4.EOF do
      Begin
         xTotal := xTotal + DMFAC.cdsQry4.FieldByName('DFACVTOTMO').AsFloat;
         DMFAC.cdsQry4.Next;
      End;

      dbgDetalleNIngreso.Visible := True;
      dbgDetalleNIngreso.DataSource := DMFAC.dsQry4;
      dbgDetalleNIngreso.Selected.Clear;
      dbgDetalleNIngreso.Selected.Add('ARTID'#9'10'#9'Artículo'#9'F');
      dbgDetalleNIngreso.Selected.Add('ARTDES'#9'50'#9'Descripción'#9'F');
      dbgDetalleNIngreso.Selected.Add('DFACCANTG'#9'10'#9'Cantidad'#9'F');
      dbgDetalleNIngreso.Selected.Add('DFACVTOTMO'#9'12'#9'Precio'#9'F');
      dbgDetalleNIngreso.ApplySelected;

      TNumericField(DMFAC.cdsQry4.FieldByName('DFACVTOTMO')).DisplayFormat := '######,##0.00';
      dbgDetalleNIngreso.ColumnByName('ARTDES').FooterValue:='Total NC : ';
      dbgDetalleNIngreso.ColumnByName('DFACVTOTMO').FooterValue:=floattostrf(xTotal, ffNumber, 10, 2);
      dbgDetalleNIngreso.ApplySelected;

      If xTotal < xTotalComp Then
      begin
         dblcTotPa.Text := 'P' ;
         dblcMntPa.Text :=  FloatToStr(xTotal);
      end
      else
      begin
         dblcTotPa.Text := 'T';
      End;
   End;
// Fin HPC_201805_FAC
End;

procedure TFNCredito.dblcTotPaExit(Sender: TObject);
begin
   If  dblcTotPa.Text = 'P' Then
   begin
       dblcMntPa.Enabled    := True;
       dblcMntPa.SetFocus;
   end
   else
   begin
       dblcMntPa.Enabled    := False;
       dblcTipNC.SetFocus;
   end;
end;

procedure TFNCredito.dblcTotPaClick(Sender: TObject);
begin
   If  dblcTotPa.Text = 'P' Then
   begin
       dblcMntPa.Enabled    := True;
       dblcMntPa.SetFocus;
   end
   else
   begin
       dblcMntPa.Enabled    := False;
       dblcTipNC.SetFocus;
   end;
end;

procedure TFNCredito.dblcTipNCClick(Sender: TObject);
begin
   If length(dblcTipNC.text) = 0 Then
   Begin
      dblcTipNC.SetFocus;
      Raise Exception.Create('Ingrese Motivo para Nota de Crédito');
   End;
   edtTipoNC.Text := DMFAC.cdsQry14.FieldByName('TIP_NC_DES').AsString;
   sbtnGenerar.SetFocus;
end;

procedure TFNCredito.dblcTipNCChange(Sender: TObject);
begin
   If length(dblcTipNC.text) = 0 Then
   Begin
      dblcTipNC.SetFocus;
      Raise Exception.Create('Ingrese Motivo para Nota de Crédito');
   End;
   edtTipoNC.Text := DMFAC.cdsQry14.FieldByName('TIP_NC_DES').AsString;
   sbtnGenerar.SetFocus;
end;

// Inicio HPC_201805_FAC
// 03/09/2018 Actualiza display de detalle de comprobante
procedure TFNCredito.MuestraDetalleNC;
Var
   xTotal : double;
begin
   If ((FNCredito.dblcCia.text='04') and (xTindId = '20')) or
      ((FNCredito.dblcCia.text='21') and (xTindId = '26')) Then
   Begin
      xSQL := 'Select LOG315.ARTID, TGE205.ARTDES, LOG315.KDXCNTG, FAC306.DFACVTOTMO '
         + '     from DB2ADMIN.LOG315, DB2ADMIN.TGE205, DB2ADMIN.FAC306 '
         + '    where LOG315.CIAID='+quotedstr(FNCredito.dblcCia.text)
         + '      and LOG315.NISATIP=''INGRESO'' '
         + '      and LOG315.NISAID='+quotedstr(DMFAC.cdsQry3.FieldByName('NISAID').AsString)
         + '      and TGE205.CIAID=LOG315.CIAID and TGE205.ARTID=LOG315.ARTID '
         + '      and FAC306.CIAID=LOG315.CIAID '
         + '         and FAC306.DOCID='+quotedstr(FNCredito.dblcTdoc.Text)
         + '         and FAC306.FACSERIE='+quotedstr(FNCredito.dblcSerie.Text)
         + '         and FAC306.NFAC='+quotedstr(FNCredito.dblcNfac.Text)
         + '         and FAC306.ARTID=LOG315.ARTID';
      DMFAC.cdsQry4.Close;
      DMFAC.cdsQry4.DataRequest(xSQL);
      DMFAC.cdsQry4.Open;

      xTotal := 0;
      DMFAC.cdsQry4.First;
      While not DMFAC.cdsQry4.EOF do
      Begin
         xTotal := xTotal + DMFAC.cdsQry4.FieldByName('DFACVTOTMO').AsFloat;
         DMFAC.cdsQry4.Next;
      End;

      dbgDetalleNIngreso.Visible := True;
      dbgDetalleNIngreso.DataSource := DMFAC.dsQry4;
      dbgDetalleNIngreso.Selected.Clear;
      dbgDetalleNIngreso.Selected.Add('ARTID'#9'10'#9'Artículo'#9'F');
      dbgDetalleNIngreso.Selected.Add('ARTDES'#9'50'#9'Descripción'#9'F');
      dbgDetalleNIngreso.Selected.Add('KDXCNTG'#9'10'#9'Cantidad'#9'F');
      dbgDetalleNIngreso.Selected.Add('DFACVTOTMO'#9'12'#9'Precio'#9'F');
      dbgDetalleNIngreso.ApplySelected;

      TNumericField(DMFAC.cdsQry4.FieldByName('DFACVTOTMO')).DisplayFormat := '######,##0.00';
      dbgDetalleNIngreso.ColumnByName('ARTDES').FooterValue:='Total NC : ';
      dbgDetalleNIngreso.ColumnByName('DFACVTOTMO').FooterValue:=floattostrf(xTotal, ffNumber, 10, 2);
      dbgDetalleNIngreso.ApplySelected;

      If xTotal < xTotalComp Then
      begin
         dblcTotPa.Text := 'P' ;
         dblcMntPa.Text :=  FloatToStr(xTotal);
      end
      else
         dblcTotPa.Text := 'T';
   End
   Else
      xSQL := 'Select ARTID, ARTDES, DFACCANTG, DFACVTOTMO'
         + '     from DB2ADMIN.FAC306 '
         + '    where FAC306.CIAID='+quotedstr(FNCredito.dblcCia.text)
         + '      and FAC306.DOCID='+quotedstr(FNCredito.dblcTdoc.Text)
         + '      and FAC306.FACSERIE='+quotedstr(FNCredito.dblcSerie.Text)
         + '      and FAC306.NFAC='+quotedstr(FNCredito.dblcNfac.Text);

      DMFAC.cdsQry4.Close;
      DMFAC.cdsQry4.DataRequest(xSQL);
      DMFAC.cdsQry4.Open;

      xTotal := 0;
      DMFAC.cdsQry4.First;
      While not DMFAC.cdsQry4.EOF do
      Begin
         xTotal := xTotal + DMFAC.cdsQry4.FieldByName('DFACVTOTMO').AsFloat;
         DMFAC.cdsQry4.Next;
      End;

      dbgDetalleNIngreso.Visible := True;
      dbgDetalleNIngreso.DataSource := DMFAC.dsQry4;
      dbgDetalleNIngreso.Selected.Clear;
      dbgDetalleNIngreso.Selected.Add('ARTID'#9'10'#9'Artículo'#9'F');
      dbgDetalleNIngreso.Selected.Add('ARTDES'#9'50'#9'Descripción'#9'F');
      dbgDetalleNIngreso.Selected.Add('DFACCANTG'#9'10'#9'Cantidad'#9'F');
      dbgDetalleNIngreso.Selected.Add('DFACVTOTMO'#9'12'#9'Precio'#9'F');
      dbgDetalleNIngreso.ApplySelected;

      TNumericField(DMFAC.cdsQry4.FieldByName('DFACVTOTMO')).DisplayFormat := '######,##0.00';
      dbgDetalleNIngreso.ColumnByName('ARTDES').FooterValue:='Total NC : ';
      dbgDetalleNIngreso.ColumnByName('DFACVTOTMO').FooterValue:=floattostrf(xTotal, ffNumber, 10, 2);
      dbgDetalleNIngreso.ApplySelected;

      If xTotal < xTotalComp Then
      begin
         dblcTotPa.Text := 'P' ;
         dblcMntPa.Text :=  FloatToStr(xTotal);
      end
      else
         dblcTotPa.Text := 'T';
end;
// Fin HPC_201805_FAC

end.
