Unit FAC374;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Fac374
// FORMULARIO               : FCobroServicios
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Fac/Bol cobrados por Caja
//
// Actualizaciones
// HPC_201403_FAC          Se revisa y modifica la forma de grabación a las tablas, que adiciona el control de Transaccion
//                         Se incrementa a cinco los decimales en los importes.
// HPC_201405_FAC 07/08/2014  Se revierte las modificaciones del redondeo a 5 decimales;
// HPC_201408_FAC          Se reemplaza apóstrofes en la dirección

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, db,
   wwdbdatetimepicker, Mask, ppEndUsr, ppProd, ppClass, ppReport, ppComm,
   ppRelatv, ppDB, ppDBPipe, ppBands, ppCache, ExtCtrls, MsgDlgs, Wwkeycb;

Type
   TFCobroServicios = Class(TForm)
      dbgTransf: TwwDBGrid;
      bbtnBoleta: TBitBtn;
      Label1: TLabel;
      bbtnTransfCaja: TBitBtn;
      bbtnTransfCredito: TBitBtn;
      Label2: TLabel;
      meReg: TMaskEdit;
      dtpFecha: TwwDBDateTimePicker;
      Z2bbtnImprime: TBitBtn;
      ppdb1: TppDBPipeline;
      ppr1: TppReport;
      ppd1: TppDesigner;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      bbtnBuscaBol: TBitBtn;
      bbtnPago: TBitBtn;
      bbtnFactura: TBitBtn;
      pnlBusca: TPanel;
      isBusca: TwwIncrementalSearch;
      Label3: TLabel;
      dbgTransfIButton: TwwIButton;
      bbtnOrdFecha: TBitBtn;
      bbtnOrdNombre: TBitBtn;
      bbtnFacCob: TBitBtn;
      BitBtn1: TBitBtn;
      bbtnEliminar: TBitBtn;
      cbDiseno: TCheckBox;
      Procedure FormActivate(Sender: TObject);
      Procedure bbtnBoletaClick(Sender: TObject);
      Procedure bbtnTransfCajaClick(Sender: TObject);
      Procedure bbtnTransfCreditoClick(Sender: TObject);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure bbtnBuscaBolClick(Sender: TObject);
      Procedure bbtnPagoClick(Sender: TObject);
      Procedure bbtnFacturaClick(Sender: TObject);
      Procedure dbgTransfIButtonClick(Sender: TObject);
      Procedure dbgTransfEnter(Sender: TObject);
      Procedure isBuscaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnOrdFechaClick(Sender: TObject);
      Procedure bbtnOrdNombreClick(Sender: TObject);
      Procedure bbtnFacCobClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure dbgTransfRowChanged(Sender: TObject);
      Procedure bbtnEliminarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
      xFecHoy: TDateTime;
      xBol, xFact: String;
      sTipoRQS: String; // Solo tiene tres valores Requisicion x (C)ompras (S)ervicios (A)ctivos Fijos
      cTinCob: String;
      //INICIO HPC_201403_FAC
      //Procedure InsertaFacturaCabecera;
      //FINAL HPC_201403_FAC
      Procedure InsertaFacturaCabeceraxCob;
      Procedure InicializaPorUsuario;
      Procedure GeneraNumeroFactura;
      Procedure InsertaFacturaDetalle;
      Procedure InsertaFacturaDetalleCaja;
      Procedure ActualizaCabecera;
      Procedure InsertaFac306;
      //INICIO HPC_201403_FAC
      Procedure CabeceraDatosUsuario;
      Procedure GrabaCabecera;
      Procedure NumeroFactura;
      //FINAL HPC_201403_FAC
   Public
    { Public declarations }
      cCiaCob, cTClie, cDocSel, sTipoReg: String;
      //INICIO HPC_201403_FAC
      vCIAID,vLOCID,vTIPOADQ,vTINID,vALMID,vDOCID,vFACSERIE,vFPAGOID,vTMONID,vTLISTAID,vVEID,vNFAC : String;
      xContinuaGrab : boolean;
      //FINAL  HPC_201403_FAC
   End;

Var
   FCobroServicios: TFCobroServicios;
   xCIgv, xCIsc: String; //Campos de flag de Igv e Isc
   xTasaIgv: double;
   xIgv, xIsc: Boolean;
   bFactura: Boolean;

Implementation

{$R *.dfm}

Uses FacDM, oaVE2000, FAC380, FAC382, FAC384, FAC386, FAC388;

Procedure TFCobroServicios.FormActivate(Sender: TObject);
Var
   xSQL: String;
Begin

   sTipoReg := 'N';

   dtpFecha.Date := Date;

   dbgTransf.DataSource := DMFAC.dsQry9;
   isBusca.DataSource := DMFAC.dsQry9;

   cCiaCob := '';
   cTinCob := '';

   xBol := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''B''', 'DOCID');
   xFact := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD =''CXC'' AND DOCTIPREG =''F''', 'DOCID');

   xSQL := 'Select * from FAC206 Where USERID=''' + DMFAC.wUsuario + '''';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(xSQL);
   Try
      DMFAC.cdsQry3.Open;
   Except
      Exit;
   End;

   cCiaCob := DMFAC.cdsQry3.FieldByName('CIAID').AsString;
   cTinCob := DMFAC.cdsQry3.FieldByName('TINID').AsString;

   bbtnOrdFechaClick(self);

   meReg.Text := IntToStr(DMFAC.cdsQry9.RecordCount);
End;

Procedure TFCobroServicios.bbtnBoletaClick(Sender: TObject);
Begin
   If DMFAC.cdsQry9.Recordcount = 0 Then
   Begin
      ShowMessage('No Existen registros Para Boletas. Verificar.');
      Exit;
   End;

   sTipoReg := 'N';
   cDocSel := xBol;

   If DMFAC.cdsQry9.FieldByName('CLAUXID').AsString = 'AS' Then
   Begin
      cTClie := '01';
   End
   Else
   Begin
      cTClie := '02';
   End;

   Try
      bFactura := False;
      FGenFactura := TFGenFactura.Create(Self);

      FGenFactura.dblcTClie.Text := cTClie;
      FGenFactura.dblcTdoc.Text := cDocSel;
      FGenFactura.dtpFFac.Date := dtpFecha.Date;

      If cTClie = '01' Then
      Begin
         FGenFactura.dblcdAso.Text := DMFAC.cdsQry9.FieldByName('CLIEID').AsString;
         FGenFactura.dblcdAsoExit(Self);
      End
      Else
      Begin
         FGenFactura.dblcdClie.Text := DMFAC.cdsQry9.FieldByName('CLIEID').AsString;
         FGenFactura.dblcdClieExit(Self);
      End;
      FGenFactura.edtClie.Text := DMFAC.cdsQry9.FieldByName('NOMBRE').AsString;
      FGenFactura.ShowModal;

   Finally
      If bFactura Then
      Begin

         xFecHoy := dtpFecha.Date;

         //INICIO HPC_201403_FAC
         //InsertaFacturaCabecera;
         DMFAC.DCOM1.AppServer.IniciaTransaccion;
         GrabaCabecera;
         If xContinuaGrab  Then
         Begin

           If DMFAC.cdsQry9.FieldByName('DOCPAG').AsString = '37' Then
              InsertaFacturaDetalleCaja
           Else
              InsertaFacturaDetalle;

           If xContinuaGrab  Then
           Begin
             ActualizaCabecera;
             If  xContinuaGrab Then
             Begin
               fSigue := True;
               FGenFactura.Free;
               Close;
               DMFAC.DCOM1.AppServer.GrabaTransaccion;
             End;
           End;

         End;
         //FINAL HPC_201403_FAC
      End
      Else
         FGenFactura.Free;
   End;
End;

//INICIO HPC_201403_FAC
{
Procedure TFCobroServicios.InsertaFacturaCabecera;
Var
   xFiltro, xWhere: String;
   xTCambio: Double;
Begin
   xFiltro := 'SELECT * FROM FAC305 WHERE 1<>1';
   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.DataRequest(xFiltro);
   DMFAC.cdsFact2.Open;

   //INICIO HPC_201403_FAC
   DMFAC.DCOM1.AppServer.IniciaTransaccion;
   //FINAL HPC_201403_FAC

   DMFAC.cdsFact2.Insert;

   InicializaPorUsuario;

   DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime := xFecHoy;

   // esto se hace para asignar el Tipo de Cambio de la Factura
   xWhere := 'TMONID =' + QuotedStr(DMFAC.wTMonExt)
      + ' AND FECHA = ' + DMFAC.wRepFuncDate + '''' + FormatDateTime(DMFAC.wFormatFecha, xFecHoy) + '''' + ')';
   If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xWhere, 'TMONID')) > 0 Then
   Begin
      xTCambio := DMFAC.cdsQry.FieldByName('TCAMVBV').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat := xTCambio;
   End;


   DMFAC.cdsFact2.FieldByName('FACDSCTO1').AsFloat := 0;
   DMFAC.cdsFact2.FieldByName('CLIECREMAX').AsFloat := 0;
   DMFAC.cdsFact2.FieldByName('FACIGV2MN').AsFloat := 0;
   DMFAC.cdsFact2.FieldByName('FACIGV2ME').AsFloat := 0;
   DMFAC.cdsFact2.FieldByName('FACIGV2MO').AsFloat := 0;
   DMFAC.cdsFact2.FieldByName('FACESTADO').AsString := 'INICIAL';

   If DMFAC.cdsQry9.FieldByName('CLAUXID').AsString = 'AS' Then
   Begin
      DMFAC.cdsFact2.FieldByName('FACTCLI').AsString := '01';
      DMFAC.cdsFact2.FieldByName('TLISTAID').AsString := 'ASO';
   End
   Else
   Begin
      DMFAC.cdsFact2.FieldByName('FACTCLI').AsString := '02';
      DMFAC.cdsFact2.FieldByName('TLISTAID').AsString := 'PEG';
   End;

   DMFAC.cdsFact2.FieldByName('FACTOBS').Clear;
   DMFAC.cdsFact2.FieldByName('FACTOBS').AsString := '.';
   DMFAC.cdsFact2.FieldByName('FACFEVCMTO').AsDateTime := DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime;

   DMFAC.cdsFact2.FieldByName('FACTCLI').AsString := FGenFactura.dblcTClie.Text;
   If FGenFactura.dblcTClie.Text = '01' Then
   Begin
      DMFAC.cdsFact2.FieldByName('CLIEID').AsString := FGenFactura.dblcdAso.Text;
      DMFAC.cdsFact2.FieldByName('CLAUXID').AsString := 'AS';
   End
   Else
   Begin
      DMFAC.cdsFact2.FieldByName('CLIEID').AsString := FGenFactura.dblcdClie.Text;
      DMFAC.cdsFact2.FieldByName('CLAUXID').AsString := 'C';
   End;
   DMFAC.cdsFact2.FieldByName('CLIEDES').AsString := FGenFactura.edtclie.Text;
   DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := FGenFactura.dblcdClieRuc.Text;
   DMFAC.cdsFact2.FieldByName('CLIEDIR').AsString := FGenFactura.edtDireccion.Text;

   If DMFAC.cdsFact2.FieldByName('CLIERUC').AsString = '' Then
      DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := '00000000000';
   If DMFAC.cdsFact2.FieldByName('CLIEDIR').AsString = '' Then
      DMFAC.cdsFact2.FieldByName('CLIEDIR').Clear;

   DMFAC.cdsFact2.FieldByName('TIPVTAID').AsString := '01';
   DMFAC.cdsFact2.FieldByName('TIPVTAID').AsString := '01001';
   DMFAC.cdsFact2.FieldByName('FACFREG').AsDateTime := xFecHoy;
   DMFAC.cdsFact2.FieldByName('FACUSER').AsString := DMFAC.wUsuario;

   If DMFAC.BuscaFecha('TGE114', 'FECANO', 'FECHA', DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime) Then
   Begin
      DMFAC.cdsFact2.FieldByName('FACANOMES').AsString := DMFAC.cdsUltTGE.FieldByName('FECANO').AsString + DMFAC.cdsUltTGE.FieldByName('FECMES').AsString; // ano+mes
      DMFAC.cdsFact2.FieldByName('FACAAAA').AsString := DMFAC.cdsUltTGE.FieldByName('FECANO').AsString; // ano
      DMFAC.cdsFact2.FieldByName('FACMM').AsString := DMFAC.cdsUltTGE.FieldByName('FECMES').AsString; // mes
      DMFAC.cdsFact2.FieldByName('FACDD').AsString := DMFAC.cdsUltTGE.FieldByName('FECDIA').AsString; // día
      DMFAC.cdsFact2.FieldByName('FACTRI').AsString := DMFAC.cdsUltTGE.FieldByName('FECTRIM').AsString; // trimestre
      DMFAC.cdsFact2.FieldByName('FACSEM').AsString := DMFAC.cdsUltTGE.FieldByName('FECSEM').AsString; // semestre
      DMFAC.cdsFact2.FieldByName('FACSS').AsString := DMFAC.cdsUltTGE.FieldByName('FECSS').AsString; // semana
      DMFAC.cdsFact2.FieldByName('FACAATRI').AsString := DMFAC.cdsUltTGE.FieldByName('FECAATRI').AsString; // año+trimestre
      DMFAC.cdsFact2.FieldByName('FACAASEM').AsString := DMFAC.cdsUltTGE.FieldByName('FECAASEM').AsString; // año+semestre
      DMFAC.cdsFact2.FieldByName('FACAASS').AsString := DMFAC.cdsUltTGE.FieldByName('FECAASS').AsString; // año+semana
   End;
   DMFAC.cdsFact2.FieldByName('FACFLAGD').AsString := 'N';
   DMFAC.cdsFact2.FieldByName('FACTIP').AsString := 'N'; // Variable para indicar el tipo de Factura en Filtros; con Guia

   // RECIBO DE CAJA
   DMFAC.cdsFact2.FieldByName('DOCPAG').AsString := DMFAC.cdsQry9.FieldByName('DOCPAG').AsString;
   DMFAC.cdsFact2.FieldByName('NUMDOCPAG').AsString := DMFAC.cdsQry9.FieldByName('NUMDOCPAG').AsString;

   DMFAC.cdsFact2.FieldByName('DETRACCION').AsFloat := DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat;

   GeneraNumeroFactura;

   DMFAC.ControlTran(9, DMFAC.cdsFact2, 'FACSGUIA');
End;
}
//FINAL HPC_201403_FAC


Procedure TFCobroServicios.InsertaFacturaCabeceraxCob;
Var
   xFiltro, xWhere: String;
   xTCambio: Double;
Begin
   xFiltro := 'SELECT * FROM FAC305 WHERE 1<>1';
   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.DataRequest(xFiltro);
   DMFAC.cdsFact2.Open;

   DMFAC.cdsFact2.Insert;

   InicializaPorUsuario;

   // Forma de Pago
   DMFAC.cdsFact2.FieldByName('FPAGOID').AsString := '04';
   DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime := xFecHoy;

   // esto se hace para asignar el Tipo de Cambio de la Factura
   xWhere := 'TMONID =' + QuotedStr(DMFAC.wTMonExt)
      + ' AND FECHA = ' + DMFAC.wRepFuncDate + '''' + FormatDateTime(DMFAC.wFormatFecha, xFecHoy) + '''' + ')';
   If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xWhere, 'TMONID')) > 0 Then
   Begin
      xTCambio := DMFAC.cdsQry.FieldByName('TCAMVBV').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat := xTCambio;
   End;

   DMFAC.cdsFact2.FieldByName('FACDSCTO1').AsFloat := 0;
   DMFAC.cdsFact2.FieldByName('CLIECREMAX').AsFloat := 0;
   DMFAC.cdsFact2.FieldByName('FACIGV2MN').AsFloat := 0;
   DMFAC.cdsFact2.FieldByName('FACIGV2ME').AsFloat := 0;
   DMFAC.cdsFact2.FieldByName('FACIGV2MO').AsFloat := 0;
   DMFAC.cdsFact2.FieldByName('FACESTADO').AsString := 'INICIAL';

   If FGenFactura.dblcTClie.Text = '01' Then
   Begin
      DMFAC.cdsFact2.FieldByName('FACTCLI').AsString := '01';
      DMFAC.cdsFact2.FieldByName('TLISTAID').AsString := 'ASO';
   End
   Else
   Begin
      DMFAC.cdsFact2.FieldByName('FACTCLI').AsString := '02';
      DMFAC.cdsFact2.FieldByName('TLISTAID').AsString := 'PEG';
   End;

   DMFAC.cdsFact2.FieldByName('FACTOBS').Clear;
   DMFAC.cdsFact2.FieldByName('FACTOBS').AsString := '.';
   DMFAC.cdsFact2.FieldByName('FACFEVCMTO').AsDateTime := DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime;

   If cDocSel = xBol Then
   Begin
      If DMFAC.cdsFact2.FieldByName('FACTCLI').AsString = '01' Then
      Begin
         If sTipoReg = 'S' Then
         Begin
            DMFAC.cdsFact2.FieldByName('CLIEID').AsString := DMFAC.cdsAsocia.FieldByName('ASOID').AsString;
            DMFAC.cdsFact2.FieldByName('CLAUXID').AsString := 'AS';
            DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := FGenFactura.dblcdClieRuc.Text;
            DMFAC.cdsFact2.FieldByName('CLIEDES').AsString := Trim(DMFAC.cdsAsocia.FieldByName('ASOAPENOMDNI').AsString);
         End
         Else
         Begin
            DMFAC.cdsFact2.FieldByName('CLIEID').AsString := DMFAC.cdsQry9.FieldByName('CLIEID').AsString;
            DMFAC.cdsFact2.FieldByName('CLAUXID').AsString := DMFAC.cdsQry9.FieldByName('CLAUXID').AsString;
            DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsQry9.FieldByName('RUCDNI').AsString;
            DMFAC.cdsFact2.FieldByName('CLIEDES').AsString := DMFAC.cdsQry9.FieldByName('NOMBRE').AsString;
         End;
      End;
      If DMFAC.cdsFact2.FieldByName('FACTCLI').AsString = '02' Then
      Begin
         DMFAC.cdsFact2.FieldByName('CLIEID').AsString := DMFAC.cdsClie.FieldByName('CLIEID').AsString;
         DMFAC.cdsFact2.FieldByName('CLAUXID').AsString := DMFAC.cdsClie.FieldByName('CLAUXID').AsString;
         DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsClie.FieldByName('CLIERUC').AsString;
         DMFAC.cdsFact2.FieldByName('CLIEDES').AsString := DMFAC.cdsClie.FieldByName('CLIEDES').AsString;
         DMFAC.cdsFact2.FieldByName('FACSERIE').AsString := DMFAC.cdsSerie.FieldByName('SERIEID').AsString;
      End;
   End
   Else
   Begin
      DMFAC.cdsFact2.FieldByName('CLIEID').AsString := DMFAC.cdsClie.FieldByName('CLIEID').AsString;
      DMFAC.cdsFact2.FieldByName('CLAUXID').AsString := DMFAC.cdsClie.FieldByName('CLAUXID').AsString;
      DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsClie.FieldByName('CLIERUC').AsString;
      DMFAC.cdsFact2.FieldByName('CLIEDES').AsString := DMFAC.cdsClie.FieldByName('CLIEDES').AsString;
      DMFAC.cdsFact2.FieldByName('FACSERIE').AsString := DMFAC.cdsSerie.FieldByName('SERIEID').AsString;
      DMFAC.cdsFact2.FieldByName('FACTCLI').AsString := '02';
   End;

   DMFAC.cdsFact2.FieldByName('TIPVTAID').AsString := '01';
   DMFAC.cdsFact2.FieldByName('TIPVTAID').AsString := '01001';
   DMFAC.cdsFact2.FieldByName('FACFREG').AsDateTime := xFecHoy;
   DMFAC.cdsFact2.FieldByName('FACUSER').AsString := DMFAC.wUsuario;

   If DMFAC.BuscaFecha('TGE114', 'FECANO', 'FECHA', DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime) Then
   Begin
      DMFAC.cdsFact2.FieldByName('FACANOMES').AsString := DMFAC.cdsUltTGE.FieldByName('FECANO').AsString + DMFAC.cdsUltTGE.FieldByName('FECMES').AsString; // ano+mes
      DMFAC.cdsFact2.FieldByName('FACAAAA').AsString := DMFAC.cdsUltTGE.FieldByName('FECANO').AsString; // ano
      DMFAC.cdsFact2.FieldByName('FACMM').AsString := DMFAC.cdsUltTGE.FieldByName('FECMES').AsString; // mes
      DMFAC.cdsFact2.FieldByName('FACDD').AsString := DMFAC.cdsUltTGE.FieldByName('FECDIA').AsString; // día
      DMFAC.cdsFact2.FieldByName('FACTRI').AsString := DMFAC.cdsUltTGE.FieldByName('FECTRIM').AsString; // trimestre
      DMFAC.cdsFact2.FieldByName('FACSEM').AsString := DMFAC.cdsUltTGE.FieldByName('FECSEM').AsString; // semestre
      DMFAC.cdsFact2.FieldByName('FACSS').AsString := DMFAC.cdsUltTGE.FieldByName('FECSS').AsString; // semana
      DMFAC.cdsFact2.FieldByName('FACAATRI').AsString := DMFAC.cdsUltTGE.FieldByName('FECAATRI').AsString; // año+trimestre
      DMFAC.cdsFact2.FieldByName('FACAASEM').AsString := DMFAC.cdsUltTGE.FieldByName('FECAASEM').AsString; // año+semestre
      DMFAC.cdsFact2.FieldByName('FACAASS').AsString := DMFAC.cdsUltTGE.FieldByName('FECAASS').AsString; // año+semana
   End;
   DMFAC.cdsFact2.FieldByName('FACFLAGD').AsString := 'N';
   DMFAC.cdsFact2.FieldByName('FACTIP').AsString := 'N'; // Variable para indicar el tipo de Factura en Filtros; con Guia

   //INICIO HPC_201403_FAC
   xContinuaGrab := True;
   GeneraNumeroFactura;
   If not xContinuaGrab  Then
   Begin
     xContinuaGrab := False;
     exit;
   End;
   //FINAL HPC_201403_FAC


   //INICIO HPC_201403_FAC
   //DMFAC.ControlTran(9, DMFAC.cdsFact2, 'FACSGUIA');
   xContinuaGrab := True;
   if DMFAC.cdsFact2.ApplyUpdates(0)>0 then
   begin
     ShowMessage('Error al intentar grabar Cabecera de la Factura (FAC305) ');
     DMFAC.DCOM1.AppServer.RetornaTransaccion;
     xContinuaGrab := False;
     exit;
   end;
   DMFAC.DCOM1.AppServer.GrabaTransaccion;
   //FINAL HPC_201403_FAC

End;

Procedure TFCobroServicios.InicializaPorUsuario;
Var
   xSQL: String;
Begin
   xSQL := 'Select * from FAC206 '
      + 'Where USERID=''' + DMFAC.wUsuario + '''';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(xSQL);
   Try
      DMFAC.cdsQry3.Open;
   Except
      Exit;
   End;

   If DMFAC.cdsQry3.RecordCount <= 0 Then exit;

   Try
   // Compañia
      If DMFAC.cdsQry3.FieldByName('CIAID').AsString <> '' Then
         DMFAC.cdsFact2.FieldByName('CIAID').AsString := DMFAC.cdsQry3.FieldByName('CIAID').AsString;

   // Localidad
      If DMFAC.cdsQry3.FieldByName('LOCID').AsString <> '' Then
         DMFAC.cdsFact2.FieldByName('LOCID').AsString := DMFAC.cdsQry3.FieldByName('LOCID').AsString;

   // Tipo de Venta
      If DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString <> '' Then
         DMFAC.cdsFact2.FieldByName('TIPOADQ').AsString := DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString;

      If DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString = 'C' Then
      Begin
      // Tipo de Inventario
         If DMFAC.cdsQry3.FieldByName('TINID').AsString <> '' Then
            DMFAC.cdsFact2.FieldByName('TINID').AsString := DMFAC.cdsQry3.FieldByName('TINID').AsString;

      // Almacén
         If DMFAC.cdsQry3.FieldByName('ALMID').AsString <> '' Then
            DMFAC.cdsFact2.FieldByName('ALMID').AsString := DMFAC.cdsQry3.FieldByName('ALMID').AsString;
      End;

      If DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString = 'S' Then
      Begin
   // Tipo de Inventario
         DMFAC.cdsFact2.FieldByName('TINID').AsString := '00';
   // Almacén
         DMFAC.cdsFact2.FieldByName('ALMID').AsString := '00';
      End;

   // BOLETA DE VENTA / factura
      DMFAC.cdsFact2.FieldByName('DOCID').AsString := cDocSel;

      If DMFAC.cdsQry3.FieldByName('FACSERIE').AsString <> '' Then
         DMFAC.cdsFact2.FieldByName('FACSERIE').AsString := FGenFactura.dblcSerie.Text;

      If DMFAC.cdsFact2.FieldByName('FACSERIE').AsString = '' Then
         DMFAC.cdsFact2.FieldByName('FACSERIE').AsString := FGenFactura.dblcSerie.Text;

   // Forma de Pago
      If DMFAC.cdsQry9.FieldByName('FORPAG').AsString = 'CAJA' Then
         DMFAC.cdsFact2.FieldByName('FPAGOID').AsString := '01';
      If DMFAC.cdsQry9.FieldByName('FORPAG').AsString = 'CREDITOS' Then
         DMFAC.cdsFact2.FieldByName('FPAGOID').AsString := '03';
      If DMFAC.cdsQry9.FieldByName('FORPAG').AsString = 'BANCO' Then
         DMFAC.cdsFact2.FieldByName('FPAGOID').AsString := '04';

   // Moneda
      DMFAC.cdsFact2.FieldByName('TMONID').AsString := DMFAC.cdsQry9.FieldByName('TMONID').AsString;

   // Lista de Precios
      If DMFAC.cdsQry3.FieldByName('TLISTAID').AsString <> '' Then
         DMFAC.cdsFact2.FieldByName('TLISTAID').AsString := 'PEG';

   // Vendedor
      If DMFAC.cdsQry3.FieldByName('VEID').AsString <> '' Then
         DMFAC.cdsFact2.FieldByName('VEID').AsString := DMFAC.cdsQry3.FieldByName('VEID').AsString;

   Except

   End;
End;

Procedure TFCobroServicios.GeneraNumeroFactura;
Var
   xWhere, NUeAnt, xNFact, xSQL: String;
Begin


   If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xFact) Then //Si genera Factura
   Begin

      xWhere := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString) + ' and '
         + 'FLAGV=' + QuotedStr('F') + ' and '
         + 'SERIEID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString);

      NueAnt := DMFAC.BuscaQry('dspUltTGE', 'FAC103', 'SERIENUM', xWhere, 'SERIENUM');

      If Length(Trim(NueAnt)) = 0 Then Exit;

      xNFact := IntToStr(StrToInt(NueAnt) + 1);

      If StrToInt(xNFact) < StrToInt(wSerieNum) Then
         xNFAct := wSerieNum;

      xSQL := 'UPDATE FAC103 SET SERIENUM=''' + xNFact + ''' '
         + 'Where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString) + ' and '
         + 'FLAGV=' + QuotedStr('F') + ' and '
         + 'SERIEID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString);
      Try
        //INICIO HPC_201403_FAC
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         xContinuaGrab := True;
         //DMFAC.ControlTran(8, Nil, '');
         //FINAL HPC_201403_FAC
      Except
         //INICIO HPC_201403_FAC
         //DMFAC.ControlTran(1, Nil, '');
         Showmessage('No se pudo actualizar  en el archivo FAC103');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         xContinuaGrab := False;
         exit;
         //FINAL HPC_201403_FAC
      End;

      If DMFAC.cdsFact2.State = dsInsert Then
         DMFAC.cdsFact2.FieldByName('NFAC').AsString := DMFAC.StrZero(xNFact, DMFAC.wAnchoFact);
   End;

   If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xBol) Then //Si genera Factura
   Begin
      xWhere := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString) + ' and '
         + 'FLAGV=' + QuotedStr('B') + ' and '
         + 'SERIEID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString);

      NueAnt := DMFAC.BuscaQry('dspUltTGE', 'FAC103', 'SERIENUM', xWhere, 'SERIENUM');

      If Length(Trim(NueAnt)) = 0 Then Exit;
      xNFact := IntToStr(StrToInt(NueAnt) + 1);

      If StrToInt(xNFact) < StrToInt(wSerieNum) Then
         xNFAct := wSerieNum;

      xSQL := 'UPDATE FAC103 SET SERIENUM=''' + xNFact + ''' '
         + 'Where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString) + ' and '
         + 'FLAGV=' + QuotedStr('B') + ' and '
         + 'SERIEID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString);
      Try
         //INICIO HPC_201403_FAC
         xContinuaGrab := True;
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         //DMFAC.ControlTran(8, Nil, '');
         //FINAL HPC_201403_FAC
      Except
         //INICIO HPC_201403_FAC
         //DMFAC.ControlTran(1, Nil, '');
         Showmessage('No se pudo actualizar  en el archivo FAC103');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         xContinuaGrab := False;
         exit;
         //FINAL HPC_201403_FAC
     End;

      If DMFAC.cdsFact2.State = dsInsert Then
         DMFAC.cdsFact2.FieldByName('NFAC').AsString := DMFAC.StrZero(xNFact, DMFAC.wAnchoFact);
   End;

End;

Procedure TFCobroServicios.InsertaFacturaDetalle;
Var
   xSQL, xfiltro, sArticulo, sArtDes, xUm: String;
   xPrecio, xTotDscto1, xTotDscto2, xTotImp1, xTotImp2, xImporte, xSTotal, xTotal: double;
   bContenido: boolean;
   xValor, xCtAceptada: double;
   xDscto1, xDscto2, xImp1, xImp2, xPVentaTot, xImpTasa: double;
   xIGVSN: String; 
Begin

   xSQL := 'SELECT * FROM FAC306 '
      + 'WHERE CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
      + ' AND DOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + ' AND FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
      + ' AND NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString)
      + 'ORDER BY DFACITEM';
   Filtracds(DMFAC.cdsDetFact2, xSQL);

   DMFAC.cdsDetFact2.Insert;
   DMFAC.cdsDetFact2.FieldByName('DFACITEM').AsString := DMFAC.StrZero(DMFAC.MaxValue('DFACITEM', DMFAC.cdsDetFact2), 3);
   DMFAC.cdsDetFact2.FieldByName('CIAID').AsString := DMFAC.cdsFact2.FieldByName('CIAID').AsString;
   DMFAC.cdsDetFact2.FieldByName('CLIEID').AsString := DMFAC.cdsFact2.FieldByName('CLIEID').AsString;
   DMFAC.cdsDetFact2.FieldByName('FACSERIE').AsString := DMFAC.cdsFact2.FieldByName('FACSERIE').AsString;
   DMFAC.cdsDetFact2.FieldByName('NFAC').AsString := DMFAC.cdsFact2.FieldByName('NFAC').AsString;
   DMFAC.cdsDetFact2.FieldByName('CLAUXID').AsString := DMFAC.cdsFact2.FieldByName('CLAUXID').AsString;
   DMFAC.cdsDetFact2.FieldByName('TMONID').AsString := DMFAC.cdsFact2.FieldByName('TMONID').AsString;
   //Inicio HPC_201405_FAC
   //Inicio HPC_201403_FAC
     DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 15, 2);
   //DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 15, 4);
   //DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 15, 5);
   //Final HPC_201403_FAC
   //Final HPC_201405_FAC
   DMFAC.cdsDetFact2.FieldByName('DFACESTADO').AsString := 'ACEPTADO';
   DMFAC.cdsDetFact2.FieldByName('DFACUSER').AsString := DMFAC.wUsuario;
   DMFAC.cdsDetFact2.FieldByName('FACFECHA').value := DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime;
   DMFAC.cdsDetFact2.FieldByName('DFACFREG').Value := xFecHoy;
   DMFAC.cdsDetFact2.FieldByName('FACTCLI').AsString := DMFAC.cdsFact2.FieldByName('FACTCLI').AsString;

   DMFAC.cdsDetFact2.FieldByName('DFACHREG').AsDatetime := xFecHoy + Time;
   DMFAC.cdsDetFact2.FieldByName('DFACHOR').AsDateTime := xFecHoy + Time;

   DMFAC.cdsDetFact2.FieldByName('DFACANOMES').AsString := DMFAC.cdsFact2.FieldByName('FACANOMES').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACAAAA').AsString := DMFAC.cdsFact2.FieldByName('FACAAAA').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACMM').AsString := DMFAC.cdsFact2.FieldByName('FACMM').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACDD').AsString := DMFAC.cdsFact2.FieldByName('FACDD').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACTRI').AsString := DMFAC.cdsFact2.FieldByName('FACTRI').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACSEM').AsString := DMFAC.cdsFact2.FieldByName('FACSEM').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACSS').AsString := DMFAC.cdsFact2.FieldByName('FACSS').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACAATRI').AsString := DMFAC.cdsFact2.FieldByName('FACAATRI').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACAASEM').AsString := DMFAC.cdsFact2.FieldByName('FACAASEM').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACAASS').AsString := DMFAC.cdsFact2.FieldByName('FACAASS').AsString;

   xImpTasa := StrToFloat(DMFAC.BuscaQry('dspUltTGE', 'TGE108', 'TASACAN', 'TASAFLG =''I''', 'TASACAN'));

   xImp1 := xImpTasa;
   //Inicio HPC_201405_FAC
   //Inicio HPC_201403_FAC
     xPrecio := FRound(DMFAC.cdsQry9.FieldByname('IMPORTE').AsFloat / (1 + (xImpTasa / 100)), 15, 2);
     xTotImp1 := FRound(DMFAC.cdsQry9.FieldByname('IMPORTE').AsFloat - xPrecio, 15, 2);
     DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat := FRound(xPrecio, 15, 4); //Precio
     //xTotImp1 := FRound(DMFAC.cdsQry9.FieldByname('IMPORTE').AsFloat - xPrecio, 15, 5);
     //xPrecio := FRound(DMFAC.cdsQry9.FieldByname('IMPORTE').AsFloat / (1 + (xImpTasa / 100)), 15, 5);
     //DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat := FRound(xPrecio, 15, 5); //Precio
   //Final HPC_201403_FAC
   //Final HPC_201405_FAC

 //Descuentos 01
   DMFAC.cdsDetFact2.FieldByName('DFACDCTO').AsFloat := 0; //Porcentaje Descuentos 1
   DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat := 0; //Monto Descuento 1
 //Descuentos 02
   DMFAC.cdsDetFact2.FieldByName('DFACDCTO2').AsFloat := 0; //Porcentaje Descuentos 2
   DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat := 0; //Descuento 2

   //Inicio HPC_201405_FAC
   //Inicio HPC_201403_FAC
     DMFAC.cdsDetFact2.FieldByName('DFACIMP1').AsFloat := FRound(xImp1, 15, 2); //Porcentaje Impuesto 1
     DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat := FRound(xTotImp1, 15, 2); //Monto Impuesto 1
   //DMFAC.cdsDetFact2.FieldByName('DFACIMP1').AsFloat := FRound(xImp1, 15, 4); //Porcentaje Impuesto 1
   //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat := FRound(xTotImp1, 15, 4); //Monto Impuesto 1
   //DMFAC.cdsDetFact2.FieldByName('DFACIMP1').AsFloat := FRound(xImp1, 15, 5); //Porcentaje Impuesto 1
   //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat := FRound(xTotImp1, 15, 5); //Monto Impuesto 1
   //Final HPC_201403_FAC
   //Final HPC_201405_FAC

   DMFAC.cdsDetFact2.FieldByName('DFACIMP2').AsFloat := 0; //Porcentaje Impuesto 2
   DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat := 0; //Monto Impuesto 2
   //Inicio HPC_201405_FAC
   //Inicio HPC_201403_FAC
     DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat := FRound(xPrecio, 15, 2); //Precio
     DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat := FRound(DMFAC.cdsQry9.FieldByname('IMPORTE').AsFloat, 15, 2); //Monto Total + Impuesto 1 + Impuesto 2
   //DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat := FRound(xPrecio, 15, 4); //Precio
   //DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat := FRound(DMFAC.cdsQry9.FieldByname('IMPORTE').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
   //DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat := FRound(xPrecio, 15, 5); //Precio
   //DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat := FRound(DMFAC.cdsQry9.FieldByname('IMPORTE').AsFloat, 15, 5); //Monto Total + Impuesto 1 + Impuesto 2
   //Final HPC_201403_FAC
   //Final HPC_201405_FAC

   DMFAC.cdsDetFact2.FieldByName('DFACCANTG').AsFloat := 1;
   DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat := 1;

   //Inicio HPC_201405_FAC
   //Inicio HPC_201403_FAC
     DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat, 15, 2);
   //DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat, 15, 4);
   //DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat, 15, 5);
   //Final HPC_201403_FAC
   //Final HPC_201405_FAC

   If (DMFAC.cdsDetFact2.FieldByName('TMONID').AsString = DMFAC.wTMonLoc) Then
   Begin
      //Inicio HPC_201405_FAC
      //Inicio HPC_201403_FAC

        DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 2); //Monto Total + Impuesto 1 + Impuesto 2
        DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 2); //Monto Impuesto 2

      //DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
      //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 4); //Monto Impuesto 2

      //DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 5); //Monto Total + Impuesto 1 + Impuesto 2
      //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 5); //Monto Impuesto 2
      //Final HPC_201403_FAC
      //Final HPC_201405_FAC

      If DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat > 0 Then
      Begin

          //Inicio HPC_201405_FAC
         //Inicio HPC_201403_FAC

           DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2); //Precios
           DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2); //descuentos 1
           DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2); //descuentos 2
           DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2); //Monto Total + Impuesto 1 + Impuesto 2
           DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);

           //DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //Precios
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //descuentos 1
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //descuentos 2
           //DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);

           //DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5); //Precios
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5); //descuentos 1
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5); //descuentos 2
           //DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5); //Monto Total + Impuesto 1 + Impuesto 2
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
         //Final HPC_201403_FAC
         //Final HPC_201405_FAC
      End;
   End
   Else
   Begin
      //Inicio HPC_201405_FAC
      //Inicio HPC_201403_FAC

        DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2); //Descuentos
        DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2); //Descuentos
        DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
        DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 2);

      //DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //Descuentos
      //DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //Descuentos
      //DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
      //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 4);

      //DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5); //Descuentos
      //DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5); //Descuentos
      //DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 5);

      //DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 5);

      //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 5);

      //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
      //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 5);
      //Final HPC201403_FAC
      //Final HPC201405_FAC
   End;

   sArticulo := DMFAC.BuscaQry('dspUltTGE', 'CAJA201', 'ARTID', 'CPTOID=''' + DMFAC.cdsQry9.FieldByname('CPTOID').AsString + ''' AND CPTOIS=''I''', 'ARTID');

   xFiltro := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
      + ' AND TINID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('TINID').AsString)
      + ' and ARTID=' + QuotedStr(sArticulo);

   Filtracds(DMFAC.cdsUltTGE, 'SELECT GRARID, FAMID, SFAMID, TINID, ARTCONT, UNMIDG, UNMIDU, ARTIGV, ARTDES FROM TGE205 WHERE ' + xFiltro);

  //Llenado de Campos del Maestro de Articulos
   DMFAC.cdsDetFact2.FieldByName('GRARID').AsString := DMFAC.cdsUltTGE.FieldByName('GRARID').AsString; // Linea
   DMFAC.cdsDetFact2.FieldByName('FAMID').AsString := DMFAC.cdsUltTGE.FieldByName('FAMID').AsString; // Familia
   DMFAC.cdsDetFact2.FieldByName('SFAMID').AsString := DMFAC.cdsUltTGE.FieldByName('SFAMID').AsString; // SubFamilia
   DMFAC.cdsDetFact2.FieldByName('TINID').AsString := DMFAC.cdsUltTGE.FieldByName('TINID').AsString; // SubFamilia

   DMFAC.cdsDetFact2.FieldByName('ALMID').AsString := DMFAC.cdsFact2.FieldByName('ALMID').AsString;

   DMFAC.cdsDetFact2.FieldByName('UNMIDG').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
   DMFAC.cdsDetFact2.FieldByName('UNMIDO').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
   DMFAC.cdsDetFact2.FieldByName('UNMABR').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
   DMFAC.cdsDetFact2.FieldByName('DFACCONT').AsString := 'S';

   DMFAC.cdsDetFact2.FieldByName('ARTID').AsString := sArticulo;
   DMFAC.cdsDetFact2.FieldByName('DFACIGV').AsString := DMFAC.cdsUltTGE.FieldByName('ARTIGV').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACISC').AsString := 'N';

   DMFAC.cdsDetFact2.FieldByName('TIPOADQ').AsString := 'C';
   DMFAC.cdsDetFact2.FieldByName('ARTDES').AsString := DMFAC.cdsUltTGE.FieldByName('ARTDES').AsString;

   DMFAC.cdsDetFact2.FieldByName('DOCID').AsString := DMFAC.cdsFact2.FieldByName('DOCID').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACGARAN').AsString := '';
   //Inicio HPC_201405_FAC
   //Inicio HPC_201403_FAC
    DMFAC.cdsDetFact2.FieldByName('CLIECREMAX').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('CLIECREMAX').AsFloat, 15, 2);
   //DMFAC.cdsDetFact2.FieldByName('CLIECREMAX').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('CLIECREMAX').AsFloat, 15, 5);
   //Final HPC_201403_FAC
   //Final HPC_201405_FAC

   DMFAC.cdsDetFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsFact2.FieldByName('CLIERUC').AsString; // Monto Dsctos

   If DMFAC.cdsDetFact2.FieldByName('CLIERUC').AsString = '' Then
      DMFAC.cdsDetFact2.FieldByName('CLIERUC').AsString := '00000000000';

   DMFAC.cdsDetFact2.FieldByName('TLISTAID').AsString := DMFAC.cdsFact2.FieldByName('TLISTAID').Asstring; // Monto Dsctos
   DMFAC.cdsDetFact2.FieldByName('FPAGOID').AsString := DMFAC.cdsFact2.FieldByName('FPAGOID').AsString;
   DMFAC.cdsDetFact2.FieldByName('VEID').AsString := DMFAC.cdsFact2.FieldByName('VEID').AsString;
   DMFAC.cdsDetFact2.FieldByName('LOCID').AsString := DMFAC.cdsFact2.FieldByName('LOCID').AsString;
   DMFAC.cdsDetFact2.FieldByName('FACTIP').AsString := 'N'; // Variable para indicar el tipo de Factura en Filtros; con Guia
   DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString := 'X';
   DMFAC.cdsDetFact2.Post;

   //INICIO HPC_201403_FAC
   //DMFAC.ControlTran(9, DMFAC.cdsDetFact2, 'DFACSGUIA');
   xContinuaGrab := True;
   if DMFAC.cdsDetFact2.ApplyUpdates(0)>0 then
   begin
     ShowMessage('Error al intentar grabar Detalle de la Factura (FAC306) ');
     DMFAC.DCOM1.AppServer.RetornaTransaccion;
     xContinuaGrab := False;
     exit;
   end;
   //FINAL HPC_201403_FAC


End;

Procedure TFCobroServicios.InsertaFacturaDetalleCaja;
Var
   xSQL, xfiltro, sArticulo, sArtDes, xUm: String;
   xPrecio, xTotDscto1, xTotDscto2, xTotImp1, xTotImp2, xImporte, xSTotal, xTotal: double;
   bContenido: boolean;
   xValor, xCtAceptada: double;
   xDscto1, xDscto2, xImp1, xImp2, xPVentaTot, xImpTasa: double;
   xIGVSN: String;
   XNUMDET : INTEGER;
Begin

  // detalle de Pagos hechos en caja
   xSQL := 'SELECT * FROM CAJA301 '
      + 'WHERE CIAID=''' + DMFAC.cdsQry9.FieldByName('CIAID').AsString + ''' '
      + 'and DOCID2=''37'' AND CPSERIE=''CAJA'' '
      + 'and CPNODOC=''' + DMFAC.cdsQry9.FieldByName('NUMDOCPAG').AsString + '''';
   DMFAC.cdsQry10.Close;
   DMFAC.cdsQry10.DataRequest(xSQL);
   DMFAC.cdsQry10.Open;

   xSQL := 'SELECT * FROM FAC306 '
      + 'WHERE CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
      + ' AND DOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + ' AND FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
      + ' AND NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString)
      + 'ORDER BY DFACITEM';
   Filtracds(DMFAC.cdsDetFact2, xSQL);

   DMFAC.cdsQry10.first;
   While Not DMFAC.cdsQry10.eof Do
   Begin
      xImpTasa := StrToFloat(DMFAC.BuscaQry('dspUltTGE', 'TGE108', 'TASACAN', 'TASAFLG =''I''', 'TASACAN'));
      xImp1 := xImpTasa;

      DMFAC.cdsDetFact2.Insert;
      DMFAC.cdsDetFact2.FieldByName('DFACITEM').AsString := DMFAC.StrZero(DMFAC.MaxValue('DFACITEM', DMFAC.cdsDetFact2), 3);
      DMFAC.cdsDetFact2.FieldByName('CIAID').AsString := DMFAC.cdsFact2.FieldByName('CIAID').AsString;
      DMFAC.cdsDetFact2.FieldByName('CLIEID').AsString := DMFAC.cdsFact2.FieldByName('CLIEID').AsString;
      DMFAC.cdsDetFact2.FieldByName('FACSERIE').AsString := DMFAC.cdsFact2.FieldByName('FACSERIE').AsString;
      DMFAC.cdsDetFact2.FieldByName('NFAC').AsString := DMFAC.cdsFact2.FieldByName('NFAC').AsString;
      DMFAC.cdsDetFact2.FieldByName('CLAUXID').AsString := DMFAC.cdsFact2.FieldByName('CLAUXID').AsString;
      DMFAC.cdsDetFact2.FieldByName('TMONID').AsString := DMFAC.cdsFact2.FieldByName('TMONID').AsString;
      //Inicio HPC_201405_FAC
        //Inicio HPC_201403_FAC
          DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 15, 3);
        //DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 15, 4);
        //DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 15, 5);
        //Final HPC_201403_FAC
      //Final HPC_201405_FAC
      DMFAC.cdsDetFact2.FieldByName('DFACESTADO').AsString := 'ACEPTADO';
      DMFAC.cdsDetFact2.FieldByName('DFACUSER').AsString := DMFAC.wUsuario;
      DMFAC.cdsDetFact2.FieldByName('FACFECHA').value := DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime;
      DMFAC.cdsDetFact2.FieldByName('DFACFREG').Value := xFecHoy;
      DMFAC.cdsDetFact2.FieldByName('FACTCLI').AsString := DMFAC.cdsFact2.FieldByName('FACTCLI').AsString;
      DMFAC.cdsDetFact2.FieldByName('DFACHREG').AsDatetime := xFecHoy + Time;
      DMFAC.cdsDetFact2.FieldByName('DFACHOR').AsDateTime := xFecHoy + Time;
      DMFAC.cdsDetFact2.FieldByName('DFACANOMES').AsString := DMFAC.cdsFact2.FieldByName('FACANOMES').AsString;
      DMFAC.cdsDetFact2.FieldByName('DFACAAAA').AsString := DMFAC.cdsFact2.FieldByName('FACAAAA').AsString;
      DMFAC.cdsDetFact2.FieldByName('DFACMM').AsString := DMFAC.cdsFact2.FieldByName('FACMM').AsString;
      DMFAC.cdsDetFact2.FieldByName('DFACDD').AsString := DMFAC.cdsFact2.FieldByName('FACDD').AsString;
      DMFAC.cdsDetFact2.FieldByName('DFACTRI').AsString := DMFAC.cdsFact2.FieldByName('FACTRI').AsString;
      DMFAC.cdsDetFact2.FieldByName('DFACSEM').AsString := DMFAC.cdsFact2.FieldByName('FACSEM').AsString;
      DMFAC.cdsDetFact2.FieldByName('DFACSS').AsString := DMFAC.cdsFact2.FieldByName('FACSS').AsString;
      DMFAC.cdsDetFact2.FieldByName('DFACAATRI').AsString := DMFAC.cdsFact2.FieldByName('FACAATRI').AsString;
      DMFAC.cdsDetFact2.FieldByName('DFACAASEM').AsString := DMFAC.cdsFact2.FieldByName('FACAASEM').AsString;
      DMFAC.cdsDetFact2.FieldByName('DFACAASS').AsString := DMFAC.cdsFact2.FieldByName('FACAASS').AsString;

      //Inicio HPC_201405_FAC
        //Inicio HPC_201403_FAC

          xPrecio := FRound((DMFAC.cdsQry10.FieldByname('DEMTOORI').AsFloat + DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat) / (1 + (xImpTasa / 100)), 15, 2);
          xTotImp1 := FRound((DMFAC.cdsQry10.FieldByname('DEMTOORI').AsFloat + DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat) - xPrecio, 15, 2);
          DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat := FRound(xPrecio / DMFAC.cdsQry10.FieldByName('CANTIDAD').AsFloat, 15, 2); //Precio

         //xPrecio := FRound((DMFAC.cdsQry10.FieldByname('DEMTOORI').AsFloat + DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat) / (1 + (xImpTasa / 100)), 15, 2);
         //xTotImp1 := FRound((DMFAC.cdsQry10.FieldByname('DEMTOORI').AsFloat + DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat) - xPrecio, 15, 2);
         //DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat := FRound(xPrecio / DMFAC.cdsQry10.FieldByName('CANTIDAD').AsFloat, 15, 4); //Precio

         //xPrecio := FRound((DMFAC.cdsQry10.FieldByname('DEMTOORI').AsFloat + DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat) / (1 + (xImpTasa / 100)), 15, 5);
         //xTotImp1 := FRound((DMFAC.cdsQry10.FieldByname('DEMTOORI').AsFloat + DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat) - xPrecio, 15, 5);
         //DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat := FRound(xPrecio / DMFAC.cdsQry10.FieldByName('CANTIDAD').AsFloat, 15, 5); //Precio

        //Final HPC_201403_FAC
      //Final HPC_201405_FAC


 //Descuentos 01
      DMFAC.cdsDetFact2.FieldByName('DFACDCTO').AsFloat := 0; //Porcentaje Descuentos 1
      DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat := 0; //Monto Descuento 1
 //Descuentos 02
      DMFAC.cdsDetFact2.FieldByName('DFACDCTO2').AsFloat := 0; //Porcentaje Descuentos 2
      DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat := 0; //Descuento 2

      //Inicio HPC_201405_FAC
        //Inicio HPC_201403_FAC

        DMFAC.cdsDetFact2.FieldByName('DFACIMP1').AsFloat := FRound(xImp1, 15, 2); //Porcentaje Impuesto 1
        DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat := FRound(xTotImp1, 15, 2); //Monto Impuesto 1

        //DMFAC.cdsDetFact2.FieldByName('DFACIMP1').AsFloat := FRound(xImp1, 15, 4); //Porcentaje Impuesto 1
        //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat := FRound(xTotImp1, 15, 4); //Monto Impuesto 1

        //DMFAC.cdsDetFact2.FieldByName('DFACIMP1').AsFloat := FRound(xImp1, 15, 5); //Porcentaje Impuesto 1
        //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat := FRound(xTotImp1, 15, 5); //Monto Impuesto 1
        //Final HPC_201403_FAC
      //Final HPC_201405_FAC

      DMFAC.cdsDetFact2.FieldByName('DFACIMP2').AsFloat := 0; //Porcentaje Impuesto 2
      DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat := 0; //Monto Impuesto 2

      //Inicio HPC_201405_FAC
        //Inicio HPC_201403_FAC

        DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat := FRound(xPrecio, 15, 2); //Precio
        DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat := FRound(DMFAC.cdsQry10.FieldByname('DEMTOORI').AsFloat + DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat, 15, 2); //Monto Total + Impuesto 1 + Impuesto 2

        //DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat := FRound(xPrecio, 15, 4); //Precio
        //DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat := FRound(DMFAC.cdsQry10.FieldByname('DEMTOORI').AsFloat + DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2

        //DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat := FRound(xPrecio, 15, 5); //Precio
        //DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat := FRound(DMFAC.cdsQry10.FieldByname('DEMTOORI').AsFloat + DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat, 15, 5); //Monto Total + Impuesto 1 + Impuesto 2

        //Final HPC_201403_FAC
      //Final HPC_201405_FAC

      DMFAC.cdsDetFact2.FieldByName('DFACCANTG').AsFloat := DMFAC.cdsQry10.FieldByName('CANTIDAD').AsFloat;
      DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat := DMFAC.cdsQry10.FieldByName('CANTIDAD').AsFloat;
      //Inicio HPC_201405_FAC
        //Inicio HPC_201403_FAC
          DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat, 15, 2);        
        //DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat, 15, 4);
        //DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat, 15, 5);
        //Final HPC_201403_FAC
      //Final HPC_201405_FAC

      If (DMFAC.cdsDetFact2.FieldByName('TMONID').AsString = DMFAC.wTMonLoc) Then
      Begin
         //Inicio HPC_201405_FAC
           //Inicio HPC_201403_FAC
           DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 2); //Monto Total + Impuesto 1 + Impuesto 2
           DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 2); //Monto Impuesto 2

           //DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 4); //Monto Impuesto 2

           //DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 5); //Monto Total + Impuesto 1 + Impuesto 2
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 5); //Monto Impuesto 2
           //Final HPC_201403_FAC
         //Final HPC_201405_FAC

         If DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat > 0 Then
         Begin
            //Inicio HPC_201405_FAC
              //Inicio HPC_201403_FAC
              DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2); //Precios
              DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2); //descuentos 1
              DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2); //descuentos 2
              DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
              DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2); //Monto Total + Impuesto 1 + Impuesto 2
              DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
              DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);

              //DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //Precios
              //DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //descuentos 1
              //DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //descuentos 2
              //DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
              //DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
              //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
              //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);

              //DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5); //Precios
              //DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5); //descuentos 1
              //DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5); //descuentos 2
              //DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
              //DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5); //Monto Total + Impuesto 1 + Impuesto 2
              //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
              //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
              //Final HPC_201403_FAC
            //Final HPC_201405_FAC
         End;
      End
      Else
      Begin
         //Inicio HPC_201405_FAC
           //Inicio HPC_201403_FAC

           DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat  := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat  := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat  := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2); //Descuentos
           DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat  := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat  := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2); //Descuentos
           DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat  := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat   := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat   := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat  := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat  := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 2);
           DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 2);

           //DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //Descuentos
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //Descuentos
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 4);

           //DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5); //Descuentos
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5); //Descuentos
           //DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 5);
           //DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 5);
           //Final HPC_201403_FAC
         //Final HPC_201405_FAC
      End;

      sArticulo := DMFAC.BuscaQry('dspUltTGE', 'CAJA201', 'ARTID', 'CPTOID=''' + DMFAC.cdsQry10.FieldByname('CPTOID').AsString + ''' AND CPTOIS=''I''', 'ARTID');
      xFiltro := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
         + ' AND TINID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('TINID').AsString)
         + ' and ARTID=' + QuotedStr(sArticulo);

      Filtracds(DMFAC.cdsUltTGE, 'SELECT GRARID, FAMID, SFAMID, TINID, ARTCONT, UNMIDG, UNMIDU, ARTIGV, ARTDES FROM TGE205 WHERE ' + xFiltro);

  //Llenado de Campos del Maestro de Articulos
      DMFAC.cdsDetFact2.FieldByName('GRARID').AsString := DMFAC.cdsUltTGE.FieldByName('GRARID').AsString; // Linea
      DMFAC.cdsDetFact2.FieldByName('FAMID').AsString := DMFAC.cdsUltTGE.FieldByName('FAMID').AsString; // Familia
      DMFAC.cdsDetFact2.FieldByName('SFAMID').AsString := DMFAC.cdsUltTGE.FieldByName('SFAMID').AsString; // SubFamilia
      DMFAC.cdsDetFact2.FieldByName('TINID').AsString := DMFAC.cdsUltTGE.FieldByName('TINID').AsString; // SubFamilia
      DMFAC.cdsDetFact2.FieldByName('ALMID').AsString := DMFAC.cdsFact2.FieldByName('ALMID').AsString;
      DMFAC.cdsDetFact2.FieldByName('UNMIDG').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
      DMFAC.cdsDetFact2.FieldByName('UNMIDO').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
      DMFAC.cdsDetFact2.FieldByName('UNMABR').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
      DMFAC.cdsDetFact2.FieldByName('DFACCONT').AsString := 'S';
      DMFAC.cdsDetFact2.FieldByName('ARTID').AsString := sArticulo;
      DMFAC.cdsDetFact2.FieldByName('DFACIGV').AsString := DMFAC.cdsUltTGE.FieldByName('ARTIGV').AsString;
      DMFAC.cdsDetFact2.FieldByName('DFACISC').AsString := 'N';
      DMFAC.cdsDetFact2.FieldByName('TIPOADQ').AsString := 'C';
      DMFAC.cdsDetFact2.FieldByName('ARTDES').AsString := DMFAC.cdsUltTGE.FieldByName('ARTDES').AsString;
      DMFAC.cdsDetFact2.FieldByName('DOCID').AsString := DMFAC.cdsFact2.FieldByName('DOCID').AsString;
      DMFAC.cdsDetFact2.FieldByName('DFACGARAN').AsString := '';

      //Inicio HPC_201405_FAC
        //Inicio HPC_201403_FAC
        DMFAC.cdsDetFact2.FieldByName('CLIECREMAX').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('CLIECREMAX').AsFloat, 15, 2);
        //DMFAC.cdsDetFact2.FieldByName('CLIECREMAX').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('CLIECREMAX').AsFloat, 15, 5);
        //Final HPC_201403_FAC
      //Final HPC_201405_FAC

      DMFAC.cdsDetFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsFact2.FieldByName('CLIERUC').AsString; // Monto Dsctos

      If DMFAC.cdsDetFact2.FieldByName('CLIERUC').AsString = '' Then
         DMFAC.cdsDetFact2.FieldByName('CLIERUC').AsString := '00000000000';

      DMFAC.cdsDetFact2.FieldByName('TLISTAID').AsString := DMFAC.cdsFact2.FieldByName('TLISTAID').Asstring; // Monto Dsctos
      DMFAC.cdsDetFact2.FieldByName('FPAGOID').AsString := DMFAC.cdsFact2.FieldByName('FPAGOID').AsString;
      DMFAC.cdsDetFact2.FieldByName('VEID').AsString := DMFAC.cdsFact2.FieldByName('VEID').AsString;
      DMFAC.cdsDetFact2.FieldByName('LOCID').AsString := DMFAC.cdsFact2.FieldByName('LOCID').AsString;
      DMFAC.cdsDetFact2.FieldByName('FACTIP').AsString := 'N'; // Variable para indicar el tipo de Factura en Filtros; con Guia
      DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString := 'X';
      DMFAC.cdsDetFact2.Post;

      DMFAC.cdsQry10.Next;
   End;

   //INICIO HPC_201403_FAC
   //DMFAC.ControlTran(9, DMFAC.cdsDetFact2, 'DFACSGUIA');
   xContinuaGrab := True;
   if DMFAC.cdsDetFact2.ApplyUpdates(0)>0 then
   begin
     ShowMessage('Error al intentar grabar Detalle de la Factura (FAC306) ');
     DMFAC.DCOM1.AppServer.RetornaTransaccion;
     xContinuaGrab := False;
     exit;
   end;
   //FINAL HPC_201403_FAC


End;

Procedure TFCobroServicios.ActualizaCabecera;
Var
   xTMonto, xTDscto: double;
   xTIgv1, xTIgv2, xTIsc, xTFact: double; //Montos Totales de IGV e ISC
Begin
 // Calcula Sumatorias del Detalle

   xTMonto := 0; // Sumatoria Monto Total del Detalle
   xTDscto := 0; // Total Descuentos
   xTIgv1 := 0; // Total IGV
   xTIgv2 := 0; // Total IGV 2
   xTIsc := 0; // Total ISC

 // Totaliza Montos del Detalle
   DMFAC.cdsDetFact2.First;
   DMFAC.cdsDetFact2.DisableControls;
   While Not DMFAC.cdsDetFact2.eof Do
   Begin
      If DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString <> 'N' Then
      Begin
         xTMonto := xTMonto + DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat;
         xTIgv1 := xTIgv1 + DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat; // Total IGV 1
         xTIgv2 := xTIgv2 + DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat; // Total IGV 2
         xTDscto := xTDscto + (DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat + DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat);
         xTFact := xTFact + DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat;
      End;
      DMFAC.cdsDetFact2.Next;
   End; //While
   DMFAC.cdsDetFact2.EnableControls;

   If DMFAC.cdsFact2.State = dsBrowse Then
      DMFAC.cdsFact2.Edit;

 // graba sumatorias del detalle en cabecera Fac
 // Si ventas son Local no se aplica embalaje
 // sino se se suma el embalaje al subtotal, en el caso de Provincias

 //Inicio HPC_201405_FAC
   //Inicio HPC_201403_FAC
   If (DMFAC.cdsFact2.FieldByName('TIPVTAID').AsString = DMFAC.wVtaLocal) Then //Zona Lima
       DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat := FRound(xTMonto, 15, 2) // Monto
   Else
      If (DMFAC.cdsFact2.FieldByName('TIPVTAID').AsString = DMFAC.wVtaProv) Then // Zona Provincias
         DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat := FRound(xTMonto + DMFAC.cdsFact2.FieldByName('FACEMBMO').AsFloat, 15, 2) // Monto
      Else
         DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat := FRound(xTMonto, 15, 2);
   DMFAC.cdsFact2.FieldByName('FACDCTOMO').AsFloat := FRound(xTDscto, 15, 2); // Monto Dsctos

   //If (DMFAC.cdsFact2.FieldByName('TIPVTAID').AsString = DMFAC.wVtaLocal) Then //Zona Lima
   //      DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat := FRound(xTMonto, 15, 5) // Monto
   //  Else
   //     If (DMFAC.cdsFact2.FieldByName('TIPVTAID').AsString = DMFAC.wVtaProv) Then // Zona Provincias
   //        DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat := FRound(xTMonto + DMFAC.cdsFact2.FieldByName('FACEMBMO').AsFloat, 15, 5) // Monto
   //     Else
   //        DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat := FRound(xTMonto, 15, 5);
   //  DMFAC.cdsFact2.FieldByName('FACDCTOMO').AsFloat := FRound(xTDscto, 15, 5); // Monto Dsctos
   //Final HPC_201403_FAC
 //Final HPC_201405_FAC

   xIsc := False;
   xIgv := True;
   If xIgv And Not xIsc Then
   Begin
       // Inicial HPC_201503_FAC
          DMFAC.cdsFact2.FieldByName('FACIGVMO').AsFloat := FRound(xTIgv1, 15, 2);
          DMFAC.cdsFact2.FieldByName('FACIGV2MO').AsFloat := FRound(xTIgv2, 15, 2);
          DMFAC.cdsFact2.FieldByName('FACISCMO').AsFloat := FRound(xTIsc, 15, 2);
          DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat := FRound(xTFact, 15, 2); // Monto Totales con IGV

        //DMFAC.cdsFact2.FieldByName('FACIGVMO').AsFloat := FRound(xTIgv1, 15, 5);
        //DMFAC.cdsFact2.FieldByName('FACIGV2MO').AsFloat := FRound(xTIgv2, 15, 5);
        //DMFAC.cdsFact2.FieldByName('FACISCMO').AsFloat := FRound(xTIsc, 15, 5);
        //DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat := FRound(xTFact, 15, 5); // Monto Totales con IGV
       // Final HPC_201503_FAC
   End;

   If DMFAC.cdsFact2.FieldByName('TMONID').AsString = DMFAC.wTMonLoc Then
   Begin
  //Igv
      //Inicio HPC_201405_FAC
        //Inicio HPC_201403_FAC
        If xIgv And Not xIsc Then
        Begin
           DMFAC.cdsFact2.FieldByName('FACTOTMN').AsFloat := FRound(xTFact, 15, 2); // Monto Totales con IGV
           DMFAC.cdsFact2.FieldByName('FACTOTME').Asfloat := FRound(xTFact / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2); // IGV en moneda extranjera
        End;
        DMFAC.cdsFact2.FieldByName('FACIGVMN').AsFloat := FRound(xTIGV1, 15, 2);
        DMFAC.cdsFact2.FieldByName('FACIGVME').AsFloat := FRound(xTIGV1 / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2); // IGV en moneda extranjera
        DMFAC.cdsFact2.FieldByName('FACIGV2MN').AsFloat := FRound(xTIGV2, 15, 2);
        DMFAC.cdsFact2.FieldByName('FACIGV2ME').AsFloat := FRound(xTIGV2 / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2); // IGV en moneda extranjera
        DMFAC.cdsFact2.FieldByName('FACISCMN').AsFloat := FRound(xTISC, 15, 2);
        DMFAC.cdsFact2.FieldByName('FACISCME').AsFloat := FRound(xTISC / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2); // ISC en moneda extranjera
        DMFAC.cdsFact2.FieldByName('FACMTOMN').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat, 15, 2); // Total en moneda local
        DMFAC.cdsFact2.FieldByName('FACMTOME').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2); // Total en moneda extranjera
        DMFAC.cdsFact2.FieldByName('FACDCTOMN').AsFloat := FRound(xTDscto, 15, 2); // Dscto en moneda Local
        DMFAC.cdsFact2.FieldByName('FACDCTOME').AsFloat := FRound(xTDscto / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2); // Dscto en moneda extranjera
        DMFAC.cdsFact2.FieldByName('FACEMBMN').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACEMBMO').AsFloat, 15, 2);
        DMFAC.cdsFact2.FieldByName('FACEMBME').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACEMBMO').AsFloat / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2)

        //If xIgv And Not xIsc Then
        //Begin
        //   DMFAC.cdsFact2.FieldByName('FACTOTMN').AsFloat := FRound(xTFact, 15, 5); // Monto Totales con IGV
        //   DMFAC.cdsFact2.FieldByName('FACTOTME').Asfloat := FRound(xTFact / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5); // IGV en moneda extranjera
        //End;
        //DMFAC.cdsFact2.FieldByName('FACIGVMN').AsFloat := FRound(xTIGV1, 15, 5);
        //DMFAC.cdsFact2.FieldByName('FACIGVME').AsFloat := FRound(xTIGV1 / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5); // IGV en moneda extranjera

        //DMFAC.cdsFact2.FieldByName('FACIGV2MN').AsFloat := FRound(xTIGV2, 15, 5);
        //DMFAC.cdsFact2.FieldByName('FACIGV2ME').AsFloat := FRound(xTIGV2 / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5); // IGV en moneda extranjera

        //DMFAC.cdsFact2.FieldByName('FACISCMN').AsFloat := FRound(xTISC, 15, 5);
        //DMFAC.cdsFact2.FieldByName('FACISCME').AsFloat := FRound(xTISC / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5); // ISC en moneda extranjera
        //DMFAC.cdsFact2.FieldByName('FACMTOMN').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat, 15, 5); // Total en moneda local
        //DMFAC.cdsFact2.FieldByName('FACMTOME').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5); // Total en moneda extranjera
        //DMFAC.cdsFact2.FieldByName('FACDCTOMN').AsFloat := FRound(xTDscto, 15, 5); // Dscto en moneda Local
        //DMFAC.cdsFact2.FieldByName('FACDCTOME').AsFloat := FRound(xTDscto / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5); // Dscto en moneda extranjera
        //DMFAC.cdsFact2.FieldByName('FACEMBMN').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACEMBMO').AsFloat, 15, 5);
        //DMFAC.cdsFact2.FieldByName('FACEMBME').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACEMBMO').AsFloat / FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5)
        //Inicio HPC_201403_FAC
      //Inicio HPC_201405_FAC
   End
   Else
   Begin
      //Inicio HPC_201405_FAC
        //Inicio HPC_201403_FAC
        If xIgv And Not xIsc Then
        Begin
           DMFAC.cdsFact2.FieldByName('FACTOTMN').Asfloat := FRound(xTFact * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2); // IGV en moneda extranjera
           DMFAC.cdsFact2.FieldByName('FACTOTME').Asfloat := FRound(xTFact, 15, 2); // Monto Totales con IGV
        End;
        DMFAC.cdsFact2.FieldByName('FACMTOMN').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2); // Total en moneda local
        DMFAC.cdsFact2.FieldByName('FACMTOME').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat, 15, 2); // Total en moneda extranjera
        DMFAC.cdsFact2.FieldByName('FACDCTOMN').AsFloat := FRound(xTDscto * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2); // Dscto en moneda Local
        DMFAC.cdsFact2.FieldByName('FACDCTOME').AsFloat := FRound(xTDscto, 15, 2); // Dscto en moneda extranjera
        DMFAC.cdsFact2.FieldByName('FACIGVMN').AsFloat := FRound(xTIGV1 * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2);
        DMFAC.cdsFact2.FieldByName('FACIGVME').AsFloat := FRound(xTIGV1, 15, 2); // IGV en moneda extranjera
        DMFAC.cdsFact2.FieldByName('FACIGV2MN').AsFloat := FRound(xTIGV2 * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2);
        DMFAC.cdsFact2.FieldByName('FACIGV2ME').AsFloat := FRound(xTIGV2, 15, 2); // IGV en moneda extranjera
        DMFAC.cdsFact2.FieldByName('FACISCMN').AsFloat := FRound(xTISC * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2);
        DMFAC.cdsFact2.FieldByName('FACISCME').AsFloat := FRound(xTISC, 15, 2); // ISC en moneda extranjera
        DMFAC.cdsFact2.FieldByName('FACEMBMN').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACEMBMO').AsFloat * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 3), 15, 2);
        DMFAC.cdsFact2.FieldByName('FACEMBME').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACEMBMO').AsFloat, 15, 2);

        //If xIgv And Not xIsc Then
        //Begin
        //   DMFAC.cdsFact2.FieldByName('FACTOTMN').Asfloat := FRound(xTFact * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5); // IGV en moneda extranjera
        //   DMFAC.cdsFact2.FieldByName('FACTOTME').Asfloat := FRound(xTFact, 15, 5); // Monto Totales con IGV
        //End;
        //DMFAC.cdsFact2.FieldByName('FACMTOMN').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5); // Total en moneda local
        //DMFAC.cdsFact2.FieldByName('FACMTOME').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat, 15, 5); // Total en moneda extranjera
        //DMFAC.cdsFact2.FieldByName('FACDCTOMN').AsFloat := FRound(xTDscto * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5); // Dscto en moneda Local
        //DMFAC.cdsFact2.FieldByName('FACDCTOME').AsFloat := FRound(xTDscto, 15, 5); // Dscto en moneda extranjera
        //DMFAC.cdsFact2.FieldByName('FACIGVMN').AsFloat := FRound(xTIGV1 * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5);
        //DMFAC.cdsFact2.FieldByName('FACIGVME').AsFloat := FRound(xTIGV1, 15, 5); // IGV en moneda extranjera

        //DMFAC.cdsFact2.FieldByName('FACIGV2MN').AsFloat := FRound(xTIGV2 * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5);
        //DMFAC.cdsFact2.FieldByName('FACIGV2ME').AsFloat := FRound(xTIGV2, 15, 5); // IGV en moneda extranjera

        //DMFAC.cdsFact2.FieldByName('FACISCMN').AsFloat := FRound(xTISC * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5);
        //DMFAC.cdsFact2.FieldByName('FACISCME').AsFloat := FRound(xTISC, 15, 5); // ISC en moneda extranjera
        //DMFAC.cdsFact2.FieldByName('FACEMBMN').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACEMBMO').AsFloat * FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 12, 5), 15, 5);
        //DMFAC.cdsFact2.FieldByName('FACEMBME').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACEMBMO').AsFloat, 15, 5);
        //Final HPC_201403_FAC
      //Final HPC_201405_FAC
   End;
   DMFAC.cdsFact2.Post;


   //INICIO HPC_201403_FAC
   //DMFAC.ControlTran(9, DMFAC.cdsFact2, 'FACSGUIA');
   xContinuaGrab := True;
   if DMFAC.cdsFact2.ApplyUpdates(0)>0 then
   begin
     ShowMessage('Error al intentar grabar Cabecera de la Factura (FAC305) ');
     DMFAC.DCOM1.AppServer.RetornaTransaccion;
     xContinuaGrab := False;
     exit;
   end;
   //FINAL HPC_201403_FAC

End;

Procedure TFCobroServicios.bbtnTransfCajaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   Try
      FTransfRecibos := TFTransfRecibos.Create(application);
      FTransfRecibos.ShowModal;
   Finally
      FTransfRecibos.Free;
   End;

   bbtnOrdFechaClick(self);

   meReg.Text := IntToStr(DMFAC.cdsQry9.RecordCount);
End;

Procedure TFCobroServicios.bbtnTransfCreditoClick(Sender: TObject);
Var
   xSQL: String;
Begin
   Try
      FTransfCredito := TFTransfCredito.Create(application);
      FTransfCredito.ShowModal;
   Finally
      FTransfCredito.Free;
   End;

   bbtnOrdFechaClick(self);

   meReg.Text := IntToStr(DMFAC.cdsQry9.RecordCount);
End;

Procedure TFCobroServicios.Z2bbtnImprimeClick(Sender: TObject);
Begin
   ppdb1.dataSource := DMFAC.dsQry9;
   ppr1.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\CobranzasxFacturar.Rtm';
   ppr1.Template.LoadFromFile;

   If cbDiseno.Checked Then
      ppd1.ShowModal
   Else
      ppr1.Print;

   ppr1.Stop;
   ppdb1.dataSource := Nil;
End;

Procedure TFCobroServicios.bbtnBuscaBolClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMFAC.cdsQry9.Recordcount = 0 Then
   Begin
      ShowMessage('No Existen registros Para Facturar. Verificar.');
      Exit;
   End;

   xSQL := 'SELECT CIAID, FACFECHA, DOCID, FACSERIE, NFAC, CLIEDES, TMONID, FACTOTMO, '
      + 'DOCPAG, NUMDOCPAG, FACUSER, FACFREG '
      + 'FROM FAC305 B '
      + 'WHERE CIAID=''' + cCiaCob + ''' AND B.FACFECHA>=''01/12/2005'' AND FACESTADO=''ACEPTADO'' '
      + 'AND CLIEDES=''' + DMFAC.cdsQry9.FieldByName('NOMBRE').AsString + ''' '
      // +  'AND FACTOTMO=' +DMFAC.cdsQry9.FieldByName('IMPORTE').AsString+' '
   + 'Order by FACFECHA, DOCID, FACSERIE, NFAC';
   DMFAC.cdsQry5.Close;
   DMFAC.cdsQry5.DataRequest(xSQL);
   DMFAC.cdsQry5.Open;

   If DMFAC.cdsQry5.Recordcount = 0 Then
   Begin
      ShowMessage('No existen Facturas Generadas para el Cliente');
      Exit;
   End;

   Try
      FBuscarFactura := TFBuscarFactura.Create(Self);
      FBuscarFactura.ShowModal;
   Finally
      FBuscarFactura.Free;
   End;
End;

Procedure TFCobroServicios.bbtnPagoClick(Sender: TObject);
Begin
   Try
      FBuscarPagos := TFBuscarPagos.Create(Self);
      FBuscarPagos.ShowModal;
   Finally
      FBuscarPagos.Free;
   End;

End;

Procedure TFCobroServicios.bbtnFacturaClick(Sender: TObject);
Begin
   If DMFAC.cdsQry9.Recordcount = 0 Then
   Begin
      ShowMessage('No Existen registros Para Facturar. Verificar.');
      Exit;
   End;

   sTipoReg := 'N';
   cDocSel := xFact;
   cTClie := '02';

   Try
      bFactura := False;

      FGenFactura := TFGenFactura.Create(Self);
      FGenFactura.dblcTClie.Text := cTClie;
      FGenFactura.dblcTdoc.Text := cDocSel;
      FGenFactura.dtpFFac.Date := dtpFecha.Date;
      FGenFactura.ShowModal;
   Finally

      If bFactura Then
      Begin

         xFecHoy := dtpFecha.Date;

         //INICIO HPC_201403_FAC
         //InsertaFacturaCabecera;
         DMFAC.DCOM1.AppServer.IniciaTransaccion;
         GrabaCabecera;
         If xContinuaGrab  Then
         Begin
           If DMFAC.cdsQry9.FieldByName('DOCPAG').AsString = '37' Then
              InsertaFacturaDetalleCaja
           Else
              InsertaFacturaDetalle;

           If xContinuaGrab  Then
           Begin
             ActualizaCabecera;
             If xContinuaGrab  Then
             Begin
               fSigue := True;
               FGenFactura.Free;
               Close;
               DMFAC.DCOM1.AppServer.GrabaTransaccion
             End;
           End;

        End;
      End
      Else
         FGenFactura.Free;
     //FINAL HPC_201403_FAC
   End;
End;

Procedure TFCobroServicios.dbgTransfIButtonClick(Sender: TObject);
Begin
   bbtnOrdNombreClick(Self);
   pnlBusca.Visible := True;
   isBusca.SetFocus;
End;

Procedure TFCobroServicios.dbgTransfEnter(Sender: TObject);
Begin
   pnlBusca.Visible := False;
End;

Procedure TFCobroServicios.isBuscaExit(Sender: TObject);
Begin
   pnlBusca.Visible := False;
End;

Procedure TFCobroServicios.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFCobroServicios.bbtnOrdFechaClick(Sender: TObject);
Var
   xSQL: String;
Begin
(*
  xSQL:='SELECT A.*, B.CPTODES FROM CXC_ING_VAR_SER A, CAJA201 B '
       +'WHERE A.NODOC IS NULL AND B.CPTOID=A.CPTOID '
       +  'and B.CIAID='''+cCiaCob+''' AND B.TINID='''+cTinCob+''' '
       +  'and NVL(ANULADO,''N'')=''N'' '
       +'order by FECPAG, FORPAG, DOCPAG, NUMDOCPAG';
       *)

   xSQL := 'SELECT A.*, B.CPTODES FROM CXC_ING_VAR_SER A, CAJA201 B '
      + 'WHERE A.NODOC IS NULL AND B.CPTOID=A.CPTOID '
      + ' and B.CIAID=''' + cCiaCob + ''' AND B.TINID=''' + cTinCob + ''' '
      + ' and NVL(ANULADO,''N'')=''N'' '
       //+  ' and NOT (A.CPTOID IN (''IN0136'',''IN0137'') AND (A.forpag in (''BECAS'',''CHEQUE'',''BANCO_OCTA'') OR (MOD(A.IMPORTE,17.25)=0))) '
   + ' and NOT (A.CPTOID IN (''IN0151'') AND (A.forpag in (''BECAS'',''CHEQUE'',''BANCO_OCTA'') OR (MOD(A.IMPORTE,17.25)=0))) '
      + 'order by FECPAG, FORPAG, DOCPAG, NUMDOCPAG';

   xSQL := 'SELECT A.*, B.CPTODES FROM CXC_ING_VAR_SER A, CAJA201 B '
      + 'WHERE A.NODOC IS NULL AND B.CPTOID=A.CPTOID '
      + ' and B.CIAID=''' + cCiaCob + ''' AND B.TINID=''' + cTinCob + ''' '
      + ' and NVL(ANULADO,''N'')=''N'' '
      + ' and FECPAG>=''01/01/2009'' '
      + 'order by FECPAG, FORPAG, DOCPAG, NUMDOCPAG';

   DMFAC.cdsQry9.Close;
   DMFAC.cdsQry9.DataRequest(xSql);
   DMFAC.cdsQry9.Open;

   meReg.Text := IntToStr(DMFAC.cdsQry9.RecordCount);
End;

Procedure TFCobroServicios.bbtnOrdNombreClick(Sender: TObject);
Var
   xSQL: String;
Begin
(*
  xSQL:='SELECT A.*, B.CPTODES FROM CXC_ING_VAR_SER A, CAJA201 B '
       +'WHERE A.NODOC IS NULL AND B.CPTOID=A.CPTOID '
       +  'and B.CIAID='''+cCiaCob+''' AND B.TINID='''+cTinCob+''' '
       +'order by A.NOMBRE';
       *)

   xSQL := 'SELECT A.*, B.CPTODES FROM CXC_ING_VAR_SER A, CAJA201 B '
      + 'WHERE A.NODOC IS NULL AND B.CPTOID=A.CPTOID '
      + 'and B.CIAID=''' + cCiaCob + ''' AND B.TINID=''' + cTinCob + ''' '
      + ' and NOT (A.CPTOID IN (''IN0136'',''IN0137'') AND (A.forpag in (''BECAS'',''CHEQUE'',''BANCO_OCTA'') OR (MOD(A.IMPORTE,17.25)=0))) '
      + 'order by A.NOMBRE';

   DMFAC.cdsQry9.Close;
   DMFAC.cdsQry9.DataRequest(xSql);
   DMFAC.cdsQry9.Open;

   meReg.Text := IntToStr(DMFAC.cdsQry9.RecordCount);
End;

Procedure TFCobroServicios.bbtnFacCobClick(Sender: TObject);
Begin

   sTipoReg := 'S';
   cDocSel := xFact;

   Try
      bFactura := False;
      FGenFactura := TFGenFactura.Create(Self);
      FGenFactura.lblTit1.Visible := False;
      FGenFactura.dbeClientePago.Visible := False;
      FGenFactura.dblcTdoc.Enabled := True;
      FGenFactura.dblcTdoc.Text := cDocSel;
      FGenFactura.dtpFFac.Date := dtpFecha.Date;
      FGenFactura.dblcTClie.Text := '02';
      FGenFactura.dbgDetalle.Enabled := False;
      FGenFactura.dbgDetalle.DataSource := Nil;
      FGenFactura.ShowModal;
   Finally

      If bFactura Then
      Begin
         cDocSel := FGenFactura.dblcTdoc.Text;
         xFecHoy := dtpFecha.Date;
         //INICIO HPC_201403_FAC
         DMFAC.DCOM1.AppServer.IniciaTransaccion;

         xContinuaGrab := True;
         DMFAC.wModo := 'A';
         InsertaFacturaCabeceraxCob;
         If xContinuaGrab  Then
         Begin
           fSigue := True;
           FGenFactura.Free;
           Close;
           DMFAC.DCOM1.AppServer.GrabaTransaccion
         End;
       //FINAL HPC_201403_FAC
      End
      Else
         FGenFactura.Free;

   End;
End;

Procedure TFCobroServicios.BitBtn1Click(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMFAC.cdsQry9.Recordcount = 0 Then
   Begin
      ShowMessage('No Existen registros Para Facturar. Verificar.');
      Exit;
   End;

   If MessageDlg(' Ingreso es por BECA ¿ Esta Seguro ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin

      xSQL := 'UPDATE CXC_ING_VAR_SER '
         + 'SET CIAFAC=''' + cCiaCob + ''', DOCID=''00'', SERIE=''000'', NODOC=''BECA'', '
         + 'FECFAC=SYSDATE, USUDOC=''' + DMFAC.wUsuario + ''', FECREGDOC=SYSDATE '
         + 'WHERE DOCPAG=' + Quotedstr(DMFAC.cdsQry9.FieldByName('DOCPAG').AsString) + ' '
         + 'AND NUMDOCPAG=' + Quotedstr(DMFAC.cdsQry9.FieldByName('NUMDOCPAG').AsString) + ' '
         + 'AND NOMBRE=' + Quotedstr(DMFAC.cdsQry9.FieldByName('NOMBRE').AsString) + ' '
         + 'AND CLIEID=' + Quotedstr(DMFAC.cdsQry9.FieldByName('CLIEID').AsString) + ' '
         + 'AND NODOC IS NULL';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Documento de Pago ya fue Facturado por Otro Usuario');
         DMFAC.ControlTran(1, Nil, '');
      End;

      ShowMessage('Ok');

      bbtnOrdFechaClick(self);
      meReg.Text := IntToStr(DMFAC.cdsQry9.RecordCount);
   End;
End;

Procedure TFCobroServicios.dbgTransfRowChanged(Sender: TObject);
Begin
   dtpFecha.Date := DMFAC.cdsQry9.FieldByName('FECPAG').AsDateTime;
End;

Procedure TFCobroServicios.bbtnEliminarClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMFAC.cdsQry9.Recordcount = 0 Then
   Begin
      ShowMessage('No Existen registros Para Facturar. Verificar.');
      Exit;
   End;

   If MessageDlg('Eliminar Registro porque ya fue Facturado ¿ Esta Seguro ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin

      xSQL := 'UPDATE CXC_ING_VAR_SER '
         + 'SET CIAFAC=''' + cCiaCob + ''', DOCID=''00'', SERIE=''000'', NODOC=''NO FACTURA'', '
         + 'USUDOC=''' + DMFAC.wUsuario + ''', FECREGDOC=SYSDATE '
         + 'WHERE DOCPAG=' + Quotedstr(DMFAC.cdsQry9.FieldByName('DOCPAG').AsString) + ' '
         + 'AND NUMDOCPAG=' + Quotedstr(DMFAC.cdsQry9.FieldByName('NUMDOCPAG').AsString) + ' '
         + 'AND NOMBRE=' + Quotedstr(DMFAC.cdsQry9.FieldByName('NOMBRE').AsString) + ' '
         + 'AND CLIEID=' + Quotedstr(DMFAC.cdsQry9.FieldByName('CLIEID').AsString) + ' '
         + 'AND NODOC IS NULL';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Documento de Pago ya fue Facturado por Otro Usuario');
         DMFAC.ControlTran(1, Nil, '');
      End;

      bbtnOrdFechaClick(self);
      meReg.Text := IntToStr(DMFAC.cdsQry9.RecordCount);

      ShowMessage('Ok');
   End;
End;

Procedure TFCobroServicios.FormShow(Sender: TObject);
Begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));
End;

//Inserta en la Factura306

Procedure TFCobroServicios.InsertaFac306;
Var
   Xsql: String;
Begin
{
   xsql := 'Insert into  Fac306(DFACITEM,CIAID,CLIEID,FACSERIE,NFAC,CLAUXID,TMONID,DFACTCAM,DFACESTADO,DFACUSER,FACFECHA'
      +'                    DFACFREG,FACFECHA,DFACFREG,FACTCLI,DFACHREG,DFACHOR,DFACANOMES,DFACAAAA,DFACMM,DFACDD,DFACTRI ';

   DMFAC.cdsDetFact2.Insert;
   DMFAC.cdsDetFact2.FieldByName('DFACITEM').AsString := DMFAC.StrZero(DMFAC.MaxValue('DFACITEM', DMFAC.cdsDetFact2), 3);
   DMFAC.cdsDetFact2.FieldByName('CIAID').AsString := DMFAC.cdsFact2.FieldByName('CIAID').AsString;
   DMFAC.cdsDetFact2.FieldByName('CLIEID').AsString := DMFAC.cdsFact2.FieldByName('CLIEID').AsString;
   DMFAC.cdsDetFact2.FieldByName('FACSERIE').AsString := DMFAC.cdsFact2.FieldByName('FACSERIE').AsString;
   DMFAC.cdsDetFact2.FieldByName('NFAC').AsString := DMFAC.cdsFact2.FieldByName('NFAC').AsString;
   DMFAC.cdsDetFact2.FieldByName('CLAUXID').AsString := DMFAC.cdsFact2.FieldByName('CLAUXID').AsString;
   DMFAC.cdsDetFact2.FieldByName('TMONID').AsString := DMFAC.cdsFact2.FieldByName('TMONID').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 15, 4);
   DMFAC.cdsDetFact2.FieldByName('DFACESTADO').AsString := 'ACEPTADO';
   DMFAC.cdsDetFact2.FieldByName('DFACUSER').AsString := DMFAC.wUsuario;
   DMFAC.cdsDetFact2.FieldByName('FACFECHA').value := DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime;
   DMFAC.cdsDetFact2.FieldByName('DFACFREG').Value := xFecHoy;
   DMFAC.cdsDetFact2.FieldByName('FACTCLI').AsString := DMFAC.cdsFact2.FieldByName('FACTCLI').AsString;

   DMFAC.cdsDetFact2.FieldByName('DFACHREG').AsDatetime := xFecHoy + Time;
   DMFAC.cdsDetFact2.FieldByName('DFACHOR').AsDateTime := xFecHoy + Time;

   DMFAC.cdsDetFact2.FieldByName('DFACANOMES').AsString := DMFAC.cdsFact2.FieldByName('FACANOMES').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACAAAA').AsString := DMFAC.cdsFact2.FieldByName('FACAAAA').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACMM').AsString := DMFAC.cdsFact2.FieldByName('FACMM').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACDD').AsString := DMFAC.cdsFact2.FieldByName('FACDD').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACTRI').AsString := DMFAC.cdsFact2.FieldByName('FACTRI').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACSEM').AsString := DMFAC.cdsFact2.FieldByName('FACSEM').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACSS').AsString := DMFAC.cdsFact2.FieldByName('FACSS').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACAATRI').AsString := DMFAC.cdsFact2.FieldByName('FACAATRI').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACAASEM').AsString := DMFAC.cdsFact2.FieldByName('FACAASEM').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACAASS').AsString := DMFAC.cdsFact2.FieldByName('FACAASS').AsString;

   xImpTasa := StrToFloat(DMFAC.BuscaQry('dspUltTGE', 'TGE108', 'TASACAN', 'TASAFLG =''I''', 'TASACAN'));

   xImp1 := xImpTasa;

  //xPrecio := FRound(DMFAC.cdsQry9.FieldByname('IMPORTE').AsFloat / ( 1 + (xImpTasa/100) ), 15,2);
  xPrecio := FRound((DMFAC.cdsQry10.FieldByname('DEMTOORI').AsFloat + DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat) / (1 + (xImpTasa / 100)), 15, 2);

  //xTotImp1:= FRound(DMFAC.cdsQry9.FieldByname('IMPORTE').AsFloat-xPrecio, 15,2);
   xTotImp1 := FRound((DMFAC.cdsQry10.FieldByname('DEMTOORI').AsFloat + DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat) - xPrecio, 15, 2);

   xsql := 'Insert into  Fac306(DFACITEM,CIAID,CLIEID,FACSERIE,NFAC,CLAUXID,TMONID,DFACTCAM,DFACESTADO,DFACUSER,FACFECHA,' +
      '                    DFACFREG,FACFECHA,DFACFREG,FACTCLI,DFACHREG,DFACHOR,DFACANOMES,DFACAAAA,DFACMM,DFACDD,DFACTRI,' +
      '                    DFACSEM,DFACSS,DFACAATRI,DFACAASEM,DFACAASS,DFACPREUMO,DFACDCTO,DFACDTOUMO,DFACDCTO2,DFACDTOMO2,' +
      '                    DFACIMP1,DFACIMPMTO1,DFACIMP2,DFACIMPMTO2,DFACMTOMO,DFACVTOTMO,DFACCANTG,DFACCANTAT,DFACPREVMO,TMONID,' +
      '                    DFACPREUMN,DFACDTOUMN,DFACDTOMN2,DFACMTOMN,DFACVTOTMN,DFACIMPMTN1,DFACIMPMTN2,FACTCAM,DFACPREUME,DFACDTOUME,' +
      '                    DFACDTOME2,DFACMTOME,DFACVTOTME,DFACIMPMTE1,DFACIMPMTE2,DFACPREUME,DFACPREUMN,DFACDTOUMN,DFACDTOUME,DFACDTOMN2,' +
      '                    DFACDTOME2,DFACMTOMN,DFACMTOME,DFACVTOTMN,DFACVTOTME,DFACIMPMTN1,DFACIMPMTE1,DFACIMPMTN2,DFACIMPMTE2

   DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat := FRound(xPrecio / DMFAC.cdsQry10.FieldByName('CANTIDAD').AsFloat, 15, 4); //Precio
 //Descuentos 01
   DMFAC.cdsDetFact2.FieldByName('DFACDCTO').AsFloat := 0; //Porcentaje Descuentos 1
   DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat := 0; //Monto Descuento 1
 //Descuentos 02
   DMFAC.cdsDetFact2.FieldByName('DFACDCTO2').AsFloat := 0; //Porcentaje Descuentos 2
   DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat := 0; //Descuento 2

   DMFAC.cdsDetFact2.FieldByName('DFACIMP1').AsFloat := FRound(xImp1, 15, 4); //Porcentaje Impuesto 1
   DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat := FRound(xTotImp1, 15, 4); //Monto Impuesto 1

   DMFAC.cdsDetFact2.FieldByName('DFACIMP2').AsFloat := 0; //Porcentaje Impuesto 2
   DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat := 0; //Monto Impuesto 2

   DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat := FRound(xPrecio, 15, 4); //Precio

   DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat := FRound(DMFAC.cdsQry10.FieldByname('DEMTOORI').AsFloat + DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2

   DMFAC.cdsDetFact2.FieldByName('DFACCANTG').AsFloat := DMFAC.cdsQry10.FieldByName('CANTIDAD').AsFloat;
   DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat := DMFAC.cdsQry10.FieldByName('CANTIDAD').AsFloat;

   DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat, 15, 4);

   If (DMFAC.cdsDetFact2.FieldByName('TMONID').AsString = DMFAC.wTMonLoc) Then
   Begin
      DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
      DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 4); //Monto Impuesto 2
      If DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat > 0 Then
      Begin
         DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //Precios
         DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //descuentos 1
         DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //descuentos 2
         DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
         DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
         DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
         DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
      End;
   End
   Else
   Begin
      DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //Descuentos
      DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4); //Descuentos
      DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 4);

      DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat, 15, 4);

      DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat, 15, 4);

      DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat * DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat := FRound(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat, 15, 4);
   End;

  //sArticulo:= DMFAC.BuscaQry('dspUltTGE', 'CAJA201', 'ARTID', 'CPTOID='''+DMFAC.cdsQry9.FieldByname('CPTOID').AsString+''' AND CPTOIS=''I''', 'ARTID');
   sArticulo := DMFAC.BuscaQry('dspUltTGE', 'CAJA201', 'ARTID', 'CPTOID=''' + DMFAC.cdsQry10.FieldByname('CPTOID').AsString + ''' AND CPTOIS=''I''', 'ARTID');

   xFiltro := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
      + ' AND TINID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('TINID').AsString)
      + ' and ARTID=' + QuotedStr(sArticulo);

   Filtracds(DMFAC.cdsUltTGE, 'SELECT GRARID, FAMID, SFAMID, TINID, ARTCONT, UNMIDG, UNMIDU, ARTIGV, ARTDES FROM TGE205 WHERE ' + xFiltro);

  //Llenado de Campos del Maestro de Articulos
   DMFAC.cdsDetFact2.FieldByName('GRARID').AsString := DMFAC.cdsUltTGE.FieldByName('GRARID').AsString; // Linea
   DMFAC.cdsDetFact2.FieldByName('FAMID').AsString := DMFAC.cdsUltTGE.FieldByName('FAMID').AsString; // Familia
   DMFAC.cdsDetFact2.FieldByName('SFAMID').AsString := DMFAC.cdsUltTGE.FieldByName('SFAMID').AsString; // SubFamilia
   DMFAC.cdsDetFact2.FieldByName('TINID').AsString := DMFAC.cdsUltTGE.FieldByName('TINID').AsString; // SubFamilia

   DMFAC.cdsDetFact2.FieldByName('ALMID').AsString := DMFAC.cdsFact2.FieldByName('ALMID').AsString;

   DMFAC.cdsDetFact2.FieldByName('UNMIDG').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
   DMFAC.cdsDetFact2.FieldByName('UNMIDO').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
   DMFAC.cdsDetFact2.FieldByName('UNMABR').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
   DMFAC.cdsDetFact2.FieldByName('DFACCONT').AsString := 'S';

   DMFAC.cdsDetFact2.FieldByName('ARTID').AsString := sArticulo;
   DMFAC.cdsDetFact2.FieldByName('DFACIGV').AsString := DMFAC.cdsUltTGE.FieldByName('ARTIGV').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACISC').AsString := 'N';

   DMFAC.cdsDetFact2.FieldByName('TIPOADQ').AsString := 'C';
   DMFAC.cdsDetFact2.FieldByName('ARTDES').AsString := DMFAC.cdsUltTGE.FieldByName('ARTDES').AsString;
   ;

   DMFAC.cdsDetFact2.FieldByName('DOCID').AsString := DMFAC.cdsFact2.FieldByName('DOCID').AsString;
   DMFAC.cdsDetFact2.FieldByName('DFACGARAN').AsString := '';
   DMFAC.cdsDetFact2.FieldByName('CLIECREMAX').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('CLIECREMAX').AsFloat, 15, 2);
   DMFAC.cdsDetFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsFact2.FieldByName('CLIERUC').AsString; // Monto Dsctos

  // VHNDEMA
   If DMFAC.cdsDetFact2.FieldByName('CLIERUC').AsString = '' Then
      DMFAC.cdsDetFact2.FieldByName('CLIERUC').AsString := '00000000000';
  // END VHNDEMA

   DMFAC.cdsDetFact2.FieldByName('TLISTAID').AsString := DMFAC.cdsFact2.FieldByName('TLISTAID').Asstring; // Monto Dsctos
   DMFAC.cdsDetFact2.FieldByName('FPAGOID').AsString := DMFAC.cdsFact2.FieldByName('FPAGOID').AsString;
   DMFAC.cdsDetFact2.FieldByName('VEID').AsString := DMFAC.cdsFact2.FieldByName('VEID').AsString;
   DMFAC.cdsDetFact2.FieldByName('LOCID').AsString := DMFAC.cdsFact2.FieldByName('LOCID').AsString;
   DMFAC.cdsDetFact2.FieldByName('FACTIP').AsString := 'N'; // Variable para indicar el tipo de Factura en Filtros; con Guia
   DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString := 'X';
}
End;


//INICIO HPC_201403_FAC
procedure TFCobroServicios.GrabaCabecera;
Var
   xFiltro,xSql, xWhere: String;
   vTCambio: Double;
   vFACDSCTO1,vCLIECREMAX,vFACIGV2MN,vFACIGV2ME,vFACIGV2MO,vFACESTADO,vFACTCLI,vFACTOBS,vFACFEVCMTO,
   vCLIEID,vCLAUXID,vCLIEDES,vCLIERUC,vCLIEDIR,vTIPVTAID,vFACFREG,vFACUSER,vFACANOMES,vFACFLAGD,vFACTIP,
   vDOCPAG,vNUMDOCPAG,vDETRACCION,Horasys,vFechaHora : String;
   //vFechaHora : TDateTime;
Begin


   xContinuaGrab := True;
   CabeceraDatosUsuario;
   If not xContinuaGrab  Then
   Begin
     DMFAC.DCOM1.AppServer.RetornaTransaccion;
     xContinuaGrab := False;
     Exit;
   End;

   xWhere := 'TMONID =' + QuotedStr(DMFAC.wTMonExt)
            +' AND FECHA = ' + DMFAC.wRepFuncDate + '''' + FormatDateTime(DMFAC.wFormatFecha, xFecHoy) + '''' + ')';
   If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xWhere, 'TMONID')) > 0 Then
   Begin
      vTCambio := DMFAC.cdsQry.FieldByName('TCAMVBV').AsFloat;
   End;

   vFACDSCTO1  := '0';
   vCLIECREMAX := '0';
   vFACIGV2MN  := '0';
   vFACIGV2ME  := '0';
   vFACIGV2MO  := '0';
   vFACESTADO  := 'INICIAL';
   vFACANOMES  := FormatDateTime('YYYYMM',dtpFecha.Date);
   DMFAC.cdsQry1.Close;
   DMFAC.cdsQry1.DataRequest('SELECT TO_CHAR(SYSDATE,''HH24:MI:SS'') AS HORA FROM DUAL');
   DMFAC.cdsQry1.Open;
   Horasys := DMFAC.cdsQry1.fieldbyname('HORA').AsString;
// Inicio HPC_201408_FAC
   vFechaHora  := dtpFecha.Text+' '+Horasys;
// Fin HPC_201408_FAC

   If DMFAC.cdsQry9.FieldByName('CLAUXID').AsString = 'AS' Then
   Begin
      vFACTCLI  := '01';
      vTLISTAID := 'ASO';
   End
   Else
   Begin
      vFACTCLI  := '02';
      vTLISTAID := 'PEG';
   End;

   vFACTOBS    := '.';
   vFACTCLI    := FGenFactura.dblcTClie.Text;

   If FGenFactura.dblcTClie.Text = '01' Then
   Begin
      vCLIEID  := FGenFactura.dblcdAso.Text;
      vCLAUXID := 'AS';
   End
   Else
   Begin
      vCLIEID  := FGenFactura.dblcdClie.Text;
      vCLAUXID := 'C';
   End;

   vCLIEDES  := FGenFactura.edtclie.Text;
   vCLIERUC  := FGenFactura.dblcdClieRuc.Text;

// Inicio HPC_201408_FAC
   FGenFactura.edtDireccion.Text := StringReplace(FGenFactura.edtDireccion.Text,'''','',[rfReplaceAll]);
   vCLIEDIR  := copy(FGenFactura.edtDireccion.Text,1,100);
// Fin HPC_201408_FAC

   if vCLIERUC  = '' Then vCLIERUC := '00000000000';

   vTIPVTAID   := '01';
   vFACUSER    := DMFAC.wUsuario;
   vFACFLAGD   := 'N';
   vFACTIP     := 'N'; // Variable para indicar el tipo de Factura en Filtros; con Guia

   // RECIBO DE CAJA
   vDOCPAG     := DMFAC.cdsQry9.FieldByName('DOCPAG').AsString;
   vNUMDOCPAG  := DMFAC.cdsQry9.FieldByName('NUMDOCPAG').AsString;
   vDETRACCION := FloatToStr(DMFAC.cdsQryDet.FieldByname('IMPDET').AsFloat);

   xContinuaGrab := True;
   NumeroFactura;
   If not xContinuaGrab  Then
   Begin
     DMFAC.DCOM1.AppServer.RetornaTransaccion;
     xContinuaGrab := False;
     Exit;
   End;

// Inicio HPC_201408_FAC
   xSql:='Insert Into FAC305(Ciaid,Locid,TipoAdq,Tinid,Almid,'+
            '             Docid,FacFecha,FacTCli,Clieid,'+
            '             Facserie,ClieRuc,ClieDir,'+
            '             Fpagoid,FacFeVcmto,Veid,'+
            '             TListaid,Tmonid,FacTCam,Nfac,ClieCremax,'+
            '             FactObs,FacEstado,Docpag,Numdocpag,Detraccion,'+
            '             Clauxid,Tipvtaid,Cliedes,Facdscto1,Facigv2mn,Facigv2me,Facigv2mo,'+
            '             Fachreg,Facfreg,FacUser,FacTip,FacFlagD,FacAnomes)'+
            '   Values('''+vCIAID+''','''+vLOCID+''','''+vTIPOADQ+''','''+vTINID+''','''+vALMID+''','+
            '          '''+vDOCID+''','''+dtpFecha.Text+''','''+vFACTCLI+''','''+vCLIEID+''','+
            '          '''+vFACSERIE+''','''+vCLIERUC+''','+quotedstr(vCLIEDIR)+','+
            '          '''+vFPAGOID+''','''+dtpFecha.Text+''','''+vVEID+''','+
            '          '''+vTLISTAID+''','''+vTMONID+''','+FloatToStr(vTCambio)+','''+vNFAC+''','''+vCLIECREMAX+''','+
            '          '''+vFACTOBS+''','''+vFACESTADO+''','''+vDOCPAG+''','''+vNUMDOCPAG+''','''+vDETRACCION+''','+
            '          '''+vCLAUXID+''','''+vTIPVTAID+''','''+vCLIEDES+''','''+vFACDSCTO1+''','''+vFACIGV2MN+''','''+vFACIGV2ME+''','''+vFACIGV2MO+''','+
//            '          TO_DATE('+QuotedStr(vFechaHora)+',''dd/mm/yyyy hh24:mi:ss''),'''+dtpFecha.Text+''','''+DMFAC.wUsuario+''','''+vFacTip+''','''+vFACFLAGD+''','''+vFACANOMES+''')';
            '          sysdate,'''+dtpFecha.Text+''','''+DMFAC.wUsuario+''','''+vFacTip+''','''+vFACFLAGD+''','''+vFACANOMES+''')';
// Fin HPC_201408_FAC
  Try
     DMFAC.DCOM1.AppServer.EjecutaSQL(xSql);
   Except
     Showmessage('No se pudo grabar la cabecera de la Facturación FAC305 ');
     DMFAC.DCOM1.AppServer.RetornaTransaccion;
     xContinuaGrab := False;
     Exit;
   End;


    //Graba transaccion
    DMFAC.DCOM1.AppServer.GrabaTransaccion;

   //Filtra datos grabados
      xSQL := 'Select * '
         + '  from FAC305 '
         + ' where CIAID=' + Quotedstr(vCIAID)
         + '   and DOCID=' + Quotedstr(vDOCID)
         + '   and FACSERIE=' + Quotedstr(vFACSERIE)
         + '   and NFAC=' + Quotedstr(vNFAC);
     FiltraCds(DMFAC.cdsFact2, xSQL);

end;
//FINAL HPC_201403_FAC


//INICIO HPC_201403_FAC
procedure TFCobroServicios.CabeceraDatosUsuario;
Var
   xSQL: String;
Begin

   xSQL := 'Select * from FAC206 Where USERID='''+DMFAC.wUsuario + '''';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;
   If DMFAC.cdsQry3.RecordCount <= 0 Then
   Begin
     ShowMessage('Usuario no registrado en la tabla de Parametros (FAC206)');
     exit;
   End;

    vCIAID    := DMFAC.cdsQry3.FieldByName('CIAID').AsString;
    vLOCID    := DMFAC.cdsQry3.FieldByName('LOCID').AsString;
    vTIPOADQ  := DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString;
    vVEID     := DMFAC.cdsQry3.FieldByName('VEID').AsString;
    vDOCID    := cDocSel;
    vFACSERIE := FGenFactura.dblcSerie.Text;
    vTMONID   := DMFAC.cdsQry9.FieldByName('TMONID').AsString;
    vTLISTAID := 'PEG';

    If DMFAC.cdsQry9.FieldByName('FORPAG').AsString = 'CAJA'     Then  vFPAGOID := '01';
    If DMFAC.cdsQry9.FieldByName('FORPAG').AsString = 'CREDITOS' Then  vFPAGOID := '03';
    If DMFAC.cdsQry9.FieldByName('FORPAG').AsString = 'BANCO'    Then  vFPAGOID := '04';

    If DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString = 'C' Then
    Begin
       vTINID := DMFAC.cdsQry3.FieldByName('TINID').AsString;
       vALMID := DMFAC.cdsQry3.FieldByName('ALMID').AsString;
    End;

    If DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString = 'S' Then
    Begin
       vTINID := '00';
       vALMID := '00';
    End;

end;
//FINAL HPC_201403_FAC



//INICIO HPC_201403_FAC
procedure TFCobroServicios.NumeroFactura;
Var
   xWhere, NUeAnt, xNFact, xSQL: String;
Begin

   If (vDOCID = xFact) Then //Si genera Factura
   Begin

      xWhere := 'CIAID='''+vCIAID+''' and '
              + 'FLAGV=''F'' and '
              + 'SERIEID='''+vFACSERIE+''' ';
      NueAnt := DMFAC.BuscaQry('dspUltTGE', 'FAC103', 'SERIENUM', xWhere, 'SERIENUM');

      If Length(Trim(NueAnt)) = 0 Then
      Begin
        xContinuaGrab := False;
        ShowMessage('El numero de Serie '+vFACSERIE+' no tiene correlativo ');
        Exit;
      End;
      xNFact := IntToStr(StrToInt(NueAnt) + 1);

      If StrToInt(xNFact) < StrToInt(wSerieNum) Then
         xNFAct := wSerieNum;

      xSQL := 'UPDATE FAC103 SET SERIENUM=''' +xNFact+ ''' '
            + 'Where CIAID='''+vCIAID+''' and '
            + 'FLAGV=''F'' and '
            + 'SERIEID='''+vFACSERIE+''' ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar el archivo (FAC103) correlativos por numero de serie');
         xContinuaGrab := False;
         exit;
      End;
     vNFAC := DMFAC.StrZero(xNFact, DMFAC.wAnchoFact);
   End;


   If (vDOCID = xBol) Then //Si genera Factura
   Begin
      xWhere := 'CIAID='''+vCIAID+''' and '
              + 'FLAGV=''B'' and '
              + 'SERIEID='''+vFACSERIE+''' ';

      NueAnt := DMFAC.BuscaQry('dspUltTGE', 'FAC103', 'SERIENUM', xWhere, 'SERIENUM');

      If Length(Trim(NueAnt)) = 0 Then
      Begin
        xContinuaGrab := False;
        ShowMessage('El numero de Serie '+vFACSERIE+' no tiene correlativo ');
        Exit;
      End;
      xNFact := IntToStr(StrToInt(NueAnt) + 1);

      If StrToInt(xNFact) < StrToInt(wSerieNum) Then
         xNFAct := wSerieNum;

      xSQL := 'UPDATE FAC103 SET SERIENUM='''+xNFact+''' '
            + 'Where CIAID='''+vCIAID+''' and '
            + 'FLAGV=''B'' and '
            + 'SERIEID='''+vFACSERIE+''' ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar el archivo (FAC103) correlativos por numero de serie');
         xContinuaGrab := False;
         exit;
      End;

      vNFAC := DMFAC.StrZero(xNFact, DMFAC.wAnchoFact);
   End;
end;
//FINAL HPC_201403_FAC

End.

