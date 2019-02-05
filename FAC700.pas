Unit FAC700;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Fac700
// FORMULARIO               : FToolFactSG
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Barra de tools para la Facturación
//
// Actualizaciones:
// HPC_201403_FAC          : Se modifica las grabaciones a las tablas y se incluye el Set Trnasaccion
// HPC_201408_FAC          : Inicializa Nro de Registro Si no existe
// HPC_201505_FAC 18/09/2015 Ajustes a grabación
// HPC_201701_FAC 30/06/2017 Adecuaciones para facturación Electrónica
// HPC_201803_FAC 05/07/2018 Adecuaciones para emisión de Nota de Crédito
// FAC-201806     16/10/2018 retiro de rutinas que no se usan


Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, fcButton, fcImgBtn, fcShapeBtn, ComCtrls,
   ppProd, ppClass, ppReport, ppRelatv, ppCache, ppDB, ppDBPipe, ppComm,
   ppEndUsr, ppPrnabl, ppCtrls, ppBands, wwdblook, ppViewr, ppVar, ppTypes,
   oaVariables, ppModule, daDataModule, wwdbdatetimepicker, ppParameter,
   MsgDlgs, ppDBBDE;

Type
   TFToolFactSG = Class(TForm)
      pnlFact: TPanel;
      sbtnAnular: TfcShapeBtn;
      sbtnGenCxC: TfcShapeBtn;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      Z1sbKardex: TBitBtn;
      Diseno: TppDesigner;
      Data: TppDBPipeline;
      ppTVenta: TppReport;
      rgdTipoRpt: TRadioGroup;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLine1: TppLine;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppPeriodo: TppLabel;
      ppLabel14: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppLine2: TppLine;
      ppDBCalc2: TppDBCalc;
      ppLabel9: TppLabel;
      ppDBCalc4: TppDBCalc;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppLabel15: TppLabel;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLine3: TppLine;
      ppDBCalc5: TppDBCalc;
      ppLabel16: TppLabel;
      ppDBCalc6: TppDBCalc;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppLabel2: TppLabel;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBCalc1: TppDBCalc;
      ppLabel8: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppLine4: TppLine;
      ppTVentaRes: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel22: TppLabel;
      ppLine5: TppLine;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppSystemVariable6: TppSystemVariable;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppPeriodoRes: TppLabel;
      ppLabel28: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand2: TppSummaryBand;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLabel19: TppLabel;
      ppDBCalc7: TppDBCalc;
      GroupBox1: TGroupBox;
      cbporDia: TCheckBox;
      bbtnEli: TButton;
      BitBtn1: TBitBtn;
      Timer1: TTimer;
      lblFab: TLabel;
      dblcFab: TwwDBLookupCombo;
      edtFab: TEdit;
      bbtnFab: TBitBtn;
      ppdbFab: TppDBPipeline;
      pprFab: TppReport;
      ppHeaderBand3: TppHeaderBand;
      ppDetailBand3: TppDetailBand;
      ppFooterBand3: TppFooterBand;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppLabel27: TppLabel;
      ppSystemVariable7: TppSystemVariable;
      ppSystemVariable8: TppSystemVariable;
      ppd1: TppDesigner;
      Label2: TLabel;
      dtpDesde: TwwDBDateTimePicker;
      dtpHasta: TwwDBDateTimePicker;
      Label1: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      Bevel1: TBevel;
      Bevel2: TBevel;
      Label18: TLabel;
      dblcAlmacen: TwwDBLookupCombo;
      edtAlmacen: TEdit;
      pprOfides: TppReport;
      ppParameterList1: TppParameterList;
      ppdb1: TppBDEPipeline;
      ppHeaderBand4: TppHeaderBand;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLine8: TppLine;
      ppSystemVariable9: TppSystemVariable;
      ppSystemVariable10: TppSystemVariable;
      ppSystemVariable11: TppSystemVariable;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel36: TppLabel;
      ppDBText28: TppDBText;
      ppLabel37: TppLabel;
      ppLabel39: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppSummaryBand3: TppSummaryBand;
      ppLine9: TppLine;
      ppLine10: TppLine;
      ppLabel38: TppLabel;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppLabel42: TppLabel;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppLabel43: TppLabel;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppLabel40: TppLabel;
      sbtnInicial: TfcShapeBtn;
      sbtnGenCxCBazar: TfcShapeBtn;
      GroupBox2: TGroupBox;
      sbtnSuperAnular: TfcShapeBtn;
      sbtnSuperDcto: TfcShapeBtn;
      sbtnReImp: TfcShapeBtn;
      bbtnActVendedor: TBitBtn;
      cbDiseno: TCheckBox;
    sbtnNCredito: TfcShapeBtn;
      Procedure sbtnAnularClick(Sender: TObject);
   // Inicio FAC-201806
   // 16/10/2018 retira rutina que no se usa
      //Procedure sbtnGenCxCClick(Sender: TObject);
   // Fin FAC-201806
      Procedure FormCreate(Sender: TObject);
      Procedure Z1sbKardexClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure ppTVentaPreviewFormCreate(Sender: TObject);
      Procedure ppTVentaResPreviewFormCreate(Sender: TObject);
      //Procedure Button1Click(Sender: TObject);
      Procedure bbtnEliClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure dblcFabExit(Sender: TObject);
      Procedure bbtnFabClick(Sender: TObject);
      Procedure dblcAlmacenEnter(Sender: TObject);
      Procedure dblcAlmacenExit(Sender: TObject);
      Procedure pprOfidesPreviewFormCreate(Sender: TObject);
      Procedure dblcCiaEnter(Sender: TObject);
      Procedure sbtnInicialClick(Sender: TObject);
      Procedure sbtnSuperAnularClick(Sender: TObject);
   // Inicio FAC-201806
   // 16/10/2018 retira rutina que no se usa
      (*
      Procedure sbtnGenCxCBazarClick(Sender: TObject);
      *)
   // Fin FAC-201806      
      Procedure sbtnSuperDctoClick(Sender: TObject);
      Procedure sbtnReImpClick(Sender: TObject);
      Procedure bbtnActVendedorClick(Sender: TObject);
      procedure renumeraregdetalle(xciaid,xccanomes,cxserie, xnfac, xtipdoc:string);
    procedure sbtnNCreditoClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolFactSG: TFToolFactSG;
   sSQL: String;
   xAccesoBotones: Boolean;

Implementation

// Inicio FAC-201806
// 16/10/2018 retira formulario FAC704 que no se usa
(*
Uses FacDM, Fac370, oaVE2000, Fac701, FAC704, FAC362, FAC320;
*)
Uses FacDM, Fac370, oaVE2000, Fac701, FAC362, FAC320;
// Fin FAC-201806

{$R *.DFM}

// Inicio HPC_201701_FAC
//        Reactiva Funcionalidad Anular Comprobante
Procedure TFToolFactSG.sbtnAnularClick(Sender: TObject);
Var
   xTrans, xCta2, xTDA, sNUM, xReg: String;
   sCIA, sALM, sTDA, sLOC, sTIN, xSQL, xWhere, xSqlAlm: String;
// Inicio HPC_201505_FAC
   xxArticulo : String;
   xError : Boolean;
   xxCant : String;
   wAno, wMes, wDia: word;
   xAno, xAnoMes, xMes, xCampoMes: String;
// Fion HPC_201505_FAC
Begin

   If Not (sAcepta = 'S') Then
   Begin
      ShowMessage('Usuario no tiene Acceso');
      Exit;
   End;

   xSQL := ' SELECT * FROM FAC305 '
         + '  WHERE CIAID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('CIAID').AsString)
         + '    AND LOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('LOCID').AsString)
         + '    AND TINID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('TINID').AsString)
         + '    AND ALMID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('ALMID').AsString)
         + '    AND DOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('DOCID').AsString)
         + '    AND FACSERIE=' + QuotedStr(GFactura.FMant.cds2.FieldByName('FACSERIE').AsString)
         + '    AND NFAC=' + QuotedStr(GFactura.FMant.cds2.FieldByName('NFAC').AsString);
   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.DataRequest(xSQL);
   DMFAC.cdsFact2.Open;

   If (trim(DMFAC.cdsFact2.FieldbyName('FACESTADO').AsString) <> 'ACEPTADO') Then
   Begin
      ErrorMsg(Caption, 'Sólo se pueden Anular Documentos Aceptados, verifique...');
      Exit;
   End;

   If Trim(DMFAC.cdsFact2.FieldByName('USUSUPANU').AsString) = '' Then
   Begin
      ShowMessage('Para poder anular, el usuario Supervisor debe marcar el documento...');
      Exit;
   End;

   If DMFAC.cdsFact2.RecordCount = 0 Then
      exit;

   xWhere := 'select trunc(sysdate) FECHA, sysdate HORA from DUAL';
   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xWhere);
   DMFAC.cdsReporte.Open;
   xFec_Sis := DMFAC.cdsReporte.FieldByName('FECHA').AsString;
   xHor_Sis := DMFAC.cdsReporte.FieldByName('HORA').AsString;

   DMFAC.VerificaPeriodoVentas(
      DMFAC.cdsFact2.FieldByName('CIAID').AsString,
      DMFAC.cdsFact2.FieldByName('LOCID').AsString, DMFAC.cdsFact2.FieldByName('TINID').AsString,
      DMFAC.cdsFact2.FieldByName('ALMID').AsString, DMFAC.DateS,
      DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime);
   If Not wVerifPerVentas Then
   Begin
      exit;
   End;

   If Question('Confirmar', 'Debe estar seguro para Anular la Factura ' + #13
             + 'Nº ' + DMFAC.cdsFact2.FieldByName('NFAC').AsString
             + '  -  Cliente:  ' + DMFAC.cdsFact2.FieldByName('CLIEDES').AsString + #13
             + ' ¿Desea Continuar? ') Then
   Begin
      Screen.Cursor := crHourGlass;

      DecodeDate(DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime, wAno, wMes, wDia);

      xAno := IntToStr(wAno);
      If wMes < 10 Then
         xMes := '0' + inttostr(wMes)
      Else
         xMes := inttostr(wMes);
      xAnoMes := xAno + xMes;

      DMFAC.cdsDetFact2.IndexFieldNames := '';
      DMFAC.cdsDetFact2.Filter := '';
      DMFAC.cdsDetFact2.Filtered := False;

      xFiltro := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
               + ' AND CLIEID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString)
               + ' AND FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
               + ' AND NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
      Filtracds(DMFAC.cdsDetFact2, 'SELECT * FROM FAC306 WHERE ' + xFiltro);
      DMFAC.cdsDetFact2.First;
      ErrorCount := 0;

   // Inicio HPC_201505_FAC
      // Try
      // El Stock no se revierte, si se agrega una Nota de Ingreso
      // es la Nota la que actualiza los nuevos saldos
         {
         While Not DMFAC.cdsDetFact2.Eof Do
         Begin
            If DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString = 'S' Then
               FFactSGuia.RevierteStock;
            DMFAC.cdsDetFact2.Next;
         End;
         }


   // Verifica que Provisión de Cuentas por Cobrar no esté Contabilizada
      xSQL := 'Select CC_CONTA '
            + '  from CXC301 '
            + ' where CIAID='+quotedstr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
            + '   and DOCID=' + quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
            + '   and CCSERIE=' + quotedstr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
            + '   and CCNODOC=' + quotedstr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      if DMFAC.cdsQry.RecordCount>0 then
      begin
         if DMFAC.cdsQry.FieldByName('CC_CONTA').AsString='S' then
         begin
            ShowMessage('Provisión de Cuentas por Cobrar no ha sido descontabilizada; '+chr(13)
                       +'avise al Departamento de Contabilidad para que regularice');
            Exit;
         end;
      end;

      DMFAC.DCOM1.AppServer.IniciaTransaccion;

   // Se ANULA la cabecera de la Cuenta por Cobrar
      xSQL := 'Update CXC301 '
            + '   set CCESTADO=' + QuotedStr('A') + ', '
            + '       CC_CONTA=' + QuotedStr('N') + ', '
            + '       CCTCAMPR=0, ' + 'CCGRAVAD=0, CCIGV=0, '
            + '       CCMTOORI=0, CCMTOLOC=0, CCMTOEXT=0, '
            + '       CCSALORI=0, CCSALLOC=0, CCSALEXT=0, '
            + '       USERANUL=' + QuotedStr(DMFAC.wUsuario) + ', '
            + '       FECANUL=' + QuotedStr(FormatDateTime(DMFAC.wFormatFecha, StrtoDate(xFec_Sis))) + ', '
            + '       HORANUL=SYSDATE '
            + ' where CIAID='+quotedstr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
            + '   and DOCID=' + quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
            + '   and CCSERIE=' + quotedstr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
            + '   and CCNODOC=' + quotedstr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al PONER ESTADO ANULADO EN CUENTAS POR COBRAR (Cabecera - CXC301)');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

   // Se ANULA el Detalle de la Cuenta por Cobrar
      xSQL := ' Update CXC302 '
            + '    set CCESTADO=' + QuotedStr('A')
            + '  where CCSERIE=' + quotedstr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
            + '    and CCNODOC=' + quotedstr(DMFAC.cdsFact2.FieldByName('NFAC').AsString)
            + '    and DOCID=' + quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al PONER ESTADO ANULADO EN CUENTAS POR COBRAR (Detalle - CXC302)');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

   // Insert en Cabecera de Nota de Ingreso (LOG314)
      xWhere := 'TDADEVFACT=' + QuotedStr('S');
      xTDA := DMFAC.BuscaQry('dspUltTGE', 'TGE157', 'TDAID', xWhere, 'TDAID');

      xWhere := 'TRISGT=' + QuotedStr('I') + ' '
              + ' AND TRIDEVFACT=' + QuotedStr('S');
      xTrans := DMFAC.BuscaQry('dspUltTGE', 'TGE208', 'TRIID, CUENTAID', xWhere, 'TRIID');
      xCta2 := DMFAC.cdsQry.FieldByName('CUENTAID').AsString;

      sCIA := DMFAC.cdsFact2.FieldByName('CIAID').AsString;
      sALM := DMFAC.cdsFact2.FieldByName('ALMID').AsString;
      sLOC := DMFAC.cdsFact2.FieldByName('LOCID').AsString;
      sTIN := DMFAC.cdsFact2.FieldByName('TINID').AsString;
      sTDA := xTDA;

   // Inicio HPC_201506_FAC
   // 26/10/2015
   // Condiciona actualización de Nota de Ingreso / Stocks / Maestro Artículos sólo para tipo de adquisición 'C=Compra de Artículo'
      If DMFAC.cdsFact2.FieldByName('TIPOADQ').AsString = 'C' Then
      Begin
         If (trim(DMFAC.cdsFact2.FieldbyName('FACESTADO').AsString) = 'ACEPTADO') Then
         Begin
            xSQL := ' select ALMID '
                +   '   from FAC306 A '
                +   '  where A.CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
                +   '    and A.DOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
                +   '    and A.FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
                +   '    and A.NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString)
                +   '  group by ALMID';
            DMFAC.cdsAlmVar.Close;
            DMFAC.cdsAlmVar.DataRequest(xSQL);
            DMFAC.cdsAlmVar.Open;

            DMFAC.cdsAlmVar.First;
            While Not DMFAC.cdsAlmVar.Eof Do
            Begin
               sALM := DMFAC.cdsAlmVar.FieldByName('ALMID').AsString;
               sNUM := DMFAC.StrZero(DMFAC.MaxNIA(sCIA, sALM, sTIN, sLOC, sTDA), wAnchoIng);

               DMFAC.BuscaFecha('TGE114', 'FECANO', 'FECHA', StrtoDate(xFec_Sis));

               xSQL := 'Insert into LOG314('
                     + '       CIAID, LOCID, ALMID, NISAID, TDAID, DOCID, TRIID, NISAFDOC, '
                     + '       NISATIP, NISAFREG, SITFREG, SITHREG, NISAHREG, NISANDOC, '
                     + '       TINID, NISSIT, ODCID, NISAUSER, CLIEDES, NISANOMM, CLIEID, TMONID, '
                     + '       NISAANO, NISAMES, NISADIA, NISATRIM, NISASEM, NISAANOMES, NISASS, '
                     + '       NISAAATRI, NISAAASEM, NISAAASS, NISAOBS) '
                     + 'values ('
                               + QuotedStr(sCIA) + ', ' + QuotedStr(sLOC) + ', '
                               + QuotedStr(sALM) + ', ' + QuotedStr(sNUM) + ', '
                               + QuotedStr(xTDA) + ', ' + QuotedStr('') + ', ' + QuotedStr(xTrans) + ', '
                               + QuotedStr(FormatDateTime(DMFAC.wFormatFecha, StrtoDate(xFec_Sis))) + ', '
                               + QuotedStr('INGRESO') + ', '
                               + QuotedStr(FormatDateTime(DMFAC.wFormatFecha, StrtoDate(xFec_Sis))) + ', '
                               + DMFAC.wRepFecServi + ', ' + DMFAC.wRepTimeServi + ', ' + DMFAC.wRepTimeServi + ', '
                               + QuotedStr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString
                               + DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString + DMFAC.cdsFact2.fieldbyname('NFAC').AsString) + ', '
                               + QuotedStr(DMFAC.cdsFact2.FieldByName('TINID').AsString) + ', '
                               + QuotedStr('ACEPTADO') + ', ' + QuotedStr('N') + ', '
                               + QuotedStr(DMFAC.wUsuario) + ', '
                               + QuotedStr(stringreplace(DMFAC.cdsFact2.FieldByName('CLIEDES').AsString, '"', '', [rfReplaceAll])) + ', '
                               + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECANO').AsString + DMFAC.cdsUltTGE.fieldbyname('FECMES').AsString) + ', '
                               + QuotedStr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString) + ', ' + Quotedstr(DMFAC.wTMonLoc) + ', '
                               + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECANO').AsString) + ', '
                               + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECMES').AsString) + ', '
                               + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECDIA').AsString) + ', '
                               + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECTRIM').AsString) + ', '
                               + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECSEM').AsString) + ', '
                               + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECANO').AsString
                               + DMFAC.cdsUltTGE.fieldbyname('FECMES').AsString) + ', '
                               + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECSS').AsString) + ', '
                               + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECAATRI').AsString) + ', '
                               + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECAASEM').AsString) + ', '
                               + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECAASS').AsString) + ', '
                               + Quotedstr('Factura Anulada Desde Ventas Nro:'
                               + DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString
                               + DMFAC.cdsFact2.fieldbyname('NFAC').AsString) + ' )';
               Try
                  DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('Error al INGRESAR la NOTA DE INGRESO CABECERA (LOG314)');
                  DMFAC.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

            // Insert en el Log315 Detalle de Nota de Ingreso - Kardex
               xSQL := 'Insert into LOG315('
                     + '       CIAID, LOCID, ALMID, NISAID, TDAID, KDXID, NISAFDOC, ARTID, NISATIP, NISSIT, '
                     + '       ARTPCG, ARTMORIPCG, ARTMORIPCU, TCAMB, ARTPVU, ARTPVG, KDXCNTG, KDXPEDIDOG, '
                     + '       ARTCONT, UNMIDG, UNMIDU, GRARID, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA, '
                     + '       ARTACTIVO, CUENTAID, NISANDOC, FAMID, SFAMID, CUENTA2ID, TINID, NISAFREG, '
                     + '       ARTFUC, KDXUSER, KDXFREG, KDXHREG, KDXANO, KDXMM, KDXDD, KDXSEM, KDXSS, '
                     + '       KDXANOMM, KDXAATRI, KDXAASEM, KDXAASS, TRIID, ARTDES, TMONID, KDXSALDOG, '
                     + '       KDXSALDOU, ARTPCU, KDXCNTU, KDXPEDIDOU, KDXTRI, ARTTOTALG, ARTTOTALU, '
                     + '       ARTTOTAL, FNSERIE, ARTCRGO) '
                     + 'Select A.CIAID, A.LOCID, A.ALMID, ' + QuotedStr(sNUM) + ', ' + QuotedStr(xTDA) + ', '
                     + '       A.DFACITEM, ' + QuotedStr(FormatDateTime(DMFAC.wFormatFecha, StrtoDate(xFec_Sis))) + ', '
                     + '       A.ARTID, ' + QuotedStr('INGRESO') + ', ''ACEPTADO'', '
                     + '       B.ARTPCG, B.ARTPCG, 0, A.DFACTCAM, B.ARTPVU, B.ARTPVG, A.DFACCANTAT, A.DFACCANTG, '
                     + '       B.ARTCONT, B.UNMIDG, B.UNMIDU, B.GRARID, B.FABID, B.ARTSPRO, B.ARTSCA, B.ARTPARA, '
                     + '       B.ARTSNA, B.ARTACTIVO, B.CUENTAID,'
                     +         QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString + DMFAC.cdsFact2.fieldbyname('NFAC').AsString) + ', '
                     + '       B.FAMID, B.SFAMID, ' + QuotedStr(xCta2) + ', '
                     +         QuotedStr(DMFAC.cdsFact2.FieldByName('TINID').AsString) + ','
                     + '       A.FACFECHA, B.ARTFUC, ' + QuotedStr(DMFAC.wUsuario) + ', A.FACFECHA, A.DFACHREG, '
                     +         QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECANO').AsString) + ', '
                     +         QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECMES').AsString) + ', '
                     +         QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECDIA').AsString) + ', '
                     +         QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECSEM').AsString) + ', '
                     +         QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECSS').AsString) + ', '
                     +         QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECANO').AsString + DMFAC.cdsUltTGE.fieldbyname('FECMES').AsString) + ', '
                     +         QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECAATRI').AsString) + ', '
                     +         QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECAASEM').AsString) + ', '
                     +         QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECAASS').AsString) + ', '
                     +         QuotedStr(xTrans) + ','
                     + '       B.ARTDES, ' + QuotedStr(DMFAC.wTMonLoc) + ', 0, 0, 0, 0, 0, '
                     +         QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECTRIM').AsString) + ', '
                     +         DMFAC.wReplacCeros + '(B.ARTCPROG,0)*A.DFACCANTAT, 0, '
                     +         DMFAC.wReplacCeros + '(B.ARTCPROG,0)*A.DFACCANTAT, B.FNSERIE, B.ARTCRGO '
                     + '  from FAC306 A, TGE205 B '
                     + ' where A.CIAID=' + QuotedStr(sCIA) + ' '
                     + '   and A.ALMID=' + QuotedStr(DMFAC.cdsAlmVar.FieldByName('ALMID').AsString) + ' '
                     + '   and A.DOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString) + ' '
                     + '   and A.FACSERIE=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString) + ' '
                     + '   and A.NFAC=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString) + ' '
                     + '   and A.CLIEID=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('CLIEID').AsString) + ' '
                     + '   and B.CIAID=A.CIAID AND B.TINID=' + QuotedStr(sTIN) + ' AND B.ARTID=A.ARTID';
               Try
                  DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('Error al INGRESAR la NOTA DE INGRESO DETALLE (LOG315)');
                  DMFAC.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
               DMFAC.cdsAlmVar.Next;
            End;

         // Actualización de Saldos
            xSQL := 'Select * '
               +    '  from FAC306 '
               +    ' where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
               +    '   and DOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
               +    '   and FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
               +    '   and NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString)
               +    ' Order by DFACITEM';
            Filtracds(DMFAC.cdsDetFact2, xSQL);

            DMFAC.cdsDetFact2.First;
            while not DMFAC.cdsDetFact2.EOF do
            Begin
               xSQL := 'Select STKFIN STKSACTG '
                  + '        from LOG319 '
                  + '       where CIAID ='     + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
                  + '         and ALMID ='     + QuotedStr(DMFAC.cdsDetFact2.FieldByName('ALMID').AsString)
                  + '         and LOGANOMM = ' + Quotedstr(DMFAC.cdsFact2.FieldByName('FACANOMES').AsString)
                  + '         and ARTID = '    + Quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
               DMFAC.cdsQry4.Close;
               DMFAC.cdsQry4.DataRequest(xSQL);
               DMFAC.cdsQry4.Open;
               xError := False;
               xxCant := floattostr(DMFAC.cdsDetFact2.FieldByName('DFACCANTG').AsFloat);
               xxArticulo := DMFAC.cdsDetFact2.FieldByName('ARTID').AsString;
               if DMFAC.cdsQry4.RecordCount=0 then
               Begin
                  ShowMessage('No se ha encontrado al Artículo '+xxArticulo+' en la Tabla de Stocks');
                  xError := True;
               End
               Else
               Begin
                  if DMFAC.cdsQry4.FieldByName('STKSACTG').AsFloat<0 then
                  Begin
                     ShowMessage('El Stock del Artículo '+xxArticulo+' es Negativo');
                     xError := True;
                  End;
               End;

               if xError then
               Begin
                  DMFAC.cdsDetFact2.Edit;
                  DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString := 'N';
                  DMFAC.cdsDetFact2.Post;
                  xSQL := 'Update FAC306 '
                     + '      Set DFACTFLAG=''N'' '
                     + '    Where CIAID='    + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
                     + '      and FACSERIE=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('FACSERIE').AsString)
                     + '      and NFAC='     + quotedstr(DMFAC.cdsDetFact2.FieldByName('NFAC').AsString)
                     + '      and ARTID='    + quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
                  Try
                     DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
                  Except
                     ShowMessage('No se pudo actualizar el detalle indicando que no tiene Stock');
                  End;
                  Screen.Cursor := crDefault;
                  DMFAC.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

            // TGE205 - Maestro de Artículos
               xSQL := 'Update TGE205 '
                  +    '   Set ARTCNTG = nvl(ARTCNTG,0)+'+xxCant+', '
                  +    '       ARTMNTG = (nvl(ARTCNTG,0)+'+xxCant+')*ARTCPROG, '
                  +    '       CCUSER = '+quotedstr(DMFAC.wUsuario)+','
                  +    '       ARTFUMV = sysdate '
                  +    ' Where CIAID   = ' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
                  +    '   and ARTID   = ' + quotedstr(xxArticulo);
               Try
                  DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('No se pudo actualizar el Maestro de Artículos del artículo '+xxArticulo);
                  DMFAC.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

            // LOG316
               xCampoMes := 'STKISG'+DMFAC.Strzero(xMes,2);
               xSQL := 'Update LOG316 '
                  +    '   Set '+xCampoMes+'=nvl('+xCampoMes+',0)+'+xxCant+','
                  +    '       STKSACTG='+floattostr(DMFAC.cdsQry4.FieldByName('STKSACTG').AsFloat+strtofloat(xxCant))+','
                  +    '       USUARIO='+quotedstr(DMFAC.wUsuario)+','
                  +    '       FREG=trunc(Sysdate), '
                  +    '       HREG=Sysdate '
                  +    ' Where CIAID  = ' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
                  +    '   and STKANO = ' + quotedstr(xAno)
                  +    '   and ALMID  = ' + quotedStr(DMFAC.cdsDetFact2.FieldByName('ALMID').AsString)
                  +    '   and ARTID  = ' + quotedstr(xxArticulo);
               Try
                  DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('No se pudo actualizar el archivo de Saldos por Año del artículo '+xxArticulo);
                  DMFAC.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

            // LOG319
               xSQL := 'Update LOG319 '
                  +    '   Set CANTOTING=NVL(CANTOTING,0)+'+xxCant+','
                  +    '       STKFIN='+floattostr(DMFAC.cdsQry4.FieldByName('STKSACTG').AsFloat+strtofloat(xxCant))
                  +    ' Where CIAID  = ' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
                  +    '   and LOGANOMM = ' + quotedstr(xAnoMes)
                  +    '   and ALMID  = ' + quotedStr(DMFAC.cdsDetFact2.FieldByName('ALMID').AsString)
                  +    '   and ARTID  = ' + quotedstr(xxArticulo);
               Try
                  DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('No se pudo actualizar el archivo de Saldos por Almacén y Mes del artículo '+xxArticulo);
                  DMFAC.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

            // LOG337
               xSQL := 'Update LOG337 '
                  +    '   Set CANTOTING = nvl(CANTOTING,0)+'+xxCant+','
                  +    '       MONTOTING = (nvl(CANTOTING,0)+'+xxCant+')*PREPROMFIN, '
                  +    '       USUARIO     = '+quotedstr(DMFAC.wUsuario)+','
                  +    '       FREG        = sysdate, '
                  +    '       STKFIN      = STKFIN+'+xxCant+','
                  +    '       VALTOTFIN   = (STKFIN+'+xxCant+')*PREPROMFIN '
                  +    ' Where CIAID  = ' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
                  +    '   and LOGANOMM = ' + quotedstr(xAnoMes)
                  +    '   and ARTID  = ' + quotedstr(xxArticulo);
               Try
                  DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('No se pudo actualizar el archivo de Saldos por Mes del artículo '+xxArticulo);
                  DMFAC.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
               DMFAC.cdsDetFact2.Next;
            End;
         End;
      End;
// Fin HPC_201506_FAC

      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('FACESTADO').AsString := 'ANULADO';
      DMFAC.cdsFact2.FieldByName('USERANUL').AsString := DMFAC.wUsuario;
      DMFAC.cdsFact2.FieldByName('FECANUL').AsString := xFec_Sis;
      DMFAC.cdsFact2.FieldByName('HORANUL').AsString := xHor_Sis;
      DMFAC.cdsFact2.Post;

      xSQL := 'update FAC305 '
            + '   set FACESTADO=' + quotedstr('ANULADO') + ','
            + '       USERANUL=' + quotedstr(DMFAC.wUsuario) + ','
            + '       FECANUL=trunc(sysdate),'
            + '       HORANUL=sysdate '
            + ' where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
            + '   and CLIEID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString)
            + '   and FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
            + '   and NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al actualizar Estado de ANULADO en la Factura/Boleta (FAC305)');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

      If wFSerie = 'S' Then
      Begin
         xSQL := 'Update LOG332 '
            +    '   Set DOCID = null,'
            +    '       FACSERIE = null,'
            +    '       NFAC = null,'
            +    '       TDAID2 = null,'
            +    '       ENTREGADO = ''N'' '
            +    ' where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
            +    '   and LOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('LOCID').AsString)
            +    '   and TINID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('TINID').AsString)
            +    '   and ALMID=' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('ALMID').AsString)
            +    '   and ENTREGADO=' + QuotedStr('S')
            +    '   and DOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
            +    '   and FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
            +    '   and NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            Screen.Cursor := crDefault;
            ShowMessage('No se pudo desmarcar el archivo de Número de Series (LOG332)');
            DMFAC.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      End;

   // Si boleta fue Generada desde un Pago actualizar el Pago
      If DMFAC.cdsFact2.FieldByName('NUMDOCPAG').AsString <> '' Then
      Begin
         xSQL := 'Update CXC_ING_VAR_SER '
               + '   set CIAFAC=NULL, DOCID=NULL, SERIE=NULL, NODOC=NULL, FECFAC=NULL, '
               + '       USUDOC=NULL, FECREGDOC=NULL '
               + ' where DOCPAG=' + Quotedstr(DMFAC.cdsFact2.FieldByName('DOCPAG').AsString) + ' '
               + '   and NUMDOCPAG=' + Quotedstr(DMFAC.cdsFact2.FieldByName('NUMDOCPAG').AsString);
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            Screen.Cursor := crDefault;
            ShowMessage('Error al ACTUALIZAR EN PAGOS (CXC_ING_VAR_SER)');
            DMFAC.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      End;

      xSQL := 'update FAC_FOR_PAG '
            + '   set BORRADO=''S'' '
            + ' where CIAID=' + quotedstr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
            + '   and DOCID=' + quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
            + '   and FACSERIE=' + quotedstr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
            + '   and NFAC=' + quotedstr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         Screen.Cursor := crDefault;
         ShowMessage('Error al ACTUALIZAR BORRADO=''S'' (FAC_FOR_PAG)');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

      DMFAC.DCOM1.AppServer.GrabaTransaccion;
      ShowMessage('Anulación de la Factura realizada con éxito');

   // Fin HPC_201505_FAC

      DMFAC.ActualizaFiltro(GFactura, DMFAC.cdsFact2, 'M');

      Screen.Cursor := crDefault;
   End;
End;
// Fin HPC_201701_FAC

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
(*
Procedure TFToolFactSG.sbtnGenCxCClick(Sender: TObject);
Var
   xCiaDest, xWhereFil, xReg, fCxcCnt: String;
   xCab, xDet, fConta: boolean;
   xSQL, xWhere : String;
Begin

   fConta := False;
   If Assigned(FContabBaz) Then
   Begin
      fConta := FContabBaz.cbConta.Checked;
      If MessageDlg('Este Proceso Genera la Provisión en Cuentas por Cobrar.' + #13 + #13 +
         'Segun los Registros Seleccionados en el Filtro' + #13 + #13 +
         'Esta Seguro de Continuar ............? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
      Begin
         Exit;
      End;
   End
   Else
   Begin
      fConta := True;
      If MessageDlg('Este Proceso Genera la Provisión en Cuentas por Cobrar.' + #13 + #13 +
         'Segun los Registros Seleccionados en el Filtro' + #13 + #13 +
         'El Cual ya fue Generado, pero desea Volver a Generar' + #13 + #13 +
         'El Proceso Elimina el anterior y Genera un nuevo Registro' + #13 + #13 +
         'Esta Seguro de Continuar ............? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
      Begin
         Exit;
      End;
   End;


   //INICIO HPC_201403_FAC
   DMFAC.DCOM1.AppServer.IniciaTransaccion;
   //fINAL HPC_2014_02_FAC

   xWhere := 'SELECT ' + DMFAC.wRepFuncChar + DMFAC.wRepFecServi + ', ' + QuotedStr('DD/MM/YYYY') + ') "FECHA" FROM DUAL';
   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xWhere);
   DMFAC.cdsReporte.Open;
   xFec_Sis := DMFAC.cdsReporte.FieldByName('FECHA').AsString;

   Screen.Cursor := crHourGlass;


   GFactura.FMant.cds2.First;
   While Not GFactura.FMant.cds2.Eof Do
   Begin
      xSQL := 'Select * '
            + '  from FAC305 '
            + ' where CIAID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('CIAID').AsString)
            + '   and LOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('LOCID').AsString)
            + '   and TINID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('TINID').AsString)
            + '   and ALMID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('ALMID').AsString)
            + '   and DOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('DOCID').AsString)
            + '   and FACSERIE=' + QuotedStr(GFactura.FMant.cds2.FieldByName('FACSERIE').AsString)
            + '   and NFAC=' + QuotedStr(GFactura.FMant.cds2.FieldByName('NFAC').AsString);
      DMFAC.cdsFact2.Close;
      DMFAC.cdsFact2.DataRequest(xSQL);
      DMFAC.cdsFact2.Open;

      xWhere := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString) + ' AND CCOMERID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FPAGOID').AsString);
      DMFAC.BuscaQry('dspUltTGE', 'TGE180', 'DCCOMDES, DCCOMPORC, DCOMMTOMAX, CONDPID', xWhere, 'DCCOMDES');
      sTipoPago := DMFAC.cdsQry.FieldByName('CONDPID').AsString;

      xSQL := 'Select CIAID, NOCIERRE, CNSFRECU, CNSPRICIE, CNSULTCIE, USUARIO, FREG, '
            + '       ESTVEN, USUCIE, FECCIE '
            + '  from CXC312 '
            + ' where CIAID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('CIAID').AsString)
            + '   and CNSPRICIE<=' + QuotedStr(DateToStr(GFactura.FMant.cds2.FieldByName('FACFECHA').AsDateTime))
            + '   and CNSULTCIE>=' + QuotedStr(DateToStr(GFactura.FMant.cds2.FieldByName('FACFECHA').AsDateTime))
            + '   and ESTVEN=''I'' ';
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      if DMFAC.cdsQry.RecordCount > 0 Then
      begin
         xSQL := 'Select * '
               + '  from FAC306 '
               + ' where CIAID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('CIAID').AsString)
               + '   and LOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('LOCID').AsString)
               + '   and TINID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('TINID').AsString)
               + '   and ALMID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('ALMID').AsString)
               + '   and DOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('DOCID').AsString)
               + '   and FACSERIE=' + QuotedStr(GFactura.FMant.cds2.FieldByName('FACSERIE').AsString)
               + '   and NFAC=' + QuotedStr(GFactura.FMant.cds2.FieldByName('NFAC').AsString);
         DMFAC.cdsDetFact2.Close;
         DMFAC.cdsDetFact2.DataRequest(xSQL);
         DMFAC.cdsDetFact2.Open;

         xCiaEnviar := DMFAC.cdsFact2.fieldbyname('CIAID').AsString;

         If DMFAC.cdsFact2.fieldbyname('FACESTADO').AsString <> 'INICIAL' Then
         Begin
            xCiaDest := xCiaEnviar;

            xWhere := 'CIAID=' + QuotedStr(xCiaDest)
                     +' AND CCANOMES=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
                     +' AND DOCID=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString)
                     +' AND CCSERIE=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString)
                     +' AND CCNODOC=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString);
            xReg := DMFAC.BuscaQry('dspUltTGE', 'CXC301', 'CCNOREG, CC_CONTA', xWhere, 'CCNOREG');

            fCxcCnt := DMFAC.cdsQry.FieldByName('CC_CONTA').AsString;

            if length(xReg)=0 then
            begin
               xSQL := 'select nvl(max(CCNOREG),''0000000000'') CCNOREG '
                      +'  from CXC301 '
                      +' where CIAID=' + QuotedStr(xCiaDest)
                      +'   and CCANOMES=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
                      +'   and TDIARID='+quotedstr('09');
               DMFAC.cdsQry.Close;
               DMFAC.cdsQry.DataRequest(xSQL);
               DMFAC.cdsQry.Open;
               xReg :=  DMFAC.strZero(inttostr(strtoint(DMFAC.cdsQry.FieldByName('CCNOREG').AsString)+1),10);
            end;

            If (fConta) Or ((fConta = False) And (fCxcCnt <> 'S')) Then
            Begin
               sSQL := 'Delete from CXC301 '
                     + ' where CIAID='+quotedstr(xCiaDest)
                     + '   and CCANOMES='+quotedstr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
                     + '   and DOCID='+quotedstr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString)
                     + '   and CCSERIE='+quotedstr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString)
                     + '   and CCNODOC='+quotedstr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString);
               Try
                  DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('Error al ELIMINAR EN CUENTAS POR COBRAR PARA GENERARLA NUEVAMENTE (CXC301)');
                  DMFAC.DCOM1.AppServer.RetornaTransaccion;
                  Screen.Cursor := crDefault;
                  exit;
               End;

               sSQL := 'Delete from CXC302 '
                     + ' where CIAID='+QuotedStr(xCiaDest)
                     + '   and CCANOMES='+QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
                     + '   and DOCID='+QuotedStr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString)
                     + '   and CCSERIE='+QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString)
                     + '   and CCNODOC='+QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString);
               Try
                  DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('Error al ELIMINAR EN CUENTAS POR COBRAR PARA GENERARLA NUEVAMENTE (CXC302)');
                  DMFAC.DCOM1.AppServer.RetornaTransaccion;
                  Screen.Cursor := crDefault;
                  exit;
               End;

               If xReg <> '' Then
               Begin
                  sSQL := 'delete from CNT301 '
                        + ' where CIAID='+QuotedStr(xCiaDest)
                        + '   and CNTANOMM='+QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
                        + '   and TDIARID='+QuotedStr('09')
                        + '   and CNTCOMPROB='+QuotedStr(xReg);
                  Try
                     DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
                  Except
                     Screen.Cursor := crDefault;
                     ShowMessage('Error al ELIMINAR EN CONTABILIDAD PARA GENERARLA NUEVAMENTE (CNT301)');
                     DMFAC.DCOM1.AppServer.RetornaTransaccion;
                     Screen.Cursor := crDefault;
                     exit;
                  End;

                  sSQL := 'delete from CNT300 '
                        + ' where CIAID='+QuotedStr(xCiaDest)
                        + '   and CNTANOMM='+QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
                        + '   and TDIARID='+QuotedStr('09')
                        + '   and CNTCOMPROB='+QuotedStr(xReg);
                  Try
                     DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
                  Except
                     Screen.Cursor := crDefault;
                     ShowMessage('Error al ELIMINAR EN CONTABILIDAD PARA GENERARLA NUEVAMENTE (CNT300)');
                     DMFAC.DCOM1.AppServer.RetornaTransaccion;
                     Screen.Cursor := crDefault;
                     exit;
                  End;
               End;

               xcptocab := '';
               DMFAC.cdsDetFact2.First;
               While Not DMFAC.cdsDetFact2.EOF Do
               Begin
                  If FFactSGuia.FlagArticuloConDinamica(DMFAC.cdsFact2.FieldByName('CIAID').AsString, DMFAC.cdsFact2.FieldByName('DOCID').AsString, DMFAC.cdsFact2.FieldByName('TMONID').AsString, DMFAC.cdsFact2.FieldByName('FPAGOID').AsString, DMFAC.cdsDetFact2.FieldByName('ARTID').AsString) Then
                  Begin
                     xcptocab := FFactSGuia.GetDinamicaContable(DMFAC.cdsFact2.FieldByName('CIAID').AsString, DMFAC.cdsFact2.FieldByName('DOCID').AsString, DMFAC.cdsFact2.FieldByName('TMONID').AsString, DMFAC.cdsFact2.FieldByName('FPAGOID').AsString, DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
                     break;
                  End;
                  DMFAC.cdsDetFact2.next;
               End;

               If xcptocab = '' Then
               Begin
                  xcptocab := FFactSGuia.GetDinamicaContable(DMFAC.cdsFact2.FieldByName('CIAID').AsString, DMFAC.cdsFact2.FieldByName('DOCID').AsString, DMFAC.cdsFact2.FieldByName('TMONID').AsString, DMFAC.cdsFact2.FieldByName('FPAGOID').AsString, '');
               End;

               If sTipoPago <> 'VC' Then
               Begin
                 If Not FFactSGuia.TransferenciaCxC(xReg) Then
                 Begin
                    Screen.Cursor := crDefault;
                    DMFAC.DCOM1.AppServer.RetornaTransaccion;
                    exit;
                 End;
               End
               Else
               Begin
                  If Not FFactSGuia.TransferenciaCxC_VC(xReg) Then
                  Begin
                     Screen.Cursor := crDefault;
                     DMFAC.DCOM1.AppServer.RetornaTransaccion;
                     exit;
                  End
               End;

            End;

         End;

      End;

      Try
         If Assigned(FContabBaz) Then
         Begin
            FContabBaz.pbReg.Position := FContabBaz.pbReg.Position + 1;
            FContabBaz.lblCon.Caption := inttostr(FContabBaz.pbReg.Position);
            FContabBaz.pnlPB.Refresh;
            FContabBaz.lblMensaje.Caption := 'Rango Procesado del ' + FContabBaz.dtpDesde.Text
               + 'al ' + FContabBaz.dtpHasta.Text;

         End;
      Except
      End;

      //Renumera
      renumeraregdetalle(DMFAC.cdsFact2.FieldByName('CIAID').AsString,
                         DMFAC.cdsFact2.FieldByName('FACANOMES').AsString,
                         DMFAC.cdsFact2.FieldByName('FACSERIE').AsString,
                         DMFAC.cdsFact2.FieldByName('NFAC').AsString,
                         DMFAC.cdsFact2.FieldByName('DOCID').AsString);

      GFactura.FMant.cds2.Next;
   End;

   xWhereFil := GFactura.FMant.SQL;

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xWhereFil);
   DMFAC.cdsReporte.Open;

   DMFAC.cdsReporte.Filtered := False;
   DMFAC.cdsReporte.Filter := '';
   DMFAC.cdsReporte.Filter := 'FACESTADO=''ANULADO''';
   DMFAC.cdsReporte.Filtered := True;

   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      sSQL := ' UPDATE CXC301 SET ' +
         ' CCESTADO=' + QuotedStr('A') + ', ' +
         ' CCTCAMPR=0, ' +
         ' CCGRAVAD=0, ' +
         ' CCIGV=0, ' +
         ' CCMTOORI=0, ' +
         ' CCMTOLOC=0, ' +
         ' CCMTOEXT=0, ' +
         ' CCSALORI=0, ' +
         ' CCSALLOC=0, ' +
         ' CCSALEXT=0, ' +
         ' USERANUL=' + QuotedStr(DMFAC.cdsReporte.FieldByName('FACUSER').AsString) + ', ' +
         ' FECANUL=' + QuotedStr(FormatDateTime(DMFAC.wFormatFecha, DMFAC.cdsReporte.FieldByName('FECANUL').AsDateTime)) + ', ' +
         ' HORANUL=SYSDATE ' +
         ' WHERE CCSERIE=''' + DMFAC.cdsReporte.FieldByName('FACSERIE').AsString + ''' ' +
         ' AND CCNODOC=''' + DMFAC.cdsReporte.FieldByName('NFAC').AsString + ''' ' +
         ' AND DOCID=''' + DMFAC.cdsReporte.FieldByName('DOCID').AsString + '''';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         Screen.Cursor := crDefault;
         //INICIO HPC_201403_FAC
         //SHOWmESSAGE('error al anular');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         Showmessage('error al anular (CXC301) ');
         //FINAL HPC_201403_FAC
         EXIT;
      End;

      sSQL := ' UPDATE CXC302 SET CCESTADO=' + QuotedStr('A') + ' ' +
         ' WHERE CCSERIE=''' + DMFAC.cdsReporte.FieldByName('FACSERIE').AsString + ''' ' +
         ' AND CCNODOC=''' + DMFAC.cdsReporte.FieldByName('NFAC').AsString + ''' ' +
         ' AND DOCID=''' + DMFAC.cdsReporte.FieldByName('DOCID').AsString + '''';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         Screen.Cursor := crDefault;
         //INICIO HPC_201403_FAC
         //SHOWmESSAGE('error al anular');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         Showmessage('error al anular (CCESTADO - CXC302)');
         //FINAL HPC_201403_FAC
         EXIT;
      End;



                  {            + ' where CIAID='+QuotedStr(xCiaDest)
                     + '   and CCANOMES='+QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
                     + '   and DOCID='+QuotedStr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString)
                     + '   and CCSERIE='+QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString)
                     + '   and CCNODOC='+QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString); }



      DMFAC.cdsReporte.Next;
   End;


   DMFAC.cdsReporte.Filtered := False;
   DMFAC.cdsReporte.Filter := '';
   DMFAC.cdsReporte.Filtered := True;






   Screen.Cursor := crDefault;
   DMFAC.DCOM1.AppServer.GrabaTransaccion;
   Showmessage('PROCESO TERMINADO');
End;
*)
// Fin FAC-201806


Procedure TFToolFactSG.FormCreate(Sender: TObject);
Var
   xSQL: String;
Begin
   Screen.Cursor := crHourGlass;
// Inicio FAC-201806
// 31/10/2018 Deshabilita botón que regenera CxC
//   sbtnGenCxC.Visible := True;
// Fin FAC-201806

   xSQL := 'SELECT * FROM TGE004 A, TGE004 B '
      + 'WHERE A.MODULOID=''FAC'' AND A.NTABLA=''TGE101'' AND A.CODIGO=''04'' '
      + ' AND A.USERID=''' + DMFAC.wUsuario + ''' '
      + ' AND A.USERID=B.USERID(+) AND B.MODULOID IN (''CNT'') and A.CODIGO=B.CODIGO(+)';
   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xSQL);
   DMFAC.cdsReporte.Open;

// Inicio FAC-201806
// 31/10/2018 Deshabilita botón que regenera CxC
   {
   If DMFAC.cdsReporte.Recordcount > 0 Then
   Begin
      sbtnGenCxCBazar.Visible := True;
   End;
   }
// Fin FAC-201806

   dblcCiaExit(Sender);

//   edtFab.Visible := False;
//   lblFab.Visible := False;
//   dblcFab.Visible := False;
//   bbtnFab.Visible := False;

//   If (DMFAC.wUsuario = 'JVLOZANO') Or (DMFAC.wUsuario = 'ASANTANDER') Then
//   Begin
      edtFab.Visible := True;
      lblFab.Visible := True;
      dblcFab.Visible := True;
      bbtnFab.Visible := True;
//   End;

   DMFAC.cdsQry7.Close;
   DMFAC.cdsQry7.DataRequest('Select FABID, FABDES from TGE150 ORDER BY FABID');
   DMFAC.cdsQry7.Open;

   dblcFab.LookupTable := DMFAC.cdsQry7;

   Screen.Cursor := crDefault;
End;

Procedure TFToolFactSG.Z1sbKardexClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ErrorMsg(Caption, 'Código de Compañia no Válido');
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   xWhere := GFactura.FMant.SQL;
   If rgdTipoRpt.ItemIndex = 0 Then
   Begin
      sSQL := 'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + 'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
         + 'A.ALMID, D.ALMDES '
         + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'and A.ALMID like ''' + dblcAlmacen.Text + '%'' '
         + 'and A.FACESTADO in (''ACEPTADO'',''ANULADO'') '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) ';

      If cbporDia.Checked Then
         sSQL := sSQL + 'ORDER BY FACFECHA, DOCID, FPAGOID, FACSERIE, NFAC'
      Else
         sSQL := sSQL + 'ORDER BY DOCID, FPAGOID, FACFECHA, FACSERIE, NFAC';
   End;

   If rgdTipoRpt.ItemIndex = 1 Then
   Begin
      sSQL := 'SELECT A.DOCID, C.DOCDES, A.FPAGOID, B.DCCOMDES, SUM( A.FACTOTMN ) FACTOTMN, '
         + 'SUM( A.FACMTOMN ) FACMTOMN, ''' + edtCia.Text + ''' CIADES, '
         + 'A.ALMID, D.ALMDES, count(*) NUMFAC '
         + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'and A.ALMID like ''' + dblcAlmacen.Text + '%'' '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.FACESTADO=''ACEPTADO'' '
         + 'AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + 'GROUP BY A.ALMID, D.ALMDES, A.DOCID, C.DOCDES, A.FPAGOID, B.DCCOMDES';
   End;

   If rgdTipoRpt.ItemIndex = 2 Then
   Begin
      sSQL := 'SELECT A.DOCID, C.DOCDES, A.FPAGOID, B.DCCOMDES, A.OFDESID, D.OFDESNOM, '
         + 'SUM( A.FACTOTMN ) FACTOTMN, SUM( A.FACMTOMN ) FACMTOMN, '
         + 'SUM( CASE WHEN A.FPAGOID=''11'' THEN A.FACTOTMN ELSE 0 END ) TOTALCONT, '
         + 'SUM( CASE WHEN A.FPAGOID=''12'' THEN A.FACTOTMN ELSE 0 END ) TOTALCRED, '
         + 'SUM( CASE WHEN A.FPAGOID=''11'' THEN A.FACMTOMN ELSE 0 END ) SUBTOTCONT, '
         + 'SUM( CASE WHEN A.FPAGOID=''12'' THEN A.FACMTOMN ELSE 0 END ) SUBTOTCRED, '
         + '''' + edtCia.Text + ''' CIADES, '
         + '''' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGO, '
         + 'MAX(A.ALMID) ALMID, ''' + edtAlmacen.Text + ''' ALMDES '
         + 'FROM FAC305 A, TGE180 B, TGE110 C, APO110 D '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.FACESTADO=''ACEPTADO'' '
         + 'AND ( A.FPAGOID IN (''11'',''12'') OR A.OFDESID IS NOT NULL ) '
         + 'AND A.OFDESID=D.OFDESID(+) '
         + 'GROUP BY A.DOCID, C.DOCDES, A.FPAGOID, B.DCCOMDES, A.OFDESID, D.OFDESNOM '
         + 'order by A.DOCID, C.DOCDES, A.FPAGOID, B.DCCOMDES, A.OFDESID, D.OFDESNOM';
   End;

   If rgdTipoRpt.ItemIndex = 3 Then
   Begin
      sSQL := 'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + 'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
         + 'A.ALMID, D.ALMDES, '
         + 'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'and A.ALMID like ''' + dblcAlmacen.Text + '%'' '
         + 'and A.FACESTADO in (''ACEPTADO'') '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + 'AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '

      + 'UNION ALL '

      + 'SELECT A.CIAID, CCSERIE, CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 FACTOTMN, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 FACMTOMN, '
         + '       A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, '
         + ' NVL(T.TIE_ID,S.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + 'FROM CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T '
         + 'WHERE A.CIAID=' + QuotedStr(dblcCia.Text) + ' AND A.DOCID=''27'' '
         + '   AND A.CCFCMPRB >= ' + sDesde + '   AND A.CCFCMPRB <= ' + sHasta + ' '
         + '   AND A.DOCID = C.DOCID   AND C.DOCMOD = ''CXC'' '
         + '   AND A.CIAID=S.CIAID AND A.CCPEDIDO=NISAID(+) AND NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) '
         + '   AND TRIID=''15'' AND NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
         + '   AND NISSIT=''ACEPTADO'' '
         + '   AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
         + ' AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + 'ORDER BY TIE_ID, FACFECHA, DOCID, FACSERIE, NFAC';
   End;

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      Data.DataSource := Nil;
      Information('Modulo de Ventas', 'No Existe Información a Mostrar');
      Exit;
   End;

   If rgdTipoRpt.ItemIndex = 0 Then
   Begin
      Data.DataSource := DMFAC.dsReporte;
      ppTVenta.DataPipeline := Data;
      Diseno.Report := ppTVenta;
      If cbporDia.Checked Then
      Begin
         ppTVenta.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\RptTVenta.rtm';
      End
      Else
      Begin
         ppTVenta.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\RptTVentaTotal.rtm';
      End;
      ppTVenta.Template.LoadFromFile;
      ppPeriodo.Caption := datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);
      Screen.Cursor := crDefault;

      If cbDiseno.Checked Then
         Diseno.ShowModal
      Else
         ppTVenta.Print;

      ppTVenta.Stop;
      ppTVenta.DataPipeline := Nil;
   End;

   If rgdTipoRpt.ItemIndex = 1 Then
   Begin
      Data.DataSource := DMFAC.dsReporte;
      ppTVentaRes.DataPipeline := Data;
      Diseno.Report := ppTVentaRes;
      ppTVentaRes.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\RptTVentaRes.rtm';
      ppTVentaRes.Template.LoadFromFile;
      ppPeriodoRes.Caption := datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);

      Screen.Cursor := crDefault;

      If cbDiseno.Checked Then
         Diseno.ShowModal
      Else
         ppTVentaRes.Print;

      ppTVentaRes.Stop;
      ppTVentaRes.DataPipeline := Nil;
   End;

   If rgdTipoRpt.ItemIndex = 2 Then
   Begin
      ppdb1.DataSource := DMFAC.dsReporte;
      pprOfides.DataPipeline := ppdb1;
      pprOfides.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\RptTVentaOfides.rtm';
      pprOfides.Template.LoadFromFile;

      Screen.Cursor := crDefault;

      If cbDiseno.Checked Then
      Begin
         Diseno.Report := pprOfides;
         Diseno.ShowModal
      End
      Else
         pprOfides.Print;

      pprOfides.Stop;
      pprOfides.DataPipeline := Nil;
   End;

   If rgdTipoRpt.ItemIndex = 3 Then
   Begin
      Data.DataSource := DMFAC.dsReporte;
      ppTVenta.DataPipeline := Data;
      Diseno.Report := ppTVenta;

      ppTVenta.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\RptTVentaSerie.rtm';

      ppTVenta.Template.LoadFromFile;
      ppPeriodo.Caption := datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date);
      Screen.Cursor := crDefault;

      If cbDiseno.Checked Then
         Diseno.ShowModal
      Else
         ppTVenta.Print;

      ppTVenta.Stop;
      ppTVenta.DataPipeline := Nil;
   End;

   Data.DataSource := Nil;
   Diseno.Report := Nil;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
End;

Procedure TFToolFactSG.dblcCiaExit(Sender: TObject);
Begin
   edtCia.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE101', 'CIAABR', 'CIAID=' + QuotedStr(DMFAC.cdsCia.FieldByName('CIAID').AsString), 'CIAABR');
End;

Procedure TFToolFactSG.ppTVentaPreviewFormCreate(Sender: TObject);
Begin
   ppTVenta.PreviewForm.ClientHeight := 500;
   ppTVenta.PreviewForm.ClientWidth := 650;
   TppViewer(ppTVenta.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolFactSG.ppTVentaResPreviewFormCreate(Sender: TObject);
Begin
   ppTVentaRes.PreviewForm.ClientHeight := 500;
   ppTVentaRes.PreviewForm.ClientWidth := 650;
   TppViewer(ppTVentaRes.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;
{
Procedure TFToolFactSG.Button1Click(Sender: TObject);
Var
   xTrans, xCta2, xTDA, sNUM: String;
   sCIA, sALM, sTDA, sLOC, sTIN: String;
   xSQL, xWhere: String;
Begin
   Screen.Cursor := crHourGlass;

    // Insert en el Log314 Cabecera de Nota de Ingreso

   xWhere := 'TDADEVFACT=' + QuotedStr('S');
   xTDA := DMFAC.BuscaQry('dspUltTGE', 'TGE157', 'TDAID', xWhere, 'TDAID');

   xWhere := 'TRISGT=' + QuotedStr('I') + ' ' +
      'AND TRIDEVFACT=' + QuotedStr('S');
   xTrans := DMFAC.BuscaQry('dspUltTGE', 'TGE208', 'TRIID, CUENTAID', xWhere, 'TRIID');
   xCta2 := DMFAC.cdsQry.FieldByName('CUENTAID').AsString;

   sCIA := DMFAC.cdsFact2.FieldByName('CIAID').AsString;
   sALM := DMFAC.cdsFact2.FieldByName('ALMID').AsString;
   sLOC := DMFAC.cdsFact2.FieldByName('LOCID').AsString;
   sTIN := DMFAC.cdsFact2.FieldByName('TINID').AsString;
   sTDA := xTDA;

  //sNUM := DMFAC.StrZero(DMFAC.MaxNIA( sCIA, sALM, sTIN, sLOC, sTDA ),wAnchoIng);
   sNum := '20031145';

   DMFAC.BuscaFecha('TGE114', 'FECANO', 'FECHA', DMFAC.cdsFact2.FieldByName('FECANUL').AsDateTime);
   xFec_Sis := DateToStr(DMFAC.cdsFact2.FieldByName('FECANUL').AsDateTime);
   xSQL := 'INSERT INTO LOG314(' +
      'CIAID, LOCID, ALMID, NISAID, ' +
      'TDAID, DOCID, TRIID, NISAFDOC, NISATIP, NISAFREG, SITFREG, SITHREG, NISAHREG, NISANDOC, ' +
      'TINID, NISSIT, ODCID, NISAUSER, CLIEDES, NISANOMM, CLIEID, TMONID, ' +
      'NISAANO, NISAMES, NISADIA, NISATRIM, NISASEM, NISAANOMES, NISASS, NISAAATRI, NISAAASEM, NISAAASS,  ' +
      'NISAOBS) ' +
      'VALUES (' +
      QuotedStr(sCIA) + ', ' + QuotedStr(sLOC) + ', ' +
      QuotedStr(sALM) + ', ' + QuotedStr(sNUM) + ', ' +
      QuotedStr(xTDA) + ', ' +
      QuotedStr('') + ', ' + QuotedStr(xTrans) + ', ' +
      QuotedStr(FormatDateTime(DMFAC.wFormatFecha, StrtoDate(xFec_Sis))) + ', ' +
      QuotedStr('INGRESO') + ', ' +
      QuotedStr(FormatDateTime(DMFAC.wFormatFecha, StrtoDate(xFec_Sis))) + ', ' +
      DMFAC.wRepFecServi + ', ' + DMFAC.wRepTimeServi + ', ' + DMFAC.wRepTimeServi + ', ' +
      QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString + DMFAC.cdsFact2.fieldbyname('NFAC').AsString) + ', ' +
      QuotedStr(DMFAC.cdsFact2.FieldByName('TINID').AsString) + ', ' +
      QuotedStr('ACEPTADO') + ', ' + QuotedStr('N') + ', ' +
      QuotedStr(DMFAC.wUsuario) + ', ' + QuotedStr(DMFAC.cdsFact2.FieldByName('CLIEDES').AsString) + ', ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECANO').AsString + DMFAC.cdsUltTGE.fieldbyname('FECMES').AsString) + ', ' +
      QuotedStr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString) + ', ' + Quotedstr(DMFAC.wTMonLoc) + ', ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECANO').AsString) + ', ' + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECMES').AsString) + ', ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECDIA').AsString) + ', ' + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECTRIM').AsString) + ', ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECSEM').AsString) + ', ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECANO').AsString + DMFAC.cdsUltTGE.fieldbyname('FECMES').AsString) + ', ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECSS').AsString) + ', ' + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECAATRI').AsString) + ', ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECAASEM').AsString) + ', ' + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECAASS').AsString) + ', ' +
      Quotedstr('Factura Anulada Desde Ventas Nro:' + DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString + DMFAC.cdsFact2.fieldbyname('NFAC').AsString) + ' )';
    //xSQL := xSQL;
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      //DMFAC.ControlTran( 1, nil, '' );
   End;

    // Insert en el Log315 Detalle de Nota de Ingreso - Kardex

   xSQL := 'INSERT INTO LOG315(' +
      'CIAID, LOCID, ALMID, NISAID, TDAID, KDXID, NISAFDOC, ARTID, NISATIP, NISSIT, ' +
      'ARTPCG, ARTMORIPCG, ARTMORIPCU, TCAMB, ARTPVU, ARTPVG, KDXCNTG, KDXPEDIDOG, ARTCONT, UNMIDG, UNMIDU, ' +
      'GRARID, FABID, ARTSPRO, ARTSCA, ARTPARA, ARTSNA, ARTACTIVO, CUENTAID, NISANDOC, FAMID, SFAMID, CUENTA2ID, ' +
      'TINID, NISAFREG, ARTFUC, KDXUSER, KDXFREG, KDXHREG, KDXANO, KDXMM, KDXDD, KDXSEM, ' +
      'KDXSS, KDXANOMM, KDXAATRI, KDXAASEM, KDXAASS, TRIID, ARTDES, TMONID, KDXSALDOG, KDXSALDOU, ARTPCU, ' +
      'KDXCNTU, KDXPEDIDOU, KDXTRI, ARTTOTALG, ARTTOTALU, ARTTOTAL, FNSERIE, ARTCRGO) ' +

   'SELECT A.CIAID, A.LOCID, A.ALMID, ' + QuotedStr(sNUM) + ', ' + QuotedStr(xTDA) + ', A.DFACITEM, ' +
      QuotedStr(FormatDateTime(DMFAC.wFormatFecha, StrtoDate(xFec_Sis))) + ', ' +
      'A.ARTID, ' + QuotedStr('INGRESO') + ', ''ACEPTADO'', ' +
      'B.ARTPCG, B.ARTPCG, 0, A.DFACTCAM, B.ARTPVU, B.ARTPVG, A.DFACCANTAT, A.DFACCANTG, B.ARTCONT, B.UNMIDG, B.UNMIDU, ' +
      'B.GRARID, B.FABID, B.ARTSPRO, B.ARTSCA, B.ARTPARA, B.ARTSNA, B.ARTACTIVO, B.CUENTAID, ' +
      QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString + DMFAC.cdsFact2.fieldbyname('NFAC').AsString) + ', ' +
      'B.FAMID, B.SFAMID, ' + QuotedStr(xCta2) + ', ' +
      QuotedStr(DMFAC.cdsFact2.FieldByName('TINID').AsString) + ', A.FACFECHA, B.ARTFUC, ' + QuotedStr(DMFAC.wUsuario) + ', A.FACFECHA, A.DFACHREG, ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECANO').AsString) + ', ' + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECMES').AsString) + ', ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECDIA').AsString) + ', ' + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECSEM').AsString) + ', ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECSS').AsString) + ', ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECANO').AsString + DMFAC.cdsUltTGE.fieldbyname('FECMES').AsString) + ', ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECAATRI').AsString) + ', ' + QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECAASEM').AsString) + ', ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECAASS').AsString) + ', ' + QuotedStr(xTrans) + ', B.ARTDES, ' +
      QuotedStr(DMFAC.wTMonLoc) + ', 0, 0, 0, 0, 0, ' +
      QuotedStr(DMFAC.cdsUltTGE.fieldbyname('FECTRIM').AsString) + ', ' + DMFAC.wReplacCeros + '(B.ARTCPROG,0)*A.DFACCANTAT, 0, ' +
      DMFAC.wReplacCeros + '(B.ARTCPROG,0)*A.DFACCANTAT, B.FNSERIE, B.ARTCRGO ' +
      'FROM  FAC306 A, TGE205 B ' +
      'WHERE A.CIAID=' + QuotedStr(sCIA) + ' ' +
      'AND A.FACSERIE=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString) + ' ' +
      'AND A.NFAC=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString) + ' ' +
      'AND A.CLIEID=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('CLIEID').AsString) + ' ' +
      'AND B.CIAID=A.CIAID ' +
      'AND B.TINID=' + QuotedStr(sTIN) + ' ' +
      'AND B.ARTID=A.ARTID';
    //xSQL := xSQL;
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      //DMFAC.ControlTran( 1, nil, '' );
   End;

   Screen.Cursor := crDefault;
End;
}

Procedure TFToolFactSG.bbtnEliClick(Sender: TObject);
Var
   xTrans, xCta2, xTDA, sNUM: String;
   sCIA, sALM, sTDA, sLOC, sTIN: String;
Begin
//INICIO HPC_201403_FAC
//NO SE ESTA UTILIZANDO
{
   If Question('Confirmar', 'Esta Seguro de Anular La Factura ' + #13 + #13 +
      'Nº ' + DMFAC.cdsFact2.FieldByName('NFAC').AsString + '  -  Cliente:  ' +
      DMFAC.cdsFact2.FieldByName('CLIEDES').AsString + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      Screen.Cursor := crHourGlass;

      xFiltro := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString) + ' ' +
         'AND CLIEID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString) + ' ' +
         'AND FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString) + ' ' +
         'AND NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
      Filtracds(DMFAC.cdsDetFact2, 'SELECT * FROM FAC306 WHERE ' + xFiltro);

      DMFAC.cdsDetFact2.First;
      While Not DMFAC.cdsDetFact2.Eof Do
      Begin
         If DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString = 'S' Then
            FFactSGuia.RevierteStock;
         DMFAC.cdsDetFact2.Next;
      End;

      DMFAC.ControlTran(9, DMFAC.cdsFact2, 'FACSGUIA');

      Screen.Cursor := crDefault;
   End;
}
//FINAL HPC_201403_FAC   
End;



Procedure TFToolFactSG.BitBtn1Click(Sender: TObject);
Begin
   Try
      FFacMaesClie := TFFacMaesClie.Create(Self);
      FFacMaesClie.ShowModal;
   Finally
      FFacMaesClie.Free;
   End;
End;

Procedure TFToolFactSG.Timer1Timer(Sender: TObject);
Begin
//
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));

   If (sSupervisor = 'S') Or (DMFAC.wUsuario = 'ATENORIO') Then
      bbtnActVendedor.Visible := True
   Else
      bbtnActVendedor.Visible := False;
//
   FVariables.w_NombreForma := 'FToolFactSG';

// Inicio HPC_201311_FAC
// incluye al usuario de tipo administrador en el destroy del timer
{
   If (DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P') Then Exit;
   If Not xAccesoBotones Then
   Begin
      DMFAC.AccesosUsuariosR(DMFAC.wModulo, DMFAC.wUsuario, '2', FToolFactSG);
      xAccesoBotones := True;
   End;
}
   If (DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P') Then
   Else
   Begin
      If Not xAccesoBotones Then
      Begin
         DMFAC.AccesosUsuariosR(DMFAC.wModulo, DMFAC.wUsuario, '2', FToolFactSG);
         xAccesoBotones := True;
      End;
   End;
// Fin HPC_201311_FAC

   Timer1.Destroy;
End;

Procedure TFToolFactSG.dblcFabExit(Sender: TObject);
Begin
   edtFab.text := DMFAC.BuscaQry('dspUltTGE', 'TGE150', 'FABDES', 'FABID=' + quotedstr(dblcFAB.text), 'FABDES');
End;

Procedure TFToolFactSG.bbtnFabClick(Sender: TObject);
Var
   x10: Integer;
   xSQL, sDesde, sHasta: String;
Begin
{
   If (DMFAC.wUsuario = 'JVLOZANO') Then
   Else
   Begin
      ShowMessage('Error : Usuario No Autorizado...');
      Exit;
   End;
}
   If dblcCia.Text = '' Then
   Begin
      ShowMessage('Error : Debe Ingresar Compañía');
      Exit;
   End;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   xSQL := 'SELECT A.CIAID, A.ARTID, A.TINID, A.GRARID, A.FAMID, A.SFAMID, A.FAMID, A.UNMABR, '
      + 'B.FABID, C.FABDES, B.ARTDES, '
      + 'SUM(DFACCANTG) CANTIDAD, SUM(DFACMTOMN) VENTA, '
      + '''' + edtCia.Text + ''' CIADES, ' + sDesde + ' FDESDE, ' + sHasta + ' FHASTA '
      + 'FROM FAC306 A, TGE205 B, TGE150 C, FAC305 D '
      + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
      + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
      + 'AND A.CIAID=B.CIAID AND A.TINID=B.TINID AND A.GRARID=B.GRARID '
      + 'AND A.FAMID=B.FAMID AND A.SFAMID=B.SFAMID AND A.ARTID=B.ARTID '
      + 'AND B.FABID=C.FABID '
      + 'AND A.CIAID=D.CIAID AND A.DOCID=D.DOCID AND A.FACSERIE=D.FACSERIE '
      + 'AND A.NFAC=D.NFAC AND D.FACESTADO=''ACEPTADO'' '
      + 'and A.ALMID like ''' + dblcAlmacen.Text + '%'' ';

   If dblcFab.Text <> '' Then
      xSQL := xSQL + 'AND B.FABID=''' + dblcFab.Text + ''' ';

   xSQL := xSQL + 'GROUP BY A.CIAID, A.ARTID, A.TINID, A.GRARID, A.FAMID, A.SFAMID, A.FAMID, A.UNMABR, '
      + 'B.FABID, C.FABDES, B.ARTDES ';
   xSQL := xSQL + 'ORDER BY B.FABID, ARTID';

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xSQL);
   DMFAC.cdsReporte.Open;
   ppdbFab.DataSource := DMFAC.dsReporte;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      Data.DataSource := Nil;
      Information('Modulo de Ventas', 'No Existe Información a Mostrar por Fabricante');
      Exit;
   End;

   pprFab.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\RptVentaFab.rtm';
   pprFab.Template.LoadFromFile;

   Screen.Cursor := crDefault;

  //ppd1.ShowModal;
   pprFab.Print;
   pprFab.Stop;

   ppdbFab.DataSource := Nil;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
End;

Procedure TFToolFactSG.dblcAlmacenEnter(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select ALMID, ALMDES from TGE151 '
      + 'Where CIAID=' + QuotedStr(dblcCia.Text)
      + ' AND ALMVTA=''S'' '
      + 'ORDER BY ALMID';
   DMFAC.cdsQry8.Close;
   DMFAC.cdsQry8.DataRequest(xSQL);
   DMFAC.cdsQry8.Open;

   dblcAlmacen.LookupTable := DMFAC.cdsQry8;
End;

Procedure TFToolFactSG.dblcAlmacenExit(Sender: TObject);
Begin
   edtAlmacen.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE151', 'ALMDES', 'CIAID=' + QuotedStr(dblcCia.text) + ' AND ALMID=' + QuotedStr(dblcAlmacen.Text), 'ALMDES');
End;

Procedure TFToolFactSG.pprOfidesPreviewFormCreate(Sender: TObject);
Begin
   pprOfides.PreviewForm.ClientHeight := 500;
   pprOfides.PreviewForm.ClientWidth := 650;
   TppViewer(pprOfides.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFToolFactSG.dblcCiaEnter(Sender: TObject);
Begin
   dblcCia.LookupTable := DMFAC.cdsCia;
End;

Procedure TFToolFactSG.sbtnInicialClick(Sender: TObject);
Var
   xTrans, xCta2, xTDA, sNUM, xReg: String;
   sCIA, sALM, sTDA, sLOC, sTIN, xSQL: String;
   xWhere: String;
Begin

   If GFactura.FMant.cds2.FieldByName('CIAID').AsString = '04' Then Exit;

   If Not (sSupervisor = 'S') Then
   Begin
      ShowMessage('El Usuario NO tiene Autorización para cambiar a INICIAL la Boleta/Factura');
      Exit;
   End;

   xWhere := 'SELECT ' + DMFAC.wRepFuncChar + DMFAC.wRepFecServi + ', '
      + QuotedStr('DD/MM/YYYY') + ') "FECHA", SYSDATE HORA FROM DUAL';
   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xWhere);
   DMFAC.cdsReporte.Open;
   xFec_Sis := DMFAC.cdsReporte.FieldByName('FECHA').AsString;
   xHor_Sis := DMFAC.cdsReporte.FieldByName('HORA').AsString;

   xSQL := ' SELECT * FROM FAC305 WHERE ' +
      ' CIAID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('CIAID').AsString) +
      ' AND DOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('DOCID').AsString) +
      ' AND FACSERIE=' + QuotedStr(GFactura.FMant.cds2.FieldByName('FACSERIE').AsString) +
      ' AND NFAC=' + QuotedStr(GFactura.FMant.cds2.FieldByName('NFAC').AsString);

   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.DataRequest(xSQL);
   DMFAC.cdsFact2.Open;

   If DMFAC.cdsFact2.RecordCount = 0 Then
      exit;

   If (trim(DMFAC.cdsFact2.FieldbyName('FACESTADO').AsString) <> 'ACEPTADO') Then
   Begin
      ErrorMsg(Caption, 'Factura NO se Puede cambiar a estado Inicial. Verificar...');
      Exit;
   End;

   DMFAC.VerificaPeriodoVentas(DMFAC.cdsFact2.FieldByName('CIAID').AsString,
      DMFAC.cdsFact2.FieldByName('LOCID').AsString, DMFAC.cdsFact2.FieldByName('TINID').AsString,
      DMFAC.cdsFact2.FieldByName('ALMID').AsString, DMFAC.DateS,
      DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime);

   If Not wVerifPerVentas Then
   Begin
      exit;
   End;

   If Question('Confirmar', 'Esta Seguro de Cambiar a INICIAL La Factura ' + #13 + #13 +
      'Nº ' + DMFAC.cdsFact2.FieldByName('NFAC').AsString + '  -  Cliente:  ' +
      DMFAC.cdsFact2.FieldByName('CLIEDES').AsString + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      Screen.Cursor := crHourGlass;

      xFiltro := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString) + ' ' +
         'AND CLIEID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString) + ' ' +
         'AND FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString) + ' ' +
         'AND NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
      Filtracds(DMFAC.cdsDetFact2, 'SELECT * FROM FAC306 WHERE ' + xFiltro);
      DMFAC.cdsDetFact2.First;
      ErrorCount := 0;

      DMFAC.DCOM1.AppServer.IniciaTransaccion;
      While Not DMFAC.cdsDetFact2.Eof Do
      Begin
         If DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString = 'S' Then
            FFactSGuia.RevierteStock;
         DMFAC.cdsDetFact2.Next;
      End;

      sSQL := 'DELETE FROM LOG314 '
         + 'where CIAID=''' + DMFAC.cdsFact2.FieldByName('CIAID').AsString + ''' '
         + 'and NISAID=''' + DMFAC.cdsFact2.fieldbyname('DOCID').AsString
         + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString
         + DMFAC.cdsFact2.FieldByName('NFAC').AsString + ''' '
         + 'and TINID=''' + DMFAC.cdsFact2.FieldByName('TINID').AsString + ''' ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         //INICIO HPC_201403_FAC
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo eliminar el movimiento en LOG314');
         Screen.Cursor := crDefault;
         Exit;
         //FINAL HPC_201403_FAC
      End;

      sSQL := 'DELETE FROM LOG315 '
         + 'where CIAID=''' + DMFAC.cdsFact2.FieldByName('CIAID').AsString + ''' '
         + 'and NISAID=''' + DMFAC.cdsFact2.fieldbyname('DOCID').AsString
         + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString
         + DMFAC.cdsFact2.FieldByName('NFAC').AsString + ''' '
         + 'and TINID=''' + DMFAC.cdsFact2.FieldByName('TINID').AsString + ''' ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         //INICIO HPC_201403_FAC
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo eliminar el movimiento en LOG315');
         Screen.Cursor := crDefault;
         Exit;
         //FINAL HPC_201402FAC
      End;

      xSQL := 'select CIAID, CCANOMES, TDIARID, CCNOREG from CXC301 '
         + 'Where CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString) + ' ' +
         'AND CCANOMES=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString) + ' ' +
         'AND DOCID=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString) + ' ' +
         'AND CCSERIE=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString) + ' ' +
         'AND CCNODOC=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString);
      DMFAC.cdsQry10.Close;
      DMFAC.cdsQry10.DataRequest(xSQL);
      DMFAC.cdsQry10.Open;

      sSQL := 'DELETE FROM CXC301 '
         + 'WHERE CIAID=''' + DMFAC.cdsFact2.FieldByName('CIAID').AsString + ''' '
         + ' AND DOCID=''' + DMFAC.cdsFact2.FieldByName('DOCID').AsString + ''' '
         + ' AND CCSERIE=''' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString + ''' '
         + ' AND CCNODOC=''' + DMFAC.cdsFact2.FieldByName('NFAC').AsString + ''' ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         //INICIO HPC_201403_FAC
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo eliminar el movimiento en CXC301');
         Screen.Cursor := crDefault;
         Exit;
         //FINAL HPC_201402FAC

      End;

      sSQL := 'DELETE FROM CXC302 '
         + 'WHERE CIAID=''' + DMFAC.cdsFact2.FieldByName('CIAID').AsString + ''' '
         + ' AND DOCID=''' + DMFAC.cdsFact2.FieldByName('DOCID').AsString + ''' '
         + ' AND CCSERIE=''' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString + ''' '
         + ' AND CCNODOC=''' + DMFAC.cdsFact2.FieldByName('NFAC').AsString + ''' ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         //INICIO HPC_201403_FAC
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo eliminar el movimiento en CXC302');
         Screen.Cursor := crDefault;
         Exit;
         //FINAL HPC_201402FAC
      End;

      sSQL := 'DELETE FROM CNT311 '
         + 'WHERE CIAID=''' + DMFAC.cdsFact2.FieldByName('CIAID').AsString + ''' AND '
         + 'CNTANOMM=''' + DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString + ''' AND '
         + 'TDIARID=''' + DMFAC.cdsQry10.fieldbyname('TDIARID').AsString + ''' AND '
         + 'CNTCOMPROB=''' + DMFAC.cdsQry10.fieldbyname('CCNOREG').AsString + ''' ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         //INICIO HPC_201403_FAC
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo eliminar el movimiento en CNT311');
         Screen.Cursor := crDefault;
         Exit;
         //FINAL HPC_201402FAC
      End;

      sSQL := 'DELETE FROM CNT301 '
         + 'WHERE CIAID=''' + DMFAC.cdsFact2.FieldByName('CIAID').AsString + ''' AND '
         + 'CNTANOMM=''' + DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString + ''' AND '
         + 'TDIARID=''' + DMFAC.cdsQry10.fieldbyname('TDIARID').AsString + ''' AND '
         + 'CNTCOMPROB=''' + DMFAC.cdsQry10.fieldbyname('CCNOREG').AsString + ''' ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         //INICIO HPC_201403_FAC
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo eliminar el movimiento en CNT301');
         Screen.Cursor := crDefault;
         Exit;
         //FINAL HPC_201402FAC
      End;

      sSQL := 'DELETE FROM CNT300 '
         + 'WHERE CIAID=''' + DMFAC.cdsFact2.FieldByName('CIAID').AsString + ''' AND '
         + 'CNTANOMM=''' + DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString + ''' AND '
         + 'TDIARID=''' + DMFAC.cdsQry10.fieldbyname('TDIARID').AsString + ''' AND '
         + 'CNTCOMPROB=''' + DMFAC.cdsQry10.fieldbyname('CCNOREG').AsString + ''' ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         //INICIO HPC_201403_FAC
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo eliminar el movimiento en CNT300');
         Screen.Cursor := crDefault;
         Exit;
         //FINAL HPC_201402FAC
      End;

      sSQL := 'UPDATE FAC306 SET DFACESTADO=''INICIAL'', NFAC=NFAC||''_'' '
         + 'where CIAID=''' + DMFAC.cdsFact2.FieldByName('CIAID').AsString + ''' '
         + 'and DOCID=''' + DMFAC.cdsFact2.FieldByName('DOCID').AsString + ''' '
         + 'and FACSERIE=''' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString + ''' '
         + 'and NFAC=''' + DMFAC.cdsFact2.FieldByName('NFAC').AsString + ''' '
         + 'and TINID=''' + DMFAC.cdsFact2.FieldByName('TINID').AsString + ''' ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         //INICIO HPC_201403_FAC
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo actualizar el ESTADO en FAC306');
         Screen.Cursor := crDefault;
         Exit;
         //FINAL HPC_201402FAC
      End;

      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('NFAC').AsString      := DMFAC.cdsFact2.FieldByName('NFAC').AsString + '_';
      DMFAC.cdsFact2.FieldByName('FACESTADO').AsString := 'INICIAL';
      //INICIO HPC_201403_FAC
      //DMFAC.cdsPost(DMFAC.cdsFact2);
      DMFAC.cdsFact2.Post;
      If DMFAC.cdsFact2.ApplyUpdates(0)>0 then
      begin
        ShowMessage('Error al intentar actualizar la cabecera FAC305');
        DMFAC.DCOM1.AppServer.RetornaTransaccion;
        Screen.Cursor := crDefault;
        Exit;
      end;
      //DMFAC.ControlTran(0, DMFAC.cdsFact2, 'FACSGUIA');
      //DMFAC.ControlTran(0, DMFAC.cdsKDXSerie, 'KDXSERIE');
      //DMFAC.ControlTran(8, Nil, '');
      DMFAC.DCOM1.AppServer.GrabaTransaccion;
      //FINAL HPC_201403_FAC

      DMFAC.ActualizaFiltro(GFactura, DMFAC.cdsFact2, 'M');

      Screen.Cursor := crDefault;
   End;
End;

// Inicio HPC_201701_FAC
//        Reactiva Función Anular
Procedure TFToolFactSG.sbtnSuperAnularClick(Sender: TObject);
Var
   xTrans, xCta2, xTDA, sNUM, xReg: String;
   sCIA, sALM, sTDA, sLOC, sTIN, xSQL: String;
   xWhere: String;
Begin

   If Not ((sSupervisor = 'S') Or (sFlAnula = 'S')) Then
   Begin
      ShowMessage('El Usuario NO tiene Autorización para marcar el documento para Anulación');
      Exit;
   End;

   xWhere := 'SELECT ' + DMFAC.wRepFuncChar + DMFAC.wRepFecServi + ', ' + QuotedStr('DD/MM/YYYY') + ') "FECHA", SYSDATE HORA FROM DUAL';
   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xWhere);
   DMFAC.cdsReporte.Open;
   xFec_Sis := DMFAC.cdsReporte.FieldByName('FECHA').AsString;
   xHor_Sis := DMFAC.cdsReporte.FieldByName('HORA').AsString;

   xSQL := ' SELECT * FROM FAC305 WHERE ' +
      ' CIAID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('CIAID').AsString) +
      ' AND LOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('LOCID').AsString) +
      ' AND TINID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('TINID').AsString) +
      ' AND ALMID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('ALMID').AsString) +
      ' AND DOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('DOCID').AsString) +
      ' AND FACSERIE=' + QuotedStr(GFactura.FMant.cds2.FieldByName('FACSERIE').AsString) +
      ' AND NFAC=' + QuotedStr(GFactura.FMant.cds2.FieldByName('NFAC').AsString);
   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.DataRequest(xSQL);
   DMFAC.cdsFact2.Open;

   If DMFAC.cdsFact2.RecordCount = 0 Then
      exit;

   If (trim(DMFAC.cdsFact2.FieldbyName('FACESTADO').AsString) <> 'ACEPTADO') Then
   Begin
      ErrorMsg(Caption, 'Solo se pueden Anular Documentos Aceptados, verifique...');
      Exit;
   End;

   DMFAC.VerificaPeriodoVentas(DMFAC.cdsFact2.FieldByName('CIAID').AsString,
      DMFAC.cdsFact2.FieldByName('LOCID').AsString, DMFAC.cdsFact2.FieldByName('TINID').AsString,
      DMFAC.cdsFact2.FieldByName('ALMID').AsString, DMFAC.DateS,
      DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime);

   If Not wVerifPerVentas Then
   Begin
      exit;
   End;

   If trim(DMFAC.cdsFact2.FieldByName('USUSUPANU').AsString) = '' Then
   Begin
      If Question('Confirmar', 'Esta Seguro de Marcar para anular la Boleta/Factura ' + #13 + #13 +
         'Nº ' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString + '-' + DMFAC.cdsFact2.FieldByName('NFAC').AsString + '  -  Cliente:  ' +
         DMFAC.cdsFact2.FieldByName('CLIEDES').AsString + #13 +
         #13 + ' Desea Continuar ') Then
      Begin
         Screen.Cursor := crHourGlass;
         ErrorCount := 0;
         DMFAC.DCOM1.AppServer.IniciaTransaccion;
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('USUSUPANU').AsString := DMFAC.wUsuario;
         DMFAC.cdsFact2.FieldByName('FECSUPANU').AsString := xHor_Sis;
         //INICIO HPC_201403_FAC
         //DMFAC.cdsPost(DMFAC.cdsFact2);
         DMFAC.cdsFact2.Post;
         if DMFAC.cdsFact2.ApplyUpdates(0)>0 then
         begin
           ShowMessage('Error al intentar actualizar la cabecera FAC305');
           DMFAC.DCOM1.AppServer.RetornaTransaccion;
           Screen.Cursor := crDefault;
           Exit;
         end;
         //DMFAC.ControlTran(0, DMFAC.cdsFact2, 'FACSGUIA');
         //DMFAC.ControlTran(8, Nil, '');
         DMFAC.DCOM1.AppServer.GrabaTransaccion;
         //FINAL HPC_201403_FAC
         DMFAC.ActualizaFiltro(GFactura, DMFAC.cdsFact2, 'M');
         Screen.Cursor := crDefault;
      End;
   End
   Else
   Begin
      If Question('Confirmar', 'Esta Seguro de Borrar la Marcar para anular la Boleta/Factura ' + #13 + #13 +
         'Nº ' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString + '-' + DMFAC.cdsFact2.FieldByName('NFAC').AsString + '  -  Cliente:  ' +
         DMFAC.cdsFact2.FieldByName('CLIEDES').AsString + #13 +
         #13 + ' Desea Continuar ') Then
      Begin
         Screen.Cursor := crHourGlass;
         ErrorCount := 0;
         DMFAC.DCOM1.AppServer.IniciaTransaccion;
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('USUSUPANU').AsString := '';
         DMFAC.cdsFact2.FieldByName('FECSUPANU').AsString := '';
         //INICIO HPC_201403_FAC
         //DMFAC.cdsPost(DMFAC.cdsFact2);
         DMFAC.cdsFact2.Post;
         if DMFAC.cdsFact2.ApplyUpdates(0)>0 then
         begin
            ShowMessage('Error al intentar actualizar la cabecera FAC305');
            DMFAC.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            Exit;
         end;
         //DMFAC.ControlTran(0, DMFAC.cdsFact2, 'FACSGUIA');
         //DMFAC.ControlTran(8, Nil, '');
         DMFAC.DCOM1.AppServer.GrabaTransaccion;
         //FINAL HPC_201403_FAC
         DMFAC.ActualizaFiltro(GFactura, DMFAC.cdsFact2, 'M');
         Screen.Cursor := crDefault;
      End;
   End;
End;
// Fin  HPC_201701_FAC

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
(*
Procedure TFToolFactSG.sbtnGenCxCBazarClick(Sender: TObject);
Begin
   FContabBaz := TFContabBaz.Create(self);
   FContabBaz.ShowModal;
   FContabBaz.Free;
End;
*)
// Fin FAC-201806

Procedure TFToolFactSG.sbtnSuperDctoClick(Sender: TObject);
Var
   xTrans, xCta2, xTDA, sNUM, xReg: String;
   sCIA, sALM, sTDA, sLOC, sTIN, xSQL, wSQL: String;
   xTDscto, xTFact: Double;
   xWhere: String;
Begin

   If (Not ((sSupervisor = 'S') Or (sFlDscto = 'S'))) And (GFactura.FMant.cds2.FieldByName('CIAID').AsString <> '05') Then
   Begin
      ShowMessage('El Usuario NO tiene Autorización para Aprobar el Descuento en la Boleta/Factura');
      Exit;
   End;

   xWhere := 'SELECT ' + DMFAC.wRepFuncChar + DMFAC.wRepFecServi + ', ' + QuotedStr('DD/MM/YYYY') + ') "FECHA", SYSDATE HORA FROM DUAL';
   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xWhere);
   DMFAC.cdsReporte.Open;
   xFec_Sis := DMFAC.cdsReporte.FieldByName('FECHA').AsString;
   xHor_Sis := DMFAC.cdsReporte.FieldByName('HORA').AsString;

   xSQL := ' SELECT * FROM FAC305 WHERE ' +
      ' CIAID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('CIAID').AsString) +
      ' AND LOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('LOCID').AsString) +
      ' AND TINID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('TINID').AsString) +
      ' AND ALMID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('ALMID').AsString) +
      ' AND DOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('DOCID').AsString) +
      ' AND FACSERIE=' + QuotedStr(GFactura.FMant.cds2.FieldByName('FACSERIE').AsString) +
      ' AND NFAC=' + QuotedStr(GFactura.FMant.cds2.FieldByName('NFAC').AsString);
   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.DataRequest(xSQL);
   DMFAC.cdsFact2.Open;

   If DMFAC.cdsFact2.RecordCount = 0 Then
      exit;

   If (trim(DMFAC.cdsFact2.FieldbyName('FACESTADO').AsString) <> 'INICIAL') Then
   Begin
      ErrorMsg(Caption, 'Solo se puede Aprobar Descuentos en Documentos en Estado INICIAL...');
      Exit;
   End;

   DMFAC.VerificaPeriodoVentas(DMFAC.cdsFact2.FieldByName('CIAID').AsString,
      DMFAC.cdsFact2.FieldByName('LOCID').AsString, DMFAC.cdsFact2.FieldByName('TINID').AsString,
      DMFAC.cdsFact2.FieldByName('ALMID').AsString, DMFAC.DateS,
      DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime);

   If Not wVerifPerVentas Then
   Begin
      exit;
   End;

 // vhn Verifica Descuento de Documento
   wSQL := 'CIAID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
      + ' AND DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + ' AND FACSERIE =' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
      + ' AND NFAC =' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString)
      + ' ORDER BY DFACITEM';
   Filtracds(DMFAC.cdsDetFact2, 'SELECT * FROM FAC306 WHERE ' + wSQL);

   xTDscto := 0;
   xTFact := 0;
   DMFAC.cdsDetFact2.First;
   DMFAC.cdsDetFact2.DisableControls;
   While Not DMFAC.cdsDetFact2.eof Do
   Begin
      If DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString <> 'N' Then
      Begin
         xTDscto := xTDscto + (DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat + DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat);
         xTFact := xTFact + DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat;
      End;
      DMFAC.cdsDetFact2.Next;
   End; //While
   DMFAC.cdsDetFact2.EnableControls;

   If xTDscto <= 0 Then
   Begin
      ShowMessage('Boleta/Factura NO tiene Descuento...');
      Exit;
   End;
 // vhn End Verifica Descuento de Documento

   If trim(DMFAC.cdsFact2.FieldByName('USUSUPDCT').AsString) = '' Then
   Begin
      {If Question('Confirmar', 'Esta Seguro de Aprobar el Descuento en la BoletaFactura ' + #13 + #13 +
         'Cliente         : '+DMFAC.cdsFact2.FieldByName('CLIEDES').AsString + #13 +#13 +
         'Nº ' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString+'-'+DMFAC.cdsFact2.FieldByName('NFAC').AsString +#13 +#13 +
         'Descuento total : '+FloatToStrF(xTDscto,ffnumber,15,2)+  #13 +#13 +
         'Total Bol./Fac. : '+FloatToStrF(xTFact,ffnumber,15,2)+  #13 +
         #13 + ' Desea Continuar ') Then
      Begin}
      If MessageDlg('Esta Seguro de Aprobar el Descuento en la BoletaFactura ' + #13 + #13 +
         'Cliente         : ' + DMFAC.cdsFact2.FieldByName('CLIEDES').AsString + #13 + #13 +
         'Nº ' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString + '-' + DMFAC.cdsFact2.FieldByName('NFAC').AsString + #13 + #13 +
         'Descuento total : ' + FloatToStrF(xTDscto, ffnumber, 15, 2) + #13 + #13 +
         'Total Bol./Fac. : ' + FloatToStrF(xTFact, ffnumber, 15, 2) + #13 +
         #13 + ' Desea Continuar ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin

         Screen.Cursor := crHourGlass;
         ErrorCount := 0;
         DMFAC.DCOM1.AppServer.IniciaTransaccion;
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('USUSUPDCT').AsString := DMFAC.wUsuario;
         DMFAC.cdsFact2.FieldByName('FECSUPDCT').AsString := xHor_Sis;
         //INICIO HPC_201403_FAC
         //DMFAC.cdsPost(DMFAC.cdsFact2);
         DMFAC.cdsFact2.Post;
         if DMFAC.cdsFact2.ApplyUpdates(0)>0 then
         begin
            ShowMessage('Error al intentar actualizar AUTORIZACION DE DESCUENTO en la cabecera FAC305');
            DMFAC.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            Exit;
         end;
         //DMFAC.ControlTran(0, DMFAC.cdsFact2, 'FACSGUIA');
         //DMFAC.ControlTran(8, Nil, '');
         DMFAC.DCOM1.AppServer.GrabaTransaccion;
         //FINAL HPC_201403_FAC

         DMFAC.ActualizaFiltro(GFactura, DMFAC.cdsFact2, 'M');
         Screen.Cursor := crDefault;
      End;
   End
   Else
   Begin
      {If Question('Confirmar', 'Esta Seguro de Revertir Aprobación de Descuento en la Boleta/Factura ' + #13 + #13 +
         'Cliente         : '+DMFAC.cdsFact2.FieldByName('CLIEDES').AsString + #13 +#13 +
         'Nº ' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString+'-'+DMFAC.cdsFact2.FieldByName('NFAC').AsString +#13 +#13 +
         'Descuento total : '+FloatToStrF(xTDscto,ffnumber,15,2)+  #13 +#13 +
         'Total Bol./Fac. : '+FloatToStrF(xTFact,ffnumber,15,2)+  #13 +
         #13 + ' Desea Continuar ') Then
      Begin}
      If MessageDlg('Esta Seguro de Revertir Aprobación de Descuento en la Boleta/Factura ' + #13 + #13 +
         'Cliente         : ' + DMFAC.cdsFact2.FieldByName('CLIEDES').AsString + #13 + #13 +
         'Nº ' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString + '-' + DMFAC.cdsFact2.FieldByName('NFAC').AsString + #13 + #13 +
         'Descuento total : ' + FloatToStrF(xTDscto, ffnumber, 15, 2) + #13 + #13 +
         'Total Bol./Fac. : ' + FloatToStrF(xTFact, ffnumber, 15, 2) + #13 +
         #13 + ' Desea Continuar ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         Screen.Cursor := crHourGlass;
         ErrorCount := 0;
         DMFAC.DCOM1.AppServer.IniciaTransaccion;
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('USUSUPDCT').AsString := '';
         DMFAC.cdsFact2.FieldByName('FECSUPDCT').AsString := '';
         //INICIO HPC_201403_FAC
         //DMFAC.cdsPost(DMFAC.cdsFact2);
         DMFAC.cdsFact2.Post;
         if DMFAC.cdsFact2.ApplyUpdates(0)>0 then
         begin
            ShowMessage('Error al intentar Reverit la  AUTORIZACION DE DESCUENTO en la cabecera FAC305');
            DMFAC.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            Exit;
         end;
         //DMFAC.ControlTran(0, DMFAC.cdsFact2, 'FACSGUIA');
         //DMFAC.ControlTran(8, Nil, '');
          DMFAC.DCOM1.AppServer.GrabaTransaccion;
         //FINAL HPC_201403_FAC
         DMFAC.ActualizaFiltro(GFactura, DMFAC.cdsFact2, 'M');
         Screen.Cursor := crDefault;
      End;
   End;
End;

Procedure TFToolFactSG.sbtnReImpClick(Sender: TObject);
Var
   xTrans, xCta2, xTDA, sNUM, xReg: String;
   sCIA, sALM, sTDA, sLOC, sTIN, xSQL, wSQL: String;
   xTDscto, xTFact: Double;
   xWhere: String;
Begin
   If Not (sSupervisor = 'S') Then
   Begin
      ShowMessage('El Usuario NO tiene Autorización para Autorizar a Reimprimir Boleta/Factura');
      Exit;
   End;

   xWhere := 'SELECT ' + DMFAC.wRepFuncChar + DMFAC.wRepFecServi + ', ' + QuotedStr('DD/MM/YYYY') + ') "FECHA", SYSDATE HORA FROM DUAL';
   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xWhere);
   DMFAC.cdsReporte.Open;
   xFec_Sis := DMFAC.cdsReporte.FieldByName('FECHA').AsString;
   xHor_Sis := DMFAC.cdsReporte.FieldByName('HORA').AsString;

   xSQL := ' SELECT * FROM FAC305 WHERE ' +
      ' CIAID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('CIAID').AsString) +
      ' AND LOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('LOCID').AsString) +
      ' AND TINID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('TINID').AsString) +
      ' AND ALMID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('ALMID').AsString) +
      ' AND DOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('DOCID').AsString) +
      ' AND FACSERIE=' + QuotedStr(GFactura.FMant.cds2.FieldByName('FACSERIE').AsString) +
      ' AND NFAC=' + QuotedStr(GFactura.FMant.cds2.FieldByName('NFAC').AsString);
   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.DataRequest(xSQL);
   DMFAC.cdsFact2.Open;

   If DMFAC.cdsFact2.RecordCount = 0 Then
      exit;

   If Not ((trim(DMFAC.cdsFact2.FieldbyName('FACESTADO').AsString) = 'ACEPTADO') Or (trim(DMFAC.cdsFact2.FieldbyName('FACESTADO').AsString) = 'ANULADO')) Then
   Begin
      ErrorMsg(Caption, 'Solo se puede Reimprimir documentos Acepatados o Anulados...');
      Exit;
   End;

   If trim(DMFAC.cdsFact2.FieldByName('FACIMPREP').AsString) = 'S' Then
   Begin
      If MessageDlg('Esta Seguro de Marcar Documento para volver a Imprimir ' + #13 + #13 +
         'Cliente         : ' + DMFAC.cdsFact2.FieldByName('CLIEDES').AsString + #13 + #13 +
         'Nº ' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString + '-' + DMFAC.cdsFact2.FieldByName('NFAC').AsString + #13 + #13 +
         #13 + ' Desea Continuar ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin

         Screen.Cursor := crHourGlass;
         ErrorCount := 0;
         DMFAC.DCOM1.AppServer.IniciaTransaccion;
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('FACIMPREP').AsString := 'N';
         //INICIO HPC_201403_FAC
         //DMFAC.cdsPost(DMFAC.cdsFact2);
         DMFAC.cdsFact2.Post;
         if DMFAC.cdsFact2.ApplyUpdates(0)>0 then
         begin
            ShowMessage('Error al intentar Reverit la  AUTORIZACION DE DESCUENTO en la cabecera FAC305');
            DMFAC.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            Exit;
         end;
         //DMFAC.ControlTran(0, DMFAC.cdsFact2, 'FACSGUIA');
         //DMFAC.ControlTran(8, Nil, '');
          DMFAC.DCOM1.AppServer.GrabaTransaccion;
         //FINAL HPC_201403_FAC
         DMFAC.ActualizaFiltro(GFactura, DMFAC.cdsFact2, 'M');
         Screen.Cursor := crDefault;
      End;
   End
   Else
   Begin
      If MessageDlg('Esta Seguro de Marcar Documento como Impreso ' + #13 + #13 +
         'Cliente         : ' + DMFAC.cdsFact2.FieldByName('CLIEDES').AsString + #13 + #13 +
         'Nº ' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString + '-' + DMFAC.cdsFact2.FieldByName('NFAC').AsString + #13 + #13 +
         #13 + ' Desea Continuar ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         Screen.Cursor := crHourGlass;
         ErrorCount := 0;
         DMFAC.DCOM1.AppServer.IniciaTransaccion;
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('FACIMPREP').AsString := 'S';
         //INICIO HPC_201403_FAC
         //DMFAC.cdsPost(DMFAC.cdsFact2);
         DMFAC.cdsFact2.Post;
         if DMFAC.cdsFact2.ApplyUpdates(0)>0 then
         begin
            ShowMessage('Error al intentar Reverit la  AUTORIZACION DE DESCUENTO en la cabecera FAC305');
            DMFAC.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := crDefault;
            Exit;
         end;
         //DMFAC.ControlTran(0, DMFAC.cdsFact2, 'FACSGUIA');
         //DMFAC.ControlTran(8, Nil, '');
          DMFAC.DCOM1.AppServer.GrabaTransaccion;
         //FINAL HPC_201403_FAC
         DMFAC.ActualizaFiltro(GFactura, DMFAC.cdsFact2, 'M');
         Screen.Cursor := crDefault;
      End;
   End;
End;

Procedure TFToolFactSG.bbtnActVendedorClick(Sender: TObject);
Begin
// FAC362
   Try
      FActVendFactura := TFActVendFactura.Create(Self);
      FActVendFactura.ShowModal;
   Finally
      FActVendFactura.Free;
   End;
End;


procedure TFToolFactSG.renumeraregdetalle(xciaid,xccanomes,cxserie, xnfac, xtipdoc: string);
var XSQL:String;
    xcuenta:Integer;
begin
 XSQL:= 'SELECT CCMTOORI,CCDH,CUENTAID,CIAID, CCANOMES, CCSERIE, CCNODOC, DOCID,CCREG '
       +'FROM CXC302 '
       +'WHERE CIAID='''+xciaid+''' AND CCANOMES='''+xccanomes+''' AND CCSERIE='''+cxserie+''' AND CCNODOC='''+xnfac+''' AND DOCID='''+xtipdoc+''' ';
 DMFAC.cdsQry.Close;
 DMFAC.cdsQry.DataRequest(XSQL);
 DMFAC.cdsQry.Open;
 xcuenta:=1;
 While not DMFAC.cdsQry.Eof Do
 Begin
   Xsql:= 'UPDATE CXC302 SET CCREG='+IntToStr(xcuenta)+' WHERE '
         +'CIAID='''+xciaid+''' AND '
         +'CCANOMES='''+xccanomes+''' AND '
         +'CCSERIE='''+cxserie+''' AND '
         +'CCNODOC='''+xnfac+''' AND '
         +'DOCID='''+xtipdoc+''' AND '
         +'CUENTAID='''+DMFAC.cdsQry.fieldbyname('CUENTAID').AsString+''' AND '
         +'CCDH='''+DMFAC.cdsQry.fieldbyname('CCDH').AsString+''' AND '
         +'CCMTOORI='''+DMFAC.cdsQry.fieldbyname('CCMTOORI').AsString+''' ';
   Try
       DMFAC.DCOM1.AppServer.EjecutaSQL(Xsql);
   Except
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se pudo actualizar el numero de registro en CXC302');
      Screen.Cursor := crDefault;
      Exit;
   End;

    xcuenta:=xcuenta+1;
   DMFAC.cdsQry.Next;
 End;

end;

procedure TFToolFactSG.sbtnNCreditoClick(Sender: TObject);
Var
   xSQL : String;
begin
// Inicio HPC_201803_FAC
//        Se Incluye Botón para generar Nota de Crédito

   xSQL := ' SELECT * FROM FAC305 '
         + '  WHERE CIAID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('CIAID').AsString)
         + '    AND LOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('LOCID').AsString)
         + '    AND TINID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('TINID').AsString)
         + '    AND ALMID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('ALMID').AsString)
         + '    AND DOCID=' + QuotedStr(GFactura.FMant.cds2.FieldByName('DOCID').AsString)
         + '    AND FACSERIE=' + QuotedStr(GFactura.FMant.cds2.FieldByName('FACSERIE').AsString)
         + '    AND NFAC=' + QuotedStr(GFactura.FMant.cds2.FieldByName('NFAC').AsString);
   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.DataRequest(xSQL);
   DMFAC.cdsFact2.Open;
   If (trim(DMFAC.cdsFact2.FieldbyName('FACESTADO').AsString) <> 'ACEPTADO') Then
   Begin
      ErrorMsg(Caption, 'Sólo se puede Generar Nota de Crédito a Documentos Aceptados, verifique...');
      Exit;
   End;

   xSQL := ' SELECT * FROM CXC301 '
         + '  WHERE CIAID='   + QuotedStr(GFactura.FMant.cds2.FieldByName('CIAID').AsString)
         + '    AND DOCID='   + QuotedStr(GFactura.FMant.cds2.FieldByName('DOCID').AsString)
         + '    AND CCSERIE=' + QuotedStr(GFactura.FMant.cds2.FieldByName('FACSERIE').AsString)
         + '    AND CCNODOC=' + QuotedStr(GFactura.FMant.cds2.FieldByName('NFAC').AsString);
   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.DataRequest(xSQL);
   DMFAC.cdsFact2.Open;
   If (trim(DMFAC.cdsFact2.FieldbyName('FLAGVAR').AsString) = 'XX') Then
   Begin
      ErrorMsg(Caption, 'El Comprobante YA TIENE nota de Crédito, verifique...');
      Exit;
   End;

// Formulario
   try
      FNCredito := TFNCredito.Create(Self);
      FNCredito.ShowModal;
   finally
      FNCredito.Free;
   end;

end;
// Fin HPC_201803_FAC

End.

