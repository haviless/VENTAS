// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : FAC360VE
// FORMULARIO               : FProforma
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Proforma de Ventas
//
// Actualizaciones
// HPC_201309_FAC             Corrige error al levantar formulario
// HPC_201408_FAC             Para la busqueda de CLIENTE se omite la COMPAÑIA
// HPC_201701_FAC 30/06/2017  Adecuaciones para facturación Electrónica
// HPC_201801_FAC 19/03/2018  cambios a la búsqueda del Maestro de Clientes
//                20/03/2018  cambio de método de grabación
// HPC_201805_FAC 20/07/2018  Inicializa descripciones de valores inicializados
//                24/07/2018  Faltaba incluir Monto en Moneda Original en Inserción de Proformas por Servicios
// FAC-201806     29/10/2018  Se corrije orden de campos en where para que tome correctamente los índices
//

Unit FAC360VE;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, wwdbdatetimepicker, Mask, wwdbedit, Wwdbdlg, wwdblook,
   ExtCtrls, Wwdbigrd, Grids, Wwdbgrid, db, DBCtrls, ppDB, ppBands, ppCtrls,
   ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppCache,
   ppDBPipe, GridControl, ppViewr, Mant, ppEndUsr, ppStrtch, ppMemo, ppTypes,
   MsgDlgs, ppParameter;

Type
   TFProforma = Class(TForm)
      pnlCabecera: TPanel;
      pnlCab1: TPanel;
      lblCia: TLabel;
      edtCia: TEdit;
      pnlCab2: TPanel;
      Label10: TLabel;
      pnlDetalle: TPanel;
      dbgDetFac: TwwDBGrid;
      btnActReg: TwwIButton;
      pnlPie: TPanel;
      bbtnCalc: TBitBtn;
      bbtnRegresa: TBitBtn;
      Z2bbtnAcepta: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      pnlCab3: TPanel;
      bbtnborra: TBitBtn;
      dblcTMon: TwwDBLookupCombo;
      Label11: TLabel;
      edtTMon: TEdit;
      dbeTCambio: TwwDBEdit;
      Label12: TLabel;
      Label3: TLabel;
      dtpFPed: TwwDBDateTimePicker;
      meNoPedido: TwwDBEdit;
      lblCanal: TLabel;
      dblcTVta: TwwDBLookupCombo;
      dblcLPrecio: TwwDBLookupCombo;
      edtLPrecio: TEdit;
      lblTipReg: TLabel;
      Z2bbtnImprime: TBitBtn;
      pprProforma: TppReport;
      dbProforma: TppDBPipeline;
      pnlEstado: TPanel;
      Label14: TLabel;
      pnlRegistro: TPanel;
      lblCnpEgr: TLabel;
      lblCuenta: TLabel;
      Label13: TLabel;
      Label7: TLabel;
      Label9: TLabel;
      dblcdArticulo: TwwDBLookupComboDlg;
      bbtnRegOk: TBitBtn;
      bbtnRegCanc: TBitBtn;
      stTitulo: TStaticText;
      dbePrecioG: TwwDBEdit;
      dbeCtdadG: TwwDBEdit;
      dbeImporte: TwwDBEdit;
      dbeArticulo: TwwDBEdit;
      dbeUmg: TwwDBEdit;
      Label16: TLabel;
      dbeDGarantia: TwwDBEdit;
      edtTVta: TEdit;
      dblcLocal: TwwDBLookupCombo;
      Label18: TLabel;
      edtLocal: TEdit;
      Label19: TLabel;
      lblEmb: TLabel;
      cbTipoum: TComboBox;
      dbgStock: TwwDBGrid;
      dblcLentrega: TwwDBLookupCombo;
      edtLentrega: TEdit;
      lblLugar: TLabel;
      dblcCia: TwwDBLookupCombo;
      Label24: TLabel;
      edtProv: TEdit;
      dbeEmbalaje: TwwDBEdit;
      Label20: TLabel;
      dbeCtdadU: TwwDBEdit;
      dblcProv: TwwDBLookupComboDlg;
      lblUMPG: TLabel;
      lblUMPU: TLabel;
      Bevel1: TBevel;
      Label21: TLabel;
      Label27: TLabel;
      lblUMAG: TLabel;
      Label29: TLabel;
      lblUMAU: TLabel;
      dbeCantGA: TwwDBEdit;
      dbeCantUA: TwwDBEdit;
      bvCantAceptada: TBevel;
      Label28: TLabel;
      edtDsto2: TwwDBEdit;
      pnlDatos: TPanel;
      Label30: TLabel;
      edtDireccion: TEdit;
      bbtnClose: TButton;
      edtZona: TEdit;
      Label31: TLabel;
      dblcZona: TwwDBLookupCombo;
      dblcAgencia: TwwDBLookupComboDlg;
      edtAgencia: TEdit;
      lblAgencia: TLabel;
      lblNLugarE: TLabel;
      bbtnBuscaArt: TBitBtn;
      pnlBusqueda: TPanel;
      lblBusca: TLabel;
      dbgBusca: TwwDBGrid;
      bbtnOkBusca: TBitBtn;
      bbtnCancBusca: TBitBtn;
      dbeBusca: TwwDBEdit;
      pnlActuali: TPanel;
      lblActuali: TLabel;
      lblEstado: TLabel;
      lblArea: TLabel;
      dblcTTran: TwwDBLookupCombo;
      lblTransaccion: TLabel;
      edtTransaccion: TEdit;
      Label26: TLabel;
      edtObservacion: TEdit;
      lblGarantia: TLabel;
      dbeGarantia: TwwDBEdit;
      lblFentrega: TLabel;
      dtpFVcmto: TwwDBDateTimePicker;
      lblClieNom: TLabel;
      lblClieRuc: TLabel;
      dblcdClieRuc: TwwDBLookupComboDlg;
      chkadicional: TCheckBox;
      Label6: TLabel;
      dbeCredito: TwwDBEdit;
      lblTelefono: TLabel;
      dbeFono: TwwDBEdit;
      lblVendedor: TLabel;
      dblcVen: TwwDBLookupCombo;
      EdtVen: TEdit;
      lblClie: TLabel;
  //  Inicio HPC_201801_FAC
  //   retiro de componente
  //    dblcdClie: TwwDBLookupComboDlg;
  //  Fin HPC_201801_FAC
      dblcdAso: TwwDBEdit;
      btnExec: TButton;
      Label4: TLabel;
      dblcTInv: TwwDBLookupCombo;
      edtTinv: TEdit;
      pnlDetalleA: TPanel;
      bvlDetalle: TBevel;
      lblNItem: TLabel;
      lblDetServ: TLabel;
      lblUMed: TLabel;
      lblDesc: TLabel;
      lblTotal: TLabel;
      lblImp1: TLabel;
      Label5: TLabel;
      lblVVta: TLabel;
      lblImp2: TLabel;
      Z2bbtnRegOk: TBitBtn;
      Z2bbtnRegCanc: TBitBtn;
      dblcUMed: TwwDBLookupCombo;
      edtUMed: TEdit;
      dbeDscto: TEdit;
      dbeImpIgv: TEdit;
      dbeImporteS: TEdit;
      memDetServ: TMemo;
      dbeItem: TEdit;
      dbePUnit: TEdit;
      edtAdq: TEdit;
      dbeValVen: TEdit;
      dbeImp2: TEdit;
      memDetalle: TwwDBEdit;
      btnMemServ: TBitBtn;
      stxTitulo2: TStaticText;
      Label8: TLabel;
      dblcFPago: TwwDBLookupCombo;
      edtFPago: TEdit;
      dbePorcentaje: TwwDBEdit;
      lblDescuento: TLabel;
      lblTCom: TLabel;
      dblcTipoCompra: TwwDBLookupCombo;
      edtTipoCompra: TEdit;
      pprProf: TppReport;
      ppdbOC: TppDBPipeline;
      ppdbCab: TppDBPipeline;
      Diseno: TppDesigner;
      pnlCab4: TPanel;
      lblObserv: TLabel;
      dbmObs: TDBMemo;
      bbtnok: TBitBtn;
      Panel1: TPanel;
      Label36: TLabel;
      dblcTdoc: TwwDBLookupCombo;
      edtTDoc: TEdit;
      Label1: TLabel;
      dblcTClie: TwwDBLookupCombo;
      EdtTClie: TEdit;
      Label25: TLabel;
      dblcAlmacen: TwwDBLookupCombo;
      edtAlmacen: TEdit;
      dbeCnt: TwwDBEdit;
      edtClie: TwwDBEdit;
      lblCant: TLabel;
      edtDsto1: TwwDBEdit;
      dbeMontoDCTO1: TwwDBEdit;
      dbeMontoDCTO2: TwwDBEdit;
      dbeImporteIGV: TwwDBEdit;
      Label15: TLabel;
      ppParameterList1: TppParameterList;
      ppParameterList2: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppShape1: TppShape;
      ppShape2: TppShape;
      ppShape3: TppShape;
      ppShape4: TppShape;
      ppShape5: TppShape;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText10: TppDBText;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLine1: TppLine;
      ppLine3: TppLine;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLine6: TppLine;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppLabel20: TppLabel;
      ppDBText14: TppDBText;
      ppLabel21: TppLabel;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppLine7: TppLine;
      ppLabel22: TppLabel;
      ppLine8: TppLine;
      ppDBText18: TppDBText;
      ppDBText24: TppDBText;
      ppLabel23: TppLabel;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppLabel24: TppLabel;
      ppDBText27: TppDBText;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppDBText33: TppDBText;
      ppDBMemo1: TppDBMemo;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppShape6: TppShape;
      ppDBText36: TppDBText;
      ppDBText37: TppDBText;
      ppLabel28: TppLabel;
      ppLabel40: TppLabel;
      ppLabel44: TppLabel;
      ppLabel48: TppLabel;
      ppDBText38: TppDBText;
      ppLabel53: TppLabel;
      ppDBMemo4: TppDBMemo;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      ppLine9: TppLine;
      ppLine10: TppLine;
      ppLine11: TppLine;
      ppDBText39: TppDBText;
      ppSystemVariable2: TppSystemVariable;
      ppDBText40: TppDBText;
      ppHeaderBand2: TppHeaderBand;
      ppShape7: TppShape;
      ppShape8: TppShape;
      ppShape9: TppShape;
      ppShape10: TppShape;
      ppShape11: TppShape;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppLabel27: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLine2: TppLine;
      ppLine4: TppLine;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLine5: TppLine;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel49: TppLabel;
      ppDBText15: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppLabel50: TppLabel;
      ppDBText21: TppDBText;
      ppLabel51: TppLabel;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppLine12: TppLine;
      ppLabel52: TppLabel;
      ppLine13: TppLine;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppLabel57: TppLabel;
      ppDBText43: TppDBText;
      ppDBText44: TppDBText;
      ppLabel58: TppLabel;
      ppDBText45: TppDBText;
      ppLabel59: TppLabel;
      ppLabel60: TppLabel;
      ppDBText59: TppDBText;
      ppVariable1: TppVariable;
      ppLabel69: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText46: TppDBText;
      ppDBText47: TppDBText;
      ppDBText48: TppDBText;
      ppDBText49: TppDBText;
      ppDBText50: TppDBText;
      ppDBText51: TppDBText;
      ppDBMemo2: TppDBMemo;
      ppDBText52: TppDBText;
      ppDBText53: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand2: TppSummaryBand;
      ppShape12: TppShape;
      ppDBText54: TppDBText;
      ppDBText55: TppDBText;
      ppLabel61: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppLabel64: TppLabel;
      ppDBText56: TppDBText;
      ppLabel65: TppLabel;
      ppDBMemo3: TppDBMemo;
      ppLabel66: TppLabel;
      ppLabel67: TppLabel;
      ppLabel68: TppLabel;
      ppLine14: TppLine;
      ppLine15: TppLine;
      ppLine16: TppLine;
      ppDBText57: TppDBText;
      ppSystemVariable1: TppSystemVariable;
      ppDBText58: TppDBText;
      ppDBText60: TppDBText;
      Label2: TLabel;
      bbtnCombo: TBitBtn;
      bbtnDcto: TBitBtn;
      lblObsequio: TLabel;
      Label34: TLabel;
      dblcdServicio: TwwDBLookupComboDlg;
      BitBtn1: TBitBtn;
      cbDiseno: TCheckBox;
      Procedure FormShow(Sender: TObject);
      Procedure IniciaForma;
      Procedure EstadoDeForma(xxModo: Integer; xMovEstado, xMovLibera, xxEstado: String);
      Procedure InicializaFooter;
      Procedure FiltraPedido;
      Procedure CalculaFooter;

      Procedure dtpFPedExit(Sender: TObject);
      Procedure dblcVenExit(Sender: TObject);

      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcLocalExit(Sender: TObject);
      Procedure dblcTipoCompraExit(Sender: TObject);
      Procedure dblcTInvExit(Sender: TObject);
      Procedure dblcAlmacenExit(Sender: TObject);
      Procedure dblcTClieExit(Sender: TObject);
      Procedure dblcdAsoExit(Sender: TObject);

   // Inicio HPC_201801_FAC
   // Se retira componente dblcdClie
   //   Procedure dblcdClieExit(Sender: TObject);
   // Fin HPC_201801_FAC

      Procedure dcDireccion;
      Procedure dcAlmacen;
      Procedure dcLPrecio;
      Procedure dblcLentregaExit(Sender: TObject);
      Procedure dblcLPrecioExit(Sender: TObject);
      Procedure dblcFPagoExit(Sender: TObject);
      Procedure dblcTTranExit(Sender: TObject);
      Procedure dblcTVtaExit(Sender: TObject);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);

   // Inicio HPC_201801_FAC
   // Se retira líneas de código por RUC de Cliente
   //   Procedure dblcdClieRucExit(Sender: TObject);
   // Fin HPC_201801_FAC

      Procedure btnExecClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dtpFVcmtoExit(Sender: TObject);
      Procedure dbeGarantiaKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbePorcentajeKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbePorcentajeExit(Sender: TObject);
      Procedure meNoPedidoExit(Sender: TObject);
      Procedure dbeTCambioKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbeCreditoExit(Sender: TObject);
      Procedure dbeFonoExit(Sender: TObject);
      Procedure dblcAgenciaDropDown(Sender: TObject);
      Procedure dblcAgenciaExit(Sender: TObject);
      Procedure dbeEmbalajeExit(Sender: TObject);
      Procedure dbeEmbalajeKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnokClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure btnActRegClick(Sender: TObject);
      Procedure dblcdArticuloDropDown(Sender: TObject);
      Procedure dblcdArticuloExit(Sender: TObject);
      Procedure bbtnBuscaArtClick(Sender: TObject);
      Procedure dbeCtdadGExit(Sender: TObject);
      Procedure dbeCtdadUEnter(Sender: TObject);
      Procedure dbeCtdadUExit(Sender: TObject);
      Procedure dbeCantGAExit(Sender: TObject);
      Procedure dbeCantUAExit(Sender: TObject);
      Procedure dbePrecioGExit(Sender: TObject);
      Procedure edtDsto1Exit(Sender: TObject);
      Procedure edtDsto1KeyPress(Sender: TObject; Var Key: Char);
      Procedure edtDsto2Exit(Sender: TObject);
      Procedure bbtnRegOkClick(Sender: TObject);
      Procedure bbtnRegCancClick(Sender: TObject);
      Procedure cbTipoumExit(Sender: TObject);
      Procedure bbtnCloseClick(Sender: TObject);
      Procedure dblcProvExit(Sender: TObject);
      Procedure btnMemServClick(Sender: TObject);
      Procedure dbePUnitExit(Sender: TObject);
      Procedure Z2bbtnRegOkClick(Sender: TObject);
      Procedure Z2bbtnRegCancExit(Sender: TObject);
      Procedure dbeBuscaExit(Sender: TObject);
      Procedure bbtnOkBuscaClick(Sender: TObject);
      Procedure bbtnCancBuscaClick(Sender: TObject);
      Procedure bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure pprProfPreviewFormCreate(Sender: TObject);
      Procedure meNoPedidoEnter(Sender: TObject);
      Procedure dbgDetFacKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgDetFacDblClick(Sender: TObject);
      Procedure dblcFPagoEnter(Sender: TObject);
      Procedure bbtnCalcClick(Sender: TObject);
      Procedure dbeMontoDCTO2Exit(Sender: TObject);
      Procedure bbtnComboClick(Sender: TObject);
      Procedure bbtnDctoClick(Sender: TObject);
      Procedure dblcdServicioExit(Sender: TObject);
   // Inicio HPC_201801_FAC
   // Se retira dblcdClie
   //   Procedure dblcdClieUserButton1Click(Sender: TObject;
   //      LookupTable: TDataSet);
   // Fin HPC_201801_FAC
      Procedure dblcAlmacenNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure BitBtn1Click(Sender: TObject);
   // Inicio HPC_201805_FAC
   // 06/09/2018 Evalúa que Maestro de Clientes haya sido previamente levantado
      procedure dtpFPedEnter(Sender: TObject);
      procedure dblcLPrecioEnter(Sender: TObject);
      procedure dbmObsExit(Sender: TObject);
      procedure dblcVenEnter(Sender: TObject);
      procedure dtpFVcmtoEnter(Sender: TObject);
      procedure dblcTVtaEnter(Sender: TObject);
      procedure dblcTMonEnter(Sender: TObject);
      procedure dbeTCambioExit(Sender: TObject);
      procedure dbeTCambioEnter(Sender: TObject);
      procedure dblcTTranEnter(Sender: TObject);
      procedure dblcLentregaEnter(Sender: TObject);
      procedure dbeCreditoEnter(Sender: TObject);
   // Fin HPC_201805_FAC
   Private
    { Private declarations }
      cCombo: String;
      cObsequio: String;
      sTipoRQS, xImpTasa: String; // Solo tiene tres valores Requisicion x (C)ompras (S)ervicios (A)ctivos Fijos
      Function Consistencia: Boolean;
      Function ConsistenciaDet: Boolean;
      Procedure InicializaCamposDetalle;
      Procedure AperturaConsultaSaldos(xxFlagE: String);
      Function ExisteArticuloDuplicado(xxArt: String): boolean;
      Procedure ActualizaCabecera;
      Procedure Muestrastock(xxArticulo, xxEstado: String);
      Procedure GeneraCombo;
      Procedure GeneraDescuento;
      Procedure InicializaPorUsuario;
   Public
    { Public declarations }
      wContenido: boolean;
      MtxAsocia: TMant;
      Procedure OnEditAsoCta(Sender: TObject; MantFields: TFields);
      Procedure ppReportProf;
   End;

Var
   FProforma: TFProforma;
   xLPrecio: boolean;
   xRegresa: Boolean;
   xAnoMM: String;
   xDto01: double;
   xCrea: Boolean;
   xFCia: boolean;
   xFLocal: boolean;
   xFDireccion: boolean;
   xFAlmacen: boolean;
   xFLPrecio: boolean;
   xxArticulo: String;
   xxArtDEs: String;
   xClaux: String;
   xIgv, xIsc: Boolean;
   xTasaIgv: double;
   xCIgv, xCIsc: String; //Campos de flag de Igv e Isc
   xFlagInsert: boolean;
   wFlagCV: boolean; //Flag de Cond. Venta
   wFlagCVDes: String; // Flag para almacenar el codigo de Situacion de Cliente
   wFlagPA: boolean; //Flag de Pago Adelantado
   wFlagLC: boolean; //Flag de Linea Credito
   wFlagFP: boolean; //Flag de Forma de Pago
   wPolitica1: boolean; //Flag para Politica de Descuentos
   wPolitica2: boolean; //Flag para Descuentos de Formas de Pago
   wDescAdi: double; //Descuento Adicional
   wFlagEdi: String; // Flag de Edicion para modificar reserva
   wStockG: double; //Campo para grabar stock;
   wbInicio: boolean;
   xxxUMG, xxxUMU: String;
   xxxPVG, xxxPVU: double;
   wInserta: boolean;
   xTMonLCred: String; // Tipo de Moneda de Linea de Crédito TMONID del TGE204
   xxReservaAnt: double; //Reserva Anterior
   wAno: word;
   wFlagCHD: boolean;
   wSCEF, wSCEFO: String; //Codigo de ContraEntrega Efectivo
   wSCECH, wSCECHO: String; //Codigo de ContraentregaCheque
   wSF15, wSF30: String; //Condicion factura 15,30 dias;
   xxMtoCCteMN, xxMtoCCteME: double; // Monto soles y dolares de la Cta Cte
   xxMtoPedMN, xxMtoPedME: double; // Monto Pedido en soles y dolares
   xxMtoUtiMN, xxMtoUtiME: double; // Monto Utilizado en soles y dolares (CtaCte - Pedido)
   SQLFiltro, wSQL, FlagFecDoc: String;
   xFec_Sis, xFec_Doc: String;
// Inicio HPC_201701_FAC
// Se cambia propiedad de variable xTipCli para que sea global para todo Ventas
//   xCia, xLoc, xTVt, xTin, xAlm, xLPr, xTCli, xTDoc, xCPag, xTri, xTMo, xTipCli: String;
   xCia, xLoc, xTVt, xTin, xAlm, xLPr, xTCli, xTDoc, xCPag, xTri, xTMo: String;
// Fin HPC_201701_FAC
   fDctoP: Boolean;

Implementation

Uses FACDM, oaVe2000, Fac771, FAC394, FAC371, FAC368;

{$R *.dfm}

Procedure TFProforma.FormShow(Sender: TObject);
Var
   xWhere, xSQL, xDir, xFono, xSectorCom, xZona, sZona, sZona1, xCondPago: String;
   xFiltro: String;
   xTotProf: Double;
Begin
   DMFAC.AccesosUsuarios(DMFAC.wModulo, DMFAC.wUsuario, '2', 'SolMantenimiento');
   pnlRegistro.Visible := False;
   pnlDetalleA.Visible := False;

   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));

   xWhere := 'SELECT ' + DMFAC.wRepFuncChar + DMFAC.wRepFecServi + ', ' + QuotedStr('DD/MM/YYYY') + ') "FECHA" FROM TGE901';
   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xWhere);
   DMFAC.cdsReporte.Open;
   xFec_Sis := DMFAC.cdsReporte.FieldByName('FECHA').AsString;

   xImpTasa := DMFAC.BuscaQry('dspUltTGE', 'TGE108', 'TASACAN', 'TASAFLG=''I''', 'TASACAN');
   wbInicio := False;
   xCrea := True;
   xFlagInsert := False;

   DMFAC.cdsAlmacen.Filtered := False;
   DMFAC.cdsAlmacen.Filter := 'FLAGVAR=' + '''' + 'S' + ''''; //ALMACEN DE VENTAS
   DMFAC.cdsAlmacen.Filtered := True;

//   DMFAC.cdsTVta.close;
//   DMFAC.cdsTVta.open;

   DMFAC.cdsEmpresa.Close;
   DMFAC.cdsEmpresa.open;

   DMFAC.cdsTTran.IndexFieldNames := 'TRIID';

// Si El Password es del Administrador
{
   If DMFAC.wAdmin = 'G' Then
   Begin
      DMFAC.wModo := 'C';
   End;
}

   If DMFAC.wModo = 'A' Then
   Begin
      DMFAC.cdsProforma.Last;
      xCia := DMFAC.cdsProforma.FieldByName('CIAID').AsString;
   // Inicio HPC_201801_FAC
   // cambio para inicialización de variables tomada de las Proformas
      {
      xLoc := DMFAC.cdsProforma.FieldByName('LOCID').AsString;
      xTin := DMFAC.cdsProforma.FieldByName('TINID').AsString;
      xTMo := DMFAC.wTMonLoc;
      xAlm := DMFAC.cdsProforma.FieldByName('ALMID').AsString;
      xLPr := DMFAC.cdsProforma.FieldByName('TLISTAID').AsString;
      xTVt := DMFAC.cdsProforma.FieldByName('TIPOADQ').AsString;
      xTCli := DMFAC.cdsProforma.FieldByName('PROFTCLI').AsString;
      xCPag := DMFAC.cdsProforma.FieldByName('FPAGOID').AsString;
      xTri := DMFAC.cdsProforma.FieldByName('TRIID').AsString;
      }
      xSQL := 'Select USERID, CIAID, LOCID, TIPOADQ, TINID, ALMID, DOCID, FACSERIE, FPAGOID, TLISTAID, TMONID, '
         + '          VEID, TER_ID, TIE_ID, PVTA_ID '
         + '     from FAC206 '
         + '    Where USERID='+quotedstr(DMFAC.wUsuario);
      DMFAC.cdsQry3.Close;
      DMFAC.cdsQry3.DataRequest(xSQL);
      DMFAC.cdsQry3.Open;

      If DMFAC.cdsQry3.RecordCount > 0 Then
      Begin
         If xCia<>DMFAC.cdsQry3.FieldByName('CIAID').AsString Then
         Begin
            xCia := DMFAC.cdsQry3.FieldByName('CIAID').AsString;
            xLoc := DMFAC.cdsQry3.FieldByName('LOCID').AsString;
            xTin := DMFAC.cdsQry3.FieldByName('TINID').AsString;
            xTMo := DMFAC.cdsQry3.FieldByName('TMONID').AsString;
            xAlm := DMFAC.cdsQry3.FieldByName('ALMID').AsString;
            xLPr := DMFAC.cdsQry3.FieldByName('TLISTAID').AsString;
            xTVt := DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString;
            xTCli := '01';
            xCPag := DMFAC.cdsQry3.FieldByName('FPAGOID').AsString;
            xTri := '04';
         End
         Else
         Begin
            xLoc := DMFAC.cdsProforma.FieldByName('LOCID').AsString;
            xTin := DMFAC.cdsProforma.FieldByName('TINID').AsString;
            xTMo := DMFAC.wTMonLoc;
            xAlm := DMFAC.cdsProforma.FieldByName('ALMID').AsString;
            xLPr := DMFAC.cdsProforma.FieldByName('TLISTAID').AsString;
            xTVt := DMFAC.cdsProforma.FieldByName('TIPOADQ').AsString;
            xTCli := DMFAC.cdsProforma.FieldByName('PROFTCLI').AsString;
            xCPag := DMFAC.cdsProforma.FieldByName('FPAGOID').AsString;
            xTri := DMFAC.cdsProforma.FieldByName('TRIID').AsString;
         End;
      End;
   // Fin HPC_201801_FAC
      IniciaForma;

   // Inicio HPC_201805_FAC
   // 20/07/2018 Inicializa descripciones de valores inicializados
   // Descripción de Compañía
      If length(xCia)>0 then
         edtCia.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE101', 'CIADES', 'CIAID=' + QuotedStr(dblcCia.Text), 'CIADES');
   // Descripción de Localidad
      If length(xLoc)>0 then
         edtLocal.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE126', 'LOCDES', 'CIAID=' + Quotedstr(dblcCia.text) + 'and LOCID=' + QuotedStr(dblcLocal.Text), 'LOCDES');

   // Descripción de Tipo de Venta
      If length(xTVt)>0 then
         edtTipoCompra.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE173', 'TIPADQDES', 'TIPOADQ=' + quotedStr(dblcTipoCompra.text), 'TIPADQDES');

   // Descripción de Tipo de Inventario
      If length(xTin)>0 then
         edtTinv.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE152', 'TINDES', 'TINID=' + QuotedStr(dblcTInv.Text) + 'AND CIAID=' + Quotedstr(dblcCia.text), 'TINDES');

   // Descripción de Punto de Venta(Almacén)
      If length(xAlm)>0 then
         edtAlmacen.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE151', 'ALMDES', 'CIAID=' + QuotedStr(dblcCia.text) + ' AND ALMID=' + QuotedStr(dblcAlmacen.Text), 'ALMDES');

   // Descripción de Condición de Pago
      If length(xCPag)>0 then
      Begin
         If wFil_Asoc = 'N' Then
            xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND CCOMERID=' + QuotedStr(dblcFPago.Text) + ' AND SCOMERID=' + QuotedStr(DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString)
         Else
            xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND CCOMERID=' + QuotedStr(dblcFPago.Text);
         edtFPago.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE180', '*', xWhere, 'DCCOMDES');
      End;

   // Descripción de Lista de Precios
      If length(xLPr)>0 then
      Begin
         xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' and TLISTAID = ' + QuotedStr(dblcLPrecio.Text);
         edtLPrecio.Text := DMFAC.BuscaQry('dspTLista', 'FAC101', 'TLISTADES,TLISTAFLAG', xWhere, 'TLISTADES');
      End;

   // Descripción de Tipo de Moneda
      If length(xTMo)>0 then
      Begin
         xWhere := 'TMONID=' + '''' + dblcTMon.Text + ''' '
            + 'AND (TMON_LOC=' + '''' + 'L' + '''' + ' OR TMON_LOC=' + '''' + 'E' + '''' + ')';
         edtTMon.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
      End;

   // Descripción de Tipo de Trasacción de Almacén
      If length(xTri)>0 then
      Begin
         DMFAC.cdsTTran.Setkey;
         DMFAC.cdsTTran.FieldByName('TRIID').AsString := dblcTTran.Text;
         If DMFAC.cdsTTran.GotoKey Then
         Begin
            edtTransaccion.Text := DMFAC.cdsTTran.FieldByName('TRIDES').AsString;
            DMFAC.cdsProforma.Edit;
            DMFAC.cdsProforma.FieldByName('PROFGENFACT').AsString := DMFAC.cdsTTran.FieldByName('TRIGENFACT').AsString;
         End;
      End;

   // Descripción de Tipo de Cliente (Cliente/Asociado)
      If length(xTCli)>0 then
      Begin
         xWhere := 'TCLIEID=' + '''' + dblcTClie.Text + '''';
         edtTClie.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEDES, TCLIEFLAG', xWhere, 'TCLIEDES');
      End;

   // Fin HPC_201805_FAC

      DMFAC.cdsProforma.Insert;
      DMFAC.cdsProforma.FieldByName('CIAID').AsString := xCia;
      DMFAC.cdsProforma.FieldByName('LOCID').AsString := xLoc;
      DMFAC.cdsProforma.FieldByName('TIPOADQ').AsString := xTVt;
      DMFAC.cdsProforma.FieldByName('TINID').AsString := xTin;
      DMFAC.cdsProforma.FieldByName('TMONID').AsString := xTMo;
      DMFAC.cdsProforma.FieldByName('ALMID').AsString := xAlm;
      DMFAC.cdsProforma.FieldByName('TLISTAID').AsString := xLPr;
      DMFAC.cdsProforma.FieldByName('PROFTCLI').AsString := xTCli;
      DMFAC.cdsProforma.FieldByName('FPAGOID').AsString := xCPag;
      dtpFPed.Date := DMFAC.DateS;
      DMFAC.cdsProforma.FieldByName('TRIID').AsString := xTri;
      DMFAC.cdsProforma.FieldByName('FACOBS').Clear;

      EstadoDeForma(0, ' ', ' ', DMFAC.cdsProforma.FieldByName('PROFESTADO').AsString);
      Inicializafooter;
   End
   Else
   Begin
      If DMFAC.wModo = 'M' Then
      Begin
         xCia := DMFAC.cdsProforma.FieldByName('CIAID').AsString;
         dtpFPed.Date := strtodate(datetostr(DMFAC.cdsProforma.FieldByName('PROFFECHA').AsDateTime));

         dbmObs.Text := DMFAC.cdsProforma.FieldByName('FACOBS').AsString;

      // Inicio HPC_201801_FAC
      // Cambios por Búsqueda en Maestro de Clientes
         //DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEFLAG', 'TCLIEID=' + '''' + dblcTClie.Text + '''', 'TCLIEFLAG');
      // Inicio HPC_201701_FAC
      // Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
         //DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;
         DMFAC.xTipCli := 'S';
      // Fin HPC_201701_FAC
      // Fin HPC_201801_FAC

         meNoPedido.Enabled := False;
         DMFAC.cdsProforma.Edit;
         pnlDatos.Visible := False;
         pnlBusqueda.Visible := False;

      // Inicio HPC_201701_FAC
      // Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
         If DMFAC.xTipCli = 'N' Then // Si es Asociado
      // Fin HPC_201701_FAC
         Begin
         // Inicio HPC_201801_FAC
         // Se retira componente dblcdClie
         //   dblcdClie.Visible := False;
         // Fin HPC_201801_FAC
            dblcdClieRuc.Enabled := False;
            dblcdAso.Visible := True;
            btnExec.Visible := True;
            dblcLentrega.Enabled := False;
         End
         Else
         Begin
         // Inicio HPC_201701_FAC
         // Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
            If DMFAC.xTipCli = 'S' Then // Si es Cliente Regular
         // Fin HPC_201701_FAC
            Begin
               If DMFAC.cdsClie.Active = False Then
               Begin
                  xFiltro := 'SELECT CLIEID, CLIEDES, CLIERUC, CLAUXID, TMONID, CLIECREMAX, CLIECREDISP, CLIECREUTI,'
                     + '       ZONVTAID, VEID, SITCLIEID, DESCLIEID, CLIEDIR, CLIETELF, TIPPERID, CLIECOND, CLIEDNI, '
                     + '       CLIEEMAI, CLIEABR, ACTIVO, CLIENOMBRE, CLIENOMBRE1, CLIEAPEPAT, CLIEAPEMAT, CLIEDIRLEG, '
                     + '       PAISID, DPTOID, CIUDID, CLIECZIP, CIAID, USERID, FREG, HREG, CLIEFAX, TVTAID, TDOC_ID_SUNAT '
                     + '  FROM TGE204 ';
                  DMFAC.cdsClie.Close;
                  DMFAC.cdsClie.DataRequest(xFiltro);
                  DMFAC.cdsClie.Open;
               End;

               dblcdClieRuc.Enabled := False;

               If wFil_Asoc = 'N' Then
                  dblcLentrega.Enabled := True;
            // Inicio HPC_201801_FAC
            // Se retira componente dblcdClie
            //   dblcdClie.Visible := True;
            //   dblcdAso.Visible := False;
            //   btnExec.Visible := False;
            //   dtpFVcmto.date := DMFAC.cdsProforma.FieldByName('PROFFECENT').AsDateTime;

               edtCia.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE101', 'CIADES', 'CIAID =' + QuotedStr(dblcCia.Text), 'CIADES');

               dblcTClie.Text := DMFAC.cdsProforma.FieldByName('PROFTCLI').AsString;
               dblcTClieExit(Self);
               dblcdAso.Text := DMFAC.cdsProforma.FieldByName('CLIEID').AsString;
            // Se retira componente dblcdClie, se deja componente dblcdAso
            //   xWhere := 'CLIEID=' + QuotedStr(dblcdClie.Text);
               xWhere := 'CLAUXID='+quotedstr(DMFAC.cdsProforma.FieldByName('CLAUXID').AsString)+ ' and CLIEID=' + QuotedStr(dblcdAso.Text);
               edtClie.text := DMFAC.BuscaQry('dspUltTGE', 'TGE204', 'NUMDOCID,ZONVTAID,CLIEDES,CLAUXID,CLIEDIR,CLIETELF,DESCLIEID,CLIECOND', xWhere, 'CLIEDES');
               dblcdClieRuc.Text := DMFAC.cdsQry.FieldByName('NUMDOCID').AsString;
            // Fin HPC_201801_FAC
               xClaux := DMFAC.cdsQry.FieldByName('CLAUXID').AsString;
               xFono := DMFAC.cdsQry.FieldByName('CLIETELF').AsString;
               xDir := DMFAC.cdsQry.FieldByName('CLIEDIR').AsString;
               xZona := DMFAC.cdsQry.FieldByName('ZONVTAID').AsString;
               xCondPago := DMFAC.cdsQry.FieldByName('CLIECOND').AsString;

            // Inicio HPC_201801_FAC
            // Se retira componente dblcdClie, se deja componente dblcdAso
            //   xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND CLIEID=' + QuotedStr(dblcdClie.Text);
               xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND CLIEID=' + QuotedStr(dblcdAso.Text);
            // Fin HPC_201801_FAC
               Filtracds(DMFAC.cdsDireccion, 'SELECT * FROM FAC110 WHERE ' + xWhere + ' ORDER BY CLIEDIRID'); //Lugar de entrega 08/03
               lblNLugarE.Caption := FloatToStr(DMFAC.cdsDireccion.RecordCount);
               DMFAC.cdsDireccion.IndexFieldNames := 'CIAID; CLIEID; CLIEDIRID';

               If (DMFAC.BuscaQry('dspUltTGE', 'FAC115', ' DESCLIEPL1,DESCLIEPL2,DESCLIEPOR ', 'DESCLIEID=' + QuotedStr(DMFAC.cdsQry.FieldByName('DESCLIEID').AsString), 'DESCLIEPL1') = 'S') Then
                  wPolitica1 := True; //Para Politica de Descuentos

               If (DMFAC.cdsQry.FieldByName('DESCLIEPL2').AsString = 'S') Then
                  wPolitica2 := True; //Para Descuentos de Forma de Pago

               wDescAdi := DMFAC.cdsQry.FieldByName('DESCLIEPOR').AsFloat; //Descuento Adicional
               xSectorCom := DMFAC.BuscaQry('dspUltTGE', 'FAC106', 'TVTAID', 'ZVTAID=' + QuotedStr(xZona), 'TVTAID');
               xWhere := ' CIAID=' + QuotedStr(dblcCia.text) + ' AND ( SCOMERID = ' + QuotedStr(xSectorCom) +
                  ') AND (' + DMFAC.wReplacCeros + '(DCCOMFLAG,'''') <>' + QuotedStr('A') + ')';

               Filtracds(DMFAC.cdsDscto, 'SELECT CCOMERID, DCCOMDES FROM TGE180 WHERE ' + xwhere + ' ORDER BY CCOMERID');

               dbeFono.Text := xFono;
               edtdireccion.Text := xDir;
               sZona := DMFAC.BuscaQry('dspUltTGE', 'FAC106', 'TVTAID', 'ZVTAID=' + QuotedStr(xZona), 'TVTAID');
               sZona1 := DMFAC.BuscaQry('dspUltTGE', 'FAC105', 'TVTAFLAG', 'TVTAID=' + QuotedStr(sZona), 'TVTAFLAG');
               dbeEmbalaje.Visible := (sZona1 = 'P');
               lblEmb.Visible := (sZona1 = 'P');
               dblcAgencia.Visible := (sZona1 = 'P');
               edtAgencia.Visible := (sZona1 = 'P');
               lblAgencia.Visible := (sZona1 = 'P');

            // Inicio HPC_201801_FAC
            // Se retira componente dblcdClie, se deja componente dblcdAso
            //   xSQL := 'CLIEID = ' + QuotedStr(dblcdClie.Text)
            //      + ' AND CLIEDIRID = ' + QuotedStr(dblcLEntrega.Text);
               xSQL := 'CLIEID = ' + QuotedStr(dblcdAso.Text) + ' AND CLIEDIRID = ' + QuotedStr(dblcLEntrega.Text);
            // Fin HPC_201801_FAC
               edtLentrega.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC110', 'CLIEDIRENT', xSQL, 'CLIEDIRENT');
               xWhere := 'VEID =' + QuotedStr(dblcVen.Text);
               edtVen.Text := DMFAC.BuscaQry('dspUltTGE', 'CXC203', 'VEID, VENOMBRES, VEFLAG', xWhere, 'VENOMBRES');
               xWhere := 'LOCID =' + QuotedStr(dblcLocal.Text);
               edtLocal.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE126', 'LOCDES', xWhere, 'LOCDES');
               xWhere := 'CVTAID =' + QuotedStr(dblcTVta.Text);
               edtTVta.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC112', 'CVTADES', xWhere, 'CVTADES');

               xWhere := 'CCOMERID =' + QuotedStr(dblcFPago.Text) + ' AND SCOMERID=' + QuotedStr(DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString);
               edtFPago.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE180', 'DCCOMDES, DCCOMPORC', xWhere, 'DCCOMDES');
               xDto01 := DMFAC.cdsQry.FieldByName('DCCOMPORC').AsFloat;
               dbePorcentaje.Text := FloatToStr(xDto01);

               //xDto01 := DMFAC.cdsQry.FieldByName('DCCOMPORC').AsFloat;
               edtAgencia.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC104', 'EMPNOMBRES', 'EMPID=' + QuotedStr(dblcAgencia.Text), 'EMPNOMBRES');
            // Inicio HPC_201801_FAC
            // Se incluye compañía a búsqueda a Lista de Precios
            //   xWhere := 'TLISTAID = ' + QuotedStr(dblcLPrecio.Text);
               xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' and TLISTAID = ' + QuotedStr(dblcLPrecio.Text);
               edtLPrecio.Text := DMFAC.BuscaQry('dspTLista', 'FAC101', 'TLISTADES', xWhere, 'TLISTADES');
            // Fin HPC_201801_FAC
               If length(edtLPrecio.Text) > 0 Then
                  xLPrecio := True;
               xWhere := 'TMONID=' + QuotedStr(dblcTMon.Text) + ' and (TMON_LOC=' + '''' + 'L' + '''' + ' or TMon_Loc=' + '''' + 'E' + '''' + ')';
               edtTMon.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
            // Inicio HPC_201801_FAC
            // Se incluye compañía a búsqueda de Almacén o Punto de Venta
            //   xWhere := 'ALMID=' + QuotedStr(dblcAlmacen.Text);
               xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' and ALMID=' + QuotedStr(dblcAlmacen.Text);
               edtAlmacen.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE151', 'ALMDES', xWhere, 'ALMDES');
            // Fin HPC_201801_FAC

               DMFAC.cdsTTran.Setkey;
               DMFAC.cdsTTran.FieldByName('TRIID').AsString := dblcTTran.Text;
               If DMFAC.cdsTTran.GotoKey Then
               Begin
                  edtTransaccion.Text := DMFAC.cdsTTran.FieldByName('TRIDES').AsString;
                  DMFAC.cdsProforma.Edit;
               End;

               If (DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString = DMFAC.BuscaQry('dspUltTGE', 'FAC105', 'TVTAID', 'TVTAFLAG=''P''', 'TVTAID')) And (DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString <> '') Then
               Begin //Provincia
                  lblEmb.Visible := True;
                  dbeEmbalaje.Visible := True;
                  lblAgencia.Visible := True;
                  dblcAgencia.Visible := True;
                  edtAgencia.Visible := True;
               End;

               dblcLentrega.Enabled := True;
            End; // Fin de si es Cliente Regular
         End;
         If DMFAC.cdsProforma.FieldByName('PROFSIT').AsString = 'INICIAL' Then
            EstadoDeForma(0, DMFAC.cdsProforma.FieldByName('PROFSIT').AsString, ' ', DMFAC.cdsProforma.FieldByName('PROFESTADO').AsString)
         Else
            EstadoDeForma(1, DMFAC.cdsProforma.FieldByName('PROFSIT').AsString, DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString,
               DMFAC.cdsProforma.FieldByName('PROFESTADO').AsString);

         FiltraPedido;

         xFiltro := 'CIAID=' + QuotedStr(dblcCia.Text) + ' ' +
            'AND CLIEID=' + QuotedStr(DMFAC.cdsProforma.FieldByName('CLIEID').AsString) + ' ' +
            'AND PROFID=' + QuotedStr(menoPedido.Text) + ' ' +
            'ORDER BY DPROFITEM';
         DMFAC.cdsDetProf.Close;
         DMFAC.cdsDetProf.DataRequest('SELECT * FROM FAC312 WHERE ' + xFiltro);
         DMFAC.cdsDetProf.Open;

         dbgDetFac.Selected.Clear;
         dbgDetFac.Selected.Add('DPROFITEM'#9'3'#9'Item');
         dbgDetFac.Selected.Add('ARTID'#9'8'#9'Artículo');
         dbgDetFac.Selected.Add('ARTDES'#9'30'#9'Descripción');
         dbgDetFac.Selected.Add('CODCOM'#9'8'#9'Combo');
         dbgDetFac.Selected.Add('UNMIDO'#9'3'#9'U/M');
         dbgDetFac.Selected.Add('DPROFCANTP'#9'06'#9'Cant.~Pedida');
         dbgDetFac.Selected.Add('ALMID'#9'03'#9'Alm.');
         dbgDetFac.Selected.Add('DPROFPREUMO'#9'09'#9'Precio~Unit');
         dbgDetFac.Selected.Add('DPROFDCTOMO'#9'08'#9'Monto~Dscto1');
         dbgDetFac.Selected.Add('DPROFDTOMO2'#9'08'#9'Monto~Dscto2');
         dbgDetFac.Selected.Add('DPROFMTOMO'#9'10'#9'Monto~Original');
         dbgDetFac.ApplySelected;

         TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO')).DisplayFormat := '########0.00';
         TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO')).EditFormat := '########0.00';

         TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO')).DisplayFormat := '########0.00';
         TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO')).EditFormat := '########0.00';

         TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2')).DisplayFormat := '########0.00';
         TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2')).EditFormat := '########0.00';

         TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO')).DisplayFormat := '########0.00';
         TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO')).EditFormat := '########0.00';

         dblcTTran.OnExit(dblcTTran);
         Calculafooter;

      // verifica Totales de La Proforma
         xTotProf := 0;
         DMFAC.cdsDetProf.DisableControls;
         DMFAC.cdsDetProf.First;
         While Not DMFAC.cdsDetProf.eof Do
         Begin
            xTotProf := xTotProf + DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat + DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat;
            DMFAC.cdsDetProf.Next;
         End;
         DMFAC.cdsDetProf.EnableControls;

         If (DMFAC.cdsProforma.FieldByName('PROFTOTMO').AsFloat - xTotProf > 0.01) Or
            (DMFAC.cdsProforma.FieldByName('PROFTOTMO').AsFloat - xTotProf < -0.01) Then
         Begin
            ActualizaCabecera;
            DMFAC.cdsProforma.Edit;
         End;

      // Inicio HPC_201801_FAC
      // Desactiva Flag de Creación en Edición
//         xCrea := False;
      // Fin HPC_201801_FAC
      End; // Fin de modo de Edicion
   End;

// Inicio HPC_201801_FAC
// Sólo desactivar Flag de Creación en Edición
//   xCrea := False;
// Fin HPC_201801_FAC

   dblcCIA.OnExit(dblcCIA);
   dblcLocal.OnExit(dblcLocal);
   dblcTipoCompra.OnExit(dblcTipoCompra);
   dblcTInv.OnExit(dblcTInv);
   dblcAlmacen.OnExit(dblcAlmacen);
   dblcTClie.OnExit(dblcTClie);
   dblcFPago.OnExit(dblcFPago);
   dblcLPrecio.OnExit(dblcLPrecio);

   dblcTTran.OnExit(dblcTTran);

// Inicio HPC_201801_FAC
// Se retira este código por estar repetido líneas arriba
{
   If DMFAC.wModo = 'M' Then
   Begin
      dblcTClie.OnExit(dblcTClie);
   // Inicio HPC_201701_FAC
   // Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
   // Fin HPC_201701_FAC

      If DMFAC.xTipCli = 'N' Then
         dblcdAsoExit(Sender);
      Else
         dblcdClie.OnExit(dblcdClie);

      dblcVen.OnExit(dblcVen);
      dblcTVta.OnExit(dblcTVta);

      dtpFPed.OnExit(sender);
      DMFAC.cdsProforma.Edit;
   End;
}
// Fin HPC_201801_FAC

   If DMFAC.wModo = 'A' Then
   Begin
      InicializaPorUsuario;

      meNoPedido.Enabled := True;
      dblcLPrecio.Enabled := True;
      dblcTMon.Enabled := True;
   // Inicio HPC_201801_FAC
   // Se retira Foco debido a que se deshabilita Tipo de Cliente
      {
   // Inicio HPC_201701_FAC
   // Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
      If DMFAC.xTipCli = 'N' Then
        // dblcdAso.SetFocus
         dblcTClie.SetFocus
      Else
         //dblcdClie.SetFocus;
         dblcTClie.SetFocus;
   // Fin HPC_201701_FAC
      }
   // Fin HPC_201801_FAC

      dblcVen.Enabled := True;
   End;

   If DMFAC.cdsDetProf.RecordCount > 0 Then
   Begin
      dblcLPrecio.Enabled := False;
      dblcTMon.Enabled := False;
   End;

// Inicio HPC_201801_FAC
// se evalua que panel de cabecera y combo de compañía esten habilitados
//   If (pnlCab1.Enabled) And (length(trim(dblcCia.Text)) = 0) Then
   If (pnlCab1.Enabled) and (dblcCia.Enabled) Then
   Begin
      xCrea := True;
      dblcCia.SetFocus;
      xCrea := False;
   End;
//   TNumericField(DMFAC.cdsProforma.FieldByName('PROFTCAM')).DisplayFormat := '###,##0.0000';
// Fin HPC_201801_FAC
End;

Procedure TFProforma.InicializaPorUsuario;
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
   //Compañia
      If DMFAC.cdsProforma.FieldByName('CIAID').AsString = '' Then
      Begin
         DMFAC.cdsProforma.FieldByName('CIAID').AsString := DMFAC.cdsQry3.FieldByName('CIAID').AsString;
         dblcCia.OnExit(dblcCia);
      End;

   // Localidad
      If DMFAC.cdsProforma.FieldByName('LOCID').AsString = '' Then
      Begin
         DMFAC.cdsProforma.FieldByName('LOCID').AsString := DMFAC.cdsQry3.FieldByName('LOCID').AsString;
         dblcLocal.OnExit(dblcLocal);
      End;

   // Tipo de Venta
      If DMFAC.cdsProforma.FieldByName('TIPOADQ').AsString = '' Then
      Begin
         DMFAC.cdsProforma.FieldByName('TIPOADQ').AsString := DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString;
         dblcTipoCompra.OnExit(dblcTipoCompra);
      End;

      If DMFAC.cdsProforma.FieldByName('TIPOADQ').AsString = 'C' Then
      Begin
      // Tipo de Inventario
         If DMFAC.cdsProforma.FieldByName('TINID').AsString = '' Then
         Begin
            DMFAC.cdsProforma.FieldByName('TINID').AsString := DMFAC.cdsQry3.FieldByName('TINID').AsString;
            dblcTInv.OnExit(dblcTInv);
         End;

      // Almacén
         If DMFAC.cdsProforma.FieldByName('ALMID').AsString = '' Then
         Begin
            DMFAC.cdsProforma.FieldByName('ALMID').AsString := DMFAC.cdsQry3.FieldByName('ALMID').AsString;
            dblcAlmacen.OnExit(dblcAlmacen);
         End;
      End;

      If DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString = 'S' Then
      Begin
     // Tipo de Inventario
         DMFAC.cdsProforma.FieldByName('TINID').AsString := '00';
         dblcTInv.OnExit(dblcTInv);
      // Almacén
         DMFAC.cdsProforma.FieldByName('ALMID').AsString := '00';
         dblcAlmacen.OnExit(dblcAlmacen);
      End;

      If dblcCia.Text <> '04' Then
      Begin
         If DMFAC.cdsQry3.FieldByName('FPAGOID').AsString <> '' Then
         Begin
            DMFAC.cdsProforma.FieldByName('FPAGOID').AsString := DMFAC.cdsQry3.FieldByName('FPAGOID').AsString;
            dblcFPago.OnExit(dblcFPago);
         End;
      End;

      If DMFAC.cdsProforma.FieldByName('TMONID').AsString <> '' Then
      Begin
         DMFAC.cdsProforma.FieldByName('TMONID').AsString := DMFAC.cdsQry3.FieldByName('TMONID').AsString;
         dblcTMon.OnExit(dblcTMon);
      End;

      If DMFAC.cdsProforma.FieldByName('TLISTAID').AsString <> '' Then
      Begin
         DMFAC.cdsProforma.FieldByName('TLISTAID').AsString := DMFAC.cdsQry3.FieldByName('TLISTAID').AsString;
         dblcLPrecio.OnExit(dblcLPrecio);
      End;

      If DMFAC.cdsProforma.FieldByName('VEID').AsString = '' Then
      Begin
         DMFAC.cdsProforma.FieldByName('VEID').AsString := DMFAC.cdsQry3.FieldByName('VEID').AsString;
         EdtVen.Text := DMFAC.BuscaQry('dspUltTGE', 'CXC203', 'VENOMBRES', 'CIAID=' + QuotedStr(dblcCia.Text) + ' AND VEID=' + QuotedStr(dblcVen.Text), 'VENOMBRES');
      End;

   Except

   End;
End;

Procedure TFProforma.dtpFPedExit(Sender: TObject);
Var
   xWhere, xMes: String;
   wMes, wDia: Word;
   xTcambio: double;
Begin
   If xCrea Then Exit;

// Inicio HPC_201801_FAC
// Inicializa Fecha de Entrega en base a Fecha de emisión
//   If dtpFVcmto.Date = 0 Then
//      dtpFVcmto.Date := dtpFPed.Date;
   If DMFAC.cdsProforma.FieldByName('PROFFECENT').AsDateTime=0 Then
   Begin
      If DMFAC.cdsProforma.State=dsBrowse Then
         DMFAC.cdsProforma.Edit;
      DMFAC.cdsProforma.FieldByName('PROFFECENT').AsDateTime := dtpFPed.Date;
   End;
// Fin HPC_201801_FAC

   If dtpFPed.Date > dtpFVcmto.Date Then
   Begin
      Raise exception.Create('Error: F.Entrega debe ser mayor/igual' + #13 + ' a la Fecha de Emisión');
   End;

   If Not (bbtnBorra.Focused) And Not (dblcVen.Focused) Then
   Begin
      If dtpFPed.Date = 0 Then
      Begin
         dtpFPed.SetFocus;
         dtpFPed.Date := dtpFVcmto.Date;
         Raise exception.create('Falta Fecha de Proforma');
      End;
   End;

   FlagFecDoc := DMFAC.Control_Fecha(StrToDate(xFec_Sis), dtpFPed.Date);
   If FlagFecDoc = 'ANT' Then
   Begin
      ErrorMsg(Caption, 'No Puede Registrar el Documento a la Fecha');
   End;

   If FlagFecDoc = 'DES' Then
   Begin
      ErrorMsg(Caption, 'No Puede Registrar el Documento Posterior a la Fecha del Sistema');
   End;

   xWhere := '';
   xWhere := 'TMONID=' + QuotedStr(DMFAC.wTMonExt)
      + ' AND FECHA = ' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpFPed.Date) + '''' + ')';
   If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xWhere, 'TMONID')) > 0 Then
      xTCambio := DMFAC.cdsQry.FieldByName('TCAMVBV').AsFloat
   Else
   Begin
      dtpFPed.SetFocus;
      ShowMessage('Fecha No tiene Tipo de Cambio');
      exit;
   End;

   DecodeDate(dtpFPed.Date, wAno, wMes, wDia);
   If wMes < 10 Then
      xMes := '0' + inttostr(wMes)
   Else
      xMes := inttostr(wMes);

   xAnoMM := IntToStr(wAno) + xMes;
   DMFAC.cdsProforma.Edit;
   DMFAC.cdsProforma.FieldByName('PROFANOMES').AsString := xAnoMM;
   DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat := xTcambio;
   dblcTmon.Text := DMFAC.wTMonLoc;
   dtpFVcmto.Date := dtpFPed.Date;
// Inicio HPC_201805_FAC
// 27/08/2018 retira rutina cdsPost
//   DMFAC.cdsPost(DMFAC.cdsProforma);
// Fin HPC_201805_FAC
   DMFAC.cdsProforma.Post;
End;

Procedure TFProforma.dblcVenExit(Sender: TObject);
Var
   xWhere, xCanal: String;
Begin
   If xCrea Then Exit;

// Inicio HPC_201805_FAC
// Si botón de Clientes tiene foco, sale de este evento
   If btnExec.Focused Then Exit;
// Fin HPC_201805_FAC

   If Not bbtnBorra.Focused Then
   Begin
      xWhere := 'VeId=' + '''' + dblcVen.Text + '''';
      edtVen.Text := DMFAC.BuscaQry('dspUltTGE', 'CXC203', 'VEID,VENOMBRES,VEFLAG,CVTAID', xWhere, 'VENOMBRES');

      If DMFAC.wModo = 'A' Then
      Begin
         xWhere := 'CVTAID=' + '''' + DMFAC.cdsQry.FieldByName('CVTAID').AsString + '''';
         xCanal := DMFAC.BuscaQry('dspUltTGE', 'FAC112', 'CVTAID', xWhere, 'CVTAID');
         DMFAC.cdsProforma.Edit;
         DMFAC.cdsProforma.FieldByName('CVTAID').AsString := xCanal;
      End;
   End;
End;

Procedure TFProforma.IniciaForma;
Begin
   Filtracds(DMFAC.cdsDetProf, 'SELECT * FROM FAC312 WHERE CIAID=''''');
   xFCia := False;
   xFLocal := False;
   xFDireccion := False;
   xFAlmacen := False;
   xFLPrecio := False;

   edtCia.Text := '';
   edtClie.Text := '';
   edtFPago.Text := '';
   edtven.text := '';
   edtTMon.text := '';
   dbeTcambio.text := '';
   edtLPrecio.text := '';
   edtTVta.text := '';
   edtLocal.text := '';
   edtAlmacen.text := '';
   dtpFPed.Date := Date;
   dtpFVcmto.Date := Date;
   pnlRegistro.Visible := False;
   wFlagCV := False;
   wFlagCVDes := '';
   wFlagPA := False;
   wFlagLC := False;
   wFlagFP := False;
   edtLentrega.Text := '';
   pnlDatos.Visible := False;
   edtAgencia.text := '';
   dbeFono.Text := '';
   meNoPedido.Enabled := true;
   dblcFPago.Enabled := true;
   dblcTMon.Enabled := true;
   dblcLPrecio.Enabled := true;
   dtpFPed.Enabled := true;
   edtTDoc.text := '';
   dbePorcentaje.text := '';
   edtAgencia.text := '';

   lblEmb.visible := False;
   lblAgencia.visible := False;
   dbeEmbalaje.Visible := False;
   dblcAgencia.visible := False;
   edtAgencia.visible := False;
   edtTransaccion.text := '';
   pnlBusqueda.Visible := False;
   pnlBusqueda.SendToBack;
   wInserta := False;
End;

Procedure TFProforma.EstadoDeForma(xxModo: Integer; xMovEstado, xMovLibera,
   xxEstado: String);
Begin
   pnlCab1.Enabled := False;
   pnlCab2.Enabled := False;
   pnlCab3.Enabled := False;
   pnlCab4.Enabled := False;
   bbtnOK.Enabled := False;
   bbtnBorra.Enabled := False;
   dblcCia.Enabled := True;
   edtClie.Enabled := False;

   pnlDetalle.Enabled := False;
   dbgDetFac.enabled := False;
   dbgDetFac.ReadOnly := True;
   btnActReg.Enabled := False;
   pnlRegistro.Visible := False;

   pnlPie.Refresh;
   pnlPie.Enabled := False;
   bbtnRegresa.Enabled := False;
   Z2bbtnNuevo.Enabled := False;
   lblEstado.visible := False;
   lblArea.visible := False;
   Z2bbtnImprime.Enabled := False;

   If xxModo = 0 Then // cuando va hacia la cabecera
   Begin
      If (xMovEstado = ' ') Then
      Begin
         pnlCab1.Enabled := True;
         pnlCab2.Enabled := True;
         pnlCab3.Enabled := True;
         pnlCab4.Enabled := True;
         bbtnOK.Enabled := True;
         bbtnBorra.Enabled := True;
         dblcLPrecio.Enabled := true;
         dblcCia.SetFocus;
      End
      Else
      Begin
         If (xMovEstado = 'INICIAL') Then
         Begin
            pnlCab3.Enabled := True;
            pnlCab4.Enabled := True;
            bbtnOK.Enabled := True;
            bbtnBorra.Enabled := True;
            lblEstado.caption := xMovEstado;
            lblEstado.visible := true;
            lblArea.caption := xxEstado;
            lblArea.visible := true
         End
      End
   End
   Else
   Begin

      If xxModo = 1 Then // cuando va hacia la cabecera
      Begin // cuando el foco esta en el Detalle
         If (xMovEstado = 'INICIAL') Then // si ya esta grabado//08/08
         Begin
            pnlDetalle.Enabled := True;
            dbgDetFac.Enabled := True;
            dbgDetFac.ReadOnly := False;

            btnActReg.Enabled := True;
            pnlPie.Enabled := True;
            bbtnRegresa.Enabled := True;
            Z2bbtnImprime.Enabled := true;
            lblEstado.caption := xMovEstado;
            lblEstado.visible := true;
            lblArea.caption := xxEstado;
            lblArea.visible := true
         End;
         If (xMovEstado = 'ACEPTADO') Or (xMovEstado = 'R') Then
         Begin
            pnlDetalle.Enabled := True;
            dbgDetFac.enabled := true;
            pnlPie.Enabled := True;
            Z2bbtnImprime.Enabled := true;
            dbgDetFac.enabled := true;
            lblEstado.caption := xMovEstado;
            lblEstado.visible := true;
            lblArea.caption := xxEstado;
            lblArea.visible := true
         End;
         If (xMovEstado = 'ATENDIDO') Or (xMovEstado = 'R') Then
         Begin
            pnlPie.Enabled := True;
            bbtnRegresa.Enabled := False;
            Z2bbtnAcepta.Enabled := False;
            Z2bbtnNuevo.Enabled := False;
            Z2bbtnImprime.Enabled := true;
            lblEstado.caption := xMovEstado;
            lblEstado.visible := true;
         End;
         If xMovEstado = 'ANULADO' Then // anulado
         Begin
            pnlDetalle.Enabled := True;
            dbgDetFac.enabled := true;
            pnlPie.Enabled := True;
            lblEstado.caption := xMovEstado;
            lblEstado.visible := true;
            Z2bbtnImprime.Enabled := False;
            lblArea.caption := xxEstado;
            lblArea.visible := true
         End;
         If (DMFAC.wModo = 'A') And ((xMovEstado = 'INICIAL') Or (xMovEstado = 'ACEPTADO')) Then
            Z2bbtnNuevo.Enabled := True;
      End;
   End;

   If DMFAC.wModo = 'C' Then
   Begin // Si Entra Solo Para Consulta
      pnlCab1.Enabled := False;
      pnlCab2.Enabled := False;
      pnlCab3.Enabled := False;
      pnlCab4.Enabled := False;
      bbtnOK.Enabled := False;
      bbtnBorra.Enabled := False;

      pnlDetalle.Enabled := False;
      dbgDetFac.ReadOnly := True;
      btnActReg.Enabled := False;

      pnlPie.Refresh;
      pnlPie.Enabled := False;
      If DMFAC.wAdmin = 'G' Then
      Begin
         pnlPie.Enabled := True;
         Z2bbtnNuevo.Enabled := True;
      End
      Else
      Begin
         bbtnRegresa.Enabled := False;
         Z2bbtnNuevo.Enabled := False;
      End;
      pnlPie.Refresh;
   End;
End;

Procedure TFProforma.InicializaFooter;
Begin
   dbgDetFac.ColumnByName('DPROFCANTAC').FooterValue := '';
   dbgDetFac.ColumnByName('DPROFPREUMO').FooterValue := '';
   dbgDetFac.ColumnByName('DPROFMTOMO').FooterValue := '';
End;

Procedure TFProforma.FiltraPedido;
Var
   xFiltro: String;
Begin
// Inicio HPC_201801_FAC
// Se retira componente dblcdClie, se deja componente dblcdAso
{
   xFiltro := 'CIAID=' + QuotedStr(dblcCia.Text)
      + ' AND CLIEID=' + QuotedStr(dblcdClie.Text)
      + ' AND PROFID=' + QuotedStr(MeNoPedido.Text)
      + ' ORDER BY DPROFITEM';
}
   xFiltro := 'CIAID=' + QuotedStr(dblcCia.Text)
      + ' AND CLIEID=' + QuotedStr(dblcdAso.Text)
      + ' AND PROFID=' + QuotedStr(MeNoPedido.Text)
      + ' ORDER BY DPROFITEM';
// Fin HPC_201801_FAC
   Filtracds(DMFAC.cdsDetProf, 'select * from FAC312 where ' + xFiltro);
End;

Procedure TFProforma.CalculaFooter;
Var
   xTotal, xTotDscto, xTotCtdad, xTotIGv, xTotProf: double;
   xTasaIGv: double;
   xTotEmbMO: double;
   xRegAct: integer;
Begin
// Totales
   If DMFAC.cdsDetProf.RecordCount > 0 Then
   Begin
      DMFAC.cdsDetProf.DisableControls;
      xRegAct := DMFAC.cdsDetProf.recno;
      xTotal := 0;
      xTotDscto := 0;
      xTotCtdad := 0;
      xTotIgv := 0;
      xTotProf := 0;
      DMFAC.cdsDetProf.First;
      While Not DMFAC.cdsDetProf.Eof Do
      Begin
         xTotCtdad := xTotCtdad + DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat;
         xTotDscto := xTotDscto + DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat;
         xTotal := xTotal + DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat;
         xTotIgv := xTotIgv + DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat;
         xTotProf := xTotProf + DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat + DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat;
         DMFAC.cdsDetProf.Next;
      End; //Para presentar embalaje
      xTotEmbMO := DMFAC.cdsProforma.FieldByName('PROFEMBMO').AsFloat;
      xTotal := xTotal + xTotEmbMO;

   // Inicio FAC-201806
   // 31/10/2018 Actualiza display de Detalle
      dbgDetFac.Selected.Clear;
      dbgDetFac.Selected.Add('DPROFITEM'#9'3'#9'Item');
      dbgDetFac.Selected.Add('ARTID'#9'8'#9'Artículo');
      dbgDetFac.Selected.Add('ARTDES'#9'30'#9'Descripción');
      dbgDetFac.Selected.Add('CODCOM'#9'8'#9'Combo');
      dbgDetFac.Selected.Add('UNMIDO'#9'3'#9'U/M');
      dbgDetFac.Selected.Add('DPROFCANTP'#9'06'#9'Cant.~Pedida');
      dbgDetFac.Selected.Add('ALMID'#9'03'#9'Alm.');
      dbgDetFac.Selected.Add('DPROFPREUMO'#9'09'#9'Precio~Unit');
      dbgDetFac.Selected.Add('DPROFDCTOMO'#9'08'#9'Monto~Dscto1');
      dbgDetFac.Selected.Add('DPROFDTOMO2'#9'08'#9'Monto~Dscto2');
      dbgDetFac.Selected.Add('DPROFMTOMO'#9'10'#9'Monto~Original');
      dbgDetFac.ApplySelected;

      TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO')).DisplayFormat := '########0.00';
      TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO')).EditFormat := '########0.00';

      TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO')).DisplayFormat := '########0.00';
      TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO')).EditFormat := '########0.00';

      TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2')).DisplayFormat := '########0.00';
      TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2')).EditFormat := '########0.00';

      TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO')).DisplayFormat := '########0.00';
      TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO')).EditFormat := '########0.00';
   // Fin FAC-201806

      dbgDetFac.ColumnByName('DPROFCANTP').FooterValue := 'I.G.V:';
      dbgDetFac.ColumnByName('DPROFDCTOMO').FooterValue := 'Total';
      dbgDetFac.ColumnByName('DPROFCANTAC').FooterValue := floattostrf(xTotal, ffNumber, 10, 2);
      dbgDetFac.ColumnByName('DPROFPREUMO').FooterValue := floattostrf(xTotIgv, ffNumber, 10, 2);
      dbgDetFac.ColumnByName('DPROFMTOMO').FooterValue := floattostrf((xTotal + xTotIgv), ffNumber, 10, 2);
      dbgDetFac.ColumnByName('DPROFDCTO1').FooterValue := floattostrf((xTotEmbMo), ffNumber, 10, 2);

      DMFAC.cdsDetProf.First;
      DMFAC.cdsDetProf.MoveBy(xRegAct);
      DMFAC.cdsDetProf.EnableControls;
   End //if
   Else
   Begin
      dbgDetFac.ColumnByName('DPROFCANTAC').FooterValue := '';
      dbgDetFac.ColumnByName('DPROFDCTO2').FooterValue := 'Total:';
      dbgDetFac.ColumnByName('DPROFPREUMO').FooterValue := '';
      dbgDetFac.ColumnByName('DPROFMTOMO').FooterValue := '';
      dbgDetFac.ColumnByName('DPROFCANTP').FooterValue := 'I.G.V:';
      dbgDetFac.ColumnByName('DPROFDCTOMO').FooterValue := 'Total';
   End;
End;

Procedure TFProforma.dblcCiaExit(Sender: TObject);
Begin
   If xCrea And Not xFCia Then Exit;

// Inicio HPC_201801_FAC
// Cambia estado de variable que Controla Ingreso al formulario
   xCrea := False;
// Fin HPC_201801_FAC

   edtCia.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE101', 'CIADES', 'CIAID=' + QuotedStr(dblcCia.Text), 'CIADES');

   DMFAC.FiltraTabla(DMFAC.cdsVen, 'CXC203', 'VEID', 'CIAID=' + quotedstr(dblcCia.Text) + ' AND NVL(VESTATUS,''N'')=''S''');

   DMFAC.cdsTLista.Filtered := False;
   DMFAC.cdsTLista.Filter := 'CIAID=' + QuotedStr(dblcCia.Text);
   DMFAC.cdsTLista.Filtered := True;

   DMFAC.cdsTInven.Filtered := False;
   DMFAC.cdsTInven.Filter := 'CIAID=' + QuotedStr(dblcCia.Text);
   DMFAC.cdsTInven.Filtered := True;

   DMFAC.FiltraTabla(DMFAC.cdsLocal, 'TGE126', 'LOCID');
   DMFAC.cdsLocal.Filtered := False;
   If length(dblcCia.text) > 0 Then
   Begin
      DMFAC.cdsLocal.Filter := 'CIAID=' + Quotedstr(dblcCia.text);
      DMFAC.cdsLocal.Filtered := true;
      If xCia <> dblcCia.Text Then
      Begin
         DMFAC.cdsLocal.First;
         xLoc := DMFAC.cdsLocal.FieldByName('LOCID').AsString;
         edtLocal.Text := DMFAC.cdsLocal.FieldByName('LOCDES').AsString;
         xTin := '';
         edtTinv.Text := '';
         xAlm := '';
         edtAlmacen.Text := '';
         If DMFAC.wModo = 'A' Then
            DMFAC.cdsProforma.Append
         Else
            DMFAC.cdsProforma.Edit;
         DMFAC.cdsProforma.FieldByName('LOCID').AsString := xLoc;
         DMFAC.cdsProforma.FieldByName('TINID').AsString := xTin;
         DMFAC.cdsProforma.FieldByName('ALMID').AsString := xAlm;
      End;
   End;
End;

Procedure TFProforma.dblcLocalExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea And Not xFLocal Then Exit;

   xWhere := 'CIAID=' + Quotedstr(dblcCia.text) + 'and LOCID=' + QuotedStr(dblcLocal.Text);
   edtLocal.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE126', 'LOCDES', xWhere, 'LOCDES');
End;

Procedure TFProforma.dblcTipoCompraExit(Sender: TObject);
Begin
   edtTipoCompra.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE173', 'TIPADQDES', 'TIPOADQ=' + quotedStr(dblcTipoCompra.text), 'TIPADQDES');

   sTipoRQS := dblcTipoCompra.Text;

   If sTipoRQS = 'C' Then
   Begin
      dblcTInv.Enabled := True;
      dblcAlmacen.Enabled := True;
   // Inicio HPC_201805_FAC
   // 27/08/2018 retiro de envio de focus
      //dblcTInv.SetFocus;
   // Fin HPC_201805_FAC
   End
   Else
      If sTipoRQS = 'S' Then
      Begin
         DMFAC.cdsProforma.FieldByName('TINID').AsString := '00';
         DMFAC.cdsProforma.FieldByName('ALMID').AsString := '00';
         dblcTInv.Enabled := False;
         dblcAlmacen.Enabled := False;
      End;
End;

Procedure TFProforma.dblcTInvExit(Sender: TObject);
Begin
   edtTinv.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE152', 'TINDES', 'TINID=' + QuotedStr(dblcTInv.Text) + 'AND CIAID='
      + Quotedstr(dblcCia.text), 'TINDES');

   DMFAC.cdsAlmacen.Filtered := False;
   DMFAC.cdsAlmacen.Filter := 'CIAID=' + QuotedStr(dblcCia.Text) + ' AND LOCID=' + QuotedStr(dblcLocal.Text)
      + ' AND TINID=' + QuotedStr(dblcTInv.Text) + ' AND ALMVTA=''S'' AND ACTIVO=''S'''; //ALMACEN DE VENTAS
   DMFAC.cdsAlmacen.Filtered := True;
End;

Procedure TFProforma.dblcAlmacenExit(Sender: TObject);
Var
   xWhere: String;
   sEmpresa: String;
Begin
   If xCrea And Not xFAlmacen Then Exit;

// Inicio HPC_201805_FAC
// Si botón de Clientes tiene foco, sale de este evento
   If btnExec.Focused Then Exit;
// Fin HPC_201805_FAC

   xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND ALMID=' + QuotedStr(dblcAlmacen.Text);
   edtAlmacen.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE151', 'ALMDES', xWhere, 'ALMDES');

   If (DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString = DMFAC.wVtaProv) Then
   Begin //Provincia
      lblEmb.Visible := true;
      dbeEmbalaje.Visible := true;
      lblAgencia.Visible := true;
      dblcAgencia.Visible := true;
      edtAgencia.Visible := true;
   End
   Else
   Begin
      sEmpresa := DMFAC.BuscaQry('dspUltTGE', 'FAC104', 'EMPID', 'EMPFLAGP=''S''', 'EMPID');
      dblcAgencia.Text := sEmpresa;
   End;
// Inicio HPC_201801_FAC
// Pasa Focus a Botón btnExec

// Inicio HPC_201805_FAC
// 06/09/2018 Evalúa que Maestro de Clientes haya sido previamente levantado
   If not btnExec.Focused Then
   Begin
      btnExec.SetFocus;
      btnExecClick(Self);
   End;
// Fin HPC_201805_FAC
//   btnExec.SetFocus;
// Fin HPC_201801_FAC
End;

Procedure TFProforma.dblcTClieExit(Sender: TObject);
Var
   xWhere, xFiltro: String;
Begin
   edtClie.Enabled := False;
   xWhere := 'TCLIEID=' + '''' + dblcTClie.Text + '''';
   edtTClie.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEDES, TCLIEFLAG', xWhere, 'TCLIEDES');
// Inicio HPC_201701_FAC
// Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
   DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;

   If dblcAlmacen.Focused Then Exit;


// Inicio HPC_201801_FAC
// retira lectura del Maestro de Clientes de esta sección
{
   If DMFAC.xTipCli = 'S' Then
// Fin HPC_201701_FAC
   Begin
      lblClie.Caption := 'Cliente';
      dblcdClie.Visible := True;
      dblcdAso.Visible := False;
      btnExec.Visible := False;
      xFiltro := 'SELECT CLIEID, CLIEDES, CLIERUC, CLAUXID, TMONID, CLIECREMAX, CLIECREDISP, CLIECREUTI,'
         + 'ZONVTAID, VEID, SITCLIEID, DESCLIEID, CLIEDIR, CLIETELF, TIPPERID, CLIECOND, CLIEDNI, '
         + 'CLIEEMAI, CLIEABR, ACTIVO, CLIENOMBRE, CLIENOMBRE1, CLIEAPEPAT, CLIEAPEMAT, CLIEDIRLEG, '
         + 'PAISID, DPTOID, CIUDID, CLIECZIP, CIAID, USERID, FREG, HREG, CLIEFAX, TVTAID, TDOC_ID_SUNAT '
         + 'FROM TGE204 '
         //Inicio HPC_201408_FAC
         //+ 'WHERE CIAID=' + QuotedStr(dblcCia.text) + ' AND CLAUXID<>' + QuotedStr('AS') + ' AND ACTIVO = ' + QuotedStr('S');
      + 'WHERE CLAUXID<>' + QuotedStr('AS') + ' AND ACTIVO = ' + QuotedStr('S');
         //Final HPC_201408_FAC
      DMFAC.cdsClie.Close;
      DMFAC.cdsClie.DataRequest(xFiltro);
      DMFAC.cdsClie.Open;
      dblcdClieRuc.Enabled := False;

      edtClie.Enabled := False;
      If wFil_Asoc = 'N' Then
         dblcLentrega.Enabled := True;
      If pnlCab2.Enabled = true Then
         dblcdClie.SetFocus;
   End
   Else
   // Inicio HPC_201701_FAC
   // Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
      If DMFAC.xTipCli = 'N' Then
   // Fin HPC_201701_FAC
      Begin
         lblClie.Caption := 'Asociado';
         dblcdClie.Visible := False;
         dblcdClieRuc.Enabled := False;
         dblcdAso.Visible := True;
         btnExec.Visible := True;
         dblcLentrega.Enabled := False;
         If pnlCab2.Enabled = true Then
            dblcdAso.SetFocus;
      End;
}
// Fin HPC_201801_FAC
End;

// Inicio HPC_201801_FAC
// Busca Clientes y Asociados en el propio Maestro de Clientes
Procedure TFProforma.dblcdAsoExit(Sender: TObject);
Var
   xWhere, xZona: String;
   xSQL: String;
   xSectorCom: String;
   xDireccion, xFono: String;
   sZona, sZona1: String;
   xTipDocIdent, xNumdocIdent, xCampos: String;
Begin
   If dblcTipoCompra.Focused Then exit;
   If btnExec.Focused Then exit;

// retira lectura del Maestro de Clientes de esta sección
   {
   If length(Trim(dblcdAso.Text)) > 0 Then
   Begin
      wPolitica1 := False;
      wPolitica2 := False;

      xSQL := 'ASOID=' + QuotedStr(dblcdAso.Text);

      DMFAC.BuscaQry('dspUltTGE', 'APO201', '*', xSQL, 'ASOID');
      edtclie.Text := Trim(DMFAC.cdsQry.FieldByName('ASOAPENOMDNI').AsString);
      If dblcdAso.Text = DMFAC.cdsQry.FieldByName('ASOID').AsString Then
      Begin
         If DMFAC.cdsProforma.State = dsBrowse Then
            DMFAC.cdsProforma.Edit;
         DMFAC.cdsProforma.FieldByName('CLAUXID').AsString := 'AS';
         DMFAC.cdsProforma.FieldByName('CLIEID').AsString := Trim(DMFAC.cdsQry.FieldByName('ASOID').AsString);
         DMFAC.cdsProforma.FieldByName('CLIEDES').AsString := Trim(DMFAC.cdsQry.FieldByName('ASOAPENOMDNI').AsString);

         DMFAC.cdsProforma.FieldByName('CLIERUC').AsString := Trim(DMFAC.cdsQry.FieldByName('ASORUC').AsString);
         If DMFAC.cdsProforma.FieldByName('CLIERUC').AsString = '' Then
            DMFAC.cdsProforma.FieldByName('CLIERUC').AsString := Trim(DMFAC.cdsQry.FieldByName('ASODNI').AsString);

         xClAux := DMFAC.cdsProforma.FieldByName('CLAUXID').AsString;
         xZona := '01';
         xDireccion := DMFAC.cdsQry.FieldByName('ASODIR').AsString;
         xFono := DMFAC.cdsQry.FieldByName('ASOTELF1').AsString;

         DMFAC.cdsProforma.FieldByName('PROFDIRENT').AsString := xDireccion;
         DMFAC.cdsProforma.FieldByName('CLIETELF').AsString := xFono;

         sZona := DMFAC.BuscaQry('dspUltTGE', 'FAC106', 'TVTAID', 'ZVTAID=' + QuotedStr(xZona), 'TVTAID');
         sZona1 := DMFAC.BuscaQry('dspUltTGE', 'FAC105', 'TVTAFLAG', 'TVTAID=' + QuotedStr(sZona), 'TVTAFLAG');

         xSectorCom := copy(xZona, 1, 2);

         xWhere := ' CIAID=' + QuotedStr(dblcCia.text) + ' AND ( SCOMERID = ' + QuotedStr(xSectorCom) +
            ') AND (' + DMFAC.wReplacCeros + '(DCCOMFLAG,''VACIO'') <>' + QuotedStr('A') + ')';

         Filtracds(DMFAC.cdsDscto, 'SELECT CCOMERID, DCCOMDES, DCCOMABR FROM TGE180 WHERE ' + xwhere + ' ORDER BY CCOMERID');
         dblcFPago.OnExit(dblcFPago);
         DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString := xSectorCom;
      End
      Else
      Begin
         dblcdClieRuc.Text := '';
         edtClie.Text := '';
         Showmessage('Código de Asociado NO Registrado!!!');
         dblcdAso.Text := '';
         dblcdAso.SetFocus;
         exit;
      End;
   End
   Else
   Begin
      dblcdClieRuc.Text := '';
      edtClie.Text := '';
      If dblcTClie.Focused Then
      Begin
         dblcdAso.Text := '';
         dblcTClie.SetFocus;
         exit;
      End
      Else
      Begin
         Showmessage('Código de Asociado NO Registrado!!!');
         dblcdAso.Text := '';
         dblcdAso.SetFocus;
         exit;
      End;
   End;
   }

   If length(Trim(dblcdAso.Text)) > 0 Then
   Begin
      xCampos := 'CLIEID, CLIEDES, CLIERUC, CLAUXID, TMONID, CLIECREMAX, CLIECREDISP, CLIECREUTI, '
         +       'ZONVTAID, VEID, SITCLIEID, DESCLIEID, CLIEDIR, CLIETELF, TIPPERID, CLIECOND, CLIEDNI, TDOC_ID_SUNAT, NUMDOCID ';
      xWhere := 'CLAUXID=' + QuotedStr(DMFAC.xgClAuxId)
         + ' and CLIEID =' + QuotedStr(dblcdAso.Text);

      If DMFAC.cdsProforma.State = dsBrowse Then
         DMFAC.cdsProforma.Edit;

      DMFAC.cdsProforma.FieldByName('CLIEID').AsString  := DMFAC.BuscaQry('dspUltTGE', 'TGE204', xCampos, xWhere, 'CLIEID');
      DMFAC.cdsProforma.FieldByName('CLIEDES').AsString := Trim(DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
      DMFAC.cdsProforma.FieldByName('CLAUXID').AsString := DMFAC.cdsQry.FieldByName('CLAUXID').AsString;

      xDireccion := copy(stringreplace(DMFAC.cdsQry.FieldByName('CLIEDIR').AsString, '''', '', [rfReplaceAll]), 1, 100);
      edtDireccion.Text := xDireccion;
      DMFAC.cdsProforma.FieldByName('PROFDIRENT').AsString := xDireccion;

      xTipDocIdent := DMFAC.cdsQry.FieldByName('TDOC_ID_SUNAT').AsString;
      xNumdocIdent := DMFAC.cdsQry.FieldByName('NUMDOCID').AsString;
      edtclie.Text := Trim(DMFAC.cdsQry.FieldByName('CLIEDES').AsString);

      DMFAC.cdsProforma.FieldByName('CLIERUC').AsString := xNumdocIdent;

      xFono := DMFAC.cdsQry.FieldByName('CLIETELF').AsString;
      DMFAC.cdsProforma.FieldByName('CLIETELF').AsString := xFono;

      xZona := DMFAC.BuscaQry('dspUltTGE', 'FAC105', 'TVTAID', 'TVTAFLAG =' + QuotedStr('L'), 'TVTAID');
      sZona := DMFAC.BuscaQry('dspUltTGE', 'FAC106', 'ZVTAID', 'TVTAID =' + QuotedStr(xZona) + ' And ZONADEFAUL =' + QuotedStr('S'), 'ZVTAID');
      DMFAC.cdsProforma.FieldByName('ZONVTAID').AsString := sZona;
      DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString := XZona;

      xClAux :=  DMFAC.cdsProforma.FieldByName('CLAUXID').AsString;

      xSectorCom := copy(xZona, 1, 2);
      xWhere := ' CIAID=' + QuotedStr(dblcCia.text) + ' AND ( SCOMERID = ' + QuotedStr(xSectorCom) +
            ') AND (' + DMFAC.wReplacCeros + '(DCCOMFLAG,''VACIO'') <>' + QuotedStr('A') + ')';
      Filtracds(DMFAC.cdsDscto, 'SELECT CCOMERID, DCCOMDES, DCCOMABR FROM TGE180 WHERE ' + xwhere + ' ORDER BY CCOMERID');
      dblcFPago.OnExit(dblcFPago);
      DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString := xSectorCom;
   End;
End;
// Fin HPC_201801_FAC

// Inicio HPC_201801_FAC
// Se retira componente dblcdClie
(*
Procedure TFProforma.dblcdClieExit(Sender: TObject);
Var
   xWhere, xZona: String;
   xSectorCom, xStatus, xCampos, xTipo, xPolit1, xPolit2, xVend: String;
   xCreditoMax, xCreditoDisp, xCreditoUti: double;
   xDireccion, xFono: String;
   sZona, sZona1, xTPersona: String;
Begin
   If xCrea Then Exit;
   If DMFAC.wModo = 'M' Then exit;
   If dblcTipoCompra.Focused Then exit;
   If dblcTClie.Focused Then exit;

   If length(dblcdClie.Text) = 0 Then
   Begin
      dblcdClieRuc.SetFocus;
      Exit;
   End;

   DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEFLAG', 'TCLIEID=' + '''' + dblcTClie.Text + '''', 'TCLIEFLAG');
// Inicio HPC_201701_FAC
// Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
   DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;
// Fin HPC_201701_FAC

   //Inicio HPC_201408_FAC
   //xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND ClIEID=' + QuotedStr(dblcdClie.Text);
   xWhere := ' ClIEID=' + QuotedStr(dblcdClie.Text) + ' AND CLAUXID<>' + QuotedStr('AS') + ' AND ACTIVO = ' + QuotedStr('S');
   //Final HPC_201408_FAC
   xCampos := 'CLIEID, CLIEDES, CLIERUC, CLAUXID, TMONID, CLIECREMAX, CLIECREDISP, CLIECREUTI, CLIEDNI, '
      + 'TVTAID, ZONVTAID, VEID, SITCLIEID, DESCLIEID, CLIEDIR, CLIETELF, TIPPERID, CLIECOND';
   edtclie.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE204', xCampos, xWhere, 'CLIEDES');
   If length(trim(edtclie.Text)) = 0 Then
   Begin
      dblcdClieRuc.Text := '';
      edtClie.Text := '';
      Showmessage('Código de Cliente NO encontrado.....!!!');
      dblcdClie.Text := '';
      dblcdClie.SetFocus;
      exit;
   End;
   // vhndema
   DMFAC.cdsProforma.FieldByName('CLAUXID').AsString := DMFAC.cdsQry.FieldByName('CLAUXID').AsString;
   xClAux := DMFAC.cdsQry.FieldByName('CLAUXID').AsString;
   DMFAC.cdsProforma.FieldByName('CLIERUC').AsString := DMFAC.cdsQry.FieldByName('CLIERUC').AsString;
   If DMFAC.cdsProforma.FieldByName('CLIERUC').AsString = '' Then
      DMFAC.cdsProforma.FieldByName('CLIERUC').AsString := DMFAC.cdsQry.FieldByName('CLIEDNI').AsString;
   // end vhndema

   DMFAC.cdsProforma.FieldByName('CLIEDES').AsString := edtclie.Text;
   DMFAC.cdsProforma.FieldByName('TIPPERID').AsString := DMFAC.cdsQry.FieldByName('TIPPERID').AsString;
   DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString := DMFAC.cdsQry.FieldByName('TVTAID').AsString;

   If wFil_Asoc = 'N' Then // Cliente sin Asociados
   Begin
      wPolitica1 := False;
      wPolitica2 := False;

      If dblcdClie.Text = DMFAC.cdsQry.FieldByName('CLIEID').AsString Then
      Begin
         If length(DMFAC.cdsQry.FieldByName('VEID').AsString) = 0 Then
         Begin
            edtclie.Text := '';
            dblcdClie.text := '';
            dblcdClie.SetFocus;
            Showmessage('El Cliente no tiene Vendedor asignado!!!');
            exit;
         End;
         If DMFAC.cdsQry.FieldByName('TIPPERID').AsString = DMFAC.wPJuridica Then
         Begin
            If length(DMFAC.cdsQry.FieldByName('CLIERUC').AsString) = 0 Then
            Begin
               Showmessage('El Cliente no tiene RUC!!!');
            End;
         End;

         If length(DMFAC.cdsQry.FieldByName('CLIECOND').AsString) = 0 Then
         Begin
            Showmessage('El Cliente no tiene Condición de Pago!!!');
         End;

         If length(DMFAC.cdsQry.FieldByName('ZONVTAID').AsString) = 0 Then
         Begin
            Showmessage('El Cliente no tiene Zona Venta!!!');
         End;
         If DMFAC.cdsProforma.State = dsBrowse Then
            DMFAC.cdsProforma.Edit;
         DMFAC.cdsProforma.FieldByName('CLIERUC').AsString := DMFAC.cdsQry.FieldByName('CLIERUC').AsString;
         DMFAC.cdsProforma.FieldByName('TIPPERID').AsString := DMFAC.cdsQry.FieldByName('TIPPERID').AsString;
         xClAux := DMFAC.cdsQry.FieldByName('CLAUXID').AsString;
         xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND CLIEID=' + QuotedStr(dblcdClie.Text);
         Filtracds(DMFAC.cdsDireccion, 'SELECT * FROM FAC110 WHERE ' + xWhere + ' ORDER BY CLIEDIRID'); //Lugar de entrega 08/03

         lblNLugarE.Caption := floattostr(DMFAC.cdsDireccion.RecordCount);
         DMFAC.cdsDireccion.IndexFieldNames := 'CIAID;CLIEID;CLIEDIRID';

         xCreditoMax := DMFAC.cdsQry.FieldByName('CLIECREMAX').Asfloat; //Linea asignada
         xZona := DMFAC.cdsQry.FieldByName('ZONVTAID').AsString;
         xVend := DMFAC.cdsQry.FieldByName('VEID').AsString;
         xDireccion := DMFAC.cdsQry.FieldByName('CLIEDIR').AsString;
         xFono := DMFAC.cdsQry.FieldByName('CLIETELF').AsString;
      // Interrupcion : Calificacion negativa de las condiciones de Venta para  Hoja de Trabajo
      // para dar solucion por creditos
         xStatus := DMFAC.cdsQry.FieldByName('SITCLIEID').AsString;
         xTipo := DMFAC.cdsQry.FieldByName('DESCLIEID').AsString;
         xTMonLCred := DMFAC.cdsQry.FieldByName('TMONID').AsString;
      // Revisa Cuenta Corriente
      // CuentaCte;
         If xTMonLCred = DMFAC.wTMonLoc Then
            xCreditoUti := xxMtoUtiMN //Linea Utilizada
         Else
            If xTMonLCred = DMFAC.wTMonExt Then
               xCreditoUti := xxMtoUtiME //Linea Utilizada
            Else
               xCreditoUti := xxMtoUtiME; //Linea Utilizada

         xCreditoDisp := FRound(xCreditoMax - xCreditoUti, 15, 4); //Linea Disponible}
         edtdireccion.Text := xDireccion;
         dbeFono.Text := xFono;
         dblcZona.Text := xZona;
         sZona := DMFAC.BuscaQry('dspUltTGE', 'FAC106', 'TVTAID', 'ZVTAID=' + QuotedStr(xZona), 'TVTAID');
         sZona1 := DMFAC.BuscaQry('dspUltTGE', 'FAC105', 'TVTAFLAG', 'TVTAID=' + QuotedStr(sZona), 'TVTAFLAG');
         dbeEmbalaje.visible := (sZona1 = 'P');
         lblEmb.visible := (sZona1 = 'P');
         dblcAgencia.visible := (sZona1 = 'P');
         edtAgencia.visible := (sZona1 = 'P');
         lblAgencia.visible := (sZona1 = 'P');
         DMFAC.cdsProforma.FieldByName('VEID').AsString := xVend;
         DMFAC.cdsProforma.FieldByName('TRIID').AsString := DMFAC.wTransVta;

         xWhere := 'TIPPERID=' + QuotedStr(DMFAC.cdsProforma.FieldByName('TIPPERID').AsString);
         xTPersona := DMFAC.BuscaQry('dspUltTGE', 'TGE109', 'TIPPERS', xWhere, 'TIPPERS');

      // Interrupcion : Calificacion negativa de las condiciones de Venta para  Hoja de Trabajo
      // para dar solucion por creditos
         xWhere := 'SITCLIEID=' + QuotedStr(xStatus);
         xPolit1 := DMFAC.BuscaQry('dspUltTGE', 'FAC115', ' DESCLIEPL1,DESCLIEPL2,DESCLIEPOR ', 'DESCLIEID=' + QuotedStr(xTipo), 'DESCLIEPL1');
         xPolit2 := DMFAC.cdsQry.FieldByName('DESCLIEPL2').AsString;
         wDescAdi := DMFAC.cdsQry.FieldByName('DESCLIEPOR').AsFloat; //Descuento Adicional
         If (xPolit1 = 'S') Then
            wPolitica1 := true; //Para Politica de Descuentos
         If (xPolit2 = 'S') Then
            wPolitica2 := true; //Para Descuentos Adicionales de Forma de Pago

         xSectorCom := copy(xZona, 1, 2);

         xWhere := '( SCOMERID = ' + QuotedStr(xSectorCom) +
            ') AND (' + DMFAC.wReplacCeros + '(DCCOMFLAG,'''') <>' + QuotedStr('A') + ')';

         Filtracds(DMFAC.cdsDscto, 'SELECT CCOMERID, DCCOMDES FROM TGE180 WHERE ' + xwhere + ' ORDER BY CCOMERID');
         dblcFPago.OnExit(dblcFPago);
         DMFAC.cdsProforma.FieldByName('CLIECREMAX').AsFloat := xCreditoDisp;
         DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString := xSectorCom;
         dcDireccion;
         dcAlmacen;
         dcLPrecio;
      End
      Else
      Begin
         dblcdClieRuc.Text := '';
         edtClie.Text := '';
         Showmessage('Código de Cliente NO Registrado!!!');
         dblcdClie.Text := '';
         dblcdClie.SetFocus;
         exit;
      End;
   End
   Else // wFil_Asoc <> 'N'
   Begin
   // Inicio HPC_201701_FAC
   // Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
      If DMFAC.xTipCli = 'S' Then
   // Fin HPC_201701_FAC
      Begin
         Filtracds(DMFAC.cdsDscto, 'SELECT CCOMERID, DCCOMDES, DCCOMABR FROM TGE180 WHERE CIAID=' + QuotedStr(dblcCia.text) + ' ORDER BY CCOMERID');
         Filtracds(DMFAC.cdsDireccion, 'SELECT * FROM FAC110 WHERE CIAID=' + QuotedStr(dblcCia.text) + ' AND CLIEID=' + QuotedStr(dblcdClie.Text) + ' ORDER BY CLIEDIRID'); //Lugar de entrega 08/03
      End;
   End;
End;
*)
// Fin HPC_201801_FAC

Procedure TFProforma.dcDireccion;
Var
   sDireccion: String;
Begin
   If xCrea Then exit;
   DMFAC.cdsDireccion.First;
   sDireccion := trim(DMFAC.cdsDireccion.FieldByName('CLIEDIRID').AsString);
  //DMFAC.cdsProforma.Edit;
   DMFAC.cdsProforma.FieldByName('CLIEDIRID').AsString := sDireccion;
   xFDireccion := true;
   dblcLEntrega.OnExit(dblcLEntrega);
End;

Procedure TFProforma.dcAlmacen;
Var
   sAlmacen: String;
Begin
   If xCrea Then exit;
   DMFAC.cdsAlmacen.First;
   sAlmacen := trim(DMFAC.cdsAlmacen.FieldByName('ALMID').AsString);
   DMFAC.cdsProforma.Edit;
   DMFAC.cdsProforma.FieldByName('ALMID').AsString := sAlmacen;
   xFAlmacen := true;
   dblcAlmacen.OnExit(dblcAlmacen);
End;

Procedure TFProforma.dcLPrecio;
Var
   sLPrecio: String;
Begin
   If xCrea Then exit;
   DMFAC.cdsTLista.First;
   sLPrecio := trim(DMFAC.cdsTLista.FieldByName('TLISTAID').AsString);
   DMFAC.cdsProforma.Edit;
   DMFAC.cdsProforma.FieldByName('TLISTAID').AsString := sLPrecio;
   xFLPrecio := true;
   dblcLPrecio.OnExit(dblcLPrecio);
End;

Procedure TFProforma.dblcLentregaExit(Sender: TObject);
Begin
   If xCrea And Not xFDireccion Then Exit;

// Inicio HPC_201805_FAC
// Si botón de Clientes tiene foco, sale de este evento
   If btnExec.Focused Then Exit;
// Fin HPC_201805_FAC

   If Not (bbtnBorra.Focused) Then
   Begin
      DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEFLAG', 'TCLIEID=' + '''' + dblcTClie.Text + '''', 'TCLIEFLAG');
      If DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString = 'S' Then
      Begin
         DMFAC.cdsDireccion.IndexFieldNames := 'CIAID;CLIEID;CLIEDIRID';
         DMFAC.cdsDireccion.Setkey;
         DMFAC.cdsDireccion.FieldByName('CIAID').AsString := dblcCia.Text;

      // Inicio HPC_201801_FAC
      // Se retira componente dblcdClie, se deja componente dblcdAso
      //   DMFAC.cdsDireccion.FieldByName('CLIEID').AsString := dblcdClie.Text;
         DMFAC.cdsDireccion.FieldByName('CLIEID').AsString := dblcdAso.Text;
      // Fin HPC_201801_FAC

         DMFAC.cdsDireccion.FieldByName('CLIEDIRID').AsString := dblcLentrega.text;
         If DMFAC.cdsDireccion.GotoKey Then
         Begin
            edtLentrega.Text := DMFAC.cdsDireccion.FieldByName('CLIEDIRENT').AsString;
            If DMFAC.cdsProforma.State = dsBrowse Then
               DMFAC.cdsProforma.Edit;
            DMFAC.cdsProforma.FieldByName('ZONVTAID').AsString := DMFAC.cdsDireccion.FieldByName('ZVTAID').AsString;
            DMFAC.cdsProforma.FieldByName('ZIPID').AsString := DMFAC.cdsDireccion.FieldByName('ZIPID').AsString;
         End
         Else
         Begin
            Showmessage('Codigo de Direccion de Entrega Errado');
            exit;
         End;
      End
      Else
      Begin
         If DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString = 'N' Then
         Begin
            edtLentrega.Text := DMFAC.DisplayDescrip('FAC110', 'CLIEDIRENT', 'CIAID', dblcCia.Text);
         End;
      End;
   End;
End;

Procedure TFProforma.dblcLPrecioExit(Sender: TObject);
Var
   xwhere: String;
Begin
   If xCrea And Not xFLPrecio Then Exit;

// Inicio HPC_201805_FAC
// Si botón de Clientes tiene foco, sale de este evento
   If btnExec.Focused Then Exit;
// Fin HPC_201805_FAC

   If Not (bbtnBorra.Focused) Then
   Begin
   // Inicio HPC_201801_FAC
   // Se incluye compañía a búsqueda a Lista de Precios
   //   xWhere := 'TLISTAID = ' + QuotedStr(dblcLPrecio.Text);
      xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' and TLISTAID = ' + QuotedStr(dblcLPrecio.Text);
   // Fin HPC_201801_FAC
      edtLPrecio.Text := DMFAC.BuscaQry('dspTLista', 'FAC101', 'TLISTADES,TLISTAFLAG', xWhere, 'TLISTADES');
   End;
End;

Procedure TFProforma.dblcFPagoExit(Sender: TObject);
Var
   xModo, xWhere: String;
   xPorc: String;
Begin
   If xCrea Then Exit;

// Inicio HPC_201805_FAC
// Si botón de Clientes tiene foco, sale de este evento
   If btnExec.Focused Then Exit;
// Fin HPC_201805_FAC

   If Not (bbtnBorra.Focused) Then
   Begin
      If wFil_Asoc = 'N' Then
         xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND CCOMERID=' + QuotedStr(dblcFPago.Text) + ' AND SCOMERID=' + QuotedStr(DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString)
      Else
         xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND CCOMERID=' + QuotedStr(dblcFPago.Text);
      edtFPago.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE180', '*', xWhere, 'DCCOMDES');

   // Inicio HPC_201801_FAC
   // Se incluye validación de Condición de Pago
      If length(edtFPago.Text)=0 Then
      Begin
         ShowMessage('Condición de Pago incorrecta');
         dblcFPago.SetFocus;
         Exit;
      End;
   // Fin HPC_201801_FAC

      xModo := DMFAC.cdsQry.FieldByName('DCCOMMOD').AsString;
      xPorc := floattostr(DMFAC.cdsQry.FieldByName('DCCOMPORC').AsFloat);
      dbePorcentaje.Text := xPorc;
      If wPolitica1 Then
         xDto01 := DMFAC.cdsQry.FieldByName('DCCOMPORC').AsFloat
      Else
         xDto01 := 0;
      dblcTMon.OnExit(dblcTMon);
   End;
End;

Procedure TFProforma.dblcTTranExit(Sender: TObject);
Begin
   If xCrea Then Exit;

// Inicio HPC_201805_FAC
// Si botón de Clientes tiene foco, sale de este evento
   If btnExec.Focused Then Exit;
// Fin HPC_201805_FAC

   DMFAC.cdsTTran.Setkey;
   DMFAC.cdsTTran.FieldByName('TRIID').AsString := dblcTTran.Text;
   If DMFAC.cdsTTran.GotoKey Then
   Begin
      edtTransaccion.Text := DMFAC.cdsTTran.FieldByName('TRIDES').AsString;
      DMFAC.cdsProforma.Edit;
      DMFAC.cdsProforma.FieldByName('PROFGENFACT').AsString := DMFAC.cdsTTran.FieldByName('TRIGENFACT').AsString;
   End
   Else
   Begin
      If DMFAC.wModo = 'A' Then
         Exit;
      Showmessage('Codigo errado de Transacción');
      dblcTTran.SetFocus;
      exit;
   End;
End;

Procedure TFProforma.dblcTVtaExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;

// Inicio HPC_201805_FAC
// Si botón de Clientes tiene foco, sale de este evento
   If btnExec.Focused Then Exit;
// Fin HPC_201805_FAC

   xWhere := 'CVTAID=' + QuotedStr(dblcTVta.Text);
   edtTVta.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC112', 'CVTADES', xWhere, 'CVTADES');
End;

Procedure TFProforma.dblcTMonExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;

// Inicio HPC_201805_FAC
// Si botón de Clientes tiene foco, sale de este evento
   If btnExec.Focused Then Exit;
// Fin HPC_201805_FAC

   If Not bbtnBorra.Focused Then
   Begin
      xWhere := 'TMONID=' + '''' + dblcTMon.Text + ''' '
         + 'AND (TMON_LOC=' + '''' + 'L' + '''' + ' OR TMON_LOC=' + '''' + 'E' + '''' + ')';
      edtTMon.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
   End;
End;

Procedure TFProforma.FormClose(Sender: TObject; Var Action: TCloseAction);
// Inicio HPC_201801_FAC
// Definición de variable xSQL para cambio de método de eliminación
Var
   xSQL : String;
// Fin HPC_201801_FAC
Begin
   If pnlRegistro.Visible = true Then
   Begin
      Showmessage('Cierre el Panel de Detalle !!!');
      Abort;
   End;

   If pnlDetalleA.Visible = true Then
   Begin
      Showmessage('Cierre el Panel de Detalle !!!');
      Abort;
   End;

   DMFAC.cdsTLista.Filtered := False;
   DMFAC.cdsTLista.Filter := '';
   DMFAC.cdsTLista.Filtered := True;

   xDto01 := 0;
   wFlagCV := False;
   wFlagCVDes := '';
   wFlagPA := False;
   wFlagLC := False;
   wFlagFP := False;
   wPolitica1 := False;
   wPolitica2 := False;
   wbInicio := true;
   wDescAdi := 0;
   wFlagEdi := '';
   xLPrecio := False;
   lblNLugarE.Caption := '';

   pnlRegistro.Visible := False;
   pnlActuali.visible := False;
   xFlagInsert := False;
   DMFAC.cdsAlmacen.Filtered := False;

   If ((DMFAC.wModo = 'A') And (wInserta)) Or (DMFAC.cdsProforma.FieldByName('PROFSIT').AsString = 'TEMPORAL') Then
   Begin
      If DMFAC.cdsDetProf.RecordCount = 0 Then
      Begin
      // Inicio HPC_201805_FAC
      // no puede borrar de memoria antes de borrar físicamente
         //DMFAC.cdsProforma.Delete;

      // Inicio HPC_201801_FAC
      // cambio de método de grabación
      //   DMFAC.ControlTran(9, Nil, '');
         xSQL := 'Delete from DB2ADMIN.FAC311 '
            + '    where CIAID='+quotedstr(DMFAC.cdsProforma.FieldByName('CIAID').AsString)
            + '      and TINID='+quotedstr(DMFAC.cdsProforma.FieldByName('TINID').AsString)
            + '      and ALMID='+quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)
            + '      and PROFID='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString);
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
         Except
            ShowMessage('No se pudo Borra la Proforma al Salir');
            Exit;
         End;
      // Fin HPC_201801_FAC
         DMFAC.cdsProforma.Delete;
      // Fin HPC_201805_FAC
      End
      Else
         DMFAC.cdsProforma.CancelUpdates;
   End
   Else
   Begin
      DMFAC.cdsProforma.CancelUpdates;
   End;

   dblcCia.Enabled := True;
   Screen.Cursor := crDefault;

   DMFAC.cdsQry4.Close;
   Action := CAFree;
End;

// Inicio HPC_201801_FAC
// Se retira líneas de código por RUC de Cliente
(*
Procedure TFProforma.dblcdClieRucExit(Sender: TObject);
Var
   xWhere, xZona, xFono, xDireccion: String;
   xCondP, xSectorCom, xStatus, xCampos, xTipo, xPolit1, xPolit2, xVend: String;
   xCreditoMax, xCreditoDisp, xCreditoUti: double;
   xTPersona, sZona, sZona1: String;
Begin
   If xCrea Then Exit;
   If dblcTClie.Focused Then exit;

   If (Length(dblcdClieRuc.Text) = 0) And (dblcdClie.Focused) Then exit;

   If (Length(dblcdClie.Text) > 0) And (Length(dblcdClieRuc.Text) = 0) Then
      Exit;

   DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEFLAG', 'TCLIEID=' + '''' + dblcTClie.Text + '''', 'TCLIEFLAG');
// Inicio HPC_201701_FAC
// Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
   DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;
// Fin HPC_201701_FAC

   xWhere := 'CLIERUC=' + QuotedStr(dblcdClieRuc.Text);
   xCampos := 'CLIEID, CLIEDES, CLIERUC, CLAUXID, TMONID, CLIECREMAX, CLIECREDISP, CLIECREUTI, ' +
      'ZONVTAID, VEID, SITCLIEID, DESCLIEID, CLIEDIR, CLIETELF, TIPPERID, CLIECOND, TVTAID';
   edtclie.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE204', xCampos, xWhere, 'CLIEDES');
   If length(trim(edtclie.Text)) = 0 Then
   Begin
      dblcdClieRuc.Text := '';
      edtClie.Text := '';
      Showmessage('RUC de Cliente NO encontrado.....!!!');
      dblcdClie.Text := '';
      dblcdClie.SetFocus;
   End;

   // vhndema
   DMFAC.cdsProforma.FieldByName('CLAUXID').AsString := DMFAC.cdsQry.FieldByName('CLAUXID').AsString;
   // end vhndema
   DMFAC.cdsProforma.FieldByName('CLIEID').AsString := DMFAC.cdsQry.FieldByName('CLIEID').AsString;
   DMFAC.cdsProforma.FieldByName('CLIEDES').AsString := edtclie.Text;
   DMFAC.cdsProforma.FieldByName('TIPPERID').AsString := DMFAC.cdsQry.FieldByName('TIPPERID').AsString;
   DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString := DMFAC.cdsQry.FieldByName('TVTAID').AsString;

   If wFil_Asoc = 'N' Then // Clientes sin Asociados
   Begin
      xWhere := 'ClIERUC=' + QuotedStr(dblcdClieRuc.Text);
      xCampos := 'CLIEID, CLIEDES, CLIERUC, CLAUXID, TMONID, CLIECREMAX, CLIECREDISP, CLIECREUTI, '
         + 'ZONVTAID, VEID, SITCLIEID, DESCLIEID, CLIEDIR, CLIETELF, TIPPERID, CLIECOND';
      edtclie.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE204', xCampos, xWhere, 'CLIEDES');
      DMFAC.cdsProforma.FieldByName('CLIEDES').AsString := edtclie.Text;

      If Length(dblcdClie.Text) + length(dblcdClieRuc.Text) > 0 Then
      Begin
         wPolitica1 := False;
         wPolitica2 := False;

         If length(dblcdClieRuc.Text) > 0 Then
         Begin
            If dblcdClieRuc.Text = DMFAC.cdsQry.FieldByName('CLIERUC').AsString Then
            Begin
               If length(DMFAC.cdsQry.FieldByName('VEID').AsString) = 0 Then
               Begin
                  Showmessage('El Cliente no tiene Vendedor asignado!!!');
               End;
               If length(DMFAC.cdsQry.FieldByName('CLIECOND').AsString) = 0 Then
               Begin
                  Showmessage('El Cliente no tiene Condición de Pago!!!');
               End;

               If DMFAC.cdsQry.FieldByName('TIPPERID').AsString = DMFAC.wPJuridica Then
               Begin
                  If length(DMFAC.cdsQry.FieldByName('CLIERUC').AsString) = 0 Then
                  Begin
                     Showmessage('El Cliente no tiene RUC!!!');
                  End;
               End;

               If length(DMFAC.cdsQry.FieldByName('ZONVTAID').AsString) = 0 Then
               Begin
                  Showmessage('El Cliente no tiene Zona Venta!!!');
               End;

               DMFAC.cdsProforma.FieldByName('CLIEID').AsString := DMFAC.cdsQry.FieldByName('CLIEID').AsString;
               DMFAC.cdsProforma.FieldByName('TIPPERID').AsString := DMFAC.cdsQry.FieldByName('TIPPERID').AsString;
               xClAux := DMFAC.cdsQry.FieldByName('CLAUXID').AsString;
               xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND CLIEID=' + QuotedStr(dblcdClie.Text);
               Filtracds(DMFAC.cdsDireccion, 'SELECT * FROM FAC110 WHERE ' + xWhere + ' ORDER BY CLIEDIRID'); //Lugar de entrega 08/03
               lblNLugarE.Caption := floattostr(DMFAC.cdsDireccion.RecordCount);
               DMFAC.cdsDireccion.IndexFieldNames := 'CIAID;CLIEID;CLIEDIRID';

               xCreditoMax := DMFAC.cdsQry.FieldByName('CLIECREMAX').Asfloat; //Linea asignada
               xCondP := DMFAC.cdsQry.FieldByName('CLIECOND').AsString;
               xZona := DMFAC.cdsQry.FieldByName('ZONVTAID').AsString;
               xVend := DMFAC.cdsQry.FieldByName('VEID').AsString;
               xDireccion := DMFAC.cdsQry.FieldByName('CLIEDIR').AsString;
               xFono := DMFAC.cdsQry.FieldByName('CLIETELF').AsString;
               xStatus := DMFAC.cdsQry.FieldByName('SITCLIEID').AsString;
               xTipo := DMFAC.cdsQry.FieldByName('DESCLIEID').AsString;
               xTMonLCred := DMFAC.cdsQry.FieldByName('TMONID').AsString;
               edtdireccion.Text := xDireccion;
               DMFAC.cdsProforma.FieldByName('VEID').AsString := xVend;

               //CuentaCte;
               If xTMonLCred = DMFAC.wTMonLoc Then
                  xCreditoUti := xxMtoUtiMN //Linea Utilizada
               Else
                  If xTMonLCred = DMFAC.wTMonExt Then
                     xCreditoUti := xxMtoUtiME //Linea Utilizada
                  Else
                     xCreditoUti := xxMtoUtiME; //Linea Utilizada

               xCreditoDisp := FRound(xCreditoMax - xCreditoUti, 15, 4); //Linea Disponible}
               dbeFono.Text := xFono;
               dblcZona.Text := xZona;
               sZona := DMFAC.BuscaQry('dspUltTGE', 'FAC106', 'TVTAID', 'ZVTAID=' + QuotedStr(xZona), 'TVTAID');
               sZona1 := DMFAC.BuscaQry('dspUltTGE', 'FAC105', 'TVTAFLAG', 'TVTAID=' + QuotedStr(sZona), 'TVTAFLAG');
               dbeEmbalaje.visible := (sZona1 = 'P');
               lblEmb.visible := (sZona1 = 'P');
               dblcAgencia.visible := (sZona1 = 'P');
               edtAgencia.visible := (sZona1 = 'P');
               lblAgencia.visible := (sZona1 = 'P');

               xWhere := 'TIPPERID=' + QuotedStr(DMFAC.cdsProforma.FieldByName('TIPPERID').AsString);
               xTPersona := DMFAC.BuscaQry('dspUltTGE', 'TGE109', 'TIPPERS', xWhere, 'TIPPERS');

               xWhere := 'DESCLIEID=' + QuotedStr(xTipo);
               xPolit1 := DMFAC.BuscaQry('dspUltTGE', 'FAC115', ' DESCLIEPL1,DESCLIEPL2,DESCLIEPOR ', xWhere, 'DESCLIEPL1');
               xPolit2 := DMFAC.cdsQry.FieldByName('DESCLIEPL2').AsString;
               wDescAdi := DMFAC.cdsQry.FieldByName('DESCLIEPOR').AsFloat; //Descuento Adicional
               If (xPolit1 = 'S') Then
                  wPolitica1 := true; //Para Politica de Descuentos

               If (xPolit2 = 'S') Then
                  wPolitica2 := true; //Para Descuentos de Forma de Pago

               xSectorCom := copy(xZona, 1, 2);

               xWhere := '( SCOMERID = ' + Quotedstr(xSectorCom) +
                  ') AND (' + DMFAC.wReplacCeros + '(DCCOMFLAG,'''') <>' + Quotedstr('A') + ')';
               Filtracds(DMFAC.cdsDscto, 'SELECT CCOMERID,DCCOMDES FROM TGE180 WHERE ' + xwhere + ' ORDER BY CCOMERID');

               DMFAC.cdsProforma.Edit;
               DMFAC.cdsProforma.FieldByName('CLIECREMAX').AsFloat := FRound(xCreditoDisp, 15, 4);
               DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString := xSectorCom;
               DMFAC.cdsProforma.FieldByName('TRIID').AsString := DMFAC.wTransVta;
               dcDireccion;
               dcAlmacen;
               dcLPrecio;
            End;
         End;
      End;
   End
   Else
   // Inicio HPC_201701_FAC
   // Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
      If DMFAC.xTipCli = 'S' Then
  // Fin HPC_201701_FAC
      Begin
         Filtracds(DMFAC.cdsDscto, 'SELECT CCOMERID, DCCOMDES, DCCOMABR FROM TGE180 WHERE CIAID=' + QuotedStr(dblcCia.text) + ' ORDER BY CCOMERID');
         Filtracds(DMFAC.cdsDireccion, 'SELECT * FROM FAC110 WHERE CIAID=' + QuotedStr(dblcCia.text) + ' AND CLIEID=' + QuotedStr(dblcdClie.Text) + ' ORDER BY CLIEDIRID'); //Lugar de entrega 08/03
      End;
End;
*)
// Fin HPC_201801_FAC

Procedure TFProforma.btnExecClick(Sender: TObject);
// Inicio FAC-201806
// 26/10/2018 variable para Script que prefiltra Maestro de Clientes
var
   xSQL : String;
// Fin FAC-201806
Begin
// Inicio FAC-201806
// 26/10/2018 Prefiltra Maestro de Clientes para mejorar tiempo de respuesta
   xSQL := 'Select TDOC_ID_SUNAT, NUMDOCID, TIPPERID, CLAUXID, CLIEID, CLIEDNI, CLIERUC, CLIEAPEPAT, CLIEAPEMAT, CLIENOMBRE, '
      + '          CLIENOMBRE1, CLIEDES, CLIEABR, CLIEDIR, PAISID, DPTOID, CIUDID, CLIECZIP, CLIETELF, CLIEFAX, CLIEEMAI, '
      + '          CLIEDIRLEG, CIAID, CLIESALL, CLIEREPR, CLIESALE, CLIEGARAN, CLASIFID, CLIECONTAC, CLIEGIRA, VEID, GIROID, '
      + '          CLIECOND, CLIELISPRE, VINCID, CLIECAPSOC, CLIEDIREC, CLIEGGRAL, CLIEGADM, CLIECGRAL, CLIESECECO, SECECOID, '
      + '          CONDPID, CLIECANTAT, CLIECANTPE, CLIEMPEDME, CLIEMPEDMN, CLIEMATEMN, CLIEMATEME, CLIECANTFA, CLIEMFACMN, '
      + '          CLIEMFACME, TMONID, ZONVTAID, CLIEFLAGCR, SITCLIEID, DESCLIEID, CLIECREUTI, GRUPOID, CLIECONDFE, TVTAID, '
      + '          USERID, FREG, HREG, TLISTAID, CLIEINTER, AVALNOMB, AVALDIR, AVALTEL, AVALDOC, AVALTELF, CLIECREMIN, CLIECREMAX, '
      + '          CLIECREDISP, VEIDNW, ZONVTANW, FLAGMOV, CLIECODMOD, USEID, CLIECODAUX, CIUUID, FLAGVAR, ACTIVO, FECCREA, USUCREA '
      + '     from DB2ADMIN.TGE204 '
      + '    where 1<>1';
// Fin FAC-201806

// Inicio HPC_201801_FAC
// Se fuerza la búsqueda en el el Maestro de Clientes
   DMFAC.xTipCli := 'S';
//   dblcdClie.Enabled := False;
   edtClie.Enabled := False;
   dblcdAso.ReadOnly := True;

   wFormaOrigen := 'PROFORMA';
   MtxAsocia := TMant.Create(Application);
   FToolAportes := TFToolAportes.Create(Application);
   Try
      MtxAsocia.User := DMFAC.wUsuario;
      MtxAsocia.Admin := DMFAC.wAdmin;
      MtxAsocia.Module := DMFAC.wModulo;
      MtxAsocia.DComC := DMFAC.DCOM1;
      MtxAsocia.OnCreateMant := FRegistros.ToolAsociaCreate;
      MtxAsocia.TableName := 'TGE204';
      MtxAsocia.ClientDataSet := DMFAC.cdsAsocia;
      MtxAsocia.Filter := '';
      MtxAsocia.Titulo := 'Maestro de Clientes';
      MtxAsocia.OnInsert := Nil;
      MtxAsocia.OnEdit := FRegistros.OnEditCliente; // FProforma.OnEditAsoCta;
      MtxAsocia.OnDelete := Nil;
      MtxAsocia.OnShow := Nil;
      MtxAsocia.SectionName := 'BuscaApo';
      MtxAsocia.FileNameIni := '\oaFac.ini';
   // Inicio FAC-201806
   // 26/10/2018 Prefiltra Maestro de Clientes para mejorar tiempo de respuesta
      MtxAsocia.UsuarioSQL.Add(xSQL);
   // Fin FAC-201806
      MtxAsocia.Execute;
// Fin HPC_201801_FAC
   Finally
   End;
End;

// Inicio HPC_201801_FAC
// cambios para Maestro de Clientes
Procedure TFProforma.OnEditAsoCta(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
{
   If MtxAsocia.FMant.cds2.RecordCount = 0 Then
   Begin
      ShowMessage('No existen Asociados para asignar');
      exit;
   End;
   DMFAC.cdsProforma.FieldByName('CLIEID').AsString := MantFields.FieldByName('ASOID').AsString;
   dblcdAso.Text := MantFields.FieldByName('ASOID').AsString;
   dblcdAsoExit(Sender);
   TMant(Sender).FMant.Close;
   dblcdAso.SetFocus;
}
   If MtxAsocia.FMant.cds2.RecordCount = 0 Then
   Begin
      ShowMessage('No existen Clientes para asignar');
      exit;
   End;

   DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEID, TCLIEFLAG, TCLIEDES', 'CLAUXID=' + quotedstr(MantFields.FieldByName('CLAUXID').AsString), 'TCLIEFLAG');
   DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;

   dblcTClie.Text := DMFAC.cdsQry.FieldByName('TCLIEID').AsString;
   edtTClie.Text  := DMFAC.cdsQry.FieldByName('TCLIEDES').AsString;

   If DMFAC.cdsProforma.State=dsBrowse then DMFAC.cdsProforma.Edit; 
   DMFAC.cdsProforma.FieldByName('CLIEID').AsString := MantFields.FieldByName('CLIEID').AsString;
   DMFAC.xgClAuxId := MantFields.FieldByName('CLAUXID').AsString;
   dblcdAso.Text := MantFields.FieldByName('CLIEID').AsString;
   dblcdAsoExit(Sender);
   TMant(Sender).FMant.Close;
   If length(dblcdAso.Text)>0 then
      meNoPedido.SetFocus
   Else
      btnExec.SetFocus;
// Fin HPC_201801_FAC
End;

Procedure TFProforma.FormCreate(Sender: TObject);
Begin
   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');
   DMFAC.FiltraTabla(DMFAC.cdsTClie, 'FAC121', 'TCLIEID');
   DMFAC.FiltraTabla(DMFAC.cdsAlmacen, 'TGE151', 'ALMID', 'ALMVTA=''S'' ');
   DMFAC.FiltraTabla(DMFAC.cdsTLista, 'FAC101', 'TLISTAID');
   DMFAC.FiltraTabla(DMFAC.cdsTMon, 'TGE103', 'TMONID');
   DMFAC.FiltraTabla(DMFAC.cdsCanal, 'FAC112', 'CVTAID');

   Filtracds(DMFAC.cdsTDoc, 'SELECT * FROM TGE110 WHERE DOCMOD =''CXC'' AND (DOCTIPREG=''F'' OR DOCTIPREG=''B'')');

   DMFAC.cdsTInven.close;
   DMFAC.cdsTInven.DataRequest('SELECT * FROM TGE152 WHERE TINVENTAS=''S'' ');
   DMFAC.cdsTInven.open;

   DMFAC.FiltraTabla(DMFAC.cdsTipSol, 'TGE173', 'TIPOADQ');
   DMFAC.cdsTipSol.Filter := 'FLAG=''S'' ';
   DMFAC.cdsTipSol.Filtered := True;
   DMFAC.cdsTipSol.IndexFieldNames := 'TIPOADQ';

   dblcTInv.DataSource := DMFAC.dsProforma;
   dblcTInv.DataField := 'TINID';

   dblcAlmacen.DataSource := DMFAC.dsProforma;
   dblcAlmacen.DataField := 'ALMID';

   Left := 220;
End;

Procedure TFProforma.dtpFVcmtoExit(Sender: TObject);
Begin
   If xCrea Then Exit;

// Inicio HPC_201805_FAC
// Si botón de Clientes tiene foco, sale de este evento
   If btnExec.Focused Then Exit;
// Fin HPC_201805_FAC

   If Not (bbtnBorra.Focused) Then
   Begin
      If dtpFPed.Date > dtpFVcmto.Date Then
      Begin
         dtpFVcmto.Date := dtpFPed.Date;
         dtpFVcmto.setfocus;
         Raise exception.Create('Error: F.Entrega debe ser mayor/igual' + #13 + ' a la Fecha de Emisión');
      End;

      If dtpFVcmto.Date = 0 Then
      Begin
         ShowMessage('Error: Falta Fecha de Entrega');
         dtpFVcmto.SetFocus;
         exit;
      End;
   End;
End;

Procedure TFProforma.dbeGarantiaKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In ['A'..'Z', 'a'..'z',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '.', '-', '_'] Then
      Key := #0;
End;

Procedure TFProforma.dbePorcentajeKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In ['A'..'Z', 'a'..'z',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '-', '_'] Then
      Key := #0;
End;

Procedure TFProforma.dbePorcentajeExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If StrToFloat(dbePorcentaje.Text) > 100 Then
   Begin
      Beep;
      MessageDlg('El Descuento NO puede ser Mayor que 100', mtInformation, [mbOk], 0);
      dbePorcentaje.Text := '0.00';
      dbePorcentaje.SetFocus;
      Exit;
   End;
End;

Procedure TFProforma.meNoPedidoExit(Sender: TObject);
Var
   xxNoReg: String;
// Inicio HPC_201801_FAC
// variable para ejecutar script de actualización
   xSQL : String;
// Fin HPC_201801_FAC
Begin
   If xCrea Then Exit;

   If bbtnBorra.Focused Then exit;

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
//   If btnExec.Focused Then Exit;
   If length(trim(edtClie.Text))=0 Then
   Begin
//      If not btnExec.Focused Then
//      Begin
         btnExec.SetFocus;
//         btnExecClick(Self);
         Exit;
//      End;
   End;
(*
   If length(trim(meNoPedido.Text)) = 0 Then
   Begin
      DMFAC.cdsProforma.FieldByName('PROFID').AsString := DMFAC.Strzero(DMFAC.MaxProf(dblcCia.Text, dblcLocal.Text),
         DMFAC.cdsProforma.FieldByName('PROFID').Size);
   End;

   DMFAC.cdsProforma.FieldByName('PROFID').AsString := DMFAC.Strzero(DMFAC.cdsProforma.FieldByName('PROFID').AsString,
      DMFAC.cdsProforma.FieldByName('PROFID').Size);

// Inicio HPC_201801_FAC
// Se retira componente dblcdClie, se deja componente dblcdAso
//   If DMFAC.BuscaFacPro(dblcCia.Text, dblcdClie.Text, meNoPedido.Text, xClaux) Then
   If DMFAC.BuscaFacPro(dblcCia.Text, dblcdAso.Text, meNoPedido.Text, xClaux) Then
// Fin HPC_201801_FAC
   Begin
      meNoPedido.SetFocus;
      ShowMessage('Error: No.de Proforma Duplicado');
      DMFAC.cdsProforma.FieldByName('PROFID').AsString := DMFAC.Strzero(DMFAC.MaxProf(dblcCia.Text, dblcLocal.Text),
         DMFAC.cdsProforma.FieldByName('PROFID').Size);
      exit;
   End
   Else
   Begin
      DMFAC.cdsProforma.FieldByName('CLAUXID').AsString := xClaux;
      DMFAC.cdsProforma.FieldByName('PROFSIT').AsString := 'TEMPORAL';
      dtpFPed.Date := DMFAC.DateS; // fecha de la proforma
      dtpFVcmto.Date := DMFAC.DateS; // fecha de entrega o vencimiento
      If Length(Trim(dbmObs.Text)) > 0 Then
         DMFAC.cdsProforma.FieldByName('FACOBS').AsString := dbmObs.Text
      Else
         DMFAC.cdsProforma.FieldByName('FACOBS').AsString := '.';

   // Inicio HPC_201801_FAC
   // cambio de método de grabación a Proforma
   //   DMFAC.cdsPost(DMFAC.cdsProforma);
      DMFAC.cdsProforma.Post;
//      DMFAC.cdsProforma.DataRequest('SELECT * FROM FAC311 WHERE PROFID='+Quotedstr(meNoPedido.text));
   //   DMFAC.ControlTran(9, DMFAC.cdsProforma, 'PROF');
      If DMFAC.wModo = 'A' Then
      Begin
         xSQL := 'Insert into DB2ADMIN.FAC311(CIAID, LOCID, TINID, ALMID, PROFID, PROFESTADO, TRIID, CLAUXID, CLIEID, PROFTCLI, '
            + '                               TIPOADQ) '
            + '   Values('
            +             quotedstr(DMFAC.cdsProforma.FieldByName('CIAID').AsString)+', '
            +             quotedstr(DMFAC.cdsProforma.FieldByName('LOCID').AsString)+', '
            +             quotedstr(DMFAC.cdsProforma.FieldByName('TINID').AsString)+', '
            +             quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)+', '
            +             quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString)+', '
            +             quotedstr('VENTAS')+', '
            +             quotedstr('04')+', '
            +             quotedstr(DMFAC.cdsProforma.FieldByName('CLAUXID').AsString)+', '
            +             quotedstr(DMFAC.cdsProforma.FieldByName('CLIEID').AsString)+', '
            +             quotedstr(DMFAC.cdsProforma.FieldByName('PROFTCLI').AsString)+', '
            +             quotedstr(DMFAC.cdsProforma.FieldByName('TIPOADQ').AsString)+' '
            +            ') ';
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
         Except
            ShowMessage('No se pudo añadir la Proforma, reintente!');
            meNoPedido.SetFocus;
            Exit;
         End;
      End;
   // Fin HPC_201801_FAC
   End;
*)
   If DMFAC.cdsProforma.State = dsBrowse then
      DMFAC.cdsProforma.Edit;
   If length(trim(meNoPedido.Text)) = 0 Then
   Begin
      xSQL := 'Select FN_FAC_NUEVO_NRO_PROF('
         +            quotedstr(DMFAC.cdsProforma.FieldByName('CIAID').AsString)+','
         +            quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)+') RESULTADO'
         + '     from DUAL';
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      DMFAC.cdsProforma.FieldByName('PROFID').AsString := DMFAC.cdsQry.FieldByName('RESULTADO').AsString;
   // Inicio FAC-201806
   // 29/10/2018 asigna a variable el valor del campo Nro de Proforma
      meNoPedido.Text := DMFAC.cdsProforma.FieldByName('PROFID').AsString;
   // Fin FAC-201806
      xSQL := 'Insert into DB2ADMIN.FAC311(CIAID, LOCID, TINID, ALMID, PROFID, PROFESTADO, TRIID, CLAUXID, CLIEID, PROFTCLI, '
         + '                               TIPOADQ) '
         + '   Values('
         +             quotedstr(DMFAC.cdsProforma.FieldByName('CIAID').AsString)+', '
         +             quotedstr(DMFAC.cdsProforma.FieldByName('LOCID').AsString)+', '
         +             quotedstr(DMFAC.cdsProforma.FieldByName('TINID').AsString)+', '
         +             quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)+', '
         +             quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString)+', '
         +             quotedstr('VENTAS')+', '
         +             quotedstr('04')+', '
         +             quotedstr(DMFAC.cdsProforma.FieldByName('CLAUXID').AsString)+', '
         +             quotedstr(DMFAC.cdsProforma.FieldByName('CLIEID').AsString)+', '
         +             quotedstr(DMFAC.cdsProforma.FieldByName('PROFTCLI').AsString)+', '
         +             quotedstr(DMFAC.cdsProforma.FieldByName('TIPOADQ').AsString)+' '
         +            ') ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
      Except
         ShowMessage('No se pudo añadir la Proforma, reintente!');
         meNoPedido.SetFocus;
         Exit;
      End;
   End;

   DMFAC.cdsProforma.FieldByName('PROFID').AsString := DMFAC.Strzero(DMFAC.cdsProforma.FieldByName('PROFID').AsString,
      DMFAC.cdsProforma.FieldByName('PROFID').Size);

   DMFAC.cdsProforma.FieldByName('CLAUXID').AsString := xClaux;
   DMFAC.cdsProforma.FieldByName('PROFSIT').AsString := 'TEMPORAL';
   dtpFPed.Date := DMFAC.DateS; // fecha de la proforma
   dtpFVcmto.Date := DMFAC.DateS; // fecha de entrega o vencimiento
   If Length(Trim(dbmObs.Text)) > 0 Then
      DMFAC.cdsProforma.FieldByName('FACOBS').AsString := dbmObs.Text
   Else
      DMFAC.cdsProforma.FieldByName('FACOBS').AsString := '.';

   DMFAC.cdsProforma.Post;

// Fin HPC_201805_FAC

   dtpFPed.OnExit(dtpFPed);
   dblcFPago.SetFocus;
End;

Procedure TFProforma.dbeTCambioKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In ['A'..'Z', 'a'..'z',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '-', '_'] Then
      Key := #0;
End;

Procedure TFProforma.dbeCreditoExit(Sender: TObject);
Begin
   If xCrea Then Exit;

// Inicio HPC_201805_FAC
// Si botón de Clientes tiene foco, sale de este evento
   If btnExec.Focused Then Exit;
// Fin HPC_201805_FAC

End;

Procedure TFProforma.dbeFonoExit(Sender: TObject);
Begin
   If xCrea Then Exit;
End;

Procedure TFProforma.dblcAgenciaDropDown(Sender: TObject);
Begin
   DMFAC.cdsEmpresa.indexfieldnames := 'EMPNOMBRES';
End;

Procedure TFProforma.dblcAgenciaExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   xWhere := 'EMPID=' + QuotedStr(dblcAgencia.Text);
   edtAgencia.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC104', 'EMPNOMBRES', xWhere, 'EMPNOMBRES');
End;

Procedure TFProforma.dbeEmbalajeExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If DMFAC.cdsProforma.FieldByName('PROFEMBMO').AsFloat = 0 Then
   Begin
      DMFAC.cdsProforma.EDIT;
      DMFAC.cdsProforma.FieldByName('EMPID').AsString := DMFAC.BuscaQry('dspUltTGE', 'FAC104', 'EMPID,EMPNOMBRES', 'EMPFLAGP=' + QuotedStr('C'), 'EMPID');
      edtAgencia.text := DMFAC.cdsQry.FieldByName('EMPNOMBRES').AsString;
   End;
End;

Procedure TFProforma.dbeEmbalajeKeyPress(Sender: TObject; Var Key: Char);
Var
   sC: String;
Begin
   sC := Key;
   sC := Uppercase(sC);
   Key := sC[1];
End;

Procedure TFProforma.bbtnokClick(Sender: TObject);
Var
   xFiltro, xWhere, xSQL, sAlmacen: String;
   xTotal, xPrecio, xTCambio, xTotImp1, xTotImp2: Double;
   wMes, wDia: Word;
   xImporte, xDscto1, xStotal, xDscto2, xPVentaTot, xImp1, xImp2: Double;
   Y, M, D: word;
   wAnoMes: String;
Begin
   If (sTipoRQS = 'C') And
      ((DMFAC.cdsProforma.FieldByName('TINID').AsString = '00') Or
      (DMFAC.cdsProforma.FieldByName('ALMID').AsString = '00')) Then
   Begin
      ShowMessage('Es necesario indicar el Tipo de Inventario y el Punto de Venta');
      dblcTInv.Enabled := True;
      dblcAlmacen.Enabled := True;
      dblcTInv.SetFocus;
      exit;
   End;

   xWhere := 'TMONID =' + QuotedStr(DMFAC.wTMonExt)
      + ' AND FECHA = ' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpFPed.Date) + '''' + ')';
   If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xWhere, 'TMONID')) > 0 Then
      xTCambio := DMFAC.cdsQry.FieldByName('TCAMVBV').AsFloat
   Else
   Begin
      dtpFPed.SetFocus;
      Showmessage('Error :  Fecha No tiene Tipo de Cambio ');
      exit;
   End;

   DecodeDate(dtpFPed.Date, Y, M, D);

   If dtpFPed.Date > dtpFVcmto.Date Then
   Begin
      Raise exception.Create('Error: F.Entrega debe ser mayor o igual' + #13 + ' a la Fecha de Emisión');
   End;

   If dtpFPed.Date <= (DMFAC.DateS - StrtoFloat(wCie_Ant)) Then
   Begin
      ErrorMsg(Caption, 'No Puede Registrar el Documento con Fecha anterior a' + datetostr(DMFAC.DateS - StrtoFloat(wCie_Ant)));
      Exit;
   End;

   If dtpFPed.Date > (DMFAC.DateS + StrtoFloat(wCie_Des)) Then
   Begin
      ErrorMsg(Caption, 'No Puede Registrar el Documento con Fecha posterior a' + datetostr(DMFAC.DateS + StrtoFloat(wCie_Des)));
      Exit;
   End;

   DecodeDate(dtpFPed.Date, wAno, wMes, wDia);
   wAnoMes := inttostr(wAno) + DMFAC.Strzero(inttostr(wMes), 2);
   sTipoRQS := dblcTipoCompra.Text; // DMFAC.BuscaQry('dspUltTGE','TGE173','TIPOADQ','TRQSID='+quotedStr(dblcTipoCompra.text),'TIPOADQ');

   DMFAC.cdsTLPrecio.Filtered := False;
   DMFAC.cdsTLPrecio.Filter := 'TLISTAID=' + Quotedstr(dblcLPrecio.Text) + ' AND CIAID=' + Quotedstr(dblcCia.Text) + ' AND TINID=' + Quotedstr(dblcTInv.Text);
   DMFAC.cdsTLPrecio.Filtered := true;

   If length(edtLPrecio.Text) > 0 Then
      xLPrecio := true;

   If Not Consistencia Then Exit;

   Screen.Cursor := crHourGlass;

// Inicio HPC_201801_FAC
// Se cambia forma de grabación de la Proforma
   If DMFAC.cdsProforma.State = dsBrowse Then
      DMFAC.cdsProforma.Edit;
{
   If DMFAC.wModo = 'A' Then
   Begin
      If DMFAC.BuscaFecha('TGE114', 'FECANO', 'FECHA', dtpFPed.date) Then
      Begin
         DMFAC.cdsProforma.Edit;
         DMFAC.cdsProforma.FieldByName('PROFAAAA').AsString := DMFAC.cdsUltTGE.FieldByName('FECANO').AsString; // ano
         DMFAC.cdsProforma.FieldByName('PROFMM').AsString := DMFAC.cdsUltTGE.FieldByName('FECMES').AsString; // mes
         DMFAC.cdsProforma.FieldByName('PROFDD').AsString := DMFAC.cdsUltTGE.FieldByName('FECDIA').AsString; // día
         DMFAC.cdsProforma.FieldByName('PROFTRI').AsString := DMFAC.cdsUltTGE.FieldByName('FECTRIM').AsString; // trimestre
         DMFAC.cdsProforma.FieldByName('PROFDSEM').AsString := DMFAC.cdsUltTGE.FieldByName('FECSEM').AsString; // semestre
         DMFAC.cdsProforma.FieldByName('PROFSS').AsString := DMFAC.cdsUltTGE.FieldByName('FECSS').AsString; // semana
         DMFAC.cdsProforma.FieldByName('PROFAATRI').AsString := DMFAC.cdsUltTGE.FieldByName('FECAATRI').AsString; // año+trimestre
         DMFAC.cdsProforma.FieldByName('PROFAASEM').AsString := DMFAC.cdsUltTGE.FieldByName('FECAASEM').AsString; // año+semestre
         DMFAC.cdsProforma.FieldByName('PROFAASS').AsString := DMFAC.cdsUltTGE.FieldByName('FECAASS').AsString; // año+semana
      End;
      DMFAC.cdsProforma.FieldByName('PROFUSER').AsString := DMFAC.wUsuario;
      DMFAC.cdsProforma.FieldByName('PROFFECHA').value := dtpFPed.Date;
      DMFAC.cdsProforma.FieldByName('PROFFECENT').value := dtpFVcmto.Date;
      DMFAC.cdsProforma.FieldByName('PROFFREG').value := DMFAC.Dates;
      DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString := 'N';
      DMFAC.cdsProforma.FieldByName('PROFESTADO').AsString := 'VENTAS';
      DMFAC.cdsProforma.FieldByName('PROFSIT').AsString := 'INICIAL';
      DMFAC.cdsProforma.FieldByName('CLAUXID').AsString := xClAux;
      DMFAC.cdsProforma.FieldByName('TLISTAID').AsString := dblcLPrecio.Text;
      If Length(Trim(DMFAC.cdsProforma.FieldByName('PROFDIRENT').AsString)) = 0 Then
         DMFAC.cdsProforma.FieldByName('PROFDIRENT').AsString := edtLentrega.Text;
      If (DMFAC.SRV_D = 'DB2NT') Or (DMFAC.SRV_D = 'DB2400') Then
         DMFAC.cdsProforma.FieldByName('PROFHREG').value := Time
      Else
         If DMFAC.SRV_D = 'ORACLE' Then
            DMFAC.cdsProforma.FieldByName('PROFHREG').value := DMFAC.DateS;
   End
   Else
   Begin
      If DMFAC.wModo = 'M' Then
      Begin
         DMFAC.cdsProforma.FieldByName('PROFUSER').AsString := DMFAC.wUsuario;
         DMFAC.cdsProforma.FieldByName('PROFFECHA').value := dtpFPed.Date;
         DMFAC.cdsProforma.FieldByName('PROFFECENT').value := dtpFVcmto.Date;
         DMFAC.cdsProforma.FieldByName('PROFFREG').value := DMFAC.Dates;
         DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString := 'N';
         DMFAC.cdsProforma.FieldByName('CLAUXID').AsString := xClAux;
         If Length(Trim(DMFAC.cdsProforma.FieldByName('PROFDIRENT').AsString)) = 0 Then
            DMFAC.cdsProforma.FieldByName('PROFDIRENT').AsString := edtLentrega.Text;
         If (DMFAC.SRV_D = 'DB2NT') Or (DMFAC.SRV_D = 'DB2400') Then
            DMFAC.cdsProforma.FieldByName('PROFHREG').value := Time
         Else
            If DMFAC.SRV_D = 'ORACLE' Then
               DMFAC.cdsProforma.FieldByName('PROFHREG').value := DMFAC.DateS;
      End;
   End;
   DMFAC.cdsPost(DMFAC.cdsProforma);

   xFiltro := 'SELECT * FROM FAC311 WHERE CIAID=''' + dblcCia.Text + ''' and PROFID=' + Quotedstr(meNoPedido.text);
   DMFAC.cdsProforma.DataRequest(xFiltro);
   DMFAC.ControlTran(9, DMFAC.cdsProforma, 'PROF');
}
   If length(DMFAC.cdsProforma.FieldByName('PROFAAAA').AsString)=0 Then
   Begin
      If DMFAC.BuscaFecha('TGE114', 'FECANO', 'FECHA', dtpFPed.date) Then
      Begin
         DMFAC.cdsProforma.FieldByName('PROFAAAA').AsString := DMFAC.cdsUltTGE.FieldByName('FECANO').AsString; // ano
         DMFAC.cdsProforma.FieldByName('PROFMM').AsString := DMFAC.cdsUltTGE.FieldByName('FECMES').AsString; // mes
         DMFAC.cdsProforma.FieldByName('PROFDD').AsString := DMFAC.cdsUltTGE.FieldByName('FECDIA').AsString; // día
         DMFAC.cdsProforma.FieldByName('PROFTRI').AsString := DMFAC.cdsUltTGE.FieldByName('FECTRIM').AsString; // trimestre
         DMFAC.cdsProforma.FieldByName('PROFDSEM').AsString := DMFAC.cdsUltTGE.FieldByName('FECSEM').AsString; // semestre
         DMFAC.cdsProforma.FieldByName('PROFSS').AsString := DMFAC.cdsUltTGE.FieldByName('FECSS').AsString; // semana
         DMFAC.cdsProforma.FieldByName('PROFAATRI').AsString := DMFAC.cdsUltTGE.FieldByName('FECAATRI').AsString; // año+trimestre
         DMFAC.cdsProforma.FieldByName('PROFAASEM').AsString := DMFAC.cdsUltTGE.FieldByName('FECAASEM').AsString; // año+semestre
         DMFAC.cdsProforma.FieldByName('PROFAASS').AsString := DMFAC.cdsUltTGE.FieldByName('FECAASS').AsString; // año+semana
         DMFAC.cdsProforma.FieldByName('PROFANOMES').AsString := DMFAC.cdsUltTGE.FieldByName('FECANO').AsString
                                                                +DMFAC.cdsUltTGE.FieldByName('FECMES').AsString; // año+mes
      End;
   End;
   DMFAC.cdsProforma.FieldByName('PROFFECHA').value := dtpFPed.Date;
   DMFAC.cdsProforma.FieldByName('PROFFECENT').value := dtpFVcmto.Date;
   DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString := 'N';
   DMFAC.cdsProforma.FieldByName('PROFESTADO').AsString := 'VENTAS';
   DMFAC.cdsProforma.FieldByName('PROFSIT').AsString := 'INICIAL';
   DMFAC.cdsProforma.FieldByName('CLAUXID').AsString := xClAux;
   DMFAC.cdsProforma.FieldByName('TLISTAID').AsString := dblcLPrecio.Text;
   If Length(Trim(DMFAC.cdsProforma.FieldByName('PROFDIRENT').AsString)) = 0 Then
      DMFAC.cdsProforma.FieldByName('PROFDIRENT').AsString := edtLentrega.Text;
   If Length(Trim(dbmObs.Text)) > 0 Then
      DMFAC.cdsProforma.FieldByName('FACOBS').AsString := dbmObs.Text
   Else
      DMFAC.cdsProforma.FieldByName('FACOBS').AsString := '.';
   DMFAC.cdsProforma.FieldByName('PROFFREG').value := DMFAC.Dates;
   DMFAC.cdsProforma.FieldByName('PROFHREG').value := DMFAC.DateS;
   DMFAC.cdsProforma.FieldByName('PROFUSER').AsString := DMFAC.wUsuario;
   DMFAC.cdsProforma.Post;

   xSQL := 'Update DB2ADMIN.FAC311 '
      + '      Set CLIERUC   ='+quotedstr(DMFAC.cdsProforma.FieldByName('CLIERUC').AsString)+','
      + '          VEID      ='+quotedstr(DMFAC.cdsProforma.FieldByName('VEID').AsString)+','
      + '          FPAGOID   ='+quotedstr(DMFAC.cdsProforma.FieldByName('FPAGOID').AsString)+','
      + '          TMONID    ='+quotedstr(DMFAC.cdsProforma.FieldByName('TMONID').AsString)+','
      + '          PROFTCAM  ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat)+','
      + '          TIPVTAID  ='+quotedstr(DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString)+','
      + '          PROFANOMES='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFANOMES').AsString)+','
      + '          PROFAAAA  ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFAAAA').AsString)+','
      + '          PROFMM    ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFMM').AsString)+','
      + '          PROFDD    ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFDD').AsString)+','
      + '          PROFTRI   ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFTRI').AsString)+','
      + '          PROFDSEM  ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFDSEM').AsString)+','
      + '          PROFSS    ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFSS').AsString)+','
      + '          PROFAATRI ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFAATRI').AsString)+','
      + '          PROFAASEM ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFAASEM').AsString)+','
      + '          PROFAASS  ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFAASS').AsString)+','
      + '          PROFFECHA ='+quotedstr(datetostr(DMFAC.cdsProforma.FieldByName('PROFFECHA').AsDateTime))+','
      + '          PROFFECENT='+quotedstr(datetostr(DMFAC.cdsProforma.FieldByName('PROFFECENT').AsDateTime))+','
      + '          PROFFLAGD ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString)+','
      + '          PROFESTADO='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFESTADO').AsString)+','
      + '          PROFSIT   ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFSIT').AsString)+','
      + '          CLAUXID   ='+quotedstr(DMFAC.cdsProforma.FieldByName('CLAUXID').AsString)+','
      + '          TLISTAID  ='+quotedstr(DMFAC.cdsProforma.FieldByName('TLISTAID').AsString)+','
      + '          PROFDIRENT='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFDIRENT').AsString)+','
      + '          FACOBS    ='+quotedstr(DMFAC.cdsProforma.FieldByName('FACOBS').AsString)+','
      + '          PROFUSER  ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFUSER').AsString)+','
      + '          PROFFREG  = trunc(Sysdate), '
      + '          PROFHREG  = Sysdate '
      + '    where CIAID='+quotedstr(DMFAC.cdsProforma.FieldByName('CIAID').AsString)
      + '      and TINID='+quotedstr(DMFAC.cdsProforma.FieldByName('TINID').AsString)
      + '      and ALMID='+quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)
      + '      and PROFID='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
   Except
      ShowMessage('No se pudo actualizar la Proforma, reintente!');
      bbtnok.SetFocus;
      Exit;
   End;

// Se retira componente dblcdClie, se deja componente dblcdAso
{
   xFiltro := 'CIAID=' + QuotedStr(dblcCia.Text)
      + ' AND CLIEID=' + QuotedStr(dblcdClie.Text)
      + ' AND PROFID=' + QuotedStr(menoPedido.Text)
      + ' ORDER BY DPROFITEM';
}
   xFiltro := 'CIAID=' + QuotedStr(dblcCia.Text)
      + ' AND CLIEID=' + QuotedStr(dblcdAso.Text)
      + ' AND PROFID=' + QuotedStr(menoPedido.Text)
      + ' ORDER BY DPROFITEM';
// Fin HPC_201801_FAC

   Filtracds(DMFAC.cdsDetProf, 'SELECT * FROM FAC312 WHERE ' + xFiltro);

   xImp1 := StrToFloat(xImpTasa);
   xImp2 := 0;

   If DMFAC.cdsDetProf.RecordCount > 0 Then
   Begin
      xPrecio := 0;
      DMFAC.cdsDetProf.First;
      DMFAC.cdsDetProf.DisableControls;
      While Not DMFAC.cdsDetProf.EOF Do
      Begin
         DMFAC.cdsDetProf.Edit;
         DMFAC.cdsDetProf.FieldByName('DPROFHOR').AsDateTime := time;
         DMFAC.cdsDetProf.FieldByName('TMONID').AsString := DMFAC.cdsProforma.FieldByName('TMONID').AsString;
         DMFAC.cdsDetProf.FieldByName('DPROFDCTO1').AsFloat := FRound(strtofloat(dbePorcentaje.Text), 15, 4);
         If DMFAC.cdsDetProf.FieldByName('TMONID').AsString = DMFAC.wTMonLoc Then
            xPrecio := DMFAC.cdsDetProf.FieldByName('DPROFPREUMN').AsFloat
         Else
            If DMFAC.cdsDetProf.FieldByName('TMONID').AsString = DMFAC.wTMonExt Then
               xPrecio := DMFAC.cdsDetProf.FieldByName('DPROFPREUME').AsFloat;

         xImporte := FRound(xPrecio * DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat, 15, 4);
         xDscto1 := xImporte * (DMFAC.cdsDetProf.FieldByName('DPROFDCTO1').AsFloat / 100);
         xStotal := FRound((xImporte - xDscto1), 15, 4);

         If DMFAC.cdsDetProf.FieldByName('DPROFDCTO2').AsFloat > 0 Then
            xDscto2 := xStotal * (DMFAC.cdsDetProf.FieldByName('DPROFDCTO2').AsFloat / 100)
         Else
            xDscto2 := 0;

         xTotal := FRound(xStotal - xDscto2, 15, 4);

         xTotImp1 := FRound(xTotal * (xImp1 / 100), 15, 4); // impuesto1
         xTotImp2 := FRound(xTotal * (xImp2 / 100), 15, 4); // impuesto2

         xPVentaTot := FRound(xTotal + xTotImp1 + xTotImp2, 15, 2); // precio de venta total
         xTotImp1 := FRound(xTotImp1, 15, 2);
         xTotImp2 := FRound(xTotImp2, 15, 2);
         xTotal := FRound(xPVentaTot - xTotImp1 - xTotImp2, 15, 2);

       //Descuentos 01
         DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat := FRound(xDscto1, 15, 4); //Descuento 1
       //Descuentos 02
         DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat := FRound(xDscto2, 15, 4); //Descuento 2
         DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat := xTotal; //Montos

         If (DMFAC.cdsDetProf.FieldByName('TMONID').AsString = DMFAC.wTMonLoc) Then
         Begin
            DMFAC.cdsDetProf.FieldByName('DPROFDCTOMN').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').Value;
            DMFAC.cdsDetProf.FieldByName('DPROFDTOMN2').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat;
            DMFAC.cdsDetProf.FieldByName('DPROFMTOMN').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').Value;
            If DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat > 0 Then
            Begin
               DMFAC.cdsDetProf.FieldByName('DPROFDCTOME').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 2); //descuentos 1
               DMFAC.cdsDetProf.FieldByName('DPROFDTOME2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 2); //descuentos 2
               DMFAC.cdsDetProf.FieldByName('DPROFMTOME').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 2);
            End;
         End
         Else
         Begin
            DMFAC.cdsDetProf.FieldByName('DPROFDCTOMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 2); //Descuentos
            DMFAC.cdsDetProf.FieldByName('DPROFDCTOME').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat;
            DMFAC.cdsDetProf.FieldByName('DPROFDTOMN2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 2); //Descuentos
            DMFAC.cdsDetProf.FieldByName('DPROFDTOME2').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat;
            DMFAC.cdsDetProf.FieldByName('DPROFMTOMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 2);
            DMFAC.cdsDetProf.FieldByName('DPROFMTOME').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat;
         End;
      // Inicio HPC_201805_FAC
      // 27/08/2018 retira rutina cdsPost
      //   DMFAC.cdsPost(DMFAC.cdsDetProf);
      // Fin HPC_201805_FAC
         DMFAC.cdsDetProf.Post;
         DMFAC.cdsDetProf.Next;
      End;
   End;
   wInserta := True;

   dbgDetFac.Selected.Clear;
   dbgDetFac.Selected.Add('DPROFITEM'#9'3'#9'Item');
   dbgDetFac.Selected.Add('ARTID'#9'8'#9'Artículo');
   dbgDetFac.Selected.Add('ARTDES'#9'30'#9'Descripción');
   dbgDetFac.Selected.Add('CODCOM'#9'8'#9'Combo');
   dbgDetFac.Selected.Add('UNMIDO'#9'3'#9'U/M');
   dbgDetFac.Selected.Add('DPROFCANTP'#9'06'#9'Cant.~Pedida');
   dbgDetFac.Selected.Add('ALMID'#9'03'#9'Alm.');
   dbgDetFac.Selected.Add('DPROFPREUMO'#9'09'#9'Precio~Unit');
   dbgDetFac.Selected.Add('DPROFDCTOMO'#9'08'#9'Monto~Dscto1');
   dbgDetFac.Selected.Add('DPROFDTOMO2'#9'08'#9'Monto~Dscto2');
   dbgDetFac.Selected.Add('DPROFMTOMO'#9'10'#9'Monto~Original');
   dbgDetFac.ApplySelected;

   TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO')).DisplayFormat := '########0.00';
   TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO')).EditFormat := '########0.00';

   TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO')).DisplayFormat := '########0.00';
   TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO')).EditFormat := '########0.00';

   TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2')).DisplayFormat := '########0.00';
   TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2')).EditFormat := '########0.00';

   TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO')).DisplayFormat := '########0.00';
   TNumericField(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO')).EditFormat := '########0.00';

// Inicio HPC_201801_FAC
// cambio de método de grabación del Detalle de la Proforma
//   DMFAC.cdsDetProf.EnableControls;

//   DMFAC.cdsDetProf.DataRequest('SELECT * FROM FAC312 WHERE CIAID=' + Quotedstr(dblcCia.text) + ' AND PROFID=' + Quotedstr(MenoPedido.text));

//   DMFAC.ControlTran(9, DMFAC.cdsDetProf, 'DPROF');
   If (DMFAC.cdsDetProf.State = dsInsert) or (DMFAC.cdsDetProf.State = dsEdit) Then
      DMFAC.cdsDetProf.Post;

{
   DMFAC.DCOM1.AppServer.IniciaTransaccion;
   xSQL := 'Delete from DB2ADMIN.FAC312 '
      + '    where CIAID='+quotedstr(DMFAC.cdsProforma.FieldByName('CIAID').AsString)
      + '      and TINID='+quotedstr(DMFAC.cdsProforma.FieldByName('TINID').AsString)
      + '      and ALMID='+quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)
      + '      and PROFID='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
   Except
      ShowMessage('No se pudo Inicializar el Detalle de la Proforma para actualizar');
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      Exit;
   End;
   While not DMFAC.cdsDetProf.EOF do
   Begin
      xSQL := 'Insert into DB2ADMIN.FAC312(CIAID, LOCID, TINID, ALMID, PROFID, DPROFITEM, DPROFESTADO, DPROFSIT, '
         + '                               CLAUXID, CLIEID, CLIERUC, GRARID, FAMID, SFAMID, TLISTAID, ARTID, UNMIDG, '
         + '                               UNMABR, DPROFCANTP, TMONID, FPAGOID, DPROFPREUMO, DPROFPREUMN, DPROFPREUME, '
         + '                               DPROFDCTOMO, DPROFDCTOMN, DPROFDCTOME, DPROFMTOMO, DPROFMTOMN, DPROFMTOME, '
         + '                               DPROFUSER, DPROFFREG, DPROFHREG, DPROFTCAM, CLIECREMAX, DPROFIGV, DPROFISC, '
         + '                               DPROFSALDO, DPROFFLAGRE, DPROFDCTO1, DPROFDCTO2, DPROFDTOMO2, DPROFDTOMN2, '
         + '                               DPROFDTOME2, CONTENIDO, PROV, DPROFCANTAC, DPROFARTIAN, VEID, DPROFFECHA, '
         + '                               DPROFHOR, DPROFANOMES, DPROFAAAA, DPROFMM, DPROFDD, DPROFTRI, DPROFSEM, DPROFSS, '
         + '                               DPROFAATRI, DPROFAASEM, DPROFAASS, DPROFOBS, ARTDES, PROFTCLI, TIPOADQ, DPROFIMP1, '
         + '                               DPROFIMP2, DPROFVTOTMO, DPROFVTOTMN, DPROFVTOTME, '
         + '                               DPROFIMPMTO1, DPROFIMPMTN1, DPROFIMPMTE1, DPROFIMPMTO2, DPROFIMPMTN2, DPROFIMPMTE2, '
         + '                               DPROFPREVMO) '
         + '   Values ('+ quotedstr(DMFAC.cdsDetProf.FieldByName('CIAID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('LOCID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('TINID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('ALMID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('PROFID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFITEM').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFESTADO').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSIT').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('CLAUXID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('CLIEID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('CLIERUC').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('GRARID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('FAMID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('SFAMID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('TLISTAID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('ARTID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('UNMABR').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUMN').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUME').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMN').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOME').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOMN').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOME').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFUSER').AsString)+', '
         +  '             trunc(Sysdate), '
         +  '             Sysdate, '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('CLIECREMAX').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFIGV').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFISC').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFSALDO').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFFLAGRE').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTO1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTO2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOMN2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOME2').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('CONTENIDO').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('PROV').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFARTIAN').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('VEID').AsString)+', '
         +                quotedstr(datetostr(DMFAC.cdsDetProf.FieldByName('DPROFFECHA').AsDateTime))+', '
         +  '             Sysdate, '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFANOMES').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAAAA').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFMM').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFDD').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFTRI').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSEM').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSS').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAATRI').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAASEM').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAASS').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFOBS').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('ARTDES').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('PROFTCLI').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('TIPOADQ').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMP1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMP2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMN').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTME').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREVMO').AsFloat)+') ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
      Except
         ShowMessage('No se pudo Inicializar el Detalle de la Proforma para actualizar');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
      DMFAC.cdsDetProf.Next;
   End;
   DMFAC.DCOM1.AppServer.GrabaTransaccion;
}
   DMFAC.cdsDetProf.EnableControls;

// Fin HPC_201801_FAC

   EstadoDeForma(1, DMFAC.cdsProforma.FieldByName('PROFSIT').AsString, DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString,
      DMFAC.cdsProforma.FieldByName('PROFESTADO').AsString);

   If DMFAC.cdsTLPrecio.IndexFieldNames <> 'ARTID' Then
      DMFAC.cdsTLPrecio.IndexFieldNames := 'ARTID';

   If DMFAC.cdsDetProf.RecordCount < 1 Then
   Begin
      btnActReg.OnClick(Self);
      stTitulo.Color := clGray;
   End;

   CalculaFooter;

   xxArticulo := '';
   xxArtDes := '';

   If dblcTInv.Text = '00' Then
   Begin
      xSQL := 'Select * from TGE205 where CIAID=''' + dblcCia.Text + ''' AND CONCESION=''S''';
      DMFAC.cdsVende.Close;
      DMFAC.cdsVende.DataRequest(xSQL);
      DMFAC.cdsVende.Open;
   End;

   sAlmacen := ' AND C.ALMID IN (''' + dblcAlmacen.Text + ''') ';
   If (dblcCia.Text = '04') And (dblcAlmacen.Text = '14') Then
      sAlmacen := ' AND C.ALMID IN (''' + dblcAlmacen.Text + ''', ''15'') ';

// Inicio FAC-201806
// 29/10/2018 se corrije orden de campos en where para que tome correctamente los índices
   {
   xFiltro := 'Select C.ALMID, A.CIAID, A.TINID, A.GRARID, A.FAMID, A.ARTID, A.ARTDES, A.ARTABR, A.UNMIDG, '
      + '       A.UNMIDU, A.ARTCONT, B.TLISTAID, B.LPRETMONID, B.LPREPDCTOG, B.LPREPDCTOU, '
      + '       B.LPREDCTO2G, B.LPREPDCTOU, B.LPREPREGMO, B.LPREPREUMO, B.LPREFLAGD, '
      + '       round(nvl(B.LPREPREGMO,0),2) + round(nvl(B.LPREPREGMO,0)*((D.TASACAN/100)),2) PRECIO_PUB, '
      + '       nvl(C.STKFIN,0) STKSACTG, A.OBSEQUIO '
      + '  from TGE205 A, FAC201 B, LOG319 C, TGE108 D '
      + ' where NVL(A.ARTEST,''VACIO'')<>''A'' '
      + '   and A.CIAID=B.CIAID AND A.TINID=B.TINID AND A.ARTID=B.ARTID '
      + '   and B.TINID=' + QuotedStr(dblcTInv.Text) + ' '
      + '   and B.TLISTAID=' + QuotedStr(dblcLPrecio.Text) + ' '
      + '   and A.CIAID=C.CIAID(+) AND A.TINID=C.TINID(+) AND A.ARTID=C.ARTID(+) '
      + sAlmacen
      + '   and NVL(C.STKFIN,0)>0 '
      + '   and C.LOGANOMM(+)=' + QuotedStr(wAnoMes)
      + '   and D.TASAFLG=''I''';
   DMFAC.cdsTLPrecio.Close;
   DMFAC.cdsTLPrecio.DataRequest(xFiltro);
   DMFAC.cdsTLPrecio.Open;
   }
   xSQL := 'Select ALMID,CIAID,TINID,GRARID,FAMID,ARTID,ARTDES,ARTABR,ARTIGV,'
      + '          ARTISC,UNMIDG,UNMIDU,ARTCONT,TLISTAID,LPRETMONID,OBSEQUIO,'
      + '          LPREPDCTOG,LPREPDCTOU,LPREDCTO2G,LPREPREGMO,LPREPREUMO,'
      + '          ROUND(LPREPREGMO + (LPREPREGMO * (TASIGV/100)) + (LPREPREGMO * (TASSERV/100)),2) PRECIO_PUB, ' //PRECIO PUBLICO
      + '          LPREFLAGD,STKSACTG,EDITA_PRECIO,CONSIGNACION,TASIGV,TASSERV, '
      + '          ROUND(LPREPREGMO*(TASIGV/100),2) TOTIGV,' //TOTAL IGV
      + '          ROUND(LPREPREGMO*(TASSERV/100),2) TOTSERV,' // TOTAL SERVICIOS
      + '          ROUND(LPREPREGMO + (LPREPREGMO * (TASIGV/100)) + (LPREPREGMO * (TASSERV/100)),2) LPREPREGIGV ' //PRECIO LISTA
      + '     from (  '
      + '           Select C.ALMID, A.CIAID, A.TINID, A.GRARID, A.FAMID, A.ARTID, A.ARTDES, A.ARTABR, A.ARTIGV,'
      + '                  A.ARTISC, A.UNMIDG, A.UNMIDU, A.ARTCONT, B.TLISTAID, B.LPRETMONID, OBSEQUIO, '
      + '                  B.LPREPDCTOG, B.LPREPDCTOU, B.LPREDCTO2G,ROUND(NVL(B.LPREPREGMO,0),5)LPREPREGMO, B.LPREPREUMO, '
      + '                  B.LPREFLAGD, NVL(STKFIN,0) STKSACTG, NVL(A.FLAGVAR,'' '') EDITA_PRECIO, CONSIGNACION, '
      + '                  D.TASACAN TASIGV, '
      + '                  nvl((Select G.TASA '
      + '                         From TGE101 E,TGE205 F,TGE128 G '
      + '                        where E.CIAID=A.CIAID AND E.FLGSERV=''S'' '
      + '                          and F.CIAID=A.CIAID AND F.ARTID=A.ARTID AND F.FLGSERV=''S'' '
      + '                          and G.TREGID=''07''),0) TASSERV '
      + '             from FAC201 B, TGE205 A, LOG319 C, TGE108 D '
      + '            where B.CIAID=' + QuotedStr(dblcCia.Text) + ' AND B.TINID=' + QuotedStr(dblcTInv.Text)
      + '              and B.TLISTAID=' + QuotedStr(dblcLPrecio.Text)
      + '              and A.CIAID=B.CIAID and A.TINID=B.TINID AND A.ARTID=B.ARTID and nvl(A.ARTEST,''VACIO'')<>''A'' '
      + '              and C.CIAID=B.CIAID and C.LOGANOMM='+quotedstr(IntToStr(Y) + DMFAC.StrZero(inttostr(M), 2))
      + sAlmacen
      + '              and C.TINID=B.TINID '
      + '              and C.ARTID=B.ARTID '
      + '              and nvl(C.STKFIN,0)>0 '
      + '              and D.TASAFLG=''I'')';
   DMFAC.cdsTLPrecio.Close;
   DMFAC.cdsTLPrecio.DataRequest(xSQL);
   DMFAC.cdsTLPrecio.Open;
// Fin FAC-201806

   cCombo := '';

   Screen.Cursor := crDefault;
End;

Function TFProforma.Consistencia: Boolean;
Begin
// Inicio HPC_201701_FAC
// Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
   If DMFAC.xTipCli = 'S' Then
   Begin
    // consistencia Código de Compañía
      If length(dblcCia.Text) = 0 Then
         Raise exception.Create('Falta Código de Compañía');
      If length(edtCia.Text) = 0 Then
         Raise exception.Create('Código de Compañía Errado');

    // consistencia Código de Localidad
      If length(dblcLocal.Text) = 0 Then
         Raise exception.Create('Falta Código de Localidad');
      If length(edtLocal.Text) = 0 Then
         Raise exception.Create('Código de Localidad Errado');

    // consistencia Código de Cliente
   // Inicio HPC_201801_FAC
   // Se retira componente dblcdClie, se deja componente dblcdAso
   //   If length(dblcdClie.Text) = 0 Then
   //      Raise exception.Create('Faltan Datos del Cliente');
      If length(dblcdAso.Text) = 0 Then
         Raise exception.Create('Faltan Datos del Cliente');
   // Fin HPC_201801_FAC

      If length(edtClie.Text) = 0 Then
         Raise exception.Create('Código/RUC de Cliente Errado');

    // consistencia ingreso de No.Registro
      If length(meNoPedido.Text) = 0 Then
         Raise exception.Create('Falta No. Proforma');

    // consistencia ingreso de Fecha de Documento
      If dtpFPed.Date = 0 Then
         Raise exception.Create('Falta Fecha de Proforma');

    // consistencia ingreso de Vendedor
      If length(dblcVen.Text) = 0 Then
         Raise exception.Create('Faltan Datos del Vendedor');
      If length(edtVen.Text) = 0 Then
         Raise exception.Create('Código de Vendedor Errado');

      If length(dblcFPago.Text) = 0 Then
         Raise exception.Create('Faltan Datos Condición Comercial');
      If length(edtFPago.Text) = 0 Then
         Raise exception.Create('Código de Condición Comercial Errado');

    // consistencia ingreso de Tipo de Moneda
      If length(dblcTMon.Text) = 0 Then
         Raise exception.Create('Falta Tipo de Moneda');
      If length(edtTMon.Text) = 0 Then
         Raise exception.Create('Tipo de Moneda Errado');

    // consistencia ingreso de Tipo de Cambio
      If length(dbeTCambio.Text) = 0 Then
         Raise exception.Create('Falta Tipo de Cambio');

    //////Conssistencia de Almacen
      If sTipoRqs = 'C' Then
      Begin
         If length(dblcTInv.text) = 0 Then
            Raise exception.Create('Falta Tipo de Inventario');
         If length(edtTinv.text) = 0 Then
            Raise exception.Create('Tipo de Inventario Errado');

         If length(dblcAlmacen.text) = 0 Then
            Raise exception.Create('Falta Almacen');
         If length(edtAlmacen.text) = 0 Then
            Raise exception.Create('Tipo de Almacen Errado');
      End;
    // consistencia ingreso de Tipo de Lista de Precio
      If length(dblcLPrecio.Text) = 0 Then
         Raise exception.Create('Falta Lista de Precios');
      If length(edtLPrecio.Text) = 0 Then
         Raise exception.Create('Tipo de Lista Errado');

      If length(dblcTTran.Text) = 0 Then
         Raise exception.Create('Falta Tipo Transacción');
      If length(edtTransaccion.Text) = 0 Then
         Raise exception.Create('Tipo de Transacción Errado');

      If dbeEmbalaje.Visible = true Then
      Begin
         If length(dbeEmbalaje.text) = 0 Then
            Raise exception.Create('Falta Embalaje');

         If strtofloat(dbeEmbalaje.text) < 0 Then
            Raise exception.Create('Ingrese Monto de Embalaje mayor a cero');

         If length(dblcAgencia.text) = 0 Then
            Raise exception.Create('Falta Agencia');

         If length(edtAgencia.text) = 0 Then
            Raise exception.Create('Tipo de Agencia Errado');
      End;
   End
   Else
   // Inicio HPC_201701_FAC
   // Se cambia propiedad de variable xTipCli para que sea global para Proformas y Facturas
      If DMFAC.xTipCli = 'N' Then
   // Fin HPC_201701_FAC
      Begin
         If length(dblcCia.Text) = 0 Then
            Raise exception.Create('Falta Código de Compañía');
         If length(edtCia.Text) = 0 Then
            Raise exception.Create('Código de Compañía Errado');

         If length(dblcLocal.Text) = 0 Then
            Raise exception.Create('Falta Código de Localidad');
         If length(edtLocal.Text) = 0 Then
            Raise exception.Create('Código de Localidad Errado');

         If length(dblcdAso.Text) = 0 Then
            Raise exception.Create('Faltan Datos del Asociado');
         If length(edtClie.Text) = 0 Then
            Raise exception.Create('Código de Asociado Errado');

         If length(meNoPedido.Text) = 0 Then
            Raise exception.Create('Falta No. Proforma');

         If dtpFPed.Date = 0 Then
            Raise exception.Create('Falta Fecha de Proforma');

         If length(dblcVen.Text) = 0 Then
            Raise exception.Create('Faltan Datos del Vendedor');
         If length(edtVen.Text) = 0 Then
            Raise exception.Create('Código de Vendedor Errado');

         If length(dblcTMon.Text) = 0 Then
            Raise exception.Create('Falta Tipo de Moneda');
         If length(edtTMon.Text) = 0 Then
            Raise exception.Create('Tipo de Moneda Errado');

         If length(dbeTCambio.Text) = 0 Then
            Raise exception.Create('Falta Tipo de Cambio');

         If sTipoRqs = 'C' Then
         Begin
            If length(dblcTInv.text) = 0 Then
               Raise exception.Create('Falta Tipo de Inventario');
            If length(edtTinv.text) = 0 Then
               Raise exception.Create('Tipo de Inventario Errado');

            If length(dblcAlmacen.text) = 0 Then
               Raise exception.Create('Falta Almacen');
            If length(edtAlmacen.text) = 0 Then
               Raise exception.Create('Tipo de Almacen Errado');
         End;

         If length(dblcLPrecio.Text) = 0 Then
            Raise exception.Create('Falta Lista de Precios');
         If length(edtLPrecio.Text) = 0 Then
            Raise exception.Create('Tipo de Lista Errado');

         If length(dblcTTran.Text) = 0 Then
            Raise exception.Create('Falta Tipo Transacción');
         If length(edtTransaccion.Text) = 0 Then
            Raise exception.Create('Tipo de Transacción Errado');
      End;
   Result := True;
End;

Procedure TFProforma.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TDBMemo Then Exit;
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFProforma.btnActRegClick(Sender: TObject);
Var
   xFlagTLista, xWhere, sMax: String;
Begin
   edtObservacion.Visible := True;
   lblCant.Caption := '';
   lblCant.Visible := False;
   xFlagInsert := true;

   cCombo := '';

   If (sTipoRQS = 'C') Then
   Begin
      lblObsequio.Visible := False;
      pnlDetalle.Enabled := True;
      dbgDetFac.Enabled := True;
      pnlPie.Enabled := False;
      pnlRegistro.Visible := True;
      pnlRegistro.Enabled := True;
      pnlRegistro.SetFocus;
      xxReservaAnt := 0;
      InicializaCamposDetalle;

      If dblcLPrecio.text <> '' Then //Seleccion
      Begin
         xWhere := 'TLISTAID = ' + QuotedStr(dblcLPrecio.Text);
         xFlagTLista := DMFAC.BuscaQry('dspTLista', 'FAC101', 'TLISTAFLAG', xWhere, 'TLISTAFLAG');
         If xFlagTLista = 'E' Then //Si es lista especial
            dbePrecioG.enabled := False
         Else
         Begin
            DMFAC.cdsTLPrecio.Filtered := False;
            DMFAC.cdsTLPrecio.Filter := 'TLISTAID=' + Quotedstr(dblcLPrecio.Text) + ' AND CIAID=' + Quotedstr(dblcCia.Text) + ' AND TINID=' + Quotedstr(dblcTInv.Text);
            DMFAC.cdsTLPrecio.Filtered := True;
         End;

         dblcdArticulo.LookupTable := DMFAC.cdsTLPrecio;
         dblcdArticulo.LookupField := 'ARTID';
         xLPrecio := true;

         dblcdArticulo.Selected.Clear;
         dblcdArticulo.Selected.Add('ARTID'#9'9'#9'Código');
         dblcdArticulo.Selected.Add('ARTDES'#9'40'#9'Artículo');
         dblcdArticulo.Selected.Add('UNMIDG'#9'5'#9'U.M');
         dblcdArticulo.Selected.Add('LPRETMONID'#9'3'#9'T.M.');
         dblcdArticulo.Selected.Add('LPREPREGMO'#9'9'#9'Precio S/IGV');
         dblcdArticulo.Selected.Add('PRECIO_PUB'#9'9'#9'Precio Publico');
         dblcdArticulo.Selected.Add('ALMID'#9'5'#9'Almacen');
         dblcdArticulo.Selected.Add('STKSACTG'#9'6'#9'Stock');
      End;
      bbtnBuscaArt.Enabled := true;
      dblcdArticulo.Enabled := True;
      dblcdArticulo.Text := xxArticulo;
      dbeArticulo.text := xxArtDes;
      dblcdArticulo.SetFocus;
      dbeDGarantia.text := dbeGarantia.text;
      edtDsto1.text := dbePorcentaje.text;
      dbeMontoDCTO2.text := '';
      dbeImporte.text := '';
      dbeImporteIGV.text := '';
   End
   Else
      If (sTipoRQS = 'S') Then
      Begin
         pnlDetalleA.Height := 238;
         pnlDetalleA.Left := 50;
         pnlDetalleA.Top := 288;
         pnlDetalleA.Width := 436;
         sMax := DMFAC.StrZero(DMFAC.MaxValue('DPROFITEM', DMFAC.cdsDetProf), 3);
         memDetalle.Clear;
         memDetServ.Clear;
         dbeItem.Text := sMax;
         dblcdServicio.Text := '';
         edtAdq.Text := sTipoRQS;
         dbePUnit.Text := '0';
         dbeDscto.Text := '0';
         dbeImpIgv.Text := xImpTasa;
         dbeImp2.Text := '0';
         dbeValVen.Text := '0';
         dbeImporteS.Text := '0';
         stxTitulo2.caption := 'Detalle de Facturación Por Servicio';
         lblDetServ.Caption := ' Detalle Servicio ';
         pnlDetalleA.Visible := True;
         dbeCnt.Text := '1';
         dblcUMed.Text := '';

         dblcUMed.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE130', 'UNMID, UNMDES', 'UNMSERV=''S''', 'UNMID');
         edtUMed.Text := DMFAC.cdsQry.FieldByName('UNMDES').AsString; // DMFAC.BuscaQry('prvSQL', 'TGE130', 'UNMDES', 'UNMID='''+dblcUnMed.Text+'''', 'UNMDES');
         If dblcdServicio.Enabled Then
            dblcdServicio.SetFocus
         Else
            memDetalle.SetFocus;
      End;
End;

Procedure TFProforma.InicializaCamposDetalle;
Begin
   If sTipoRqs = 'C' Then
   Begin
      dblcdArticulo.Enabled := true;
      dblcdArticulo.text := '';
      dbeArticulo.text := '';
      dbePrecioG.text := '';
      dbeCtdadG.text := '';
      dbeCtdadU.text := '';
      dbeCtdadU.Enabled := False;
      dbeCantUA.Enabled := False;
      dbeCantGA.text := '';
      dbeCantUA.text := '';
      dbeUMG.text := '';
      dbeImporte.text := '';
      dbeDGarantia.text := '';
      cbTipoum.ItemIndex := 0;
      edtDsto2.Text := '';
      dblcProv.Text := '';
      edtProv.Text := '';
      lblUMPG.Caption := '';
      lblUMAG.Caption := '';
      edtObservacion.Text := '';
      dbeImporteIGV.text := '';
      dbeMontoDCTO2.text := '';
      dbeMontoDCTO1.text := '';
      lblCant.Caption := '';
      lblCant.Visible := False;

   End
   Else
      If sTipoRqs = 'S' Then
      Begin
         memDetalle.text := '';
         dbeCnt.Text := '0';
         dbePUnit.text := '0';
         dbeDscto.text := '0';
         dbeImpIgv.text := '0';
         dbeImp2.text := '0';
         dbeImp2.OnExit(dbeImp2);
      End;
End;

Procedure TFProforma.dblcdArticuloDropDown(Sender: TObject);
Begin
   DMFAC.cdsTLPrecio.indexfieldnames := 'ARTID';
End;

Procedure TFProforma.dblcdArticuloExit(Sender: TObject);
Var
   xWhere, xSQL, xFlagTLista, xAlmId: String;
Begin
   edtObservacion.Visible := True;
   lblCant.Caption := '';
   lblCant.Visible := False;

   cbTipoUm.ItemIndex := 0;
   dbePrecioG.Enabled := False;

   If bbtnBuscaArt.Focused Then exit;

   If Not bbtnRegCanc.Focused Then
   Begin
      If DMFAC.wAnchoArt > 0 Then
      Begin
         If Length(dblcdArticulo.Text) < DMFAC.wAnchoArt Then
         Begin
            dblcdArticulo.Text := DMFAC.StrZero(dblcdArticulo.Text, DMFAC.wAnchoArt);
         End;
      End;

      If ExisteArticuloDuplicado(dblcdArticulo.text) Then
      Begin
         ShowMessage('El Artículo seleccionado está duplicado');
         DMFAC.cdsDetProf.EnableControls;
         InicializaCamposDetalle;
         dblcdArticulo.setfocus;
         exit;
      End
      Else
         xFlagInsert := true;

      xAlmId := DMFAC.cdsTLPrecio.FieldByName('ALMID').AsString;

      Screen.Cursor := crHourGlass;
      DMFAC.cdsTLPrecio.IndexFieldNames := 'ARTID';
      DMFAC.cdsTLPrecio.Setkey;
      DMFAC.cdsTLPrecio.FieldByName('ARTID').AsString := dblcdArticulo.Text;
      If DMFAC.cdsTLPrecio.GotoKey Then
      Begin
         If xAlmId <> DMFAC.cdsTLPrecio.FieldByName('ALMID').AsString Then
         Begin
            DMFAC.cdsTLPrecio.Next;
            If (DMFAC.cdsTLPrecio.FieldByName('ARTID').AsString = dblcdArticulo.Text) And (xAlmId = DMFAC.cdsTLPrecio.FieldByName('ALMID').AsString) Then
            Else
            Begin
               ShowMessage('Error en el Artículo seleccionado');
               exit;
            End;
         End;

         dbeArticulo.Text := DMFAC.cdsTLPrecio.FieldByName('ARTDES').AsString;

         cObsequio := DMFAC.cdsTLPrecio.FieldByName('OBSEQUIO').AsString;

         lblObsequio.Visible := False;
         If cObsequio = 'S' Then
            lblObsequio.Visible := True;

         lblCant.Font.Color := clNavy;
         lblCant.Caption := 'Stock Actual ' + FloattoStr(DMFAC.cdsTLPrecio.FieldByName('STKSACTG').AsFloat);
         lblCant.Visible := True;

         xxxUMU := DMFAC.cdsTLPrecio.FieldByName('UNMIDU').AsString;
         xxxUMG := DMFAC.cdsTLPrecio.FieldByName('UNMIDG').AsString;
         If DMFAC.cdsTLPrecio.FieldByName('LPRETMONID').asString = dblcTMon.text Then
         Begin
            xxxPVG := DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO').AsFloat;
            xxxPVU := DMFAC.cdsTLPrecio.FieldByName('LPREPREUMO').AsFloat;
         End
         Else
         // la proforma es en dólares y el articulo de la L.precios es en soles
            If DMFAC.cdsTLPrecio.FieldByName('LPRETMONID').asString = DMFAC.wTMonLoc Then
            Begin
               xxxPVG := FRound(DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO').asFloat / strtofloat(dbeTCambio.Text), 15, 2);
               xxxPVU := FRound(DMFAC.cdsTLPrecio.FieldByName('LPREPREUMO').asFloat / strtofloat(dbeTCambio.Text), 15, 2);
            End
            Else
            Begin
               xxxPVG := FRound(DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO').asFloat * strtofloat(dbeTCambio.Text), 15, 2);
               xxxPVU := FRound(DMFAC.cdsTLPrecio.FieldByName('LPREPREUMO').asFloat * strtofloat(dbeTCambio.Text), 15, 2);
            End;
         wContenido := (DMFAC.cdsTLPrecio.FieldByName('ARTCONT').AsInteger > 1);
         cbTipoUm.enabled := wContenido;
         lblUMPG.caption := xxxUMG;
         dbeUmG.text := xxxUMG;
         dbePrecioG.text := floattostr(xxxPVG);
         If dbePorcentaje.text = '' Then
            dbePorcentaje.text := '0';

         AperturaConsultaSaldos('N'); //Flag para mostrar consulta del stock segun la unidad sin escoger en el combo
         xWhere := 'TLISTAID = ' + QuotedStr(dblcLPrecio.Text);
         xFlagTLista := DMFAC.BuscaQry('dspTLista', 'FAC101', 'TLISTAFLAG', xWhere, 'TLISTAFLAG');
         If xFlagTLista = 'E' Then //Si es lista especial
            dbePrecioG.Enabled := true;

         xCIgv := 'S';
         xcIsc := 'N';
         If DMFAC.cdsTLPrecio.FieldByName('LPREPDCTOG').AsFloat = 0 Then
            edtDsto2.Text := '0'
         Else
            edtDsto2.Text := floattostr(DMFAC.cdsTLPrecio.FieldByName('LPREPDCTOG').AsFloat);
      End
      Else
      Begin
         Screen.Cursor := crDefault;
         Showmessage('Código de Artículo Errado');
         dblcdArticulo.text := '';
         If pnlRegistro.Visible = True Then
            dblcdArticulo.SetFocus;
         exit;
      End;

      xSQL := xSQL + ' ARTID = ' + QuotedStr(dblcdArticulo.text);
      xSQL := xSQL + ' AND DPROFFREG =(SELECT MAX(DPROFFREG) FROM LOG313 WHERE ARTID=' + '''' + dblcdArticulo.text + '''' + ')';

      cbTipoum.OnExit(cbTipoum);
      Screen.Cursor := crDefault;
   End; // si no se apretó botón de cancelar
End;

Procedure TFProforma.bbtnBuscaArtClick(Sender: TObject);
Begin
   pnlBusqueda.BringToFront;
   pnlBusqueda.Visible := True;
   pnlRegistro.Enabled := False;
   dbgDetFac.Enabled := False;
   dbeBusca.Clear;
   dbeBusca.SetFocus;
End;

Procedure TFProforma.dbeCtdadGExit(Sender: TObject);
Var
   xValor: double;
Begin
   If Not bbtnRegCanc.Focused Then
   Begin
      DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmG.text), 'EUNMEQ');
      If length(DMFAC.cdsQry.FieldByName('EUNMEQ').AsString) = 0 Then
         Raise exception.Create('Esta unidad no tiene Equivalencia!!!')
      Else
         xValor := strtofloat(DMFAC.cdsQry.FieldByName('EUNMEQ').AsString);

      dbeCtdadU.Enabled := (xValor > 1);

      If length(dbeCtdadG.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Cantidad');
         dbeCtdadG.SetFocus;
         Exit;
      End;

      If ((strtofloat(dbeCtdadG.text) <= 0) And (dbeCtdadU.Enabled = False)) Then
      Begin
         Showmessage('Ingrese una Cantidad Mayor a Cero');
         dbeCtdadG.text := '';
         dbeCtdadG.setfocus;
         Exit;
      End;

      If (xValor = 1) Then
      Begin
         If wStockG >= strtofloat(dbeCtdadG.Text) Then
         Begin
            bvCantAceptada.Enabled := False;
            dbeCantGa.Text := dbeCtdadG.Text;
            lblUMAG.Caption := lblUMPG.Caption;
            dbeCantGa.Enabled := False;
            dbeCantUa.Enabled := False;
            edtDsto2.Setfocus
         End
         Else
         Begin
            bvCantAceptada.Enabled := true;
            dbeCantGa.Text := dbeCtdadG.Text;
            lblUMAG.Caption := lblUMPG.Caption;
            dbeCantGa.Enabled := true;
            ErrorMsg(Caption, 'La Cantidad Registrada en la Proforma es Mayor a la Cantidad en el Stock');
            If pnlRegistro.Visible = true Then
               dbeCantGA.SetFocus;
         End;
      End
      Else
         If dbeCtdadU.Enabled = true Then
         Begin
            If length(dbeCtdadU.text) = 0 Then
               dbeCtdadU.Text := '0';
            dbeCtdadU.SetFocus;
         End;
      dbeMontoDCTO1.text := FloatToStr(FRound((StrToFloat(dbeCantGA.text) * StrToFloat(dbePrecioG.text) * StrToFloat(edtDsto1.text) / 100), 15, 2))

   End; //  cancel
End;

Procedure TFProforma.dbeCtdadUEnter(Sender: TObject);
Begin
   If length(dbeCtdadU.text) = 0 Then
      dbeCtdadU.Text := '0';
   dbeCtdadU.SetFocus;
End;

Procedure TFProforma.dbeCtdadUExit(Sender: TObject);
Var
   xCont, xCantTot, xCtPedida, xValor: double;
Begin
   If Not bbtnRegCanc.Focused Then
   Begin
      If length(dbeCtdadU.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Cantidad Fraccionaria');
         dbeCtdadU.SetFocus;
         Exit;
      End;

      xCont := strtofloat(DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmg.Text), 'EUNMEQ'));
      If strtofloat(dbeCtdadU.Text) < 0 Then
      Begin
         showmessage('Ingrese Cantidad Fraccionaria mayor/igual a cero');
         exit;
      End
      Else
      Begin
         If length(dbeCtdadG.text) > 0 Then
         Begin
            If strtofloat(dbeCtdadG.text) = 0 Then
            Begin
               xCtPedida := strtofloat(dbeCtdadG.text);
               If length(dbeCtdadU.Text) > 0 Then //Cantidad Pedida
               Begin
                  xValor := strtofloat(DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmg.Text), 'EUNMEQ'));
                  xCtPedida := xCtPedida + FRound(strtofloat(dbeCtdadU.Text) / xValor, 15, 2); //Cantidad Pedida
                  If xCtPedida = 0 Then
                  Begin
                     Showmessage('Ingrese Cantidad mayor a cero');
                     dbeCtdadU.Text := '0';
                     dbeCtdadU.SetFocus;
                     exit;
                  End;
               End;
            End;
         End;
      End;

      If strtofloat(dbeCtdadU.Text) >= xCont Then
      Begin
         showmessage('Ingrese una Cantidad Fraccionaria menor');
         dbeCtdadU.Text := '';
         dbeCtdadU.SetFocus;
         exit;
      End
      Else
      Begin
         xCantTot := strtofloat(dbeCtdadG.text) + FRound(strtofloat(dbeCtdadU.Text) / xCont, 15, 2);
         If wStockG >= xCantTot Then
         Begin
            bvCantAceptada.Enabled := False;
            dbeCantGa.Text := dbeCtdadG.Text;
            lblUMAG.Caption := lblUMPG.Caption;
            dbeCantUa.Text := dbeCtdadU.Text;
            dbeCantGa.Enabled := False;
            dbeCantUa.Enabled := False;
         End
         Else
         Begin
            bvCantAceptada.Enabled := true;
            dbeCantGa.Text := dbeCtdadG.Text;
            lblUMAG.Caption := lblUMPG.Caption;
            dbeCantUa.Text := dbeCtdadU.Text;
            dbeCantGa.Enabled := true;
            dbeCantUa.Enabled := true;
            dbeCantGa.SetFocus;
         End;
      End;

   End;

End;

Procedure TFProforma.dbeCantGAExit(Sender: TObject);
Var
   xValor, xCtPedida: double;
Begin
   If Not bbtnRegCanc.Focused Then
   Begin
      If length(dbeCantGA.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Cantidad');
         dbeCantGA.SetFocus;
         Exit;
      End;

      If ((strtofloat(dbeCantGA.text) <= 0) And (dbeCantUA.Enabled = False)) Then
      Begin
         Showmessage('Ingrese una Cantidad mayor a cero');
         dbeCantGA.text := '';
         dbeCantGA.setfocus;
         Exit;
      End;

      xCtPedida := strtofloat(dbeCtdadG.text);
      If length(dbeCtdadU.Text) > 0 Then
      Begin //Cantidad Pedida
         xValor := strtofloat(DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmg.Text), 'EUNMEQ'));
         xCtPedida := xCtPedida + FRound(strtofloat(dbeCtdadU.Text) / xValor, 15, 2); //Cantidad Pedida
      End;

      If (strtofloat(dbeCantGA.text) > xCtPedida) Then
      Begin
         Showmessage('La Cantidad Aceptada no puede ser mayor a la Cantidad Pedida');
         dbeCantGA.Text := '';
         dbeCantGA.SetFocus;
         exit;
      End;

      If dbeCtdadU.Enabled = true Then
         dbeCantUA.SetFocus
      Else
         edtDsto2.SetFocus;

   End; //  cancel

End;

Procedure TFProforma.dbeCantUAExit(Sender: TObject);
Var
   xCont: double;
   xCtPedida, xCtAceptada, xvalor: double;
Begin
   If Not bbtnRegCanc.Focused Then
   Begin
      xCont := strtofloat(DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmg.Text), 'EUNMEQ'));

      If strtofloat(dbeCantUA.Text) < 0 Then
      Begin
         showmessage('Ingrese Cantidad Fraccionaria mayor/igual a cero');
         exit;
      End
      Else
      Begin
         If strtofloat(dbeCantUA.Text) >= xCont Then
         Begin
            showmessage('Ingrese una Cantidad Fraccionaria menor');
            dbeCantUA.Text := '';
            dbeCantUA.SetFocus;
            exit;
         End
         Else
            edtDsto2.SetFocus;
      End;
      xCtAceptada := 0;
      xCtPedida := 0;
      If length(dbeCtdadU.Text) > 0 Then
      Begin //Cantidad Pedida
         xCtPedida := strtofloat(dbeCtdadG.text);
         xValor := strtofloat(DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmg.Text), 'EUNMEQ'));
         xCtPedida := xCtPedida + FRound(strtofloat(dbeCtdadU.Text) / xValor, 15, 2); //Cantidad Pedida
      End;

      If length(dbeCantUA.Text) > 0 Then
      Begin //Cantidad Aceptada
         xCtAceptada := strtofloat(dbeCantGA.text);
         xValor := strtofloat(DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmg.Text), 'EUNMEQ'));
         xCtAceptada := xCtAceptada + FRound(strtofloat(dbeCantUA.Text) / xValor, 15, 2);
      End;

      If (xCtAceptada > xCtPedida) Then
      Begin
         Showmessage('La Cantidad Aceptada no puede ser mayor a la Cantidad Pedida');
         dbeCantUA.Text := '';
         dbeCantUA.SetFocus;
         exit;
      End;
   End;
End;

Procedure TFProforma.dbePrecioGExit(Sender: TObject);
Begin
   If Not bbtnRegCanc.Focused Then
   Begin
      If length(dbePrecioG.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Precio');
         dbePrecioG.SetFocus;
         Exit;
      End;
      If strtofloat(dbePrecioG.text) <= 0 Then
      Begin
         Showmessage('Ingrese un Precio mayor a cero');
         dbePrecioG.text := '';
         dbePrecioG.setfocus;
      End;
   End; //Si ni hizo click en el boton cancelar
End;

Procedure TFProforma.edtDsto1Exit(Sender: TObject);
Var
   xDscto1, xDscto2, xImporte1, xSubTot1, xTot, xTotD1, xTotD2, xFrac: Double;
   xWhere: String;
   xValor: Double;
Begin
   If Not bbtnRegCanc.Focused Then
   Begin
      If dbePorcentaje.text = '' Then
         xDscto1 := 0
      Else
         xDscto1 := FRound(strtofloat(dbePorcentaje.text), 15, 4);

      If edtDsto2.text = '' Then
         xDscto2 := 0
      Else
      Begin
         If StrToFloat(edtDsto2.Text) < 0 Then
         Begin
            ShowMessage('Ingrese un Descuento mayor/igual a cero');
            edtDsto2.Text := '';
            edtDsto2.SetFocus;
            Exit;
         End
         Else
         Begin
            If StrToFloat(edtDsto2.Text) > 100 Then
            Begin
               Beep;
               MessageDlg('El Descuento No debe ser Mayor de 100', mtInformation, [mbOk], 0);
               edtDsto2.Clear;
               edtDsto2.SetFocus;
               Exit;
            End
            Else
            Begin
               If ((StrToFloat(edtDsto2.text) > DMFAC.cdsTLPrecio.FieldByName('LPREPDCTOG').AsFloat)
                  And (DMFAC.cdsTLPrecio.FieldByName('LPREFLAGD').AsString = 'S')) Then
               Begin
                  Showmessage('El Descuento no puede ser mayor al de la Lista de Precios');
                  edtDsto2.text := floattostr(DMFAC.cdsTLPrecio.FieldByName('LPREPDCTOG').AsFloat);
                  edtDsto2.setfocus;
                  Exit;
               End;
            End;
         End;
         xDscto2 := FRound(strtofloat(edtDsto2.text), 15, 4);
      End;

      If length(dbeCantUA.Text) > 0 Then
      Begin
         xWhere := 'EUNMID1=' + QuotedStr(dbeUmg.Text);
         DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmG.text), 'EUNMEQ');
         If length(DMFAC.cdsQry.FieldByName('EUNMEQ').AsString) = 0 Then
            Raise exception.Create('Esta unidad no tiene Equivalencia!!!')
         Else
            xValor := strtofloat(DMFAC.cdsQry.FieldByName('EUNMEQ').AsString);

         xFrac := strtofloat(dbeCantUA.Text) / xValor;
         xImporte1 := FRound(strtofloat(dbePrecioG.Text) * (strtofloat(dbeCantGA.text) + xFrac), 15, 4);
      End
      Else
         xImporte1 := FRound(strtofloat(dbePrecioG.Text) * strtofloat(dbeCantGA.text), 15, 4);

      xTotD1 := xImporte1 * (xDscto1 / 100);
      xSubtot1 := FRound(xImporte1 - xTotD1, 15, 4);
      xTotD2 := xSubtot1 * (xDscto2 / 100);
      xTot := FRound(xSubtot1 - xTotD2, 15, 4);

      dbeMontoDCTO2.text := FloatToStr(FRound(xTotD2, 15, 2));
      dbeImporte.text := floattostrf(xTot, ffnumber, 15, 2);
      dbeImporteIGV.text := FloatToStr(FRound(xTot * (1 + StrToFloat(xImpTasa) / 100), 15, 2));

      If length(dbeGarantia.text) > 0 Then
         dbeDGarantia.text := dbeGarantia.text
      Else
         bbtnRegOk.SetFocus;
   End;
End;

Procedure TFProforma.edtDsto1KeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In ['A'..'Z', 'a'..'z',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '-', '_'] Then
      Key := #0;
End;

Procedure TFProforma.edtDsto2Exit(Sender: TObject);
Var
   xDscto1, xDscto2, xImporte1, xSubTot1, xTot, xTotD1, xTotD2, xFrac: Double;
   xWhere: String;
   xValor: Double;
   xSQL, xIGVSN: String;
Begin
   If Not bbtnRegCanc.Focused Then
   Begin
      If dbePorcentaje.text = '' Then
         xDscto1 := 0
      Else
         xDscto1 := FRound(strtofloat(dbePorcentaje.text), 15, 4);

      If edtDsto2.text = '' Then
         xDscto2 := 0
      Else
      Begin
         If StrToFloat(edtDsto2.Text) < 0 Then
         Begin
            ShowMessage('Ingrese un Descuento mayor/igual a cero');
            edtDsto2.Text := '';
            edtDsto2.SetFocus;
            Exit;
         End
         Else
         Begin
            If StrToFloat(edtDsto2.Text) > 100 Then
            Begin
               Beep;
               MessageDlg('El Descuento No debe ser Mayor de 100', mtInformation, [mbOk], 0);
               edtDsto2.Clear;
               edtDsto2.SetFocus;
               Exit;
            End
            Else
            Begin
               If ((StrToFloat(edtDsto2.text) > DMFAC.cdsTLPrecio.FieldByName('LPREPDCTOG').AsFloat)
                  And (DMFAC.cdsTLPrecio.FieldByName('LPREFLAGD').AsString = 'S')) Then
               Begin
                  Showmessage('El Descuento no puede ser mayor al de la Lista de Precios');
                  edtDsto2.text := floattostr(DMFAC.cdsTLPrecio.FieldByName('LPREPDCTOG').AsFloat);
                  edtDsto2.setfocus;
                  Exit;
               End;
            End;
         End;
         xDscto2 := FRound(strtofloat(edtDsto2.text), 15, 4);
      End;

      If length(dbeCantUA.Text) > 0 Then
      Begin
         xWhere := 'EUNMID1=' + QuotedStr(dbeUmg.Text);
         DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmG.text), 'EUNMEQ');
         If length(DMFAC.cdsQry.FieldByName('EUNMEQ').AsString) = 0 Then
            Raise exception.Create('Esta unidad no tiene Equivalencia!!!')
         Else
            xValor := strtofloat(DMFAC.cdsQry.FieldByName('EUNMEQ').AsString);

         xFrac := strtofloat(dbeCantUA.Text) / xValor;
         xImporte1 := FRound(strtofloat(dbePrecioG.Text) * (strtofloat(dbeCantGA.text) + xFrac), 15, 4);
      End
      Else
         xImporte1 := FRound(strtofloat(dbePrecioG.Text) * strtofloat(dbeCantGA.text), 15, 4);

      xTotD1 := xImporte1 * (xDscto1 / 100);
      xSubtot1 := FRound(xImporte1 - xTotD1, 15, 4);
      xTotD2 := xSubtot1 * (xDscto2 / 100);
      xTot := FRound(xSubtot1 - xTotD2, 15, 4);

      dbeMontoDCTO2.text := FloatToStr(FRound(xTotD2, 15, 2));
      dbeImporte.text := floattostrf(xTot, ffnumber, 15, 2);

      xSQL := 'CIAID =' + QuotedStr(dblcCia.Text) + ' AND TINID =' + QuotedStr(dblcTInv.Text) + ' AND ARTID =' + QuotedStr(dblcdArticulo.Text);
      xIGVSN := DMFAC.BuscaQry('dspUltTGE', 'TGE205', 'ARTIGV', xSQL, 'ARTIGV');

      If xIGVSN = 'N' Then
         dbeImporteIGV.text := FloatToStr(FRound(xTot, 15, 2))
      Else
         dbeImporteIGV.text := FloatToStr(FRound(xTot * (1 + StrToFloat(xImpTasa) / 100), 15, 2));

      If length(dbeGarantia.text) > 0 Then
         dbeDGarantia.text := dbeGarantia.text
      Else
         bbtnRegOk.SetFocus;
   End;
End;

Procedure TFProforma.bbtnRegOkClick(Sender: TObject);
Var
   xfiltro, sArticulo, sArtDes, xUm, xClie: String;
   xPrecio, xTotDscto1, xTotDscto2,
      xImporte, xSTotal, xTotal, xTotImp1, xTotImp2, xPVentaTot: double;
   bContenido: boolean;
   xValor, xCtPedida, xCtAceptada, xDscto1, xDscto2, xImp1, xImp2: double;
   xIGVSN, xSQL: String;
Begin
// Por 'C'onsumo de Artículos

   If pnlRegistro.Visible Then
      pnlRegistro.Width := 400;

   If Not ConsistenciaDet Then Exit;

   Screen.Cursor := crHourGlass;

   xCtPedida := 0;
   xCtAceptada := 0;
   xDscto1 := 0;
   xDscto2 := 0;
   xPrecio := 0;
   xImp1 := 0;
   xImp2 := 0;

   sArticulo := dblcdArticulo.text;
   sArtDes := copy(Trim(dbeArticulo.text), 1, 60);
   xPrecio := FRound(strtofloat(dbePrecioG.text), 15, 4);
   xCtPedida := FRound(strtofloat(dbeCtdadG.text), 15, 4);
   xCtAceptada := fRound(strtofloat(dbeCantGA.text), 15, 4);

   If length(dbePorcentaje.text) > 0 Then // Descuento a nivel de Condicion comercial
      xDscto1 := FRound(strtofloat(dbePorcentaje.text), 8, 4)
   Else
      xDscto1 := 0;

   If length(edtDsto2.text) > 0 Then
      xDscto2 := FRound(strtofloat(edtDsto2.text), 8, 4)
   Else
      xDscto2 := 0;

   xImp1 := StrToFloat(xImpTasa);
   xImp2 := 0;

   If length(dbeCtdadU.Text) > 0 Then //Cantidad Pedida
   Begin
      xValor := strtofloat(DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmg.Text), 'EUNMEQ'));
      xCtPedida := Fround(xCtPedida + (strtofloat(dbeCtdadU.Text) / xValor), 15, 4); //Cantidad Pedida
   End;
   If length(dbeCantUA.Text) > 0 Then //Cantidad Aceptada
   Begin
      xValor := strtofloat(DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmg.Text), 'EUNMEQ'));
      xCtAceptada := Fround(xCtAceptada + (strtofloat(dbeCantUA.Text) / xValor), 15, 4);
   End;

   xImporte := FRound(xPrecio * xCtAceptada, 15, 4);
   xTotDscto1 := xImporte * (xDscto1 / 100);
   xStotal := FRound((xImporte - xTotDscto1), 15, 4);

   If xDscto2 > 0 Then
      xTotDscto2 := xStotal * (xDscto2 / 100)
   Else
      xTotDscto2 := 0;

   xTotal := FRound(xStotal - xTotDscto2, 15, 4); // base imponible

   xSQL := 'CIAID =' + QuotedStr(dblcCia.Text) + ' AND TINID =' + QuotedStr(dblcTInv.Text) + ' AND ARTID =' + QuotedStr(dblcdArticulo.Text);
   xIGVSN := DMFAC.BuscaQry('dspUltTGE', 'TGE205', 'ARTIGV', xSQL, 'ARTIGV');
   If xIGVSN = 'N' Then
   Begin
      xImp1 := 0.00;
      xTotImp1 := 0.00;
   End
   Else
      xTotImp1 := FRound(xTotal * (xImp1 / 100), 15, 4);

   xTotImp2 := FRound(xTotal * (xImp2 / 100), 15, 4); // impuesto2

   xPVentaTot := FRound(xTotal + xTotImp1 + xTotImp2, 15, 2); // precio de venta total
   xTotImp1 := FRound(xTotImp1, 15, 2);
   xTotImp2 := FRound(xTotImp2, 15, 2);
   xTotal := FRound(xPVentaTot - xTotImp1 - xTotImp2, 15, 2);

   If xFlagInsert Then
   Begin
      DMFAC.cdsDetProf.Insert;
      DMFAC.cdsDetProf.FieldByName('DPROFITEM').AsString := DMFAC.StrZero(DMFAC.MaxValue('DPROFITEM', DMFAC.cdsDetProf), 3);
   End
   Else
      DMFAC.cdsDetProf.Edit;

   DMFAC.cdsDetProf.FieldByName('CIAID').AsString := DMFAC.cdsProforma.FieldByName('CIAID').AsString;
   DMFAC.cdsDetProf.FieldByName('CLIEID').AsString := DMFAC.cdsProforma.FieldByName('CLIEID').AsString;
   DMFAC.cdsDetProf.FieldByName('PROFID').AsString := DMFAC.cdsProforma.FieldByName('PROFID').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFESTADO').AsString := 'PROFORMA'; // Activo
   DMFAC.cdsDetProf.FieldByName('CLAUXID').AsString := DMFAC.cdsProforma.FieldByName('CLAUXID').AsString;
   DMFAC.cdsDetProf.FieldByName('TMONID').AsString := DMFAC.cdsProforma.FieldByName('TMONID').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat := FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 7, 3);
   DMFAC.cdsDetProf.FieldByName('DPROFSIT').AsString := 'INICIAL'; // Activo
   DMFAC.cdsDetProf.FieldByName('DPROFUSER').AsString := DMFAC.wUsuario;
   DMFAC.cdsDetProf.FieldByName('DPROFFECHA').value := dtpFPed.Date;
   DMFAC.cdsDetProf.FieldByName('DPROFFREG').Value := DMFAC.DateS;
   DMFAC.cdsDetProf.FieldByName('PROFTCLI').AsString := DMFAC.cdsProforma.FieldByName('PROFTCLI').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFARTIAN').AsString := 'N'; //Flag de Item no anulado en compras
   If (DMFAC.SRV_D = 'DB2NT') Or (DMFAC.SRV_D = 'DB2400') Then
   Begin
      DMFAC.cdsDetProf.FieldByName('DPROFHREG').Value := Time;
      DMFAC.cdsDetProf.FieldByName('DPROFHOR').AsDateTime := Time;
   End
   Else
      If DMFAC.SRV_D = 'ORACLE' Then
      Begin
         DMFAC.cdsDetProf.FieldByName('DPROFHREG').Value := DMFAC.DateS;
         DMFAC.cdsDetProf.FieldByName('DPROFHOR').AsDateTime := DMFAC.DateS;
      End;
   DMFAC.cdsDetProf.FieldByName('DPROFANOMES').AsString := DMFAC.cdsProforma.FieldByName('PROFANOMES').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFAAAA').AsString := DMFAC.cdsProforma.FieldByName('PROFAAAA').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFMM').AsString := DMFAC.cdsProforma.FieldByName('PROFMM').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFDD').AsString := DMFAC.cdsProforma.FieldByName('PROFDD').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFTRI').AsString := DMFAC.cdsProforma.FieldByName('PROFTRI').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFSEM').AsString := DMFAC.cdsProforma.FieldByName('PROFDSEM').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFSS').AsString := DMFAC.cdsProforma.FieldByName('PROFSS').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFAATRI').AsString := DMFAC.cdsProforma.FieldByName('PROFAATRI').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFAASEM').AsString := DMFAC.cdsProforma.FieldByName('PROFAASEM').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFAASS').AsString := DMFAC.cdsProforma.FieldByName('PROFAASS').AsString;

   DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat := FRound(xPrecio, 15, 4); //Precio

   //DESCUENTO 01
   DMFAC.cdsDetProf.FieldByName('DPROFDCTO1').AsFloat := FRound(xDscto1, 15, 4); //Porcentaje Descuentos 1
   DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat := FRound(xTotDscto1, 15, 4); //Monto Descuento 1

   //Descuentos 02
   DMFAC.cdsDetProf.FieldByName('DPROFDCTO2').AsFloat := FRound(xDscto2, 15, 4); //Porcentaje Descuentos 2
   DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat := FRound(xTotDscto2, 15, 4); //Monto Descuento 2

   DMFAC.cdsDetProf.FieldByName('DPROFIMP1').AsFloat := FRound(xImp1, 15, 4); //Porcentaje Impuesto 1
   DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat := FRound(xTotImp1, 15, 4); //Monto Impuesto 1

   DMFAC.cdsDetProf.FieldByName('DPROFIMP2').AsFloat := FRound(xImp2, 15, 4); //Porcentaje Impuesto 2
   DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat := FRound(xTotImp2, 15, 4); //Monto Impuesto 2

   DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat := FRound(xTotal, 15, 4); //Montos
   DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat := FRound(xPVentaTot, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2

   DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat := xCtPedida;

   DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat := xCtAceptada;
   DMFAC.cdsDetProf.FieldByName('DPROFPREVMO').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat, 15, 4);

   If (DMFAC.cdsDetProf.FieldByName('TMONID').AsString = DMFAC.wTMonLoc) Then
   Begin
      DMFAC.cdsDetProf.FieldByName('DPROFPREUMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFDCTOMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFDTOMN2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFMTOMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat, 15, 4);

      DMFAC.cdsDetProf.FieldByName('DPROFVTOTMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
      DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN1').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat, 15, 4); //Monto Impuesto 2

      If DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat > 0 Then
      Begin
         DMFAC.cdsDetProf.FieldByName('DPROFPREUME').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4); //Precios
         DMFAC.cdsDetProf.FieldByName('DPROFDCTOME').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4); //descuentos 1
         DMFAC.cdsDetProf.FieldByName('DPROFDTOME2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4); //descuentos 2
         DMFAC.cdsDetProf.FieldByName('DPROFMTOME').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
         DMFAC.cdsDetProf.FieldByName('DPROFVTOTME').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
         DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE1').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
         DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
      End;
   End
   Else
   Begin
      DMFAC.cdsDetProf.FieldByName('DPROFPREUME').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat;
      DMFAC.cdsDetProf.FieldByName('DPROFPREUMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFDCTOMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4); //Descuentos
      DMFAC.cdsDetProf.FieldByName('DPROFDCTOME').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat;
      DMFAC.cdsDetProf.FieldByName('DPROFDTOMN2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4); //Descuentos
      DMFAC.cdsDetProf.FieldByName('DPROFDTOME2').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat;
      DMFAC.cdsDetProf.FieldByName('DPROFMTOMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFMTOME').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat;

      DMFAC.cdsDetProf.FieldByName('DPROFVTOTMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFVTOTME').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat, 15, 4);

      DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN1').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE1').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat, 15, 4);

      DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat, 15, 4);
   End;

   xFiltro := 'CIAID=' + QuotedStr(dblcCia.Text) + ' AND TINID =' + QuotedStr(dblcTInv.Text) + ' and ARTID=' + QuotedStr(dblcdArticulo.Text);

   Filtracds(DMFAC.cdsUltTGE, 'SELECT GRARID, FAMID, SFAMID, TINID, ARTCONT, UNMIDG, UNMIDU, ARTIGV, ARTISC FROM TGE205 WHERE ' + xFiltro);
   //Llenado de Campos del Maestro de Articulos
   DMFAC.cdsDetProf.FieldByName('GRARID').AsString := DMFAC.cdsUltTGE.FieldByName('GRARID').AsString; // Linea
   DMFAC.cdsDetProf.FieldByName('FAMID').AsString := DMFAC.cdsUltTGE.FieldByName('FAMID').AsString; // Familia
   DMFAC.cdsDetProf.FieldByName('SFAMID').AsString := DMFAC.cdsUltTGE.FieldByName('SFAMID').AsString; // SubFamilia
   DMFAC.cdsDetProf.FieldByName('TINID').AsString := DMFAC.cdsUltTGE.FieldByName('TINID').AsString; // SubFamilia
   DMFAC.cdsDetProf.FieldByName('DPROFIGV').AsString := DMFAC.cdsUltTGE.FieldByName('ARTIGV').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFISC').AsString := DMFAC.cdsUltTGE.FieldByName('ARTISC').AsString;
   bContenido := (DMFAC.cdsUltTGE.FieldByName('ARTCONT').AsInteger > 1);

   If Not bContenido Then
   Begin
      DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
      DMFAC.cdsDetProf.FieldByName('UNMIDO').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
      DMFAC.cdsDetProf.FieldByName('UNMABR').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
      DMFAC.cdsDetProf.FieldByName('CONTENIDO').AsString := 'S';
   End
   Else
      If (cbTipoUm.ItemIndex = 0) Then //General
      Begin
         DMFAC.cdsDetProf.FieldByName('CONTENIDO').AsString := 'S';
         DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString;
         DMFAC.cdsDetProf.FieldByName('UNMIDO').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
         DMFAC.cdsDetProf.FieldByName('UNMABR').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
      End
      Else
         If (cbTipoUm.ItemIndex = 1) Then //Unitaria
         Begin
            DMFAC.cdsDetProf.FieldByName('CONTENIDO').AsString := 'N';
            DMFAC.cdsDetProf.FieldByName('UNMIDU').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDU').AsString; // Unid.Medida Unit
            DMFAC.cdsDetProf.FieldByName('UNMIDO').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDU').AsString; // Un.de Medida  Gen
            DMFAC.cdsDetProf.FieldByName('UNMABR').AsString := DMFAC.cdsUltTGE.FieldByName('UNMIDU').AsString; // Un.de Medida  Gen
         End;
   DMFAC.cdsUltTGE.Close;
   xUm := DMFAC.cdsDetProf.FieldByName('UNMIDO').AsString;

   If DMFAC.cdsDetProf.FieldByName('ALMID').AsString = '' Then
      DMFAC.cdsDetProf.FieldByName('ALMID').AsString := DMFAC.cdsTLPrecio.FIELDBYNAME('ALMID').ASSTRING;

   DMFAC.cdsDetProf.FieldByName('ARTID').AsString := sArticulo;
   DMFAC.cdsDetProf.FieldByName('TIPOADQ').AsString := sTipoRQS;
   DMFAC.cdsDetProf.FieldByName('ARTDES').AsString := sArtDes;

   DMFAC.cdsDetProf.FieldByName('DPROFSALDO').AsFloat := xCtAceptada;
   DMFAC.cdsDetProf.FieldByName('DPROFGARAN').AsString := dbeDGarantia.text;
   DMFAC.cdsDetProf.FieldByName('CLIECREMAX').AsFloat := FRound(DMFAC.cdsProforma.FieldByName('CLIECREMAX').AsFloat, 15, 2);
   DMFAC.cdsDetProf.FieldByName('CLIERUC').AsString := DMFAC.cdsProforma.FieldByName('CLIERUC').AsString; // Monto Dsctos
   If DMFAC.cdsDetProf.FieldByName('CLIERUC').AsString = '' Then
      DMFAC.cdsDetProf.FieldByName('CLIERUC').AsString := '00000000000';

   DMFAC.cdsDetProf.FieldByName('TLISTAID').AsString := DMFAC.cdsProforma.FieldByName('TLISTAID').Asstring; // Monto Dsctos
   DMFAC.cdsDetProf.FieldByName('FPAGOID').AsString := DMFAC.cdsProforma.FieldByName('FPAGOID').AsString;
   DMFAC.cdsDetProf.FieldByName('VEID').AsString := DMFAC.cdsProforma.FieldByName('VEID').AsString;
   DMFAC.cdsDetProf.FieldByName('LOCID').AsString := DMFAC.cdsProforma.FieldByName('LOCID').AsString;
   DMFAC.cdsDetProf.FieldByName('PROV').AsString := dblcProv.text;
   DMFAC.cdsDetProf.FieldByName('DPROFFLAGV').AsString := '.';
   DMFAC.cdsDetProf.FieldByName('DPROFFLAGRE').AsString := 'S'; // agragado 07/03/2001  RA

   If length(edtObservacion.Text) > 0 Then
      DMFAC.cdsDetProf.FieldByName('DPROFOBS').AsString := edtObservacion.Text
   Else
      DMFAC.cdsDetProf.FieldByName('DPROFOBS').AsString := '.';

// Inicio HPC_201805_FAC
// 27/08/2018 retira rutina cdsPost
//   DMFAC.cdsPost(DMFAC.cdsDetProf);
// Fin HPC_201805_FAC

   If cCombo = 'xyz123' Then
   Else
      DMFAC.cdsDetProf.FieldByName('CODCOM').AsString := cCombo;

   DMFAC.cdsDetProf.Post;

   wFlagedi := '';
// Inicio HPC_201801_FAC
// cambio de método de grabación del registro de Detalle de la Proforma
//   DMFAC.ControlTran(9, DMFAC.cdsDetProf, 'DPROF');

   If xFlagInsert Then
   Begin
      dbeDGarantia.text := dbeGarantia.text;
      dbeArticulo.text := '';

      xSQL := 'Insert into DB2ADMIN.FAC312(CIAID, LOCID, TINID, ALMID, PROFID, DPROFITEM, DPROFESTADO, DPROFSIT, '
         + '                               CLAUXID, CLIEID, CLIERUC, GRARID, FAMID, SFAMID, TLISTAID, ARTID, UNMIDG, '
         + '                               UNMABR, DPROFCANTP, TMONID, FPAGOID, DPROFPREUMO, DPROFPREUMN, DPROFPREUME, '
         + '                               DPROFDCTOMO, DPROFDCTOMN, DPROFDCTOME, DPROFMTOMO, DPROFMTOMN, DPROFMTOME, '
         + '                               DPROFUSER, DPROFFREG, DPROFHREG, DPROFTCAM, CLIECREMAX, DPROFIGV, DPROFISC, '
         + '                               DPROFSALDO, DPROFFLAGRE, DPROFDCTO1, DPROFDCTO2, DPROFDTOMO2, DPROFDTOMN2, '
         + '                               DPROFDTOME2, CONTENIDO, PROV, DPROFCANTAC, DPROFARTIAN, VEID, DPROFFECHA, '
         + '                               DPROFHOR, DPROFANOMES, DPROFAAAA, DPROFMM, DPROFDD, DPROFTRI, DPROFSEM, DPROFSS, '
         + '                               DPROFAATRI, DPROFAASEM, DPROFAASS, DPROFOBS, ARTDES, PROFTCLI, TIPOADQ, DPROFIMP1, '
         + '                               DPROFIMP2, DPROFVTOTMO, DPROFVTOTMN, DPROFVTOTME, '
         + '                               DPROFIMPMTO1, DPROFIMPMTN1, DPROFIMPMTE1, DPROFIMPMTO2, DPROFIMPMTN2, DPROFIMPMTE2, '
         + '                               DPROFPREVMO) '
         + '   Values ('+ quotedstr(DMFAC.cdsDetProf.FieldByName('CIAID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('LOCID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('TINID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('ALMID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('PROFID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFITEM').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFESTADO').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSIT').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('CLAUXID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('CLIEID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('CLIERUC').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('GRARID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('FAMID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('SFAMID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('TLISTAID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('ARTID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('UNMABR').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('TMONID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('FPAGOID').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUMN').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUME').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMN').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOME').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOMN').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOME').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFUSER').AsString)+', '
         +  '             trunc(Sysdate), '
         +  '             Sysdate, '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('CLIECREMAX').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFIGV').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFISC').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFSALDO').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFFLAGRE').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTO1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTO2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOMN2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOME2').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('CONTENIDO').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('PROV').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFARTIAN').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('VEID').AsString)+', '
         +                quotedstr(datetostr(DMFAC.cdsDetProf.FieldByName('DPROFFECHA').AsDateTime))+', '
         +  '             Sysdate, '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFANOMES').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAAAA').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFMM').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFDD').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFTRI').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSEM').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSS').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAATRI').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAASEM').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAASS').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFOBS').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('ARTDES').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('PROFTCLI').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('TIPOADQ').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMP1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMP2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMN').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTME').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREVMO').AsFloat)+') ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
      Except
         ShowMessage('No se pudo añadir el Detalle de la Proforma');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End
   Else
   Begin
      xSQL := 'Update DB2ADMIN.FAC312 '
         + '      Set LOCID='+quotedstr(DMFAC.cdsDetProf.FieldByName('LOCID').AsString)+', '
         + '          DPROFESTADO ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFESTADO').AsString)+', '
         + '          DPROFSIT    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSIT').AsString)+', '
         + '          CLAUXID     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('CLAUXID').AsString)+', '
         + '          CLIEID      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('CLIEID').AsString)+', '
         + '          CLIERUC     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('CLIERUC').AsString)+', '
         + '          GRARID      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('GRARID').AsString)+', '
         + '          FAMID       ='+quotedstr(DMFAC.cdsDetProf.FieldByName('FAMID').AsString)+', '
         + '          SFAMID      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('SFAMID').AsString)+', '
         + '          TLISTAID    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('TLISTAID').AsString)+', '
         + '          ARTID       ='+quotedstr(DMFAC.cdsDetProf.FieldByName('ARTID').AsString)+', '
         + '          UNMIDG      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString)+', '
         + '          UNMABR      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('UNMABR').AsString)+', '
         + '          DPROFCANTP  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat)+', '
         + '          TMONID      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('TMONID').AsString)+', '
         + '          FPAGOID     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('FPAGOID').AsString)+', '
         + '          DPROFPREUMO ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat)+', '
         + '          DPROFPREUMN ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUMN').AsFloat)+', '
         + '          DPROFPREUME ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUME').AsFloat)+', '
         + '          DPROFDCTOMO ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat)+', '
         + '          DPROFDCTOMN ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMN').AsFloat)+', '
         + '          DPROFDCTOME ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOME').AsFloat)+', '
         + '          DPROFMTOMO  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat)+', '
         + '          DPROFMTOMN  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOMN').AsFloat)+', '
         + '          DPROFMTOME  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOME').AsFloat)+', '
         + '          DPROFUSER   ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFUSER').AsString)+', '
         + '          DPROFFREG   = trunc(Sysdate), '
         + '          DPROFHREG   = Sysdate, '
         + '          DPROFTCAM   ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat)+', '
         + '          CLIECREMAX  ='+floattostr(DMFAC.cdsDetProf.FieldByName('CLIECREMAX').AsFloat)+', '
         + '          DPROFIGV    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFIGV').AsString)+', '
         + '          DPROFISC    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFISC').AsString)+', '
         + '          DPROFSALDO  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFSALDO').AsFloat)+', '
         + '          DPROFFLAGRE ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFFLAGRE').AsString)+', '
         + '          DPROFDCTO1  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTO1').AsFloat)+', '
         + '          DPROFDCTO2  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTO2').AsFloat)+', '
         + '          DPROFDTOMO2 ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat)+', '
         + '          DPROFDTOMN2 ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOMN2').AsFloat)+', '
         + '          DPROFDTOME2 ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOME2').AsFloat)+', '
         + '          CONTENIDO   ='+quotedstr(DMFAC.cdsDetProf.FieldByName('CONTENIDO').AsString)+', '
         + '          PROV        ='+quotedstr(DMFAC.cdsDetProf.FieldByName('PROV').AsString)+', '
         + '          DPROFCANTAC ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat)+', '
         + '          DPROFARTIAN ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFARTIAN').AsString)+', '
         + '          VEID        ='+quotedstr(DMFAC.cdsDetProf.FieldByName('VEID').AsString)+', '
         + '          DPROFFECHA  ='+quotedstr(datetostr(DMFAC.cdsDetProf.FieldByName('DPROFFECHA').AsDateTime))+', '
         + '          DPROFHOR    = Sysdate, '
         + '          DPROFANOMES ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFANOMES').AsString)+', '
         + '          DPROFAAAA   ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAAAA').AsString)+', '
         + '          DPROFMM     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFMM').AsString)+', '
         + '          DPROFDD     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFDD').AsString)+', '
         + '          DPROFTRI    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFTRI').AsString)+', '
         + '          DPROFSEM    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSEM').AsString)+', '
         + '          DPROFSS     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSS').AsString)+', '
         + '          DPROFAATRI  ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAATRI').AsString)+', '
         + '          DPROFAASEM  ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAASEM').AsString)+', '
         + '          DPROFAASS   ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAASS').AsString)+', '
         + '          DPROFOBS    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFOBS').AsString)+', '
         + '          ARTDES      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('ARTDES').AsString)+', '
         + '          PROFTCLI    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('PROFTCLI').AsString)+', '
         + '          TIPOADQ     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('TIPOADQ').AsString)+', '
         + '          DPROFIMP1   ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMP1').AsFloat)+', '
         + '          DPROFIMP2   ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMP2').AsFloat)+', '
         + '          DPROFVTOTMO ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat)+', '
         + '          DPROFVTOTMN ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMN').AsFloat)+', '
         + '          DPROFVTOTME ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTME').AsFloat)+', '
         + '          DPROFIMPMTO1='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat)+', '
         + '          DPROFIMPMTN1='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN1').AsFloat)+', '
         + '          DPROFIMPMTE1='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE1').AsFloat)+', '
         + '          DPROFIMPMTO2='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat)+', '
         + '          DPROFIMPMTN2='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN2').AsFloat)+', '
         + '          DPROFIMPMTE2='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE2').AsFloat)+', '
        // Inicio FAC-201806
        // retira caracter que genera error
         + '          DPROFPREVMO ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREVMO').AsFloat)+' '
        // Fin FAC-201806
         + '    Where CIAID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('CIAID').AsString)
         + '      and TINID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('TINID').AsString)
         + '      and ALMID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('ALMID').AsString)
         + '      and PROFID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('PROFID').AsString)
         + '      and DPROFITEM='+ quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFITEM').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
      Except
         ShowMessage('No se pudo actualizar el Detalle de la Proforma');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
      pnlDetalle.Enabled := True;
      pnlPie.Enabled := True;
      pnlRegistro.Visible := False;
      If DMFAC.cdsDetProf.RecordCount >= 1 Then
      Begin
         ActualizaCabecera;
      End;
   End;
// Fin HPC_201801_FAC

   InicializaCamposDetalle;
   CalculaFooter;

   xxReservaAnt := 0;

   If pnlRegistro.Visible Then
      dblcdArticulo.SetFocus;

   Screen.Cursor := crDefault;
   wInserta := False;
End;

Procedure TFProforma.bbtnRegCancClick(Sender: TObject);
Var
   xFiltro: String;
Begin
   Screen.Cursor := crHourGlass;

   DMFAC.cdsDetProf.cancelUpdates;
// Inicio HPC_201801_FAC
// actualiza cds de Detalle de Proforma
   xFiltro := 'Select CIAID, LOCID, TINID, ALMID, PROFID, DPROFITEM, DPROFESTADO, DPROFSIT, '
      + '             CLAUXID, CLIEID, CLIERUC, GRARID, FAMID, SFAMID, TLISTAID, ARTID, UNMIDG, '
      + '             UNMIDU, UNMIDO, UNMABR, DPROFCANTP, TMONID, FPAGOID, DPROFPREUMO, DPROFPREUMN, '
      + '             DPROFPREUME, DPROFDCTOMO, DPROFDCTOMN, DPROFDCTOME, DPROFMTOMO, DPROFMTOMN, '
      + '             DPROFMTOME, DPROFUSER, DPROFFREG, DPROFHREG, DPROFTCAM, CLIECREMAX, DPROFIGV, '
      + '             DPROFISC, DPROFCANTAT, DPROFFLAGV, DPROFGARAN, DPROFSALDO, DPROFFLAGRE, DPROFDCTO1, '
      + '             DPROFDCTO2, DPROFDTOMO2, DPROFDTOMN2, DPROFDTOME2, CONTENIDO, DPROFDCTO3, DPROFDTOMO3, '
      + '             DPROFDTOMN3, DPROFDTOME3, STKSACTG, PROV, DPROFCANTAC, DPROFCANTRE, DPROFCANTXA, '
      + '             DPROFFLAGRQ, DPROFARTIAN, VEID, DPROFFECHA, DPROFHOR, DPROFANOMES, DPROFAAAA, DPROFMM, '
      + '             DPROFDD, DPROFTRI, DPROFSEM, DPROFSS, DPROFAATRI, DPROFAASEM, DPROFAASS, DPROFOBS, ARTDES, '
      + '             PROFTCLI, TIPOADQ, DPROFIMP1, DPROFIMP2, DPROFVTOTMO, DPROFVTOTMN, DPROFVTOTME, DPROFIMPMTO1, '
      + '             DPROFIMPMTN1, DPROFIMPMTE1, DPROFIMPMTO2, DPROFIMPMTN2, DPROFIMPMTE2, DPROFPREVMO, FLAGVAR, CODCOM '
      + '        from DB2ADMIN.FAC312 '
      + '       where CIAID=' + QuotedStr(dblcCia.Text)
      + '         and CLIEID=' + QuotedStr(DMFAC.cdsProforma.FieldByName('CLIEID').AsString)
      + '         and PROFID=' + QuotedStr(menoPedido.Text)
      + '       Order by DPROFITEM';
   DMFAC.cdsDetProf.Close;
   DMFAC.cdsDetProf.DataRequest(' ' + xFiltro);
   DMFAC.cdsDetProf.Open;
// Fin HPC_201801_FAC

   If sTipoRQS = 'C' Then
   Begin
      pnlRegistro.Width := 400;
      pnlRegistro.Visible := False;
      pnlDetalle.Enabled := True;
      pnlPie.Enabled := True;
   End
   Else
      If sTipoRQS = 'S' Then
      Begin
         pnlDetalleA.Visible := False;
      End;

   If DMFAC.cdsDetProf.RecordCount >= 1 Then
   Begin
      ActualizaCabecera;
      EstadoDeForma(1, DMFAC.cdsProforma.FieldByName('PROFSIT').AsString, DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString,
         DMFAC.cdsProforma.FieldByName('PROFESTADO').AsString);
      DMFAC.cdsDetProf.Close;
      DMFAC.cdsDetProf.Open;
   End;

   pnlDetalle.Enabled := True;
   pnlPie.Enabled := True;

   CalculaFooter;

   Screen.Cursor := crDefault;
End;

Procedure TFProforma.cbTipoumExit(Sender: TObject);
Begin
   If bbtnRegCanc.Focused Then exit;

   If cbTipoUM.Enabled Then
   Begin
      If (cbtipoUm.Text = '') Then
      Begin
         Showmessage('Error: Seleccione Tipo de U. Medida');
         cbtipoUm.setfocus;
         Exit;
      End
      Else
         If (cbTipoUm.text <> 'General') Then
            If (cbTipoUm.text <> 'Unitario') Then
            Begin
               Showmessage('Error: Tipo de U.Medida errado');
               cbtipoUm.setfocus;
               Exit;
            End;

      Case cbtipoUm.ItemIndex Of
         0:
            Begin //U.M General
               If xLprecio Then
               Begin
                  lblUMPG.caption := xxxUMG;
                  dbeUmG.text := xxxUMG;
                  dbePrecioG.text := floattostr(xxxPVG);
                  xCIgv := 'S';
                  xcIsc := 'N';
               End;
            End; //0

         1:
            Begin //U.M Unitaria
               If xLprecio Then
               Begin
                  lblUMPU.Caption := xxxUMU;
                  dbeUmG.text := xxxUMU;
                  dbePrecioG.text := floattostr(xxxPVU);
                  xCIgv := 'S';
                  xcIsc := 'N';
               End; //LPrecio
            End; //Um unitaria
      End; //Case
      AperturaConsultaSaldos('S'); //Flag para mostrar consulta del stock segun la unidad escogida en el combo
   End;
End;

Procedure TFProforma.AperturaConsultaSaldos(xxFlagE: String);
Begin
   MuestraStock(dblcdArticulo.text, xxFlagE);
End;

Procedure TFProforma.bbtnCloseClick(Sender: TObject);
Begin
   pnlDatos.Visible := False;
   meNoPedido.SetFocus;
End;

Function TFProforma.ExisteArticuloDuplicado(xxArt: String): boolean;
Var
   xRegAct: TBookmark;
   xCont: integer;
Begin
   result := False;
   If DMFAC.cdsDetProf.recordcount > 0 Then
   Begin
      DMFAC.cdsDetProf.DisableControls;
      xRegAct := DMFAC.cdsDetProf.GetBookMark;
      xCont := 0;
      DMFAC.cdsDetProf.First;
      While Not DMFAC.cdsDetProf.Eof Do
      Begin
         If DMFAC.cdsDetProf.FieldByName('ARTID').AsString = xxArt Then
         Begin
            xCont := xCont + 1;
            If xCont >= 1 Then
            Begin
               result := true;
               exit;
            End;
         End;
         DMFAC.cdsDetProf.Next;
      End;
      DMFAC.cdsDetProf.GotoBookmark(xRegAct);
      DMFAC.cdsDetProf.FreeBookmark(xRegAct);
      DMFAC.cdsDetProf.EnableControls;
   End;
End;

Procedure TFProforma.dblcProvExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Not bbtnRegCanc.Focused Then
   Begin
      xWhere := 'PROV=' + Quotedstr(dblcProv.Text);
      edtProv.text := DMFAC.BuscaQry('dspUltTGE', 'TGE201', 'PROVDES', xWhere, 'PROVDES');
      dbeCtdadG.Text := '0';
   End;
End;

Function TFProforma.ConsistenciaDet: Boolean;
Begin
   If sTipoRQS = 'C' Then
   Begin
      If length(dbeArticulo.Text) = 0 Then
      Begin
         dblcdArticulo.SetFocus;
         Raise Exception.Create('Debe Ingresar Articulo');
      End;

   // Inicio HPC_201805_FAC
   // evalua que cantidad no este vacía
      If length(Trim(dbeCtdadG.Text)) = 0 Then
      Begin
         ShowMessage('Ingrese Cantidad');
         dbeCtdadG.SetFocus;
         result:=False;
         Exit;
      End;
   // Fin HPC_201805_FAC

      If ((strtoint(StringReplace(dbeCtdadG.Text, ',', '', [rfReplaceAll])) = 0) And (dbeCtdadU.Enabled = False)) Then
      Begin
         dbeCtdadG.SetFocus;
         Raise Exception.Create('Debe Ingresar Cantidad ');
      End;

      If ((strtofloat(StringReplace(dbeCtdadG.Text, ',', '', [rfReplaceAll])) = 0) And (dbeCtdadU.Enabled = False)) Then
      Begin
         dbeCtdadG.SetFocus;
         Raise Exception.Create('Debe Ingresar Cantidad mayor a cero');
      End;

      If cObsequio = 'S' Then
      Else
      Begin
         If strtofloat(StringReplace(dbePrecioG.Text, ',', '', [rfReplaceAll])) = 0 Then
            Raise Exception.Create('Debe Ingresar Precio');
      End;
   End;
   If sTipoRQS = 'S' Then
   Begin
      If length(memDetalle.Text) = 0 Then
      Begin
         memDetalle.SetFocus;
         Raise Exception.Create('Debe Ingresar Detalle del Servicio a Facturar');
      End;

      If Length(Trim(dbeCnt.Text)) = 0 Then
      Begin
         dbeCnt.SetFocus;
         Raise Exception.Create('Debe Ingresar Cantidad ');
      End;

      If StrToFloat(dbeCnt.Text) = 0 Then
      Begin
         dbeCnt.SetFocus;
         Raise Exception.Create('Debe Ingresar Cantidad Mayor a Cero');
      End;

      If strtofloat(StringReplace(dbePUnit.Text, ',', '', [rfReplaceAll])) = 0 Then
      Begin
         Raise Exception.Create('Debe Ingresar Precio');
      End;
   End;

   Result := True;
End;

Procedure TFProforma.ActualizaCabecera;
Var
   xTMonto, xTDscto, xTotProf {, xTCant}: double;
   xTIgv, xTIsc: double; //Montos Totales de IGV e ISC
   xxTotIgv: double;
// Inicio HPC_201801_FAC
// Variable para ejecución de scripts
   xSQL : String;
// Fin HPC_201801_FAC
Begin
//   If DMFAC.wAdmin = 'G' Then Exit;
 // Calcula Sumatorias del Detalle
   xTMonto := 0; // Sumatoria Monto Total del Detalle
   xTDscto := 0; // Total Descuentos
   xTIgv := 0; // Total IGV
   xTIsc := 0; // Total ISC
   xxTotIGV := 0;

   xTasaIgv := FRound((StrtoFloat(xImpTasa) / 100), 7, 2);

 // Totaliza Montos del Detalle
   DMFAC.cdsDetProf.First;
   DMFAC.cdsDetProf.DisableControls;
   While Not DMFAC.cdsDetProf.eof Do
   Begin
      xTIgv := xTIgv + DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat;
      xTMonto := xTMonto + DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat;
      xTDscto := xTDscto + (DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat + DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat);
      xTotProf := xTotProf + DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat + DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat;
      DMFAC.cdsDetProf.Next;
   End;
   DMFAC.cdsDetProf.EnableControls;

   DMFAC.cdsProforma.Edit;
   DMFAC.cdsProforma.FieldByName('PROFUSER').AsString := DMFAC.wUsuario; // usuario que registra
   DMFAC.cdsProforma.FieldByName('PROFFREG').Value := Date; // fecha que registra Usuario

  // graba sumatorias del detalle en cabecera Fac
  // Si ventas son Local no se aplica embalaje
  // sino se se suma el embalaje al subtotal, en el caso de Provincias
   If (DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString = DMFAC.wVtaLocal) Then //Zona Lima
      DMFAC.cdsProforma.FieldByName('PROFMTOMO').AsFloat := FRound(xTMonto, 15, 2) // Monto
   Else
      If (DMFAC.cdsProforma.FieldByName('TIPVTAID').AsString = DMFAC.wVtaProv) Then // Zona Provincias
         DMFAC.cdsProforma.FieldByName('PROFMTOMO').AsFloat := FRound(xTMonto + DMFAC.cdsProforma.FieldByName('PROFEMBMO').AsFloat, 15, 2) // Monto
      Else
         DMFAC.cdsProforma.FieldByName('PROFMTOMO').AsFloat := FRound(xTMonto, 15, 2);
   DMFAC.cdsProforma.FieldByName('PROFDCTOMO').AsFloat := FRound(xTDscto, 15, 2); // Monto Dsctos

   xIsc := False;
   xIgv := true;
   If xIgv And Not xIsc Then
   Begin
      DMFAC.cdsProforma.FieldByName('PROFIGVMO').AsFloat := FRound(xTIgv, 15, 2);
      DMFAC.cdsProforma.FieldByName('PROFISCMO').AsFloat := FRound(xTIsc, 15, 2);
      DMFAC.cdsProforma.FieldByName('PROFTOTMO').AsFloat := FRound(xTotProf, 15, 2); // Monto Totales con IGV
   End;

   If DMFAC.cdsProforma.FieldByName('TMONID').AsString = DMFAC.wTMonLoc Then
   Begin
  //Igv
      If xIgv And Not xIsc Then
      Begin
         DMFAC.cdsProforma.FieldByName('PROFTOTMN').AsFloat := FRound(xTotProf, 15, 2); // Monto Totales con IGV
         DMFAC.cdsProforma.FieldByName('PROFTOTME').Asfloat := FRound(xTotProf / FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 12, 3), 15, 2); // IGV en moneda extranjera
      End;
      DMFAC.cdsProforma.FieldByName('PROFIGVMN').AsFloat := FRound(xTIGV, 15, 2);
      DMFAC.cdsProforma.FieldByName('PROFIGVME').AsFloat := FRound(xTIGV / FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 12, 3), 15, 2); // IGV en moneda extranjera
      DMFAC.cdsProforma.FieldByName('PROFISCMN').AsFloat := FRound(xTISC, 15, 2);
      DMFAC.cdsProforma.FieldByName('PROFISCME').AsFloat := FRound(xTISC / FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 12, 3), 15, 2); // ISC en moneda extranjera
      DMFAC.cdsProforma.FieldByName('PROFMTOMN').AsFloat := FRound(DMFAC.cdsProforma.FieldByName('PROFMTOMO').AsFloat, 15, 2); // Total en moneda local
      DMFAC.cdsProforma.FieldByName('PROFMTOME').AsFloat := FRound(DMFAC.cdsProforma.FieldByName('PROFMTOMO').AsFloat / FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 12, 3), 15, 2); // Total en moneda extranjera
      DMFAC.cdsProforma.FieldByName('PROFDCTOMN').AsFloat := FRound(xTDscto, 15, 2); // Dscto en moneda Local
      DMFAC.cdsProforma.FieldByName('PROFDCTOME').AsFloat := FRound(xTDscto / FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 12, 3), 15, 2); // Dscto en moneda extranjera
      DMFAC.cdsProforma.FieldByName('PROFEMBMN').AsFloat := FRound(DMFAC.cdsProforma.FieldByName('PROFEMBMO').AsFloat, 15, 2);
      DMFAC.cdsProforma.FieldByName('PROFEMBME').AsFloat := FRound(DMFAC.cdsProforma.FieldByName('PROFEMBMO').AsFloat / FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 12, 3), 15, 2)
   End
   Else
   Begin
      If xIgv And Not xIsc Then
      Begin
         DMFAC.cdsProforma.FieldByName('PROFTOTMN').Asfloat := FRound(xTotProf * FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 12, 3), 15, 2); // IGV en moneda extranjera
         DMFAC.cdsProforma.FieldByName('PROFTOTME').Asfloat := FRound(xTotProf, 15, 2); // Monto Totales con IGV
      End;
      DMFAC.cdsProforma.FieldByName('PROFMTOMN').AsFloat := FRound(DMFAC.cdsProforma.FieldByName('PROFMTOMO').AsFloat * FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 12, 3), 15, 2); // Total en moneda local
      DMFAC.cdsProforma.FieldByName('PROFMTOME').AsFloat := FRound(DMFAC.cdsProforma.FieldByName('PROFMTOMO').AsFloat, 15, 2); // Total en moneda extranjera
      DMFAC.cdsProforma.FieldByName('PROFDCTOMN').AsFloat := FRound(xTDscto * FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 12, 3), 15, 2); // Dscto en moneda Local
      DMFAC.cdsProforma.FieldByName('PROFDCTOME').AsFloat := FRound(xTDscto, 15, 4); // Dscto en moneda extranjera
      DMFAC.cdsProforma.FieldByName('PROFIGVMN').AsFloat := FRound(xTIGV * FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 12, 3), 15, 2);
      DMFAC.cdsProforma.FieldByName('PROFIGVME').AsFloat := FRound(xTIGV, 15, 2); // IGV en moneda extranjera
      DMFAC.cdsProforma.FieldByName('PROFISCMN').AsFloat := FRound(xTISC * FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 12, 3), 15, 2);
      DMFAC.cdsProforma.FieldByName('PROFISCME').AsFloat := FRound(xTISC, 15, 2); // ISC en moneda extranjera
      DMFAC.cdsProforma.FieldByName('PROFEMBMN').AsFloat := FRound(DMFAC.cdsProforma.FieldByName('PROFEMBMO').AsFloat * FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 12, 3), 15, 2);
      DMFAC.cdsProforma.FieldByName('PROFEMBME').AsFloat := FRound(DMFAC.cdsProforma.FieldByName('PROFEMBMO').AsFloat, 15, 2);
   End;
   DMFAC.cdsProforma.Post;

// Inicio HPC_201801_FAC
// cambio de método de grabación de la cabecera de Proforma
//   DMFAC.ControlTran(9, DMFAC.cdsProforma, 'PROF');
   xSQL := 'Update DB2ADMIN.FAC311 '
      + '      Set PROFIGVMO ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFIGVMO').AsFloat)+', '
      + '          PROFISCMO ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFISCMO').AsFloat)+', '
      + '          PROFTOTMO ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFTOTMO').AsFloat)+', '
      + '          PROFTOTMN ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFTOTMN').AsFloat)+', '
      + '          PROFTOTME ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFTOTME').Asfloat)+', '
      + '          PROFIGVMN ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFIGVMN').AsFloat)+', '
      + '          PROFIGVME ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFIGVME').AsFloat)+', '
      + '          PROFISCMN ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFISCMN').AsFloat)+', '
      + '          PROFISCME ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFISCME').AsFloat)+', '
      + '          PROFMTOMN ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFMTOMN').AsFloat)+', '
      + '          PROFMTOME ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFMTOME').AsFloat)+', '
      + '          PROFDCTOMN='+floattostr(DMFAC.cdsProforma.FieldByName('PROFDCTOMN').AsFloat)+', '
      + '          PROFDCTOME='+floattostr(DMFAC.cdsProforma.FieldByName('PROFDCTOME').AsFloat)+', '
      + '          PROFEMBMN ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFEMBMN').AsFloat)+', '
      + '          PROFEMBME ='+floattostr(DMFAC.cdsProforma.FieldByName('PROFEMBME').AsFloat)+', '
      + '          PROFUSER  ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFUSER').AsString)+','
      + '          PROFFREG  = trunc(Sysdate), '
      + '          PROFHREG  = Sysdate '
      + '    where CIAID='+quotedstr(DMFAC.cdsProforma.FieldByName('CIAID').AsString)
      + '      and TINID='+quotedstr(DMFAC.cdsProforma.FieldByName('TINID').AsString)
      + '      and ALMID='+quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)
      + '      and PROFID='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
   Except
      ShowMessage('No se pudo actualizar (2) la Proforma');
      Exit;
   End;
// Fin HPC_201801_FAC

// Inicio HPC_201805_FAC
// retira actualización del filtro porque demora mucho, y aqui no es necesario porque está en el detalle
   {
   If DMFAC.wTipoAdicion = 'xFiltro' Then
   Begin
      DMFAC.ActualizaFiltro(GPedido, DMFAC.cdsProforma, DMFAC.wModo);
   End;
   }
// Fin HPC_201805_FAC

   Z2bbtnImprime.enabled := true;
End;

Procedure TFProforma.Muestrastock(xxArticulo, xxEstado: String);
Var
   xFiltro, sAno: String;
   xUnidad: Boolean; //True  UMG , False UMU
   xSaldoG, xSaldoU: Double;
   xAno, xMes, xDia: Word;
// Inicio HPC_201701_FAC
// Variable Año+Mes
   wAnoMes: String;
   sAlmacen: String;
// Fin HPC_201701_FAC
Begin
   DecodeDate(dtpFPed.Date, xAno, xMes, xDia);
   sAno := IntToStr(xAno);

// Inicio HPC_201701_FAC
// 06/04/2017 Define variable Año+Mes=Año+Mes de la Fecha del Sistema
   wAnoMes := inttostr(wAno) + DMFAC.Strzero(inttostr(xMes), 2);
// Fin HPC_201701_FAC

   xUnidad := False;
   DMFAC.cdsQry4.ProviderName := 'prvEjecuta';
   DMFAC.cdsQry4.close;
// Inicio HPC_201701_FAC
// retira código que diferencia BD diferente a Oracle
// retira condicional para Unidades de Medida Diferentes
   {
   If (xxEstado = 'S') Then
   Begin
      Case cbtipoUm.ItemIndex Of
         0:
            Begin //U.M General
               If (dblcAlmacen.text <> '') Then
               Begin
               // Inicio HPC_201701_FAC
               // 06/04/2017
               // Retira SQL de Otras BD diferente de Oracle
               // Deja sin efecto Consulta a antigua tabla de Saldos LOG316, cambia a LOG319
                  xFiltro := 'SELECT A.ALMID, B.ALMDES, A.ARTCONT, A.ARTID, ';
                  xFiltro := xFiltro + DMFAC.wReplacCeros + '(A.STKSACTG,0) - ' + DMFAC.wReplacCeros + '(A.STKRACTG,0) AS STKSACTG';
                  If (DMFAC.SRV_D = 'DB2NT') Or (DMFAC.SRV_D = 'DB2400') Then
                  Begin
                     xFiltro := xFiltro + ' FROM LOG316 A';
                     xFiltro := xFiltro + ' LEFT JOIN TGE151 B ON (A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.TINID=B.TINID AND A.ALMID=B.ALMID)';
                     xFiltro := xFiltro + ' WHERE A.CIAID=' + QuotedStr(dblcCia.Text);
                     xFiltro := xFiltro + ' AND A.LOCID=' + QuotedStr(dblcLocal.Text);
                     xFiltro := xFiltro + ' AND A.TINID=' + QuotedStr(dblcTInv.Text);
                     xFiltro := xFiltro + ' AND A.ALMID=' + QuotedStr(dblcAlmacen.Text);
                     xFiltro := xFiltro + ' AND A.ARTID=' + QuotedStr(xxArticulo);
                     xFiltro := xFiltro + ' AND A.ALMID=' + QuotedStr(dblcAlmacen.Text);
                     xFiltro := xFiltro + ' AND A.STKANO=' + QuotedStr(sAno);
                     xFiltro := xFiltro + ' AND A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.TINID=B.TINID AND A.ALMID=B.ALMID';
                     xUnidad := true;
                  End
                  Else
                     If DMFAC.SRV_D = 'ORACLE' Then
                     Begin
                        xFiltro := xFiltro + ' FROM LOG316 A, TGE151 B';
                        xFiltro := xFiltro + ' WHERE A.CIAID=' + QuotedStr(dblcCia.text);
                        xFiltro := xFiltro + ' AND A.LOCID=' + QuotedStr(dblcLocal.text);
                        xFiltro := xFiltro + ' AND A.TINID=' + QuotedStr(dblcTInv.Text);
                //xFiltro := xFiltro + ' AND A.ALMID='+QuotedStr(dblcAlmacen.text);
                        xFiltro := xFiltro + ' AND A.ARTID=' + QuotedStr(xxArticulo);
              //xFiltro := xFiltro + ' AND A.ALMID='+QuotedStr(dblcAlmacen.text);
                        xFiltro := xFiltro + ' AND A.STKANO=' + QuotedStr(sAno);
                        xFiltro := xFiltro + ' AND A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.TINID=B.TINID AND A.ALMID=B.ALMID';
                        xFiltro := xFiltro + ' and NVL(A.STKSACTG,0) - NVL(A.STKRACTG,0)>0';
                        xUnidad := true;
                     End;
               End
            End;
         1:
            Begin //U.M Unitario
               If (dblcAlmacen.text <> '') And (xxEstado = 'S') Then
               Begin
                  xFiltro := 'SELECT A.ALMID, A.ARTCONT, B.ALMDES, A.ARTID, ';
                  xFiltro := xFiltro + DMFAC.wReplacCeros + '(A.STKSACTU,0) - ' + DMFAC.wReplacCeros + '(A.STKRACTU,0) AS STKSACTU';
                  If (DMFAC.SRV_D = 'DB2NT') Or (DMFAC.SRV_D = 'DB2400') Then
                  Begin
                     xFiltro := xFiltro + ' FROM LOG316 A';
                     xFiltro := xFiltro + ' LEFT JOIN TGE151 B ON (A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.TINID=B.TINID AND A.ALMID=B.ALMID)';
                     xFiltro := xFiltro + ' WHERE A.CIAID=' + QuotedStr(dblcCia.text);
                     xFiltro := xFiltro + ' AND A.LOCID=' + QuotedStr(dblcLocal.text);
                     xFiltro := xFiltro + ' AND A.TINID=' + QuotedStr(dblcTInv.Text);
                     xFiltro := xFiltro + ' AND A.ALMID=' + QuotedStr(dblcAlmacen.text);
                     xFiltro := xFiltro + ' AND A.ARTID=' + QuotedStr(xxArticulo);
                     xFiltro := xFiltro + ' AND A.ALMID=' + QuotedStr(dblcAlmacen.text);
                     xFiltro := xFiltro + ' AND A.STKANO=' + QuotedStr(sAno);
                     xFiltro := xFiltro + ' AND A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.TINID=B.TINID AND A.ALMID=B.ALMID';
                     xUnidad := False;
                  End
                  Else
                     If (DMFAC.SRV_D = 'ORACLE') Then
                     Begin
                        xFiltro := xFiltro + ' FROM LOG316 A, TGE151 B';
                        xFiltro := xFiltro + ' WHERE A.CIAID=' + QuotedStr(dblcCia.text);
                        xFiltro := xFiltro + ' AND A.LOCID=' + QuotedStr(dblcLocal.text);
                        xFiltro := xFiltro + ' AND A.TINID=' + QuotedStr(dblcTInv.Text);
                        xFiltro := xFiltro + ' AND A.ARTID=' + QuotedStr(xxArticulo);
                        xFiltro := xFiltro + ' AND A.STKANO=' + QuotedStr(sAno);
                        xFiltro := xFiltro + ' AND A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.TINID=B.TINID AND A.ALMID=B.ALMID';
                        xFiltro := xFiltro + ' and NVL(A.STKSACTG,0) - NVL(A.STKRACTG,0)>0';
                        xUnidad := False;
                     End;
               End
            End;
      End; //Case;
   End
   Else
      If (dblcAlmacen.text <> '') Then // de aqui comienza
      Begin
         xFiltro := 'SELECT A.ALMID, A.ARTCONT, B.ALMDES, A.ARTID, ';
         xFiltro := xFiltro + DMFAC.wReplacCeros + '(A.STKSACTG,0) - ' + DMFAC.wReplacCeros + '(A.STKRACTG,0) AS STKSACTG';
         If (DMFAC.SRV_D = 'DB2NT') Or (DMFAC.SRV_D = 'DB2400') Then
         Begin
            xFiltro := xFiltro + ' FROM LOG316 A';
            xFiltro := xFiltro + ' LEFT JOIN TGE151 B ON (A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.TINID=B.TINID AND A.ALMID=B.ALMID)';
            xFiltro := xFiltro + ' WHERE A.CIAID=' + QuotedStr(dblcCia.text);
            xFiltro := xFiltro + ' AND A.LOCID=' + QuotedStr(dblcLocal.text);
            xFiltro := xFiltro + ' AND A.TINID=' + QuotedStr(dblcTInv.Text);
            xFiltro := xFiltro + ' AND A.ALMID=' + QuotedStr(dblcAlmacen.text);
            xFiltro := xFiltro + ' AND A.ARTID=' + QuotedStr(xxArticulo);
            xFiltro := xFiltro + ' AND A.ALMID=' + QuotedStr(dblcAlmacen.text);
            xFiltro := xFiltro + ' AND A.STKANO=' + QuotedStr(sAno);
            xFiltro := xFiltro + ' AND A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.TINID=B.TINID AND A.ALMID=B.ALMID';
            xUnidad := True;
         End
         Else
            If (DMFAC.SRV_D = 'ORACLE') Then
            Begin
               xFiltro := xFiltro + ' FROM LOG316 A, TGE151 B';
               xFiltro := xFiltro + ' WHERE A.CIAID=' + QuotedStr(dblcCia.text);
               xFiltro := xFiltro + ' AND A.LOCID=' + QuotedStr(dblcLocal.text);
               xFiltro := xFiltro + ' AND A.TINID=' + QuotedStr(dblcTInv.Text);
               xFiltro := xFiltro + ' AND A.ARTID=' + QuotedStr(xxArticulo);
               xFiltro := xFiltro + ' AND A.STKANO=' + QuotedStr(sAno);
               xFiltro := xFiltro + ' AND A.CIAID=B.CIAID AND A.LOCID=B.LOCID AND A.TINID=B.TINID AND A.ALMID=B.ALMID';
               xFiltro := xFiltro + ' and NVL(A.STKSACTG,0) - NVL(A.STKRACTG,0)>0';
               xUnidad := True;
            End;
      End;
   }
   sAlmacen := ' and A.ALMID = ' + quotedstr(dblcAlmacen.Text);
   If (dblcCia.Text = '04') And (dblcAlmacen.Text = '14') Then
      sAlmacen := ' and A.ALMID in (''' + dblcAlmacen.Text + ''', ''15'') ';

   xFiltro := 'Select A.ALMID, B.ALMDES, 1 ARTCONT, A.ARTID, '
      + '             nvl(A.STKFIN,0) as STKSACTG '
      + '        from LOG319 A, TGE151 B '
      + '       where A.CIAID=' + QuotedStr(dblcCia.text)
      + '         and A.TINID=' + QuotedStr(dblcTInv.Text)
      + '         and A.ARTID=' + QuotedStr(xxArticulo)
      + '         and A.LOGANOMM(+)=' + QuotedStr(wAnoMes)
      + sAlmacen
      + '         and A.CIAID=B.CIAID AND A.TINID=B.TINID AND A.ALMID=B.ALMID '
      + '         and nvl(A.STKFIN,0)>0';
   xUnidad := true;
// Fin HPC_201701_FAC

   DMFAC.cdsQry4.DataRequest(xFiltro);
   DMFAC.cdsQry4.Open;
   If DMFAC.cdsQry4.RecordCount = 0 Then
   Begin
      bbtnRegCanc.OnClick(Self);
      Raise exception.create('Error: El Articulo ' + xxArticulo + ' no Tiene Stock ');
   End;

   If DMFAC.cdsQry4.FieldByName('STKSACTG').AsFloat = 0 Then
   Begin
      edtObservacion.Visible := False;
      lblCant.Font.Color := clRed;
      lblCant.Caption := 'No Existe Stock para el Artículo Seleccionado';
      lblCant.Visible := True;
    //raise exception.create('Error: El Articulo '+xxArticulo+' no Tiene Ingreso ');
   End;

   If xUnidad Then
   Begin //General
      xSaldog := DMFAC.OperClientDataSet(DMFAC.cdsQry4, 'SUM(STKSACTG)', '');
      dbgStock.ColumnByName('STKSACTG').FooterValue := FloatToStrF(xSaldoG, ffNumber, 12, 2);
      wStockG := FRound(xSaldog, 15, 4);
   End
   Else
   Begin
      xSaldoU := DMFAC.OperClientDataSet(DMFAC.cdsQry4, 'SUM(STKSACTU)', '');
      dbgStock.ColumnByName('STKSACTU').FooterValue := floattostrf(xSaldoU, ffNumber, 12, 2);
      wStockG := FRound(xSaldoU, 15, 4);
   End;
End;

Procedure TFProforma.btnMemServClick(Sender: TObject);
Var
   xClie: String;
Begin
   If pnlDetalleA.Width = 436 Then
      pnlDetalleA.Width := 700
   Else
      pnlDetalleA.Width := 436;

// Inicio HPC_201801_FAC
// Se retira componente dblcdClie, se deja componente dblcdAso
//   If sTipoRQS = 'C' Then
//      xClie := dblcdClie.Text
//   Else
      xClie := dblcdAso.Text;
// Fin HPC_201801_FAC

   wSQL := 'CIAID =' + QuotedStr(dblcCia.Text) + ' ' +
      'AND CLIEID =' + QuotedStr(xClie) + ' ' +
      'AND PROFID =' + QuotedStr(meNoPedido.Text) + ' ' +
      'AND DPROFITEM=' + QuotedStr(dbeItem.Text);
   DMFAC.BuscaQry('dspUltTGE', 'FAC314', 'DARTOBS', wSQL, 'DARTOBS');
   memDetServ.Text := DMFAC.cdsQry.FieldByName('DARTOBS').AsString;

   If Length(Trim(memDetServ.Text)) = 0 Then
      If Length(Trim(memDetalle.Text)) > 0 Then
         memDetServ.Text := memDetalle.Text;
   memDetServ.SetFocus;
End;

Procedure TFProforma.dbePUnitExit(Sender: TObject);
Var
   xTasa, xDscto1, xDscto2, xImporte1, xSubTot1, xTot, xImpTot, xTotD1, xTotD2: double;
Begin
   If Z2bbtnRegCanc.Focused Then Exit;

   If Length(Trim(dbePorcentaje.text)) = 0 Then
      xDscto1 := 0
   Else
      xDscto1 := FRound(strtofloat(dbePorcentaje.text), 15, 4);

   If StrToFloat(dbeDscto.text) < 0 Then
   Begin
      Showmessage('Ingrese un Descuento Mayor/Igual a Cero');
      dbeDscto.Text := '';
      dbeDscto.SetFocus;
      Exit;
   End;

   xDscto2 := FRound(StrToFloat(dbeDscto.text), 15, 4);
   xTasa := 1 + (StrToFloat(dbeImpIgv.Text) / 100) + (StrToFloat(dbeImp2.Text) / 100);

   xImporte1 := FRound(strtofloat(dbePUnit.Text) * strtofloat(dbeCnt.text), 15, 4);
   xTotD1 := xImporte1 * (xDscto1 / 100);
   xSubtot1 := FRound(xImporte1 - xTotD1, 15, 4);
   xTotD2 := xSubtot1 * (xDscto2 / 100);
   xTot := FRound(xSubtot1 - xTotD2, 15, 4);
   xImpTot := FRound(xTot * xTasa, 15, 4);

   dbeValVen.text := floattostrf(xTot, ffnumber, 15, 2);
   dbeImporteS.text := floattostrf(xImpTot, ffnumber, 15, 2);
End;

Procedure TFProforma.Z2bbtnRegOkClick(Sender: TObject);
Var
   xfiltro, sArticulo, sArtDes, xUm, xClie: String;
   xPrecio, xTotDscto1, xTotDscto2,
      xImporte, xSTotal, xTotal, xTotImp1, xTotImp2, xPVentaTot: double;
   bContenido: boolean;
   xValor, xCtPedida, xCtAceptada, xDscto1, xDscto2, xImp1, xImp2: double;
// Inicio HPC_201801_FAC
// Variable para ejecución de scripts
   xSQL : String;
// Fin HPC_201801_FAC
Begin
// Por Servicio
   If Not ConsistenciaDet Then Exit;

   Screen.Cursor := crHourGlass;

   xCtPedida := 0;
   xCtAceptada := 0;
   xDscto1 := 0;
   xDscto2 := 0;
   xPrecio := 0;
   xImp1 := 0;
   xImp2 := 0;

  // Para ingresar servicios con codigo de concesion
   sArticulo := dblcdServicio.Text;

   If Length(Trim(memDetServ.text)) > 0 Then
      sArtDes := Copy(memDetServ.text, 1, 60)
   Else
      sArtDes := Copy(memDetalle.text, 1, 60);

   xPrecio := FRound(strtofloat(dbePUnit.text), 15, 4);
   xCtAceptada := fRound(strtofloat(dbeCnt.text), 15, 4);

   If length(dbePorcentaje.text) > 0 Then // Descuento a nivel de Condicion comercial
      xDscto1 := FRound(strtofloat(dbePorcentaje.text), 8, 4)
   Else
      xDscto1 := 0;

   If length(dbeDscto.text) > 0 Then
      xDscto2 := FRound(strtofloat(dbeDscto.text), 8, 4)
   Else
      xDscto2 := 0;

   If length(dbeImpIgv.text) > 0 Then // Impuesto (Igv)
      xImp1 := FRound(strtofloat(dbeImpIgv.text), 15, 4)
   Else
      xImp1 := 0;

   If length(dbeImp2.text) > 0 Then
      xImp2 := FRound(strtofloat(dbeImp2.text), 15, 4)
   Else
      xImp2 := 0;

   xImporte := FRound(xPrecio * xCtAceptada, 15, 4);
   xTotDscto1 := xImporte * (xDscto1 / 100);
   xStotal := FRound((xImporte - xTotDscto1), 15, 4);

   If xDscto2 > 0 Then
      xTotDscto2 := xStotal * (xDscto2 / 100)
   Else
      xTotDscto2 := 0;

   xTotal := FRound(xStotal - xTotDscto2, 15, 4);
   xTotImp1 := FRound(xTotal * (xImp1 / 100), 15, 4);
   xTotImp2 := FRound(xTotal * (xImp2 / 100), 15, 4);

   xPVentaTot := FRound(xTotal + xTotImp1 + xTotImp2, 15, 2); // precio de venta total
   xTotImp1 := FRound(xTotImp1, 15, 2);
   xTotImp2 := FRound(xTotImp2, 15, 2);
   xTotal := FRound(xPVentaTot - xTotImp1 - xTotImp2, 15, 2);

   If xFlagInsert Then
   Begin
      DMFAC.cdsDetProf.Insert;
      DMFAC.cdsDetProf.FieldByName('DPROFITEM').AsString := DMFAC.StrZero(DMFAC.MaxValue('DPROFITEM', DMFAC.cdsDetProf), 3);
   End
   Else
      DMFAC.cdsDetProf.Edit;

   DMFAC.cdsDetProf.FieldByName('CIAID').AsString := DMFAC.cdsProforma.FieldByName('CIAID').AsString;
   DMFAC.cdsDetProf.FieldByName('CLIEID').AsString := DMFAC.cdsProforma.FieldByName('CLIEID').AsString;
   DMFAC.cdsDetProf.FieldByName('PROFID').AsString := DMFAC.cdsProforma.FieldByName('PROFID').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFESTADO').AsString := 'PROFORMA'; // Activo
   DMFAC.cdsDetProf.FieldByName('CLAUXID').AsString := DMFAC.cdsProforma.FieldByName('CLAUXID').AsString;
   DMFAC.cdsDetProf.FieldByName('TMONID').AsString := DMFAC.cdsProforma.FieldByName('TMONID').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat := FRound(DMFAC.cdsProforma.FieldByName('PROFTCAM').AsFloat, 7, 3);
   DMFAC.cdsDetProf.FieldByName('DPROFSIT').AsString := 'INICIAL'; // Activo
   DMFAC.cdsDetProf.FieldByName('DPROFUSER').AsString := DMFAC.wUsuario;
   DMFAC.cdsDetProf.FieldByName('DPROFFECHA').value := dtpFPed.Date;
   DMFAC.cdsDetProf.FieldByName('DPROFFREG').Value := DMFAC.DateS;
   DMFAC.cdsDetProf.FieldByName('PROFTCLI').AsString := DMFAC.cdsProforma.FieldByName('PROFTCLI').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFARTIAN').AsString := 'N'; //Flag de Item no anulado en compras
   If (DMFAC.SRV_D = 'DB2NT') Or (DMFAC.SRV_D = 'DB2400') Then
   Begin
      DMFAC.cdsDetProf.FieldByName('DPROFHREG').Value := Time;
      DMFAC.cdsDetProf.FieldByName('DPROFHOR').AsDateTime := Time;
   End
   Else
      If DMFAC.SRV_D = 'ORACLE' Then
      Begin
     // vhndema
         DMFAC.cdsDetProf.FieldByName('DPROFHREG').Value := DMFAC.DateS + Time;
         DMFAC.cdsDetProf.FieldByName('DPROFHOR').AsDateTime := DMFAC.DateS + Time;
     //DMFAC.cdsDetProf.FieldByName('DPROFHREG').Value    := DMFAC.DateS+Time;
     //DMFAC.cdsDetProf.FieldByName('DPROFHOR').AsDateTime:= DMFAC.DateS+Time;
     // end vhndema
      End;
   DMFAC.cdsDetProf.FieldByName('DPROFANOMES').AsString := DMFAC.cdsProforma.FieldByName('PROFANOMES').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFAAAA').AsString := DMFAC.cdsProforma.FieldByName('PROFAAAA').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFMM').AsString := DMFAC.cdsProforma.FieldByName('PROFMM').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFDD').AsString := DMFAC.cdsProforma.FieldByName('PROFDD').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFTRI').AsString := DMFAC.cdsProforma.FieldByName('PROFTRI').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFSEM').AsString := DMFAC.cdsProforma.FieldByName('PROFDSEM').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFSS').AsString := DMFAC.cdsProforma.FieldByName('PROFSS').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFAATRI').AsString := DMFAC.cdsProforma.FieldByName('PROFAATRI').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFAASEM').AsString := DMFAC.cdsProforma.FieldByName('PROFAASEM').AsString;
   DMFAC.cdsDetProf.FieldByName('DPROFAASS').AsString := DMFAC.cdsProforma.FieldByName('PROFAASS').AsString;

   DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat := FRound(xPrecio, 15, 4); //Precio

  //DESCUENTO 01
   DMFAC.cdsDetProf.FieldByName('DPROFDCTO1').AsFloat := FRound(xDscto1, 15, 4); //Porcentaje Descuentos 1
   DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat := FRound(xTotDscto1, 15, 4); //Monto Descuento 1

  //Descuentos 02
   DMFAC.cdsDetProf.FieldByName('DPROFDCTO2').AsFloat := FRound(xDscto2, 15, 4); //Porcentaje Descuentos 2
   DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat := FRound(xTotDscto2, 15, 4); //Monto Descuento 2

   DMFAC.cdsDetProf.FieldByName('DPROFIMP1').AsFloat := FRound(xImp1, 15, 4); //Porcentaje Impuesto 1
   DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat := FRound(xTotImp1, 15, 4); //Monto Impuesto 1

   DMFAC.cdsDetProf.FieldByName('DPROFIMP2').AsFloat := FRound(xImp2, 15, 4); //Porcentaje Impuesto 2
   DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat := FRound(xTotImp2, 15, 4); //Monto Impuesto 2

   DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat := FRound(xTotal, 15, 4); //Montos
   DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat := FRound(xPVentaTot, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2

   DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat := xCtAceptada;

   DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat := xCtAceptada;
   DMFAC.cdsDetProf.FieldByName('DPROFPREVMO').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat, 15, 4);

   If (DMFAC.cdsDetProf.FieldByName('TMONID').AsString = DMFAC.wTMonLoc) Then
   Begin
      DMFAC.cdsDetProf.FieldByName('DPROFPREUMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFDCTOMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFDTOMN2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFMTOMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat, 15, 4);

      DMFAC.cdsDetProf.FieldByName('DPROFVTOTMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
      DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN1').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat, 15, 4); //Monto Impuesto 2

      If DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat > 0 Then
      Begin
         DMFAC.cdsDetProf.FieldByName('DPROFPREUME').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4); //Precios
         DMFAC.cdsDetProf.FieldByName('DPROFDCTOME').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4); //descuentos 1
         DMFAC.cdsDetProf.FieldByName('DPROFDTOME2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4); //descuentos 2
         DMFAC.cdsDetProf.FieldByName('DPROFMTOME').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
         DMFAC.cdsDetProf.FieldByName('DPROFVTOTME').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
         DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE1').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
         DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat / DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
      End;
   End
   Else
   Begin
      DMFAC.cdsDetProf.FieldByName('DPROFPREUME').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat;
      DMFAC.cdsDetProf.FieldByName('DPROFPREUMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFDCTOMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4); //Descuentos
      DMFAC.cdsDetProf.FieldByName('DPROFDCTOME').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat;
      DMFAC.cdsDetProf.FieldByName('DPROFDTOMN2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4); //Descuentos
      DMFAC.cdsDetProf.FieldByName('DPROFDTOME2').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat;
      DMFAC.cdsDetProf.FieldByName('DPROFMTOMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFMTOME').AsFloat := DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat;

      DMFAC.cdsDetProf.FieldByName('DPROFVTOTMN').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFVTOTME').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat, 15, 4);

      DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN1').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE1').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat, 15, 4);

      DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat * DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat, 15, 4);
      DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE2').AsFloat := FRound(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat, 15, 4);
   End;

   DMFAC.cdsDetProf.FieldByName('ARTID').AsString := sArticulo;
   DMFAC.cdsDetProf.FieldByName('TINID').AsString := '00';
   DMFAC.cdsDetProf.FieldByName('DPROFITEM').AsString := dbeItem.Text;
   DMFAC.cdsDetProf.FieldByName('TIPOADQ').AsString := sTipoRQS;
   DMFAC.cdsDetProf.FieldByName('ARTDES').AsString := sArtDes;

   DMFAC.cdsDetProf.FieldByName('ALMID').AsString := dblcAlmacen.Text;
   DMFAC.cdsDetProf.FieldByName('GRARID').AsString := '00';
   DMFAC.cdsDetProf.FieldByName('FAMID').AsString := '00';
   DMFAC.cdsDetProf.FieldByName('SFAMID').AsString := '00';
   DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString := 'UND'; // Un.de Medida  Gen
   DMFAC.cdsDetProf.FieldByName('UNMIDO').AsString := 'UND'; // Un.de Medida  Gen
   DMFAC.cdsDetProf.FieldByName('UNMABR').AsString := 'UND'; // Un.de Medida  Gen
   DMFAC.cdsDetProf.FieldByName('DPROFIGV').AsString := 'S';
   DMFAC.cdsDetProf.FieldByName('DPROFISC').AsString := 'N';

   DMFAC.cdsDetProf.FieldByName('DPROFSALDO').AsFloat := xCtAceptada;
   DMFAC.cdsDetProf.FieldByName('DPROFGARAN').AsString := dbeDGarantia.text;
   DMFAC.cdsDetProf.FieldByName('CLIECREMAX').AsFloat := FRound(DMFAC.cdsProforma.FieldByName('CLIECREMAX').AsFloat, 15, 2);
   DMFAC.cdsDetProf.FieldByName('CLIERUC').AsString := DMFAC.cdsProforma.FieldByName('CLIERUC').AsString; // Monto Dsctos
   If DMFAC.cdsDetProf.FieldByName('CLIERUC').AsString = '' Then
      DMFAC.cdsDetProf.FieldByName('CLIERUC').AsString := '00000000000';
   DMFAC.cdsDetProf.FieldByName('TLISTAID').AsString := DMFAC.cdsProforma.FieldByName('TLISTAID').Asstring; // Monto Dsctos
   DMFAC.cdsDetProf.FieldByName('FPAGOID').AsString := DMFAC.cdsProforma.FieldByName('FPAGOID').AsString;
   DMFAC.cdsDetProf.FieldByName('VEID').AsString := DMFAC.cdsProforma.FieldByName('VEID').AsString;
   DMFAC.cdsDetProf.FieldByName('LOCID').AsString := DMFAC.cdsProforma.FieldByName('LOCID').AsString;
   DMFAC.cdsDetProf.FieldByName('PROV').AsString := dblcProv.text;
   DMFAC.cdsDetProf.FieldByName('DPROFFLAGV').AsString := '.';
   DMFAC.cdsDetProf.FieldByName('DPROFFLAGRE').AsString := 'S'; // agragado 07/03/2001  RA

   If length(edtObservacion.Text) > 0 Then
      DMFAC.cdsDetProf.FieldByName('DPROFOBS').AsString := edtObservacion.Text
   Else
      DMFAC.cdsDetProf.FieldByName('DPROFOBS').AsString := '.';

// Inicio HPC_201805_FAC
// 27/08/2018 retira rutina cdsPost
//   DMFAC.cdsPost(DMFAC.cdsDetProf);
// Fin HPC_201805_FAC
   DMFAC.cdsDetProf.Post;

   wFlagedi := '';

// Inicio HPC_201801_FAC
// cambio de método de grabación del registro de Detalle de la Proforma
//   DMFAC.ControlTran(9, DMFAC.cdsDetProf, 'DPROF');
   DMFAC.DCOM1.AppServer.IniciaTransaccion;
   If xFlagInsert Then
   Begin
      xSQL := 'Insert into DB2ADMIN.FAC312(CIAID, LOCID, TINID, ALMID, PROFID, DPROFITEM, DPROFESTADO, DPROFSIT, '
         + '                               CLAUXID, CLIEID, CLIERUC, GRARID, FAMID, SFAMID, TLISTAID, ARTID, UNMIDG, '
         + '                               UNMABR, DPROFCANTP, TMONID, FPAGOID, DPROFPREUMO, DPROFPREUMN, DPROFPREUME, '
         + '                               DPROFDCTOMO, DPROFDCTOMN, DPROFDCTOME, DPROFMTOMO, DPROFMTOMN, DPROFMTOME, '
         + '                               DPROFUSER, DPROFFREG, DPROFHREG, DPROFTCAM, CLIECREMAX, DPROFIGV, DPROFISC, '
         + '                               DPROFSALDO, DPROFFLAGRE, DPROFDCTO1, DPROFDCTO2, DPROFDTOMO2, DPROFDTOMN2, '
         + '                               DPROFDTOME2, CONTENIDO, PROV, DPROFCANTAC, DPROFARTIAN, VEID, DPROFFECHA, '
         + '                               DPROFHOR, DPROFANOMES, DPROFAAAA, DPROFMM, DPROFDD, DPROFTRI, DPROFSEM, DPROFSS, '
         + '                               DPROFAATRI, DPROFAASEM, DPROFAASS, DPROFOBS, ARTDES, PROFTCLI, TIPOADQ, DPROFIMP1, '
         + '                               DPROFIMP2, DPROFVTOTMO, DPROFVTOTMN, DPROFVTOTME, '
         + '                               DPROFIMPMTO1, DPROFIMPMTN1, DPROFIMPMTE1, DPROFIMPMTO2, DPROFIMPMTN2, DPROFIMPMTE2, '
         + '                               DPROFPREVMO) '
         + '   Values ('+ quotedstr(DMFAC.cdsDetProf.FieldByName('CIAID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('LOCID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('TINID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('ALMID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('PROFID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFITEM').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFESTADO').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSIT').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('CLAUXID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('CLIEID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('CLIERUC').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('GRARID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('FAMID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('SFAMID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('TLISTAID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('ARTID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('UNMABR').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('TMONID').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('FPAGOID').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUMN').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUME').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMN').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOME').AsFloat)+', '
// Inicio HPC_201805_FAC
// Faltaba Monto en Moneda Origianl
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat)+', '
// Fin HPC_201805_FAC
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOMN').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOME').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFUSER').AsString)+', '
         +  '             trunc(Sysdate), '
         +  '             Sysdate, '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('CLIECREMAX').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFIGV').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFISC').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFSALDO').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFFLAGRE').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTO1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTO2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOMN2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOME2').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('CONTENIDO').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('PROV').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFARTIAN').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('VEID').AsString)+', '
         +                quotedstr(datetostr(DMFAC.cdsDetProf.FieldByName('DPROFFECHA').AsDateTime))+', '
         +  '             Sysdate, '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFANOMES').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAAAA').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFMM').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFDD').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFTRI').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSEM').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSS').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAATRI').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAASEM').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAASS').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFOBS').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('ARTDES').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('PROFTCLI').AsString)+', '
         +                quotedstr(DMFAC.cdsDetProf.FieldByName('TIPOADQ').AsString)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMP1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMP2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMN').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTME').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE1').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE2').AsFloat)+', '
         +                floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREVMO').AsFloat)+') ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
      Except
         ShowMessage('No se pudo añadir el Detalle de la Proforma');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End
   Else
   Begin
      xSQL := 'Update DB2ADMIN.FAC312 '
         + '      Set LOCID='+quotedstr(DMFAC.cdsDetProf.FieldByName('LOCID').AsString)+', '
         + '          DPROFESTADO ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFESTADO').AsString)+', '
         + '          DPROFSIT    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSIT').AsString)+', '
         + '          CLAUXID     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('CLAUXID').AsString)+', '
         + '          CLIEID      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('CLIEID').AsString)+', '
         + '          CLIERUC     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('CLIERUC').AsString)+', '
         + '          GRARID      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('GRARID').AsString)+', '
         + '          FAMID       ='+quotedstr(DMFAC.cdsDetProf.FieldByName('FAMID').AsString)+', '
         + '          SFAMID      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('SFAMID').AsString)+', '
         + '          TLISTAID    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('TLISTAID').AsString)+', '
         + '          ARTID       ='+quotedstr(DMFAC.cdsDetProf.FieldByName('ARTID').AsString)+', '
         + '          UNMIDG      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString)+', '
         + '          UNMABR      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('UNMABR').AsString)+', '
         + '          DPROFCANTP  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat)+', '
         + '          TMONID      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('TMONID').AsString)+', '
         + '          FPAGOID     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('FPAGOID').AsString)+', '
         + '          DPROFPREUMO ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat)+', '
         + '          DPROFPREUMN ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUMN').AsFloat)+', '
         + '          DPROFPREUME ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUME').AsFloat)+', '
         + '          DPROFDCTOMO ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMO').AsFloat)+', '
         + '          DPROFDCTOMN ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOMN').AsFloat)+', '
         + '          DPROFDCTOME ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTOME').AsFloat)+', '
         + '          DPROFMTOMO  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat)+', '
         + '          DPROFMTOMN  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOMN').AsFloat)+', '
         + '          DPROFMTOME  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOME').AsFloat)+', '
         + '          DPROFUSER   ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFUSER').AsString)+', '
         + '          DPROFFREG   = trunc(Sysdate), '
         + '          DPROFHREG   = Sysdate, '
         + '          DPROFTCAM   ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFTCAM').AsFloat)+', '
         + '          CLIECREMAX  ='+floattostr(DMFAC.cdsDetProf.FieldByName('CLIECREMAX').AsFloat)+', '
         + '          DPROFIGV    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFIGV').AsString)+', '
         + '          DPROFISC    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFISC').AsString)+', '
         + '          DPROFSALDO  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFSALDO').AsFloat)+', '
         + '          DPROFFLAGRE ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFFLAGRE').AsString)+', '
         + '          DPROFDCTO1  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTO1').AsFloat)+', '
         + '          DPROFDCTO2  ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTO2').AsFloat)+', '
         + '          DPROFDTOMO2 ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat)+', '
         + '          DPROFDTOMN2 ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOMN2').AsFloat)+', '
         + '          DPROFDTOME2 ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDTOME2').AsFloat)+', '
         + '          CONTENIDO   ='+quotedstr(DMFAC.cdsDetProf.FieldByName('CONTENIDO').AsString)+', '
         + '          PROV        ='+quotedstr(DMFAC.cdsDetProf.FieldByName('PROV').AsString)+', '
         + '          DPROFCANTAC ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat)+', '
         + '          DPROFARTIAN ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFARTIAN').AsString)+', '
         + '          VEID        ='+quotedstr(DMFAC.cdsDetProf.FieldByName('VEID').AsString)+', '
         + '          DPROFFECHA  ='+quotedstr(datetostr(DMFAC.cdsDetProf.FieldByName('DPROFFECHA').AsDateTime))+', '
         + '          DPROFHOR    = Sysdate, '
         + '          DPROFANOMES ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFANOMES').AsString)+', '
         + '          DPROFAAAA   ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAAAA').AsString)+', '
         + '          DPROFMM     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFMM').AsString)+', '
         + '          DPROFDD     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFDD').AsString)+', '
         + '          DPROFTRI    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFTRI').AsString)+', '
         + '          DPROFSEM    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSEM').AsString)+', '
         + '          DPROFSS     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFSS').AsString)+', '
         + '          DPROFAATRI  ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAATRI').AsString)+', '
         + '          DPROFAASEM  ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAASEM').AsString)+', '
         + '          DPROFAASS   ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFAASS').AsString)+', '
         + '          DPROFOBS    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFOBS').AsString)+', '
         + '          ARTDES      ='+quotedstr(DMFAC.cdsDetProf.FieldByName('ARTDES').AsString)+', '
         + '          PROFTCLI    ='+quotedstr(DMFAC.cdsDetProf.FieldByName('PROFTCLI').AsString)+', '
         + '          TIPOADQ     ='+quotedstr(DMFAC.cdsDetProf.FieldByName('TIPOADQ').AsString)+', '
         + '          DPROFIMP1   ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMP1').AsFloat)+', '
         + '          DPROFIMP2   ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMP2').AsFloat)+', '
         + '          DPROFVTOTMO ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMO').AsFloat)+', '
         + '          DPROFVTOTMN ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTMN').AsFloat)+', '
         + '          DPROFVTOTME ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFVTOTME').AsFloat)+', '
         + '          DPROFIMPMTO1='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat)+', '
         + '          DPROFIMPMTN1='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN1').AsFloat)+', '
         + '          DPROFIMPMTE1='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE1').AsFloat)+', '
         + '          DPROFIMPMTO2='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO2').AsFloat)+', '
         + '          DPROFIMPMTN2='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTN2').AsFloat)+', '
         + '          DPROFIMPMTE2='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMPMTE2').AsFloat)+', '
         + '          DPROFPREVMO ='+floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREVMO').AsFloat)+') '
         + '    Where CIAID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('CIAID').AsString)
         + '      and TINID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('TINID').AsString)
         + '      and ALMID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('ALMID').AsString)
         + '      and PROFID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('PROFID').AsString)
         + '      and DPROFITEM='+ quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFITEM').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
      Except
         ShowMessage('No se pudo actualizar el Detalle de la Proforma');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;

   If Length(Trim(memDetServ.Text)) > 0 Then
   Begin
   // Se retira componente dblcdClie, se deja componente dblcdAso
   //   If length(trim(dblcdAso.Text)) = 0 Then
   //      xClie := dblcdClie.Text
   //   Else
      xClie := dblcdAso.Text;

      wSQL :=  'CIAID =' + QuotedStr(dblcCia.Text) + ' '
         +' AND CLIEID =' + QuotedStr(xClie) + ' '
         +' AND PROFID =' + QuotedStr(meNoPedido.Text) + ' '
         +' AND DPROFITEM=' + QuotedStr(dbeItem.Text);
// Fin HPC_201801_FAC
      DMFAC.cdsDetProfObs2.Close;
      DMFAC.cdsDetProfObs2.DataRequest('SELECT * FROM FAC314 WHERE ' + wSQL);
      DMFAC.cdsDetProfObs2.Open;
      If DMFAC.cdsDetProfObs2.RecordCount = 0 Then
      Begin
         DMFAC.cdsDetProfObs2.Insert;
         DMFAC.cdsDetProfObs2.FieldByName('CIAID').AsString := dblcCia.Text;
         DMFAC.cdsDetProfObs2.FieldByName('CLIEID').AsString := xClie;
         DMFAC.cdsDetProfObs2.FieldByName('PROFID').AsString := meNoPedido.Text;
         DMFAC.cdsDetProfObs2.FieldByName('DPROFITEM').AsString := DMFAC.cdsDetProf.FieldByName('DPROFITEM').AsString;
         DMFAC.cdsDetProfObs2.FieldByName('DARTOBS').AsString := memDetServ.Text;
         DMFAC.cdsDetProfObs2.Post;
// Inicio HPC_201801_FAC
// cambio de método de grabación del registro de Detalle de la Proforma
         xSQL := 'Insert into DB2ADMIN.FAC314(CIAID, CLIEID, PROFID, DPROFITEM, DARTOBS) '
            + '   Values('+quotedstr(DMFAC.cdsDetProfObs2.FieldByName('CIAID').AsString)+','
            +              quotedstr(DMFAC.cdsDetProfObs2.FieldByName('CLIEID').AsString)+','
            +              quotedstr(DMFAC.cdsDetProfObs2.FieldByName('PROFID').AsString)+','
            +              quotedstr(DMFAC.cdsDetProfObs2.FieldByName('DPROFITEM').AsString)+','
            +              quotedstr(DMFAC.cdsDetProfObs2.FieldByName('DARTOBS').AsString)+')';
      End
      Else
      Begin
         DMFAC.cdsDetProfObs2.Edit;
         DMFAC.cdsDetProfObs2.FieldByName('DARTOBS').AsString := memDetServ.Text;
         DMFAC.cdsDetProfObs2.Post;
         xSQL := 'Update DB2ADMIN.FAC314 '
            + '      Set DARTOBS='+quotedstr(DMFAC.cdsDetProfObs2.FieldByName('DARTOBS').AsString)
            + '    where CIAID='+quotedstr(DMFAC.cdsDetProfObs2.FieldByName('CIAID').AsString)
            + '      and CLIEID='+quotedstr(DMFAC.cdsDetProfObs2.FieldByName('CLIEID').AsString)
            + '      and PROFID='+quotedstr(DMFAC.cdsDetProfObs2.FieldByName('PROFID').AsString)
            + '      and DPROFITEM='+quotedstr(DMFAC.cdsDetProfObs2.FieldByName('DPROFITEM').AsString);
      End;
      // DMFAC.ControlTran(9, DMFAC.cdsDetProfObs2, 'DPROFSOBS');
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
      Except
         ShowMessage('No se pudo actualizar el Detalle de Observaciones de la Proforma');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;
   DMFAC.DCOM1.AppServer.GrabaTransaccion;
// Fin HPC_201801_FAC

   memDetServ.Clear;

   InicializaCamposDetalle;
   CalculaFooter;

   xxReservaAnt := 0;

   bbtnRegCancClick(Sender);
End;

Procedure TFProforma.Z2bbtnRegCancExit(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   DMFAC.cdsDetProf.cancelUpdates;
   If sTipoRQS = 'C' Then
   Begin
      pnlRegistro.Width := 400;
      pnlRegistro.Visible := False;
      pnlDetalle.Enabled := True;
      pnlPie.Enabled := True;
   End
   Else
      If sTipoRQS = 'S' Then
      Begin
         pnlDetalleA.Visible := False;
      End;

   If DMFAC.cdsDetProf.RecordCount >= 1 Then
   Begin
      ActualizaCabecera;
      EstadoDeForma(1, DMFAC.cdsProforma.FieldByName('PROFSIT').AsString, DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString,
         DMFAC.cdsProforma.FieldByName('PROFESTADO').AsString);
   End;

   pnlDetalle.Enabled := True;
   pnlPie.Enabled := True;

   CalculaFooter;

   Screen.Cursor := crDefault;
End;

Procedure TFProforma.dbeBuscaExit(Sender: TObject);
Var
   xSQL, xVarBusca: String;
Begin
   If bbtnCancBusca.Focused Then exit;
   If length(dbeBusca.Text) > 0 Then
   Begin
      xVarBusca := '%' + trim(dbeBusca.Text) + '%';
      xSQL := 'SELECT ARTDES,ARTID FROM FAC201 WHERE ARTDES LIKE(' + QuotedStr(xVarBusca) + ') '
         + 'AND TLISTAID=' + Quotedstr(dblcLPrecio.Text);
      DMFAC.cdsQry5.DisableControls;
      DMFAC.cdsQry5.Close;
      DMFAC.cdsQry5.IndexFieldNames := 'ARTDES';
      DMFAC.cdsQry5.Filter := '';
      DMFAC.cdsQry5.DataRequest(xSQL);
      DMFAC.cdsQry5.Open;
      dbgBusca.Selected.Clear;
      dbgBusca.Selected.Add('ARTDES'#9'50'#9'Artículo');
      dbgBusca.Selected.Add('ARTID'#9'10'#9'Id');
      DMFAC.cdsQry5.EnableControls;
      dbgBusca.SetFocus;
   End
   Else
      Showmessage('Ingrese una condición para la Búsqueda');
End;

Procedure TFProforma.bbtnOkBuscaClick(Sender: TObject);
Begin
   If bbtnCancBusca.Focused Then exit;
   pnlRegistro.Enabled := true;
   dbgDetFac.Enabled := true;
   dblcdArticulo.Text := DMFAC.cdsQry5.FieldByName('ARTID').AsString;
   dblcdArticulo.SetFocus;
   pnlBusqueda.Visible := False;
   If DMFAC.cdsQry5.Active Then
      DMFAC.cdsQry5.Close;
End;

Procedure TFProforma.bbtnCancBuscaClick(Sender: TObject);
Begin
   pnlBusqueda.Visible := False;
   pnlRegistro.Enabled := true;
   dbgDetFac.Enabled := true;
   bbtnBuscaArt.enabled := true;
   pnlBusqueda.SendToBack;
   dblcdArticulo.SetFocus;
   If DMFAC.cdsQry5.Active Then
      DMFAC.cdsQry5.Close;
End;

Procedure TFProforma.bbtnRegresaClick(Sender: TObject);
Begin
//   If DMFAC.wAdmin = 'G' Then Exit;
   DMFAC.cdsProforma.Edit;

   pnlCab1.enabled := False;
   pnlCab2.enabled := True;
   pnlCab3.enabled := True;
   pnlCab4.enabled := True;

   bbtnBorra.enabled := True;
   bbtnOk.enabled := True;

// del panel 2
   meNoPedido.Enabled := False;
// del panel 3
   If DMFAC.cdsDetProf.RecordCount > 0 Then
   Begin
      dblcLPrecio.Enabled := False;
      dblcTMon.Enabled := False;
   End
   Else
   Begin
      dblcLPrecio.Enabled := True;
      dblcTMon.Enabled := True;
   End;
   xRegresa := True;
End;

Procedure TFProforma.Z2bbtnAceptaClick(Sender: TObject);
// Inicio HPC_201801_FAC
// Definición de variable xSQL para Cambiar método de grabación
Var
   xSQL : String;
// Fin HPC_201801_FAC
Begin
//   If DMFAC.wAdmin = 'G' Then Exit;
   If DMFAC.cdsDetProf.RecordCount = 0 Then exit;

   pnlActuali.Visible := true;

   If DMFAC.cdsProforma.State = dsBrowse Then
      DMFAC.cdsProforma.Edit;

   DMFAC.cdsProforma.FieldByName('PROFSIT').AsString := 'ACEPTADO';
   DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString := 'R';
   DMFAC.cdsProforma.FieldByName('PROFFREG').AsDatetime := Date; // fecha que registra Usuario

// Inicio HPC_201801_FAC
// Cambia metodo de grabación
//   DMFAC.cdsPost(DMFAC.cdsProforma);
   DMFAC.cdsProforma.Post;

//   SQLFiltro := 'SELECT * FROM FAC311 WHERE PROFID=''' + MeNoPedido.Text + '''';
//   DMFAC.cdsProforma.DataRequest(SQLFiltro);
//   DMFAC.ControlTran(9, DMFAC.cdsProforma, 'PROF');

   DMFAC.DCOM1.AppServer.IniciaTransaccion;
   xSQL := 'Update DB2ADMIN.FAC311 '
      + '      Set PROFSIT ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFSIT').AsString)+', '
      + '          PROFFLAGD ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString)+', '
      + '          PROFUSER  ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFUSER').AsString)+','
      + '          PROFFREG  = trunc(Sysdate), '
      + '          PROFHREG  = Sysdate '
      + '    where CIAID='+quotedstr(DMFAC.cdsProforma.FieldByName('CIAID').AsString)
      + '      and TINID='+quotedstr(DMFAC.cdsProforma.FieldByName('TINID').AsString)
      + '      and ALMID='+quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)
      + '      and PROFID='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
   Except
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se pudo ACEPTAR la Proforma');
      Exit;
   End;


   DMFAC.cdsDetProf.DisableControls;
   DMFAC.cdsDetProf.First;

   While Not DMFAC.cdsDetProf.eof Do
   Begin
      DMFAC.cdsDetProf.Edit;
      DMFAC.cdsDetProf.FieldByName('DPROFESTADO').AsString := 'VENTAS';
      DMFAC.cdsDetProf.FieldByName('DPROFSIT').AsString := 'ACEPTADO'; // Activo
      //DMFAC.cdsDetProf.FieldByName('DPROFHOR').AsDateTime  := time;
      // Inicio HPC_201805_FAC
      // 27/08/2018 retira rutina cdsPost
      //DMFAC.cdsPost(DMFAC.cdsDetProf);
      // Fin HPC_201805_FAC
      DMFAC.cdsDetProf.Post;
      DMFAC.cdsDetProf.Next;
   End;
   DMFAC.cdsDetProf.EnableControls;
//   DMFAC.ControlTran(9, DMFAC.cdsDetProf, 'DPROF');
   dbgDetFac.Refresh;

   xSQL := 'Update DB2ADMIN.FAC312 '
      + '      Set DPROFESTADO ='+quotedstr('VENTAS')+', '
      + '          DPROFSIT ='+quotedstr('ACEPTADO')+', '
      + '          DPROFUSER  ='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFUSER').AsString)+','
      + '          DPROFFREG  = trunc(Sysdate), '
      + '          DPROFHREG  = Sysdate '
      + '    where CIAID='+quotedstr(DMFAC.cdsProforma.FieldByName('CIAID').AsString)
      + '      and TINID='+quotedstr(DMFAC.cdsProforma.FieldByName('TINID').AsString)
      + '      and ALMID='+quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)
      + '      and PROFID='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
   Except
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se pudo ACEPTAR el Detalle de la Proforma');
      Exit;
   End;
   DMFAC.DCOM1.AppServer.GrabaTransaccion;
// Fin HPC_201801_CLI

   EstadoDeForma(1, DMFAC.cdsProforma.FieldByName('PROFSIT').AsString, DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString,
      DMFAC.cdsProforma.FieldByName('PROFESTADO').AsString);
   pnlActuali.Visible := False;
   ShowMessage(' Registro de Proforma Aceptado ');
End;

Procedure TFProforma.Z2bbtnNuevoClick(Sender: TObject);
Var
   xSQL: String;
Begin
//   If DMFAC.wAdmin = 'G' Then Exit;

   If MessageDlg('Registra un Nuevo Proforma' + chr(13) +
      '          ¿Esta Seguro?  ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then exit;
   wDescAdi := 0;
   xDto01 := 0;
   wFlagCV := False;
   wFlagCVDes := '';
   wFlagPA := False;
   wFlagLC := False;
   wFlagFP := False;
   wPolitica1 := False;
   wPolitica2 := False;
   wbInicio := true;
   wDescAdi := 0;
   wFlagedi := '';
   xLPrecio := False;
   lblNLugarE.Caption := '';

   pnlRegistro.Visible := False;
   pnlActuali.visible := False;
   xFlagInsert := False;
   DMFAC.cdsAlmacen.Filtered := False;

   meNoPedido.Enabled := True;
   dblcLPrecio.Enabled := True;
   dblcTMon.Enabled := True;

   If DMFAC.cdsDetProf.Active Then
      DMFAC.cdsDetProf.Close;
   dblcCia.Enabled := True;
   DMFAC.cdsQry6.IndexFieldNames := '';

   xCia := DMFAC.cdsProforma.FieldByName('CIAID').AsString;
   xLoc := DMFAC.cdsProforma.FieldByName('LOCID').AsString;
   xTVt := DMFAC.cdsProforma.FieldByName('TIPOADQ').AsString;
   xTin := DMFAC.cdsProforma.FieldByName('TINID').AsString;
   xTMo := DMFAC.cdsProforma.FieldByName('TMONID').AsString;
   xAlm := DMFAC.cdsProforma.FieldByName('ALMID').AsString;
   xLPr := DMFAC.cdsProforma.FieldByName('TLISTAID').AsString;
   xTCli := DMFAC.cdsProforma.FieldByName('PROFTCLI').AsString;
   xTDoc := DMFAC.cdsProforma.FieldByName('VEID').AsString;
   xCPag := DMFAC.cdsProforma.FieldByName('FPAGOID').AsString;
   xTri := DMFAC.cdsProforma.FieldByName('TRIID').AsString;

   xSQL := 'select * from FAC311 '
      + 'where PROFUSER=' + quotedstr(DMFAC.wUsuario)
      + ' and PROFID=(select substr(max(TO_CHAR(PROFFECHA,''YYYYMMDD'')||PROFID),9,10) PROFID '
      + '             from FAC311 where PROFUSER=' + quotedstr(DMFAC.wUsuario)
      + '             ) order by PROFFECHA';
   DMFAC.cdsProforma.Close;
   DMFAC.cdsProforma.DataRequest(xSQL);
   DMFAC.cdsProforma.Open;

   IniciaForma;
   DMFAC.cdsProforma.Insert;
   DMFAC.cdsProforma.FieldByName('CIAID').AsString := xCia;
   DMFAC.cdsProforma.FieldByName('LOCID').AsString := xLoc;
   DMFAC.cdsProforma.FieldByName('TIPOADQ').AsString := xTVt;
   DMFAC.cdsProforma.FieldByName('TINID').AsString := xTin;
   DMFAC.cdsProforma.FieldByName('TMONID').AsString := xTMo;
   DMFAC.cdsProforma.FieldByName('ALMID').AsString := xAlm;
   DMFAC.cdsProforma.FieldByName('TLISTAID').AsString := xLPr;
   DMFAC.cdsProforma.FieldByName('PROFTCLI').AsString := xTCli;
   DMFAC.cdsProforma.FieldByName('VEID').AsString := xTDoc;
   DMFAC.cdsProforma.FieldByName('PROFTCLI').AsString := '01';
   DMFAC.cdsProforma.FieldByName('FPAGOID').AsString := xCPag;
   dtpFPed.Date := DMFAC.DateS;
   DMFAC.cdsProforma.FieldByName('TRIID').AsString := xTri;

   dblcCIA.OnExit(dblcCIA);
   dblcLocal.OnExit(dblcLocal);
   dblcTInv.OnExit(dblcTInv);
   dblcTClie.OnExit(dblcTClie);
   dblcFPago.OnExit(dblcFPago);
   dblcVen.OnExit(dblcVen);

   EstadoDeForma(0, ' ', ' ', DMFAC.cdsProforma.FieldByName('PROFESTADO').AsString);

   DMFAC.cdsdireccion.close;
   DMFAC.cdsDscto.close;

// Inicio HPC_201801_FAC
// Se retira componente dblcdClie, se deja componente dblcdAso
{
   If dblcCia.Enabled = False Then
      If (dblcLocal.Enabled = False And dblcdclie.Enabled = true) Then
         dblcdClie.SetFocus;
}
   If dblcCia.Enabled = False Then
      If (dblcLocal.Enabled = False And dblcdAso.Enabled = true) Then
         btnExec.SetFocus;
// Fin HPC_201801_FAC

   lblEmb.Visible := False;
   dbeEmbalaje.Visible := False;
   lblAgencia.Visible := False;
   dblcAgencia.Visible := False;
   edtAgencia.Visible := False;

   InicializaFooter;
   dbgDetFac.Refresh;
End;

Procedure TFProforma.Z2bbtnImprimeClick(Sender: TObject);
Var
   xTMto, xTIgv, xZona, xSectorCom, xTEmb: String;
   xnTot, xnIgv, xnEmb, xTotProf: double;
Begin
   If DMFAC.cdsDetProf.recordcount = 0 Then
   Begin
      Information(Caption, 'No se Encontraron Datos para Imprimir');
      Exit;
   End;

// verifica Totales de La Proforma
   xTotProf := 0;
   DMFAC.cdsDetProf.DisableControls;
   DMFAC.cdsDetProf.First;
   While Not DMFAC.cdsDetProf.eof Do
   Begin
      xTotProf := xTotProf + DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat + DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat;
      DMFAC.cdsDetProf.Next;
   End;
   DMFAC.cdsDetProf.EnableControls;

   If (DMFAC.cdsProforma.FieldByName('PROFTOTMO').AsFloat - xTotProf > 0.01) Or
      (DMFAC.cdsProforma.FieldByName('PROFTOTMO').AsFloat - xTotProf < -0.01) Then
   Begin
      ActualizaCabecera;
   End;

   Screen.Cursor := crHourGlass;
   ppReportProf;

   ppDBCab.DataSource := DMFAC.dsQry;
   ppdbOC.DataSource := DMFAC.dsReporte;
   Screen.Cursor := crDefault;
   pprProf.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\Proforma.rtm';
   pprProf.Template.LoadFromFile;
   If cbDiseno.Checked Then
   Begin
      Diseno.Report := pprProf;
      Diseno.ShowModal;
   End
   Else
      pprProf.Print;
   pprProf.Stop;
   ppDBCab.DataSource := Nil;
   ppdbOC.DataSource := Nil;
End;

Procedure TFProforma.pprProfPreviewFormCreate(Sender: TObject);
Begin
   pprProf.PreviewForm.ClientHeight := 500;
   pprProf.PreviewForm.ClientWidth := 650;
   TppViewer(pprProf.PreviewForm.Viewer).ZoomSetting := zsWholePage; // zsPageWidth;
End;

Procedure TFProforma.meNoPedidoEnter(Sender: TObject);
Begin
// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
   If not btnExec.Focused Then
   Begin
      If length(trim(edtClie.Text))=0 Then
      Begin
         btnExec.SetFocus;
         btnExecClick(Self);
         Exit;
      End;
   End;
{
   If length(trim(DMFAC.cdsProforma.FieldByName('PROFID').AsString)) = 0 Then
      DMFAC.cdsProforma.FieldByName('PROFID').AsString := DMFAC.Strzero(DMFAC.MaxProf(dblcCia.Text, dblcLocal.Text),
         DMFAC.cdsProforma.FieldByName('PROFID').Size);
}
// Fin HPC_201805_FAC
End;

Procedure TFProforma.ppReportProf;
Var
   xProv, sSQL, sCIA, sPRO: String;
   xAlmacen: String;
Begin
   xProv := DMFAC.BuscaQry('dspTLista', 'TGE102', 'CLAUXID', 'CLAUXCP = ' + QuotedStr('C'), 'CLAUXID');

   sCIA := DMFAC.cdsProforma.FieldByName('CIAID').AsString;
   sPRO := DMFAC.cdsProforma.FieldByName('PROFID').AsString;

   sSQL := 'SELECT FAC311.*, TGE101.CIADES, TGE101.CIARUC, TGE101.CIATLF, TGE101.CIAFAX, '
      + 'TGE101.CIADIRE, TGE103.TMONABR, TGE180.DCCOMDES, '
      + '''USUARIO: ''||TGE006.USERNOM USUARIO, ''                        '' TIPOVENTA, '
      + '''Hecho por : ''||CXC203.VENOMBRES VENDEDOR, '
      + '''Impreso por : ' + DMFAC.wUsuario + ''' USUIMP, '
      + 'CXC203.VENOMBRES VENDEDOR_NOM, '
      + '''' + DMFAC.wUsuario + ''' USUIMP_NOM, '
      + 'TMONABR||TRIM(TO_CHAR(PROFTOTMO,''999,999.99'')) PROFTOTMO_M, '
      + '''          '' TITCOM, ''          '' TITOBS, ''     '' TITOBS1, ''     '' TITOBS2, '
      + 'TI.TIE_DES, TI.TIE_DIR, TI.TIE_TEL '
      + 'FROM FAC311, TGE101, TGE103, TGE180, TGE006, CXC203, tge151 alm, db2admin.fac_tienda TI '
      + 'WHERE FAC311.CIAID = ''' + sCIA + ''' '
      + ' AND FAC311.PROFID = ''' + sPRO + ''' '
      + ' and FAC311.CLIEID = ' + quotedstr(DMFAC.cdsProforma.fieldByName('CLIEID').AsString)
      + ' AND FAC311.CIAID = TGE101.CIAID(+) '
      + ' AND FAC311.TMONID = TGE103.TMONID(+) '
      + ' AND FAC311.FPAGOID = TGE180.CCOMERID(+) '
      + ' AND FAC311.CIAID = TGE180.CIAID(+) '
      + ' AND FAC311.PROFUSER = TGE006.USERID(+) '
      + ' AND FAC311.CIAID = CXC203.CIAID(+) '
      + ' AND FAC311.VEID = CXC203.VEID(+) '
      + ' and FAC311.CIAID=ALM.CIAID(+) AND FAC311.ALMID=ALM.ALMID(+)'
      + ' AND ALM.TIE_ID=TI.TIE_ID(+)';
   DMFAC.cdsQry.DisableControls;
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.ProviderName := 'dspUltTGE';
   DMFAC.cdsQry.DataRequest(sSQL);
   DMFAC.cdsQry.Open;
   DMFAC.cdsQry.EnableControls;

   DMFAC.cdsQry.Edit;
   DMFAC.cdsQry.FieldByName('TIPOVENTA').AsString := edtTipoCompra.Text;
   DMFAC.cdsQry.Post;

   If (dblcAlmacen.Text = '14') Or (dblcAlmacen.Text = '15') Then
      xAlmacen := 'in (' + quotedstr('14') + ',' + quotedstr('15') + ')'
   Else
      xAlmacen := 'in (' + quotedstr(dblcAlmacen.Text) + ')';

   sSQL := 'SELECT FAC312.*, CASE WHEN TGE205.OBSEQUIO=''S'' THEN ''Obsequio'' ELSE '''' END OBSEQUIO, '
      + 'DECODE(DARTOBS,NULL,FAC312.ARTDES,B.DARTOBS) ARTDESOBS, '
      + 'DPROFPREUMO * ( 1 + ((DPROFIMP1/100) + (DPROFIMP2/100)) ) PREUNITIMPU, '
      + ' FAC312.DPROFVTOTMO + ROUND(DPROFDTOMO2 * ( 1 + ((DPROFIMP1/100))),2)  BAZAR_SUBTOT, '
      + 'ROUND( (FAC312.DPROFVTOTMO + ROUND(DPROFDTOMO2 * ( 1 + ((DPROFIMP1/100))),2) )/FAC312.DPROFCANTP ,4) BAZAR_PREUNI, '
      + 'ROUND(DPROFDTOMO2 * ( 1 + ((DPROFIMP1/100))),2) BAZAR_DCTO, '
      + 'TMONABR||TRIM(TO_CHAR(DPROFVTOTMO,''999,999.99'')) DPROFVTOTMO_M, '
      + 'CASE WHEN TGE205.OBSEQUIO=''S'' THEN ''X'' ELSE NULL END  FLOBSEQUIO, SUBSTR(CODCOM,4,5) COMBO '
      + 'FROM FAC312, TGE130 UM1, TGE205, FAC314 B, TGE103 '
      + 'WHERE FAC312.CIAID= ''' + sCIA + ''' '
      + 'AND FAC312.PROFID = ''' + sPRO + ''' '
      + 'AND FAC312.UNMIDG = UM1.UNMID(+) '
      + 'AND TGE205.ARTID(+) = FAC312.ARTID '
      + 'AND TGE205.CIAID(+) = FAC312.CIAID '
      + 'AND FAC312.TMONID = TGE103.TMONID(+) '
// PCC
//      + 'AND FAC312.ALMID  = ' + QuotedStr(dblcAlmacen.Text)
   + 'AND FAC312.ALMID ' + xAlmacen
// Fin PCC
   + ' AND TGE205.TINID(+) = FAC312.TINID ';
   sSQL := sSQL + '   and B.CIAID(+)=FAC312.CIAID and B.PROFID(+)=FAC312.PROFID ';

   If sTipoRQS = 'C' Then
      sSQL := sSQL + 'AND FAC312.CIAID=B.CIAID(+) AND FAC312.CLIEID=B.CLIEID(+) AND FAC312.PROFID=B.PROFID(+) AND FAC312.ARTID=B.DPROFITEM(+) ORDER BY FAC312.DPROFITEM'
   Else
      If sTipoRQS = 'S' Then
         sSQL := sSQL + 'AND FAC312.CIAID=B.CIAID(+) AND FAC312.CLIEID=B.CLIEID(+) AND FAC312.PROFID=B.PROFID(+) AND FAC312.DPROFITEM=B.DPROFITEM(+) ORDER BY FAC312.DPROFITEM';
   DMFAC.cdsReporte.DisableControls;
   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;
   DMFAC.cdsReporte.EnableControls;

   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      If DMFAC.cdsReporte.FieldByName('FLOBSEQUIO').AsString = 'X' Then
      Begin
         DMFAC.cdsQry.Edit;
         DMFAC.cdsQry.FieldByname('TITOBS').AsString := 'Obsequio';
         DMFAC.cdsQry.FieldByname('TITOBS1').AsString := 'Obse-';
         DMFAC.cdsQry.FieldByname('TITOBS2').AsString := 'quio';
         DMFAC.cdsQry.Post;
      End;
      If DMFAC.cdsReporte.FieldByName('COMBO').AsString <> '' Then
      Begin
         DMFAC.cdsQry.Edit;
         DMFAC.cdsQry.FieldByname('TITCOM').AsString := 'COMBO';
         DMFAC.cdsQry.Post;
      End;
      DMFAC.cdsReporte.Next;
   End;
   DMFAC.cdsReporte.First;
End;

Procedure TFProforma.dbgDetFacKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Var
   cComboE: String;
// Inicio HPC_201801_FAC
// variable para ejecutar script de actualización
   xSQL : String;
// Fin HPC_201801_FAC
Begin
   If DMFAC.cdsDetProf.RecordCount = 0 Then
      Exit;
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If Question(Caption, '¿Esta Seguro de Eliminar Registro?') Then
      Begin
      // Inicio HPC_201801_FAC
      // cambio de método de grabación
         If DMFAC.cdsDetProf.FieldByName('CODCOM').AsString = '' Then
         Begin
            xSQL := 'Delete from DB2ADMIN.FAC312 '
               + '    Where CIAID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('CIAID').AsString)
               + '      and TINID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('TINID').AsString)
               + '      and ALMID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('ALMID').AsString)
               + '      and PROFID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('PROFID').AsString)
               + '      and DPROFITEM='+ quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFITEM').AsString);
            Try
               DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
            Except
               ShowMessage('No se pudo borrar el Detalle de la Proforma');
               Exit;
            End;
            DMFAC.cdsDetProf.Delete;
         End
         Else
         Begin
            cComboE := DMFAC.cdsDetProf.FieldByName('CODCOM').AsString;
            DMFAC.cdsDetProf.First;
            While Not DMFAC.cdsDetProf.Eof Do
            Begin
               If DMFAC.cdsDetProf.FieldByName('CODCOM').AsString = cComboE Then
               Begin
                  xSQL := 'Delete from DB2ADMIN.FAC312 '
                     + '    Where CIAID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('CIAID').AsString)
                     + '      and TINID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('TINID').AsString)
                     + '      and ALMID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('ALMID').AsString)
                     + '      and PROFID='+ quotedstr(DMFAC.cdsDetProf.FieldByName('PROFID').AsString)
                     + '      and DPROFITEM='+ quotedstr(DMFAC.cdsDetProf.FieldByName('DPROFITEM').AsString);
                  Try
                     DMFAC.DCOM1.AppServer.EjecutaSQL(XSQL);
                  Except
                     ShowMessage('No se pudo borrar el Detalle (combo) de la Proforma');
                     Exit;
                  End;
                  DMFAC.cdsDetProf.Delete;
               End
               Else
                  DMFAC.cdsDetProf.Next;
            End;
         End;

         dbgDetFac.Refresh;
         CalculaFooter;
         If DMFAC.cdsDetProf.RecordCount >= 1 Then
         Begin
            ActualizaCabecera;
         //   DMFAC.cdsProforma.DataRequest('SELECT * FROM FAC311 WHERE CIAID=''' + dblcCia.Text + ''' AND PROFID=' + Quotedstr(MenoPedido.text));
            EstadoDeForma(1, DMFAC.cdsProforma.FieldByName('PROFSIT').AsString, DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString,
               DMFAC.cdsProforma.FieldByName('PROFESTADO').AsString);
         End
         Else
            wInserta := true;
         //DMFAC.ControlTran(9, Nil, '');
      // Fin HPC_201801_FAC
      End;
   End;
End;

Procedure TFProforma.dbgDetFacDblClick(Sender: TObject);
Var
   xFContenido, xWhere: String;
   xCont: double;
Begin

   If DMFAC.cdsDetProf.FieldByname('CODCOM').AsString <> '' Then
   Begin
      ShowMessage('No se puede modificar Artículo, cuando es Generado de un Combo');
      exit;
   End;

   xFlagInsert := False;
   If sTipoRQS = 'C' Then
   Begin
      lblObsequio.Visible := False;
      pnlRegistro.Width := 400;

      If btnActReg.Enabled And (DMFAC.cdsDetProf.recordcount > 0) Then
      Begin
         If (DMFAC.cdsProforma.FieldByName('PROFSIT').AsString = 'PENDIENTE') Or
            (DMFAC.cdsProforma.FieldByName('PROFSIT').AsString = 'INTERRUMPIDO') Or
            (DMFAC.cdsProforma.FieldByName('PROFSIT').AsString = 'ANULADO') Or
            (DMFAC.cdsProforma.FieldByName('PROFSIT').AsString = 'PARCIAL') Or
            (DMFAC.cdsProforma.FieldByName('PROFSIT').AsString = 'ATENDIDO') Then exit;

         InicializaCamposDetalle;
         If dblcLPrecio.text = 'ESP' Then
         Begin
            dbePrecioG.enabled := true;
         End;

         xxReservaAnt := DMFAC.cdsDetProf.FieldByName('DPROFCANTRE').AsFloat;

         pnlDetalle.Enabled := False;
         pnlPie.Enabled := False;
         bbtnBuscaArt.Enabled := False;
         pnlRegistro.Visible := True;
         pnlRegistro.SetFocus;
         DMFAC.cdsDetProf.Edit;
         dblcdArticulo.Text := DMFAC.cdsDetProf.FieldByName('ARTID').AsString;
         dbeArticulo.text := DMFAC.cdsDetProf.FieldByName('ARTDES').AsString;
         dblcProv.Text := DMFAC.cdsDetProf.FieldByName('PROV').AsString;

         // VHNDEMA   NO SE USA
         xWhere := 'PROV=' + Quotedstr(dblcProv.Text);
         edtProv.text := DMFAC.BuscaQry('dspUltTGE', 'TGE201', 'PROVDES', xWhere, 'PROVDES');
         // END VHNDEMA

         dbePrecioG.text := floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat);
         xDto01 := DMFAC.cdsDetProf.FieldByName('DPROFDCTO1').AsFloat;
         If dbePorcentaje.text = '' Then
            edtDsto1.text := '0'
         Else
            edtDsto1.text := dbePorcentaje.text;
         edtDsto2.text := floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTO2').AsFloat);
         wFlagEdi := 'S';
         If DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString <> '' Then
         Begin
            lblUMPG.Caption := DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString;
            lblUMAG.Caption := DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString;
            dbeUmG.text := DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString;
            If DMFAC.cdsDetProf.FieldByName('CONTENIDO').AsString = 'S' Then
            Begin
               xFContenido := 'S';
               cbTipoUm.Enabled := False;
               cbTipoUm.ItemIndex := 0;
               AperturaConsultaSaldos(xFContenido)
            End;
         End
         Else
         Begin
            xFContenido := 'S';
            lblUMAG.Caption := DMFAC.cdsDetProf.FieldByName('UNMIDU').AsString;
            lblUMPU.Caption := DMFAC.cdsDetProf.FieldByName('UNMIDU').AsString;
            dbeUmG.text := DMFAC.cdsDetProf.FieldByName('UNMIDU').AsString;
            If DMFAC.cdsDetProf.FieldByName('CONTENIDO').AsString = 'S' Then
            Begin
               cbTipoUm.Enabled := False;
               cbTipoUm.ItemIndex := 1;
               AperturaConsultaSaldos(xFContenido)
            End;
         End;

         xCont := strtofloat(DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmg.Text), 'EUNMEQ'));
         If DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat - trunc(DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat) > 0 Then
         Begin
            dbeCtdadU.text := floattostr(FRound(((DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat - trunc(DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat)) * xCont), 15, 0));
            dbeCtdadG.text := floattostr(trunc(DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat));
         End
         Else
            dbeCtdadG.text := floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat);

         If DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat - trunc(DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat) > 0 Then
         Begin
            dbeCantUA.text := floattostr(FRound(((DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat - trunc(DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat)) * xCont), 15, 0));
            dbeCantGA.text := floattostr(trunc(DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat));
         End
         Else
            dbeCantGA.text := floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTAC').AsFloat);

         dbeImporte.text := floattostr(FRound(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat, 15, 2));
         dbeDGarantia.text := DMFAC.cdsDetProf.FieldByName('DPROFGARAN').AsString;
         dblcdArticulo.Enabled := False;
         edtObservacion.text := DMFAC.cdsDetProf.FieldByName('DPROFOBS').AsString;
         dbeMontoDCTO1.text := floattostr(FRound((StrToFloat(dbeCtdadG.text)) * DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat * StrToFloat(edtDsto1.text) / 100, 15, 2));
         dbeMontoDCTO2.text := FloatToStr(FRound(((StrToFloat(dbeCtdadG.text) * DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat) - (StrToFloat(dbeMontoDCTO1.text))) * StrToFloat(edtDsto2.text) / 100, 15, 2));

         dbeImporteIGV.text := FloatToStr(FRound(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat * (1 + StrToFloat(xImpTasa) / 100), 15, 2));
         dbeCtdadG.SetFocus;
      End;
   End
   Else
      If sTipoRQS = 'S' Then
      Begin
         If btnActReg.Enabled And (DMFAC.cdsDetProf.recordcount > 0) Then
         Begin
            InicializaCamposDetalle;

            pnlDetalle.Enabled := False;
            pnlPie.Enabled := False;
            pnlDetalleA.Width := 436;
            pnlDetalleA.Visible := True;
            pnlDetalleA.SetFocus;
            DMFAC.cdsDetProf.Edit;
            memDetServ.Clear;
            wFlagEdi := 'S';
            dbeItem.Text := DMFAC.cdsDetProf.FieldByName('DPROFITEM').AsString;
            dblcdServicio.Text := DMFAC.cdsDetProf.FieldByName('ARTID').AsString;
            memDetalle.text := DMFAC.cdsDetProf.FieldByName('ARTDES').AsString;

            dbePUnit.text := floattostr(DMFAC.cdsDetProf.FieldByName('DPROFPREUMO').AsFloat);
            dbeDscto.text := floattostr(DMFAC.cdsDetProf.FieldByName('DPROFDCTO2').AsFloat);
            dbeImpIgv.text := floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMP1').AsFloat);
            dbeImp2.text := floattostr(DMFAC.cdsDetProf.FieldByName('DPROFIMP2').AsFloat);
            dbeCnt.text := floattostr(DMFAC.cdsDetProf.FieldByName('DPROFCANTP').AsFloat);
            dbeValVen.text := floattostr(DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat);
            edtAdq.text := DMFAC.cdsDetProf.FieldByName('TIPOADQ').AsString;
            dblcUMed.text := DMFAC.cdsDetProf.FieldByName('UNMIDG').AsString;
            edtUMed.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE130', 'UNMDES', 'UNMID=''' + dblcUMed.Text + '''', 'UNMDES');

            dbePUnitExit(Sender);
            dbeCnt.SetFocus;
         End;
      End;
End;

Procedure TFProforma.dblcFPagoEnter(Sender: TObject);
Begin
// Inicio HPC_201801_FAC
// Envía Foco a botón dque abre ventana de Clientes (btnExec)
   If xCrea Then Exit;

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
   If not btnExec.Focused Then
   Begin
      If length(trim(edtClie.Text))=0 Then
      Begin
         btnExec.SetFocus;
         btnExecClick(Self);
         Exit;
      End;
   End;
// Fin HPC_201805_FAC

   If length(trim(edtClie.Text)) = 0 Then
   //   dblcTClie.SetFocus;
      If (btnExec.Enabled) and (btnExec.Visible) Then
         btnExec.SetFocus;
// Fin HPC_201801_FAC
   If DMFAC.cdsDscto.Active = False Then
      Filtracds(DMFAC.cdsDscto, 'SELECT CCOMERID, DCCOMDES FROM TGE180 where CIAID=' + quotedstr(dblcCia.Text));
End;

Procedure TFProforma.bbtnCalcClick(Sender: TObject);
Begin
   WinExec('Calc.exe', 1);
End;

Procedure TFProforma.dbeMontoDCTO2Exit(Sender: TObject);
Begin
   If dbeMontoDCTO2.Text <> '' Then
   Begin
      edtDsto2.Text := FloatToStr(FRound((strtofloat(dbeMontoDCTO2.Text) / (strtofloat(dbeCantGA.Text) * strtofloat(dbePrecioG.Text))) * 100, 15, 4));
      edtDsto2Exit(Self);
   End;
End;

Procedure TFProforma.bbtnComboClick(Sender: TObject);
Begin
   If sTipoRQS = 'S' Then
   Begin
      ShowMessage('No se puede Usar Combo en Servicios');
      exit;
   End;

   Try
      cFlgComb := 'V';
      fSelCom := False;
      FCombos := TFCombos.Create(application);

      FCombos.dblcCia.Text := dblcCia.Text;
      FCombos.dblcTinid.Text := dblcTinv.Text;

      DMFAC.cdsTLista.IndexFieldNames := 'TLISTAID';
      DMFAC.cdsTLista.SetKey;
      DMFAC.cdsTLista.FieldByName('TLISTAID').AsString := dblcLPrecio.Text;
      DMFAC.cdsTLista.GotoKey;

      FCombos.ShowModal;
   Finally

      If fSelCom Then
         GeneraCombo;

      cCombo := '';

      FCombos.Free;
   End;
   DMFAC.cdsDetPed.Close;
   DMFAC.cdsCabPed.Close;
End;

Procedure TFProforma.GeneraCombo;
Var
   dPVG: Double;
   xSQL: String;
Begin

   If DMFAC.cdsDetPed.RecordCount < 0 Then
   Begin
      ShowMessage('Error : Combo no tiene Detalle');
      Exit;
   End;

   DMFAC.cdsDetProf.First;
   While Not DMFAC.cdsDetProf.Eof Do
   Begin
      If DMFAC.cdsDetProf.FieldByName('CODCOM').AsString = DMFAC.cdsDetPed.FieldByName('CODCOM').AsString Then
      Begin
         ShowMessage('Combo ya fue Seleccionado para venta. Verificar...');
         Exit;
      End;

      DMFAC.cdsDetPed.First;
      While Not DMFAC.cdsDetPed.Eof Do
      Begin
         If DMFAC.cdsDetProf.FieldByName('ARTID').AsString = DMFAC.cdsDetPed.FieldByName('ARTID').AsString Then
         Begin
            ShowMessage('Articulo ya Fue Seleccionado para Venta. Verificar...');
            Exit;
         End;
         DMFAC.cdsDetPed.Next
      End;

      DMFAC.cdsDetProf.Next;
   End;

   DMFAC.cdsDetPed.First;
   While Not DMFAC.cdsDetPed.Eof Do
   Begin
      dblcdArticulo.Text := DMFAC.cdsDetPed.FieldByname('ARTID').AsString;
      dbeArticulo.Text := DMFAC.cdsDetPed.FieldByname('ARTDES').AsString;

      DMFAC.cdsTLPrecio.IndexFieldNames := 'ARTID';
      DMFAC.cdsTLPrecio.Setkey;
      DMFAC.cdsTLPrecio.FieldByName('ARTID').AsString := dblcdArticulo.Text;
      If DMFAC.cdsTLPrecio.GotoKey Then
      Begin
         cObsequio := DMFAC.cdsTLPrecio.FieldByName('OBSEQUIO').AsString;
      End;

      If DMFAC.cdsDetPed.FieldByname('TMONID').AsString = dblcTMon.Text Then
         dPVG := DMFAC.cdsDetPed.FieldByName('PREVEN').AsFloat
      Else
      Begin
         If DMFAC.cdsDetPed.FieldByname('TMONID').AsString = DMFAC.wTMonLoc Then
            dPVG := FRound(DMFAC.cdsDetPed.FieldByName('PREVEN').AsFloat / StrToFloat(dbeTCambio.Text), 15, 2)
         Else
            dPVG := FRound(DMFAC.cdsDetPed.FieldByName('PREVEN').AsFloat * StrToFloat(dbeTCambio.Text), 15, 2);
      End;
      xFlagInsert := True;

      dbeCantGA.Text := FCombos.seCant.Text;
      dbeCtdadG.Text := FCombos.seCant.Text;

      dbePrecioG.Text := FloatToStr(dPVG);
      cCombo := DMFAC.cdsCabPed.FieldByName('CODCOM').AsString;

      bbtnRegOkClick(Self); // Inserta Articulo

      DMFAC.cdsDetPed.Next
   End;

   ActualizaCabecera;

   FiltraPedido;

   xFlagInsert := False;
   ;

End;

Procedure TFProforma.bbtnDctoClick(Sender: TObject);
Var
   xSQL: String;
   xTMonto, xTotVen, dIGV: Double;
   xTDscto: Double;
   xTFact: Double;
Begin
   If DMFAC.cdsProforma.FieldByName('PROFSIT').AsString <> 'INICIAL' Then
   Begin
      Information(Caption, 'El Documento Tiene que estar en Inicial');
      Exit;
   End;

   dIGV := FRound(StrToFloat(DMFAC.BuscaQry('dspUltTGE', 'TGE108', 'TASACAN', 'TASAFLG =''I''', 'TASACAN')), 12, 2);

   xSQL := 'Select 0.00 IMPORTE, 0.00 TOTVTA, 0.00 NEWTOT from TGE101 WHERE CIAID=''01''';
   DMFAC.cdsQry13.Close;
   DMFAC.cdsQry13.IndexFieldNames := '';
   DMFAC.cdsQry13.Filter := '';
   DMFAC.cdsQry13.DataRequest(xSQL);
   DMFAC.cdsQry13.Open;

   xTMonto := 0;
// Totaliza Montos del Detalle
   DMFAC.cdsDetProf.First;
   DMFAC.cdsDetProf.DisableControls;
   While Not DMFAC.cdsDetProf.eof Do
   Begin
      xTMonto := DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat;
      xTDscto := DMFAC.cdsDetProf.FieldByName('DPROFDTOMO2').AsFloat;
      xTotVen := xTMonto + xTDscto;
      xTFact := xTFact + FRound((xTotVen * (1 + (dIGV / 100))), 15, 2);
      DMFAC.cdsDetProf.Next;
   End;
   DMFAC.cdsDetProf.EnableControls;

   DMFAC.cdsQry13.Edit;
   DMFAC.cdsQry13.FieldByName('NEWTOT').AsFloat := DMFAC.cdsProforma.FieldByName('PROFTOTMO').AsFloat;
   cCombo := 'xyz123';
   GeneraDescuento;
   DMFAC.cdsQry13.FieldByName('TOTVTA').AsFloat := DMFAC.cdsProforma.FieldByName('PROFTOTMO').AsFloat;
   DMFAC.cdsQry13.FieldByName('IMPORTE').AsFloat := DMFAC.cdsQry13.FieldByName('TOTVTA').AsFloat - DMFAC.cdsQry13.FieldByName('NEWTOT').AsFloat;
   DMFAC.cdsQry13.Post;
   cCombo := '';

   Try
      fDctoP := False;
      FVentaDcto := TFVentaDcto.Create(application);
      FVentaDcto.bbtnDctoProf.Visible := True;
      FVentaDcto.dblcTMon.Text := dblcTMon.Text;
      FVentaDcto.ShowModal;
   Finally
      If fDctoP Then
      Begin
         cCombo := 'xyz123';
         GeneraDescuento;
         cCombo := '';
         ShowMessage('Recalculo de Precio OK');
      End;

      FVentaDcto.Free;
   End;
End;

Procedure TFProforma.GeneraDescuento;
Var
   dPorDcto, dIGV, dImp: Double;
   cSQL: String;
   nCon, nIni: Integer;
Begin
   dIGV := FRound(StrToFloat(DMFAC.BuscaQry('dspUltTGE', 'TGE108', 'TASACAN', 'TASAFLG =''I''', 'TASACAN')), 12, 2);

   If DMFAC.cdsQry13.FieldByName('IMPORTE').AsFloat = 0 Then
      dPorDcto := 0
   Else
      dPorDcto := FRound(DMFAC.cdsQry13.FieldByName('IMPORTE').AsFloat / DMFAC.cdsQry13.FieldByName('TOTVTA').AsFloat * 100, 10, 4);

   DMFAC.cdsDetProf.Close;
   DMFAC.cdsDetProf.Open;

   nCon := 0;
   DMFAC.cdsDetProf.First;
   While Not DMFAC.cdsDetProf.eof Do
   Begin
      dImp := DMFAC.cdsDetProf.FieldByname('DPROFMTOMO').AsFloat / (1 + (dIGV / 100));
      dblcdArticulo.Text := DMFAC.cdsDetProf.FieldByname('ARTID').AsString;
      dbeArticulo.Text := DMFAC.cdsDetProf.FieldByname('ARTDES').AsString;
      dbePrecioG.Text := DMFAC.cdsDetProf.FieldByname('DPROFPREUMO').AsString;
      dbeCantGA.Text := DMFAC.cdsDetProf.FieldByname('DPROFCANTAC').AsString;
      dbeCtdadG.Text := DMFAC.cdsDetProf.FieldByname('DPROFCANTAC').AsString;
      edtDsto2.Text := FloatToStr(dPorDcto);
      nCon := nCon + 1;
      xFlagInsert := False;
      bbtnRegOkClick(Self); // Inserta Articulo

      nIni := 1;
      DMFAC.cdsDetProf.First;
      While nIni < nCon Do
      Begin
         DMFAC.cdsDetProf.Next;
         nIni := nIni + 1
      End;
      DMFAC.cdsDetProf.Next;
   End;

   DMFAC.cdsDetProf.Close;
   DMFAC.cdsDetProf.Open;
End;

Procedure TFProforma.dblcdServicioExit(Sender: TObject);
Begin
   memDetalle.Text := DMFAC.cdsVende.FieldByName('ARTDES').AsString;
End;

// Inicio HPC_201801_FAC
// Se retira componente dblcdClie, se deja componente dblcdAso
{
Procedure TFProforma.dblcdClieUserButton1Click(Sender: TObject;
   LookupTable: TDataSet);
Var
   xSQL: String;
Begin
// DEPARTAMENTOS
   xSQL := 'SELECT SUBSTR(UBIGEOID,1,2) DPTOID,UBIGEODPTO DPTODES '
      + 'FROM TGE147 '
      + 'WHERE UBIGEOPROV IS NULL and SUBSTR(UBIGEOID,1,2)<>''00'' '
      + 'ORDER BY UBIGEOID';
   FiltraCds(DMFAC.cdsDpto, xSQL);
   DMFAC.cdsDpto.IndexFieldNames := 'DPTOID';

// PROVINCIAS
   xSQL := 'SELECT SUBSTR(UBIGEOID,1,2) DPTOID, SUBSTR(UBIGEOID,3,2) CIUDID,UBIGEOPROV CIUDDES '
      + 'FROM TGE147 '
      + 'WHERE UBIGEOPROV IS NOT NULL AND UBIGEODIST IS NULL';
   FiltraCds(DMFAC.cdsProvinc, xSQL);
   DMFAC.cdsProvinc.IndexFieldNames := 'CIUDID';

// DISTRITO
   xSQL := 'SELECT SUBSTR(UBIGEOID,1,2) DPTOID, SUBSTR(UBIGEOID,3,2) CIUDID,SUBSTR(UBIGEOID,5,2) ZIPID,UBIGEODIST ZIPDES '
      + 'FROM TGE147 '
      + 'WHERE UBIGEOPROV IS NOT NULL AND UBIGEODIST IS NOT NULL';
   FiltraCds(DMFAC.cdsDistrito, xSQL);
   DMFAC.cdsDistrito.IndexFieldNames := 'ZIPID';

   DMFAC.FiltraTabla(DMFAC.cdsPais, 'TGE118', 'PaisId');
   DMFAC.FiltraTabla(DMFAC.cdsTipPer, 'TGE109', 'TipPerId');
   DMFAC.FiltraTabla(DMFAC.cdsGiro, 'TGE116', 'GiroId');
   DMFAC.FiltraTabla(DMFAC.cdsClasif, 'TGE132', 'ClasifId');
   DMFAC.FiltraTabla(DMFAC.cdsCondP, 'TGE166', 'CONDPId');
   DMFAC.cdsClAux.Close;
   DMFAC.cdsClAux.DataRequest('SELECT * FROM TGE102 WHERE MODULO LIKE ' + QuotedStr('%FAC%'));
   DMFAC.cdsClAux.Open;
   DMFAC.cdsClAux.Filter := 'CLAUXCP=''C'' OR CLAUXCP=''A''';
   DMFAC.cdsClAux.Filtered := True;

   DMFAC.wModo := 'A';
   FMaesClieCorto := TFMaesClieCorto.Create(Application);
   FMaesClieCorto.xCiaClie := DMFAC.cdsProforma.FieldByName('CIAID').AsString;
   FMaesClieCorto.ShowModal;
   FMaesClieCorto.Free;
End;
}
// Fin HPC_201801_FAC

Procedure TFProforma.dblcAlmacenNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFProforma.BitBtn1Click(Sender: TObject);
Var
   xTMto, xTIgv, xZona, xSectorCom, xTEmb: String;
   xnTot, xnIgv, xnEmb, xTotProf: double;
   nPr: Integer;
Begin
   If DMFAC.cdsDetProf.recordcount = 0 Then
   Begin
      Information(Caption, 'No se Encontraron Datos para Imprimir');
      Exit;
   End;

// verifica Totales de La Proforma
   xTotProf := 0;
   DMFAC.cdsDetProf.DisableControls;
   DMFAC.cdsDetProf.First;
   While Not DMFAC.cdsDetProf.eof Do
   Begin
      xTotProf := xTotProf + DMFAC.cdsDetProf.FieldByName('DPROFMTOMO').AsFloat + DMFAC.cdsDetProf.FieldByName('DPROFIMPMTO1').AsFloat;
      DMFAC.cdsDetProf.Next;
   End;
   DMFAC.cdsDetProf.EnableControls;

   If (DMFAC.cdsProforma.FieldByName('PROFTOTMO').AsFloat - xTotProf > 0.01) Or
      (DMFAC.cdsProforma.FieldByName('PROFTOTMO').AsFloat - xTotProf < -0.01) Then
   Begin
      ActualizaCabecera;
   End;

   Screen.Cursor := crHourGlass;
   ppReportProf;

   ppDBCab.DataSource := DMFAC.dsQry;
   ppdbOC.DataSource := DMFAC.dsReporte;
   Screen.Cursor := crDefault;
   pprProf.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\ProformaTicket.rtm';
   pprProf.Template.LoadFromFile;

   Try
      pprProf.PrinterSetup.MarginLeft := 1;
      For nPr := 1 To pprProf.PrinterSetup.PrinterNames.Count Do
      Begin
         If Copy(pprProf.PrinterSetup.PrinterNames[nPr - 1], 1, 36) = 'EPSON TM-U220 Receipt (from Sun SGD)' Then
         Begin
            pprProf.PrinterSetup.PrinterName := pprProf.PrinterSetup.PrinterNames[nPr - 1];
            pprProf.PrinterSetup.MarginLeft := 8;
         End;
      End;

      If Copy(pprProf.PrinterSetup.PrinterName, 1, 36) <> 'EPSON TM-U220 Receipt (from Sun SGD)' Then
      Begin
         For nPr := 1 To pprProf.PrinterSetup.PrinterNames.Count Do
         Begin
            If Copy(pprProf.PrinterSetup.PrinterNames[nPr - 1], 1, 21) = 'EPSON TM-U220 Receipt' Then
            Begin
               pprProf.PrinterSetup.PrinterName := pprProf.PrinterSetup.PrinterNames[nPr - 1];
               pprProf.PrinterSetup.MarginLeft := 8;
            End;
         End;
      End;
   Except
   End;

   If cbDiseno.Checked Then
   Begin
      Diseno.Report := pprProf;
      Diseno.ShowModal;
   End
   Else
      pprProf.Print;
   pprProf.Stop;
   ppDBCab.DataSource := Nil;
   ppdbOC.DataSource := Nil;
End;

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFProforma.dtpFPedEnter(Sender: TObject);
begin
   If not btnExec.Focused Then
   Begin
      If length(trim(edtClie.Text))=0 Then
      Begin
         btnExec.SetFocus;
         btnExecClick(Self);
         Exit;
      End;
   End;
end;
// Fin HPC_201805_FAC

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFProforma.dblcLPrecioEnter(Sender: TObject);
begin
   If not btnExec.Focused Then
   Begin
      If length(trim(edtClie.Text))=0 Then
      Begin
         btnExec.SetFocus;
         btnExecClick(Self);
         Exit;
      End;
   End;
end;
// Fin HPC_201805_FAC

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFProforma.dbmObsExit(Sender: TObject);
begin
   If btnExec.Focused Then Exit;
end;
// Fin HPC_201805_FAC

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFProforma.dblcVenEnter(Sender: TObject);
begin
   If not btnExec.Focused Then
   Begin
      If length(trim(edtClie.Text))=0 Then
      Begin
         btnExec.SetFocus;
         btnExecClick(Self);
         Exit;
      End;
   End;
end;
// Fin HPC_201805_FAC

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFProforma.dtpFVcmtoEnter(Sender: TObject);
begin
   If not btnExec.Focused Then
   Begin
      If length(trim(edtClie.Text))=0 Then
      Begin
         btnExec.SetFocus;
         btnExecClick(Self);
         Exit;
      End;
   End;
end;
// Fin HPC_201805_FAC

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFProforma.dblcTVtaEnter(Sender: TObject);
begin
   If not btnExec.Focused Then
   Begin
      If length(trim(edtClie.Text))=0 Then
      Begin
         btnExec.SetFocus;
         btnExecClick(Self);
         Exit;
      End;
   End;
end;
// Fin HPC_201805_FAC

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFProforma.dblcTMonEnter(Sender: TObject);
begin
   If not btnExec.Focused Then
   Begin
      If length(trim(edtClie.Text))=0 Then
      Begin
         btnExec.SetFocus;
         btnExecClick(Self);
         Exit;
      End;
   End;
end;
// Fin HPC_201805_FAC

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFProforma.dbeTCambioExit(Sender: TObject);
begin
   If btnExec.Focused Then Exit;
end;
// Fin HPC_201805_FAC

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFProforma.dbeTCambioEnter(Sender: TObject);
begin
   If not btnExec.Focused Then
   Begin
      If length(trim(edtClie.Text))=0 Then
      Begin
         btnExec.SetFocus;
         btnExecClick(Self);
         Exit;
      End;
   End;
end;
// Fin HPC_201805_FAC

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFProforma.dblcTTranEnter(Sender: TObject);
begin
   If not btnExec.Focused Then
   Begin
      If length(trim(edtClie.Text))=0 Then
      Begin
         btnExec.SetFocus;
         btnExecClick(Self);
         Exit;
      End;
   End;
end;
// Fin HPC_201805_FAC

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFProforma.dblcLentregaEnter(Sender: TObject);
begin
   If not btnExec.Focused Then
   Begin
      If length(trim(edtClie.Text))=0 Then
      Begin
         btnExec.SetFocus;
         btnExecClick(Self);
         Exit;
      End;
   End;
end;
// Fin HPC_201805_FAC

// Inicio HPC_201805_FAC
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFProforma.dbeCreditoEnter(Sender: TObject);
begin
   If btnExec.Focused Then Exit;
end;
// Fin HPC_201805_FAC

End.

