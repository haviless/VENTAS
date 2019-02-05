Unit Fac370;
{

1. Modificar Para que grabe bien el Almacen

2. Modificar Para que solo Actualice el Stock cuando se acepta la factura
   En ningun otro caso debe actualizar el Stock

3. Verificar la Forma de Pago
   si es 01 Contado - no debe tener credito aprobado
   si es 03 Credito - debe tener credito aprobado CRE301
}

// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Fac370
// FORMULARIO               : FFactSGuia
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Ventana de Facturación
//

// Actualizaciones:
// 23/07/2004                 Procedure InicializaPorUsuario
// 21/12/2004                 If DMFAC.cdsQry.FieldByname('FLAG').AsString = 'V' Then dtpFFac.Enabled := True;
// SAR2010-0207               17/03/2010 DAD-AS-2010-0008  para habilitar el precio final
// SAR2010-0414               DAD-AS-2010-0015
// SAR2010-0462               Procedure InicializaPorUsuario_1;
// SAR2010-0060               realizado por: ASULCA - GetDinamicaContable / GetTasaIgv / Asignamos el la tasa de IGV en función a la dinámica contable
// HPC_201210_FAC 29/10/2012  Modificación de la consulta del cdsclie para que
//                            obtenga todos los campos de la tabla tge204
// HPC_201301_FAC 04/02/2013  No debe incluir Igv para ventas por auspicio o para clientes
//                            no domiciliados
// HPC_201303_FAC 25/02/2013  Permitir el registro de multiples formas de pago
//                            en la cia 16-Sarapampa
// HPC_201305_FAC 08/04/2013  Se inhabilita la fecha de vencimiento y se consistencia que
//                            la fecha de vencimiento no sea diferente que la fecha de emisión
// HPC_201306_FAC 06/05/2013  Se cambia de código genérico de C9999 a 33333333.
//                            Se puede cambiar el nombre del Cliente cuando se trate de éste código.
//                            Se subsana los errores de grabación cuando se trate de la modalidad
//                            de generación de boleta en base a a ingresos registrados en el módulo de Caja y Bancos.
// HPC_201308_FAC 14/06/2013  Para Ventas de Mercadería siempre se cobra IGV,
//                            independientemente del Tipo de Cliente, Condición Comercial o Marca en Maestro de Artículos
// HPC_201309_FAC             Cambio de forma de Grabar la cabecera y detalle de facturas
// HPC_201310_FAC             Adecuaciones para cuando es una venta de tipo SERVICIO
//                            Inicializa variable referenciada a Tipo de venta MERCADERIA - Línea 1074
//                            calcula total importe para CIA 15 - Línea 2605
// HPC_201403_FAC             Se revisa y modifica la forma de grabación a las tablas, que adiciona el control de Transaccion
//                            Se incrementa a cinco los decimales es los importes.
// HPC_201404_FAC 10/07/2014  Se corrige la variable de descripción del cliente que al momento de imprimir figuraba en blanco.
// HPC_201405_FAC 07/08/2014  Se revierte las modificaciones del redondeo a 5 decimales;
// HPC_201406_FAC 22/08/2014  Se modifica el redondeo a 5 digitos de los calculos previos al desglose del IGV; precio final
//                26/08/2014  Se trunca Dirección de Cliente a 100 caracteres
// HPC_201407_FAC
//                  3/9/2014  Debe mandar mensaje que no hay Forma de Pago registrada
//                24/07/2014  Se redondea resultado de campo PREUNITIMPU en Impresión de Boletas y Facturas
// HPC_201408_FAC 20/10/2014  FACTURA - MOVIMIENTOS DE ALMACÉN CON NUEVOS ARCHIVOS DE SALDOS COB319 - COB337
// HPC_201502_FAC 22/06/2015  Se inicializa Montos de Servicio en 0 para generar CXC
// HPC_201504_FAC 14/08/2015  Se verifica grabación del Cliente Asociado en Maestro de Clientes
// HPC_201505_FAC 18/09/2015  Ajustes a grabación
// HPC_201507_FAC 24/11/2014  Entrega al área de Calidad
// HPC_201601_FAC 28/12/2015  Se incluye tipo de documento 33 - Ticket  Autor :  PCC                                                         *
// HPC_201602_FAC 11/03/2016  Se valida que fecha de Bol/Fac no sea menor que última fecha de ingreso
//                21/03/2016  Se añade Tipo de Documento a Filtro para grabación de Cabecera
// HPC_201603_FAC 08/08/2016  Se retira restricción con respecto a una Fecha de Ingreso posterior a la fecha de factura
//                            La Nota de Ingreso irá con la Fecha de la Factura
//                09/08/2016  Se toma Saldo de Archuivo LOG319 en vez de LOG316
//                            Retira Rutina VerificaLOG316
//                            Cambia rutina de reversión de Saldos
//                            Retira Rutina GeneraSalida
// HPC_201701_FAC 30/06/2017  Adecuaciones para facturación Electrónica
//                26/10/2017  Cambio de operación de escritura de archivo TXT de aplicación cliente hacia la aplicación servidor FAC
//                16/02/2017  Optimización en generación de provisión a partir de las Dinámicas Contables
// HPC_201801_FAC 26/03/2018  cambios por búsqueda en Maestro de clientes
// HPC_201802_FAC 02/07/2018  cambia número temporal de documento de Venta
// HPC_201804_FAC 04/07/2018  Debe mostrar sólo los almacenes que tengan stock final mayor a cero
//                04/07/2018  devuelve focus a cantidad si no hay stock suficiente
//                04/07/2018  envía focus a grid de cantidades por almacenes si está activado, sino envía focus a cantidad
//                06/07/2018  ordena apertura de Detalle de Dinámicas Contables
//                09/07/2018  Limpia cualquier filtro predefinido en Lista de Precios
// HPC_201805_FAC 20/07/2018  Fuerza a que siempre se levante la consulta de Maestro de Clientes
//                20/07/2018  Se corrige el mensaje de Ingreso por Salida
//                14/08/2018  Se retira Control Transaccional en ejecución de Procedimiento Almacenado que genera Facturación Electrónica
// FAC-201806     26/10/2018  Retira ruitnas en desuso, comentarios pasados, cambia display de importes a 2 dígitos
// FAC-201807     19/11/2018  Impresión de Constancia de Entrega de Mercadería 
//

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, Wwdbdlg, Mask, wwdbedit,
   wwdblook, wwdbdatetimepicker, ExtCtrls, db, DBCtrls, Mant, ppDB,
   ppDBPipe, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm,
   ppRelatv, ppProd, ppReport, ppViewr, ppEndUsr, ppStrtch, ppMemo, ppTypes,
   oaVariables, ppParameter, MsgDlgs, VARIANTS, DBGrids, ppModule,
   daDataModule;

  {SELECT TO_CHAR (SYSDATE, 'MM-DD-YYYY HH24:MI:SS')"NOW" FROM DUAL }

Type
   TFFactSGuia = Class(TForm)
      pnlCabecera: TPanel;
      pnlCab2: TPanel;
      Label2: TLabel;
      Label4: TLabel;
      Label19: TLabel;
      Label7: TLabel;
      Label12: TLabel;
      Label20: TLabel;
      Label22: TLabel;
      bbtnOk: TBitBtn;
      bbtnBorra: TBitBtn;
      dblcVen: TwwDBLookupCombo;
      EdtVen: TEdit;
      dblcdClieRuc: TwwDBLookupComboDlg;
      dblcLPrecio: TwwDBLookupCombo;
      edtLPrecio: TEdit;
      dblcTMon: TwwDBLookupCombo;
      edtTMon: TEdit;
      dbeTCambio: TwwDBEdit;
      edtFPago: TEdit;
      dbeCredito: TwwDBEdit;
      pnlCab1: TPanel;
      Label1: TLabel;
      Label17: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      dblcLocal: TwwDBLookupCombo;
      edtLocal: TEdit;
      pnlDetalle: TPanel;
      dbgDetFac: TwwDBGrid;
      btnActReg: TwwIButton;
      pnlPie: TPanel;
      Z2bbtnImprime: TBitBtn;
      bbtnRegresa: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      Z2bbtnAcepta: TBitBtn;
      pnlEstado: TPanel;
      Label9: TLabel;
      bbtnCalc: TBitBtn;
      Label36: TLabel;
      dblcTdoc: TwwDBLookupCombo;
      edtTDoc: TEdit;
      lblFCanje: TLabel;
      dtpFFac: TwwDBDateTimePicker;
      edtDireccion: TwwDBEdit;
      Label23: TLabel;
      lblNLugarE: TLabel;
      lblLugar: TLabel;
      dblcLentrega: TwwDBLookupCombo;
      edtLentrega: TEdit;
      pnlActuali: TPanel;
      lblActuali: TLabel;
      pnlRegistro: TPanel;
      lblCnpEgr: TLabel;
      lblCuenta: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      Label16: TLabel;
      Label15: TLabel;
      Label27: TLabel;
      lblUMAG: TLabel;
      Label29: TLabel;
      lblUMAU: TLabel;
      dblcdArticulo: TwwDBLookupComboDlg;
      bbtnRegOk: TBitBtn;
      bbtnRegCanc: TBitBtn;
      stTitulo: TStaticText;
      dbePrecioG: TwwDBEdit;
      dbeImporte: TwwDBEdit;
      dbeArticulo: TwwDBEdit;
      dbeUmg: TwwDBEdit;
      dbeDGarantia: TwwDBEdit;
      cbTipoum: TComboBox;
      dbgStock: TwwDBGrid;
      dbeCantGA: TwwDBEdit;
      dbeCantUA: TwwDBEdit;
      edtDsto2: TwwDBEdit;
      bbtnBuscaArt: TBitBtn;
      lblDescuento: TLabel;
      dbePorcentaje: TwwDBEdit;
      lblEstado: TDBText;
      dblcFPago: TwwDBLookupCombo;
      Label6: TLabel;
      dblcTClie: TwwDBLookupCombo;
      EdtTClie: TEdit;
      lblTipoCliente: TLabel;
      dblcdAso: TwwDBEdit;
      btnExec: TButton;
      Label8: TLabel;
      dblcdProf: TwwDBLookupComboDlg;
      lblGarantia: TLabel;
      dbeGarantia: TwwDBEdit;
      Label5: TLabel;
      Label21: TLabel;
      dblcTInv: TwwDBLookupCombo;
      edtTinv: TEdit;
      lblTCom: TLabel;
      dblcTipoCompra: TwwDBLookupCombo;
      edtTipoCompra: TEdit;
      pnlDetalleA: TPanel;
      bvlDetalle: TBevel;
      lblNItem: TLabel;
      lblUMed: TLabel;
      lblDesc: TLabel;
      Label24: TLabel;
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
      lblDetServ: TLabel;
      dbeImp2: TEdit;
      lblImp1: TLabel;
      lblImp2: TLabel;
      lblVVta: TLabel;
      lblTotal: TLabel;
      memDetalle: TwwDBEdit;
      btnMemServ: TBitBtn;
      stxTitulo2: TStaticText;
      btnMemArt: TBitBtn;
      memDetArt: TMemo;
      Label10: TLabel;
      dblcSerie: TwwDBLookupCombo;
      dbeNFac: TwwDBEdit;
      Label11: TLabel;
      Label18: TLabel;
      dblcAlmacen: TwwDBLookupCombo;
      edtAlmacen: TEdit;
      lblObserv: TLabel;
      dbmObs: TDBMemo;
      dbeCnt: TwwDBEdit;
      edtClie: TwwDBEdit;
      Label30: TLabel;
      dtpFVcmto: TwwDBDateTimePicker;
      bbtnKDXSerie: TBitBtn;
      pnlKDXSerie: TPanel;
      StaticText1: TStaticText;
      bbtnOKKDXSerie: TBitBtn;
      bbtnCancelKDXSerie: TBitBtn;
      dbgGridSerie: TwwDBGrid;
      lblCodigo: TLabel;
      lblDescripcion: TLabel;
      dbeMontoDCTO1: TwwDBEdit;
      edtDsto1: TwwDBEdit;
      dbeMontoDCTO2: TwwDBEdit;
      Label33: TLabel;
      dbeImporteIGV: TwwDBEdit;
      Label3: TLabel;
      Z2bbtnCambiaCond: TBitBtn;
      gbRed: TGroupBox;
      dbeRed: TwwDBEdit;
      bbtnRed: TBitBtn;
      Bevel1: TBevel;
      Bevel2: TBevel;
      Bevel3: TBevel;
      Label28: TLabel;
      dblcOfide: TwwDBLookupCombo;
      edtOfdes: TEdit;
      bbtnCombo: TBitBtn;
      bbtnDcto: TBitBtn;
      lblObsequio: TLabel;
      Label34: TLabel;
      dblcdServicio: TwwDBLookupComboDlg;
      lblConsignacion: TLabel;
      Label37: TLabel;
      bbtnInicial: TBitBtn;
      pnlPagos: TPanel;
      Label35: TLabel;
      dbeMonto: TwwDBEdit;
      dbeOpe: TwwDBEdit;
      Label39: TLabel;
      Label38: TLabel;
      dtpFecOpe: TwwDBDateTimePicker;
      Label40: TLabel;
      bbtnRecargo: TBitBtn;
      dbeInc: TwwDBEdit;
      bbtnEditaCli: TBitBtn;
      bbtnTicket: TBitBtn;
      cbDiseno: TCheckBox;
      pnlFecVenc: TPanel;
      dbeServicio: TwwDBEdit;
      Label41: TLabel;
      dbeIgv: TwwDBEdit;
      Label42: TLabel;
      dbeIGV2: TwwDBEdit;
      dbeServicio2: TwwDBEdit;
      dbeTASSERV2: TEdit;
      Label43: TLabel;
      Label44: TLabel;
      bbtnRecalSld: TBitBtn;
      Data: TppDBPipeline;
      ppDBFactura: TppDBPipeline;
      ppDBCabFactura: TppDBPipeline;
      ppFact: TppReport;
      ppBol: TppReport;
      pprTicket: TppReport;
      Diseno: TppDesigner;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      Z2bbtnReImprime: TBitBtn;
      pnlImprDest: TPanel;
      bbtnImpDest: TBitBtn;
      StaticText3: TStaticText;
      dblcdImpDest: TwwDBLookupComboDlg;
      bbtnImpDestCanc: TBitBtn;
      bbtnObs: TBitBtn;
      pnlObs: TPanel;
      edtObs1: TEdit;
      edtObs2: TEdit;
      edtObs3: TEdit;
      bbtnObsOk: TBitBtn;
      bbtnObsCanc: TBitBtn;
      StaticText2: TStaticText;
    bbtnEntrega: TBitBtn;
      Procedure dblcNotInListLook(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcLocalExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcAlmacenExit(Sender: TObject);
      Procedure dblcTdocExit(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure bbtnCalcClick(Sender: TObject);
      Procedure dblcdProfExit(Sender: TObject);
      Procedure dblcFPagoExit(Sender: TObject);
      Procedure dblcVenExit(Sender: TObject);
      Procedure dblcLPrecioExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcLentregaExit(Sender: TObject);
      Procedure btnActRegClick(Sender: TObject);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure dblcdArticuloDropDown(Sender: TObject);
      Procedure dblcdArticuloExit(Sender: TObject);
      Procedure dbeCantGAExit(Sender: TObject);
      Procedure dbeCantUAExit(Sender: TObject);
      Procedure dbePrecioGExit(Sender: TObject);
      Procedure edtDsto2Exit(Sender: TObject);
      Procedure bbtnRegCancClick(Sender: TObject);
      Procedure bbtnRegOkClick(Sender: TObject);
      Procedure dbgStockCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure EstadoDeForma(xxModo: Integer; xMovEstado: String);
      Procedure dblcSerieExit(Sender: TObject);
      Procedure dtpFFacExit(Sender: TObject);
      Procedure cbTipoumExit(Sender: TObject);
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure dbgDetFacCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      Procedure dbgDetFacDblClick(Sender: TObject);
      Procedure dbgDetFacKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure bbtnRegresaClick(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure dblcVenNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcTMonNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcLPrecioNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcLentregaNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblcFPagoNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure btnExecClick(Sender: TObject);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure AsignaConstantedeImpresionDema;
      Procedure ppvValorUntCalc(Sender: TObject; Var Value: Variant);
      Procedure pprFacturaPrintingComplete(Sender: TObject);
      Procedure dblcdAsoExit(Sender: TObject);
      Procedure dblcTClieExit(Sender: TObject);
      Procedure dblcTInvExit(Sender: TObject);
      Procedure dblcTipoCompraExit(Sender: TObject);
      Procedure dbePUnitExit(Sender: TObject);
      Procedure btnMemServClick(Sender: TObject);
      Procedure btnMemArtClick(Sender: TObject);
      Procedure ppFactPreviewFormCreate(Sender: TObject);
      Procedure ppBolPreviewFormCreate(Sender: TObject);
      Procedure dbmObsKeyPress(Sender: TObject; Var Key: Char);
      Procedure edtClieExit(Sender: TObject);
      Procedure dtpFVcmtoExit(Sender: TObject);
      Procedure bbtnKDXSerieClick(Sender: TObject);
      Procedure bbtnCancelKDXSerieClick(Sender: TObject);
      Procedure bbtnOKKDXSerieClick(Sender: TObject);
      Procedure dbgGridSerieFieldChanged(Sender: TObject; Field: TField);
      Procedure dbeTCambioKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcSerieNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcdClieRucExit(Sender: TObject);
      Procedure dbePorcentajeExit(Sender: TObject);
      Procedure dbeGarantiaKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcSerieGuiaNotInList(Sender: TObject;
         LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure FormCreate(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dblcdProfEnter(Sender: TObject);
      Procedure Z2bbtnCambiaCondClick(Sender: TObject);
      Procedure bbtnRedClick(Sender: TObject);
      Procedure dbeMontoDCTO2Exit(Sender: TObject);
      Procedure dblcOfideExit(Sender: TObject);
      Procedure bbtnComboClick(Sender: TObject);
      Procedure bbtnDctoClick(Sender: TObject);
      Procedure dblcdServicioExit(Sender: TObject);
      Procedure bbtnInicialClick(Sender: TObject);
      Procedure dbeImporteIGVExit(Sender: TObject);
      Procedure bbtnRecargoClick(Sender: TObject);
      Procedure bbtnEditaCliClick(Sender: TObject);
      Procedure bbtnTicketClick(Sender: TObject);
      Procedure dtpFFacChange(Sender: TObject);
   // Inicio FAC-201806
   // 16/10/2018 retira rutina que no se usa
      {
      Procedure ppDetailBand4BeforePrint(Sender: TObject);
      Procedure ppDetailBand1BeforePrint(Sender: TObject);
      }
   // Fin FAC-201806
      Procedure bbtnRecalSldClick(Sender: TObject);
   // Inicio FAC-201806
   // 16/10/2018 retira rutina que no se usa
      //Procedure GrabaDetalleFac;
   // Fin FAC-201806

      Procedure GeneraTxtFactElec;
      Procedure GeneraTxtFactElec0;
      Procedure SelecImpresDest;
      Procedure Z2bbtnReImprimeClick(Sender: TObject);
      Procedure bbtnImpDestClick(Sender: TObject);
      Procedure bbtnImpDestCancClick(Sender: TObject);
      Procedure dblcdImpDestExit(Sender: TObject);
      Procedure bbtnObsClick(Sender: TObject);
      Procedure bbtnObsCancClick(Sender: TObject);
      Procedure bbtnObsOkClick(Sender: TObject);
      procedure dblcSerieEnter(Sender: TObject);
      procedure dblcdClieRucEnter(Sender: TObject);
      procedure dbePorcentajeEnter(Sender: TObject);
      procedure dblcFPagoEnter(Sender: TObject);
      procedure dblcOfideEnter(Sender: TObject);
      procedure dblcLentregaEnter(Sender: TObject);
      procedure dtpFVcmtoEnter(Sender: TObject);
      procedure dblcVenEnter(Sender: TObject);
      procedure dblcLPrecioEnter(Sender: TObject);
      procedure dblcTMonEnter(Sender: TObject);
      procedure bbtnObsEnter(Sender: TObject);
      procedure bbtnObsExit(Sender: TObject);
      procedure edtDireccionEnter(Sender: TObject);
      procedure edtDireccionExit(Sender: TObject);
      procedure dbeGarantiaExit(Sender: TObject);
      procedure dbeGarantiaEnter(Sender: TObject);
    procedure bbtnEntregaClick(Sender: TObject);
   Private
  { Private declarations }
      cCombo: String;
      cObsequio: String;
      xFlagIF: boolean;
      fTipoInc: Integer;
      nPorInc: Double;
      sAlmacen: String;
      xImpTasa, xImpTasa19: String; // Solo tiene tres valores Requisicion x (C)ompras (S)ervicios (A)ctivos Fijos
      Procedure InicializaCamposDetalle;
      Function ExisteArticuloDuplicado(xxArt: String): boolean;
      Procedure AperturaConsultaSaldos(xxFlagE: String);
      Procedure CalculaFooter;
      Function ConsistenciaDet: Boolean;
      Procedure Muestrastock(xxArticulo, xxEstado: String);
      Procedure IniciaForma;

      Procedure GeneraMovLOG314(xxUltReg, xxAno, xxMes, xxAnoMes, xxClie, xxCos, xxTri: String);

      Procedure VerificaNumeroSerie;
      Procedure CargaDataSource;
      Procedure VerificarFormaPago;
      Procedure GeneraCombo;
      Procedure ActualizaClientes;
      Procedure GeneraDescuento;
      Procedure ReciboCompletoFac(Sender: TObject);
      Procedure ReciboCompletoBol(Sender: TObject);
      Procedure ActualizaSaldos(xxArticulo, xxalmid, xxCant, xxNumDoc, xxFecha, xxTipTran, xxcosto: String);
      Procedure ReciboCompletoTkt(Sender: TObject);

   Public
    { Public declarations }
      wContenido: boolean;
      MtxAsocia: TMant;
      vCiaid, vClieid, vFacserie, vNfac, vFacFecha: String;
      sTipoRQS: String;

      Function ValidaCabecera: Boolean;
      Procedure LimpiarCampos;
      Procedure RevierteStock;
      Procedure AceptarProforma;
   // Inicio FAC-201806
   // 26/10/2018 retira rutina que no se usa
      //Function TransferenciaCXC(cNoReg: String): Boolean;
      //Function TransferenciaCXC_VC(cNoReg: String): Boolean;
      //Function GeneraRegistroCxC301(xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxNoReg, xxTDiar, xxTDoc: String): Boolean;
      //Procedure GeneraRegistroCxC302(xxTipDet, xxTReg, xxMontoMO, xxMontoMN, xxMontoME, xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxDH, xxTDoc, xxTDiar, xxNoReg, xxCcosId: String; xcount: integer);
      //Procedure GeneraRegistroCxC302D(xxTipDet, xxTReg, xxMontoMO, xxMontoMN, xxMontoME, xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxDH, xxTDoc, xxTDiar, xxNoReg, xxCcosId: String; xcount: integer);
      //Procedure GeneraRegistroCxC302S(xxTipDet, xxTReg, xxMontoMO, xxMontoMN, xxMontoME, xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxDH, xxTDoc, xxTDiar, xxNoReg, xxCcosId: String; xcount: integer);
      //Procedure GeneraRegistroCxC302VC(xxTipDet, xxTReg, xxMontoMO, xxMontoMN, xxMontoME, xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxDH, xxTDoc, xxTDiar, xxNoReg, xxCcosId: String; xcount: integer);
   // Fin FAC-201806

      Procedure InicializaPorUsuario;
      Procedure InicializaPorUsuario_1;
      Procedure InsertaDetalleFacturaObservacion;

      Function GetDinamicaContable(xxCompania, xxTipoDoc, xxMoneda, xxTipoPago, xxArticulo: String): String;
      Function GetTasaIgv(xxCompania, xxTipoDoc, xxMoneda, xxTipoPago, xxArticulo: String): Double;
      Function FlagArticuloConDinamica(xxCompania, xxTipoDoc, xxMoneda, xxTipoPago, xxArticulo: String): boolean;
      Procedure ActualizaCabCXC(xxCompania, xxAnioMes, xxTipoDiario, xxNoRegistro, xxNoDocumento: String);
   // Inicio FAC-201806
   // 26/10/2018 retira rutina que no se usa
      //Procedure ReGeneraCNT;
   // Fin FAC-201806
      Function ConIGV(): String;

      Procedure GrabaCabecera(xModAdi: String);
      Procedure AcumulaTotCabecera();
      Procedure GrabaDetalle(xModAdi: String);
      Procedure GrabaObservacion();
   // Inicio FAC-201806
   // 26/10/2018 retira rutina que no se usa
      //Procedure ActualizacionDetalle();
   // Fin FAC-201806
      Procedure BorrarRegistro();
      Function SiExisteDetalle(): boolean;
      Procedure GeneraMovKardex;
      Procedure ActualizaSaldos1();
   End;

Var
   FFactSGuia: TFFactSGuia;
   xLPrecio: boolean;
   xRegresa: Boolean;
   xAnoMM: String;
   xDto01: double;
   xCrea: Boolean;
   xFCia: boolean;
   xSerie: boolean;
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
   xNuevoClie: boolean;
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
   xFlagImpOrden: boolean;
   SQLFiltro, wSQL, xFiltro: String;
   wInserta: boolean;
   wGenTipDoc, xFec_Doc: String;
   xCia, xLoc, xTVt, xTin, xAlm, xTCli, xLPr, xTDoc, xCPag, xTMo, xClauxAso: String;
   xAdicArt, xFact, xBol, xGRem, FlagFecDoc: String;
   xDifDias: Double;
   xNoPasa, sFecha: String;
   xZonaAso, sZonaAso: String;
   xFecHoy: TDateTime;
   wErrorStock: Boolean;
   fDcto, fReca: Boolean;
   xTipDocIdent, xNumdocIdent: String;
   wwNumFacAnt: String;

   xcptocab: String;

   sTipoPago: String;
   xContinuaGrab: boolean;
   xCliedes, xTPersona: String;
   xTick: String;

   xClauxId: String;
   xNumeroReal: String;
   wIP_Impresora: String;
   wId_Rutadest: String;
   xTienda: String;
   xPVenta: String;
   xEnvioSunat: String;

   xMsgError : String;


Implementation
Uses FacDM, oaVE2000, Fac771, FAC394, FAC371, FAC372, FAC373, FAC368, FAC377;

// FAC373   FMontoInicial    Ingresar importe de Cuota Inicial / Nota de Crédito
// FAC372   FCondComercial   Cambiar condición Comercial
// FAC371   FVentaDcto       Descuento de Factura
// FAC394   FCombos          Para seleccionar Combo
// FAC375   FVentaReca       recargo de Factura
// FAC379   FFormaPago       Forma de Pago

{$R *.DFM}

Procedure TFFactSGuia.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      If self.ActiveControl Is TDBMemo Then Exit;
      If self.ActiveControl Is TMemo Then Exit;
      Key := #0;
      Perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFFactSGuia.dblcNotInListLook(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFFactSGuia.dblcCiaExit(Sender: TObject);
Var
   xWhere, xSQL: String;
Begin
   If xCrea And Not xFCia Then Exit;
   edtCia.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE101', 'CIADES, FLAG', 'CIAID=' + QuotedStr(dblcCia.Text), 'CIADES');

   dtpFFac.Enabled := True;
   dtpFFac.ReadOnly := True;

// Tipo de Lista de Precios
   DMFAC.cdsTLista.Filtered := False;
   DMFAC.cdsTLista.Filter := 'CIAID=' + QuotedStr(dblcCia.Text);
   DMFAC.cdsTLista.Filtered := True;

// Condiciones Comerciales usadas por la Compañía
   xWhere := 'SELECT * FROM TGE180 WHERE CIAID =' + QuotedStr(dblcCia.Text) + ' AND DCCOMFLAG=''S''';
   Filtracds(DMFAC.cdsCComer, xWhere);

// Vendedores
   DMFAC.cdsVen.close;
   DMFAC.cdsVen.datarequest('SELECT * FROM CXC203 WHERE CIAID =''' + dblcCia.Text + ''' AND NVL(VESTATUS,''N'')=''S''');
   DMFAC.cdsVen.Open;

// Tipo de Inventario
   DMFAC.cdsTInven.Filtered := False;
   DMFAC.cdsTInven.Filter := 'CIAID =' + QuotedStr(dblcCia.Text);
   DMFAC.cdsTInven.Filtered := True;

   xSQL := 'Select * from TGE126 where CIAID =' + QuotedStr(dblcCia.Text);
   DMFAC.cdsLocal.Close;
   DMFAC.cdsLocal.DataRequest(xSQL);
   DMFAC.cdsLocal.open;

   If DMFAC.wModo = 'A' Then
   Begin
      InicializaPorUsuario_1;
   End;
End;

Procedure TFFactSGuia.dblcLocalExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CIAID=' + Quotedstr(dblcCia.Text) + ' AND LOCID=' + QuotedStr(dblcLocal.Text);
   If xCrea And Not xFLocal Then Exit;
   edtLocal.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE126', 'LOCDES', xWhere, 'LOCDES');
End;

Procedure TFFactSGuia.dblcFPagoExit(Sender: TObject);
Var
   xSQL, xWhere: String;
Begin
// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
   If btnExec.Focused Then Exit;

   xWhere := 'CIAID=' + QuotedStr(dblcCia.Text)
      + ' AND CCOMERID =' + QuotedStr(dblcFPago.Text);

   DMFAC.BuscaQry('dspUltTGE', 'TGE180', 'DCCOMDES, DCCOMPORC, DCOMMTOMAX, CONDPID', xWhere, 'DCCOMDES');
   edtFPago.Text := DMFAC.cdsQry.FieldByName('DCCOMDES').AsString;
   sTipoPago := DMFAC.cdsQry.FieldByName('CONDPID').AsString;

   If DMFAC.wModo = 'A' Then
   Begin
      dbePorcentaje.Text := floattostr(DMFAC.cdsQry.FieldByName('DCCOMPORC').AsFloat);
      xDto01 := DMFAC.cdsQry.FieldByName('DCCOMPORC').AsFloat;
   End;

   nPorInc := DMFAC.cdsQry.FieldByName('DCOMMTOMAX').AsFloat;
   dblcOfide.Enabled := False;

   If (dblcFPago.Text = '11') Or (dblcFPago.Text = '12') Then
   Begin
      xSQL := 'Select * '
         + '     from APO110 '
         + '    where substr(OFDESID,1,1)<>''M'' '
         + '    order by OFDESID';
      DMFAC.cdsTransf.ProviderName := 'dspUltTGE';
      DMFAC.cdsTransf.Close;
      DMFAC.cdsTransf.DataRequest(xSQL);
      DMFAC.cdsTransf.Open;
      dblcOfide.Enabled := True;
      dblcOfide.SetFocus;
   End
   Else
   Begin
   End;

   If sTipoPago = 'VC' Then
   Begin
      xSQL := 'Select * '
         + '     from APO110 '
         + '    where substr(OFDESID,1,1)<>''M'' '
         + '    order by OFDESID';
      DMFAC.cdsTransf.ProviderName := 'dspUltTGE';
      DMFAC.cdsTransf.Close;
      DMFAC.cdsTransf.DataRequest(xSQL);
      DMFAC.cdsTransf.Open;
      dblcOfide.Enabled := True;
      dblcFPago.Enabled := False;
   End;
End;

Procedure TFFactSGuia.VerificarFormaPago;
Var
   xMsg, xSQL: String;
Begin
   If dblcCia.Text = '04' Then
   Begin
      xSQL := 'Select ASOID, CREDID, ASOAPENOM, CREFOTORG, CREMTOOTOR, CREMTOGIR, CREMTONABO '
         + '     From CRE301 '
         + '    Where ASOID=''' + dblcdAso.Text + ''' '
         + '      and CREFOTORG>=''' + DateToStr(dtpFFac.Date - 1) + ''' '
         + '      and CREFOTORG<=''' + DateToStr(dtpFFac.Date + 1) + ''' ';
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      DMFAC.cdsQry.First;
      xMsg := '';
      While Not DMFAC.cdsQry.Eof Do
      Begin
         xMsg := xMsg + 'Crédito  : ' + DMFAC.cdsQry.FieldByName('CREDID').AsString + ' ' + chr(13)
            + 'Asociado : ' + DMFAC.cdsQry.FieldByName('ASOAPENOM').AsString + ' ' + chr(13)
            + 'Fecha    : ' + DMFAC.cdsQry.FieldByName('CREFOTORG').AsString + ' ' + chr(13)
            + 'Monto    : ' + DMFAC.cdsQry.FieldByName('CREMTOOTOR').AsString + ' ' + chr(13)
            + chr(13) + chr(13);
         DMFAC.cdsQry.Next;
      End;

      If (dblcFPago.Text = '01') And (DMFAC.cdsQry.RecordCount > 0) Then
      Begin
         MessageDlg('Existe Credito Aprobado para el Asociado. ' + chr(13) + chr(13) +
            xMsg + 'Verificar la Condición Comercial...', mtConfirmation, [mbYes], 0)
      End;
      If (dblcFPago.Text = '03') And (DMFAC.cdsQry.RecordCount <= 0) Then
      Begin
         MessageDlg('NO Existen Creditos Aprobados para el Asociado. ' + chr(13) + chr(13) +
            'Verificar la Condición Comercial...?', mtConfirmation, [mbYes], 0)
      End;
   End;
End;

Procedure TFFactSGuia.dblcVenExit(Sender: TObject);
Begin
   If btnExec.Focused Then Exit;

   EdtVen.Text := DMFAC.BuscaQry('dspUltTGE', 'CXC203', 'VENOMBRES', 'CIAID=' + QuotedStr(dblcCia.Text) + ' AND VEID=' + QuotedStr(dblcVen.Text), 'VENOMBRES');
End;

Procedure TFFactSGuia.dblcLPrecioExit(Sender: TObject);
Begin
   If btnExec.Focused Then Exit;

   Try
      edtLPrecio.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC101', 'TLISTADES', 'CIAID=' + QuotedStr(dblcCia.Text) + ' AND TLISTAID=' + QuotedStr(dblcLPrecio.Text), 'TLISTADES');
   Except
      edtLPrecio.Text := DMFAC.cdsTLista.FieldByName('TLISTADES').asstring;
   End;
End;

Procedure TFFactSGuia.bbtnCalcClick(Sender: TObject);
Begin
   WinExec('Calc.exe', 1);
End;

Procedure TFFactSGuia.dblcAlmacenExit(Sender: TObject);
Begin
   If xCrea And Not xFAlmacen Then Exit;
   edtAlmacen.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE151', 'ALMDES', 'CIAID=' + QuotedStr(dblcCia.text) + ' AND ALMID=' + QuotedStr(dblcAlmacen.Text), 'ALMDES');
End;

Procedure TFFactSGuia.dblcTdocExit(Sender: TObject);
Var
   xx: String;
   xSQL: String;
Begin

   If xCrea Then Exit;
   edtTDoc.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCDES', 'DOCID=' + QuotedStr(dblcTdoc.Text), 'DOCDES');

   If DMFAC.wModo = 'M' Then
      Exit;

   xx := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCTIPREG', 'DOCMOD=''CXC'' AND DOCID=' + QuotedStr(dblcTdoc.Text), 'DOCTIPREG');

   If Length(Trim(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)) > 0 Then
   Begin
      xSQL := 'Select * '
         + '     from FAC103 '
         + '    Where CIAID=''' + dblcCia.Text + ''' '
         + '      and SERIEID=''' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString + ''' '
         + '      and ACTIVIDAD=''S'' '
         + '      and FLAGV=''' + xx + '''';
      DMFAC.cdsQry1.Close;
      DMFAC.cdsQry1.DataRequest(xSQL);
      DMFAC.cdsQry1.Open;
      If DMFAC.cdsQry1.RecordCount < 1 Then
      Begin
         DMFAC.cdsFact2.FieldByName('FACSERIE').Clear;
         DMFAC.cdsFact2.FieldByName('NFAC').Clear;
      End;
   End;

   wSQL := ' CIAID=' + QuotedStr(dblcCia.Text) + ' AND FLAGV=' + QuotedStr(xx) + ' AND ACTIVIDAD=''S'' ';
   DMFAC.FiltraTabla(DMFAC.cdsSerie, 'FAC103', 'SERIEID', wSQL);

   xBol := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''B''', 'DOCID');
   If xBol = dblcTDoc.Text Then
   Begin
      dblcdClieRuc.Enabled := False;
   End
   Else
   Begin
      dblcdClieRuc.Enabled := False;
      edtClie.Enabled := False;
   End;

   If dtpFFac.Enabled Then
   Begin
      dtpFFac.SetFocus;
      exit;
   End
   Else
   Begin
      If (DMFAC.cdsFact2.FieldByName('FACESTADO').AsString = 'INICIAL') And
         (dblcTipoCompra.Text = 'C') Then
      Begin
         DMFAC.VerificaPeriodoVentas(dblcCia.Text, dblcLocal.text, dblcTInv.text, dblcAlmacen.text, xFecHoy, dtpFFac.Date);
         If Not wVerifPerVentas Then
         Begin
            dblcTdoc.SetFocus;
            exit;
         End;
      End;
   // Se fuerza la búsqueda en el el Maestro de Clientes
      DMFAC.xTipCli := 'S';
      dblcdClieRuc.Enabled := False;
      edtClie.Enabled := False;
      dblcdAso.ReadOnly := True;
      If length(edtClie.Text)=0 Then btnExecClick(Self);
      exit;
   End;
End;

Procedure TFFactSGuia.bbtnOkClick(Sender: TObject);
Var
   xWhere, xNFact, sAlmacen: String;
   xTotDscto1, xTotDscto2, xTotImp1, xTotImp2, xImporte, xSTotal, xTotal, xPVentaTot: Double;
   xDscto1, xDscto2, xImp1, xImp2: Double;
   Y, M, D: Word;
   xSQL, vSQL: String;
Begin

   dbeImporte.Text := '0';

   If dbeNFac.text = '' Then
   Begin
      dblcSerie.SetFocus;
      Raise Exception.Create('No existe Número de Boleta/Factura');
   End;

   If dtpFFac.Date <> dtpFVcmto.Date Then
   Begin
      ShowMessage('Error : Fecha de Factura debe ser igual a Fecha de Vencimiento');
      Exit;
   End;

   If dblcTipoCompra.Text = 'C' Then
   Begin
      DMFAC.VerificaPeriodoVentas(dblcCia.Text, dblcLocal.text, dblcTInv.text, dblcAlmacen.text, xFecHoy, dtpFFac.Date);
      If Not wVerifPerVentas Then
      Begin
         If (dblcTdoc.Enabled) And (pnlCab1.Enabled) Then
            dblcTdoc.SetFocus;
         exit;
      End;
   End;

   If DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat <= 0 Then
   Begin
      ShowMessage('Error : Fecha de Emisión No tiene Tipo de Cambio ');
      dtpFFac.Enabled := True;
      dtpFFac.SetFocus;
      exit;
   End;

   If Length(DMFAC.cdsFact2.FieldByName('CLIEID').AsString) = 0 Then
   Begin
      MessageDlg('Ingrese el Código del Asociado', mtInformation, [mbOk], 0);
      dblcdAso.SetFocus;
      Exit;
   End;

   If xNoPasa = 'N' Then
   Begin
      ErrorMsg(Caption, 'Existen Artículos que no Cumplen con el Stock, No puede Continuar');
      bbtnOk.SetFocus;
      Exit;
   End;

   xFact := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD =''CXC'' AND DOCTIPREG =''F''', 'DOCID');

   If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xFact) Then //Si genera Factura
   Begin
      If Length(Trim(dblcdClieRuc.Text)) = 0 Then
      Begin
         ErrorMsg(Caption, 'El Nº de R.U.C. no es Válido ');
         dblcdClieRuc.SetFocus;
         Exit;
      End;
   End;

   FlagFecDoc := DMFAC.Control_Fecha(xFecHoy, dtpFFac.Date);
   If FlagFecDoc = 'ANT' Then
   Begin
      ErrorMsg(Caption, 'No Puede Registrar el Documento a la Fecha');
      dtpFFac.SetFocus;
      Exit;
   End;

   If FlagFecDoc = 'DES' Then
   Begin
      ErrorMsg(Caption, 'No Puede Registrar el Documento Posterior a la Fecha del Sistema');
      dtpFFac.SetFocus;
      Exit;
   End;

   If Not ValidaCabecera Then Exit; // Valida que Cabecera Tenga Datos Correctos

   Screen.Cursor := crHourGlass;

   xWhere := 'CIAID =' + QuotedStr(dblcCia.Text)
      + ' AND LOCID =' + QuotedStr(dblcLocal.Text)
      + ' AND TINID =' + QuotedStr(dblcTInv.Text)
      + ' AND ALMID =' + QuotedStr(dblcAlmacen.Text);

   xCiaEnviar := dblcCia.Text;

   xFact := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD =''CXC'' AND DOCTIPREG =''F''', 'DOCID');
   xBol := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD =''CXC'' AND DOCTIPREG =''B''', 'DOCID');

   xTick := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD =''CXC'' AND DOCTIPREG =''T''', 'DOCID');

   DecodeDate(dtpFFac.Date, Y, M, D);
   sTipoRQS := dblcTipoCompra.Text;

   If Not xRegresa Then
   Begin
      wSQL := 'CIAID =' + QuotedStr(dblcCia.Text)
         + ' AND DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
         + ' AND FACSERIE =' + QuotedStr(dblcSerie.Text)
         + ' AND NFAC =' + QuotedStr(dbeNFac.Text)
         + ' ORDER BY DFACITEM';
      Filtracds(DMFAC.cdsDetFact2, 'SELECT * FROM FAC306 WHERE ' + wSQL);

   // Inicio FAC-201806
   // 26/10/2018 cambia display de importes a 2 dígitos
      {
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
   // Fin FAC-201806
   End;

   If ((DMFAC.wModo = 'A') And Not (xRegresa)) Then
   Begin
      Screen.Cursor := crHourGlass;
      If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xFact) Then //Si genera Factura
      Begin

      End
      Else
      Begin
         If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xBol) Then //Si genera Boleta
         Begin

         End
         Else
         Begin
            If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xTick) Then //Si genera Ticket
            Begin

            End
            Else
            Begin
               If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xGRem) Then //Si genera Guia de Remision
               Begin
                  xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND FLAGV=' + QuotedStr('G') + ' AND SERIEID=' + QuotedStr(dblcSerie.Text);
                  xNFact := inttostr(strtoint(DMFAC.BuscaQry('dspUltTGE', 'FAC103', 'SERIENUM', xWhere, 'SERIENUM')) + 1);
                  DMFAC.cdsFact2.FieldByName('NFAC').AsString := DMFAC.StrZero(xNFact, DMFAC.wAnchoFact);
                  dbeNFac.Text := DMFAC.StrZero(xNFact, DMFAC.wAnchoFact);

                  xSQL := ' update FAC103 '
                     + '       set SERIENUM=' + '' + xNFact + ''
                     + '     where CIAID=' + QuotedStr(dblcCia.text)
                     + '       and FLAGV = ''G'' '
                     + '       and SERIEID=' + QuotedStr(dblcSerie.Text);
                  Try
                     DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
                  Except
                     ShowMessage('No se pudo actualizar el archivo de Series al pasar de Cabecera a Detalle');
                     exit;
                  End;
               End;
            End;
         End;
      End;
   End;

// Inicio FAC-201806
// 27/10/2018 verifica que se puedan editar valores a los campos
   If DMFAC.cdsFact2.State = dsBrowse then
      DMFAC.cdsFact2.Edit;

// Fin FAC-201806

   If (DMFAC.wModo = 'A') Then
   Begin
      If DMFAC.BuscaFecha('TGE114', 'FECANO', 'FECHA', dtpFFac.date) Then
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
      DMFAC.cdsFact2.FieldByName('FACUSER').AsString := DMFAC.wUsuario;
      DMFAC.cdsFact2.FieldByName('FACFREG').Value := xFecHoy; // fecha que registra Usuario
      DMFAC.cdsFact2.FieldByName('FACHREG').Value := xFecHoy + Time; // Hora de Registro de Usuario
   End
   Else
   Begin
      If (DMFAC.wModo = 'M') Then
      Begin
         DMFAC.cdsFact2.FieldByName('FACHREG').Value := xFecHoy + Time; // Hora de Registro de Usuario
      End;
   End;

   If Length(Trim(dbmObs.Text)) > 0 Then
      DMFAC.cdsFact2.FieldByName('FACTOBS').AsString := dbmObs.Text
   Else
      DMFAC.cdsFact2.FieldByName('FACTOBS').AsString := '.';

// Inicio FAC-201807
// 19/11/2018 Valida Observación
   xSQL := 'Select FN_FAC_VALIDA_OBS('+quotedstr(DMFAC.cdsFact2.FieldByName('FACTOBS').AsString)+') RESULTADO from DUAL';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount>0 Then
   Begin
      If DMFAC.cdsQry.FieldByName('RESULTADO').AsString<>'OK' Then
      Begin
         ShowMessage(DMFAC.cdsQry.FieldByName('RESULTADO').AsString);
         Exit;
      End;
   End;
// Fin FAC-201807

   If DMFAC.cdsFact2.FieldByName('NUMINI').AsString = '' Then
      DMFAC.cdsFact2.FieldByName('FECINI').AsDateTime := 0;

   If DMFAC.cdsFact2.FieldByName('FPAGOID').AsString = '' Then
      DMFAC.cdsFact2.FieldByName('FPAGOID').AsString := '01';

   If (DMFAC.cdsProforma.Active=True) and (length(dblcdProf.Text)>0) Then
   Begin
      If DMFAC.cdsProforma.FieldByName('PROFSIT').AsString = 'INICIAL' Then
      Begin
         If MessageDlg('¿Aceptar Proforma?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            If DMFAC.cdsProforma.State = dsBrowse Then
               DMFAC.cdsProforma.Edit;

            DMFAC.cdsProforma.FieldByName('PROFSIT').AsString := 'ACEPTADO';
            DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString := 'R';
            DMFAC.cdsProforma.FieldByName('PROFFREG').AsDatetime := xFecHoy; // fecha que registra Usuario
            DMFAC.cdsProforma.Post;

            xSQL := 'Select DB2ADMIN.FN_FAC_BUSCA_PROF_CAB('
               +            quotedstr(dblcCia.Text)+','
               +            quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)+','
               +            quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString)+') RESULTADO '
               + '     from DUAL';
            DMFAC.cdsQry.Close;
            DMFAC.cdsQry.DataRequest(xSQL);
            DMFAC.cdsQry.Open;
            If DMFAC.cdsQry.FieldByName('RESULTADO').AsString='TIENE' Then
            Begin
               xSQL := 'Select DB2ADMIN.FN_FAC_BUSCA_PROF_DET('
                  +            quotedstr(dblcCia.Text)+','
                  +            quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)+','
                  +            quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString)+') RESULTADO '
                  + '     from DUAL';
               DMFAC.cdsQry.Close;
               DMFAC.cdsQry.DataRequest(xSQL);
               DMFAC.cdsQry.Open;
               If DMFAC.cdsQry.FieldByName('RESULTADO').AsString='TIENE' Then
               Begin
                  xSQL := 'Begin DB2ADMIN.SP_FAC_ACEPTA_PROFORMA('
                     +            quotedstr(dblcCia.Text)+','
                     +            quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)+','
                     +            quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString)+'); End;';
                  Try
                     DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
                  Except
                     ShowMessage('No se pudo ACEPTAR la Proforma (1)');
                     exit;
                  End;
                  xSQL := 'Select PROFSIT '
                     + '     from DB2ADMIN.FAC311 '
                     + '    where CIAID='+quotedstr(dblcCia.Text)
                     + '      and ALMID='+quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)
                     + '      and PROFID='+quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString);
                  DMFAC.cdsQry.Close;
                  DMFAC.cdsQry.DataRequest(xSQL);
                  DMFAC.cdsQry.Open;
                  If DMFAC.cdsQry.FieldByName('PROFSIT').AsString<>'ACEPTADO' Then
                  Begin
                     ShowMessage('No se pudo ACEPTAR la Proforma (2)');
                     Exit;
                  End;
               End
               Else
               Begin
                  ShowMessage('No se encontró la proforma en BD para ACEPTAR (Detalle)');
                  Exit;
               End;
            End
            Else
            Begin
               ShowMessage('No se encontró la proforma en BD para ACEPTAR (Cabecera)');
               Exit;
            End;
         End;
      End;
   End;

// Pase de Cabecera a Detalle
   If length(dbeMonto.Text)=0 then dbeMonto.Text:='0';

   xClAux   := DMFAC.cdsFact2.FieldByName('CLAUXID').AsString;
   xCliedes := DMFAC.cdsFact2.FieldByName('CLIEDES').AsString;

   xSQL := 'Begin DB2ADMIN.SP_FAC_DE_CAB_A_DET('
      +           quotedstr(dblcCia.text)+', '
      +           quotedStr(dblcLocal.Text)+', '
      +           quotedstr(dblcTipoCompra.Text)+', '
      +           quotedstr(dblcTInv.Text)+', '
      +           quotedstr(dblcAlmacen.Text)+', '
      +           quotedstr(dblcTdoc.Text)+', '
      +           quotedstr(datetostr(dtpFFac.date))+', '
      +           quotedstr(dblcdAso.Text)+', '
      +           quotedstr(dblcdProf.Text)+', '
      +           quotedstr(dblcSerie.Text)+', '
      +           quotedstr(dbeNFac.Text)+', '
      +           quotedstr(dblcdClieRuc.Text)+', '
      +           quotedstr(Trim(edtDireccion.Text))+', '
      +           quotedstr(dbeGarantia.Text)+', '
      +           quotedstr(dbePorcentaje.Text) + ','
      +           quotedstr(dblcFPago.Text) + ','
      +           quotedstr(dblcOfide.Text) + ','
      +           quotedstr(dblcLentrega.Text) + ','
      +           quotedstr(dtpFVcmto.Text) + ','
      +           quotedstr(dblcVen.Text) + ','
      +           quotedstr(dblcLPrecio.Text) + ','
      +           quotedstr(dblcTMon.Text) + ','
      +           quotedstr(dbeTCambio.Text) + ','
      +           quotedstr(dbeCredito.Text) + ','
      +           quotedstr(dbmObs.Lines.Text) + ','
      +           floattostr(strtofloat(dbeMonto.Text)) + ','
      +           quotedstr(DMFAC.cdsFact2.FieldByName('NUMINI').AsString)+', '
      +           quotedstr(xClaux) + ', '
      +           quotedstr(xCliedes) + ', '
      +           quotedstr(DMFAC.wUsuario) + ', '
      +           quotedstr('N')+','
      +           quotedstr('N')+'); '
      +    'End;';
   DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   xSQL := 'Select FN_FAC_BUSCA_NROFAC('
      +            quotedstr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)+','
      +            quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)+','
      +            QuotedStr(dblcSerie.Text)+','
      +            QuotedStr(dbeNFac.Text)+') RESULTADO from DUAL';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.FieldByName('RESULTADO').AsString='NO TIENE' Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No se puede pasar al detalle porque no se ha podido grabar los datos de Cabecera');
      bbtnOk.SetFocus;
      Exit;
   End;

   xSQL := 'Select CIAID, LOCID, TINID, ALMID, CLIEID, FACSERIE, NFAC, CLAUXID, CLIERUC, VEID, GRARID, '
      + '          FAMID, SFAMID, TLISTAID, ARTID, UNMIDG, UNMABR, DFACCANTG, DFACPREUMO, DFACPREUMN, '
      + '          DFACPREUME, DFACDTOUMO, DFACDTOUMN, DFACDTOUME, DFACMTOMO, DFACMTOMN, DFACMTOME, '
      + '          DFACUSER, DFACFREG, DFACHREG, DFACANOMES, DFACAAAA, DFACMM, DFACDD, DFACTRI, DFACSEM, '
      + '          DFACSS, DFACAATRI, DFACAASEM, DFACAASS, DFACTCAM, TMONID, CLIECREMAX, DFACIGV, DFACISC, '
      + '          DFACDCTO, DFACESTADO, DFACCANTAT, DFACGARAN, FPAGOID, SERIE, NGUIA, UNMIDU, DFACFLAGRE, '
      + '          UNMIDO, DFACCOMLMO, DFACCOMLMN, DFACCOMLME, DFACFLAGV, DFACDCTO2, DFACDTOMO2, DFACDTOME2, '
      + '          DFACDTOMN2, DFACDCTO3, DFACDTOMO3, DFACDTOMN3, DFACDTOME3, CLIEDIRID, DFACDIRENT, DFACITEM, '
      + '          DOCID, DFACHOR, FACFECHA, DFACSALDO, DFACCONT, DFACPREVMO, DFACPREVMN, DFACPREVME, FACTIP, '
      + '          FACTCLI, TIPOADQ, DFACIMP1, DFACIMPMTO1, DFACIMP2, DFACIMPMTO2, ARTDES, DFACVTOTMO, DFACVTOTMN, '
      + '          DFACVTOTME, DFACIMPMTN1, DFACIMPMTE1, DFACIMPMTE2, DFACIMPMTN2, FACID, DFACTFLAG, FLAGVAR, CODCOM, '
      + '          DFACSERMO, DFACSERMN, DFACSERME, PORSER '
      + '     from DB2ADMIN.FAC306 '
      + '    where CIAID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
      + '      and DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + '      and FACSERIE =' + QuotedStr(dblcSerie.Text)
      + '      and NFAC =' + QuotedStr(dbeNFac.Text)
      + '    order by DFACITEM';
   DMFAC.cdsDetFact2.Close;
   DMFAC.cdsDetFact2.DataRequest(xSQL);
   DMFAC.cdsDetFact2.Open;

// Inicio FAC-201806
// 26/10/2018 cambia display de importes a 2 dígitos
{
   dbgDetFac.Selected.Clear;
   dbgDetFac.Selected.Add('DFACITEM'#9'03'#9'Item');
   dbgDetFac.Selected.Add('ARTID'#9'08'#9'Artículo');
   dbgDetFac.Selected.Add('ARTDES'#9'28'#9'Descripción');
   dbgDetFac.Selected.Add('UNMIDG'#9'03'#9'U/M');
   dbgDetFac.Selected.Add('DFACCANTAT'#9'04'#9'Cant.');
   dbgDetFac.Selected.Add('ALMID'#9'03'#9'Alm.');
   dbgDetFac.Selected.Add('DFACPREUMO'#9'10'#9'Precio');
   dbgDetFac.Selected.Add('DFACDTOMO2'#9'10'#9'Dctos.~2');
   dbgDetFac.Selected.Add('DFACMTOMO'#9'10'#9'Precio~Venta');
   dbgDetFac.Selected.Add('DFACIMPMTO1'#9'10'#9'Igv');
   dbgDetFac.Selected.Add('DFACSERMO'#9'10'#9'Servicio');
   dbgDetFac.Selected.Add('DFACVTOTMO'#9'10'#9'Precio~Total');
   dbgDetFac.ApplySelected;
   dbgDetFac.ColumnByName('ARTDES').FooterValue := 'Total:';
   dbgDetFac.RedrawGrid;
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACSERMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACSERMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).EditFormat := '########0.00';
}
// Fin FAC-201806

   If DMFAC.cdsDetFact2.RecordCount > 0 Then
   Begin
      xSQL := 'Begin DB2ADMIN.SP_FAC_ACT_TOT_FAC ('
         +           quotedstr(dblcCia.text)+', '
         +           quotedstr(dblcTdoc.Text)+', '
         +           quotedstr(dblcSerie.Text)+', '
         +           quotedstr(dbeNFac.Text)+'); '
         +    'End;';
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      CalculaFooter;
   End;

// Actualiza Totales de Factura en cds
   xSQL := 'Select FACMTOMO, FACDCTOMO, FACIGVMO, FACIGV2MO, FACISCMO, FACTOTMO, FACTOTMN, FACTOTME, '
      + '          FACIGVMN, FACIGVME, FACIGV2MN, FACIGV2ME, FACISCMN, FACISCME, FACMTOMN, FACMTOME, '
      + '          FACDCTOMN, FACDCTOME, FACEMBMO, FACEMBMN, FACEMBME, FACSERMO, FACSERMN, FACSERME, PORSER '
      + '     from DB2ADMIN.FAC305 '
      + '     where CIAID=' + Quotedstr(dblcCia.Text)
      + '       and DOCID=' + Quotedstr(dblcTdoc.Text)
      + '       and FACSERIE=' + Quotedstr(dblcSerie.Text)
      + '       and NFAC=' + Quotedstr(dbeNFac.Text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;

   DMFAC.cdsFact2.Edit;
   DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat  := DMFAC.cdsQry.FieldByName('FACMTOMO').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACDCTOMO').AsFloat := DMFAC.cdsQry.FieldByName('FACDCTOMO').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACIGVMO').AsFloat  := DMFAC.cdsQry.FieldByName('FACIGVMO').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACIGV2MO').AsFloat := DMFAC.cdsQry.FieldByName('FACIGV2MO').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACISCMO').AsFloat  := DMFAC.cdsQry.FieldByName('FACISCMO').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat  := DMFAC.cdsQry.FieldByName('FACTOTMO').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACTOTMN').AsFloat  := DMFAC.cdsQry.FieldByName('FACTOTMN').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACTOTME').AsFloat  := DMFAC.cdsQry.FieldByName('FACTOTME').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACIGVMN').AsFloat  := DMFAC.cdsQry.FieldByName('FACIGVMN').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACIGVME').AsFloat  := DMFAC.cdsQry.FieldByName('FACIGVME').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACIGV2MN').AsFloat := DMFAC.cdsQry.FieldByName('FACIGV2MN').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACIGV2ME').AsFloat := DMFAC.cdsQry.FieldByName('FACIGV2ME').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACISCMN').AsFloat  := DMFAC.cdsQry.FieldByName('FACISCMN').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACISCME').AsFloat  := DMFAC.cdsQry.FieldByName('FACISCME').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACMTOMN').AsFloat  := DMFAC.cdsQry.FieldByName('FACMTOMN').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACMTOME').AsFloat  := DMFAC.cdsQry.FieldByName('FACMTOME').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACDCTOMN').AsFloat := DMFAC.cdsQry.FieldByName('FACDCTOMN').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACDCTOME').AsFloat := DMFAC.cdsQry.FieldByName('FACDCTOME').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACEMBMO').AsFloat  := 0.00;
   DMFAC.cdsFact2.FieldByName('FACEMBMN').AsFloat  := 0.00;
   DMFAC.cdsFact2.FieldByName('FACEMBME').AsFloat  := 0.00;
   DMFAC.cdsFact2.FieldByName('FACSERMO').AsFloat  := DMFAC.cdsQry.FieldByName('FACSERMO').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACSERMN').AsFloat  := DMFAC.cdsQry.FieldByName('FACSERMN').AsFloat;
   DMFAC.cdsFact2.FieldByName('FACSERME').AsFloat  := DMFAC.cdsQry.FieldByName('FACSERME').AsFloat;
   DMFAC.cdsFact2.Post;
   EstadoDeForma(1, DMFAC.cdsFact2.FieldByName('FACESTADO').AsString);
   cCombo := '';

// Inicio FAC-201806
// 29/10/2018 re-apertura lista de precios si hay cambio de compañía o tipo de lista de precios
   If (DMFAC.cdsTLPrecio.FieldByName('CIAID').AsString<>dblcCia.Text) or
      (DMFAC.cdsTLPrecio.FieldByName('TINID').AsString<>dblcTInv.Text) or
      (DMFAC.cdsTLPrecio.FieldByName('TLISTAID').AsString<>dblcLPrecio.Text) Then
   Begin
      If sTipoRQS = 'C' Then
      Begin
         sAlmacen := ' and C.ALMID IN ('+quotedstr(dblcAlmacen.Text)+') ';
         If (dblcCia.Text = '04') And (dblcAlmacen.Text = '14') Then
         Begin
            sAlmacen := ' and C.ALMID IN (''' + dblcAlmacen.Text + ''', ''15'') ';
         End;
      End;

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
      DMFAC.cdsTLPrecio.Filtered := False;
      DMFAC.cdsTLPrecio.Filter := '';

      {
      TNumericField(DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO')).DisplayFormat := '########0.0000';
      TNumericField(DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO')).EditFormat := '########0.0000';
      TNumericField(DMFAC.cdsTLPrecio.FieldByName('PRECIO_PUB')).DisplayFormat := '########0.0000';
      TNumericField(DMFAC.cdsTLPrecio.FieldByName('PRECIO_PUB')).EditFormat := '########0.0000';
      }
      TNumericField(DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO')).DisplayFormat := '########0.00';
      TNumericField(DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO')).EditFormat := '########0.00';
      TNumericField(DMFAC.cdsTLPrecio.FieldByName('PRECIO_PUB')).DisplayFormat := '########0.00';
      TNumericField(DMFAC.cdsTLPrecio.FieldByName('PRECIO_PUB')).EditFormat := '########0.00';
   // Fin FAC-201806
   End;

   If dblcTInv.Text = '00' Then
   Begin
      xSQL := 'Select A.*, 0 TOTSERV,'
         + '          nvl((Select G.TASA '
         + '                 from TGE101 E, TGE205 F, TGE128 G '
         + '                where E.CIAID=A.CIAID AND E.FLGSERV=''S'' '
         + '                  and E.CIAID=F.CIAID AND F.ARTID=A.ARTID AND F.FLGSERV=''S'' '
         + '                  and G.TREGID=''07''),0) TASSERV '
         + '     from TGE205 A '
         + '    where CIAID=''' + dblcCia.Text + ''' and CONCESION=''S'' '
         + '    order by ARTID';
      DMFAC.cdsVende.Close;
      DMFAC.cdsVende.DataRequest(xSQL);
      DMFAC.cdsVende.Open;
      dblcdServicio.LookupTable := DMFAC.cdsVende;
   End;
// Fin FAC-201806
   Screen.Cursor := crDefault;
End;

Function TFFactSGuia.ValidaCabecera: Boolean;
Begin
   If wFil_Asoc <> 'S' Then
   Begin
      If length(dblcCia.Text) = 0 Then Raise exception.Create('Falta Código de Compañía');
      If length(edtCia.Text) = 0 Then Raise exception.Create('Código de Compañía Errado');

      If length(dblcLocal.Text) = 0 Then Raise exception.Create('Falta Código de Localidad');
      If length(edtLocal.Text) = 0 Then Raise exception.Create('Código de Localidad Errado');

      If length(dblcAlmacen.Text) = 0 Then Raise exception.Create('Falta Código de Almacen');
      If length(edtAlmAcen.Text) = 0 Then Raise exception.Create('Código de Almacen Errado');

      If length(dblcTdoc.Text) = 0 Then Raise exception.Create('Falta Registrar Tipo Documento');
      If length(edtTDoc.Text) = 0 Then Raise exception.Create('Documento Errado');

      If dtpFFac.Date = 0 Then Raise exception.Create('Falta Fecha de Emisión');

      If length(dblcSerie.Text) = 0 Then Raise exception.Create('Falta Registrar Serie');

      If length(dblcdAso.Text) = 0 Then Raise exception.Create('Falta Registrar Cliente');
      If length(edtClie.Text) = 0 Then Raise exception.Create('Cliente Errado');

      If length(dblcFPago.Text) = 0 Then Raise exception.Create('Falta Registrar Cond.Comercial');
      If length(edtFPago.Text) = 0 Then Raise exception.Create('Cond.Comercial Errado');

      If (dblcFPago.Text = '11') Or (dblcFPago.Text = '12') Then
      Begin
         If length(dblcOfide.Text) = 0 Then Raise exception.Create('Falta Registrar Ofides');
         If length(edtOfdes.Text) = 0 Then Raise exception.Create('Ofides Errada');
      End;

      If length(dblcLentrega.Text) = 0 Then Raise exception.Create('Falta Registrar Lugar Entrega');
      If length(edtLentrega.Text) = 0 Then Raise exception.Create('Lugar de Entrega Errado');

      If length(dblcLPrecio.Text) = 0 Then Raise exception.Create('Falta Registrar Lista de Precio');
      If length(edtLPrecio.Text) = 0 Then Raise exception.Create('Lista de Precio Errado');

      If length(dblcTMon.Text) = 0 Then Raise exception.Create('Falta Registrar Moneda');
      If length(edtTMon.Text) = 0 Then Raise exception.Create('Moneda Errada');

      If length(dblcVen.Text) = 0 Then Raise exception.Create('Falta Registrar Vendedor');
      If length(EdtVen.Text) = 0 Then Raise exception.Create('Vendedor Errado');

      If length(dbeTCambio.Text) = 0 Then Raise exception.Create('Falta Tipo Cambio');
      If strtofloat(dbeTCambio.Text) = 0 Then Raise exception.Create('Ingrese Tipo Cambio mayor a cero');

   End
   Else
      If wFil_Asoc = 'S' Then
      Begin
         If length(dblcCia.Text) = 0 Then Raise exception.Create('Falta Código de Compañía');
         If length(edtCia.Text) = 0 Then Raise exception.Create('Código de Compañía Errado');

         If length(dblcLocal.Text) = 0 Then Raise exception.Create('Falta Código de Localidad');
         If length(edtLocal.Text) = 0 Then Raise exception.Create('Código de Localidad Errado');

         If sTipoRQS = 'C' Then
         Begin
            If length(dblcTInv.Text) = 0 Then Raise exception.Create('Falta Código de Tipo de Inventario');
            If length(edtTinv.Text) = 0 Then Raise exception.Create('Código de Tipo de Inventario Errado');

            If length(dblcAlmacen.Text) = 0 Then Raise exception.Create('Falta Código de Almacen');
            If length(edtAlmAcen.Text) = 0 Then Raise exception.Create('Código de Almacen Errado');
         End;

         If length(dblcTdoc.Text) = 0 Then Raise exception.Create('Falta Registrar Tipo Documento');
         If length(edtTDoc.Text) = 0 Then Raise exception.Create('Documento Errado');

         If dtpFFac.Date = 0 Then Raise exception.Create('Falta Fecha de Emisión');

         If length(dblcSerie.Text) = 0 Then Raise exception.Create('Falta Registrar Serie');

         If length(dblcFPago.Text) = 0 Then Raise exception.Create('Falta Registrar Cond.Comercial');
         If length(edtFPago.Text) = 0 Then Raise exception.Create('Cond.Comercial Errado');

         If (dblcFPago.Text = '11') Or (dblcFPago.Text = '12') Then
         Begin
            If length(dblcOfide.Text) = 0 Then Raise exception.Create('Falta Registrar Ofides');
            If length(edtOfdes.Text) = 0 Then Raise exception.Create('Ofides Errada');
         End;

         If length(dblcLPrecio.Text) = 0 Then Raise exception.Create('Falta Registrar Lista de Precio');
         If length(edtLPrecio.Text) = 0 Then Raise exception.Create('Lista de Precio Errado');

         If length(dblcTMon.Text) = 0 Then Raise exception.Create('Falta Registrar Moneda');
         If length(edtTMon.Text) = 0 Then Raise exception.Create('Moneda Errada');

         If length(dblcVen.Text) = 0 Then Raise exception.Create('Falta Registrar Vendedor');
         If length(EdtVen.Text) = 0 Then Raise exception.Create('Vendedor Errado');

         If length(dbeTCambio.Text) = 0 Then Raise exception.Create('Falta Tipo Cambio');
         If strtofloat(dbeTCambio.Text) = 0 Then Raise exception.Create('Ingrese Tipo Cambio mayor a cero');

         If dtpFVcmto.Date = 0 Then Raise exception.Create('Falta Fecha de Vencimiento');
      End;
   Result := True;
End;

Procedure TFFactSGuia.dblcdProfExit(Sender: TObject);
Var
   wAno, wMes, wDia: word;
   xAnoMes, xSQL: String;
   xError: Boolean;
Begin
   If xCrea Then Exit;

   If DMFAC.wModo = 'M' Then
      Exit;

   If btnExec.Focused Then Exit;

   xNoPasa := 'S';
   If Length(Trim(dblcdProf.Text)) = 0 Then Exit;

   If DMFAC.cdsProforma.IndexFieldNames <> 'PROFID' Then
      DMFAC.cdsProforma.IndexFieldNames := 'PROFID';

   DMFAC.cdsProforma.Setkey;
   DMFAC.cdsProforma.FieldByName('PROFID').AsString := dblcdProf.Text;
   If DMFAC.cdsProforma.GotoKey Then
   Begin
   // Inicio FAC-201806
   // 29/10/2018 VAlida que no se inicialice el documento de venta con Proformas ya ACEPTADAS
      If DMFAC.cdsProforma.FieldByName('PROFSIT').AsString='ACEPTADO' Then
      Begin
         ShowMessage('La proforma ya está ACEPTADA, no se puede escoger');
         dblcdProf.SetFocus;
         Exit;
      End;
   // Fin FAC-201806
   
   // se tomará los datos desde la proforma
   // Compañía
      If (length(trim(dblcCia.Text)) = 0) Or (length(trim(edtCia.Text)) = 0) Then
      Begin
         DMFAC.cdsFact2.FieldByName('CIAID').AsString := DMFAC.cdsProforma.FieldByName('CIAID').AsString;
         dblcCia.OnExit(dblcCia);
      End;
   // Localidad
      If (length(trim(dblcLocal.Text)) = 0) Or (length(trim(edtLocal.Text)) = 0) Then
      Begin
         DMFAC.cdsFact2.FieldByName('LOCID').AsString := DMFAC.cdsProforma.FieldByName('LOCID').AsString;
         dblcLocal.OnExit(dblcLocal);
      End;
   // Tipo de Venta
      DMFAC.cdsFact2.FieldByName('TIPOADQ').AsString := DMFAC.cdsProforma.FieldByName('TIPOADQ').AsString;
      dblcTipoCompra.OnExit(dblcTipoCompra);
   // Tipo de Inventario
      If (length(trim(dblcTInv.Text)) = 0) Or (length(trim(edtTinv.Text)) = 0) Then
      Begin
         DMFAC.cdsFact2.FieldByName('TINID').AsString := DMFAC.cdsProforma.FieldByName('TINID').AsString;
         dblcTInv.OnExit(dblcTInv);
      End;
   // Almacén
      If (length(trim(dblcAlmacen.Text)) = 0) Or (length(trim(edtAlmacen.Text)) = 0) Then
      Begin
         DMFAC.cdsFact2.FieldByName('ALMID').AsString := DMFAC.cdsProforma.FieldByName('ALMID').AsString;
         dblcAlmacen.OnExit(dblcAlmacen);
      End;

      DMFAC.cdsFact2.FieldByName('FACTCLI').AsString := DMFAC.cdsProforma.FieldByName('PROFTCLI').AsString;
      dblcTClie.OnExit(dblcTClie);

      DMFAC.cdsFact2.FieldByName('CLIEID').AsString := DMFAC.cdsProforma.FieldByName('CLIEID').AsString;
      dblcdAso.OnExit(dblcdAso);

      If sTipoPago <> 'VC' Then
      Begin
         DMFAC.cdsFact2.FieldByName('FPAGOID').AsString := DMFAC.cdsProforma.FieldByName('FPAGOID').AsString;
         dblcFPago.OnExit(dblcFPago);
      End;

      DMFAC.cdsFact2.FieldByName('TMONID').AsString := DMFAC.cdsProforma.FieldByName('TMONID').AsString;
      dblcTMon.OnExit(dblcTMon);
      DMFAC.cdsFact2.FieldByName('TLISTAID').AsString := DMFAC.cdsProforma.FieldByName('TLISTAID').AsString;
      dblcLPrecio.OnExit(dblcLPrecio);
      DMFAC.cdsFact2.FieldByName('VEID').AsString := DMFAC.cdsProforma.FieldByName('VEID').AsString;
      dblcVen.OnExit(dblcVen);
      If Length(dblcdProf.Text) > 0 Then
         DMFAC.cdsFact2.FieldByName('CLIEDIRID').AsString := DMFAC.cdsProforma.FieldByName('CLIEDIRID').AsString;
      dblcLentrega.OnExit(dblcLentrega);

      If DMFAC.cdsFact2.FieldByName('CLIERUC').AsString = '' Then
         DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsProforma.FieldByName('CLIERUC').AsString;

      dblcdClieRuc.Text := DMFAC.cdsProforma.FieldByName('CLIERUC').AsString;

      DMFAC.cdsFact2.FieldByName('TMONID').AsString := DMFAC.cdsProforma.FieldByName('TMONID').AsString;
      dblcTMon.Text := DMFAC.cdsProforma.FieldByName('TMONID').AsString;
      dblcTMon.OnExit(dblcTMon);

      DMFAC.cdsFact2.FieldByName('FACGARAN').AsString := DMFAC.cdsProforma.FieldByName('PROFGARAN').AsString;

   // Observaciones Proforma
   // Inicio FAC-201806
   // 26/10/2018 retira posibles espacios de las observaciones
      dbmObs.text := trim(COPY(trim(DMFAC.cdsProforma.FieldByName('FACOBS').AsString), 1, 80));
   //   dbmObs.text := dbmObs.text + '|';
   // Fin FAC-201806

      xNoPasa := 'S';
      If dblcTipoCompra.Text = 'C' Then
      Begin
         DecodeDate(DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime, wAno, wMes, wDia);

         If wMes < 10 Then
            xAnoMes := IntToStr(wAno) + '0' + inttostr(wMes)
         Else
            xAnoMes := IntToStr(wAno) + inttostr(wMes);

         xSQL := 'SELECT ARTID, DPROFCANTP, ALMID '
            + '     FROM FAC312 '
            + '    WHERE CIAID=' + Quotedstr(dblcCia.Text);

         If length(trim(dblcdAso.Text)) > 0 Then
            xSQL := xSQL + ' and CLIEID=' + Quotedstr(dblcdAso.Text);

         xSQL := xSQL + ' and PROFID=' + Quotedstr(dblcdProf.Text);
         DMFAC.cdsReporte.Close;
         DMFAC.cdsReporte.DataRequest(xSQL);
         DMFAC.cdsReporte.Open;

         xError := False;
         DMFAC.cdsReporte.First;
         While Not DMFAC.cdsReporte.Eof Do
         Begin
            xxArticulo := DMFAC.cdsReporte.FieldByName('ARTID').AsString;
            xFiltro := 'Select STKFIN STKSACTG '
               + '        from LOG319 '
               + '       where CIAID =' + QuotedStr(dblcCia.Text)
               + '         and ALMID =' + QuotedStr(DMFAC.cdsReporte.FieldByName('ALMID').AsString)
               + '         and LOGANOMM = ' + Quotedstr(xAnoMes)
               + '         and ARTID = ' + Quotedstr(xxArticulo);
            DMFAC.cdsQry4.Close;
            DMFAC.cdsQry4.DataRequest(xFiltro);
            DMFAC.cdsQry4.Open;
            If DMFAC.cdsQry4.RecordCount = 0 Then
            Begin
               ShowMessage('No se ha encontrado al Artículo ' + xxArticulo + ' en la Tabla de Stocks');
               xError := True;
            End
            Else
            Begin
               If DMFAC.cdsQry4.FieldByName('STKSACTG').AsFloat < 0 Then
               Begin
                  ShowMessage('El Stock del Artículo ' + xxArticulo + ' está en Negativo');
                  xError := True;
               End
               Else
               Begin
                  If (DMFAC.cdsQry4.FieldByName('STKSACTG').AsFloat < DMFAC.cdsReporte.FieldByName('DPROFCANTP').AsFloat) Then
                  Begin
                     ShowMessage('No hay suficiente Stock del artículo ' + xxArticulo + ' para atender el documento de Venta');
                     xError := True;
                  End;
               End;
            End;
            DMFAC.cdsReporte.Next;
         End;

         If xError Then
         Begin
            dblcdProf.SetFocus;
            exit;
         End;
      End;

      If length(edtTDoc.Text) = 0 Then
         dblcTdoc.SetFocus
      Else
         dblcSerie.SetFocus;

   End;
End;

Procedure TFFactSGuia.FormClose(Sender: TObject; Var Action: TCloseAction);
Var
   xSQL: String;
Begin
   If pnlRegistro.Visible = True Then
   Begin
      ShowMessage('Cierre el Panel de Detalle !!!');
      Abort;
   End;

   If pnlDetalleA.Visible = True Then
   Begin
      ShowMessage('Cierre el Panel de Detalle !!!');
      Abort;
   End;

   DMFAC.cdsTLista.Filtered := False;
   DMFAC.cdsTLista.Filter := '';
   DMFAC.cdsTLista.Filtered := True;

   xRegresa := False;

   If (DMFAC.wModo = 'A') And SiExisteDetalle Then
   Begin
      Begin
         xSQL := 'delete from FAC305 '
            + '    where CIAID=' + quotedstr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
            + '      and FACSERIE=' + quotedstr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
            + '      and NFAC=' + quotedstr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
         End;
      End;
   End
   Else
   Begin
   //
   End;

   FVariables.w_VE_Registro := False;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;

   DMFAC.cdsQry4.Close;
   Action := CAFree;
End;

Procedure TFFactSGuia.LimpiarCampos;
Begin
   edtCia.Text := '';
   edtLocal.Text := '';
   EdtTClie.Text := '';
   edtAlmacen.Text := '';
   edtTDoc.Text := '';
   edtClie.Text := '';
   edtFPago.Text := '';
   edtLPrecio.Text := '';
   edtTMon.Text := '';
   EdtVen.Text := '';
   edtLentrega.Text := '';
   dblcdClieRuc.Text := '';

End;

Procedure TFFactSGuia.dblcLentregaExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If btnExec.Focused Then Exit;

   If Not (bbtnBorra.Focused) Then
   Begin
      DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEFLAG', 'TCLIEID=' + '''' + dblcTClie.Text + '''', 'TCLIEFLAG');
      DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;
      If DMFAC.xTipCli = 'S' Then
      Begin
         Screen.Cursor := crHourGlass;
         If DMFAC.cdsDireccion.Active = False Then
         Begin
            xWhere := 'CIAID='+quotedstr(dblcCia.Text) +' and CLIEID=' + QuotedStr(dblcdAso.Text);
            Filtracds(DMFAC.cdsDireccion, 'SELECT * FROM FAC110 WHERE ' + xWhere + ' ORDER BY CLIEDIRID'); //Lugar de entrega
            DMFAC.cdsDireccion.IndexFieldNames := 'CIAID;CLIEID;CLIEDIRID';
         End;
         If DMFAC.cdsDireccion.IndexFieldNames = '' Then
            DMFAC.cdsDireccion.IndexFieldNames := 'CIAID;CLIEID;CLIEDIRID';

         DMFAC.cdsDireccion.Setkey;
         DMFAC.cdsDireccion.FieldByName('CIAID').AsString := dblcCia.Text;

         DMFAC.cdsDireccion.FieldByName('CLIEID').AsString := dblcdAso.Text;

         DMFAC.cdsDireccion.FieldByName('CLIEDIRID').AsString := dblcLentrega.Text;
         If DMFAC.cdsDireccion.GotoKey Then
         Begin
            edtLentrega.Text := DMFAC.cdsDireccion.FieldByName('CLIEDIRENT').AsString;
            If DMFAC.cdsProforma.State = dsBrowse Then
               DMFAC.cdsFact2.Edit;
            DMFAC.cdsFact2.FieldByName('ZONVTAID').AsString := DMFAC.cdsDireccion.FieldByName('ZVTAID').AsString;
            DMFAC.cdsFact2.FieldByName('ZIPID').AsString := DMFAC.cdsDireccion.FieldByName('ZIPID').AsString;
         End;
         Screen.Cursor := crDefault
      End
      Else
         If DMFAC.xTipCli <> 'S' Then
         Begin
            edtLentrega.Text := DMFAC.DisplayDescrip('FAC110', 'CLIEDIRENT', 'CIAID', dblcCia.Text);
         End;
   End;
End;

Procedure TFFactSGuia.btnActRegClick(Sender: TObject);
Var
   xFlagTLista, sMax: String;
   xSQL, xWhere: String;
Begin
   If length(dblcdProf.Text) > 0 Then
   Begin
      ShowMessage('No se puede Agregar un artículo cuando el Documento' + chr(13)
         + 'se ha generado desde una proforma');
      exit;
   End;

// Si boleta fue Generada desde un Pago
   If DMFAC.cdsFact2.FieldByName('NUMDOCPAG').AsString <> '' Then
   Begin
      ShowMessage('No se puede Agregar un artículo cuando el Documento' + chr(13)
         + 'se ha generado Automaticamente desde un Pago');
      exit;
   End;

   cCombo := '';

   If (sTipoRQS = 'C') Then
   Begin
      lblObsequio.Visible := False;
      pnlDetalle.Enabled := True;
      dbgDetFac.Enabled := True;
      pnlPie.Enabled := False;
      pnlRegistro.Width := 382;
      pnlRegistro.Left := 87;
      pnlRegistro.Top := 274;
      wInserta := True;
      pnlRegistro.Visible := True;

      xSQL := 'CIAID =' + QuotedStr(dblcCia.Text) + ' AND TINID =' + QuotedStr(dblcTInv.Text) + ' AND ARTID =' + QuotedStr(dblcdArticulo.Text);
      bbtnKDXSerie.Visible := ((wFSerie = 'S') And (DMFAC.BuscaQry('dspUltTGE', 'TGE205', 'FNSERIE', xSQL, 'FNSERIE') = 'S'));
      pnlRegistro.Enabled := True;
      pnlRegistro.SetFocus;
      xxReservaAnt := 0;
      InicializaCamposDetalle;

      If dblcLPrecio.Text <> '' Then //Seleccion
      Begin
         xWhere := 'TLISTAID = ' + QuotedStr(dblcLPrecio.Text);
         xFlagTLista := DMFAC.BuscaQry('dspUltTGE', 'FAC101', 'TLISTAFLAG', xWhere, 'TLISTAFLAG');
         If xFlagTLista = 'E' Then //Si es lista especial
            dbePrecioG.enabled := False
         Else
         Begin
         End;
         dblcdArticulo.LookupTable := DMFAC.cdsTLPrecio;
         dblcdArticulo.LookupField := 'ARTID';
         xLPrecio := True;
         dblcdArticulo.Selected.Clear;
         dblcdArticulo.Selected.Add('ARTID'#9'9'#9'Código');
         dblcdArticulo.Selected.Add('ARTDES'#9'30'#9'Artículo');
         dblcdArticulo.Selected.Add('UNMIDG'#9'5'#9'U.M');
         dblcdArticulo.Selected.Add('LPRETMONID'#9'3'#9'T.M.');
         dblcdArticulo.Selected.Add('LPREPREGMO'#9'9'#9'Precio S/IGV');
         dblcdArticulo.Selected.Add('TOTIGV'#9'9'#9'Igv');
         dblcdArticulo.Selected.Add('TOTSERV'#9'9'#9'Servicio');
         dblcdArticulo.Selected.Add('PRECIO_PUB'#9'9'#9'Precio Publico');
         dblcdArticulo.Selected.Add('ALMID'#9'5'#9'Almacen');
         dblcdArticulo.Selected.Add('STKSACTG'#9'6'#9'Stock');
      End;
      bbtnBuscaArt.Enabled := True;
      dblcdArticulo.Enabled := True;
      dblcdArticulo.Text := xxArticulo;
      dbeArticulo.Text := xxArtDes;
      dblcdArticulo.SetFocus;
      dbeDGarantia.Text := dbeGarantia.Text;
      edtDsto1.text := dbePorcentaje.text;
   End
   Else
      If (sTipoRQS = 'S') Then
      Begin
         pnlDetalleA.Height := 238;
         pnlDetalleA.Left := 50;
         pnlDetalleA.Top := 288;
         pnlDetalleA.Width := 436;
         sMax := DMFAC.StrZero(DMFAC.MaxValue('DFACITEM', DMFAC.cdsDetFact2), 3);
         xFlagInsert := True;
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
         edtUMed.Text := DMFAC.cdsQry.FieldByName('UNMDES').AsString;

         If dblcdServicio.Enabled Then
            dblcdServicio.SetFocus
         Else
            memDetalle.SetFocus;
      End;
   bbtnKDXSerie.visible := False;

   If ((dblcCia.Text = '15') And (dblcTdoc.Text = '25')) Then
   Begin
      dbePrecioG.Enabled := False;
      dbePrecioG.Color := clBtnFace;
      dbePrecioG.TabOrder := 0;
      dbeImporteIGV.Text := '0';
      dbeImporteIGV.Enabled := true;
      dbeImporteIGV.Color := clWindow;
      edtDsto2.Enabled := False;
      dbeMontoDCTO2.Enabled := False;
   End
End;

Procedure TFFactSGuia.dblcTMonExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If btnExec.Focused Then Exit;

   If Not bbtnBorra.Focused Then
   Begin
      xWhere := 'TMONID=' + Quotedstr(dblcTMon.Text)
         + ' and (TMON_LOC=' + Quotedstr('L') + ' or TMON_LOC=' + Quotedstr('E') + ')';
      edtTMon.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
   End;
End;

Procedure TFFactSGuia.dblcdArticuloDropDown(Sender: TObject);
Begin
   DMFAC.cdsTLPrecio.IndexFieldNames := 'ARTID';
End;

Procedure TFFactSGuia.dblcdArticuloExit(Sender: TObject);
Var
   xFlagTLista: String;
   xSQL, xWhere: String;
Begin
   xAdicArt := 'N';
   cbTipoUm.ItemIndex := 0;
   dbePrecioG.Enabled := False;

   If bbtnBuscaArt.Focused Then Exit;

   If bbtnRegCanc.Focused Then Exit;

   If DMFAC.wAnchoArt > 0 Then
   Begin
      If Length(dblcdArticulo.Text) < DMFAC.wAnchoArt Then
      Begin
         dblcdArticulo.Text := DMFAC.StrZero(dblcdArticulo.Text, DMFAC.wAnchoArt);
      End;
   End;

   If ExisteArticuloDuplicado(dblcdArticulo.Text) Then
   Begin
      ShowMessage('El Artículo Seleccionado Esta Duplicado');
      DMFAC.cdsDetfac.EnableControls;
      InicializaCamposDetalle;
      dblcdArticulo.setfocus;
      Exit;
   End
   Else
      xFlagInsert := True;

   dbePrecioG.Enabled := False;
   If DMFAC.cdsTLPrecio.FieldByName('EDITA_PRECIO').AsString = 'E' Then
   Begin
      dbePrecioG.Enabled := True;
   End;

   dbeArticulo.Text := DMFAC.cdsTLPrecio.FieldByName('ARTDES').AsString;

   cObsequio := DMFAC.cdsTLPrecio.FieldByName('OBSEQUIO').AsString;

   sAlmacen := DMFAC.cdsTLPrecio.FieldByName('ALMID').AsString;

   lblObsequio.Visible := False;
   If cObsequio = 'S' Then
      lblObsequio.Visible := True;

   lblConsignacion.Visible := False;
   If (dblcCia.Text = '04') And (DMFAC.cdsTLPrecio.FieldByName('CONSIGNACION').AsString = 'S') Then
      lblConsignacion.Visible := True;

   xxxUMU := DMFAC.cdsTLPrecio.FieldByName('UNMIDU').AsString;
   xxxUMG := DMFAC.cdsTLPrecio.FieldByName('UNMIDG').AsString;
   If DMFAC.cdsTLPrecio.FieldByName('LPRETMONID').asString = dblcTMon.Text Then
   Begin
      xxxPVG := DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO').AsFloat;
      xxxPVU := DMFAC.cdsTLPrecio.FieldByName('LPREPREUMO').AsFloat;
   End
   Else
      If DMFAC.cdsTLPrecio.FieldByName('LPRETMONID').asString = DMFAC.wTMonLoc Then
      Begin
         xxxPVG := FRound(DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO').AsFloat / StrToFloat(dbeTCambio.Text), 15, 4);
         xxxPVU := FRound(DMFAC.cdsTLPrecio.FieldByName('LPREPREUMO').AsFloat / StrToFloat(dbeTCambio.Text), 15, 4);
      End
      Else
      Begin
         xxxPVG := FRound(DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO').AsFloat * StrToFloat(dbeTCambio.Text), 15, 4);
         xxxPVU := FRound(DMFAC.cdsTLPrecio.FieldByName('LPREPREUMO').AsFloat * StrToFloat(dbeTCambio.Text), 15, 4);
      End;
   wContenido := (DMFAC.cdsTLPrecio.FieldByName('ARTCONT').AsInteger > 1);
   cbTipoUm.Enabled := wContenido;
   lblUMAG.Caption := xxxUMG;
   dbeUmG.Text := xxxUMG;

   dbePrecioG.Text := floattostr(xxxPVG);
   AperturaConsultaSaldos('N'); //Flag para mostrar consulta del stock segun la unidad sin escoger en el combo

   pnlRegistro.Width := 640;

   memDetArt.Visible := False;
   If (dblcCia.Text = '06') Or (dblcCia.Text = '15') Then
   Begin
      dbgStock.Top := 108;
      memDetArt.Text := dbeArticulo.Text;
      memDetArt.Visible := True;
      memDetArt.ReadOnly := False;
   End
   Else
   Begin
      If (dblcCia.Text = '04') And (DMFAC.cdsTLPrecio.FieldByName('CONSIGNACION').AsString = 'S') Then
      Begin
         dbgStock.Top := 108;
         memDetArt.Text := dbeArticulo.Text;
         memDetArt.Visible := True;
         memDetArt.ReadOnly := False;
      End
      Else
         dbgStock.Top := 26;
         If (dblcCia.Text = '04') And ((dblcAlmacen.Text = '14') or (dblcAlmacen.Text='15')) Then
            dbgStock.Enabled := True
         Else
            dbgStock.Enabled := False;
   End;

   xWhere := 'TLISTAID = ' + QuotedStr(dblcLPrecio.Text);
   xFlagTLista := DMFAC.BuscaQry('dspUltTGE', 'FAC101', 'TLISTAFLAG', xWhere, 'TLISTAFLAG');
   If xFlagTLista = 'E' Then //Si es lista especial
      dbePrecioG.Enabled := True;

   xCIgv := 'S';
   xcIsc := 'N';
   If DMFAC.cdsTLPrecio.FieldByName('LPREPDCTOG').AsFloat = 0 Then
      edtDsto2.Text := '0'
   Else
      edtDsto2.Text := floattostr(DMFAC.cdsTLPrecio.FieldByName('LPREPDCTOG').AsFloat);

   xSQL := ' ARTID = ' + QuotedStr(dblcdArticulo.Text);
   xSQL := xSQL + ' AND DPROFFREG=(SELECT MAX(DPROFFREG) FROM LOG313 WHERE ARTID=' + '''' + dblcdArticulo.Text + '''' + ')';
   Filtracds(DMFAC.cdsDRcomp, 'SELECT DPROFPROV FROM LOG313 WHERE ' + xSQL);

   If dbgStock.Enabled Then
      dbgStock.SetFocus
   Else
      dbeCantGA.SetFocus;

   cbTipoum.OnExit(cbTipoum);

   xSQL := 'CIAID =' + QuotedStr(dblcCia.Text) + ' AND TINID =' + QuotedStr(dblcTInv.Text) + ' AND ARTID =' + QuotedStr(dblcdArticulo.Text);
   bbtnKDXSerie.Visible := ((wFSerie = 'S') And (DMFAC.BuscaQry('dspUltTGE', 'TGE205', 'FNSERIE', xSQL, 'FNSERIE') = 'S'));

// Asignamos el la tasa de IGV en función a la dinámica contable
   If sTipoPago <> 'VC' Then
   Begin
      xImpTasa := floatToStr(GetTasaIgv(dblcCia.Text, dblcTdoc.Text, dblcTMon.Text, dblcFPago.Text, dblcdArticulo.Text));
   End;

// para habilitar el precio final
   If (dblcCia.Text = '15') And (dblcTdoc.Text = '25') Then
   Begin
      dbeImporteIGV.Enabled := TRUE;
      edtDsto2.Enabled := False;
      dbeMontoDCTO2.Enabled := False;
      dbePrecioG.Enabled := False;
      dbeImporteIGV.TabOrder := 3;
   End
End;

Procedure TFFactSGuia.dbeCantGAExit(Sender: TObject);
Var
   xValor: double;
Begin
   If bbtnRegCanc.Focused Then Exit;

   If length(Trim(dbeCantGA.Text)) = 0 Then
   Begin
      ShowMessage('Ingrese Cantidad');
      dbeCantGA.Text := '0';
      dbeCantGA.SetFocus;
      Exit;
   End;

   If ((strtofloat(dbeCantGA.Text) <= 0) And (dbeCantUA.Enabled = False)) Then
   Begin
      ShowMessage('Ingrese una Cantidad mayor a cero');
      dbeCantGA.SetFocus;
      Exit;
   End;

   If StrToInt(DMFAC.cdsQry4.FieldByName('ARTCONT').AsString) = 1 Then //Si el Contenido es Igual a 1
   Begin
      If StrToFloat(dbeCantGA.Text) - Int(StrToFloat(dbeCantGA.Text)) > 0 Then //Si la Cantidad es Fraccionaria
      Begin
         Beep;
         MessageDlg('No se puede Aceptar Cantidades Fraccionarias', mtInformation, [mbOk], 0);
         dbeCantGA.Clear;
         dbeCantGA.SetFocus;
         Exit;
      End;
   End
   Else //Si el Contenido es Mayor que 1
   Begin
   End;

   DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(lblUMAG.caption), 'EUNMEQ');
   If length(DMFAC.cdsQry.FieldByName('EUNMEQ').AsString) = 0 Then
      Raise exception.Create('Esta unidad no tiene Equivalencia!!!')
   Else
      xValor := strtofloat(DMFAC.cdsQry.FieldByName('EUNMEQ').AsString);

   dbeCantUA.Enabled := (xValor > 1);

   xAdicArt := '';

   wStockG := DMFAC.cdsQry4.FieldByName('STKSACTG').AsFloat;
   If (dbeCantUA.Enabled = False) Then
   Begin
      If (wStockG = 0) And (dblcdProf.text = '') Then
      Begin
         xAdicArt := 'S';
         //Raise exception.Create('No Existe Stock para el Artículo');
         ShowMessage('No Existe Stock para el Artículo');
         dbeCantGA.SetFocus;
         Exit;
      End;
      If (wStockG < strtofloat(dbeCantGA.Text)) And (dblcdProf.text = '') Then
      Begin
         xAdicArt := 'S';
         //Raise exception.Create('No Existe Stock para cubrir la Cantidad!!!')
         ShowMessage('No Existe Stock para cubrir la Cantidad');
         dbeCantGA.SetFocus;
         Exit;
      End;
   End;

   If dbePrecioG.Enabled = True Then
   Begin
      dbePrecioG.SetFocus;
   End
   Else
      If edtDsto2.Enabled = true Then
         edtDsto2.SetFocus;

   dbeMontoDCTO1.text := FloatToStr(FRound((StrToFloat(dbeCantGA.text) * StrToFloat(dbePrecioG.text) * StrToFloat(edtDsto1.text) / 100), 15, 4));
   If (dblcCia.Text = '15') And (dblcTdoc.Text = '25') Then
      dbeImporteIGV.SetFocus;
End;

Procedure TFFactSGuia.dbeCantUAExit(Sender: TObject);
Var
   xCont: double;
   xCtAceptada, xvalor: double;
Begin
   xCtAceptada := 0;

   If Not bbtnRegCanc.Focused Then
   Begin
      xCont := strtofloat(DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmg.Text), 'EUNMEQ'));
      If length(dbeCantUA.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Cantidad Fraccionaria' + #13 + ' mayor igual a cero');
         dbeCantUA.Text := '0';
         dbeCantUA.SetFocus;
         Exit;
      End;

      If strtofloat(dbeCantUA.Text) < 0 Then
      Begin
         showmessage('Ingrese Cantidad Fraccionaria mayor igual a cero');
         dbeCantUA.Text := '0';
         dbeCantUA.SetFocus;
         Exit;
      End
      Else
      Begin
         If strtofloat(dbeCantUA.Text) >= xCont Then
         Begin
            showmessage('Ingrese una Cantidad Fraccionaria menor');
            dbeCantUA.Text := '';
            dbeCantUA.SetFocus;
            Exit;
         End;
      End;

      If length(dbeCantUA.Text) > 0 Then
      Begin //Cantidad Aceptada
         xCtAceptada := strtofloat(dbeCantGA.Text);
         xValor := strtofloat(DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmg.Text), 'EUNMEQ'));
         xCtAceptada := xCtAceptada + FRound(strtofloat(dbeCantUA.Text) / xValor, 15, 2);
      End;

      If wStockG = 0 Then
         Raise exception.Create('No existe Stock para el Artículo');
      If (wStockG < xCtAceptada) Then
         Raise exception.Create('No existe Stock para cubrir la Cantidad!!!');

      edtDsto2.SetFocus;
   End;
End;

Procedure TFFactSGuia.dbePrecioGExit(Sender: TObject);
Begin
   If bbtnRegCanc.Focused Then Exit;

   If length(dbePrecioG.Text) = 0 Then
   Begin
      ShowMessage('Ingrese Precio');
      dbePrecioG.SetFocus;
      Exit;
   End;
   If strtofloat(dbePrecioG.Text) <= 0 Then
   Begin
      Showmessage('Ingrese un Precio mayor a cero');
      dbePrecioG.Text := '';
      dbePrecioG.setfocus;
   End;
End;

Procedure TFFactSGuia.edtDsto2Exit(Sender: TObject);
Var
   xValor, xDscto1, xDscto2, xImporte1, xSubTot1, xTot, xTotD1, xTotD2, xFrac: double;
   xIGVSN: String;
   xWhere: String;
Begin
   If bbtnRegCanc.Focused Then Exit;

   If (strtofloat(dbePrecioG.Text) <= 0) And (strtofloat(edtDsto2.Text) > 0) Then
   Begin
      Showmessage('No se puede Hacer Descuento porque Precio es Cero');
   // Inicio FAC-201806
   // 26/10/2018 cambia display de importes a 2 dígitos
      {
      edtDsto2.Text := '0.0000';
      dbeMontoDCTO2.Text := '0.0000';
      }
      edtDsto2.Text := '0.00';
      dbeMontoDCTO2.Text := '0.00';
   // Fin FAC-201806
      Exit;
   End;

   If dbePorcentaje.Text = '' Then
      xDscto1 := 0
   Else
      xDscto1 := FRound(strtofloat(dbePorcentaje.Text), 15, 2);

   If edtDsto2.Text = '' Then
      xDscto2 := 0
   Else
   Begin
      If strtofloat(edtDsto2.Text) < 0 Then
      Begin
         Showmessage('Ingrese un Descuento mayor/igual a cero');
         edtDsto2.Text := '';
         edtDsto2.setfocus;
         Exit;
      End
      Else
      Begin
         If ((strtofloat(edtDsto2.Text) > DMFAC.cdsTLPrecio.FieldByName('LPREPDCTOG').AsFloat) And
            (DMFAC.cdsTLPrecio.FieldByName('LPREFLAGD').AsString = 'S')) Then
         Begin
            Showmessage('El Descuento no puede ser mayor al de la Lista de Precios');
            edtDsto2.Text := floattostr(DMFAC.cdsTLPrecio.FieldByName('LPREPDCTOG').AsFloat);
            edtDsto2.setfocus;
            Exit;
         End;
      End;
      xDscto2 := FRound(strtofloat(edtDsto2.Text), 15, 4);
   End;

   If length(Trim(dbeCantGA.Text)) = 0 Then
   Begin
      ShowMessage('Ingrese Cantidad');
      dbeCantGA.Text := '0';
      dbeCantGA.SetFocus;
      Exit;
   End;
      
   If length(dbeCantUA.Text) > 0 Then
   Begin
      xWhere := 'EUNMID1=' + QuotedStr(dbeUmg.Text);
      DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmG.Text), 'EUNMEQ');
      If length(DMFAC.cdsQry.FieldByName('EUNMEQ').AsString) = 0 Then
         Raise exception.Create('Esta Unidad No Tiene Equivalencia!!!')
      Else
         xValor := strtofloat(DMFAC.cdsQry.FieldByName('EUNMEQ').AsString);

      xFrac := strtofloat(dbeCantUA.Text) / xValor;

      xImporte1 := FRound(strtofloat(dbePrecioG.Text) * (strtofloat(dbeCantGA.Text) + xFrac), 15, 4);
   End
   Else
      xImporte1 := FRound(strtofloat(dbePrecioG.Text) * strtofloat(dbeCantGA.Text), 15, 4);

   xTotD1 := xImporte1 * (xDscto1 / 100);

   xSubtot1 := FRound(xImporte1 - xTotD1, 15, 4);
   xTotD2 := xSubtot1 * (xDscto2 / 100);
   xTot := FRound(xSubtot1 - xTotD2, 15, 4);

   xIGVSN := ConIGV();

   dbeMontoDCTO2.text := FloatToStr(FRound(xTotD2, 15, 4));
   dbeImporte.text := floattostrf(xTot, ffnumber, 15, 4);

   //si tiene Servicio lo calculo
   If DMFAC.cdsTLPrecio.FieldByname('TASSERV').Ascurrency > 0 Then
      dbeServicio.text := FloatToStr(FRound(xTot * (DMFAC.cdsTLPrecio.FieldByname('TASSERV').Ascurrency / 100), 15, 4))
   Else
      dbeServicio.text := '0';

   If xIGVSN = 'N' Then
   Begin
      dbeImporteIGV.text := FloatToStr(FRound(xTot, 15, 4));
      dbeIgv.text := '0';
   End
   Else
   Begin
      If dtpFFac.date <= strtodate('28/02/2011') Then
      Begin
         dbeIgv.text := FloatToStr(FRound(xTot * (StrToFloat(xImpTasa19) / 100), 15, 4));
         dbeImporteIGV.text := FloatToStr(FRound(xTot * (1 + StrToFloat(xImpTasa19) / 100), 15, 4));

      End
      Else
      Begin
         dbeIgv.text := FloatToStr(FRound(xTot * (StrToFloat(xImpTasa) / 100), 15, 4));
         dbeImporteIGV.text := FloatToStr(FRound(xTot * (1 + StrToFloat(xImpTasa) / 100), 15, 4) + StrToFloat(dbeServicio.text));
      End;
   End;

   dbeRed.Text := dbeImporteIGV.Text;

   If length(dbeGarantia.Text) > 0 Then
      dbeDGarantia.Text := dbeGarantia.Text
   Else
      bbtnRegOk.SetFocus;
End;

Procedure TFFactSGuia.bbtnRegCancClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;

   CalculaFooter;

   If sTipoRQS = 'C' Then
   Begin
      pnlRegistro.Width := 382;
      pnlRegistro.Visible := False;
      memDetArt.Visible := False;
   End
   Else
      If sTipoRQS = 'S' Then
      Begin
         pnlDetalleA.Visible := False;
      End;

   pnlDetalle.Enabled := True;
   pnlPie.Enabled := True;

   Screen.Cursor := crDefault;
End;

Procedure TFFactSGuia.bbtnRegOkClick(Sender: TObject);
// Inicio FAC-201806
// 30/10/2018 Define variable para enviar script
Var
   xSQL: String;
// Fin FAC-201806
Begin
// Inicio FAC-201806
// 30/10/2018 Actualiza Detalle por Procedimiento Almacenado
   {
   ActualizacionDetalle;
   }
// Graba Detalle
   If sTipoRQS = 'C' Then
   Begin
      xSQL := 'Begin '
         +      ' SP_FAC_GRABA_DET_FAC_COMM('
         +         quotedstr(dblcCia.Text)+','  // wCIAID
         +         quotedStr(dblcLocal.Text)+', ' // wLOCID
         +         quotedstr(dblcAlmacen.Text)+', ' // wALMID
         +         quotedstr(xClaux) + ', ' // wCLAUXID
         +         quotedstr(dblcdAso.Text)+', ' // wCLIEID
         +         quotedstr(dblcTdoc.Text)+', ' // wTDocId
         +         quotedstr(dblcSerie.Text)+', ' // wFACSERIE
         +         quotedstr(dbeNFac.Text)+', ' // wNroFac
         +         quotedstr(dblcLPrecio.Text) + ',' // wTLISTAID
         +         quotedstr(dblcdArticulo.Text)+', ' // wARTID
         +         dbeCantGA.Text+',' // wDFACCANTG
         +         dbePrecioG.Text+',' // wDFACPREUMO
         +         edtDsto1.Text+',' // wDFACDCTO
         +         edtDsto2.Text+',' // wDFACDCTO2
         +         quotedstr(DMFAC.wUsuario)+','
         +         quotedstr(DMFAC.cdsFact2.FieldByName('TMONID').AsString)+', ' // wTMONID
         +         quotedstr(dblcFPago.Text) + ',' // wFPAGOID
         +         quotedstr(dblcVen.Text) + ',' // wVEID
         +         quotedstr(datetostr(dtpFFac.date))+', ' // wFACFECHA
         +         quotedstr(dblcTipoCompra.Text)+', ' // wTIPOADQ
         +         quotedstr(trim(memDetArt.Text))+');'
         +   ' End;';
   End
   Else
   Begin
      xSQL := 'Begin '
         +      ' SP_FAC_GRABA_DET_FAC_COMM('
         +         quotedstr(dblcCia.Text)+','  // wCIAID
         +         quotedStr(dblcLocal.Text)+', ' // wLOCID
         +         quotedstr(dblcAlmacen.Text)+', ' // wALMID
         +         quotedstr(xClaux) + ', ' // wCLAUXID
         +         quotedstr(dblcdAso.Text)+', ' // wCLIEID
         +         quotedstr(dblcTdoc.Text)+', ' // wTDocId
         +         quotedstr(dblcSerie.Text)+', ' // wFACSERIE
         +         quotedstr(dbeNFac.Text)+', ' // wNroFac
         +         quotedstr(dblcLPrecio.Text) + ',' // wTLISTAID
         +         quotedstr(dblcdServicio.Text)+', ' // wARTID
         +         dbeCnt.Text+',' // wDFACCANTG
         +         dbePUnit.Text+',' // wDFACPREUMO
         +         dbeDscto.Text+',' // wDFACDCTO
         +         dbeImp2.Text+',' // wDFACDCTO2
         +         quotedstr(DMFAC.wUsuario)+','
         +         quotedstr(DMFAC.cdsFact2.FieldByName('TMONID').AsString)+', ' // wTMONID
         +         quotedstr(dblcFPago.Text) + ',' // wFPAGOID
         +         quotedstr(dblcVen.Text) + ',' // wVEID
         +         quotedstr(datetostr(dtpFFac.date))+', ' // wFACFECHA
         +         quotedstr(dblcTipoCompra.Text)+', ' // wTIPOADQ
         +         quotedstr(trim(memDetServ.Text))+');'
         +   ' End;';
   End;

   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo actualizar el artículo en el Detalle');
      If sTipoRQS = 'C' Then
         bbtnRegOk.SetFocus
      Else
      Begin
         Z2bbtnRegOk.SetFocus;
      End;
      exit;
   End;

   xSQL := 'Select DB2ADMIN.FN_FAC_BUSCA_ART_EN_DET_FAC('
      +         quotedstr(dblcCia.Text)+','  // wCIAID
      +         quotedstr(dblcTdoc.Text)+', ' // wTDocId
      +         quotedstr(dblcSerie.Text)+', ' // wFACSERIE
      +         quotedstr(dbeNFac.Text)+', '; // wNroFac
   If sTipoRQS = 'C' Then
      xSQL := xSQL + quotedstr(dblcdArticulo.Text)+') RESULTADO ' // wARTID
   Else
      xSQL := xSQL + quotedstr(dblcdServicio.Text)+') RESULTADO '; // wARTID
   xSQL := xSQL + '  from DUAL';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.FieldByName('RESULTADO').AsString='NO TIENE' then
   Begin
      ShowMessage('No se ha podido grabar el artículo para la venta');
      If sTipoRQS = 'C' Then
         bbtnRegOk.SetFocus
      Else
      Begin
         Z2bbtnRegOk.SetFocus;
      End;
      Exit;
   End;

   wSQL := 'CIAID =' + QuotedStr(dblcCia.Text)
      + ' AND DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + ' AND FACSERIE =' + QuotedStr(dblcSerie.Text)
      + ' AND NFAC =' + QuotedStr(dbeNFac.Text)
      + ' ORDER BY DFACITEM';
   Filtracds(DMFAC.cdsDetFact2, 'SELECT * FROM FAC306 WHERE ' + wSQL);

// 26/10/2018 cambia display de importes a 2 dígitos
   {
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
// Fin FAC-201806

   CalculaFooter;
   If sTipoRQS = 'C' Then
   Begin
      InicializaCamposDetalle;
      edtDsto1.text := dbePorcentaje.text;
      wFlagedi := '';
      xxReservaAnt := 0;
      Screen.Cursor := crDefault;
      If pnlRegistro.Visible Then
         dblcdArticulo.SetFocus;
   End
   Else
   Begin
      If sTipoRQS = 'S' Then
      Begin
         pnlDetalle.Enabled := True;
         pnlPie.Enabled := True;
         InicializaCamposDetalle;
         wFlagedi := '';
         Screen.Cursor := crDefault;
         pnlDetalleA.Visible := False;
      End;
   End;

// Fin FAC-201806
   wInserta := True;
End;

Procedure TFFactSGuia.InicializaCamposDetalle;
Begin
   If sTipoRqs = 'C' Then
   Begin
      dblcdArticulo.Enabled := True;
      dblcdArticulo.Text := '';
      dbeArticulo.Text := '';
      dbePrecioG.Text := '';
      dbeCantUA.Enabled := False;
      dbeCantGA.Text := '';
      dbeCantUA.Text := '';
      dbeUMG.Text := '';
      dbeImporte.Text := '';
      dbeDGarantia.Text := '';
      cbTipoum.ItemIndex := 0;
      edtDsto1.text := '';
      edtDsto2.Text := '';
      lblUMAG.Caption := '';
      dbeMontoDCTO1.Text := '';
      dbeMontoDCTO2.Text := '';
      dbeImporteIGV.Text := '';
      dbeIgv.Text := '0';
      dbeServicio.Text := '0';
      dbeRed.Text := dbeImporteIGV.Text;
      memDetArt.lines.Clear;
   End
   Else
      If sTipoRqs = 'S' Then
      Begin
         memDetalle.Text := '';
         dbeCnt.Text := '0';
         dbePUnit.Text := '0';
         dbeDscto.Text := '0';
         dbeImpIgv.Text := '0';
         dbeImp2.Text := '0';
         dbeIgv.Text := '0';
         dbeServicio.Text := '0';
         dbeImp2.OnExit(dbeImp2);
      End;
End;

Function TFFactSGuia.ExisteArticuloDuplicado(xxArt: String): boolean;
Var
   xRegAct: TBookmark;
   xCont: integer;
Begin
   Result := False;
   Screen.Cursor := crHourGlass;
   If DMFAC.cdsDetFact2.recordcount > 0 Then
   Begin
      DMFAC.cdsDetFact2.DisableControls;
      xRegAct := DMFAC.cdsDetFact2.GetBookMark;
      xCont := 0;
      DMFAC.cdsDetFact2.First;
      While Not DMFAC.cdsDetFact2.Eof Do
      Begin
         If DMFAC.cdsDetFact2.FieldByName('ARTID').AsString = xxArt Then
         Begin
            xCont := xCont + 1;
            If xCont >= 1 Then
            Begin
               result := True;
               Screen.Cursor := crDefault;
               Exit;
            End;
         End;
         DMFAC.cdsDetFact2.Next;
      End;
      DMFAC.cdsDetFact2.GotoBookmark(xRegAct);
      DMFAC.cdsDetFact2.FreeBookmark(xRegAct);
      DMFAC.cdsDetFact2.EnableControls;
   End;
   Screen.Cursor := crDefault;
End;

Procedure TFFactSGuia.dbgStockCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   If (DMFAC.cdsQry4.FieldByName('ALMID').AsString = dblcAlmacen.Text) Then
   Begin
      AFont.Color := clBlue;
      ABrush.Color := $00C4E6E3;
   End;
End;

Procedure TFFactSGuia.CalculaFooter;
Var
   xTotal, xTotDscto, xTotIGv, xTotFact, xServicio: double;
   xRegAct: integer;
Begin
 // Totales
   If DMFAC.cdsDetFact2.recordcount > 0 Then
   Begin
      DMFAC.cdsDetFact2.DisableControls;
      xRegAct := DMFAC.cdsDetFact2.recno;
      xTotal := 0;
      xTotDscto := 0;
      xTotFact := 0;
      xTotIgv := 0;
      xServicio := 0;

      DMFAC.cdsDetFact2.First;
      While Not DMFAC.cdsDetFact2.Eof Do
      Begin
         xTotal := xTotal + DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat;
         xTotDscto := xTotDscto + DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat;
         xTotIgv := xTotIgv + DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat;
         xServicio := xServicio + DMFAC.cdsDetFact2.FieldByName('DFACSERMO').AsFloat;
         xTotFact := xTotFact + DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat;
         DMFAC.cdsDetFact2.Next;
      End;

      dbgDetFac.ColumnByName('ARTDES').FooterValue := 'Totales:';
   // Inicio FAC-201806
   // 26/10/2018 cambia display de importes a 2 dígitos
      {
      dbgDetFac.ColumnByName('DFACMTOMO').FooterValue := floattostrf(xTotal, ffNumber, 10, 4);
      dbgDetFac.ColumnByName('DFACIMPMTO1').FooterValue := floattostrf(xTotIgv, ffNumber, 10, 4);
      dbgDetFac.ColumnByName('DFACSERMO').FooterValue := floattostrf(xServicio, ffNumber, 10, 4);
      dbgDetFac.ColumnByName('DFACVTOTMO').FooterValue := floattostrf(xTotFact, ffNumber, 10, 4);
      }
      dbgDetFac.ColumnByName('DFACMTOMO').FooterValue := floattostrf(xTotal, ffNumber, 10, 2);
      dbgDetFac.ColumnByName('DFACIMPMTO1').FooterValue := floattostrf(xTotIgv, ffNumber, 10, 2);
      dbgDetFac.ColumnByName('DFACSERMO').FooterValue := floattostrf(xServicio, ffNumber, 10, 2);
      dbgDetFac.ColumnByName('DFACVTOTMO').FooterValue := floattostrf(xTotFact, ffNumber, 10, 2);
   // Fin FAC-201806
      dbgDetFac.RedrawGrid;

      DMFAC.cdsDetFact2.First;
      DMFAC.cdsDetFact2.MoveBy(xRegAct);
      DMFAC.cdsDetFact2.EnableControls;
   End
   Else
   Begin
      dbgDetFac.ColumnByName('ARTDES').FooterValue := 'Totales:';
   // Inicio FAC-201806
   // 26/10/2018 cambia display de importes a 2 dígitos
      {
      dbgDetFac.ColumnByName('DFACMTOMO').FooterValue := floattostrf(xTotal, ffNumber, 10, 4);
      dbgDetFac.ColumnByName('DFACIMPMTO1').FooterValue := floattostrf(xTotIgv, ffNumber, 10, 4);
      dbgDetFac.ColumnByName('DFACSERMO').FooterValue := floattostrf(xServicio, ffNumber, 10, 4);
      dbgDetFac.ColumnByName('DFACVTOTMO').FooterValue := floattostrf(xTotFact, ffNumber, 10, 4);
      }
      dbgDetFac.ColumnByName('DFACMTOMO').FooterValue := floattostrf(xTotal, ffNumber, 10, 0);
      dbgDetFac.ColumnByName('DFACIMPMTO1').FooterValue := floattostrf(xTotIgv, ffNumber, 10, 0);
      dbgDetFac.ColumnByName('DFACSERMO').FooterValue := floattostrf(xServicio, ffNumber, 10, 0);
      dbgDetFac.ColumnByName('DFACVTOTMO').FooterValue := floattostrf(xTotFact, ffNumber, 10, 0);
   // Fin FAC-201806
      dbgDetFac.RedrawGrid;
   End;

// Inicio FAC-201806
// 26/10/2018 cambia display de importes a 2 dígitos
   dbgDetFac.Selected.Clear;
   dbgDetFac.Selected.Add('DFACITEM'#9'03'#9'Item');
   dbgDetFac.Selected.Add('ARTID'#9'08'#9'Artículo');
   dbgDetFac.Selected.Add('ARTDES'#9'28'#9'Descripción');
   dbgDetFac.Selected.Add('UNMIDG'#9'03'#9'U/M');
   dbgDetFac.Selected.Add('DFACCANTAT'#9'04'#9'Cant.');
   dbgDetFac.Selected.Add('ALMID'#9'03'#9'Alm.');
   dbgDetFac.Selected.Add('DFACPREUMO'#9'10'#9'Precio');
   dbgDetFac.Selected.Add('DFACDTOMO2'#9'10'#9'Dctos.~2');
   dbgDetFac.Selected.Add('DFACMTOMO'#9'10'#9'Precio~Venta');
   dbgDetFac.Selected.Add('DFACIMPMTO1'#9'10'#9'Igv');
   dbgDetFac.Selected.Add('DFACSERMO'#9'10'#9'Servicio');
   dbgDetFac.Selected.Add('DFACVTOTMO'#9'10'#9'Precio~Total');
   dbgDetFac.ApplySelected;
   dbgDetFac.ColumnByName('ARTDES').FooterValue := 'Total:';
   dbgDetFac.RedrawGrid;
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACSERMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACSERMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).EditFormat := '########0.00';

   If DMFAC.cdsFact2.State = dsBrowse Then
      DMFAC.cdsFact2.Edit;
   DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat := xTotFact;
//   DMFAC.cdsFact2.Post;
// Fin FAC-201806

End;

Procedure TFFactSGuia.EstadoDeForma(xxModo: Integer; xMovEstado: String);
Begin
   pnlCab1.Enabled := False;
   pnlCab2.Enabled := False;
   bbtnOK.Enabled := False;
   bbtnBorra.Enabled := False;
   dblcCia.Enabled := True;
   edtClie.Enabled := False;

   pnlDetalle.Enabled := False;
   dbgDetFac.enabled := False;
   dbgDetFac.ReadOnly := True;
   btnActReg.Enabled := False;
   pnlRegistro.Visible := False;
   pnlDetalleA.Visible := False;

   pnlPie.Refresh;
   pnlPie.Enabled := False;
   bbtnRegresa.Enabled := False;
   Z2bbtnAcepta.Enabled := False;
   Z2bbtnNuevo.Enabled := False;
   Z2bbtnImprime.Enabled := False;
// Inicio FAC-201807
// Desactiva botón de Entrega de Mercadería
   bbtnEntrega.Enabled := False;
// Fin FAC-201807

   dbeNFac.Enabled := False;
   lblEstado.visible := False;
   bbtnCombo.Enabled := False;

//Cond
   Z2bbtnCambiaCond.visible := False;
   gbRed.Visible := False;
   bbtnTicket.Enabled := False;

   xTick := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD =''CXC'' AND DOCTIPREG =''T''', 'DOCID');

   If xxModo = 0 Then // cuando va hacia la cabecera
   Begin
      If (xMovEstado = ' ') Then
      Begin
         If DMFAC.cdsDetFact2.RecordCount > 0 Then
         Begin
            pnlCab1.Enabled := False;
            dblcSerie.Enabled := False;
         End
         Else
         Begin
            pnlCab1.Enabled := True;
            dblcSerie.Enabled := True;
         End;
         pnlCab2.Enabled := True;
         bbtnOK.Enabled := True;
         bbtnBorra.Enabled := True;
         dblcLPrecio.Enabled := True;
         dblcCia.SetFocus;
      End
      Else
      Begin
         If (xMovEstado = 'INICIAL') Or (xMovEstado = 'TEMPORAL') Then
         Begin
            If DMFAC.cdsDetFact2.RecordCount > 0 Then
            Begin
               pnlCab1.Enabled := False;
               dblcSerie.Enabled := False;
               If (sAcepta = 'S') Or (sSupervisor = 'S') Or (sAdmTienda = 'S') Then
               Begin
                  dblcVen.Enabled := True;
               End;
            End
            Else
            Begin
               pnlCab1.Enabled := True;
               dblcSerie.Enabled := True;
               If (sAcepta = 'S') Or (sSupervisor = 'S') Or (sAdmTienda = 'S') Then
               Begin
                  dblcVen.Enabled := True;
               End;
            End;
            pnlCab2.Enabled := True;
            bbtnOK.Enabled := True;
            bbtnBorra.Enabled := True;
            lblEstado.visible := True;
         End
      End
   End
   Else
   Begin // cuando el foco esta en el Detalle
      If xMovEstado = 'TEMPORAL' Then // temporal grabado desde cabecera
      Begin
         pnlDetalle.Enabled := True;
         dbgDetFac.ReadOnly := False;
         dbgDetFac.enabled := True;
         btnActReg.Enabled := True;
         pnlPie.Enabled := True;
         bbtnRegresa.Enabled := True;
         lblEstado.visible := True;
      End;
      If ((xMovEstado = 'INICIAL')) Then // si ya esta grabado
      Begin
         pnlCab1.Enabled := False;
         pnlCab2.Enabled := False;
         btnActReg.Enabled := True;
         pnlDetalle.Enabled := True;
         dbgDetFac.Enabled := True;
         dbgDetFac.ReadOnly := False;
         btnActReg.Enabled := True;
         pnlPie.Enabled := True;
         bbtnRegresa.Enabled := True;
         bbtnCombo.Enabled := True;
         If sAcepta = 'S' Then
         Begin
            Z2bbtnAcepta.Enabled := True;
         End;
         If (sAcepta = 'S') Or (sSupervisor = 'S') Or (sAdmTienda = 'S') Then
         Begin
            dblcVen.Enabled := True;
         End;
         lblEstado.visible := True;
         If cbDiseno.Checked Then
            gbRed.Visible := True;
      End;

      If (xMovEstado = 'ACEPTADO') Or (xMovEstado = 'C') Then
      Begin
         pnlDetalle.Enabled := True;
         dbgDetFac.enabled := True;
         pnlPie.Enabled := True;
         If sAcepta = 'S' Then
         Begin
            If dblcTdoc.Text = xTick Then
            Begin
               Z2bbtnImprime.Enabled := False;
            // Inicio FAC-201807
            // Desactiva botón de Entrega de Mercadería
               bbtnEntrega.Enabled := False;
            // Fin FAC-201807
               bbtnTicket.Enabled := True;
            End
            Else
            Begin
               Z2bbtnImprime.Enabled := True;
            // Inicio FAC-201807
            // Activa botón de Entrega de Mercadería
               bbtnEntrega.Enabled := True;
            // Fin FAC-201807
               bbtnTicket.Enabled := False;
            End;
         End;

         dbgDetFac.enabled := True;
         lblEstado.visible := True;

         If (sAcepta = 'S') Or (sSupervisor = 'S') Or (sAdmTienda = 'S') Then
         Begin
            Z2bbtnCambiaCond.visible := True;
            gbRed.Visible := True;
         End;

      End;
      If xMovEstado = 'ANULADO' Then // anulado
      Begin
         pnlDetalle.Enabled := True;
         dbgDetFac.enabled := True;
         pnlPie.Enabled := True;
         lblEstado.visible := True;

         If (sAcepta = 'S') Or (sSupervisor = 'S') Then
         Begin
            If dblcTdoc.Text = xTick Then
            Begin
               Z2bbtnImprime.Enabled := False;
            // Inicio FAC-201807
            // Desactiva botón de Entrega de Mercadería
               bbtnEntrega.Enabled := False;
            // Fin FAC-201807
               bbtnTicket.Enabled := True;
            End
            Else
            Begin
               Z2bbtnImprime.Enabled := True;
            // Inicio FAC-201807
            // Desactiva botón de Entrega de Mercadería
               bbtnEntrega.Enabled := True;
            // Fin FAC-201807
               bbtnTicket.Enabled := False;
            End;
         End;
      End;

      If (DMFAC.wModo = 'A') And ((xMovEstado = 'INICIAL') Or (xMovEstado = 'ACEPTADO')) Then
      Begin
         Z2bbtnNuevo.Enabled := True;
      End;
   End;

   If DMFAC.wModo = 'C' Then
   Begin // Si Entra Solo Para Consulta
      pnlCab1.Enabled := False;
      pnlCab2.Enabled := False;
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
         Z2bbtnAcepta.Enabled := True;
         Z2bbtnNuevo.Enabled := True;
      End
      Else
      Begin
         bbtnRegresa.Enabled := False;
         Z2bbtnAcepta.Enabled := False;
         Z2bbtnNuevo.Enabled := False;
      End;
      pnlPie.Refresh;
   End;
End;

Function TFFactSGuia.ConsistenciaDet: Boolean;
Begin
   If sTipoRQS = 'C' Then
   Begin
      If length(dbeArticulo.Text) = 0 Then
      Begin
         dblcdArticulo.SetFocus;
         Raise Exception.Create('Debe Ingresar Artículo');
      End;

      If length(Trim(dbeCantGA.Text)) = 0 Then
      Begin
         ShowMessage('Ingrese Cantidad');
         dbeCantGA.Text := '0';
         dbeCantGA.SetFocus;
         Exit;
      End;

      If ((StrToInt(dbeCantGA.Text) = 0) And (dbeCantUA.Enabled = False)) Then
      Begin
         dbeCantGA.SetFocus;
         Raise Exception.Create('Debe Ingresar Cantidad ');
      End;

      If ((StrToFloat(dbeCantGA.Text) = 0) And (dbeCantUA.Enabled = False)) Then
      Begin
         dbeCantGA.SetFocus;
         Raise Exception.Create('Debe Ingresar Cantidad mayor a cero');
      End;

      If StrToFloat(dbePrecioG.Text) < 0 Then
      Begin
         Raise Exception.Create('Precio no puede ser negativo');
      End;
   End
   Else
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

         If StrToFloat(dbePUnit.Text) = 0 Then
         Begin
            Raise Exception.Create('Debe Ingresar Precio');
         End;
      End;

   Result := True;
End;

Procedure TFFactSGuia.AperturaConsultaSaldos(xxFlagE: String);
Begin
   MuestraStock(dblcdArticulo.Text, xxFlagE);
End;

Procedure TFFactSGuia.Muestrastock(xxArticulo, xxEstado: String);
Var
   xSQL, sAnoMes: String;
   xSaldoG, xSaldoU: double;
   xAno, xMes, xDia: word;
Begin
   DecodeDate(dtpFFac.Date, xAno, xMes, xDia);
   sAnoMes := IntToStr(xAno) + DMFAC.StrZero(inttostr(xMes), 2);
   DMFAC.cdsQry4.close;
   DMFAC.cdsQry4.ProviderName := 'prvEjecuta';
   xSQL := 'Select A.ALMID, B.ALMDES, A.ARTID, STKFIN STKSACTG, 1 ARTCONT '
      + '  from LOG319 A, TGE151 B '
      + ' where A.CIAID=' + QuotedStr(dblcCia.Text)
      + '   and A.LOGANOMM=' + QuotedStr(sAnoMes)
      + '   and A.TINID=' + QuotedStr(dblcTInv.Text);
   If (dblcCia.Text = '04') And ((dblcAlmacen.Text = '14') or (dblcAlmacen.Text='15')) Then
      xSQL := xSQL + ' and A.ALMID in (''14'',''15'') '
   Else
      xSQL := xSQL + ' and A.ALMID='+quotedstr(dblcAlmacen.Text);
   xSQL := xSQL
      + '   and A.ARTID=' + QuotedStr(xxArticulo)
      + '   and A.STKFIN>0 '
      + '   and B.CIAID=A.CIAID AND B.ALMID=A.ALMID AND B.TINID=A.TINID AND B.ALMVTA=''S'' ';
   DMFAC.cdsQry4.DataRequest(xSQL);
   DMFAC.cdsQry4.Open;
   If DMFAC.cdsQry4.recordcount = 0 Then
   Begin
      dblcdArticulo.SetFocus;
      xAdicArt := 'S';
      Raise exception.create('Error: El Articulo ' + xxArticulo + ' no Tiene Saldo ');
   End;

// Inicio FAC-201806
// 26/10/2018 cambia display de importes a 2 dígitos
   {
   TNumericField(DMFAC.cdsQry4.FieldByName('STKSACTG')).DisplayFormat := '###,##0.0000';
   }
   TNumericField(DMFAC.cdsQry4.FieldByName('STKSACTG')).DisplayFormat := '###,##0.00';
// Fin FAC-201806

   xSaldog := DMFAC.OperClientDataSet(DMFAC.cdsQry4, 'sum(STKSACTG)', '');
   dbgStock.ColumnByName('STKSACTG').FooterValue := floattostrf(xSaldoG, ffNumber, 12, 2);
   wStockG := FRound(xSaldog, 15, 2);
End;

Procedure TFFactSGuia.dblcSerieExit(Sender: TObject);
Var
   xNFact, NueAnt, xSQL, xWhere: String;
Begin
   If xCrea Then Exit;
   If DMFAC.wModo = 'M' Then
      Exit;

   If btnExec.Focused Then Exit;

   xFact := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''F''', 'DOCID');
   xBol := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''B''', 'DOCID');

   xTick := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD =''CXC'' AND DOCTIPREG =''T''', 'DOCID');

   If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xFact) Then //Si genera Factura
   Begin
      xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND FLAGV=' + QuotedStr('F') + ' AND SERIEID =' + QuotedStr(dblcSerie.Text);
      NueAnt := DMFAC.BuscaQry('dspUltTGE', 'FAC103', 'SERIENUM', xWhere, 'SERIENUM');
      If Length(Trim(NueAnt)) = 0 Then Exit;
      xNFact := IntToStr(StrToInt(NueAnt) + 1);
      If StrToInt(xNFact) < StrToInt(wSerieNum) Then
         xNFAct := wSerieNum;

      xSQL := 'Update DB2ADMIN.FAC103 '
         + '      set SERIENUM=' + xNFact
         + '    where CIAID=' + QuotedStr(dblcCia.text)
         + '      and FLAGV = ''F'' '
         + '      and SERIEID=' + QuotedStr(dblcSerie.Text);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se ha podido actualizar el archivo de Series de Documentos');
         xContinuaGrab := False;
         exit;
      End;

      edtDireccion.Enabled := False;
   End
   Else
   Begin
      If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xBol) Then //Si genera Factura
      Begin
         xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND FLAGV =' + QuotedStr('B') + ' AND SERIEID =' + QuotedStr(dblcSerie.Text);
         NueAnt := DMFAC.BuscaQry('dspUltTGE', 'FAC103', 'SERIENUM', xWhere, 'SERIENUM');
         If Length(Trim(NueAnt)) = 0 Then Exit;
         xNFact := IntToStr(StrToInt(NueAnt) + 1);
         If StrToInt(xNFact) < StrToInt(wSerieNum) Then
            xNFAct := wSerieNum;

         xSQL := 'Update FAC103 '
            + '      set SERIENUM=' + '' + xNFact + ''
            + '    where CIAID=' + QuotedStr(dblcCia.text)
            + '      and FLAGV = ''B'' '
            + '      and SERIEID=' + QuotedStr(dblcSerie.Text);
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se ha podido actualizar el archivo de Series de Documentos');
            xContinuaGrab := False;
            exit;
         End;

         edtDireccion.Enabled := True;
      End
      Else
      Begin
         If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xTick) Then //Si genera Ticket
         Begin
            xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND FLAGV =' + QuotedStr('T') + ' AND SERIEID =' + QuotedStr(dblcSerie.Text);
            NueAnt := DMFAC.BuscaQry('dspUltTGE', 'FAC103', 'SERIENUM', xWhere, 'SERIENUM');
            If Length(Trim(NueAnt)) = 0 Then Exit;
            xNFact := IntToStr(StrToInt(NueAnt) + 1);
            If StrToInt(xNFact) < StrToInt(wSerieNum) Then
               xNFAct := wSerieNum;

            xSQL := 'Update FAC103 '
               + '      set SERIENUM=' + '' + xNFact + ''
               + '    where CIAID=' + QuotedStr(dblcCia.text)
               + '      and FLAGV = ''T'' '
               + '      and SERIEID=' + QuotedStr(dblcSerie.Text);
            Try
               DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('No se ha podido actualizar el archivo de Series de Documentos');
               xContinuaGrab := False;
               exit;
            End;

            edtDireccion.Enabled := True;
         End
         Else
         Begin
            If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xGRem) Then //Si genera Guia de Remision
            Begin
               xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + '  AND FLAGV=' + QuotedStr('G') + ' AND SERIEID=' + QuotedStr(dblcSerie.Text);
               NueAnt := DMFAC.BuscaQry('dspUltTGE', 'FAC103', 'SERIENUM', xWhere, 'SERIENUM');
               If Length(Trim(NueAnt)) = 0 Then Exit;
               xNFact := IntToStr(StrToInt(NueAnt) + 1);

               edtDireccion.Enabled := True;
            End;
         End;
      End;
   End;
   xNFact := DMFAC.StrZero(xNFact, DMFAC.wAnchoFact);
   xNFact := 'T'+copy(xNFact,2,DMFAC.wAnchoFact-1);

   If DMFAC.cdsFact2.State = dsInsert Then
      DMFAC.cdsFact2.FieldByName('NFAC').AsString := xNFact;

End;

Procedure TFFactSGuia.dtpFFacExit(Sender: TObject);
Var
   xTCambio: double;
   xSQL, xWhere: String;
Begin

   DMFAC.cdsFact2.Edit;
   DMFAC.cdsFact2.FieldByName('FACFEVCMTO').AsDateTime := dtpFFac.Date;

   If xCrea Then exit;

   If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString = 'INICIAL' Then
   Begin
      If dblcTipoCompra.Text = 'S' Then
      Begin
         xSQL := 'Select * FROM CXC312 '
            + '    where CIAID=' + QuotedStr(dblcCia.Text)
            + '      and ''' + DateToStr(dtpFFac.Date) + '''>=CNSPRICIE and ''' + DateToStr(dtpFFac.Date) + '''<=CNSULTCIE '
            + '    order BY CNSULTCIE DESC';
         DMFAC.cdsQry.Close;
         DMFAC.cdsQry.DataRequest(xSQL);
         DMFAC.cdsQry.Open;
         If DMFAC.cdsQry.RecordCount = 0 Then
         Begin
            ShowMessage('No Existe Periodo Operativo en Cuentas por Cobrar');
            dtpFFac.SetFocus;
            exit;
         End
         Else
         Begin
            If DMFAC.cdsQry.fieldbyname('ESTVEN').AsString = 'C' Then
            Begin
               ShowMessage('No se puede Registrar Documento con Fecha ' + DateToStr(dtpFFac.Date) + #13 + #13
                  + 'Rango Desde ' + DateToStr(DMFAC.cdsQry.fieldbyname('CNSPRICIE').AsDateTime)
                  + ' al ' + DateToStr(DMFAC.cdsQry.fieldbyname('CNSULTCIE').AsDateTime) + ' ya fue Cerrado');
               dtpFFac.SetFocus;
               exit;
            End;
         End;
      End
      Else
      Begin
         If dtpFFac.enabled Then
            DMFAC.VerificaPeriodoVentas(dblcCia.Text, dblcLocal.text, dblcTInv.text, dblcAlmacen.text, dtpFFac.Date, dtpFFac.Date)
         Else
            DMFAC.VerificaPeriodoVentas(dblcCia.Text, dblcLocal.text, dblcTInv.text, dblcAlmacen.text, xFecHoy, dtpFFac.Date);

         If Not wVerifPerVentas Then
         Begin
            dtpFFac.SetFocus;
            exit;
         End;
      End;
   End;

   xWhere := 'TMONID =' + QuotedStr(DMFAC.wTMonExt)
      + ' AND FECHA = ' + DMFAC.wRepFuncDate + '''' + FormatDateTime(DMFAC.wFormatFecha, dtpFFac.Date) + '''' + ')';
   If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xWhere, 'TMONID')) > 0 Then
   Begin
      xTCambio := DMFAC.cdsQry.FieldByName('TCAMVBV').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat := xTCambio;
   End
   Else
   Begin
      dtpFFac.SetFocus;
      ShowMessage('Fecha No tiene Tipo de Cambio');
      exit;
   End;
   DMFAC.xTipCli := 'S';
   dblcdClieRuc.Enabled := False;
   edtClie.Enabled := False;
   dblcdAso.ReadOnly := True;
   If length(edtClie.Text)=0 Then btnExecClick(Self);
   exit;
End;

Procedure TFFactSGuia.cbTipoumExit(Sender: TObject);
Begin
   If bbtnRegCanc.Focused Then Exit;

   If cbTipoUM.Enabled Then
   Begin
      If (cbtipoUm.Text = '') Then
      Begin
         Showmessage('Error: Seleccione Tipo de U. Medida');
         cbtipoUm.setfocus;
         Exit;
      End
      Else
         If (cbTipoUm.Text <> 'General') Then
            If (cbTipoUm.Text <> 'Unitario') Then
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
                  lblUMAG.caption := xxxUMG;
                  dbeUmG.Text := xxxUMG;
                  dbePrecioG.Text := floattostr(xxxPVG);
                  xCIgv := 'S';
                  xcIsc := 'N';
               End;
            End; //0

         1:
            Begin //U.M Unitaria
               If xLprecio Then
               Begin
                  lblUMAG.Caption := xxxUMU;
                  dbeUmG.Text := xxxUMU;
                  dbePrecioG.Text := floattostr(xxxPVU);
                  xCIgv := 'S';
                  xcIsc := 'N';
               End; //LPrecio
            End; //Um unitaria
      End; //Case
      AperturaConsultaSaldos('S'); //Flag para mostrar consulta del stock segun la unidad escogida en el combo
   End;
End;

Procedure TFFactSGuia.IniciaForma;
Begin
   Filtracds(DMFAC.cdsDetFact2, 'SELECT * FROM FAC306 WHERE CIAID=''XYZ''');

   dbgDetFac.Selected.Clear;
   dbgDetFac.Selected.Add('DFACITEM'#9'03'#9'Item');
   dbgDetFac.Selected.Add('ARTID'#9'08'#9'Artículo');
   dbgDetFac.Selected.Add('ARTDES'#9'28'#9'Descripción');
   dbgDetFac.Selected.Add('UNMIDG'#9'03'#9'U/M');
   dbgDetFac.Selected.Add('DFACCANTAT'#9'04'#9'Cant.');
   dbgDetFac.Selected.Add('ALMID'#9'03'#9'Alm.');
   dbgDetFac.Selected.Add('DFACPREUMO'#9'10'#9'Precio');
   dbgDetFac.Selected.Add('DFACDTOMO2'#9'10'#9'Dctos.~2');
   dbgDetFac.Selected.Add('DFACMTOMO'#9'10'#9'Precio~Venta');
   dbgDetFac.Selected.Add('DFACIMPMTO1'#9'10'#9'Igv');
   dbgDetFac.Selected.Add('DFACSERMO'#9'10'#9'Servicio');
   dbgDetFac.Selected.Add('DFACVTOTMO'#9'10'#9'Precio~Total');
   dbgDetFac.ApplySelected;
   dbgDetFac.ColumnByName('ARTDES').FooterValue := 'Total:';

   dbgDetFac.RedrawGrid;

// Inicio FAC-201806
// 26/10/2018 cambia display de importes a 2 dígitos
   {
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).EditFormat := '########0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).EditFormat := '########0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).EditFormat := '########0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).EditFormat := '########0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).EditFormat := '########0.0000';
   }
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACSERMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACSERMO')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).EditFormat := '########0.00';
// Fin FAC-201806

   xFCia := False;
   xSerie := False;
   xFLocal := False;
   xFDireccion := False;
   xFAlmacen := False;
   xFLPrecio := False;

   edtCia.Text := '';
   edtClie.Text := '';
   edtFPago.Text := '';
   edtven.Text := '';
   edtTMon.Text := '';
   dbeTcambio.Text := '';
   edtLPrecio.Text := '';
   edtLocal.Text := '';
   edtAlmacen.Text := '';
   pnlRegistro.Visible := False;
   pnlDetalleA.Visible := False;
   wFlagCV := False;
   wFlagCVDes := '';
   wFlagPA := False;
   wFlagLC := False;
   wFlagFP := False;
   edtLentrega.Text := '';
   dblcFPago.Enabled := False;
   dblcTMon.Enabled := True;
   dblcLPrecio.Enabled := True;
   edtTDoc.Text := '';
   dbePorcentaje.Text := '';
   edtdireccion.Text := '';
   edtdireccion.Enabled := True;
   wInserta := False;
End;

Procedure TFFactSGuia.Z2bbtnAceptaClick(Sender: TObject);
Var
   xConta: Integer;
   xWhere, xSQL: String;
   xTDscto: Currency;
Begin
   wwNumFacAnt := DMFAC.cdsFact2.FieldByName('NFAC').AsString;

   If DMFAC.wAdmin = 'G' Then Exit;

   If dblcTipoCompra.Text = 'C' Then
   Begin
      DMFAC.VerificaPeriodoVentas(dblcCia.Text, dblcLocal.text, dblcTInv.text, dblcAlmacen.text, xFecHoy, dtpFFac.Date);
      If Not wVerifPerVentas Then
      Begin
         bbtnRegresa.Click;
         exit;
      End;
   End;

   If DMFAC.cdsDetFact2.RecordCount = 0 Then
   Begin
      MessageDlg('Debe Ingresar el Detalle de la Factura', mtInformation, [mbOk], 0);
      Exit;
   End;

   If (DMFAC.cdsDetFact2.Modified) Or (DMFAC.cdsDetFact2.ChangeCount > 0) Then
      Raise exception.Create(' Debe Grabar primero las Actualizaciones realizadas');

   If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString <> 'INICIAL' Then
   Begin
      Information(Caption, 'El Documento ya ha Sido Aceptado');
      Exit;
   End;

   If StrtoFloat(stringreplace(dbgDetFac.ColumnByName('DFACVTOTMO').FooterValue, ',', '', [rfReplaceAll])) >= 700 Then
   Begin

      If dblcdAso.Text = '33333333' Then
      Begin
         ShowMessage('Para Montos mayores a S/.700 no puede usar el Código Genérico - Cliente Varios. Debe crear un código de Cliente e ingresar correctamente el RUC ó DNI, Nombres y Apellidos completos y la Dirección del Cliente (Es obligatorio Solicitado por la SUNAT).');
         Exit;
      End;

      If (xTipDocIdent = '01') And (Length(trim(xNumdocIdent)) < 8) Then
      Begin
         ShowMessage('Para Montos mayores a S/.700 es Obligatorio ingresar Correctamente el RUC ó DNI del Cliente (Solicitado por SUNAT).');
         Exit;
      End;

      If (xTipDocIdent <> '01') And (Length(trim(dblcdClieRuc.Text)) < 8) Then
      Begin
         ShowMessage('Para Montos mayores a S/.700 es Obligatorio ingresar Correctamente el RUC ó DNI del Cliente (Solicitado por SUNAT).');
         Exit;
      End;

      If Copy(edtDireccion.Text, 1, 1) = '.' Then
      Begin
         ShowMessage('Para Montos mayores a S/.700 es Obligatorio ingresar correctamente la Dirección del Cliente, No debe ingresar "." (Solicitado por SUNAT).');
         Exit;
      End;
      If Length(edtDireccion.Text) < 4 Then
      Begin
         ShowMessage('Para Montos mayores a S/.700 es Obligatorio ingresar correctamente la Dirección del Cliente (Solicitado por SUNAT).');
         Exit;
      End;
   End;

// Inicio FAC-201806
// 29/10/2018 abre cds de cabecera para que contenga todos los valores
   If DMFAC.cdsFact2.State = dsBrowse Then
      DMFAC.cdsFact2.Edit;
   If DMFAC.cdsFact2.FieldByName('TMONID').AsString='N' Then
   Begin
      DMFAC.cdsFact2.FieldByName('FACTOTMN').AsFloat := DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACTOTME').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat / StrToFloat(dbeTCambio.Text), 15, 4);
   End
   Else
   Begin
      DMFAC.cdsFact2.FieldByName('FACTOTME').AsFloat := DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACTOTMN').AsFloat := FRound(DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat * StrToFloat(dbeTCambio.Text), 15, 4);
   End;
   DMFAC.cdsFact2.Post;
// Fin FAC-201806

   Screen.Cursor := crHourGlass;

   xConta := 0;
   DMFAC.cdsDetFact2.First;

   xFact := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''F''', 'DOCID');
   xBol := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''B''', 'DOCID');

   xTick := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD =''CXC'' AND DOCTIPREG =''T''', 'DOCID');

   If DMFAC.wVT_Serie <> '' Then
   Begin
      xSQL := 'update FAC305 '
         + '      set FACSERIE=' + Quotedstr(DMFAC.wVT_Serie)
         + '    where CIAID =' + Quotedstr(dblcCia.Text)
         + '      and DOCID=' + Quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
         + '      and CLIEID=' + Quotedstr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString)
         + '      and FACSERIE=' + Quotedstr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
         + '      and NFAC=' + Quotedstr(dbeNFac.Text);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se actualizó Serie del Terminal en la Boleta/Factura');
      End;

      xSQL := 'update FAC306 '
         + '      set FACSERIE=' + Quotedstr(DMFAC.wVT_Serie)
         + '    where CIAID =' + Quotedstr(dblcCia.Text)
         + '      and DOCID=' + Quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
         + '      and CLIEID=' + Quotedstr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString)
         + '      and FACSERIE=' + Quotedstr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
         + '      and NFAC=' + Quotedstr(dbeNFac.Text);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se actualizó Serie del Terminal en el Detalle de la Boleta/Factura');
      End;

      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('FACSERIE').AsString := DMFAC.wVT_Serie;
      DMFAC.cdsFact2.Post;

   End;

   xTDscto := 0;
   DMFAC.cdsDetFact2.First;
   DMFAC.cdsDetFact2.DisableControls;
   While Not DMFAC.cdsDetFact2.eof Do
   Begin
      If DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString <> 'N' Then
      Begin
         xTDscto := xTDscto + (DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat + DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat);
      End;
      DMFAC.cdsDetFact2.Next;
   End;
   DMFAC.cdsDetFact2.EnableControls;

   If xTDscto > 0 Then
   Begin
      If trim(DMFAC.cdsFact2.FieldByName('USUSUPDCT').AsString) = '' Then
      Begin
         Screen.Cursor := crDefault;
         ShowMessage('Supervisor debe Aprobar el Descuento ( ' + FloatToStrF(xTDscto, ffnumber, 15, 4) + ' ) para Generar la Boleta/Factura...');
         Exit;
      End;
   End;

   If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xFact) Then //Si genera Factura
   Begin
      xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND FLAGV=' + QuotedStr('F') + ' AND SERIEID =' + QuotedStr(dblcSerie.Text)
   End;

   If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xBol) Then //Si genera Boleta
   Begin
      xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND FLAGV =' + QuotedStr('B') + ' AND SERIEID =' + QuotedStr(dblcSerie.Text)
   End;

   If (DMFAC.cdsFact2.FieldByName('DOCID').AsString = xTick) Then //Si genera Ticket
   Begin
      xWhere := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND FLAGV =' + QuotedStr('T') + ' AND SERIEID =' + QuotedStr(dblcSerie.Text)
   End;
   xNumeroReal := DMFAC.BuscaQry('dspUltTGE', 'FAC103', 'NUMREAL, EDITA', xWhere, 'NUMREAL');
   xNumeroReal := DMFAC.StrZero(IntToStr(StrToInt(xNumeroReal) + 1), DMFAC.wAnchoFact);

   If datetostr(dtpFFac.Date) <> datetostr(DMFAC.DateS) Then
   Begin
      If Not (sSupervisor = 'S') Then
      Begin
         ShowMessage('La fecha del documento no es del día de Hoy, sólo puede ser modificado por el Supervisor...');
         Exit;
      End;
   End;

// Inicio FAC-201806
// 18/10/2018 Actualiza Totales de la Factura
   If DMFAC.cdsDetFact2.RecordCount > 0 Then
   Begin
      xSQL := 'Begin DB2ADMIN.SP_FAC_ACT_TOT_FAC ('
         +           quotedstr(dblcCia.text)+', '
         +           quotedstr(dblcTdoc.Text)+', '
         +           quotedstr(dblcSerie.Text)+', '
         +           quotedstr(dbeNFac.Text)+'); '
         +    'End;';
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      CalculaFooter;
   End;
// Fin FAC-201806

   DMFAC.cdsQry17.Close;
   FFormaPago := TFFormaPago.Create(Self);
   FFormaPago.edtTDoc.text := edtTDoc.text;
   FFormaPago.edtMoneda.text := edtTMon.text;
   FFormaPago.ShowModal;

   EstadoDeForma(1, DMFAC.cdsFact2.FieldByName('FACESTADO').AsString);

   Screen.Cursor := crDefault;
End;

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
{
Procedure TFFactSGuia.ReGeneraCNT;
Var
   xCiaDest, xWhereFil, xReg, fCxcCnt, sSQL: String;
   xCab, xDet, fConta: boolean;
   xWhere: String;
Begin
   Screen.Cursor := crHourGlass;

   xWhere := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString) + ' AND CCOMERID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FPAGOID').AsString);
   DMFAC.BuscaQry('dspUltTGE', 'TGE180', 'DCCOMDES, DCCOMPORC, DCOMMTOMAX, CONDPID', xWhere, 'DCCOMDES');
   sTipoPago := DMFAC.cdsQry.FieldByName('CONDPID').AsString;

   If DMFAC.cdsFact2.fieldbyname('FACESTADO').AsString <> 'INICIAL' Then
   Begin
      xWhere := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('CIAID').AsString)
         + ' and CCANOMES=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString)
         + ' and DOCID=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('DOCID').AsString)
         + ' and CCSERIE=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString)
         + ' and CCNODOC=' + QuotedStr(DMFAC.cdsFact2.fieldbyname('NFAC').AsString);
      xReg := DMFAC.BuscaQry('dspUltTGE', 'CXC301', 'CCNOREG, CC_CONTA', xWhere, 'CCNOREG');

      fCxcCnt := DMFAC.cdsQry.FieldByName('CC_CONTA').AsString;

      If (fConta) Or ((fConta = False) And (fCxcCnt <> 'S')) Then
      Begin
         sSQL := ' Delete FROM CXC301 '
            + '     where CIAID=''' + DMFAC.cdsFact2.fieldbyname('CIAID').AsString + ''' '
            + '       and CCANOMES=''' + DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString + ''' '
            + '       and DOCID=''' + DMFAC.cdsFact2.fieldbyname('DOCID').AsString + ''' '
            + '       and CCSERIE=''' + DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString + ''' '
            + '       and CCNODOC=''' + DMFAC.cdsFact2.fieldbyname('NFAC').AsString + ''' ';
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
         Except
            Screen.Cursor := crDefault;
         End;

         sSQL := ' Delete FROM CXC302 '
            + '     where CIAID=''' + DMFAC.cdsFact2.fieldbyname('CIAID').AsString
            + '       and CCANOMES=''' + DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString + ''' '
            + '       and DOCID=''' + DMFAC.cdsFact2.fieldbyname('DOCID').AsString + ''' '
            + '       and CCSERIE=''' + DMFAC.cdsFact2.fieldbyname('FACSERIE').AsString + ''' '
            + '       and CCNODOC=''' + DMFAC.cdsFact2.fieldbyname('NFAC').AsString + ''' ';
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
         Except
            Screen.Cursor := crDefault;
         End;

         If xReg <> '' Then
         Begin
            sSQL := ' Delete FROM CNT301 '
               + '     where CIAID=''' + DMFAC.cdsFact2.fieldbyname('CIAID').AsString + ''' '
               + '       and CNTANOMM=''' + DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString + ''' '
               + '       and TDIARID=''' + '09' + ''' '
               + '       and CNTCOMPROB=''' + xReg + ''' ';
            Try
               DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
               Screen.Cursor := crDefault;
            End;

            sSQL := ' Delete FROM CNT300 '
               + '     where CIAID=''' + DMFAC.cdsFact2.fieldbyname('CIAID').AsString + ''' '
               + '       and CNTANOMM=''' + DMFAC.cdsFact2.fieldbyname('FACANOMES').AsString + ''' '
               + '       and TDIARID=''' + '09' + ''' '
               + '       and CNTCOMPROB=''' + xReg + ''' ';
            Try
               DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
               Screen.Cursor := crDefault;
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
            FFactSGuia.TransferenciaCxC(xReg);
         End
         Else
         Begin
            FFactSGuia.TransferenciaCxC_VC(xReg);
         End;


      End;

   End;
   Screen.Cursor := crDefault;
End;
}
// Fin FAC-201806

Procedure TFFactSGuia.dbgDetFacCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   If (Field.FieldName = 'DFACCANTAT') Then
   Begin
      AFont.Color := clRed;
   End;

   If (DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString = 'N') Then
   Begin
      AFont.Color := clRed;
      ABrush.Color := $00C4E6E3;
   End;
End;

Procedure TFFactSGuia.dbgDetFacDblClick(Sender: TObject);
Var
   xFContenido: String;
   xCont: double;
   xSQL: String;
Begin
   If length(dblcdProf.Text) > 0 Then
   Begin
      ShowMessage('No se puede Modificar un artículo cuando el Documento' + chr(13)
         + 'se ha generado desde una proforma');
      exit;
   End;

// Si boleta fue Generada desde un Pago
   If DMFAC.cdsFact2.FieldByName('NUMDOCPAG').AsString <> '' Then
   Begin
      ShowMessage('No se puede Agregar un artículo cuando el Documento' + chr(13)
         + 'se ha generado Automaticamente desde un Pago');
      exit;
   End;

   If DMFAC.cdsDetFact2.FieldByname('CODCOM').AsString <> '' Then
   Begin
      ShowMessage('No se puede modificar Artículo, cuando es Generado de un Combo');
      exit;
   End;

   If sTipoRQS = 'C' Then
   Begin
      DMFAC.cdsTLPrecio.Locate('ARTID;ALMID', VarArrayOf([DMFAC.cdsDetFact2.FieldByName('ARTID').AsString, DMFAC.cdsDetFact2.FieldByName('ALMID').AsString]), []);

      xCont := 0;
      pnlRegistro.Width := 382;

      pnlRegistro.Left := 87;
      pnlRegistro.Top := 274;

      memDetArt.Visible := False;

      If btnActReg.Enabled And (DMFAC.cdsDetFact2.recordcount > 0) Then
      Begin
         InicializaCamposDetalle;

         If dblcLPrecio.Text = 'ESP' Then
         Begin
            dbePrecioG.enabled := True;
         End
         Else
         Begin
         End;

         DMFAC.cdsTLPrecio.Locate('ARTID;ALMID', VarArrayOf([DMFAC.cdsDetFact2.FieldByName('ARTID').AsString, DMFAC.cdsDetFact2.FieldByName('ALMID').AsString]), []);

         dblcdArticulo.LookupTable := DMFAC.cdsTLPrecio;
         dblcdArticulo.LookupField := 'ARTID';
         xLPrecio := True;
         dblcdArticulo.Selected.Clear;
         dblcdArticulo.Selected.Add('ARTID'#9'9'#9'Código');
         dblcdArticulo.Selected.Add('ARTDES'#9'40'#9'Artículo');
         dblcdArticulo.Selected.Add('UNMIDG'#9'5'#9'U.M');
         dblcdArticulo.Selected.Add('LPRETMONID'#9'3'#9'T.M.');
         dblcdArticulo.Selected.Add('LPREPREGMO'#9'9'#9'Precio S/IGV');
         dblcdArticulo.Selected.Add('PRECIO_PUB'#9'9'#9'Precio Publico');
         dblcdArticulo.Selected.Add('ALMID'#9'5'#9'Almacen');
         dblcdArticulo.Selected.Add('STKSACTG'#9'6'#9'Stock');

         xxReservaAnt := DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat;

         pnlDetalle.Enabled := False;
         pnlPie.Enabled := False;
         bbtnBuscaArt.Enabled := False;
         pnlRegistro.Visible := True;
         wInserta := False;
         xSQL := 'CIAID =' + QuotedStr(dblcCia.Text) + ' AND TINID =' + QuotedStr(dblcTInv.Text) + ' AND ARTID =' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
         bbtnKDXSerie.visible := ((wFSerie = 'S') And (DMFAC.BuscaQry('dspUltTGE', 'TGE205', 'FNSERIE,CONSIGNACION', xSQL, 'FNSERIE') = 'S'));
         If DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString = 'N' Then
         Begin
            pnlRegistro.Width := 640;
            memDetArt.Visible := False;
         End;

         lblConsignacion.Visible := False;
         If (dblcCia.Text = '04') And (DMFAC.cdsQry.FieldByName('CONSIGNACION').AsString = 'S') Then
            lblConsignacion.Visible := True;

         pnlRegistro.SetFocus;
         DMFAC.cdsDetFact2.Edit;
         xFlagInsert := False;
         dblcdArticulo.Text := DMFAC.cdsDetFact2.FieldByName('ARTID').AsString;
         dbeArticulo.Text := DMFAC.cdsDetFact2.FieldByName('ARTDES').AsString;

         sAlmacen := DMFAC.cdsDetFact2.FieldByName('ALMID').AsString;

         dbePrecioG.Text := FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat);
         xDto01 := DMFAC.cdsDetFact2.FieldByName('DFACDCTO').AsFloat;
         edtDsto2.Text := FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDCTO2').AsFloat);
         wFlagEdi := 'S';
         AperturaConsultaSaldos('S');
         If DMFAC.cdsDetFact2.FieldByName('UNMIDG').AsString <> '' Then
         Begin
            lblUMAG.Caption := DMFAC.cdsDetFact2.FieldByName('UNMIDG').AsString;
            dbeUmG.Text := DMFAC.cdsDetFact2.FieldByName('UNMIDG').AsString;
            If DMFAC.cdsDetFact2.FieldByName('DFACCONT').AsString = 'S' Then
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
            lblUMAG.Caption := DMFAC.cdsDetFact2.FieldByName('UNMIDU').AsString;
            lblUMAG.Caption := DMFAC.cdsDetFact2.FieldByName('UNMIDU').AsString;
            dbeUmG.Text := DMFAC.cdsDetFact2.FieldByName('UNMIDU').AsString;
            If DMFAC.cdsDetFact2.FieldByName('DFACCONT').AsString = 'S' Then
            Begin
               cbTipoUm.Enabled := False;
               cbTipoUm.ItemIndex := 1;
               AperturaConsultaSaldos(xFContenido)
            End;
         End;
         If DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat - trunc(DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat) > 0 Then
         Begin
            dbeCantUA.Text := FloatToStr(FRound(((DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat - trunc(DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat)) * xCont), 15, 0));
            dbeCantGA.Text := FloatToStr(trunc(DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat));
         End
         Else
         Begin
            dbeCantGA.Text := FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat);
            dbeCantUA.Text := '0';
         End;

         dbeImporte.Text := FloatToStr(FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat, 15, 4));
         If dbePorcentaje.text = '' Then
            edtDsto1.text := '0'
         Else
            edtDsto1.text := dbePorcentaje.text;

         If length(Trim(dbeCantGA.Text)) = 0 Then
         Begin
            dbeCantGA.Text := '0';
         End;

      // Inicio FAC-201806
      // 26/10/2018 cambia display de importes a 2 dígitos
         {
         dbeMontoDCTO1.text := FloatToStr(FRound(StrToFloat(dbeCantGA.text) * StrToFloat(dbePrecioG.text) * StrToFloat(edtDsto1.text) / 100, 15, 4));
         dbeMontoDCTO2.text := FloatToStr(FRound(((StrToFloat(dbePrecioG.text) * StrToFloat(dbeCantGA.text)) - StrToFloat(dbeMontoDCTO1.text)) * StrToFloat(edtDsto2.text) / 100, 15, 4));
         dbeImporteIGV.text := FloatToStr(FRound(StrToFloat(dbeImporte.text) * (1 + (StrToFloat(xImpTasa) / 100)), 15, 4));
         }
         dbeMontoDCTO1.text := FloatToStr(FRound(StrToFloat(dbeCantGA.text) * StrToFloat(dbePrecioG.text) * StrToFloat(edtDsto1.text) / 100, 15, 2));
         dbeMontoDCTO2.text := FloatToStr(FRound(((StrToFloat(dbePrecioG.text) * StrToFloat(dbeCantGA.text)) - StrToFloat(dbeMontoDCTO1.text)) * StrToFloat(edtDsto2.text) / 100, 15, 2));
         dbeImporteIGV.text := FloatToStr(FRound(StrToFloat(dbeImporte.text) * (1 + (StrToFloat(xImpTasa) / 100)), 15, 2));
      // Fin FAC-201806
         dbeMontoDCTO2Exit(self);

         dbeRed.Text := dbeImporteIGV.Text;

         lblObsequio.Visible := False;
         If StrToFloat(dbeImporteIGV.text) = 0 Then
            lblObsequio.Visible := True;

         dbeDGarantia.Text := DMFAC.cdsDetFact2.FieldByName('DFACGARAN').AsString;
         dblcdArticulo.Enabled := False;
         dbeCantGA.SetFocus;
      End;
   End
   Else
      If sTipoRQS = 'S' Then
      Begin
         If btnActReg.Enabled And (DMFAC.cdsDetFact2.RecordCount > 0) Then
         Begin
            InicializaCamposDetalle;

            pnlDetalle.Enabled := False;
            pnlPie.Enabled := False;
         // Inicio FAC-201806
         // 26/10/2018 inicuializa posición de panel
            pnlDetalleA.Left := 87;
            pnlDetalleA.Top := 274;
         // Fin FAC-201806

            pnlDetalleA.Width := 436;
            pnlDetalleA.Visible := True;
            pnlDetalleA.SetFocus;
            DMFAC.cdsDetFact2.Edit;
            xFlagInsert := False;
            memDetServ.Clear;
            wFlagEdi := 'S';
            dbeItem.Text := DMFAC.cdsDetFact2.FieldByName('DFACITEM').AsString;
            dblcdServicio.Text := DMFAC.cdsDetFact2.FieldByName('ARTID').AsString;
            memDetalle.Text := DMFAC.cdsDetFact2.FieldByName('ARTDES').AsString;

            dbePUnit.Text := FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat);
            dbeDscto.Text := FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDCTO2').AsFloat);
            dbeImpIgv.Text := FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMP1').AsFloat);
            dbeImp2.Text := FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMP2').AsFloat);
            dbeCnt.Text := FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat);
            dbeValVen.Text := FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat);
            edtAdq.Text := DMFAC.cdsDetFact2.FieldByName('TIPOADQ').AsString;
            dblcUMed.Text := DMFAC.cdsDetFact2.FieldByName('UNMIDG').AsString;
            edtUMed.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE130', 'UNMDES', 'UNMID=''' + dblcUMed.Text + '''', 'UNMDES');

            dbePUnitExit(Sender);
            dbeCnt.SetFocus;
         End;
      End;
End;

Procedure TFFactSGuia.dbgDetFacKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Var
   xCia, xClie, xArt: String;
   sSQL, cMsg, cComboE: String;
Begin
   If DMFAC.cdsDetFact2.RecordCount = 0 Then
      Exit;

   If btnActReg.Enabled = False Then exit;

   xCia := dblcCia.Text;

   xClie := dblcdAso.Text;

   xArt := DMFAC.cdsDetFact2.FieldByName('ARTID').AsString;
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If length(dblcdProf.Text) > 0 Then
      Begin
         ShowMessage('No se puede Eliminar un artículo cuando el Documento' + chr(13)
            + 'se ha generado desde una proforma');
         exit;
      End;

      cMsg := '¿ Esta Seguro de Eliminar Artículo ?';
      If DMFAC.cdsDetFact2.FieldByName('CODCOM').AsString <> '' Then
      Begin
         cMsg := '¿ Esta Seguro de Eliminar Combo ?';
         cComboE := DMFAC.cdsDetFact2.FieldByName('CODCOM').AsString;
      End;

      If Question(Caption, cMsg + #13 + #13 +
         'Desea Continuar') Then
      Begin
         BorrarRegistro;
      End;
   End;
End;

Procedure TFFactSGuia.bbtnRegresaClick(Sender: TObject);
Begin
   If DMFAC.cdsDetFact2.RecordCount > 0 Then
   Begin
      dblcTMon.Enabled := False;
      dblcLPrecio.Enabled := False;
      dblcFPago.Enabled := False;
   End
   Else
   Begin
      dblcTMon.Enabled := True;
      dblcLPrecio.Enabled := True;
      dblcFPago.Enabled := False;
   End;
   Screen.Cursor := crHourGlass;
   EstadoDeForma(0, DMFAC.cdsFact2.FieldByName('FACESTADO').AsString);
   DMFAC.cdsFact2.Edit;

   xRegresa := True;
   xRegresa := True;

   vCiaid := DMFAC.cdsFact2.FieldByName('CIAID').AsString;
   vClieid := DMFAC.cdsFact2.FieldByName('CLIEID').AsString;
   vFacserie := DMFAC.cdsFact2.FieldByName('FACSERIE').AsString;
   vNfac := DMFAC.cdsFact2.FieldByName('NFAC').AsString;
   vFacFecha := DMFAC.cdsFact2.FieldByName('FACFECHA').AsString;

   Screen.Cursor := crDefault;
End;

Procedure TFFactSGuia.Z2bbtnNuevoClick(Sender: TObject);
Begin
   xRegresa := False;
   xNoPasa := 'S';
End;

Procedure TFFactSGuia.GeneraMovKardex;
Var
   xTri, Ano, Mes, AnoMes, xSQL, xNumGuia, xSqlAlm: String;
   Y, M, D: Word;
Begin
   decodeDate(dtpFFac.Date, Y, M, D);
   Ano := IntToStr(Y);
   Mes := DMFAC.StrZero(IntToStr(M), 2);
   AnoMes := Ano + Mes;

// Observar el tipo de documento
   xTri := DMFAC.wTransVta;
   xNumGuia := DMFAC.cdsFact2.FieldByName('DOCID').AsString + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString + DMFAC.cdsFact2.FieldByName('NFAC').AsString;

// Inicio FAC-201806
// 31/10/2018 reordena sangría de script
   xSqlAlm := 'Select ALMID '
      + '        from FAC306 A '
      + '       where A.CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
      + '         and A.DOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + '         and A.FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
      + '         and A.NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString)
      + '       group by ALMID';
// Fin FAC-201806
   DMFAC.cdsAlmVar.Close;
   DMFAC.cdsAlmVar.DataRequest(xSqlAlm);
   DMFAC.cdsAlmVar.Open;

   DMFAC.BuscaFecha('TGE114', 'FECANO', 'FECHA', dtpFFac.date);

   DMFAC.cdsAlmVar.First;
   While Not DMFAC.cdsAlmVar.Eof Do
   Begin
      xSQL := 'Insert into LOG314(CIAID, LOCID, ALMID, NISAID, '
         + '                      TDAID, DOCID, TRIID, NISAFDOC, '
         + '                      NISATIP, NISAFREG, SITFREG, SITHREG, NISANDOC, '
         + '                      TINID, NISSIT, SITUACION, NISAUSER, NISANOMM, '
         + '                      CLIEID, TMONID, NISAOBS ) '
         + '   values ( '
         + QuotedStr(dblcCia.Text) + ', '
         + QuotedStr(dblcLocal.Text) + ', '
         + QuotedStr(DMFAC.cdsAlmVar.FieldByName('ALMID').AsString) + ', '
         + QuotedStr(xNumGuia) + ', '
         + QuotedStr(DMFAC.wTdaFid) + ', '
         + QuotedStr('') + ', '
         + QuotedStr(xTri) + ', '
         + QuotedStr(FormatDateTime(DMFAC.wFormatFecha, dtpFFac.date)) + ', '
         + QuotedStr('SALIDA') + ', '
         + QuotedStr(FormatDateTime(DMFAC.wFormatFecha, dtpFFac.Date)) + ', '
         + QuotedStr(FormatDateTime(DMFAC.wFormatFecha, xFecHoy)) + ', '
         + '             sysdate, '
         + QuotedStr('') + ', '
         + QuotedStr(dblcTInv.Text) + ', '
         + QuotedStr('ACEPTADO') + ', '
         + QuotedStr('ATENDIDO') + ', '
         + QuotedStr(DMFAC.wUsuario) + ','
         + QuotedStr(AnoMes) + ','
         + Quotedstr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString) + ','
         + Quotedstr(DMFAC.wTMonLoc) + ', '
         + Quotedstr('Factura Nro:' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString + DMFAC.cdsFact2.FieldByName('NFAC').AsString) + ' )';
      xSQL := UpperCase(xSQL);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         xMsgError := 'Error al intentar grabar Cabecera de Kardex';
         xContinuaGrab := False;
         exit;
      End;

      xSQL := 'Insert into LOG315( CIAID ,LOCID, ALMID , NISAID, TDAID,  KDXID, ARTID , NISATIP, SITUACION, '
         + '                       NISSIT, ARTPCG, TCAMB, ARTPVG, KDXCNTG, KDXPEDIDOG, ARTCONT, UNMIDG, UNMIDU, GRARID, FABID, '
         + '                       ARTSPRO, ARTSCA, ARTPARA, ARTSNA,  ARTACTIVO, CUENTAID, TINID, NISAFREG, KDXUSER, '
         + '                       KDXFREG, KDXHREG, KDXANO, KDXMM, KDXDD, KDXSEM, KDXSS, KDXANOMM, KDXAATRI, KDXAASEM, '
         + '                       KDXAASS, TRIID, ARTDES, TMONID, ARTPCU, KDXCNTU, KDXPEDIDOU, KDXTRI, ARTTOTALG, ARTTOTAL ) '
         + '   Select A.CIAID, A.LOCID, A.ALMID, ' + QuotedStr(xNumGuia) + ', ' + QuotedStr(DMFAC.wTdaFid) + ', '
         + '          A.DFACITEM, A.ARTID,' + QuotedStr('SALIDA') + ',' + QuotedStr('ATENDIDO') + ', ''ACEPTADO'', '
         + '          B.ARTPCG, A.DFACTCAM, B.ARTPVG, A.DFACCANTAT, A.DFACCANTG, B.ARTCONT, B.UNMIDG, B.UNMIDU,'
         + '          B.GRARID, B.FABID, B.ARTSPRO, B.ARTSCA, B.ARTPARA, B.ARTSNA, B.ARTACTIVO, B.CUENTAID,'
         + QuotedStr(dblcTInv.Text) + ',A.FACFECHA,' + QuotedStr(DMFAC.wUsuario) + ', A.FACFECHA, A.DFACHREG, '
         + QuotedStr(DMFAC.cdsUltTGE.FieldByName('FECANO').AsString) + ',' + QuotedStr(DMFAC.cdsUltTGE.FieldByName('FECMES').AsString) + ','
         + QuotedStr(DMFAC.cdsUltTGE.FieldByName('FECDIA').AsString) + ',' + QuotedStr(DMFAC.cdsUltTGE.FieldByName('FECSEM').AsString) + ','
         + QuotedStr(DMFAC.cdsUltTGE.FieldByName('FECSS').AsString) + ',' + QuotedStr(AnoMes) + ','
         + QuotedStr(DMFAC.cdsUltTGE.FieldByName('FECAATRI').AsString) + ',' + QuotedStr(DMFAC.cdsUltTGE.FieldByName('FECAASEM').AsString) + ','
         + QuotedStr(DMFAC.cdsUltTGE.FieldByName('FECAASS').AsString) + ',' + QuotedStr(xTri) + ',B.ARTDES,' + Quotedstr(DMFAC.wTMonLoc) + ',0,0,0, '
         + QuotedStr(DMFAC.cdsUltTGE.FieldByName('FECTRIM').AsString) + ',' + DMFAC.wReplacCeros
         + '          ( B.ARTCPROG,0)*A.DFACCANTAT ' + ',' + DMFAC.wReplacCeros + '( B.ARTCPROG,0)*A.DFACCANTAT '
         + '     from  FAC306 A, TGE205 B '
         + '    where A.CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
         + '      and A.LOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('LOCID').AsString)
         + '      and A.ALMID=' + QuotedStr(DMFAC.cdsAlmVar.FieldByName('ALMID').AsString)
         + '      and A.DOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
         + '      and A.FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
         + '      and A.NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString)
         + '      and B.CIAID=A.CIAID and B.TINID=' + QuotedStr(dblcTInv.Text) + ' and B.ARTID=A.ARTID';
      xSQL := UpperCase(xSQL);

      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         xMsgError := 'Error al intentar grabar Detalle de Kardex';
         xContinuaGrab := False;
         exit;
      End;

      DMFAC.cdsAlmVar.Next;
   End;
End;

Procedure TFFactSGuia.GeneraMovLOG314(xxUltReg, xxAno, xxMes, xxAnoMes, xxClie, xxCos, xxTri: String);
Var
   xSQL: String;
Begin
   xSQL := 'INSERT INTO LOG314(CIAID, LOCID, ALMID, NISAID, '
      + '                      TDAID, DOCID, TRIID, NISAFDOC, NISATIP, NISAFREG, SITFREG, SITHREG, NISANDOC, '
      + '                      TINID, NISSIT, SITUACION, '
      + '                      NISAUSER, NISANOMM, CLIEID, TMONID, NISAOBS) '
      + '   VALUES (' + QuotedStr(dblcCia.Text) + ','
      + QuotedStr(dblcLocal.Text) + ', '
      + QuotedStr(dblcAlmacen.Text) + ','
      + QuotedStr(xxUltReg) + ','
      + QuotedStr(DMFAC.wTdaFid) + ', '
      + QuotedStr('') + ','
      + QuotedStr(xxTri) + ','
      + QuotedStr(FormatDateTime(DMFAC.wFormatFecha, dtpFFac.date)) + ', '
      + QuotedStr('SALIDA') + ','
      + QuotedStr(FormatDateTime(DMFAC.wFormatFecha, xFecHoy)) + ','
      + QuotedStr(FormatDateTime(DMFAC.wFormatFecha, xFecHoy)) + ','
      + DMFAC.wRepTimeServi + ', '
      + QuotedStr('') + ','
      + QuotedStr(dblcTInv.Text) + ', '
      + QuotedStr('ACEPTADO') + ', '
      + QuotedStr('ATENDIDO') + ', '
      + QuotedStr(DMFAC.wUsuario) + ', '
      + QuotedStr(xxAnoMes) + ', '
      + Quotedstr(xxClie) + ', '
      + Quotedstr(DMFAC.wTMonLoc) + ','
      + Quotedstr('Factura Nro:' + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString
      + DMFAC.cdsFact2.FieldByName('NFAC').AsString) + ' )';
   xSQL := UpperCase(xSQL);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      xContinuaGrab := False;
      ShowMessage('No se pudo grabar en cabecera de Kardex');
   End;
End;

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
(*
Function TFFactSGuia.TransferenciaCXC(cNoReg: String): Boolean;
Var
   xCia, xClie, xCiaEnvCxC,
      xSerie, xNFac,
      xCuenta, xCPto, xTMEs, xTano,
      xCtaTot, xCPtoTot,
      xTipDet, xTReg, xTmonid: String;
   xIgvMO, xIgvMN, xIgvME,
      xIscMO, xIscMN, xIscME, xDH: String;
   xTotalMO, xTotalMN, xTotalME: String;
   xMtomo, xMtoMn, xMtoMe: String;
   xMtomo1, xMtoMn1, xMtoMe1: Double;
   xEmbMo, xEmbMn, xEmbMe: String; //Para embalajes
   xTDoc, xTDiar, xWhere, xSinIGV: String;
   wAno, wMes, wDia: Word;
   xMes, xNoReg, xSQL, vSQL, xNCia: String;
   nNoReg: integer;
   xTAutoNum, xxCcosId: String;
   xZip, xUSE, xAsoDir, xPais, xRuc, xAsoApeNom, xAsoApePat, xAsoApeMat, xAsoCodAux, xAsoCodMod, xDptoId, xCiudId, xTelef: String;
   xServicioMO, xServicioMN, xServicioME: String;
   rCount: integer;
   wExportacion: Boolean;
   xAnoMes, xCtaExp, xCtaExo, xCtaMN, xCtaMG : String;
Begin
   Result := False;

   xContinuaGrab := True;

   //////////Cabecera  Factura
   DecodeDate(DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime, wAno, wMes, wDia);

   If wMes < 10 Then
      xMes := '0' + inttostr(wMes)
   Else
      xMes := IntToStr(wMes);

   xTMes := xMes;
   xTAno := IntToStr(wAno);
   xTDoc := DMFAC.cdsFact2.FieldByName('DOCID').AsString;

   xTDiar := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'TDIARID', 'DOCID=' + QuotedStr(xTDoc), 'TDIARID');
   xTAutoNum := DMFAC.BuscaQry('dspUltTGE', 'TGE104', 'AUTONUM', 'TDIARID=' + QuotedStr(xTDiar), 'AUTONUM');

   xcptocab := FFactSGuia.GetDinamicaContable(DMFAC.cdsFact2.FieldByName('CIAID').AsString, DMFAC.cdsFact2.FieldByName('DOCID').AsString, DMFAC.cdsFact2.FieldByName('TMONID').AsString, DMFAC.cdsFact2.FieldByName('FPAGOID').AsString, '');

   xNoReg := DMFAC.UltimoRegistroCxC(xTAutoNum, DMFAC.cdsFact2.FieldByName('CIAID').Value, xTDiar, xTAno, xTMes);
   nNoReg := StrToInt(xNoReg);

   xNoReg := DMFAC.GrabaUltimoRegistro(xTAutoNum, DMFAC.cdsFact2.FieldByName('CIAID').Value, xTDiar, xTAno, xTMes, nNoReg);
   If xNoReg = 'N' Then
   Begin
      Result := False;
      exit;
   End;

   xNoReg := DMFAC.StrZero(xNoReg, 10);

   If cNoReg <> '' Then
      xNoReg := cNoReg;

   DMFAC.cdsFact2.DisableControls;
   xCia := DMFAC.cdsFact2.FieldByName('CIAID').AsString;
   If xCia = '02' Then xCia := '04';

   xClie := DMFAC.cdsFact2.FieldByName('CLIEID').AsString;
   xSerie := DMFAC.cdsFact2.FieldByName('FACSERIE').Value;
   xNFac := DMFAC.cdsFact2.FieldByName('NFAC').AsString;
   xTMonid := DMFAC.cdsFact2.FieldByName('TMONID').AsString;

   xIgvMO := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACIGVMO').AsFloat,15,4));
   xIgvMN := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACIGVMN').AsFloat,15,4));
   xIgvME := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACIGVME').AsFloat,15,4));

// Servicio
   If length(DMFAC.cdsFact2.FieldByName('FACSERMO').AsString) = 0 Then
   Begin
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('FACSERMO').AsString := '0';
      DMFAC.cdsFact2.Post;
   End;
   If length(DMFAC.cdsFact2.FieldByName('FACSERMN').AsString) = 0 Then
   Begin
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('FACSERMN').AsString := '0';
      DMFAC.cdsFact2.Post;
   End;
   If length(DMFAC.cdsFact2.FieldByName('FACSERME').AsString) = 0 Then
   Begin
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('FACSERME').AsString := '0';
      DMFAC.cdsFact2.Post;
   End;
   xServicioMO := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACSERMO').AsFloat,15,4));
   xServicioMN := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACSERMN').AsFloat,15,4));
   xServicioME := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACSERME').AsFloat,15,4));

// ISC
   xIscMO := DMFAC.cdsFact2.FieldByName('FACISCMO').AsString;
   xIscMN := DMFAC.cdsFact2.FieldByName('FACISCMN').AsString;
   xIscME := DMFAC.cdsFact2.FieldByName('FACISCME').AsString;

// Base Imponible

   xMtoMo := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat,15,4));
   xMtoMn := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACMTOMN').AsFloat,15,4));
   xMtoMe := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACMTOME').AsFloat,15,4));

   xEmbMo := DMFAC.cdsFact2.FieldByName('FACEMBMO').AsString;
   xEmbMn := DMFAC.cdsFact2.FieldByName('FACEMBMN').AsString;
   xEmbMe := DMFAC.cdsFact2.FieldByName('FACEMBME').AsString;

   If Length(Trim(xCiaEnviar)) > 0 Then
      xCiaEnvCxC := xCiaEnviar
   Else
      xCiaEnvCxC := DMFAC.cdsFact2.FieldByName('CIAID').AsString;

   If xCiaEnvCxC = '02' Then xCia := '04';

   If Length(xZonaAso) = 0 Then
      xZonaAso := '01';

   If cNoReg = '' Then
   Begin
      ActualizaClientes;
   End;

   xSQL := 'CIAID =' + Quotedstr(xCiaEnvCxC)
      + ' AND DOCID =' + Quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + ' AND TMONID =' + Quotedstr(DMFAC.cdsFact2.FieldByName('TMONID').AsString)
      + ' AND CPTOCCOMER =' + Quotedstr(DMFAC.cdsFact2.FieldByName('FPAGOID').AsString)
      + ' AND CPTOCABVTA=' + Quotedstr('S')
      + ' AND CPTOCAB = ' + Quotedstr(xcptocab);

   DMFAC.BuscaQry('dspUltTGE', 'CXC208', '*', xSQL, 'CPTOCAB');
   xNcia := DMFAC.cdsQry.FieldByName('CIAID').AsString;
   xCtaTot := DMFAC.cdsQry.FieldByName('CUENTAID').AsString;
   xCPtoTot := DMFAC.cdsQry.FieldByName('CPTOCAB').AsString;
   If Not GeneraRegistroCxC301(xCtaTot, xCptoTot, xNFac, xSerie, xClie, xNoreg, xTDiar, xTDoc) Then
      Exit;

   xTotalMO := floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat,15,4));
   xTotalMN := floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACTOTMN').AsFloat,15,4));
   xTotalME := floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACTOTME').AsFloat,15,4));

   xTotalMO := floattostr(FRound(FRound(DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACIGVMO').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACISCMO').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACSERMO').AsFloat,15,4),15,4));
   xTotalMN := floattostr(FRound(FRound(DMFAC.cdsFact2.FieldByName('FACMTOMN').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACIGVMN').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACISCMN').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACSERMN').AsFloat,15,4),15,4));
   xTotalME := floattostr(FRound(FRound(DMFAC.cdsFact2.FieldByName('FACMTOME').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACIGVME').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACISCME').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACSERME').AsFloat,15,4),15,4));

   xTipDet := '';
   xTReg := '';
   xDH := '';
   xTipDet := DMFAC.cdsQry.FieldByName('TIPDET').AsString;
   xCuenta := DMFAC.cdsQry.FieldByName('CUENTAID').AsString;
   xCPto := DMFAC.cdsQry.FieldByName('CPTOCAB').AsString;
   xDH := DMFAC.cdsQry.FieldByName('CCDH').AsString;
   xTReg := DMFAC.cdsQry.FieldByName('TREGID').AsString;
   xWhere := 'SELECT CTA_CCOS FROM TGE202 WHERE CIAID=' + QuotedStr(xCiaEnvCxC) + ' AND CUENTAID=' + QuotedStr(xCuenta);
   FiltraCDS(DMFAC.cdsReporte, xWhere);
   If DMFAC.cdsReporte.FieldByName('CTA_CCOS').AsString = 'S' Then
   Begin
      xWhere := 'SELECT UPROID, UPAGOID, USEID FROM APO201 ' +
         'WHERE ASOID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString);
      FiltraCDS(DMFAC.cdsReporte, xWhere);

      xWhere := 'SELECT CCOSID ' +
         'FROM APO101 ' +
         'WHERE UPROID=' + QuotedStr(DMFAC.cdsReporte.FieldByName('UPROID').AsString) + ' ' +
         'AND UPAGOID=' + QuotedStr(DMFAC.cdsReporte.FieldByName('UPAGOID').AsString) + ' ' +
         'AND USEID=' + QuotedStr(DMFAC.cdsReporte.FieldByName('USEID').AsString);
      FiltraCDS(DMFAC.cdsReporte, xWhere);

      xxCcosId := DMFAC.cdsReporte.FieldByName('CCOSID').AsString;
   End
   Else
      xxCcosId := '';
//
   If sTipoPago = 'VC' Then
      GeneraRegistroCxC302VC(xTipDet, xTReg, xTotalMO, xTotalMN, xTotalME, xCuenta, xCpto, xNFac, xSerie, xClie, xDH, xTDoc, xTDiar, xNoReg, xxCcosId, 1)
   Else
      GeneraRegistroCxC302(xTipDet, xTReg, xTotalMO, xTotalMN, xTotalME, xCuenta, xCpto, xNFac, xSerie, xClie, xDH, xTDoc, xTDiar, xNoReg, xxCcosId, 1);

   xWhere := 'TCLIEID=' + '''' + DMFAC.cdsFact2.FieldByName('FACTCLI').AsString + '''';
   DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEDES, TCLIEFLAG', xWhere, 'TCLIEDES');
   DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;

   xxCcosId := '';
   xCuenta := '';
   xCpto := '';
   xWhere := ' CIAID=' + Quotedstr(xCiaEnvCxC) + ' AND CPTOCAB=' + Quotedstr(xCPtoTot);


   If (xCia = '04') Then
   Begin
      If (DMFAC.cdsFact2.FieldByName('TIPOADQ').AsString = 'S') And
         (DMFAC.cdsFact2.FieldByName('FPAGOID').AsString <> '13') Then
      Begin
         xWhere := ' CIAID=' + Quotedstr(xCiaEnvCxC) + ' AND CPTOCAB=''0045''';
      End
   End;

   DMFAC.cdsQry6.IndexFieldNames := '';
   DMFAC.cdsQry6.Filter := '';
   xSQL := 'Select CIAID, TREGID, TREGDES, CUENTAID, CPTOID, CCDH, TASA, TIPDET, CPTOCAB, CCREG, CTA_DE_FAM_ART '
      + '     from DB2ADMIN.CXC102 '
      + '    where ' + xWhere;
   DMFAC.cdsQry6.Close;
   DMFAC.cdsQry6.DataRequest(xSQL);
   DMFAC.cdsQry6.Open;
   DMFAC.cdsQry6.IndexFieldNames := 'TIPDET';

// Selecciona Detalle de Comprobante
   xSQL := 'Select CIAID, LOCID, TINID, ALMID, CLIEID, FACSERIE, NFAC, CLAUXID, CLIERUC, VEID, GRARID, '
      + '          FAMID, SFAMID, TLISTAID, ARTID, UNMIDG, UNMABR, DFACCANTG, DFACPREUMO, DFACPREUMN, '
      + '          DFACPREUME, DFACDTOUMO, DFACDTOUMN, DFACDTOUME, DFACMTOMO, DFACMTOMN, DFACMTOME, '
      + '          DFACUSER, DFACFREG, DFACHREG, DFACANOMES, DFACAAAA, DFACMM, DFACDD, DFACTRI, DFACSEM, '
      + '          DFACSS, DFACAATRI, DFACAASEM, DFACAASS, DFACTCAM, TMONID, CLIECREMAX, DFACIGV, DFACISC, '
      + '          DFACDCTO, DFACESTADO, DFACCANTAT, DFACGARAN, FPAGOID, SERIE, NGUIA, UNMIDU, DFACFLAGRE, '
      + '          UNMIDO, DFACCOMLMO, DFACCOMLMN, DFACCOMLME, DFACFLAGV, DFACDCTO2, DFACDTOMO2, DFACDTOME2, '
      + '          DFACDTOMN2, DFACDCTO3, DFACDTOMO3, DFACDTOMN3, DFACDTOME3, CLIEDIRID, DFACDIRENT, DFACITEM, '
      + '          DOCID, DFACHOR, FACFECHA, DFACSALDO, DFACCONT, DFACPREVMO, DFACPREVMN, DFACPREVME, FACTIP, '
      + '          FACTCLI, TIPOADQ, DFACIMP1, DFACIMPMTO1, DFACIMP2, DFACIMPMTO2, ARTDES, DFACVTOTMO, DFACVTOTMN, '
      + '          DFACVTOTME, DFACIMPMTN1, DFACIMPMTE1, DFACIMPMTE2, DFACIMPMTN2, FACID, DFACTFLAG, FLAGVAR, CODCOM, '
      + '          DFACSERMO, DFACSERMN, DFACSERME, PORSER, ''N'' ES_MG, ''N'' ES_MN, ''N'' ES_EXP, ''N'' ES_EXO '
      + '     from DB2ADMIN.FAC306 '
      + '    where CIAID =' + QuotedStr(xCiaEnvCxC)
      + '      and DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + '      and FACSERIE =' + QuotedStr(xSerie)
      + '      and NFAC =' + QuotedStr(xNFac)
      + '    order by DFACITEM';
   DMFAC.cdsDetFact2.Close;
   DMFAC.cdsDetFact2.DataRequest(xSQL);
   DMFAC.cdsDetFact2.Open;

   wExportacion := False;
   If (xTipDocIdent = '07') Or (xTipDocIdent = '04') Then
      wExportacion := True;

   DecodeDate(DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime, wAno, wMes, wDia);

   If wMes < 10 Then
      xMes := '0' + inttostr(wMes)
   Else
      xMes := inttostr(wMes);
   xAnoMes := IntToStr(wAno) + xMes;

// Base Imponible
   rCount := 0;
   DMFAC.cdsDetFact2.First;
   While Not DMFAC.cdsDetFact2.EOF Do
   Begin
      xSQL := 'Select TINID, GRARID, FAMID, SFAMID, ARTIGV, ART_IGV_EXO '
         + '     from DB2ADMIN.TGE205 '
         + '    where CIAID='+quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
         + '      and ARTID='+quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
      DMFAC.cdsQry15.Close;
      DMFAC.cdsQry15.DataRequest(xSQL);
      DMFAC.cdsQry15.Open;
      If DMFAC.cdsQry15.RecordCount=0 Then
      Begin
         ShowMessage('No se encontró el artículo :'+quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString)+' en el Maestro de Artículos');
         xContinuaGrab := False;
         exit;
      End;

      If wExportacion Then
      Begin
         DMFAC.cdsDetFact2.Edit;
         DMFAC.cdsDetFact2.FieldByName('ES_EXP').AsString := 'S';
         DMFAC.cdsDetFact2.Post;
         xTipDet := 'ME';
      End
      Else
      Begin
         If DMFAC.cdsQry15.FieldByname('ARTIGV').AsString = 'N' Then
         Begin
         // Registrar Exonerado de IGV
            If DMFAC.cdsQry15.FieldByname('ART_IGV_EXO').AsString = 'S' Then
            Begin
               DMFAC.cdsDetFact2.Edit;
               DMFAC.cdsDetFact2.FieldByName('ES_EXO').AsString := 'S';
               DMFAC.cdsDetFact2.Post;
               xTipDet := 'ME';
            End
            Else
            Begin
               DMFAC.cdsDetFact2.Edit;
               DMFAC.cdsDetFact2.FieldByName('ES_MN').AsString := 'S';
               DMFAC.cdsDetFact2.Post;
               xTipDet := 'MN';
            End;
         End
         Else
         Begin
         // Para montos Gravados
            DMFAC.cdsDetFact2.Edit;
            DMFAC.cdsDetFact2.FieldByName('ES_MG').AsString := 'S';
            DMFAC.cdsDetFact2.Post;
            xTipDet := 'MG';
         End;
      End;

      DMFAC.cdsQry6.Setkey;
      DMFAC.cdsQry6.FieldByName('TIPDET').AsString := xTipDet;
      If not DMFAC.cdsQry6.GotoKey Then
      Begin
         ShowMessage('No se pudo actualizar el Detalle de CXC ('+xTipDet+' - no está en la Dinámica Contable)');
         xContinuaGrab := False;
         exit;
      End;
      xCuenta := DMFAC.cdsQry6.FieldByName('CUENTAID').AsString;
      If DMFAC.cdsQry6.FieldByName('CTA_DE_FAM_ART').AsString='S' Then
      Begin
         xSQL := 'Select CUENTAID '
            + '     from DB2ADMIN.TGE169 '
            + '    where CIAID='+quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
            + '      and TINID='+quotedstr(DMFAC.cdsQry15.FieldByName('TINID').AsString)
            + '      and GRARID='+quotedstr(DMFAC.cdsQry15.FieldByName('GRARID').AsString)
            + '      and FAMID='+quotedstr(DMFAC.cdsQry15.FieldByName('FAMID').AsString);
         DMFAC.cdsQry.Close;
         DMFAC.cdsQry.DataRequest(xSQL);
         DMFAC.cdsQry.Open;
         If DMFAC.cdsQry.RecordCount>0 Then
            xCuenta := DMFAC.cdsQry.FieldByName('CUENTAID').AsString;
      End;
      xCPto := DMFAC.cdsQry6.FieldByName('CPTOID').AsString;
      xDH := DMFAC.cdsQry6.FieldByName('CCDH').AsString;

      xSQL := 'Select CCMTOORI, CCMTOLOC, CCMTOEXT '
         + '     from DB2ADMIN.CXC302 '
         + '    where CIAID='+quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
         + '      and CCANOMES='+quotedstr(xAnoMes)
         + '      and TDIARID='+quotedstr(xTDiar)
         + '      and CCNOREG='+quotedstr(xNoReg)
         + '      and CPTOID='+quotedstr(xCPto)
         + '      and CUENTAID='+quotedstr(xCuenta)
         + '      and CCDH='+quotedstr(xDH)
         + '      and TIPDET='+quotedstr(xTipDet);
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      If DMFAC.cdsQry.Recordcount>0 Then
      Begin
         xSQL := 'Update DB2ADMIN.CXC302 '
            + '      Set CCMTOORI=CCMTOORI+'+floattostr(FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat,15,4))+', '
            + '          CCMTOLOC=CCMTOLOC+'+floattostr(FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat,15,4))+', '
            + '          CCMTOEXT=CCMTOEXT+'+floattostr(FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat,15,4))+' '
            + '    where CIAID='+quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
            + '      and CCANOMES='+quotedstr(xAnoMes)
            + '      and TDIARID='+quotedstr(xTDiar)
            + '      and CCNOREG='+quotedstr(xNoReg)
            + '      and CPTOID='+quotedstr(xCPto)
            + '      and CUENTAID='+quotedstr(xCuenta)
            + '      and CCDH='+quotedstr(xDH)
            + '      and TIPDET='+quotedstr(xTipDet);
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo actualizar el Detalle de CXC ('+xTipDet+')');
            xContinuaGrab := False;
            exit;
         End;
      End
      Else
      Begin
         xTReg := DMFAC.cdsQry6.FieldByName('TREGID').AsString;
         xMtoMo1 := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat,15,4);
         xMtoMN1 := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat,15,4);
         xMtoME1 := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat,15,4);
         rCount := rCount + 1;
         GeneraRegistroCxC302(xTipDet, xTReg, floattostr(xMtoMo1), floattostr(xMtoMN1), floattostr(xMtoME1), xCuenta, xCpto, xNFac, xSerie, xClie, xDH, xTDoc, xTDiar, xNoReg, xxCcosId, rCount);
         If Not xContinuaGrab Then Exit;
      End;
      DMFAC.cdsDetFact2.Next;
   End;

// Otros Montos distintos a Base Imponible

// Impuestos (IGV)
   If strtofloat(xIgvMO)>0 Then
   Begin
      xTipDet := 'I1';
      DMFAC.cdsQry6.Setkey;
      DMFAC.cdsQry6.FieldByName('TIPDET').AsString := xTipDet;
      If not DMFAC.cdsQry6.GotoKey Then
      Begin
         ShowMessage('No se pudo actualizar el Detalle de CXC ('+xTipDet+' - no está en la Dinámica Contable)');
         xContinuaGrab := False;
         exit;
      End;
      xTipDet := DMFAC.cdsQry6.FieldByName('TIPDET').AsString; //'MG', I1, ....
      xCPto := DMFAC.cdsQry6.FieldByName('CPTOID').AsString;
      xDH := DMFAC.cdsQry6.FieldByName('CCDH').AsString;
      xTReg := DMFAC.cdsQry6.FieldByName('TREGID').AsString;
      xCuenta := DMFAC.cdsQry6.FieldByName('CUENTAID').AsString;

      rCount := rCount + 1;
      GeneraRegistroCxC302(xTipDet, xTReg, xIgvMO, xIgvMN, xIgvME, xCuenta, xCpto, xNFac, xSerie, xClie, xDH, xTDoc, xTDiar, xNoReg, xxCcosId, rCount);
      If Not xContinuaGrab Then
      Begin
         exit;
      End;
   End;

// Servicios
   If strtofloat(xServicioMO)>0 Then
   Begin
      xTipDet := 'SV';
      DMFAC.cdsQry6.Setkey;
      DMFAC.cdsQry6.FieldByName('TIPDET').AsString := xTipDet;
      If not DMFAC.cdsQry6.GotoKey Then
      Begin
         ShowMessage('No se pudo actualizar el Detalle de CXC ('+xTipDet+' - no está en la Dinámica Contable)');
         xContinuaGrab := False;
         exit;
      End;
      xTipDet := DMFAC.cdsQry6.FieldByName('TIPDET').AsString; //'MG', I1, ....
      xCPto := DMFAC.cdsQry6.FieldByName('CPTOID').AsString;
      xDH := DMFAC.cdsQry6.FieldByName('CCDH').AsString;
      xTReg := DMFAC.cdsQry6.FieldByName('TREGID').AsString;
      xCuenta := DMFAC.cdsQry6.FieldByName('CUENTAID').AsString;

      rCount := rCount + 1;
      GeneraRegistroCxC302(xTipDet, xTReg, xServicioMO, xServicioMN, xServicioME, xCuenta, xCpto, xNFac, xSerie, xClie, xDH, xTDoc, xTDiar, xNoReg, xxCcosId, rCount);
      If Not xContinuaGrab Then
      Begin
         exit;
      End;
   End;

   ActualizaCabCXC(DMFAC.cdsFact2.FieldByName('CIAID').AsString, xTAno + xTMes, xTDiar, xNoReg, xNFac);
   DMFAC.cdsQry6.IndexFieldNames := '';

   DMFAC.cdsFact2.EnableControls;
   Result := True;
End;
*)
// Fin FAC-201806

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
(*
Function TFFactSGuia.TransferenciaCXC_VC(cNoReg: String): Boolean;
Var
   xCia, xClie, xCiaEnvCxC,
      xSerie, xNFac,
      xCuenta, xCPto, xTMEs, xTano,
      xCtaTot, xCPtoTot,
      xTipDet, xTReg, xTmonid: String;
   xIgvMO, xIgvMN, xIgvME,
      xIscMO, xIscMN, xIscME, xDH: String;
   xTotalMO, xTotalMN, xTotalME: String;
   xMtomo, xMtoMn, xMtoMe: String;
   xMtomo1, xMtoMn1, xMtoMe1: Double;
   xEmbMo, xEmbMn, xEmbMe: String; //Para embalajes
   xTDoc, xTDiar, xWhere, xSinIGV: String;
   wAno, wMes, wDia: Word;
   xMes, xNoReg, xSQL, vSQL, xNCia: String;
   nNoReg: integer;
   xTAutoNum, xxCcosId, xxFormaPago: String;
   xZip, xUSE, xAsoDir, xPais, xRuc, xAsoApeNom, xAsoApePat, xAsoApeMat, xAsoCodAux, xAsoCodMod, xDptoId, xCiudId, xTelef: String;
   xServicioMO, xServicioMN, xServicioME: String;

   rCount: integer;
   wExportacion: Boolean;
   xAnoMes : String;
Begin
   Result := False;

   xContinuaGrab := True;

   // Cabecera  Factura
   DecodeDate(DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime, wAno, wMes, wDia);

   If wMes < 10 Then
      xMes := '0' + inttostr(wMes)
   Else
      xMes := IntToStr(wMes);

   xTMes := xMes;
   xTAno := IntToStr(wAno);
   xTDoc := DMFAC.cdsFact2.FieldByName('DOCID').AsString;

   xTDiar := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'TDIARID', 'DOCID=' + QuotedStr(xTDoc), 'TDIARID');
   xTAutoNum := DMFAC.BuscaQry('dspUltTGE', 'TGE104', 'AUTONUM', 'TDIARID=' + QuotedStr(xTDiar), 'AUTONUM');

   xcptocab := FFactSGuia.GetDinamicaContable(DMFAC.cdsFact2.FieldByName('CIAID').AsString, DMFAC.cdsFact2.FieldByName('DOCID').AsString, DMFAC.cdsFact2.FieldByName('TMONID').AsString, DMFAC.cdsFact2.FieldByName('FPAGOID').AsString, '');

   xNoReg := DMFAC.UltimoRegistroCxC(xTAutoNum, DMFAC.cdsFact2.FieldByName('CIAID').Value, xTDiar, xTAno, xTMes);
   nNoReg := StrToInt(xNoReg);

   xNoReg := DMFAC.GrabaUltimoRegistro(xTAutoNum, DMFAC.cdsFact2.FieldByName('CIAID').Value, xTDiar, xTAno, xTMes, nNoReg);
   If xNoReg = 'N' Then
   Begin
      Result := False;
      exit;
   End;

   xNoReg := DMFAC.StrZero(xNoReg, 10);

   If cNoReg <> '' Then
      xNoReg := cNoReg;

   DMFAC.cdsFact2.DisableControls;
   xCia := DMFAC.cdsFact2.FieldByName('CIAID').AsString;
   If xCia = '02' Then xCia := '04';

   xClie := DMFAC.cdsFact2.FieldByName('CLIEID').AsString;
   xSerie := DMFAC.cdsFact2.FieldByName('FACSERIE').Value;
   xNFac := DMFAC.cdsFact2.FieldByName('NFAC').AsString;
   xTMonid := DMFAC.cdsFact2.FieldByName('TMONID').AsString;

   xIgvMO := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACIGVMO').AsFloat,15,4));
   xIgvMN := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACIGVMN').AsFloat,15,4));
   xIgvME := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACIGVME').AsFloat,15,4));

// Servicio
   If length(DMFAC.cdsFact2.FieldByName('FACSERMO').AsString) = 0 Then
   Begin
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('FACSERMO').AsString := '0';
      DMFAC.cdsFact2.Post;
   End;

   If length(DMFAC.cdsFact2.FieldByName('FACSERMN').AsString) = 0 Then
   Begin
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('FACSERMN').AsString := '0';
      DMFAC.cdsFact2.Post;
   End;

   If length(DMFAC.cdsFact2.FieldByName('FACSERME').AsString) = 0 Then
   Begin
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('FACSERME').AsString := '0';
      DMFAC.cdsFact2.Post;
   End;
   xServicioMO := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACSERMO').AsFloat,15,4));
   xServicioMN := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACSERMN').AsFloat,15,4));
   xServicioME := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACSERME').AsFloat,15,4));

// ISC
   xIscMO := DMFAC.cdsFact2.FieldByName('FACISCMO').AsString;
   xIscMN := DMFAC.cdsFact2.FieldByName('FACISCMN').AsString;
   xIscME := DMFAC.cdsFact2.FieldByName('FACISCME').AsString;

// Base Imponible
   xMtoMo := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat,15,4));
   xMtoMn := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACMTOMN').AsFloat,15,4));
   xMtoMe := Floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACMTOME').AsFloat,15,4));

   xEmbMo := DMFAC.cdsFact2.FieldByName('FACEMBMO').AsString;
   xEmbMn := DMFAC.cdsFact2.FieldByName('FACEMBMN').AsString;
   xEmbMe := DMFAC.cdsFact2.FieldByName('FACEMBME').AsString;

 // Cambio de tabla para conceptos  15/02/2002
 // Ahora se busca el cptocab y el ciaid en el cxc208
 // y luego con esos datos se filtra en el cxc102
 // y se arma el asiento de la factura

   If Length(Trim(xCiaEnviar)) > 0 Then
      xCiaEnvCxC := xCiaEnviar
   Else
      xCiaEnvCxC := DMFAC.cdsFact2.FieldByName('CIAID').AsString;

   //Inserta en TGE204 Según la Compañía
   //************************************
   //Para Grabar en el TGE204
   If Length(xZonaAso) = 0 Then
      xZonaAso := '01';

   If cNoReg = '' Then
   Begin
      ActualizaClientes;
   End;

   If DMFAC.cdsFact2.fieldbyname('FACESTADO').AsString = 'ANULADO' Then
   Begin
      xxFormaPago := ' ( ''01'' ) ';
   End
   Else
   Begin
         // LEER DE LA TABLA DE PAGOS PARA GENERAR DETALLE

      XSQL := 'Select A.CIAID, TIPPAG, DOCID, FACSERIE, NFAC, ITEM, FPAGOID, B.DCCOMDES, '
         + '          DOCPAG, SERDOCPAG, NUMDOCPAG, FECDOCPAG, TMONPAID, MTOPAGORI, '
         + '          MTODOCORI, MTODOCLOC, MTODOCEXT, BORRADO, USUARIO, FECREG '
         + '     from FAC_FOR_PAG A, TGE180 B '
         + '    Where A.CIAID=''' + DMFAC.cdsFact2.FieldByname('CIAID').AsString + ''' '
         + '      and DOCID=''' + DMFAC.cdsFact2.FieldByname('DOCID').AsString + ''' '
         + '      and FACSERIE=''' + DMFAC.cdsFact2.FieldByname('FACSERIE').AsString + ''' '
         + '      and NFAC=''' + DMFAC.cdsFact2.FieldByname('NFAC').AsString + ''' '
         + '      and NVL(BORRADO,''N'')=''N'' '
         + '      and A.CIAID=B.CIAID(+) AND A.FPAGOID=B.CCOMERID(+)';
      DMFAC.cdsQry20.Close;
      DMFAC.cdsQry20.DataRequest(xSQL);
      DMFAC.cdsQry20.Open;

      If DMFAC.cdsQry20.Recordcount <= 0 Then
      Begin
         ShowMessage('No hay Forma de Pago para '
            + '  DOCUMENTO=' + quotedstr(DMFAC.cdsFact2.FieldByname('DOCID').AsString) + chr(13)
            + '  SERIE=' + quotedstr(DMFAC.cdsFact2.FieldByname('FACSERIE').AsString) + chr(13)
            + '  FACTURA=' + quotedstr(DMFAC.cdsFact2.FieldByname('NFAC').AsString));
         xContinuaGrab := False;
         Exit;
      End;

      xxFormaPago := ' ( ';
      While Not DMFAC.cdsQry20.Eof Do
      Begin
         xxFormaPago := xxFormaPago + '''' + DMFAC.cdsQry20.FieldByname('fpagoid').AsString + ''', ';
         DMFAC.cdsQry20.next;
      End;

      xxFormaPago := Copy(xxFormaPago, 1, Length(xxFormaPago) - 2) + ' ) ';
   End;

   xSQL := 'CIAID =' + Quotedstr(xCiaEnvCxC)
      + ' AND DOCID =' + Quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + ' AND TMONID =' + Quotedstr(DMFAC.cdsFact2.FieldByName('TMONID').AsString)
      + ' AND CPTOCCOMER in ' + xxFormaPago
      + ' AND CPTOCABVTA=' + Quotedstr('S');

   DMFAC.BuscaQry('dspUltTGE', 'CXC208', '*', xSQL, 'CPTOCAB');
   xNcia := DMFAC.cdsQry.FieldByName('CIAID').AsString;
   xCtaTot := DMFAC.cdsQry.FieldByName('CUENTAID').AsString;
   xCPtoTot := DMFAC.cdsQry.FieldByName('CPTOCAB').AsString;

   xTipDet := '';
   xTReg := '';
   xDH := '';
   xTipDet := DMFAC.cdsQry.FieldByName('TIPDET').AsString;
   xCuenta := DMFAC.cdsQry.FieldByName('CUENTAID').AsString;
   xCPto := DMFAC.cdsQry.FieldByName('CPTOCAB').AsString;
   xDH := DMFAC.cdsQry.FieldByName('CCDH').AsString;
   xTReg := DMFAC.cdsQry.FieldByName('TREGID').AsString;

   If length(trim(xCPtoTot))=0 Then
   Begin
      ShowMessage('No hay concepto definido para '+xSQL);
      xContinuaGrab := False;
      Exit;
   End;

   If Not GeneraRegistroCxC301(xCtaTot, xCptoTot, xNFac, xSerie, xClie, xNoreg, xTDiar, xTDoc) Then
      Exit;

   xTotalMO := floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat,15,4));
   xTotalMN := floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACTOTMN').AsFloat,15,4));
   xTotalME := floattostr(FRound(DMFAC.cdsFact2.FieldByName('FACTOTME').AsFloat,15,4));

   xTotalMO := floattostr(FRound(FRound(DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACIGVMO').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACISCMO').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACSERMO').AsFloat,15,4),15,4));
   xTotalMN := floattostr(FRound(FRound(DMFAC.cdsFact2.FieldByName('FACMTOMN').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACIGVMN').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACISCMN').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACSERMN').AsFloat,15,4),15,4));
   xTotalME := floattostr(FRound(FRound(DMFAC.cdsFact2.FieldByName('FACMTOME').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACIGVME').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACISCME').AsFloat,15,4) +
               FRound(DMFAC.cdsFact2.FieldByName('FACSERME').AsFloat,15,4),15,4));

   xWhere := 'SELECT CTA_CCOS FROM TGE202 WHERE CIAID=' + QuotedStr(xCiaEnvCxC) + ' AND CUENTAID=' + QuotedStr(xCuenta);
   FiltraCDS(DMFAC.cdsReporte, xWhere);
   If DMFAC.cdsReporte.FieldByName('CTA_CCOS').AsString = 'S' Then
   Begin
      xWhere := 'SELECT UPROID, UPAGOID, USEID FROM APO201 ' +
         'WHERE ASOID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString);
      FiltraCDS(DMFAC.cdsReporte, xWhere);

      xWhere := 'Select CCOSID '
         + '  from APO101 '
         + ' where UPROID=' + QuotedStr(DMFAC.cdsReporte.FieldByName('UPROID').AsString)
         + '   and UPAGOID=' + QuotedStr(DMFAC.cdsReporte.FieldByName('UPAGOID').AsString)
         + '   and USEID=' + QuotedStr(DMFAC.cdsReporte.FieldByName('USEID').AsString);
      FiltraCDS(DMFAC.cdsReporte, xWhere);

      xxCcosId := DMFAC.cdsReporte.FieldByName('CCOSID').AsString;
   End
   Else
      xxCcosId := '';

   xContinuaGrab := True;

   If sTipoPago = 'VC' Then
   Begin
      GeneraRegistroCxC302VC(xTipDet, xTReg, xTotalMO, xTotalMN, xTotalME, xCuenta, xCpto, xNFac, xSerie, xClie, xDH, xTDoc, xTDiar, xNoReg, xxCcosId, 1)
   End
   Else
      GeneraRegistroCxC302(xTipDet, xTReg, xTotalMO, xTotalMN, xTotalME, xCuenta, xCpto, xNFac, xSerie, xClie, xDH, xTDoc, xTDiar, xNoReg, xxCcosId, 1);
   If Not xContinuaGrab Then
   Begin
      exit;
   End;

   xWhere := 'TCLIEID=' + '''' + DMFAC.cdsFact2.FieldByName('FACTCLI').AsString + '''';
   DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEDES, TCLIEFLAG', xWhere, 'TCLIEDES');
   DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;

   xxCcosId := '';
   xCuenta := '';
   xCpto := '';
   xWhere := ' CIAID=' + Quotedstr(xCiaEnvCxC) + ' AND CPTOCAB=' + Quotedstr(xCPtoTot);

   DMFAC.cdsQry6.IndexFieldNames := '';
   DMFAC.cdsQry6.Filter := '';
   xSQL := 'Select CIAID, TREGID, TREGDES, CUENTAID, CPTOID, CCDH, TASA, TIPDET, CPTOCAB, CCREG, CTA_DE_FAM_ART '
      + '     from DB2ADMIN.CXC102 '
      + '    where ' + xWhere;
   DMFAC.cdsQry6.Close;
   DMFAC.cdsQry6.DataRequest(xSQL);
   DMFAC.cdsQry6.Open;
   DMFAC.cdsQry6.IndexFieldNames := 'TIPDET';

// Lee detalle de Comprobante.
   xSQL := 'Select CIAID, LOCID, TINID, ALMID, CLIEID, FACSERIE, NFAC, CLAUXID, CLIERUC, VEID, GRARID, '
      + '          FAMID, SFAMID, TLISTAID, ARTID, UNMIDG, UNMABR, DFACCANTG, DFACPREUMO, DFACPREUMN, '
      + '          DFACPREUME, DFACDTOUMO, DFACDTOUMN, DFACDTOUME, DFACMTOMO, DFACMTOMN, DFACMTOME, '
      + '          DFACUSER, DFACFREG, DFACHREG, DFACANOMES, DFACAAAA, DFACMM, DFACDD, DFACTRI, DFACSEM, '
      + '          DFACSS, DFACAATRI, DFACAASEM, DFACAASS, DFACTCAM, TMONID, CLIECREMAX, DFACIGV, DFACISC, '
      + '          DFACDCTO, DFACESTADO, DFACCANTAT, DFACGARAN, FPAGOID, SERIE, NGUIA, UNMIDU, DFACFLAGRE, '
      + '          UNMIDO, DFACCOMLMO, DFACCOMLMN, DFACCOMLME, DFACFLAGV, DFACDCTO2, DFACDTOMO2, DFACDTOME2, '
      + '          DFACDTOMN2, DFACDCTO3, DFACDTOMO3, DFACDTOMN3, DFACDTOME3, CLIEDIRID, DFACDIRENT, DFACITEM, '
      + '          DOCID, DFACHOR, FACFECHA, DFACSALDO, DFACCONT, DFACPREVMO, DFACPREVMN, DFACPREVME, FACTIP, '
      + '          FACTCLI, TIPOADQ, DFACIMP1, DFACIMPMTO1, DFACIMP2, DFACIMPMTO2, ARTDES, DFACVTOTMO, DFACVTOTMN, '
      + '          DFACVTOTME, DFACIMPMTN1, DFACIMPMTE1, DFACIMPMTE2, DFACIMPMTN2, FACID, DFACTFLAG, FLAGVAR, CODCOM, '
      + '          DFACSERMO, DFACSERMN, DFACSERME, PORSER, ''N'' ES_MG, ''N'' ES_MN, ''N'' ES_EXP, ''N'' ES_EXO '
      + '     from DB2ADMIN.FAC306 '
      + '    where CIAID =' + QuotedStr(xCiaEnvCxC)
      + '      and DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + '      and FACSERIE =' + QuotedStr(xSerie)
      + '      and NFAC =' + QuotedStr(xNFac)
      + '    order by DFACITEM';
   DMFAC.cdsDetFact2.Close;
   DMFAC.cdsDetFact2.DataRequest(xSQL);
   DMFAC.cdsDetFact2.Open;

   wExportacion := False;
   // Incluir solo para compañía 14
   If (xCiaEnvCxC = '14') And ((xTipDocIdent = '07') Or (xTipDocIdent = '04')) Then
      wExportacion := True;

   DecodeDate(DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime, wAno, wMes, wDia);

   If wMes < 10 Then
      xMes := '0' + inttostr(wMes)
   Else
      xMes := inttostr(wMes);
   xAnoMes := IntToStr(wAno) + xMes;

// Base Imponible
   rCount := 0;
   DMFAC.cdsDetFact2.First;
   While Not DMFAC.cdsDetFact2.EOF Do
   Begin
      xSQL := 'Select TINID, GRARID, FAMID, SFAMID, ARTIGV, ART_IGV_EXO '
         + '     from DB2ADMIN.TGE205 '
         + '    where CIAID='+quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
         + '      and ARTID='+quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
      DMFAC.cdsQry15.Close;
      DMFAC.cdsQry15.DataRequest(xSQL);
      DMFAC.cdsQry15.Open;
      If DMFAC.cdsQry15.RecordCount=0 Then
      Begin
         ShowMessage('No se encontró el artículo :'+quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString)+' en el Maestro de Artículos');
         xContinuaGrab := False;
         exit;
      End;

      If wExportacion Then
      Begin
         DMFAC.cdsDetFact2.Edit;
         DMFAC.cdsDetFact2.FieldByName('ES_EXP').AsString := 'S';
         DMFAC.cdsDetFact2.Post;
         xTipDet := 'ME';
      End
      Else
      Begin
         If DMFAC.cdsQry15.FieldByname('ARTIGV').AsString = 'N' Then
         Begin
         // Registrar Exonerado de IGV
            If DMFAC.cdsQry15.FieldByname('ART_IGV_EXO').AsString = 'S' Then
            Begin
               DMFAC.cdsDetFact2.Edit;
               DMFAC.cdsDetFact2.FieldByName('ES_EXO').AsString := 'S';
               DMFAC.cdsDetFact2.Post;
               xTipDet := 'ME';
            End
            Else
            Begin
               DMFAC.cdsDetFact2.Edit;
               DMFAC.cdsDetFact2.FieldByName('ES_MN').AsString := 'S';
               DMFAC.cdsDetFact2.Post;
               xTipDet := 'MN';
            End;
         End
         Else
         Begin
         // Para montos Gravados
            DMFAC.cdsDetFact2.Edit;
            DMFAC.cdsDetFact2.FieldByName('ES_MG').AsString := 'S';
            DMFAC.cdsDetFact2.Post;
            xTipDet := 'MG';
         End;
      End;

      DMFAC.cdsQry6.Setkey;
      DMFAC.cdsQry6.FieldByName('TIPDET').AsString := xTipDet;
      If not DMFAC.cdsQry6.GotoKey Then
      Begin
         ShowMessage('No se pudo actualizar el Detalle de CXC ('+xTipDet+' - no está en la Dinámica Contable)');
         xContinuaGrab := False;
         exit;
      End;
      xCuenta := DMFAC.cdsQry6.FieldByName('CUENTAID').AsString;
      If DMFAC.cdsQry6.FieldByName('CTA_DE_FAM_ART').AsString='S' Then
      Begin
         xSQL := 'Select CUENTAID '
            + '     from DB2ADMIN.TGE169 '
            + '    where CIAID='+quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
            + '      and TINID='+quotedstr(DMFAC.cdsQry15.FieldByName('TINID').AsString)
            + '      and GRARID='+quotedstr(DMFAC.cdsQry15.FieldByName('GRARID').AsString)
            + '      and FAMID='+quotedstr(DMFAC.cdsQry15.FieldByName('FAMID').AsString);
         DMFAC.cdsQry.Close;
         DMFAC.cdsQry.DataRequest(xSQL);
         DMFAC.cdsQry.Open;
         If DMFAC.cdsQry.RecordCount>0 Then
            xCuenta := DMFAC.cdsQry.FieldByName('CUENTAID').AsString;
      End;
      xCPto := DMFAC.cdsQry6.FieldByName('CPTOID').AsString;
      xDH := DMFAC.cdsQry6.FieldByName('CCDH').AsString;

      xSQL := 'Select CCMTOORI, CCMTOLOC, CCMTOEXT '
         + '     from DB2ADMIN.CXC302 '
         + '    where CIAID='+quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
         + '      and CCANOMES='+quotedstr(xAnoMes)
         + '      and TDIARID='+quotedstr(xTDiar)
         + '      and CCNOREG='+quotedstr(xNoReg)
         + '      and CPTOID='+quotedstr(xCPto)
         + '      and CUENTAID='+quotedstr(xCuenta)
         + '      and CCDH='+quotedstr(xDH)
         + '      and TIPDET='+quotedstr(xTipDet);
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      If DMFAC.cdsQry.Recordcount>0 Then
      Begin
         xSQL := 'Update DB2ADMIN.CXC302 '
            + '      Set CCMTOORI=CCMTOORI+'+floattostr(FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat,15,4))+', '
            + '          CCMTOLOC=CCMTOLOC+'+floattostr(FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat,15,4))+', '
            + '          CCMTOEXT=CCMTOEXT+'+floattostr(FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat,15,4))+' '
            + '    where CIAID='+quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
            + '      and CCANOMES='+quotedstr(xAnoMes)
            + '      and TDIARID='+quotedstr(xTDiar)
            + '      and CCNOREG='+quotedstr(xNoReg)
            + '      and CPTOID='+quotedstr(xCPto)
            + '      and CUENTAID='+quotedstr(xCuenta)
            + '      and CCDH='+quotedstr(xDH)
            + '      and TIPDET='+quotedstr(xTipDet);
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo actualizar el Detalle de CXC ('+xTipDet+')');
            xContinuaGrab := False;
            exit;
         End;
      End
      Else
      Begin
         xTReg := DMFAC.cdsQry6.FieldByName('TREGID').AsString;
         xMtoMo1 := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat,15,4);
         xMtoMN1 := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat,15,4);
         xMtoME1 := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat,15,4);

         rCount := rCount + 1;
         GeneraRegistroCxC302(xTipDet, xTReg, floattostr(xMtoMo1), floattostr(xMtoMN1), floattostr(xMtoME1), xCuenta, xCpto, xNFac, xSerie, xClie, xDH, xTDoc, xTDiar, xNoReg, xxCcosId, rCount);
         If Not xContinuaGrab Then Exit;
      End;
      DMFAC.cdsDetFact2.Next;
   End;

// Otros Montos distintos a Base Imponible

// Impuestos (IGV)
   If strtofloat(xIgvMO)>0 Then
   Begin
      xTipDet := 'I1';
      DMFAC.cdsQry6.Setkey;
      DMFAC.cdsQry6.FieldByName('TIPDET').AsString := xTipDet;
      If not DMFAC.cdsQry6.GotoKey Then
      Begin
         ShowMessage('No se pudo actualizar el Detalle de CXC ('+xTipDet+' - no está en la Dinámica Contable)');
         xContinuaGrab := False;
         exit;
      End;
      xTipDet := DMFAC.cdsQry6.FieldByName('TIPDET').AsString; //'MG', I1, ....
      xCPto := DMFAC.cdsQry6.FieldByName('CPTOID').AsString;
      xDH := DMFAC.cdsQry6.FieldByName('CCDH').AsString;
      xTReg := DMFAC.cdsQry6.FieldByName('TREGID').AsString;
      xCuenta := DMFAC.cdsQry6.FieldByName('CUENTAID').AsString;

      rCount := rCount + 1;
      GeneraRegistroCxC302(xTipDet, xTReg, xIgvMO, xIgvMN, xIgvME, xCuenta, xCpto, xNFac, xSerie, xClie, xDH, xTDoc, xTDiar, xNoReg, xxCcosId, rCount);
      If Not xContinuaGrab Then
      Begin
         exit;
      End;
   End;

// Servicios
   If strtofloat(xServicioMO)>0 Then
   Begin
      xTipDet := 'SV';
      DMFAC.cdsQry6.Setkey;
      DMFAC.cdsQry6.FieldByName('TIPDET').AsString := xTipDet;
      If not DMFAC.cdsQry6.GotoKey Then
      Begin
         ShowMessage('No se pudo actualizar el Detalle de CXC ('+xTipDet+' - no está en la Dinámica Contable)');
         xContinuaGrab := False;
         exit;
      End;
      xTipDet := DMFAC.cdsQry6.FieldByName('TIPDET').AsString; //'MG', I1, ....
      xCPto := DMFAC.cdsQry6.FieldByName('CPTOID').AsString;
      xDH := DMFAC.cdsQry6.FieldByName('CCDH').AsString;
      xTReg := DMFAC.cdsQry6.FieldByName('TREGID').AsString;
      xCuenta := DMFAC.cdsQry6.FieldByName('CUENTAID').AsString;

      rCount := rCount + 1;
      GeneraRegistroCxC302(xTipDet, xTReg, xServicioMO, xServicioMN, xServicioME, xCuenta, xCpto, xNFac, xSerie, xClie, xDH, xTDoc, xTDiar, xNoReg, xxCcosId, rCount);
      If Not xContinuaGrab Then
      Begin
         exit;
      End;
   End;

   ActualizaCabCXC(DMFAC.cdsFact2.FieldByName('CIAID').AsString, xTAno + xTMes, xTDiar, xNoReg, xNFac);
   If Not xContinuaGrab Then
      Exit;
   DMFAC.cdsQry.IndexFieldNames := '';
   DMFAC.cdsFact2.EnableControls;
   Result := True;
End;
*)
// Fin FAC-201806

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
(*
Function TFFactSGuia.GeneraRegistroCxC301(xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxNoReg, xxTDiar, xxTDoc: String): Boolean;
Var
   sSQL, xSQL, xAnoMes, xmes: String;
   wAno, wMes, wDia: word;
Begin
   Result := False;

   sFecha := FormatDateTime(DMFAC.wFormatFecha, xFecHoy);

   DecodeDate(DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime, wAno, wMes, wDia);

   If wMes < 10 Then
      xMes := '0' + inttostr(wMes)
   Else
      xMes := inttostr(wMes);
   xAnoMes := IntToStr(wAno) + xMes;

// GRABA MONTO EXONERADO DE IGV
   xSQL := 'INSERT INTO CXC301 (CIAID, CCANOMES, TDIARID, CCNOREG, '
      + '                       CCFCMPRB, CLAUXID, CLIEID, CLIERUC, DOCID, CCSERIE, '
      + '                       CCNODOC, CCFEMIS, CCFVCMTO, TMONID, FLAGVAR, CCTCAMPR, CCTCAMAJ, '
      + '                       CCESTADO, CC_CONTA, VEID, CCOMERID, CCGRAVAD, CCNOGRAV, TVTAID, '
      + '                       CCPEDIDO, CCIGV, CCISC, CCFLETE, CCMTOORI, CCMTOLOC, CCMTOEXT, '
      + '                       CCSALORI, CCSALLOC, CCSALEXT, CCPTOTOT, CTATOTAL, '
      + '                       CCAASEM, CCAAAA, CCMM, CCDD, CCTRI, CCSEM, CCSS, '
      + '                       CCAATRI, CCAASS, CCUSER, CCFREG, CCHREG, CLIEDES, '
      + '                       CCFLAGVTA, UBIID,ZVTAID,COMPROMET, CXC_IMP_EXO) ';

   If Length(Trim(xCiaEnviar)) > 0 Then
      xSQL := xSQL + ' ( SELECT ' + QuotedStr(xCiaEnviar) + ', ' + Quotedstr(xAnoMes) + ',' + Quotedstr(xxTDiar) + ', '
   Else
      xSQL := xSQL + ' ( SELECT A.CIAID,' + Quotedstr(xAnoMes) + ',' + Quotedstr(xxTDiar) + ', ';

   xSQL := xSQL + Quotedstr(xxNoReg) + ','
      + '   A.FACFECHA, A.CLAUXID, A.CLIEID , A.CLIERUC, ' + Quotedstr(xxTDoc) + ','
      + 'A.FACSERIE, A.NFAC, A.FACFECHA, A.FACFEVCMTO, A.TMONID, ''.'', '
      + 'A.FACTCAM, A.FACTCAM, ' + Quotedstr('P') + ',' + Quotedstr('N') + ','
      + 'A.VEID, A.FPAGOID, B.CCGRAVAD, B.CCNOGRAV, A.TIPVTAID, A.PEDIDO,'
      + 'A.FACIGVMO, A.FACISCMO, A.FACEMBMO ';
// Totales
   xSQL := xSQL + ',' + 'A.FACTOTMO, A.FACTOTMN, A.FACTOTME,';
// Saldos
   xSQL := xSQL + 'A.FACTOTMO, A.FACTOTMN, A.FACTOTME,';

   xSQL := xSQL + Quotedstr(xxCpto) + ', ' + Quotedstr(xxCuenta) + ', A.FACAASEM, A.FACAAAA, A.FACMM, '
      + 'A.FACDD, A.FACTRI, A.FACSEM, A.FACSS, A.FACAATRI, A.FACAASS, A.FACUSER, '
      + DMFAC.wRepFuncDate + QuotedStr(sFecha) + '), '
      + 'A.FACHREG, A.CLIEDES, ' + Quotedstr('S') + ',' + Quotedstr(DMFAC.wOfid) + ', A.ZONVTAID' + ',''NA'', CCEXONER '
      + ' FROM  FAC305 A ';

   xSQL := xSQL + ', ( select sum(case when dfacimpmto1<>0 then dfacmtomo else 0 end ) CCGRAVAD, '
      + '           sum(case when DFACIMPMTO1=0 and NVL(R.ART_IGV_EXO,''N'')=''N'' then DFACMTOMO else 0 end ) CCNOGRAV, '
      + '           sum(case when DFACIMPMTO1=0 AND NVL(R.ART_IGV_EXO,''N'')=''S'' THEN DFACMTOMO ELSE 0 END ) CCEXONER  '
      + '      From FAC306 D, TGE205 R '
      + '     Where NFAC=' + Quotedstr(xxNFac) + ' and FACSERIE=' + Quotedstr(xxSerie) + ' '
      + '       and CLIEID=' + Quotedstr(xxClie) + ' and DOCID=' + Quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + '       and D.CIAID=R.CIAID(+) AND D.ARTID=R.ARTID(+) '
      + '   ) B ';
   xSQL := xSQL + 'where A.NFAC=' + Quotedstr(xxNFac)
      + '  and A.FACSERIE = ' + Quotedstr(xxSerie)
      + '  and A.CLIEID=' + Quotedstr(xxClie)
      + '  and A.DOCID=' + Quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString) + ' )';
   xSQL := UpperCase(xSQL);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Result := True;
   Except
      xContinuaGrab := False;
      ShowMessage('Error al momento de grabar en Cuentas por Cobrar (CXC301)');
      Result := False;
      Screen.Cursor := crDefault;
      exit;
   End;
End;
*)
// Fin FAC-201806

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
(*
Procedure TFFactSGuia.GeneraRegistroCxC302(xxTipDet, xxTReg, xxMontoMO, xxMontoMN, xxMontoME, xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxDH, xxTDoc, xxTDiar, xxNoReg, xxCcosId: String; xCount: integer);
Var
   sSQL, xSQL, xWhere, xxGlosa: String;
   xAnoMes, xmes: String;
   wano, wMes, wDia: word;
Begin

   sFecha := FormatDateTime(DMFAC.wFormatFecha, xFecHoy);

   DecodeDate(DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime, wAno, wMes, wDia);

   If wMes < 10 Then
      xMes := '0' + inttostr(wMes)
   Else
      xMes := inttostr(wMes);
   xAnoMes := IntToStr(wAno) + xMes;

   If Length(xxCuenta) > 0 Then
   Begin
      xWhere := 'SELECT * FROM CXC201 WHERE CIAID=' + QuotedStr(xCiaEnviar) + ' ' +
         'AND CPTOID=' + QuotedStr(xxCpto);

      DMFAC.cdsReporte.Close;
      DMFAC.cdsReporte.DataRequest(xWhere);
      DMFAC.cdsReporte.Open;
      xxGlosa := DMFAC.cdsReporte.FieldByName('CPTODES').AsString;
   End
   Else
      xxGlosa := '';

   xSQL := 'INSERT INTO CXC302 (CIAID, CCANOMES, TDIARID, CCNOREG, '
      + '                    CPTOID, CUENTAID, CLAUXID, CLIEID, CLIERUC, DOCID, '
      + '                    CCSERIE, CCNODOC, CCGLOSA, CCDH,TMONID, CCTCAMPR, '
      + '                    CCMTOORI, CCMTOLOC,CCMTOEXT, CCFEMIS, CCFCOMP, '
      + '                    CCESTADO,CCAAAA, CCMM, CCDD, CCTRI, CCSEM, CCSS, '
      + '                    CCAATRI,CCAASEM, CCAASS,CCUSER, CCFREG, CCHREG, '
      + '                    TREGID, TIPDET, CCOSID, CCFVCMTO,CCREG ) ';
   If Length(Trim(xCiaEnviar)) > 0 Then
      xSQL := xSQL + ' SELECT ' + QuotedStr(xCiaEnviar) + ', ' + Quotedstr(xAnoMes) + ',' + Quotedstr(xxTDiar)
   Else
      xSQL := xSQL + ' SELECT A.CIAID,' + Quotedstr(xAnoMes) + ',' + Quotedstr(xxTDiar);

   xSQL := xSQL + ',' + Quotedstr(xxNoReg) + ',' + Quotedstr(xxCpTO) + ',' + Quotedstr(xxCuenta);
   xSQL := xSQL + ', A.CLAUXID, A.CLIEID, A.CLIERUC';
   xSQL := xSQL + ',' + Quotedstr(xxTDoc) + ',' + 'A.FACSERIE, A.NFAC';

   If xxTipDet = 'TO' Then
      xSQL := xSQL + ',A.CLIEDES,' + Quotedstr(xxDH) + ',' + 'A.TMONID'
   Else
   Begin
      If xCiaEnviar = '15' Then
      Begin
         xWhere := 'Select DARTOBS FROM FAC313 '
            + ' where CIAID =' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
            + '   and DOCID =' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('DOCID').AsString)
            + '   and FACSERIE =' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('FACSERIE').AsString)
            + '   and NFAC =' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('NFAC').AsString)
            + '   and DFACITEM=' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
         DMFAC.cdsReporte.Close;
         DMFAC.cdsReporte.DataRequest(xWhere);
         DMFAC.cdsReporte.Open;
         xSQL := xSQL + ',' + Quotedstr(Copy(DMFAC.cdsReporte.FieldByName('DARTOBS').AsString, 1, 40)) + ',' + Quotedstr(xxDH) + ',' + 'A.TMONID';
      End
      Else
      Begin
         xSQL := xSQL + ',' + Quotedstr(xxGlosa) + ',' + Quotedstr(xxDH) + ',' + 'A.TMONID';
      End;
   End;

   xSQL := xSQL + ',' + 'A.FACTCAM' + ',' + '' + xxMONTOMO + '' + ',' + '' + xxMONTOMN + ', '
      + '' + xxMONTOME + '' + ',' + 'A.FACFECHA, A.FACFECHA, '
      + Quotedstr('P') + ',' + 'A.FACAAAA, A.FACMM, '
      + 'A.FACDD ,A.FACTRI ,A.FACSEM, '
      + 'A.FACSS ,A.FACAATRI ,A.FACAASEM, '
      + 'A.FACAASS, A.FACUSER, ' + DMFAC.wRepFuncDate + QuotedStr(sFecha) + '), SYSDATE, ';

   xSQL := xSQL + Quotedstr(xxTReg) + ', '
      + Quotedstr(xxTipDet) + ', '
      + Quotedstr(xxCcosId) + ', A.FACFEVCMTO,' + IntToStr(xCount);
   xSQL := xSQL + ' FROM  FAC305 A  ';
   xSQL := xSQL + ' WHERE  A.NFAC = ' + Quotedstr(xxNFac) + ' AND A.FACSERIE = ' + Quotedstr(xxSerie);
   xSQL := xSQL + ' AND  A.CLIEID = ' + Quotedstr(xxClie);
   xSQL := UpperCase(xSQL);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      xContinuaGrab := False;
      ShowMessage('No se pudo grabar en Detalle de Cuentas por Cobrar');
   End;
End;
*)
// Fin FAC-201806

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
(*
Procedure TFFactSGuia.GeneraRegistroCxC302VC(xxTipDet, xxTReg, xxMontoMO, xxMontoMN, xxMontoME, xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxDH, xxTDoc, xxTDiar, xxNoReg, xxCcosId: String; xCount: integer);
Var
   sSQL, xSQL, xWhere, xxGlosa: String;
   xAnoMes, xmes: String;
   wano, wMes, wDia: word;
Begin

   sFecha := FormatDateTime(DMFAC.wFormatFecha, xFecHoy);

   DecodeDate(DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime, wAno, wMes, wDia);

   If wMes < 10 Then
      xMes := '0' + inttostr(wMes)
   Else
      xMes := inttostr(wMes);
   xAnoMes := IntToStr(wAno) + xMes;

   If Length(xxCuenta) > 0 Then
   Begin
      xWhere := 'Select * '
         + '  from CXC201 '
         + ' where CIAID=' + QuotedStr(xCiaEnviar)
         + '   and CPTOID=' + QuotedStr(xxCpto);

      DMFAC.cdsReporte.Close;
      DMFAC.cdsReporte.DataRequest(xWhere);
      DMFAC.cdsReporte.Open;
      xxGlosa := DMFAC.cdsReporte.FieldByName('CPTODES').AsString;
   End
   Else
      xxGlosa := '';

   xSQL := 'INSERT INTO CXC302 (CIAID, CCANOMES, TDIARID, CCNOREG, '
      + '                    CPTOID, CUENTAID, CLAUXID, CLIEID, CLIERUC, DOCID, '
      + '                    CCSERIE, CCNODOC, CCGLOSA, CCDH,TMONID, CCTCAMPR, '
      + '                    CCMTOORI, CCMTOLOC,CCMTOEXT, CCFEMIS, CCFCOMP, '
      + '                    CCESTADO,CCAAAA, CCMM, CCDD, CCTRI, CCSEM, CCSS, '
      + '                    CCAATRI,CCAASEM, CCAASS,CCUSER, CCFREG, CCHREG, '
      + '                    TREGID, TIPDET, CCOSID, CCFVCMTO,CCREG ) '
      + ' SELECT ' + QuotedStr(xCiaEnviar) + ', ' + Quotedstr(xAnoMes) + ',' + Quotedstr(xxTDiar) + ', '
      + Quotedstr(xxNoReg) + ', c.cptocab, C.CUENTAID, A.CLAUXID, A.CLIEID, A.CLIERUC, '
      + Quotedstr(xxTDoc) + ',' + 'A.FACSERIE, A.NFAC';
   If xxTipDet = 'TO' Then
      xSQL := xSQL + ',A.CLIEDES,' + Quotedstr(xxDH) + ',' + 'A.TMONID'
   Else
   Begin
      If xCiaEnviar = '15' Then
      Begin
         xWhere := 'Select DARTOBS '
            + '  from FAC313 '
            + 'where CIAID =' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
            + '  and DOCID =' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('DOCID').AsString)
            + '  and FACSERIE =' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('FACSERIE').AsString)
            + '  and NFAC =' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('NFAC').AsString)
            + '  and DFACITEM=' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
         DMFAC.cdsReporte.Close;
         DMFAC.cdsReporte.DataRequest(xWhere);
         DMFAC.cdsReporte.Open;
         xSQL := xSQL + ',' + Quotedstr(Copy(DMFAC.cdsReporte.FieldByName('DARTOBS').AsString, 1, 40)) + ',' + Quotedstr(xxDH) + ',' + 'A.TMONID';
      End
      Else
      Begin
         xSQL := xSQL + ',' + Quotedstr(xxGlosa) + ',' + Quotedstr(xxDH) + ',' + 'A.TMONID';
      End;
   End;

   xSQL := xSQL + ',' + 'A.FACTCAM' + ', MTODOCORI, MTODOCLOC, MTODOCEXT ';
   xSQL := xSQL + ',' + 'A.FACFECHA, A.FACFECHA';
   xSQL := xSQL + ',' + Quotedstr('P') + ',' + 'A.FACAAAA, A.FACMM';
   xSQL := xSQL + ', A.FACDD ,A.FACTRI ,A.FACSEM ';
   xSQL := xSQL + ', A.FACSS ,A.FACAATRI ,A.FACAASEM ';
   xSQL := xSQL + ', A.FACAASS, A.FACUSER, ' + DMFAC.wRepFuncDate + QuotedStr(sFecha) + '), SYSDATE ';

   xSQL := xSQL + ',' + Quotedstr(xxTReg) + ', ' + Quotedstr(xxTipDet) + ', ' + Quotedstr(xxCcosId) + ', A.FACFEVCMTO ' + ',' + IntToStr(xCount);
   xSQL := xSQL + ' FROM  FAC305 A, FAC_FOR_PAG B, CXC208 C ';
   xSQL := xSQL + ' WHERE A.CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString);
   xSQL := xSQL + ' AND A.DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString);
   xSQL := xSQL + ' AND A.NFAC = ' + Quotedstr(xxNFac) + ' AND A.FACSERIE = ' + Quotedstr(xxSerie);
   xSQL := xSQL + ' AND A.CLIEID = ' + Quotedstr(xxClie);
   xSQL := xSQL + ' AND A.CIAID=B.CIAID AND A.DOCID=B.DOCID AND A.NFAC=B.NFAC AND A.FACSERIE=B.FACSERIE AND NVL(BORRADO,''N'')=''N'' '
      + ' AND A.CIAID=C.CIAID AND A.TMONID=C.TMONID AND A.DOCID=C.DOCID AND B.FPAGOID=CPTOCCOMER ';
   xSQL := UpperCase(xSQL);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      xContinuaGrab := False;
      ShowMessage('No se pudo grabar en Detalle de Cuentas por Cobrar (VC)');
   End;
End;
*)
// Fin FAC-201806

Procedure TFFactSGuia.ActualizaClientes;
Var
   xZip, xUSE, xAsoDir, xPais, xRuc, xAsoApeNom, xAsoApePat, xAsoApeMat, xAsoCodAux, xAsoCodMod, xDptoId, xCiudId, xTelef: String;
   xWhere, xSQL: String;
Begin
   Exit;
End;

Procedure TFFactSGuia.dblcVenNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
// Inicio FAC-201806
// 26/10/2018 sólo activa si no hay vendedor definido
   If DMFAC.cdsVen.recordcount=0 then Exit;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
// Fin FAC-201806
End;

Procedure TFFactSGuia.dblcTMonNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFFactSGuia.dblcLPrecioNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFFactSGuia.dblcLentregaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFFactSGuia.dblcFPagoNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFFactSGuia.RevierteStock;
Var
   wAno, wMes, wDia: word;
   xSQL, xAnoMes, xFecha: String;
Begin
   DecodeDate(DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime, wAno, wMes, wDia);
   xAnoMes := IntToStr(wAno) + DMFAC.StrZero(IntToStr(wMes), 2);

   xSQL := 'Select CIAID, ARTID, ALMID, DFACCANTG '
      + '  from FAC306 '
      + ' where CIAID=' + Quotedstr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
      + '   and ALMID=' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('ALMID').AsString)
      + '   and FACSERIE=' + Quotedstr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
      + '   and NFAC=' + Quotedstr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
   DMFAC.cdsQry2.Close;
   DMFAC.cdsQry2.DataRequest(xSQL);
   DMFAC.cdsQry2.Open;

   xFecha := FormatDateTime(DMFAC.wFormatFecha, DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime);

   DMFAC.cdsQry2.First;
   While Not DMFAC.cdsQry2.EOF Do
   Begin
      xSQL := 'Update LOG319 '
         + '   Set CANTOTSAL=CANTOTSAL-' + FloattoStr(DMFAC.cdsQry2.FieldByName('DFACCANTG').AsFloat) + ', '
         + '       STKFIN=STKFIN+' + FloattoStr(DMFAC.cdsQry2.FieldByName('DFACCANTG').AsFloat) + ', '
         + '       USUARIO=' + QuotedStr(DMFAC.wUsuario) + ', '
         + '       FREG=Sysdate '
         + ' where CIAID=' + Quotedstr(DMFAC.cdsQry2.FieldByName('CIAID').AsString)
         + '   and LOGANOMM=' + Quotedstr(xAnoMes)
         + '   and ALMID=' + QuotedStr(DMFAC.cdsQry2.FieldByName('ALMID').AsString)
         + '   and ARTID=' + Quotedstr(DMFAC.cdsQry2.FieldByName('ARTID').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar archivos de Saldos por Almacén en Reversión de Stock');
         xContinuaGrab := False;
         exit;
      End;

      xSQL := 'Update TGE205 A '
         + '   set CCUSER=' + QuotedStr(DMFAC.wUsuario) + ', '
         + '       CCFREG = trunc(sysdate), '
         + '       CCHREG = sysdate, '
         + '       ARTCNTG = nvl(ARTCNTG,0)+(' + FloattoStr(DMFAC.cdsQry2.FieldByName('DFACCANTG').AsFloat) + '), '
         + '       ARTMNTG = nvl(ARTCPROG,0)*(nvl(ARTCNTG,0)+(' + FloattoStr(DMFAC.cdsQry2.FieldByName('DFACCANTG').AsFloat) + ')), '
         + '       ARTFUMV=' + QuotedStr(xFecha)
         + ' where CIAID=' + Quotedstr(DMFAC.cdsQry2.FieldByName('CIAID').AsString)
         + '   and ARTID=' + Quotedstr(DMFAC.cdsQry2.FieldByName('ARTID').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo grabar Maestro de Artículos por Reversión de Stock');
         xContinuaGrab := False;
         exit;
      End;

      xSQL := 'Update LOG337 '
         + '   Set CANTOTSAL=CANTOTSAL-' + FloattoStr(DMFAC.cdsQry2.FieldByName('DFACCANTG').AsFloat) + ', '
         + '       MONTOTSAL=(CANTOTSAL-' + FloattoStr(DMFAC.cdsQry2.FieldByName('DFACCANTG').AsFloat) + ')*PREPROMFIN' + ','
         + '       STKFIN=STKFIN+' + FloattoStr(DMFAC.cdsQry2.FieldByName('DFACCANTG').AsFloat) + ', '
         + '       VALTOTFIN=STKFIN+' + FloattoStr(DMFAC.cdsQry2.FieldByName('DFACCANTG').AsFloat) + '*PREPROMFIN' + ','
         + '       USUARIO=' + QuotedStr(DMFAC.wUsuario) + ', '
         + '       FREG=Sysdate '
         + ' where CIAID=' + Quotedstr(DMFAC.cdsQry2.FieldByName('CIAID').AsString)
         + '   and LOGANOMM=' + Quotedstr(xAnoMes)
         + '   and ARTID=' + Quotedstr(DMFAC.cdsQry2.FieldByName('ARTID').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar archivos de Saldos Generales en Reversión de Stock');
         xContinuaGrab := False;
         exit;
      End;

      DMFAC.cdsQry2.Next;
   End;

End;

Procedure TFFactSGuia.btnExecClick(Sender: TObject);
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

   wFormaOrigen := 'FACTURA';
   MtxAsocia := TMant.Create(Self);
   FToolAportes := TFToolAportes.Create(Self);
   Try
      MtxAsocia.User := DMFAC.wUsuario;
      MtxAsocia.Admin := DMFAC.wAdmin;
      MtxAsocia.Module := DMFAC.wModulo;
      MtxAsocia.DComC := DMFAC.DCOM1;
      MtxAsocia.OnCreateMant := FRegistros.ToolAsociaCreate;
      MtxAsocia.TableName := 'TGE204';
      MtxAsocia.ClientDataSet := DMFAC.cdsClie;
      MtxAsocia.Titulo := 'Maestro de Clientes';
      MtxAsocia.OnInsert := Nil;
      MtxAsocia.OnEdit := FRegistros.OnEditCliente;
      MtxAsocia.SectionName := 'BuscaCli';
      MtxAsocia.Filter := '';
      MtxAsocia.OnDelete := Nil;
      MtxAsocia.OnShow := Nil;
      MtxAsocia.FileNameIni := '\oaFac.ini';
   // Inicio FAC-201806
   // 26/10/2018 Prefiltra Maestro de Clientes para mejorar tiempo de respuesta
      MtxAsocia.UsuarioSQL.Add(xSQL);
   // Fin FAC-201806
      MtxAsocia.Execute;
   Finally
   End;
End;

Procedure TFFactSGuia.Z2bbtnImprimeClick(Sender: TObject);
Var
   xSQL, xSQL1, xSQL2, sTipDocFac: String;
   xConta, xcaracteresSQL1, xcaracteresSQL2: Integer;
   xTFact: Double;
   xR1, xR2, xR3: Double;
   fObsequio, fCombo: Boolean;
// Inicio FAC-201806
// 31/10/2018 Flag que Identifica a Tipo de Documento en archivo de Series FAC103
   xFlagTDoc : String;
// Fin
Begin

   If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString = 'INICIAL' Then
   Begin
      Screen.Cursor := crDefault;
      Information(Caption, 'El Documento no se Encuentra Aceptado no es Posible Imprimir');
      Exit;
   End;

// Inicio FAC-201806
// 31/10/2018 cambia set de datos para impresión
   {
   xSQL := 'select A.CIAID, A.LOCID, A.TINID, A.ALMID, A.CLIEID, A.FACSERIE, A.NFAC, A.CLAUXID, '
      + '          case when C.CLIERUC=''00000000000'' then '' '' else C.CLIERUC end CLIERUC, '
      + '          A.VEID, A.GRARID, A.FAMID, A.SFAMID, A.TLISTAID, A.ARTID, A.UNMIDG, A.UNMABR, '
      + '          A.DFACCANTG, '
      + '          round(A.DFACMTOMO/DFACCANTG,5) DFACPREUMO, '
      + '          round(A.DFACMTOMN/DFACCANTG,5) DFACPREUMN,'
      + '          round(A.DFACMTOME/DFACCANTG,5) DFACPREUME, '
      + '          A.DFACTCAM, A.TMONID, A.DFACDTOUMO, A.DFACMTOMO, A.DFACMTOMN, '
      + '          A.DFACPREUMO PRECIOUNI, A.DFACMTOME, A.DFACAAAA, A.DFACMM, A.DFACDD, '
      + '          A.DFACIGV, A.DFACISC, A.DFACDCTO, A.DFACESTADO, A.DFACCANTAT, A.DFACGARAN, '
      + '          A.FPAGOID, A.SERIE, A.NGUIA, A.UNMIDU, A.DFACFLAGRE, A.UNMIDO, A.DFACCOMLMO, '
      + '          A.DFACFLAGV, A.DFACDCTO2, A.DFACDTOMO2, A.DFACDCTO3, A.DFACDTOMO3, '
      + '          A.CLIEDIRID, A.DFACDIRENT, A.DFACITEM, A.DOCID, A.DFACHOR, A.FACFECHA, '
      + '          A.DFACSALDO, A.DFACCONT, A.DFACPREVMO, '
      + '          to_char(A.FACFECHA,''yyyy'') ANO, to_char(A.FACFECHA,''mm'') MES, '
      + '          to_char(A.FACFECHA,''dd'') DIA,'
      + '          A.FACTIP, A.FACTCLI, A.TIPOADQ, A.DFACIMP1, A.DFACIMPMTO1, A.DFACIMP2, '
      + '          A.DFACIMPMTO2, A.ARTDES, A.DFACVTOTMO, A.DFACIMPMTN1, A.DFACIMPMTE1, '
      + '          A.DFACIMPMTE2, A.DFACIMPMTN2, A.FACID, A.DFACTFLAG, A.FLAGVAR, '
      + '          C.TIPVTAID, C.FACPO, C.FACMTOMO, C.FACESTADO, C.FACFECENT, C.FACDCTOMN, '
      + '          C.FACDCTOME, C.FACFLAGD, C.FACSIT, C.FACTOTMO, '
      + '          C.FACGARAN, C.FACIGVMO, C.FACISCMO, C.FACCOMVEMO, C.FACEMBMO, '
      + '          C.ZONVTAID, C.PEDIDO, C.TIPPERID, C.GUIASERIE, C.GUIANUM, C.FACTDOC, '
      + '          C.ZIPID, C.FACTOBS, C.FACFECHA, '
      + '          C.FACDSCTO1, C.FACIMPREP, C.FACFEVCMTO, C.CLIEDES, C.CLIEDIR, C.FACIGV2MO, '
      + '          case when DARTOBS is NULL then A.ARTDES else B.DARTOBS end ARTDESOBS, '
      + '          B.DARTOBS, '
      + '          ''                                                                                '' MONTOLETRA, '
      + '          TMONABR||TRIM(TO_CHAR(A.DFACVTOTMO,''999,999.0000'')) DFACVTOTMO_M, '
      + '          TMONABR||TRIM(TO_CHAR(A.DFACMTOMO,''999,999.0000'')) DFACMTOMO_M, '
      + '          TMONABR||TRIM(TO_CHAR(C.FACTOTMO,''999,999.0000'')) FACTOTMO_M, '
      + '          TMONABR||TRIM(TO_CHAR(C.FACIGVMO,''999,999.0000'')) FACIGVMO_M, '
      + '          TMONABR||TRIM(TO_CHAR(C.FACSERMO,''999,999.0000'')) FACSERMO_M, '
      + '          TMONABR||TRIM(TO_CHAR(C.FACTOTMO-C.FACIGVMO-C.FACSERMO,''999,999.0000'')) SUB_TOTAL_M, '
      + '          TMONABR||TRIM(TO_CHAR( round(A.DFACMTOMO/DFACCANTG,2),''999,999.0000'')) DFACPREUMO_M, '
      + '          TMONABR||TRIM(TO_CHAR( A.DFACVTOTMO + ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) ,''999,999.0000'')) BAZAR_SUBTOT_M, '
      + '          TMONABR||TRIM(TO_CHAR( (A.DFACVTOTMO+ ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) )/A.DFACCANTAT ,''999,999.0000'')) BAZAR_PREUNI_M, '
      + '          TMONABR||TRIM(TO_CHAR( ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2),''99,999.0000'')) BAZAR_DCTO_M,  '
      + '          round((DFACVTOTMO/DFACCANTAT),2) PREUNITIMPU, '
      + '          DFACDTOUMO + DFACDTOMO2 DSCTO, '
      + '          DFACPREVMO*(1+DFACIMP1/100) DFACPREVIMO, '
      + '          (DFACDTOUMO + DFACDTOMO2+DFACVTOTMO) VVTA, TMONABR, '
      + '          CASE WHEN FACIGVMO=0 THEN ''Exonerado del I.G.V. de acuerdo al Apendice I  inciso B de la ley del I.G.V.'' else '' '' end MENSAJE, '
      + '          C.DOCPAG, C.NUMDOCPAG, A.CODCOM, '
      + '          A.DFACVTOTMO + ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) BAZAR_SUBTOT, '
      + '          round( (A.DFACVTOTMO+ ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) )/A.DFACCANTAT,2) BAZAR_PREUNI, '
      + '          ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) BAZAR_DCTO,  '
      + '          CASE WHEN DFACVTOTMO=0 THEN ''Obsequio'' ELSE '''' END OBSEQUIO, '
      + '          CASE WHEN DFACVTOTMO=0 THEN ''X'' ELSE NULL END FLOBSEQUIO, SUBSTR(CODCOM,4,5) COMBO, '
      + '          ''          '' TITCOM, ''          '' TITOBS, ''     '' TITOBS1, ''     '' TITOBS2, '
      + '          CASE WHEN NVL(DETRACCION,0)>0 THEN ''C/Detracción : ''||DETRACCION ELSE '' '' END OBSDET, '
      + '          C.FACUSER, C.FACFREG, C.FACHREG, E.VENOMBRES, ''Vendedor : ''||E.VENOMBRES VENDEDOR '
      + '     FROM FAC306 A, FAC313 B, FAC305 C, TGE103 D, CXC203 E '
      + '    WHERE A.CIAID=' + '''' + dblcCIA.Text + ''' '
      + '      AND A.DOCID=' + '''' + dblcTdoc.Text + ''' '
      + '      AND A.FACSERIE =' + '''' + dblcSerie.Text + ''' '
      + '      AND A.NFAC =' + QuotedStr(dbeNFac.Text) + ' '
      + '      AND A.CLIEID=' + QuotedStr(dblcdAso.text) + ' '
      + '      AND A.CIAID=C.CIAID AND A.DOCID=C.DOCID AND A.FACSERIE=C.FACSERIE AND A.NFAC=C.NFAC AND A.TMONID=D.TMONID '
      + '      AND A.CLIEID=C.CLIEID '
      + '      AND A.CIAID=E.CIAID(+) AND A.VEID=E.VEID(+) ';
   If sTipoRQS = 'C' Then
      xSQL := xSQL + 'AND A.CIAID=B.CIAID(+) AND A.DOCID=B.DOCID(+) AND A.FACSERIE=B.FACSERIE(+) AND A.NFAC=B.NFAC(+) AND A.ARTID=B.DFACITEM(+) ORDER BY A.DFACITEM'
   Else
      If sTipoRQS = 'S' Then
         xSQL := xSQL + 'AND A.CIAID=B.CIAID(+) AND A.DOCID=B.DOCID(+) AND A.FACSERIE=B.FACSERIE(+) AND A.NFAC=B.NFAC(+) AND A.DFACITEM=B.DFACITEM(+) ORDER BY A.DFACITEM';

   If (length(xSQL) Mod 2) > 0 Then
      xcaracteresSQL1 := strtoint(floattostr((length(xSQL) - 1) / 2))
   Else
      xcaracteresSQL1 := strtoint(floattostr((length(xSQL)) / 2));
   xcaracteresSQL2 := xcaracteresSQL1 + 2;
   xSQL1 := copy(xSQL, 1, xcaracteresSQL1);
   xSQL2 := copy(xSQL, xcaracteresSQL1 + 1, xcaracteresSQL2);
   }
   xFlagTDoc := copy(dblcSerie.Text,1,1);

   xSQL1:= 'select FAC306.CIAID, FAC306.LOCID, FAC306.TINID, FAC306.ALMID, FAC306.CLIEID, FAC306.FACSERIE, FAC306.NFAC, FAC306.CLAUXID, '
      + '          TGE204.NUMDOCID CLIERUC, '
      + '          FN_FAC_DIREC_CLIE(TGE204.CLAUXID, TGE204.CLIEID, trim(FAC305.CLIEDIR), ''1'') DIR_C_DPTO, '
      + '          FAC306.VEID, FAC306.GRARID, FAC306.FAMID, FAC306.SFAMID, FAC306.TLISTAID, FAC306.ARTID, FAC306.UNMIDG, FAC306.UNMABR, '
      + '          FAC306.DFACCANTG, FAC306.DFACCANTAT, FAC306.DFACTCAM, FAC306.TMONID,  TGE103.TMONABR, TGE103.TMONDES, ';
   If xFlagTDoc='B' then
      xSQL1 := xSQL1 + quotedstr('BOLETA DE VENTA ELECTRÓNICA')+' DOCDES, '
   Else
      xSQL1 := xSQL1 + quotedstr('FACTURA ELECTRÓNICA')+' DOCDES, ';

   xSQL1 := xSQL1
   // Base Imponible sin Descuentos
      + '          FAC306.DFACPREUMO, FAC306.DFACPREUMN, FAC306.DFACPREUME,'
   // Descuento 1
      + '          FAC306.DFACDCTO, FAC306.DFACDTOUMO, FAC306.DFACMTOMO, FAC306.DFACMTOMN, '
   // Descuento 2
      + '          FAC306.DFACDCTO2, FAC306.DFACDTOMO2, FAC306.DFACDTOMN2, '
   // Precio Unitario de Venta sin Descuentos
      + '          FAC306.DFACPREVMO, '
   // Precio Total de Venta sin Descuentos
      + '          FAC306.DFACMTOMO, FAC306.DFACMTOME, '
   // IGV
      + '          FAC306.DFACIGV, FAC306.DFACIMP1, FAC306.DFACIMPMTO1, FAC306.DFACIMPMTN1, FAC306.DFACIMPMTE1, '
   // ISC
      + '          FAC306.DFACISC, FAC306.DFACIMP2, FAC306.DFACIMPMTO2, FAC306.DFACIMPMTN2, FAC306.DFACIMPMTE2, '
   // Precio Unitario con Impuestos
      + '          round(FAC306.DFACIMPMTO1/FAC306.DFACCANTG,2) IGV_UNITARIO, '
      + '          (FAC306.DFACPREUMO - FAC306.DFACDTOUMO - FAC306.DFACDTOMO2 + round(FAC306.DFACIMPMTO1/FAC306.DFACCANTG,2)) DFACPREUNI, '
   // Servicio
      + '          FAC306.DFACSERMO, FAC306.DFACSERMN, FAC306.DFACSERME, '
   // Venta Total
      + '          FAC306.DFACVTOTMO,  '

      + '          FAC306.DFACPREUMO PRECIOUNI, '
      + '          FAC306.DFACAAAA, FAC306.DFACMM, FAC306.DFACDD, '

      + '          FAC306.DFACESTADO, FAC306.DFACGARAN, '
      + '          FAC306.FPAGOID, FAC306.SERIE, FAC306.NGUIA, FAC306.UNMIDU, FAC306.DFACFLAGRE, FAC306.UNMIDO, FAC306.DFACCOMLMO, '
      + '          FAC306.DFACFLAGV, FAC306.DFACDCTO3, FAC306.DFACDTOMO3, '
      + '          FAC306.CLIEDIRID, FAC306.DFACDIRENT, FAC306.DFACITEM, FAC306.DOCID, FAC306.DFACHOR, FAC306.FACFECHA, '
      + '          FAC306.DFACSALDO, FAC306.DFACCONT,  '
      + '          to_char(FAC306.FACFECHA,''yyyy'') ANO, to_char(FAC306.FACFECHA,''mm'') MES, '
      + '          to_char(FAC306.FACFECHA,''dd'') DIA,'
      + '          FAC306.FACTIP, FAC306.FACTCLI, FAC306.TIPOADQ, '
      + '          FAC306.ARTDES,  '
      + '          FAC306.FACID, FAC306.DFACTFLAG, FAC306.FLAGVAR, '
      + '          FAC305.TIPVTAID, FAC305.FACPO, FAC305.FACMTOMO, FAC305.FACESTADO, FAC305.FACFECENT, '
      + '          FAC305.FACDCTOMN, FAC305.FACDCTOME, FAC305.FACFLAGD, FAC305.FACSIT, FAC305.FACTOTMO, '
      + '          FAC305.FACGARAN, FAC305.FACIGVMO, FAC305.FACISCMO, FAC305.FACCOMVEMO, FAC305.FACEMBMO, '
      + '          FAC305.ZONVTAID, FAC305.PEDIDO, FAC305.TIPPERID, FAC305.GUIASERIE, FAC305.GUIANUM, FAC305.FACTDOC, '
      + '          FAC305.ZIPID, FAC305.FACTOBS, FAC305.FACFECHA, '
      + '          trim(substr(FACTOBS,1,instr(FACTOBS, ''|'')-1)) OBS1, '
      + '          trim(substr(FACTOBS, instr(FACTOBS, ''|'')+1, instr(FACTOBS, ''|'',1,2)-1-instr(FACTOBS, ''|''))) OBS2, '
      + '          trim(substr(substr(FACTOBS, instr(FACTOBS, ''|'',1,2)+1),1,length(substr(FACTOBS, instr(FACTOBS, ''|'',1,2)+1))-1)) OBS3, '
      + '          FAC305.FACDSCTO1, FAC305.FACIMPREP, FAC305.FACFEVCMTO, TGE204.CLIEDES, FAC305.CLIEDIR, FAC305.FACIGV2MO, '
      + '          case when DARTOBS is NULL then FAC306.ARTDES else FAC313.DARTOBS end ARTDESOBS, '
      + '          FAC313.DARTOBS, '
      + '          ''                                                                                '' MONTOLETRA, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC306.DFACVTOTMO,''999,999.0000'')) DFACVTOTMO_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC306.DFACMTOMO,''999,999.0000'')) DFACMTOMO_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC305.FACTOTMO,''999,999.0000'')) FACTOTMO_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC305.FACIGVMO,''999,999.0000'')) FACIGVMO_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC305.FACSERMO,''999,999.0000'')) FACSERMO_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC305.FACTOTMO-FAC305.FACIGVMO-FAC305.FACSERMO,''999,999.0000'')) SUB_TOTAL_M, ';
   xSQL2 :=
        '          TGE103.TMONABR||TRIM(TO_CHAR(round(FAC306.DFACMTOMO/DFACCANTG,2),''999,999.0000'')) DFACPREUMO_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC306.DFACVTOTMO + ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) ,''999,999.0000'')) BAZAR_SUBTOT_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR((FAC306.DFACVTOTMO+ ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) )/FAC306.DFACCANTAT ,''999,999.0000'')) BAZAR_PREUNI_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2),''99,999.0000'')) BAZAR_DCTO_M,  '
      + '          round((DFACVTOTMO/DFACCANTAT),2) PREUNITIMPU, '
      + '          DFACDTOUMO + DFACDTOMO2 DSCTO, '
      + '          DFACPREVMO*(1+DFACIMP1/100) DFACPREVIMO, '
      + '          (DFACDTOUMO + DFACDTOMO2+DFACVTOTMO) VVTA, '
      + '          CASE WHEN FACIGVMO=0 THEN ''Exonerado del I.G.V. de acuerdo al Apendice I  inciso B de la ley del I.G.V.'' else '' '' end MENSAJE, '
      + '          FAC305.DOCPAG, FAC305.NUMDOCPAG, FAC306.CODCOM, '
      + '          FAC306.DFACVTOTMO + ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) BAZAR_SUBTOT, '
      + '          round( (FAC306.DFACVTOTMO+ ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) )/FAC306.DFACCANTAT,2) BAZAR_PREUNI, '
      + '          ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) BAZAR_DCTO,  '
      + '          CASE WHEN DFACVTOTMO=0 THEN ''Obsequio'' ELSE '''' END OBSEQUIO, '
      + '          CASE WHEN DFACVTOTMO=0 THEN ''X'' ELSE NULL END FLOBSEQUIO, SUBSTR(CODCOM,4,5) COMBO, '
      + '          ''          '' TITCOM, ''          '' TITOBS, ''     '' TITOBS1, ''     '' TITOBS2, '
      + '          CASE WHEN NVL(DETRACCION,0)>0 THEN ''C/Detracción : ''||DETRACCION ELSE '' '' END OBSDET, '
      + '          FAC305.FACUSER, FAC305.FACFREG, FAC305.FACHREG, CXC203.VENOMBRES, ''Vendedor : ''||CXC203.VENOMBRES VENDEDOR, '
      + '          nvl(CXC301.CCGRAVAD,0) CCGRAVAD, nvl(CCNOGRAV,0) CCNOGRAV, nvl(CXC_IMP_EXO,0) CXC_IMP_EXO, '
      + '          nvl(CXC301.CCEXPORT,0) CCEXPORT, nvl(CXC_IMP_EXO,0) + nvl(CXC301.CCEXPORT,0) CCEXONERADO, '
      + '          0.00 CCANTICIPO, 0.00 CCDESCUENTOS, nvl(CCSERVIC,0.00) CCSERVIC, nvl(CCIGV,0.00) CCIGV, nvl(CCMTOORI, 0.00) CCMTOORI, '
      + '          FAC_TIENDA.TIE_DES, FAC_TIENDA.TIE_DIR '
      + '     from FAC306, FAC313, FAC305, TGE103, CXC203, TGE204, CXC301, FAC103, FAC_TIENDA '
      + '    where FAC306.CIAID=' + quotedstr(dblcCIA.Text)
      + '      and FAC306.DOCID=' + quotedstr(dblcTdoc.Text)
      + '      and FAC306.FACSERIE =' + quotedstr(dblcSerie.Text)
      + '      and FAC306.NFAC =' + quotedStr(dbeNFac.Text)
      + '      and FAC305.CIAID=FAC306.CIAID AND FAC305.DOCID=FAC306.DOCID AND FAC305.FACSERIE=FAC306.FACSERIE AND FAC305.NFAC=FAC306.NFAC '
      + '      and TGE103.TMONID=FAC306.TMONID '
      + '      and FAC305.CIAID=CXC203.CIAID(+) AND FAC305.VEID=CXC203.VEID(+) '
      + '      and TGE204.CLAUXID=FAC305.CLAUXID and TGE204.CLIEID=FAC305.CLIEID '
      + '      and CXC301.CIAID=FAC306.CIAID and CXC301.DOCID=FAC306.DOCID and CXC301.CCSERIE=FAC306.FACSERIE and CXC301.CCNODOC=FAC306.NFAC '
      + '      and FAC103.CIAID=FAC306.CIAID and FAC103.SERIEID=FAC306.FACSERIE and FAC103.FLAGV='+quotedstr(xFlagTDoc)
      + '      and FAC_TIENDA.CIAID(+)=FAC103.CIAID and FAC_TIENDA.TIE_ID(+)=FAC103.TIE_ID ';
   If sTipoRQS = 'C' Then
      xSQL2 := xSQL2 + ' AND FAC313.CIAID(+)=FAC306.CIAID AND FAC313.DOCID(+)=FAC306.DOCID AND FAC313.FACSERIE(+)=FAC306.FACSERIE AND FAC313.NFAC(+)=FAC306.NFAC AND FAC313.DFACITEM(+)=FAC306.ARTID ORDER BY FAC306.DFACITEM'
   Else
      If sTipoRQS = 'S' Then
         xSQL2 := xSQL2 + ' AND FAC313.CIAID(+)=FAC306.CIAID AND FAC313.DOCID(+)=FAC306.DOCID AND FAC313.FACSERIE(+)=FAC306.FACSERIE AND FAC313.NFAC(+)=FAC306.NFAC AND FAC313.DFACITEM(+)=FAC306.DFACITEM ORDER BY FAC306.DFACITEM';

   xSQL := xSQL1 + xSQL2;
   xSQL1:= '';
   xSQL2:= '';
   If (length(xSQL) Mod 2) > 0 Then
      xcaracteresSQL1 := strtoint(floattostr((length(xSQL) - 1) / 2))
   Else
      xcaracteresSQL1 := strtoint(floattostr((length(xSQL)) / 2));
   xcaracteresSQL2 := xcaracteresSQL1 + 2;
   xSQL1 := copy(xSQL, 1, xcaracteresSQL1);
   xSQL2 := copy(xSQL, xcaracteresSQL1 + 1, xcaracteresSQL2);

// Fin FAC-201806
   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.recordcount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      showmessage('No Existen Datos a Imprimir');
      Exit;
   End;

   fObsequio := False;
   fCombo := False;
   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      If DMFAC.cdsReporte.FieldByname('FLOBSEQUIO').AsString = 'X' Then
         fObsequio := True;
      If DMFAC.cdsReporte.FieldByname('CODCOM').AsString <> '' Then
         fCombo := True;
      DMFAC.cdsReporte.Next;
   End;

   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      If fObsequio Then
      Begin
         DMFAC.cdsReporte.Edit;
         DMFAC.cdsReporte.FieldByname('TITOBS').AsString := 'Obseq.';
         DMFAC.cdsReporte.FieldByname('TITOBS1').AsString := 'Obse-';
         DMFAC.cdsReporte.FieldByname('TITOBS2').AsString := 'quio';
         DMFAC.cdsReporte.Post;
      End;
      If fCombo Then
      Begin
         DMFAC.cdsReporte.Edit;
         DMFAC.cdsReporte.FieldByname('TITCOM').AsString := 'COMBO';
         DMFAC.cdsReporte.Post;
      End;
      DMFAC.cdsReporte.Next;
   End;
   DMFAC.cdsReporte.First;

   sTipDocFac := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''F''', 'DOCID');

   Data.Datasource := DMFAC.dsReporte;

// Inicio FAC-201806
// Reporte de Documento de Venta alternativo
{
   If sTipDocFac = dblcTdoc.Text Then
   Begin
      ppFact.DataPipeline := Data;
      wGenTipDoc := 'F';
      ppFact.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\FacturaSG' + dblcCia.Text + dblcSerie.Text + '.Rtm';
      ppFact.Template.LoadFromFile;
      AsignaConstantedeImpresionDema;
   End
   Else
   Begin
      wGenTipDoc := 'B';
      ppBol.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\BoletaSG' + dblcCia.Text + dblcSerie.Text + '.Rtm';
      ppBol.Template.LoadFromFile;
      AsignaConstantedeImpresionDema;
   End;
}
   ppBol.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\BoletaVenta.Rtm';
   ppBol.Template.LoadFromFile;
   AsignaConstantedeImpresionDema;
// Fin FAC-201806

// para imprimir boletas anuladas
   If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString = 'ANULADO' Then
   Begin
      If sTipDocFac = dblcTdoc.Text Then
      Begin
         ppFact.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\FacturaSG' + dblcCia.Text + 'ANULADA.Rtm';
         ppFact.Template.LoadFromFile;
      End
      Else
      Begin
         ppBol.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\BoletaSG' + dblcCia.Text + 'ANULADA.Rtm';
         ppBol.Template.LoadFromFile;
      End;
   End;

// Inicio FAC-201806
// 06/11/2018 sólo utilizará el objeto de boletas
   {
   Screen.Cursor := crDefault;
   If sTipDocFac = dblcTdoc.Text Then
   Begin
      If cbDiseno.Checked Then
      Begin
         Diseno.Report := ppFact;
         Diseno.Show
      End
      Else
         ppFact.Print;
   End
   Else
   Begin
      If cbDiseno.Checked Then
      Begin
         Diseno.Report := ppBol;
         Diseno.Show
      End
      Else
         ppBol.Print;
   End;
   }
   If cbDiseno.Checked Then
   Begin
      Diseno.Report := ppBol;
      Diseno.Show
   End
   Else
      ppBol.Print;
// Fin FAC-201806
End;

Procedure TFFactSGuia.AsignaConstantedeImpresionDema;
Var
   xMontoLetras: String;
Begin
   DMFAC.BuscaQry('dspUltTGE', 'TGE103', 'TMONABR, TMONDES', 'TMONID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('TMONID').ASString), 'TMONABR');
   xMontoLetras := 'Son: ' + Trim(DMFAC.StrNum(FRound(DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat, 15, 2))) + ' ' + DMFAC.cdsQry.FieldByName('TMONDES').AsString;
   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      DMFAC.cdsReporte.Edit;
      DMFAC.cdsReporte.FieldByName('MONTOLETRA').AsString := xMontoLetras;
      DMFAC.cdsReporte.Post;
      DMFAC.cdsReporte.Next;
   End;
End;

Procedure TFFactSGuia.ppvValorUntCalc(Sender: TObject; Var Value: Variant);
Begin
   Value := FRound(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat / DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat, 15, 4);
End;

Procedure TFFactSGuia.pprFacturaPrintingComplete(Sender: TObject);
Begin
   xFlagIF := True;
End;

Procedure TFFactSGuia.dblcdAsoExit(Sender: TObject);
Var
   xZona, xSQL, xCampos, xWhere: String;
   xDireccion, xFono, sZona, sZona1: String;
Begin
   If length(Trim(dblcdAso.Text)) > 0 Then
   Begin
         xCampos := 'CLIEID, CLIEDES, CLIERUC, CLAUXID, TMONID, CLIECREMAX, CLIECREDISP, CLIECREUTI, '
         +       'ZONVTAID, VEID, SITCLIEID, DESCLIEID, CLIEDIR, CLIETELF, TIPPERID, CLIECOND, CLIEDNI, TDOC_ID_SUNAT, NUMDOCID ';
      xWhere := 'CLAUXID=' + QuotedStr(DMFAC.xgClAuxId) + ' and CLIEID =' + QuotedStr(dblcdAso.Text);

      If DMFAC.cdsFact2.State = dsBrowse Then
         DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('CLIEID').AsString  := DMFAC.BuscaQry('dspUltTGE', 'TGE204', xCampos, xWhere, 'CLIEID');
      DMFAC.cdsFact2.FieldByName('CLIEDES').AsString := Trim(DMFAC.cdsQry.FieldByName('CLIEDES').AsString);
      DMFAC.cdsFact2.FieldByName('CLAUXID').AsString := DMFAC.cdsQry.FieldByName('CLAUXID').AsString;
      DMFAC.cdsFact2.FieldByName('CLIEDIR').AsString :=
               copy(stringreplace(DMFAC.cdsQry.FieldByName('CLIEDIR').AsString, '''', '', [rfReplaceAll]), 1, 100);

      xTipDocIdent := DMFAC.cdsQry.FieldByName('TDOC_ID_SUNAT').AsString;
      xNumdocIdent := DMFAC.cdsQry.FieldByName('NUMDOCID').AsString;
      edtclie.Text := Trim(DMFAC.cdsQry.FieldByName('CLIEDES').AsString);

      DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := xNumdocIdent;

      xDireccion := copy(DMFAC.cdsQry.FieldByName('CLIEDIR').AsString, 1, 100);
      xDireccion := stringreplace(xDireccion, '''', '', [rfReplaceAll]);
      edtDireccion.Text := xDireccion;

      xFono := DMFAC.cdsQry.FieldByName('CLIETELF').AsString;

      DMFAC.cdsFact2.FieldByName('CLIEDIR').AsString := xDireccion;
      xZonaAso := DMFAC.BuscaQry('dspUltTGE', 'FAC105', 'TVTAID', 'TVTAFLAG =' + QuotedStr('L'), 'TVTAID');
      sZonaAso := DMFAC.BuscaQry('dspUltTGE', 'FAC106', 'ZVTAID', 'TVTAID =' + QuotedStr(xZonaAso) + ' And ZONADEFAUL =' + QuotedStr('S'), 'ZVTAID');
      DMFAC.cdsFact2.FieldByName('ZONVTAID').AsString := sZonaAso;
      DMFAC.cdsFact2.FieldByName('TIPVTAID').AsString := XZonaAso;

      xClAux :=  DMFAC.cdsFact2.FieldByName('CLAUXID').AsString;
   End
   Else
   Begin
      edtClie.Text := '';
      xNuevoclie := False;
   End;
End;

Procedure TFFactSGuia.dblcTClieExit(Sender: TObject);
Var
   xFact: String;
   xWhere: String;
Begin
   If xCrea Then Exit;

   edtClie.Enabled := False;
   xWhere := 'TCLIEID =' + '''' + dblcTClie.Text + '''';

   edtTClie.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'CLAUXID,TCLIEDES,TCLIEFLAG', xWhere, 'TCLIEDES');
   xClauxId := DMFAC.cdsQry.FieldByName('CLAUXID').AsString;
   lblTipoCliente.Caption := DMFAC.cdsQry.FieldByName('TCLIEDES').AsString;
   DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;

   If 1 <> 1 Then
   Begin
      dblcdAso.Visible := False;
      btnExec.Visible := False;
      xFiltro := 'SELECT CLIEID, CLIEDES, CLIERUC, CLAUXID, CLIECREMAX, '
         + '             CLIECREDISP, CLIECREUTI, ZONVTAID, VEID, SITCLIEID, DESCLIEID, '
         + '             CLIEDIR, CLIETELF, TIPPERID, CLIECOND, CLIEDNI, CLIEEMAI, CLIEABR, '
         + '             ACTIVO, CLIENOMBRE, CLIENOMBRE1, CLIEAPEPAT, CLIEAPEMAT, CLIEDIRLEG, '
         + '             PAISID, DPTOID, CIUDID, CLIECZIP, CIAID, USERID, FREG, HREG, CLIEFAX, '
         + '             TVTAID, TDOC_ID_SUNAT '
         + '        FROM TGE204 '
         + '       WHERE CLAUXID<>' + QuotedStr('AS') + ' AND ACTIVO = ' + QuotedStr('S');
      DMFAC.cdsClie.Close;
      DMFAC.cdsClie.DataRequest(xFiltro);
      DMFAC.cdsClie.Open;

      If wFil_Asoc = 'N' Then
         dblcLentrega.Enabled := True;
      If pnlCab1.Enabled = True Then
   End
   Else
   Begin
      xFact := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''F''', 'DOCID');
      If xFact = dblcTDoc.Text Then
      Begin
         edtClie.Enabled := False;
      End
      Else
      Begin
         dblcdClieRuc.Enabled := False;
         edtClie.Enabled := True;
      End;
      dblcdAso.Visible := True;
      btnExec.Visible := True;
      dblcLentrega.Enabled := False;
      If pnlCab1.Enabled = True Then
         btnExec.SetFocus;
   End;
End;

Procedure TFFactSGuia.dblcTInvExit(Sender: TObject);
Begin
   edtTinv.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE152', 'TINDES', 'TINID=' + QuotedStr(dblcTInv.Text)
      + 'AND CIAID=' + Quotedstr(dblcCia.Text), 'TINDES');

   DMFAC.cdsAlmacen.Filtered := False;
   DMFAC.cdsAlmacen.Filter := 'CIAID=' + QuotedStr(dblcCia.Text) + ' AND LOCID=' + QuotedStr(dblcLocal.Text)
      + ' AND TINID=' + QuotedStr(dblcTInv.Text)
      + ' AND ALMVTA=''S'' AND ACTIVO=''S''';
   DMFAC.cdsAlmacen.Filtered := True;
End;

Procedure TFFactSGuia.dblcTipoCompraExit(Sender: TObject);
Begin
   edtTipoCompra.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE173', 'TIPADQDES', 'TIPOADQ=' + quotedStr(dblcTipoCompra.Text), 'TIPADQDES');

   sTipoRQS := dblcTipoCompra.Text;

   If sTipoRQS = 'C' Then
   Begin
      dblcTInv.Enabled := True;
      dblcAlmacen.Enabled := True;
   End
   Else
      If sTipoRQS = 'S' Then
      Begin
         DMFAC.cdsFact2.FieldByName('TINID').AsString := '00';
         DMFAC.cdsFact2.FieldByName('ALMID').AsString := '00';
         dblcTInv.Enabled := False;
         dblcAlmacen.Enabled := False;
         dblcTdoc.SetFocus;
      End;
End;

Procedure TFFactSGuia.dbePUnitExit(Sender: TObject);
Var
   xTasa, xDscto1, xDscto2, xImporte1, xSubTot1, xTot, xImpTot, xTotD1, xTotD2, xTasaIGV, xTasaSERV: double;
Begin

   dbeTASSERV2.Text := CurrToStr(DMFAC.cdsVende.FieldByname('TASSERV').Ascurrency);

   If Z2bbtnRegCanc.Focused Then Exit;

   If Length(Trim(dbePorcentaje.Text)) = 0 Then
      xDscto1 := 0
   Else
      xDscto1 := FRound(strtofloat(dbePorcentaje.Text), 15, 4);

   If StrToFloat(dbeDscto.Text) < 0 Then
   Begin
      Showmessage('Ingrese un Descuento Mayor/Igual a Cero');
      dbeDscto.Text := '';
      dbeDscto.SetFocus;
      Exit;
   End;

   xDscto2 := FRound(StrToFloat(dbeDscto.Text), 15, 4);
   xTasa := 1 + (StrToFloat(dbeImpIgv.Text) / 100) + (StrToFloat(dbeImp2.Text) / 100) + (StrToFloat(dbeTasServ2.Text) / 100); //poner el servicio por dbeimp2

   xImporte1 := FRound(strtofloat(dbePUnit.Text) * strtofloat(dbeCnt.Text), 15, 4); //Precio Unitario por cantidad
   xTotD1 := xImporte1 * (xDscto1 / 100); //Importe descuento
   xSubtot1 := FRound(xImporte1 - xTotD1, 15, 4); //Precio total menos descuento
   xTotD2 := xSubtot1 * (xDscto2 / 100); //Importe descuento 2
   xTot := FRound(xSubtot1 - xTotD2, 15, 4); //Precio total descontado menos descuento 2

   xTasaSERV := xTot * (DMFAC.cdsVende.FieldByname('TASSERV').Ascurrency / 100); //Importe segun tasa de Servicio
   dbeServicio2.Text := CurrToStr(xTasaSERV);
   xTasaIGV := xTot * (StrToFloat(dbeImpIgv.Text) / 100); //Importe segun tasa de IGV
   dbeIGV2.Text := CurrToStr(xTasaIGV);

   xImpTot := FRound(xTot * xTasa, 15, 4); //Precio total incluido tasas
   dbeValVen.Text := floattostrf(xTot, ffnumber, 15, 4);
   dbeImporteS.Text := floattostrf(xImpTot, ffnumber, 15, 4);
End;

Procedure TFFactSGuia.btnMemServClick(Sender: TObject);
Begin
   If pnlDetalleA.Width = 436 Then
      pnlDetalleA.Width := 700
   Else
      pnlDetalleA.Width := 436;

   wSQL := 'CIAID =' + QuotedStr(dblcCia.Text) + ' ' +
      'AND DOCID =' + QuotedStr(dblcTDoc.Text) + ' ' +
      'AND FACSERIE =' + QuotedStr(dblcSerie.Text) + ' ' +
      'AND NFAC =' + QuotedStr(dbeNFac.Text) + ' ' +
      'AND DFACITEM=' + QuotedStr(dbeItem.Text);
   DMFAC.BuscaQry('dspUltTGE', 'FAC313', 'DARTOBS', wSQL, 'DARTOBS');
   memDetServ.Text := DMFAC.cdsQry.FieldByName('DARTOBS').AsString;

   If Length(Trim(memDetServ.Text)) = 0 Then
      If Length(Trim(memDetalle.Text)) > 0 Then
         memDetServ.Text := memDetalle.Text;
   memDetServ.SetFocus;
End;

Procedure TFFactSGuia.btnMemArtClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'CIAID=' + QuotedStr(dblcCia.Text) + ' AND TINID=' + QuotedStr(dblcTInv.Text) + ' AND ARTID=' + QuotedStr(dblcdArticulo.Text);
   memDetArt.readOnly := ((wFSerie = 'S') And (DMFAC.BuscaQry('dspUltTGE', 'TGE205', 'FNSERIE,CONSIGNACION', xSQL, 'FNSERIE') = 'S'));

   If (pnlRegistro.Width = 640) And (memDetArt.Visible = False) Then
      memDetArt.Visible := True
   Else
      If (pnlRegistro.Width = 640) And (memDetArt.Visible = True) Then
      Begin
         pnlRegistro.Width := 382;
         memDetArt.Visible := False;
         Exit;
      End
      Else
         If (pnlRegistro.Width = 382) Then
         Begin
            pnlRegistro.Width := 640;
            memDetArt.Visible := True;
         End;

   If (dblcCia.Text = '06') Or (dblcCia.Text = '15') Then
      dbgStock.Top := 108
   Else
      If (dblcCia.Text = '04') And (DMFAC.cdsQry.FieldByName('CONSIGNACION').AsString = 'S') Then
         dbgStock.Top := 108
      Else
         dbgStock.Top := 26;

   wSQL := 'CIAID =' + QuotedStr(dblcCia.Text) + ' ' +
      'AND DOCID =' + QuotedStr(dblcTDoc.Text) + ' ' +
      'AND FACSERIE =' + QuotedStr(dblcSerie.Text) + ' ' +
      'AND NFAC =' + QuotedStr(dbeNFac.Text) + ' ' +
      'AND DFACITEM=' + QuotedStr(dblcdArticulo.Text);
   DMFAC.BuscaQry('dspUltTGE', 'FAC313', 'DARTOBS', wSQL, 'DARTOBS');
   memDetArt.Text := DMFAC.cdsQry.FieldByName('DARTOBS').AsString;

   If Length(Trim(memDetArt.Text)) = 0 Then
      If Length(Trim(dbeArticulo.Text)) > 0 Then
         memDetArt.Text := dbeArticulo.Text;
   memDetArt.SetFocus;

End;

Procedure TFFactSGuia.ppFactPreviewFormCreate(Sender: TObject);
Begin
   ppFact.PreviewForm.ClientHeight := 500;
   ppFact.PreviewForm.ClientWidth := 650;
   TppViewer(ppFact.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFFactSGuia.ppBolPreviewFormCreate(Sender: TObject);
Begin
   ppBol.PreviewForm.ClientHeight := 500;
   ppBol.PreviewForm.ClientWidth := 650;
   TppViewer(ppBol.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFFactSGuia.dbmObsKeyPress(Sender: TObject; Var Key: Char);
Var
   sC: String;
Begin
   sC := Key;
   sC := Uppercase(sC);
   Key := sC[1];
End;

Procedure TFFactSGuia.edtClieExit(Sender: TObject);
Begin
   dblcSerie.SetFocus;
End;

Procedure TFFactSGuia.dtpFVcmtoExit(Sender: TObject);
Begin
   If btnExec.Focused Then Exit;

   If dtpFVcmto.Date < dtpFFac.Date Then
      ErrorMsg(Caption, 'La Fecha de Vencimiento no Puede ser Menor a la Fecha de Emisión');
End;

Procedure TFFactSGuia.bbtnKDXSerieClick(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'SELECT * '
      + '  FROM LOG332 '
      + ' WHERE CIAID=' + QuotedStr(dblcCia.Text) + ' '
      + '   AND LOCID=' + QuotedStr(dblcLocal.Text) + ' '
      + '   AND TINID=' + QuotedStr(dblcTInv.Text) + ' '
      + '   AND ALMID=' + QuotedsTr(sAlmacen) + ' '
      + '   AND ARTID=' + QuotedStr(dblcdArticulo.Text);
   DMFAC.cdsKDXSerie.Close;
   DMFAC.cdsKDXSerie.DataRequest(sSQL);
   DMFAC.cdsKDXSerie.Open;
   DMFAC.cdsKDXSerie.IndexFieldNames := 'ARTID;DOCID;FACSERIE;NFAC';

   dbgGridSerie.Selected.Clear;
   dbgGridSerie.Selected.Add('ACFSERIE'#9'20'#9'Serie'#9'T');
   dbgGridSerie.Selected.Add('ENTREGADO'#9'1'#9'Seleccionado'#9'F');
   dbgGridSerie.Selected.Add('MARCA'#9'10'#9'Marca'#9'T');
   dbgGridSerie.Selected.Add('MODELO'#9'10'#9'Modelo'#9'T');
   dbgGridSerie.Selected.Add('COLOR'#9'10'#9'Color'#9'T');
   dbgGridSerie.Selected.Add('DOCID'#9'3'#9'T.Doc.'#9'T');
   dbgGridSerie.Selected.Add('FACSERIE'#9'3'#9'Serie'#9'T');
   dbgGridSerie.Selected.Add('NFAC'#9'10'#9'Documento'#9'T');
   dbgGridSerie.RedrawGrid;

   If DMFAC.cdsKDXSerie.RecordCount > 0 Then
   Begin
      lblCodigo.caption := dblcdArticulo.Text;
      lblDescripcion.caption := dbeArticulo.Text;
      pnlKDXSerie.Height := 380;
      pnlKDXSerie.Left := 68;
      pnlKDXSerie.Top := 180;
      pnlKDXSerie.Width := 665;
      pnlKDXSerie.BringToFront;
      pnlKDXSerie.visible := True;
   End
   Else
   Begin
      ShowMessage('No existen registros a mostrar')
   End;

End;

Procedure TFFactSGuia.bbtnCancelKDXSerieClick(Sender: TObject);
Begin
   DMFAC.cdsKDXSerie.Cancel;
   pnlKDXSerie.Visible := False;
End;

Procedure TFFactSGuia.bbtnOKKDXSerieClick(Sender: TObject);
Var
   sCondicion, sGlosa: String;
Begin
   If DMFAC.cdsKDXSerie.State In [dsEdit] Then
   Begin
      DMFAC.cdsKDXSerie.Post;
   End;
   sCondicion := 'ARTID=' + QuotedStr(lblCodigo.Caption) + ' ' +
      'AND ENTREGADO=' + QuotedStr('S') + ' ' +
      'AND DOCID=' + QuotedStr(dblcTdoc.Text) + ' ' +
      'AND FACSERIE=' + QuotedStr(dblcSerie.Text) + ' ' +
      'AND NFAC=' + QuotedStr(dbeNFac.Text);

   If length(Trim(dbeCantGA.Text)) = 0 Then
   Begin
      ShowMessage('Ingrese Cantidad');
      dbeCantGA.Text := '0';
      dbeCantGA.SetFocus;
      Exit;
   End;

   If DMFAC.CountFor(DMFAC.cdsKDXSerie, sCondicion) > StrToInt(dbeCantGA.Text) Then
   Begin
      Raise Exception.Create('Debe Seleccionar ' + dbeCantGA.Text + ' artículos. ');
   End
   Else
   Begin
      If DMFAC.CountFor(DMFAC.cdsKDXSerie, sCondicion) < StrToInt(dbeCantGA.Text) Then
      Begin
         Raise Exception.Create('Debe Seleccionar ' + dbeCantGA.Text + ' artículos. ');
      End
      Else
      Begin
         sGlosa := '';
         If DMFAC.cdsKDXSerie.ApplyUpdates(0) > 0 Then
         Begin
            xContinuaGrab := False;
            ShowMessage('No se pudo actualizar archivo de Series');
            exit;
         End;
         pnlKDXSerie.Visible := False;
         DMFAC.cdsKDXSerie.Filter := 'ENTREGADO=' + QuotedStr('S') + ' AND ' +
            'DOCID=' + QuotedStr(dblcTdoc.Text) + ' AND ' +
            'FACSERIE=' + QuotedStr(dblcSerie.Text) + ' AND ' +
            'NFAC=' + QuotedStr(dbeNFac.Text);
         DMFAC.cdsKDXSerie.Filtered := True;
         DMFAC.cdsKDXSerie.First;
         If DMFAC.cdsKDXSerie.RecordCount > 0 Then
         Begin
            sGlosa := sGlosa + lblDescripcion.caption + '   ';
            If Length(DMFAC.cdsKDXSerie.FieldByName('MARCA').AsString) > 0 Then
               sGlosa := sGlosa + 'MARCA: ' + DMFAC.cdsKDXSerie.FieldByName('MARCA').AsString + '   ';
            If Length(DMFAC.cdsKDXSerie.FieldByName('MODELO').AsString) > 0 Then
               sGlosa := sGlosa + 'MODELO: ' + DMFAC.cdsKDXSerie.FieldByName('MODELO').AsString + '   ';
            While Not DMFAC.cdsKDXSerie.EOF Do
            Begin
               sGlosa := sGlosa + 'N/S: ' + DMFAC.cdsKDXSerie.FieldByName('ACFSERIE').AsString + ' ';
               If Length(DMFAC.cdsKDXSerie.FieldByName('COLOR').AsString) > 0 Then
                  sGlosa := sGlosa + 'COLOR: ' + DMFAC.cdsKDXSerie.FieldByName('COLOR').AsString + ' ';
               DMFAC.cdsKDXSerie.Next;
            End;
            memDetArt.Clear;
            memDetArt.Lines.Add(sGlosa);
         End;
         DMFAC.cdsKDXSerie.Filtered := False;
      End;
   End;
End;

Procedure TFFactSGuia.dbgGridSerieFieldChanged(Sender: TObject;
   Field: TField);
Begin
   If Field.FieldName = 'ENTREGADO' Then
   Begin
      If DMFAC.cdsKDXSerie.FieldByName('ENTREGADO').AsString = 'S' Then
      Begin
         DMFAC.cdsKDXSerie.FieldByName('DOCID').AsString := dblcTdoc.Text;
         DMFAC.cdsKDXSerie.FieldByName('FACSERIE').AsString := dblcSerie.Text;
         DMFAC.cdsKDXSerie.FieldByName('NFAC').AsString := dbeNFac.Text;
         DMFAC.cdsKDXSerie.FieldByName('TDAID2').AsString := DMFAC.wTdaFid;
      End
      Else
      Begin
         If (DMFAC.cdsKDXSerie.FieldByName('FACSERIE').AsString = dblcSerie.Text) And
            (DMFAC.cdsKDXSerie.FieldByName('DOCID').AsString = dblcTdoc.Text) And
            (DMFAC.cdsKDXSerie.FieldByName('NFAC').AsString = dbeNFac.Text) Then
         Begin
            DMFAC.cdsKDXSerie.FieldByName('DOCID').AsString := '';
            DMFAC.cdsKDXSerie.FieldByName('FACSERIE').AsString := '';
            DMFAC.cdsKDXSerie.FieldByName('NFAC').AsString := '';
            DMFAC.cdsKDXSerie.FieldByName('TDAID2').AsString := '';
         End
         Else
         Begin
            DMFAC.cdsKDXSerie.Cancel;
         End;
      End;
   End;
End;

Procedure TFFactSGuia.VerificaNumeroSerie;
Var
   sSQL: String;
Begin
   If xflaginsert Then
      sSQL := 'CIAID =' + QuotedStr(dblcCia.Text) + ' AND TINID =' + QuotedStr(dblcTInv.Text) + ' AND ARTID =' + QuotedStr(dblcdArticulo.text)
   Else
      sSQL := 'CIAID =' + QuotedStr(dblcCia.Text) + ' AND TINID =' + QuotedStr(dblcTInv.Text) + ' AND ARTID =' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);

   If ((wFSerie = 'S') And (DMFAC.BuscaQry('dspUltTGE', 'TGE205', 'FNSERIE', sSQL, 'FNSERIE') = 'S')) Then
   Begin
      If xflaginsert Then
      Begin
         sSQL := 'SELECT * FROM LOG332 ' +
            'WHERE CIAID =' + QuotedStr(dblcCia.Text) +
            ' AND LOCID =' + QuotedStr(dblcLocal.Text) +
            ' AND TINID =' + QuotedStr(dblcTInv.Text) +
            ' AND ALMID =' + QuotedStr(sAlmacen) +
            ' AND ENTREGADO =' + QuotedStr('S') +
            ' AND DOCID =' + QuotedStr(dblcTdoc.Text) +
            ' AND FACSERIE =' + QuotedStr(dblcSerie.Text) +
            ' AND NFAC =' + QuotedStr(dbeNFac.Text) +
            ' AND ARTID=' + QuotedStr(dblcdArticulo.text);

         DMFAC.cdsQry.close;
         DMFAC.cdsQry.DataRequest(sSQL);
         DMFAC.cdsQry.Open;

         If length(Trim(dbeCantGA.Text)) = 0 Then
         Begin
            dbeCantGA.Text := '0';
         End;

         If DMFAC.cdsQry.RecordCount <> StrToInt(dbeCantGA.text) Then
         Begin
            Screen.Cursor := crDefault;
            Raise Exception.Create('Falta Registrar Número de Serie del Artículo: ' + dblcdArticulo.text);
         End;
      End
      Else
      Begin
         sSQL := 'SELECT * FROM LOG332 ' +
            'WHERE CIAID =' + QuotedStr(dblcCia.Text) +
            ' AND LOCID =' + QuotedStr(dblcLocal.Text) +
            ' AND TINID =' + QuotedStr(dblcTInv.Text) +
            ' AND ALMID =' + QuotedStr(DMFAC.cdsTLPrecio.FIELDBYNAME('ALMID').ASSTRING) +
            ' AND ENTREGADO =' + QuotedStr('S') +
            ' AND DOCID =' + QuotedStr(dblcTdoc.Text) +
            ' AND FACSERIE =' + QuotedStr(dblcSerie.Text) +
            ' AND NFAC =' + QuotedStr(dbeNFac.Text) +
            ' AND ARTID=' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);

         DMFAC.cdsQry.close;
         DMFAC.cdsQry.DataRequest(sSQL);
         DMFAC.cdsQry.Open;
         If DMFAC.cdsQry.RecordCount <> DMFAC.cdsDetFact2.FieldByName('DFACCANTG').AsInteger Then
         Begin
            Screen.Cursor := crDefault;
            Raise Exception.Create('Falta Registrar Número de Serie del Artículo: ' + DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
         End;
      End;
   End;
End;

Procedure TFFactSGuia.dblcSerieNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFFactSGuia.dblcdClieRucExit(Sender: TObject);
Var
   xSQL: String;
Begin

   If btnExec.Focused Then Exit;

   If Length(DMFAC.cdsFact2.FieldByName('CLIEID').AsString) > 0 Then
   Begin
      If DMFAC.cdsFact2.FieldByName('FACTCLI').AsString = '01' Then
      Begin
         xSQL := 'ASOID =' + QuotedStr(dblcdAso.Text);
         DMFAC.BuscaQry('dspUltTGE', 'APO201', '*', xSQL, 'ASOID');
         If Length(Trim(DMFAC.cdsQry.FieldByName('ASORUC').AsString)) > 0 Then //Si el Asociado tiene RUC
         Begin
            If DMFAC.cdsFact2.FieldByName('CLIERUC').AsString <> Trim(DMFAC.cdsQry.FieldByName('ASORUC').AsString) Then
            Begin
               MessageDlg('El Número de RUC No le Corresponde al Asociado', mtInformation, [mbOk], 0);
               DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsQry.FieldByName('ASORUC').AsString;
               dblcdClieRuc.SetFocus;
               Exit;
            End;
         End;
      End
      Else
      Begin
         xSQL := 'CLIEID =' + QuotedStr(dblcdAso.Text);
         DMFAC.BuscaQry('dspUltTGE', 'TGE204', '*', xSQL, 'CLIEID');
         If Length(Trim(DMFAC.cdsQry.FieldByName('CLIERUC').AsString)) > 0 Then //Si el Cliente tiene RUC
         Begin
            If DMFAC.cdsFact2.FieldByName('CLIERUC').AsString <> Trim(DMFAC.cdsQry.FieldByName('CLIERUC').AsString) Then
            Begin
               MessageDlg('El Número de RUC No le Corresponde al Cliente', mtInformation, [mbOk], 0);
               DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsQry.FieldByName('CLIERUC').AsString;
               dblcdClieRuc.SetFocus;
               Exit;
            End;
         End;
      End;
   End;
End;

Procedure TFFactSGuia.dbePorcentajeExit(Sender: TObject);
Begin
   If DMFAC.cdsFact2.FieldByName('FACDSCTO1').AsFloat > 100 Then
   Begin
      Beep;
      MessageDlg('El Descuento NO puede ser Mayor que 100', mtInformation, [mbOk], 0);
      DMFAC.cdsFact2.FieldByName('FACDSCTO1').AsFloat := 0;
      dbePorcentaje.SetFocus;
      Exit;
   End;
End;

Procedure TFFactSGuia.dbeTCambioKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In ['A'..'Z', 'a'..'z',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '-', '_'] Then
      Key := #0;
End;

Procedure TFFactSGuia.dbeGarantiaKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key In ['A'..'Z', 'a'..'z',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '.', '-', '_'] Then
      Key := #0;
End;

Procedure TFFactSGuia.dblcSerieGuiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFFactSGuia.FormCreate(Sender: TObject);
Begin
   xFecHoy := DMFAC.DateS;
   xEnvioSunat := '';

   DMFAC.cdsReporte.Close;
   DMFAC.cdsQry1.Filter := '';
   DMFAC.cdsQry1.IndexFieldNames := '';
   DMFAC.cdsQry1.Close;
   DMFAC.cdsQry2.Filter := '';
   DMFAC.cdsQry2.IndexFieldNames := '';
   DMFAC.cdsQry2.Close;
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.Close;

   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');
   DMFAC.FiltraTabla(DMFAC.cdsTClie, 'FAC121', 'TCLIEID');
   DMFAC.FiltraTabla(DMFAC.cdsAlmacen, 'TGE151', 'ALMID');
   DMFAC.FiltraTabla(DMFAC.cdsTLista, 'FAC101', 'TLISTAID');
   DMFAC.FiltraTabla(DMFAC.cdsTMon, 'TGE103', 'TMONID');

   Filtracds(DMFAC.cdsTDoc, 'SELECT * FROM TGE110 WHERE DOCMOD =''CXC'' AND (DOCTIPREG=''F'' OR DOCTIPREG=''B'' OR DOCTIPREG=''T'')');

   DMFAC.cdsTInven.close;
   DMFAC.cdsTInven.DataRequest('SELECT * FROM TGE152 WHERE TINVENTAS=''S'' ');
   DMFAC.cdsTInven.open;

   DMFAC.FiltraTabla(DMFAC.cdsTipSol, 'TGE173', 'TIPOADQ');
   DMFAC.cdsTipSol.Filtered := False;
   DMFAC.cdsTipSol.Filter := '';
   DMFAC.cdsTipSol.Filter := 'FLAG=''S''';
   DMFAC.cdsTipSol.Filtered := True;

   DMFAC.BuscaQry('dspUltTGE', 'TGE102', 'CLAUXID', 'TAUXID =''AS''', 'CLAUXID');
   xClauxAso := DMFAC.cdsQry.FieldByName('CLAUXID').AsString;

   DMFAC.cdsVen.Close;
   DMFAC.cdsVen.DataRequest('SELECT * FROM CXC203 WHERE CIAID =''' + dblcCia.Text + ''' AND NVL(VESTATUS,''N'')=''S''');
   DMFAC.cdsVen.Open;

   CargaDataSource;
End;

Procedure TFFactSGuia.CargaDataSource;
Var
   xSQL: String;
Begin
// Cabecera
   dblcCia.DataSource := DMFAC.dsFact2;
   dblcCia.LookupTable := DMFAC.cdsCia;

   dblcLocal.DataSource := DMFAC.dsFact2;
   dblcLocal.LookupTable := DMFAC.cdsLocal;

   dblcTipoCompra.DataSource := DMFAC.dsFact2;
   dblcTipoCompra.DataSource := DMFAC.dsFact2;

   dblcTInv.DataSource := DMFAC.dsFact2;
   dblcTInv.LookupTable := DMFAC.cdsTInven;

   dblcAlmacen.DataSource := DMFAC.dsFact2;
   dblcAlmacen.LookupTable := DMFAC.cdsAlmacen;

   dblcTdoc.DataSource := DMFAC.dsFact2;
   dblcTdoc.LookupTable := DMFAC.cdsTDoc;

   dtpFFac.DataSource := DMFAC.dsFact2;

   dblcTClie.DataSource := DMFAC.dsFact2;
   dblcTClie.LookupTable := DMFAC.cdsTClie;

   dblcdClieRuc.DataSource := DMFAC.dsFact2;
   dblcdClieRuc.LookupTable := DMFAC.cdsClie;
   dblcdAso.DataSource := DMFAC.dsFact2;
   edtClie.DataSource := DMFAC.dsFact2;

   dblcdProf.DataSource := DMFAC.dsFact2;

   dblcSerie.DataSource := DMFAC.dsFact2;
   dblcSerie.LookupTable := DMFAC.cdsSerie;
   dblcSerie.DataField := 'FACSERIE';

   dbeNFac.DataSource := DMFAC.dsFact2;
   edtDireccion.DataSource := DMFAC.dsFact2;
   dbeCredito.DataSource := DMFAC.dsFact2;
   dbeGarantia.DataSource := DMFAC.dsFact2;

   dblcFPago.DataSource := DMFAC.dsFact2;
   dblcFPago.LookupTable := DMFAC.cdsCComer;

   dbePorcentaje.DataSource := DMFAC.dsFact2;

   dblcLentrega.DataSource := DMFAC.dsFact2;
   dblcLentrega.LookupTable := DMFAC.cdsDireccion;

   dblcLPrecio.DataSource := DMFAC.dsFact2;
   dblcLPrecio.LookupTable := DMFAC.cdsTLista;

   dblcTMon.DataSource := DMFAC.dsFact2;
   dblcTMon.LookupTable := DMFAC.cdsTMon;

   dbeTCambio.DataSource := DMFAC.dsFact2;
   dbeMonto.DataSource := DMFAC.dsFact2;
   dbeOpe.DataSource := DMFAC.dsFact2;
   dtpFecOpe.DataSource := DMFAC.dsFact2;

   dblcVen.DataSource := DMFAC.dsFact2;
// Inicio FAC-201806
// 31/10/2018 Asigna Campo de Vendedor a Variable
   dblcVen.DataField := 'VEID';
// Fin FAC-201806
   dblcVen.LookupTable := DMFAC.cdsVen;

   dtpFVcmto.DataSource := DMFAC.dsFact2;

   dbmObs.DataSource := DMFAC.dsFact2;

   lblEstado.DataSource := DMFAC.dsFact2;

   dblcOfide.DataSource := DMFAC.dsFact2;
   dblcOfide.LookupTable := DMFAC.cdsTransf;

// Detalle
   dbgDetFac.DataSource := DMFAC.dsDetFact2;
   dbgStock.DataSource := DMFAC.dsQry4;
   dbgGridSerie.DataSource := DMFAC.dsKDXSerie;
   ppDBFactura.DataSource := DMFAC.dsReporte;
   ppDBCabFactura.DataSource := DMFAC.dsQry6;
   Data.DataSource := DMFAC.dsReporte;
   dblcdArticulo.LookupTable := DMFAC.cdsArticulo;
   dblcTipoCompra.LookupTable := DMFAC.cdsTipSol;

// Cargando Lista de Impresoras disponibles
   xSQL := 'Select R.IMP_ID, R.IMP_DES, R.IMP_IP '
      + '  From DB2ADMIN.FAC_FE_PVTA T, DB2ADMIN.FAC_FE_IMPR R  '
      + '  Where T.CIAID   = ' + QuotedStr(dblcCia.Text)
      + '   And  T.TIE_ID  = ' + QuotedStr(xTienda)
      + '   And  R.IMP_ID  = T.IMP_ID '
      + '   And  nvl(R.IMP_ACTIVO,''N'')=''S'' ';
   DMFAC.cdsQry10.close;
   DMFAC.cdsQry10.DataRequest(xSQL);
   DMFAC.cdsQry10.Open;
   dblcdImpDest.LookupTable := DMFAC.cdsQry10;
   dblcdImpDest.Selected.Clear;
   dblcdImpDest.Selected.Add('IMP_ID'#9'12'#9'Código'#9'F');
   dblcdImpDest.Selected.Add('IMP_DES'#9'20'#9'Descripción'#9'F');
   dblcdImpDest.Selected.Add('IMP_IP'#9'15'#9'IP'#9'F');

End;

Procedure TFFactSGuia.FormShow(Sender: TObject);
Var
   xTCambio: double;
   Y, M, D: Word;
   sAlmacen: String;
   xWhere, xSQL: String;
Begin
   xAdicArt := 'N';
   xNoPasa := 'S';
   pnlRegistro.Visible := False;
   pnlDetalleA.Visible := False;
   fTipoInc := 0;
   xImpTasa19 := '19.00';
   xImpTasa := DMFAC.BuscaQry('dspUltTGE', 'TGE108', 'TASACAN', 'TASAFLG =''I''', 'TASACAN');

   LimpiarCampos;

   dtpFFac.Enabled := False;
   dblcOfide.Enabled := False;

   xCrea := False;

   DMFAC.cdsFact2.EnableControls;

   IniciaForma;

   If DMFAC.wModo = 'A' Then
   Begin
      Label11.caption := 'Número Provisional';
      wSQL := 'SELECT * FROM TGE110 WHERE DOCMOD =''CXC'' AND (DOCTIPREG=''F'' OR DOCTIPREG=''B'' OR DOCTIPREG=''T'')';
      Filtracds(DMFAC.cdsTDoc, wSQL);

      xFiltro := 'SELECT * FROM FAC305 WHERE 1<>1';
      DMFAC.cdsFact2.Close;
      DMFAC.cdsFact2.DataRequest(xFiltro);
      DMFAC.cdsFact2.Open;

      DMFAC.cdsFact2.Insert;

      InicializaPorUsuario;

      xCrea := True;

      dtpFFac.date := xFecHoy;
      DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime := dtpFFac.date;

   // esto se hace para asignar el Tipo de Cambio de la Factura
      xWhere := 'TMONID =' + QuotedStr(DMFAC.wTMonExt)
         + ' AND FECHA = ' + DMFAC.wRepFuncDate + '''' + FormatDateTime(DMFAC.wFormatFecha, dtpFFac.date) + '''' + ')';
      If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xWhere, 'TMONID')) > 0 Then
      Begin
         xTCambio := DMFAC.cdsQry.FieldByName('TCAMVBV').AsFloat;
         DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat := xTCambio;
      End
      Else
      Begin
         ShowMessage('Fecha No tiene Tipo de Cambio');
         dblcCia.SetFocus;
         Exit;
      End;

      DMFAC.cdsFact2.FieldByName('FACDSCTO1').AsFloat := 0;

      DMFAC.cdsFact2.FieldByName('CLIECREMAX').AsFloat := 0;
      DMFAC.cdsFact2.FieldByName('FACIGV2MN').AsFloat := 0;
      DMFAC.cdsFact2.FieldByName('FACIGV2ME').AsFloat := 0;
      DMFAC.cdsFact2.FieldByName('FACIGV2MO').AsFloat := 0;

      DMFAC.cdsFact2.FieldByName('FACESTADO').AsString := 'INICIAL';

      DMFAC.cdsFact2.FieldByName('FACTCLI').AsString := '02';
      DMFAC.xTipCli := 'S';
      dblcdAso.Visible := True;
      btnExec.Visible := True;

      DMFAC.cdsFact2.FieldByName('FACTOBS').Clear;
      dbmObs.Text := '';

      dtpFVcmto.date := xFecHoy;
      DMFAC.cdsFact2.FieldByName('FACFEVCMTO').AsDateTime := xFecHoy;

      EstadoDeForma(0, DMFAC.cdsFact2.FieldByName('FACESTADO').AsString);

      dblcCia.SetFocus;
   End
   Else
      If DMFAC.wModo = 'M' Then
      Begin
         vCiaid := DMFAC.cdsFact2.FieldByName('CIAID').AsString;
         vClieid := DMFAC.cdsFact2.FieldByName('CLIEID').AsString;
         vFacserie := DMFAC.cdsFact2.FieldByName('FACSERIE').AsString;
         vNfac := DMFAC.cdsFact2.FieldByName('NFAC').AsString;

         dtpFFac.date := xFecHoy;
      // Inicio FAC-201806
      // 30/10/2018 Sólo cambia de fecha si Estado=INICIAL
      // esto se hace para asignar el Tipo de Cambio de la Factura
         If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString='INICIAL' Then
         Begin
            DMFAC.cdsFact2.FieldByName('FACFECHA').AsDateTime := dtpFFac.date;
            xWhere := 'TMONID =' + QuotedStr(DMFAC.wTMonExt)
               + ' AND FECHA = ' + DMFAC.wRepFuncDate + '''' + FormatDateTime(DMFAC.wFormatFecha, dtpFFac.date) + '''' + ')';
            If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xWhere, 'TMONID')) > 0 Then
            Begin
               xTCambio := DMFAC.cdsQry.FieldByName('TCAMVBV').AsFloat;
               DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat := xTCambio;
            End
            Else
            Begin
               ShowMessage('Fecha No tiene Tipo de Cambio');
               dblcCia.SetFocus;
               Exit;
            End;
         End;
      // Fin FAC-201806

         vFacFecha := DMFAC.cdsFact2.FieldByName('FACFECHA').AsString;

         If (length(trim(dblcdClieRuc.Text)) = 0) And (length(trim(DMFAC.cdsFact2.FieldByName('CLIERUC').AsString)) > 0) Then
            dblcdClieRuc.Text := DMFAC.cdsFact2.FieldByName('CLIERUC').AsString;
         dblcSerie.Text := DMFAC.cdsFact2.FieldByName('FACSERIE').AsString;

         Label11.caption := 'Número Factura';
         dbmObs.Text := DMFAC.cdsFact2.FieldByName('FACTOBS').AsString;

         edtDireccion.Text := DMFAC.cdsFact2.FieldByName('CLIEDIR').AsString;
         dbePorcentaje.Text := DMFAC.cdsFact2.FieldByName('FACDSCTO1').AsString;

         DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEID,TCLIEFLAG,TCLIEDES', 'TCLIEID=' + '''' + dblcTClie.Text + '''', 'TCLIEFLAG');
         DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;
         edtTClie.Text := DMFAC.cdsQry.FieldByName('TCLIEDES').AsString;
         If DMFAC.xTipCli = 'S' Then
         Begin
            If DMFAC.cdsClie.Active = False Then
            Begin
               xFiltro := 'Select * '
                  + '  from TGE204 '
                  + ' where CLIEID=' + quotedstr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString);
               DMFAC.cdsClie.Close;
               DMFAC.cdsClie.DataRequest(xFiltro);
               DMFAC.cdsClie.Open;
            End;

            dblcdAso.Visible := True;
            btnExec.Visible := False;

            If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString = 'INICIAL' Then
            Begin
               DMFAC.cdsClie.Locate('CLAUXID;CLIEID', VarArrayOf([DMFAC.cdsFact2.FieldByName('CLAUXID').AsString, dblcdAso.Text]), []);

               If (DMFAC.cdsFact2.FieldByName('CLIERUC').AsString = '') Or
                  (Length(Trim(DMFAC.cdsFact2.FieldByName('CLIERUC').AsString)) < 8) Then
               Begin
                  xWhere := 'CLAUXID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CLAUXID').AsString) + ' AND CLIEID=' + QuotedStr(dblcdAso.Text);
                  DMFAC.BuscaQry('dspUltTGE', 'TGE204', 'CLIERUC, CLIEDNI', xWhere, 'CLIERUC');
                  If Length(Trim(DMFAC.cdsQry.FieldByName('CLIERUC').AsString)) < 11 Then
                  Begin
                     If Length(Trim(DMFAC.cdsQry.FieldByName('CLIEDNI').AsString)) = 8 Then
                     Begin
                        DMFAC.cdsFact2.Edit;
                        DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsQry.FieldByName('CLIEDNI').AsString;
                     End;
                  End
                  Else
                  Begin
                     DMFAC.cdsFact2.Edit;
                     DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsQry.FieldByName('CLIERUC').AsString;
                  End;
               End;
            End;

         End
         Else
         Begin
            dblcdAso.Visible := True;
            btnExec.Visible := True;
         End;

         edtClie.Text := DMFAC.cdsFact2.FieldByName('CLIEDES').AsString;

         xWhere := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString) + ' AND CLIEID=' + QuotedStr(dblcdAso.Text);

         Filtracds(DMFAC.cdsDireccion, 'SELECT * FROM FAC110 WHERE ' + xWhere + ' ORDER BY CLIEDIRID'); //Lugar de entrega 08/03
         lblNLugarE.Caption := floattostr(DMFAC.cdsDireccion.RecordCount);
         DMFAC.cdsDireccion.IndexFieldNames := 'CIAID; CLIEID; CLIEDIRID';
         xWhere := 'CIAID = ' + QuotedStr(dblcCia.Text)
            + ' AND CLIEID = ' + QuotedStr(dblcdAso.Text)
            + ' AND CLIEDIRID = ' + QuotedStr(dblcLEntrega.Text);
         edtLentrega.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC110', 'CLIEDIRENT', xWhere, 'CLIEDIRENT');

         xWhere := 'TLISTAID = ' + QuotedStr(dblcLPrecio.Text);
         edtLPrecio.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC101', 'TLISTADES', xWhere, 'TLISTADES');
         If length(edtLPrecio.Text) > 0 Then
            xLPrecio := True;

         dbeTCambio.Text := DMFAC.cdsFact2.FieldByName('FACTCAM').AsString;
         xWhere := 'TMONID =' + QuotedStr(dblcTMon.Text) + ' and (TMON_LOC=' + Quotedstr('L') + ' or TMON_LOC=' + Quotedstr('E') + ')';
         edtTMon.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');

         dblcFPago.Enabled := False;
         xWhere := 'CCOMERID =' + QuotedStr(dblcFPago.Text) + ' AND SCOMERID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('TIPVTAID').AsString);
         edtFPago.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE180', 'condpid, DCCOMDES,DCCOMPORC', xWhere, 'DCCOMDES');
         If dmfac.cdsQry.FieldByName('condpid').AsString = 'VC' Then
         Begin
            dblcFPago.Enabled := False;
            dblcOfide.Enabled := True;
         End;

      // Inicio FAC-201806
      // 26/10/2018 Incluye Compañía en búsqueda de Código de Vendedor
         xWhere := 'CIAID=' + QuotedStr(dblcCia.Text) + ' and VEID =' + QuotedStr(dblcVen.Text);
      // Fin FAC-201806
         edtVen.Text := DMFAC.BuscaQry('dspUltTGE', 'CXC203', 'VEID,VENOMBRES,VEFLAG', xWhere, 'VENOMBRES');

         xWhere := 'OFDESID=' + QuotedStr(dblcOfide.Text) + ' AND SUBSTR(OFDESID,1,1)<>''M''';
         edtOfdes.Text := DMFAC.BuscaQry('dspUltTGE', 'APO110', 'OFDESNOM', xWhere, 'OFDESNOM');

         xWhere := 'CIAID = ' + QuotedStr(dblcCia.Text) + ' AND ' +
            'LOCID = ' + QuotedStr(dblcLocal.Text) + ' AND ' +
            'TINID = ' + QuotedStr(dblcTInv.Text) + ' AND ' +
            'ALMID = ' + QuotedStr(dblcAlmacen.Text);

         xCiaEnviar := dblcCia.Text;

         DMFAC.cdsFact2.Edit;
         xFiltro := 'CIAID=' + QuotedStr(dblcCia.Text)
            + ' AND DOCID=' + QuotedStr(dblcTdoc.Text)
            + ' AND FACSERIE=' + QuotedStr(dblcSerie.Text)
            + ' AND NFAC=' + QuotedStr(dbeNFac.Text)
            + ' ORDER BY DFACITEM';
         Filtracds(DMFAC.cdsDetFact2, 'SELECT * FROM FAC306 WHERE ' + xFiltro);

      // Inicio FAC-201806
      // 26/10/2018 cambia display de importes a 2 dígitos
         {
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).DisplayFormat := '######,##0.0000';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).EditFormat := '########0.0000';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).DisplayFormat := '######,##0.0000';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).EditFormat := '########0.0000';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).DisplayFormat := '######,##0.0000';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).EditFormat := '########0.0000';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).DisplayFormat := '######,##0.0000';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).EditFormat := '########0.0000';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).DisplayFormat := '######,##0.0000';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).EditFormat := '########0.0000';
         }
         {
         dbgDetFac.Selected.Clear;
         dbgDetFac.Selected.Add('DFACITEM'#9'03'#9'Item');
         dbgDetFac.Selected.Add('ARTID'#9'08'#9'Artículo');
         dbgDetFac.Selected.Add('ARTDES'#9'28'#9'Descripción');
         dbgDetFac.Selected.Add('UNMIDG'#9'03'#9'U/M');
         dbgDetFac.Selected.Add('DFACCANTAT'#9'04'#9'Cant.');
         dbgDetFac.Selected.Add('ALMID'#9'03'#9'Alm.');
         dbgDetFac.Selected.Add('DFACPREUMO'#9'10'#9'Precio');
         dbgDetFac.Selected.Add('DFACDTOMO2'#9'10'#9'Dctos.~2');
         dbgDetFac.Selected.Add('DFACMTOMO'#9'10'#9'Precio~Venta');
         dbgDetFac.Selected.Add('DFACIMPMTO1'#9'10'#9'Igv');
         dbgDetFac.Selected.Add('DFACSERMO'#9'10'#9'Servicio');
         dbgDetFac.Selected.Add('DFACVTOTMO'#9'10'#9'Precio~Total');
         dbgDetFac.ApplySelected;
         dbgDetFac.ColumnByName('ARTDES').FooterValue := 'Total:';
         dbgDetFac.RedrawGrid;
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).DisplayFormat := '######,##0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO')).EditFormat := '########0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).DisplayFormat := '######,##0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO')).EditFormat := '########0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).DisplayFormat := '######,##0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2')).EditFormat := '########0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).DisplayFormat := '######,##0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO')).EditFormat := '########0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1')).DisplayFormat := '######,##0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1')).EditFormat := '########0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACSERMO')).DisplayFormat := '######,##0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACSERMO')).EditFormat := '########0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).DisplayFormat := '######,##0.00';
         TNumericField(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO')).EditFormat := '########0.00';
         }
      // Fin FAC-201806
         CalculaFooter;

         dblcCIA.OnExit(dblcCIA);
         dblcLocal.OnExit(dblcLocal);
         dblcTipoCompra.OnExit(dblcTipoCompra);
         dblcTInv.OnExit(dblcTInv);
         dblcAlmacen.OnExit(dblcAlmacen);
         dblcTdoc.OnExit(dblcTdoc);
         dblcFPago.OnExit(dblcFPago);
      // Inicio FAC-201806
      // 26/10/2018 ya existe rutina líneas arriba
         // dblcVen.OnExit(dblcVen);
      // Fin FAC-201806
         dblcLPrecio.OnExit(dblcLPrecio);
         dblcTMon.OnExit(dblcTMon);

         DecodeDate(dtpFFac.Date, Y, M, D);

      End;

      sAlmacen := ' AND C.ALMID IN (''' + dblcAlmacen.Text + ''') ';
   // Inicio FAC-201806
   // 31/10/2018 Reordena Sangría de script
      If (dblcCia.Text = '04') And (dblcAlmacen.Text = '14') Then
         sAlmacen := ' AND C.ALMID IN (''' + dblcAlmacen.Text + ''', ''15'') ';
   // Fin FAC-201806

      DecodeDate(dtpFFac.Date, Y, M, D);
      Begin
      // Inicio FAC-201806
      // 29/10/2018 se corrije orden de campos en where para que tome correctamente los índices
         {
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
            + '                          and E.CIAID=F.CIAID AND F.ARTID=A.ARTID AND F.FLGSERV=''S'' '
            + '                          and G.TREGID=''07''),0) TASSERV '
            + '             from TGE205 A, FAC201 B, LOG319 C, TGE108 D '
            + '            where nvl(A.ARTEST,''VACIO'')<>''A'' '
            + '              and A.CIAID=B.CIAID AND A.TINID=B.TINID AND A.ARTID=B.ARTID '
            + '              and B.CIAID=' + QuotedStr(dblcCia.Text) + ' AND B.TINID=' + QuotedStr(dblcTInv.Text)
            + '              and B.TLISTAID=' + QuotedStr(dblcLPrecio.Text)
            + '              and C.CIAID=A.CIAID '
            + '              and C.TINID=A.TINID '
            + '              and C.LOGANOMM=' + IntToStr(Y) + DMFAC.StrZero(inttostr(M), 2)
            + '              and C.ARTID=A.ARTID '
            + sAlmacen
            + '              and nvl(C.STKFIN,0)>0 '
            + '              and D.TASAFLG=''I'')';
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
      // Fin FAC-201806
         DMFAC.cdsTLPrecio.Close;
         DMFAC.cdsTLPrecio.DataRequest(xSQL);
         DMFAC.cdsTLPrecio.Open;
         DMFAC.cdsTLPrecio.Filtered := False;
         DMFAC.cdsTLPrecio.Filter := '';

      // Inicio FAC-201806
      // 26/10/2018 cambia display de importes a 2 dígitos
         {
         TNumericField(DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO')).DisplayFormat := '########0.0000';
         TNumericField(DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO')).EditFormat := '########0.0000';
         TNumericField(DMFAC.cdsTLPrecio.FieldByName('PRECIO_PUB')).DisplayFormat := '########0.0000';
         TNumericField(DMFAC.cdsTLPrecio.FieldByName('PRECIO_PUB')).EditFormat := '########0.0000';
         }
         TNumericField(DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO')).DisplayFormat := '########0.00';
         TNumericField(DMFAC.cdsTLPrecio.FieldByName('LPREPREGMO')).EditFormat := '########0.00';
         TNumericField(DMFAC.cdsTLPrecio.FieldByName('PRECIO_PUB')).DisplayFormat := '########0.00';
         TNumericField(DMFAC.cdsTLPrecio.FieldByName('PRECIO_PUB')).EditFormat := '########0.00';
      // Fin FAC-201806
      End;

      If dblcTInv.Text = '00' Then
      Begin
         If DMFAC.cdsVende.Active=False Then
         Begin
            xSQL := 'Select A.*, 0 TOTSERV,'
               + '          nvl((Select G.TASA '
               + '                 from TGE101 E, TGE205 F, TGE128 G '
               + '                where E.CIAID=A.CIAID AND E.FLGSERV=''S'' '
               + '                  and E.CIAID=F.CIAID AND F.ARTID=A.ARTID AND F.FLGSERV=''S'' '
               + '                  and G.TREGID=''07''),0) TASSERV '
               + '     from TGE205 A '
               + '    where CIAID=''' + dblcCia.Text + ''' and CONCESION=''S'' '
               + '    order by ARTID';
            DMFAC.cdsVende.Close;
            DMFAC.cdsVende.DataRequest(xSQL);
            DMFAC.cdsVende.Open;
            dblcdServicio.LookupTable := DMFAC.cdsVende;
         End;
      End;

   If (DMFAC.cdsFact2.FieldByName('FACESTADO').AsString = 'INICIAL') And
      ((DMFAC.cdsFact2.FieldByName('FACUSER').AsString = DMFAC.wUsuario) Or
      (Length(trim(DMFAC.cdsFact2.FieldByName('FACUSER').AsString)) = 0)) Then
      EstadoDeForma(0, DMFAC.cdsFact2.FieldByName('FACESTADO').AsString)
   Else
      EstadoDeForma(1, DMFAC.cdsFact2.FieldByName('FACESTADO').AsString);

   If (dblcCia.Enabled = True) And (pnlCab1.Enabled = True) Then
      dblcCia.SetFocus;
   xCrea := False;

   If (DMFAC.cdsFact2.FieldByName('FACESTADO').AsString = 'ACEPTADO') Then
      Z2bbtnReImprime.eNABLED := True;
End;

Procedure TFFactSGuia.InicializaPorUsuario;
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
      Begin
         DMFAC.cdsFact2.FieldByName('CIAID').AsString := DMFAC.cdsQry3.FieldByName('CIAID').AsString;
         dblcCia.OnExit(dblcCia);
      End;

   // Localidad
      If DMFAC.cdsQry3.FieldByName('LOCID').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('LOCID').AsString := DMFAC.cdsQry3.FieldByName('LOCID').AsString;
         dblcLocal.OnExit(dblcLocal);
      End;

   // Tipo de Venta
      If DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('TIPOADQ').AsString := DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString;
         dblcTipoCompra.OnExit(dblcTipoCompra);
      End;

      If DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString = 'C' Then
      Begin
      // Tipo de Inventario
         If DMFAC.cdsQry3.FieldByName('TINID').AsString <> '' Then
         Begin
            DMFAC.cdsFact2.FieldByName('TINID').AsString := DMFAC.cdsQry3.FieldByName('TINID').AsString;
            dblcTInv.OnExit(dblcTInv);
         End;

      // Almacén
         If DMFAC.cdsQry3.FieldByName('ALMID').AsString <> '' Then
         Begin
            DMFAC.cdsFact2.FieldByName('ALMID').AsString := DMFAC.cdsQry3.FieldByName('ALMID').AsString;
            dblcAlmacen.OnExit(dblcAlmacen);
         End;
      End;
      If DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString = 'S' Then
      Begin
   // Tipo de Inventario
         DMFAC.cdsFact2.FieldByName('TINID').AsString := '00';
         dblcTInv.OnExit(dblcTInv);
   // Almacén
         DMFAC.cdsFact2.FieldByName('ALMID').AsString := '00';
         dblcAlmacen.OnExit(dblcAlmacen);
      End;

      If DMFAC.cdsQry3.FieldByName('DOCID').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('DOCID').AsString := DMFAC.cdsQry3.FieldByName('DOCID').AsString;
         dblcTdoc.OnExit(dblcTdoc);
      End;

      If DMFAC.cdsQry3.FieldByName('FACSERIE').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('FACSERIE').AsString := DMFAC.cdsQry3.FieldByName('FACSERIE').AsString;
         dblcSerie.OnExit(dblcSerie);
      End;

      If DMFAC.cdsQry3.FieldByName('FPAGOID').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('FPAGOID').AsString := DMFAC.cdsQry3.FieldByName('FPAGOID').AsString;
         dblcFPago.OnExit(dblcFPago);
      End;

      If DMFAC.cdsQry3.FieldByName('TMONID').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('TMONID').AsString := DMFAC.cdsQry3.FieldByName('TMONID').AsString;
         dblcTMon.OnExit(dblcTMon);
      End;

      If DMFAC.cdsQry3.FieldByName('TLISTAID').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('TLISTAID').AsString := DMFAC.cdsQry3.FieldByName('TLISTAID').AsString;
         dblcLPrecio.OnExit(dblcLPrecio);
      End;

      If DMFAC.cdsQry3.FieldByName('VEID').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('VEID').AsString := DMFAC.cdsQry3.FieldByName('VEID').AsString;
         EdtVen.Text := DMFAC.BuscaQry('dspUltTGE', 'CXC203', 'VENOMBRES', 'CIAID=' + QuotedStr(dblcCia.Text) + ' AND VEID=' + QuotedStr(dblcVen.Text), 'VENOMBRES');
      End;

   Except

   End;
End;

Procedure TFFactSGuia.dblcdProfEnter(Sender: TObject);
Var
   xSQL, xWhere: String;
Begin
   If not btnExec.Focused Then
   Begin
      If length(trim(edtClie.Text))=0 Then
      Begin
         btnExec.SetFocus;
         btnExecClick(Self);
         Exit;
      End;
   End;

   xSQL := 'select * from FAC311 ';
   xWhere := '';
   If (length(trim(dblcCia.Text)) > 0) And (length(trim(edtCia.Text)) > 0) Then
      xWhere := 'CIAID =' + Quotedstr(dblcCia.Text);
   If (length(trim(dblcLocal.Text)) > 0) And (length(trim(edtLocal.Text)) > 0) Then
   Begin
      If length(xWhere) > 0 Then xWhere := xWhere + ' and ';
      xWhere := xWhere + 'LOCID =' + Quotedstr(dblcLocal.Text);
   End;
   If (length(trim(dblcTInv.Text)) > 0) And (length(trim(edtTinv.Text)) > 0) Then
   Begin
      If length(xWhere) > 0 Then xWhere := xWhere + ' and ';
      xWhere := xWhere + 'TINID =' + Quotedstr(dblcTInv.Text);
   End;
   If (length(trim(dblcAlmacen.Text)) > 0) And (length(trim(edtAlmacen.Text)) > 0) Then
   Begin
      If length(xWhere) > 0 Then xWhere := xWhere + ' and ';
      xWhere := xWhere + 'ALMID =' + Quotedstr(dblcAlmacen.Text);
   End;
   If (length(trim(DMFAC.cdsFact2.FieldByName('CLIEID').AsString)) > 0)
      And (length(trim(edtClie.Text)) > 0) Then
   Begin
      If length(xWhere) > 0 Then xWhere := xWhere + ' and ';
      xWhere := xWhere + 'CLIEID =' + Quotedstr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString);
   End;

   If length(xWhere) > 0 Then xWhere := xWhere + ' and ';
   xWhere := xWhere + '(PROFSIT =''ACEPTADO'' or PROFSIT=''INICIAL'') ';
   xSQL := xSQL + 'where ' + xWhere;
   xSQL := xSQL + ' and PROFFECHA>=SYSDATE-32 ';
   xSQL := xSQL + ' ORDER BY PROFID DESC';
   DMFAC.cdsProforma.Filter := '';
   DMFAC.cdsProforma.IndexFieldNames := '';
   DMFAC.cdsProforma.Close;
   DMFAC.cdsProforma.DataRequest(xSQL);
   DMFAC.cdsProforma.Open;
   dblcdProf.LookupTable := DMFAC.cdsProforma;
   dblcdProf.LookupField := 'PROFID';
   dblcdProf.Selected.Clear;
   dblcdProf.Selected.Add('PROFID'#9'12'#9'Proforma');
   dblcdProf.Selected.Add('CIAID'#9'3'#9'Cía');
   dblcdProf.Selected.Add('LOCID'#9'3'#9'Loc');
   dblcdProf.Selected.Add('TINID'#9'5'#9'T.Inv');
   dblcdProf.Selected.Add('ALMID'#9'12'#9'Almacén');
   dblcdProf.Selected.Add('PROFFECHA'#9'11'#9'F.Proforma');
   dblcdProf.Selected.Add('CLAUXID'#9'05'#9'Clase');
   dblcdProf.Selected.Add('CLIEID'#9'16'#9'Cliente/Asociado');
   dblcdProf.Selected.Add('CLIEDES'#9'25'#9'Nombre/Razón Social');
   dblcdProf.Selected.Add('PROFSIT'#9'10'#9'Estado');
   dblcdProf.Enabled := True;
End;

Procedure TFFactSGuia.AceptarProforma;
Var
   xSQL: String;
Begin
   If DMFAC.cdsProforma.State = dsBrowse Then
      DMFAC.cdsProforma.Edit;

   DMFAC.cdsProforma.FieldByName('PROFSIT').AsString := 'ACEPTADO';
   DMFAC.cdsProforma.FieldByName('PROFFLAGD').AsString := 'R';
   DMFAC.cdsProforma.FieldByName('PROFFREG').AsDatetime := xFecHoy; // fecha que registra Usuario
   DMFAC.cdsProforma.Post;
   SQLFiltro := 'CIAID=' + QuotedStr(dblcCia.Text)
      + ' AND CLIEID=' + QuotedStr(DMFAC.cdsProforma.FieldByName('CLIEID').AsString)
      + ' AND PROFID=' + QuotedStr(DMFAC.cdsProforma.FieldByName('PROFID').AsString);
   DMFAC.cdsDetProf.Close;
   DMFAC.cdsDetProf.DataRequest('SELECT * FROM FAC312 WHERE ' + SQLFiltro);
   DMFAC.cdsDetProf.Open;

   DMFAC.cdsDetProf.First;
   While Not DMFAC.cdsDetProf.eof Do
   Begin
      DMFAC.cdsDetProf.Edit;
      DMFAC.cdsDetProf.FieldByName('DPROFESTADO').AsString := 'VENTAS';
      DMFAC.cdsDetProf.FieldByName('DPROFSIT').AsString := 'ACEPTADO'; // Activo
      DMFAC.cdsDetProf.Post;
      DMFAC.cdsDetProf.Next;
   End;
   xSQL := 'Update FAC311 '
      + '      Set PROFSIT=' + quotedstr('ACEPTADO') + ','
      + '          PROFFLAGD=' + quotedstr('R') + ','
      + '          PROFFREG=trunc(sysdate) '
      + '    where CIAID=' + quotedstr(dblcCia.Text)
      + '      and ALMID=' + quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)
      + '      and PROFID=' + quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo actualizar el Estado en la Cabecera de la Proforma');
      xContinuaGrab := False;
      exit;
   End;

   xSQL := 'Update FAC312 '
      + '      Set DPROFESTADO=' + quotedstr('VENTAS') + ','
      + '          DPROFSIT=' + quotedstr('ACEPTADO') + ','
      + '          DPROFFREG=trunc(sysdate), '
      + '          DPROFHREG=sysdate '
      + '    where CIAID=' + quotedstr(dblcCia.Text)
      + '      and ALMID=' + quotedstr(DMFAC.cdsProforma.FieldByName('ALMID').AsString)
      + '      and PROFID=' + quotedstr(DMFAC.cdsProforma.FieldByName('PROFID').AsString);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo actualizar el Estado en el Detalle de la Proforma');
      xContinuaGrab := False;
      exit;
   End;
End;

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
(*
Procedure TFFactSGuia.GeneraRegistroCxC302D(xxTipDet, xxTReg, xxMontoMO,
   xxMontoMN, xxMontoME, xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxDH,
   xxTDoc, xxTDiar, xxNoReg, xxCcosId: String; xcount: integer);
Var
   vSQL, cArtIGV: String;
   vcount: integer;
Begin
   DMFAC.cdsDetFact2.DisableControls;
   DMFAC.cdsDetFact2.First;
   vcount := xcount;

   While Not DMFAC.cdsDetFact2.eof Do
   Begin
   // busca en TGE205 si Articulo es Afecto o Inafecto
      vSQL := 'SELECT ARTIGV, ART_IGV_EXO FROM TGE205 '
         + ' WHERE CIAID =''' + DMFAC.cdsDetFact2.FieldByName('CIAID').AsString + ''' '
         + '   AND TINID =''' + DMFAC.cdsDetFact2.FieldByName('TINID').AsString + ''' '
         + '   AND GRARID=''' + DMFAC.cdsDetFact2.FieldByName('GRARID').AsString + ''' '
         + '   AND ARTID=''' + DMFAC.cdsDetFact2.FieldByName('ARTID').AsString + ''' ';
      DMFAC.cdsQry15.Close;
      DMFAC.cdsQry15.DataRequest(vSQL);
      DMFAC.cdsQry15.Open;

      If DMFAC.cdsQry15.FieldByname('ARTIGV').AsString = 'N' Then
      Begin
      // Registrar Exonerado de IGV
         If DMFAC.cdsQry15.FieldByname('ART_IGV_EXO').AsString = 'S' Then
         Begin
            xxTipDet := 'ME';
            xxTReg := '08';
         End
         Else
         Begin
            xxTipDet := 'MN';
            xxTReg := '06';
         End;
      End
      Else
      Begin
         xxTipDet := 'MG';
         xxTReg := '01';
      End;

   // busca en TGE131 LA CUENTA 70
      vSQL := 'SELECT CUENTAID '
         + '  FROM TGE131 '
         + ' WHERE CIAID =''' + DMFAC.cdsDetFact2.FieldByName('CIAID').AsString + ''' '
         + '   AND TINID =''' + DMFAC.cdsDetFact2.FieldByName('TINID').AsString + ''' '
         + '   AND GRARID=''' + DMFAC.cdsDetFact2.FieldByName('GRARID').AsString + ''' ';
      DMFAC.cdsQry15.Close;
      DMFAC.cdsQry15.DataRequest(vSQL);
      DMFAC.cdsQry15.Open;

      xxCpto := DMFAC.cdsQry15.FieldByName('CUENTAID').AsString;
      xxCuenta := DMFAC.cdsQry15.FieldByName('CUENTAID').AsString;
      xxMontoMO := DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsString;
      xxMontoMN := DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsString;
      xxMontoME := DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsString;

      GeneraRegistroCxC302(xxTipDet, xxTReg, xxMontoMO, xxMontoMN, xxMontoME, xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxDH, xxTDoc, xxTDiar, xxNoReg, xxCcosId, vCount);
      If Not xContinuaGrab Then
      Begin
         exit;
      End;
      vcount := vcount + 1;
      DMFAC.cdsDetFact2.Next;
   End;
   DMFAC.cdsDetFact2.EnableControls;
End;
*)
// Fin FAC-201806

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
(*
Procedure TFFactSGuia.GeneraRegistroCxC302S(xxTipDet, xxTReg, xxMontoMO,
   xxMontoMN, xxMontoME, xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxDH,
   xxTDoc, xxTDiar, xxNoReg, xxCcosId: String; xcount: integer);
Var
   vSQL, cArtIGV: String;
   vcount: integer;
   vFlagArticuloConDinamica: Boolean;
Begin
   DMFAC.cdsDetFact2.DisableControls;
   DMFAC.cdsDetFact2.First;
   vcount := xcount;

   While Not DMFAC.cdsDetFact2.eof Do
   Begin
   // busca en TGE205 si Articulo es Afecto o Inafecto
      vSQL := 'SELECT ARTIGV FROM TGE205 '
         + 'WHERE CIAID =''' + DMFAC.cdsDetFact2.FieldByName('CIAID').AsString + ''' '
         + 'AND TINID =''' + DMFAC.cdsDetFact2.FieldByName('TINID').AsString + ''' '
         + 'AND GRARID=''' + DMFAC.cdsDetFact2.FieldByName('GRARID').AsString + ''' '
         + 'AND ARTID=''' + DMFAC.cdsDetFact2.FieldByName('ARTID').AsString + ''' ';
      DMFAC.cdsQry15.Close;
      DMFAC.cdsQry15.DataRequest(vSQL);
      DMFAC.cdsQry15.Open;
      If DMFAC.cdsQry15.FieldByname('ARTIGV').AsString = 'N' Then
      Begin
         xxTipDet := 'MN';
         xxTReg := '06';
      End
      Else
      Begin
         xxTipDet := 'MG';
         xxTReg := '01';
      End;

   // busca en TGE170 LA CUENTA 70 TABLA DE SUBFAMILIA
      vSQL := 'SELECT CUENTAID FROM TGE170 '
         + 'WHERE CIAID =''' + DMFAC.cdsDetFact2.FieldByName('CIAID').AsString + ''' '
         + 'AND TINID =''' + DMFAC.cdsDetFact2.FieldByName('TINID').AsString + ''' '
         + 'AND GRARID=''' + DMFAC.cdsDetFact2.FieldByName('GRARID').AsString + ''' '
         + 'AND FAMID=''' + DMFAC.cdsDetFact2.FieldByName('FAMID').AsString + ''' '
         + 'AND SFAMID=''' + DMFAC.cdsDetFact2.FieldByName('SFAMID').AsString + ''' ';
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(vSQL);
      DMFAC.cdsQry.Open;

      xxCpto := DMFAC.cdsQry.FieldByName('CUENTAID').AsString;
      xxCuenta := DMFAC.cdsQry.FieldByName('CUENTAID').AsString;
      xxMontoMO := DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsString;
      xxMontoMN := DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsString;
      xxMontoME := DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsString;

   // para insertar el monto no gravado en la compañia 15
      vFlagArticuloConDinamica := FlagArticuloConDinamica(DMFAC.cdsFact2.FieldByName('CIAID').AsString, DMFAC.cdsFact2.FieldByName('DOCID').AsString, DMFAC.cdsFact2.FieldByName('TMONID').AsString, DMFAC.cdsFact2.FieldByName('FPAGOID').AsString, DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
      If vFlagArticuloConDinamica Then
      Begin
         xxMontoMO := FloatToStr(StrToFloat(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsString) * 0.5) - DMFAC.cdsFact2.FieldByName('FACIGVMO').Value;
         xxMontoMN := FloatToStr(StrToFloat(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsString) * 0.5) - DMFAC.cdsFact2.FieldByName('FACIGVMN').Value;
         xxMontoME := FloatToStr(StrToFloat(DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsString) * 0.5) - DMFAC.cdsFact2.FieldByName('FACIGVME').Value;
      End;
      GeneraRegistroCxC302(xxTipDet, xxTReg, xxMontoMO, xxMontoMN, xxMontoME, xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxDH, xxTDoc, xxTDiar, xxNoReg, xxCcosId, vCount);
      If Not xContinuaGrab Then
      Begin
         exit;
      End;
      vcount := vcount + 1;
      If vFlagArticuloConDinamica Then
      Begin
         xxTipDet := 'MN';
         xxTReg := '06';
         xxCpto := '7080104';
         xxCuenta := '7080104';

         xxMontoMO := FloatToStr(StrToFloat(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsString) * 0.5);
         xxMontoMN := FloatToStr(StrToFloat(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsString) * 0.5);
         xxMontoME := FloatToStr(StrToFloat(DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsString) * 0.5);

         GeneraRegistroCxC302(xxTipDet, xxTReg, xxMontoMO, xxMontoMN, xxMontoME, xxCuenta, xxCpto, xxNFac, xxSerie, xxClie, xxDH, xxTDoc, xxTDiar, xxNoReg, xxCcosId, vCount);
         If Not xContinuaGrab Then
         Begin
            exit;
         End;
         vcount := vcount + 1;
      End;

      DMFAC.cdsDetFact2.Next;
   End;

   DMFAC.cdsDetFact2.EnableControls;
End;
*)
// Fin FAC-201806

Procedure TFFactSGuia.Z2bbtnCambiaCondClick(Sender: TObject);
Var
   xsMultipleFPago: String;
   xsSql: String;
Begin
// Cambiar a que compañía activa forma de pago
   xsSql := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString) + ' AND CCOMERID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FPAGOID').AsString);
   sTipoPago := DMFAC.BuscaQry('dspUltTGE', 'TGE180', 'CONDPID', xsSql, 'CONDPID');
   xsMultipleFPago := DMFAC.BuscaQry('dspUltTGE', 'TGE101', 'MULFORPAG', 'CIAID=' + QuotedStr(dblcCia.Text), 'MULFORPAG');
   If (xsMultipleFPago = 'S') And (sTipoPago = 'VC') Then
   Begin
      Try
         If datetostr(dtpFFac.Date) <> datetostr(DMFAC.DateS) Then
         Begin
            If Not (sSupervisor = 'S') Then
            Begin
               ShowMessage('Solo Puede ser modificado por el Supervisor...');
               Exit;
            End;
         End;

         DMFAC.cdsQry17.Close;
         FFormaPago := TFFormaPago.Create(Self);
         FFormaPago.edtTDoc.text := edtTDoc.text;
         FFormaPago.edtMoneda.text := edtTMon.text;
         FFormaPago.ShowModal;
      Finally
         FFormaPago.Free;
      End;
   End
   Else
   Begin
      Try
         FCondComercial := TFCondComercial.Create(Self);
         FCondComercial.cCia := dblcCia.Text;
         FCondComercial.ShowModal;
      Finally
         FCondComercial.Free;
      End;
   End;
End;

Procedure TFFactSGuia.bbtnRedClick(Sender: TObject);
Var
   nPrecioTmp, nTotal, nIgv: Extended;
   xIGVSN, xSQL: String;
Begin

   xIGVSN := ConIGV();

   If length(Trim(dbeCantGA.Text)) = 0 Then
   Begin
      ShowMessage('Defina la Cantidad correctamente');
      dbeCantGA.Text := '0';
      dbeCantGA.SetFocus;
      Exit;
   End;

   If xIGVSN = 'N' Then
      nTotal := StrToFloat(dbeRed.Text) / StrToFloat(dbeCantGA.Text)
   Else
      nTotal := FRound(StrToFloat(dbeRed.Text) / (1 + StrToFloat(xImpTasa) / 100), 15, 4) / StrToFloat(dbeCantGA.Text);

   dbePrecioG.Text := floattostr(nTotal);
End;

Procedure TFFactSGuia.InsertaDetalleFacturaObservacion;
Var
   xCliente, xSQLD: String;
   xbTipoGrab: String;
Begin
   xCliente := dblcdAso.text;

   xSQLD := 'CIAID =' + QuotedStr(dblcCia.Text) + ' ' +
      'AND CLIEID =' + QuotedStr(xCliente) + ' ' +
      'AND PROFID =' + QuotedStr(dblcdProf.Text);
   DMFAC.BuscaQry('dspUltTGE', 'FAC314', 'DPROFITEM, DARTOBS', xSQLD, 'DARTOBS');

   While Not DMFAC.cdsQry.Eof Do
   Begin

      If Length(Trim(DMFAC.cdsQry.FieldByName('DARTOBS').AsString)) > 0 Then
      Begin
         wSQL := 'CIAID =' + QuotedStr(dblcCia.Text)
            + ' and DOCID =' + QuotedStr(dblcTDoc.Text)
            + ' and FACSERIE =' + QuotedStr(dblcSerie.Text)
            + ' and NFAC =' + QuotedStr(dbeNFac.Text)
            + ' and DFACITEM=' + QuotedStr(DMFAC.cdsQry.FieldByName('DPROFITEM').AsString);
         DMFAC.cdsDetFactObs2.Close;
         DMFAC.cdsDetFactObs2.DataRequest('SELECT * FROM FAC313 WHERE ' + wSQL);
         DMFAC.cdsDetFactObs2.Open;
         If DMFAC.cdsDetFactObs2.RecordCount = 0 Then
         Begin
            xbTipoGrab := 'NUEVO';
            DMFAC.cdsDetFactObs2.Insert;
            DMFAC.cdsDetFactObs2.FieldByName('CIAID').AsString := dblcCia.Text;
            DMFAC.cdsDetFactObs2.FieldByName('DOCID').AsString := dblcTDoc.Text;
            DMFAC.cdsDetFactObs2.FieldByName('FACSERIE').AsString := dblcSerie.Text;
            DMFAC.cdsDetFactObs2.FieldByName('NFAC').AsString := dbeNFac.Text;
            DMFAC.cdsDetFactObs2.FieldByName('DFACITEM').AsString := DMFAC.cdsQry.FieldByName('DPROFITEM').AsString;
            DMFAC.cdsDetFactObs2.FieldByName('DARTOBS').AsString := DMFAC.cdsQry.FieldByName('DARTOBS').AsString;
            DMFAC.cdsDetFactObs2.Post;
         End
         Else
         Begin
            xbTipoGrab := 'MODIFICA';
            DMFAC.cdsDetFactObs2.Edit;
            DMFAC.cdsDetFactObs2.FieldByName('DARTOBS').AsString := DMFAC.cdsQry.FieldByName('DARTOBS').AsString;
            DMFAC.cdsDetFactObs2.Post;
         End;

         Begin
            If xbTipoGrab = 'NUEVO' Then
               xSQLD := 'Insert into FAC313(CIAID, DOCID, FACSERIE, NFAC, DFACITEM, DARTOBS) '
                  + '    values(' + quotedstr(DMFAC.cdsDetFactObs2.FieldByName('CIAID').AsString) + ','
                  + quotedstr(DMFAC.cdsDetFactObs2.FieldByName('DOCID').AsString) + ','
                  + quotedstr(DMFAC.cdsDetFactObs2.FieldByName('FACSERIE').AsString) + ','
                  + quotedstr(DMFAC.cdsDetFactObs2.FieldByName('NFAC').AsString) + ','
                  + quotedstr(DMFAC.cdsDetFactObs2.FieldByName('DFACITEM').AsString) + ','
                  + quotedstr(DMFAC.cdsDetFactObs2.FieldByName('DARTOBS').AsString) + ')'
            Else
               xSQLD := 'update FAC313 '
                  + '       set DARTOBS=' + quotedstr(DMFAC.cdsDetFactObs2.FieldByName('DARTOBS').AsString)
                  + '     where CIAID =' + QuotedStr(dblcCia.Text)
                  + '       and DOCID =' + QuotedStr(dblcTDoc.Text)
                  + '       and FACSERIE =' + QuotedStr(dblcSerie.Text)
                  + '       and NFAC =' + QuotedStr(dbeNFac.Text)
                  + '       and DFACITEM=' + QuotedStr(DMFAC.cdsQry.FieldByName('DPROFITEM').AsString);
            Try
               DMFAC.DCOM1.AppServer.EjecutaSQL(xSQLD);
            Except
               ShowMessage('Se produjo un error al intentar grabar el Detalle de Observaciones (Proformas)');
               xContinuaGrab := False;
               exit;
            End;
         End;

         DMFAC.cdsQry.Next;
      End;
   End;
End;

Procedure TFFactSGuia.dbeMontoDCTO2Exit(Sender: TObject);
Begin
   If dbeMontoDCTO2.Text = '' Then
      dbeMontoDCTO2.Text := '0.0000';

   If (strtofloat(dbePrecioG.Text) <= 0) And (strtofloat(dbeMontoDCTO2.Text) > 0) Then
   Begin
      Showmessage('No se puede Hacer Descuento porque Precio es Cero');
      edtDsto2.Text := '0.0000';
      dbeMontoDCTO2.Text := '0.0000';
      Exit;
   End;

// valida que cantidad tenga valor
   If length(Trim(dbeCantGA.Text)) = 0 Then
   Begin
      ShowMessage('Ingrese Cantidad');
      dbeCantGA.Text := '0';
      dbeCantGA.SetFocus;
      Exit;
   End;

   If dbeMontoDCTO2.Text <> '' Then
   Begin
      If strtofloat(dbeMontoDCTO2.Text) > 0 Then
         edtDsto2.Text := FloatToStr(FRound((strtofloat(dbeMontoDCTO2.Text) / (strtofloat(dbeCantGA.Text) * strtofloat(dbePrecioG.Text))) * 100, 15, 4))
      Else
         edtDsto2.Text := '0.0000';

      edtDsto2Exit(Self);
   End;
End;

Procedure TFFactSGuia.dblcOfideExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If btnExec.Focused Then Exit;

   xWhere := 'OFDESID=' + QuotedStr(dblcOfide.Text) + ' AND SUBSTR(OFDESID,1,1)<>''M''';
   edtOfdes.Text := DMFAC.BuscaQry('dspUltTGE', 'APO110', 'OFDESNOM', xWhere, 'OFDESNOM');
End;

Procedure TFFactSGuia.bbtnComboClick(Sender: TObject);
Begin
   If length(dblcdProf.Text) > 0 Then
   Begin
      ShowMessage('No se puede Agregar un artículo cuando el Documento' + chr(13)
         + 'se ha generado desde una proforma');
      exit;
   End;

   If sTipoRQS = 'S' Then
   Begin
      ShowMessage('No se puede Usar Combo en Servicios');
      exit;
   End;

   Try
      cFlgComb := 'V';
      fSelCom := False;
      FCombos := TFCombos.Create(application);

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

Procedure TFFactSGuia.GeneraCombo;
Var
   dPVG: Double;
   xSQL: String;
Begin

   If DMFAC.cdsDetPed.RecordCount < 0 Then
   Begin
      ShowMessage('Error : Combo no tiene Detalle');
      Exit;
   End;

   DMFAC.cdsDetFact2.First;
   While Not DMFAC.cdsDetFact2.Eof Do
   Begin
      If DMFAC.cdsDetFact2.FieldByName('CODCOM').AsString = DMFAC.cdsDetPed.FieldByName('CODCOM').AsString Then
      Begin
         ShowMessage('Combo ya fue Seleccionado para venta. Verificar...');
         Exit;
      End;

      DMFAC.cdsDetPed.First;
      While Not DMFAC.cdsDetPed.Eof Do
      Begin
         If DMFAC.cdsDetFact2.FieldByName('ARTID').AsString = DMFAC.cdsDetPed.FieldByName('ARTID').AsString Then
         Begin
            ShowMessage('Articulo ya Fue Seleccionado para Venta. Verificar...');
            Exit;
         End;
         DMFAC.cdsDetPed.Next
      End;

      DMFAC.cdsDetFact2.Next;
   End;

   DMFAC.cdsDetPed.First;
   While Not DMFAC.cdsDetPed.Eof Do
   Begin
      dblcdArticulo.Text := DMFAC.cdsDetPed.FieldByname('ARTID').AsString;
      dbeArticulo.Text := DMFAC.cdsDetPed.FieldByname('ARTDES').AsString;

      If DMFAC.cdsDetPed.FieldByname('TMONID').AsString = dblcTMon.Text Then
         dPVG := DMFAC.cdsDetPed.FieldByName('PREVEN').AsFloat
      Else
      Begin
         If DMFAC.cdsDetPed.FieldByname('TMONID').AsString = DMFAC.wTMonLoc Then
            dPVG := FRound(DMFAC.cdsDetPed.FieldByName('PREVEN').AsFloat / StrToFloat(dbeTCambio.Text), 15, 4)
         Else
            dPVG := FRound(DMFAC.cdsDetPed.FieldByName('PREVEN').AsFloat * StrToFloat(dbeTCambio.Text), 15, 4);
      End;
      xFlagInsert := True;

      dbeCantGA.Text := FCombos.seCant.Text;

      dbePrecioG.Text := FloatToStr(dPVG);
      cCombo := DMFAC.cdsCabPed.FieldByName('CODCOM').AsString;

      bbtnRegOkClick(Self); // Inserta Articulo

      DMFAC.cdsDetPed.Next
   End;

   xSQL := 'SELECT * FROM FAC306 '
      + 'WHERE CIAID =' + QuotedStr(dblcCia.Text)
      + ' AND DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + ' AND FACSERIE=' + QuotedStr(dblcSerie.Text) + ' AND NFAC =' + QuotedStr(dbeNFac.Text)
      + ' ORDER BY DFACITEM';
   Filtracds(DMFAC.cdsDetFact2, xSQL);

   xFlagInsert := False;
   ;

End;

Procedure TFFactSGuia.bbtnDctoClick(Sender: TObject);
Var
   xSQL: String;
   xTMonto, xTotVen, dIGV: Double;
   xTIgv1: Double;
   xTDscto: Double;
   xTFact: Double;
Begin
   If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString <> 'INICIAL' Then
   Begin
      Information(Caption, 'El Documento Tiene que estar en Inicial');
      Exit;
   End;
   dIGV := FRound(StrToFloat(DMFAC.BuscaQry('dspUltTGE', 'TGE108', 'TASACAN', 'TASAFLG =''I''', 'TASACAN')), 12, 4);

   xSQL := 'Select 0.00 IMPORTE, 0.00 TOTVTA, 0.00 NEWTOT from TGE101 WHERE CIAID=''01''';
   DMFAC.cdsQry13.Close;
   DMFAC.cdsQry13.IndexFieldNames := '';
   DMFAC.cdsQry13.Filter := '';
   DMFAC.cdsQry13.DataRequest(xSQL);
   DMFAC.cdsQry13.Open;

// Inicio FAC-201806
// 26/10/2018 cambia display de importes a 2 dígitos
   {
   TNumericField(DMFAC.cdsQry13.FieldByName('TOTVTA')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsQry13.FieldByName('TOTVTA')).EditFormat := '########0.0000';
   TNumericField(DMFAC.cdsQry13.FieldByName('IMPORTE')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsQry13.FieldByName('IMPORTE')).EditFormat := '########0.0000';
   TNumericField(DMFAC.cdsQry13.FieldByName('NEWTOT')).DisplayFormat := '######,##0.0000';
   TNumericField(DMFAC.cdsQry13.FieldByName('NEWTOT')).EditFormat := '########0.0000';
   }
   TNumericField(DMFAC.cdsQry13.FieldByName('TOTVTA')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsQry13.FieldByName('TOTVTA')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsQry13.FieldByName('IMPORTE')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsQry13.FieldByName('IMPORTE')).EditFormat := '########0.00';
   TNumericField(DMFAC.cdsQry13.FieldByName('NEWTOT')).DisplayFormat := '######,##0.00';
   TNumericField(DMFAC.cdsQry13.FieldByName('NEWTOT')).EditFormat := '########0.00';
// Fin FAC-201806

   xTMonto := 0;
   // Totaliza Montos del Detalle
   DMFAC.cdsDetFact2.First;
   DMFAC.cdsDetFact2.DisableControls;
   While Not DMFAC.cdsDetFact2.eof Do
   Begin
      xTMonto := DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat;
      xTIgv1 := xTIgv1 + DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat; // Total IGV 1
      xTDscto := DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat + DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat;
      xTotVen := xTMonto + xTDscto;
      xTFact := xTFact + FRound((xTotVen * (1 + (dIGV / 100))), 15, 4);
      DMFAC.cdsDetFact2.Next;
   End;
   DMFAC.cdsDetFact2.EnableControls;

   DMFAC.cdsQry13.Edit;
   DMFAC.cdsQry13.FieldByName('NEWTOT').AsFloat := DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat;
   cCombo := 'xyz123';
   GeneraDescuento;
   cCombo := '';
   DMFAC.cdsQry13.FieldByName('TOTVTA').AsFloat := DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat;
   DMFAC.cdsQry13.FieldByName('IMPORTE').AsFloat := DMFAC.cdsQry13.FieldByName('TOTVTA').AsFloat - DMFAC.cdsQry13.FieldByName('NEWTOT').AsFloat;
   DMFAC.cdsQry13.Post;

   Try
      fDcto := False;
      FVentaDcto := TFVentaDcto.Create(application);
      FVentaDcto.bbtnDctoFact.Visible := True;
      FVentaDcto.dblcTMon.Text := dblcTMon.Text;
      FVentaDcto.ShowModal;
   Finally
      If fDcto Then
      Begin
         cCombo := 'xyz123';
         GeneraDescuento;
         cCombo := '';
         ShowMessage('Recalculo de Precio OK');
      End;

      FVentaDcto.Free;
   End;
End;

Procedure TFFactSGuia.GeneraDescuento;
Var
   dPorDcto, dIGV, dImp: Double;
   cSQL: String;
   nCon, nIni: Integer;
Begin
   dIGV := FRound(StrToFloat(DMFAC.BuscaQry('dspUltTGE', 'TGE108', 'TASACAN', 'TASAFLG =''I''', 'TASACAN')), 12, 4);

   If DMFAC.cdsQry13.FieldByName('IMPORTE').AsFloat = 0 Then
      dPorDcto := 0
   Else
      dPorDcto := FRound(DMFAC.cdsQry13.FieldByName('IMPORTE').AsFloat / DMFAC.cdsQry13.FieldByName('TOTVTA').AsFloat * 100, 10, 4);

   DMFAC.cdsDetFact2.Close;
   DMFAC.cdsDetFact2.Open;

   nCon := 0;
   DMFAC.cdsDetFact2.First;
   While Not DMFAC.cdsDetFact2.eof Do
   Begin
      dImp := DMFAC.cdsDetFact2.FieldByname('DFACMTOMO').AsFloat / (1 + (dIGV / 100));
      dblcdArticulo.Text := DMFAC.cdsDetFact2.FieldByname('ARTID').AsString;
      dbeArticulo.Text := DMFAC.cdsDetFact2.FieldByname('ARTDES').AsString;
      dbePrecioG.Text := DMFAC.cdsDetFact2.FieldByname('DFACPREUMO').AsString;
      dbeCantGA.Text := DMFAC.cdsDetFact2.FieldByname('DFACCANTG').AsString;
      edtDsto2.Text := FloatToStr(dPorDcto);
      nCon := nCon + 1;
      xFlagInsert := False;
      bbtnRegOkClick(Self); // Inserta Articulo

      nIni := 1;
      DMFAC.cdsDetFact2.First;
      While nIni < nCon Do
      Begin
         DMFAC.cdsDetFact2.Next;
         nIni := nIni + 1
      End;
      DMFAC.cdsDetFact2.Next;
   End;

   cSQL := 'SELECT * FROM FAC306 '
      + 'WHERE CIAID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
      + ' AND DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + ' AND FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
      + ' AND NFAC =' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString)
      + ' ORDER BY DFACITEM';
   Filtracds(DMFAC.cdsDetFact2, 'SELECT * FROM FAC306 WHERE ' + wSQL);
End;

Procedure TFFactSGuia.dblcdServicioExit(Sender: TObject);
Begin
   memDetalle.Text := DMFAC.cdsVende.FieldByName('ARTDES').AsString;
End;

Procedure TFFactSGuia.bbtnInicialClick(Sender: TObject);
Begin
   Try
      FMontoInicial := TFMontoInicial.Create(Self);
      FMontoInicial.ShowModal;
   Finally
      FMontoInicial.Free;
   End;
End;

Procedure TFFactSGuia.dbeImporteIGVExit(Sender: TObject);
Var
   xSubtotal: Double;
   xIgv: Double;
   xPrecioConIgv: Double;
   xTasaIgv: Double;
Begin
   If bbtnRegCanc.Focused Then Exit;
   If (dblcCia.Text = '15') Then
   Begin
      If length(dbeImporteIGV.text) = 0 Then
      Begin
         ShowMessage('Ingrese El Precio de Venta');
         dbeImporteIGV.Text := '';
         dbeImporteIGV.SetFocus;
         Exit;
      End;

      If length(Trim(dbeCantGA.Text)) = 0 Then
      Begin
         ShowMessage('Ingrese Cantidad');
         dbeCantGA.Text := '0';
         dbeCantGA.SetFocus;
         Exit;
      End;

      xTasaIgv := StrToFloat(xImpTasa) / 100;

      If dtpFFac.date <= strtodate('28/02/2011') Then
         xTasaIgv := StrToFloat(xImpTasa19) / 100;

      xPrecioConIgv := StrToFloat(dbeImporteIGV.text);
      If FlagArticuloConDinamica(DMFAC.cdsFact2.FieldByName('CIAID').AsString, DMFAC.cdsFact2.FieldByName('DOCID').AsString, DMFAC.cdsFact2.FieldByName('TMONID').AsString, DMFAC.cdsFact2.FieldByName('FPAGOID').AsString, dblcdArticulo.Text) Then
      Begin
         xIgv := Fround((xPrecioConIgv * xTasaIgv) / (2 * (1 + xTasaIgv)), 15, 4);
      End
      Else
      Begin
         xIgv := Fround((xPrecioConIgv * xTasaIgv) / (1 + xTasaIgv), 15, 4);
      End;
      xSubtotal := xPrecioConIgv - xIgv;
      dbePrecioG.Text := FloatToStr(Fround((xSubtotal / strtofloat(dbeCantGA.text)), 15, 4));
      dbeImporte.Text := FloatToStr(xSubtotal);
      dbeRed.Text := dbeImporteIGV.Text;
   End;

   If strtofloat(dbeImporteIGV.Text) > 0 Then
   Begin
      If strtofloat(dbeImporteIGV.Text) <= (strtofloat(dbeCantGA.Text) * strtofloat(dbePrecioG.text)) Then
         dbeMontoDCTO2.Text := floattostr((strtofloat(dbeCantGA.Text) * strtofloat(dbePrecioG.text))
            - strtofloat(dbeImporteIGV.Text))
      Else
         dbeMontoDCTO2.Text := '0';
   End
   Else
      dbeMontoDCTO2.Text := '0';
   dbeMontoDCTO2Exit(self);

   If dbeMontoDCTO2.Focused Then
   Begin
      xTasaIgv := StrToFloat(xImpTasa) / 100;
      If dtpFFac.date <= strtodate('28/02/2011') Then
         xTasaIgv := StrToFloat(xImpTasa19) / 100;

      dbeMontoDCTO2.Text := floattostr(strtofloat(dbePrecioG.text) - (strtofloat(dbeImporteIGV.Text) / 1 + xTasaIgv));
      dbeMontoDCTO2Exit(self);
   End;
End;

Procedure TFFactSGuia.bbtnRecargoClick(Sender: TObject);
Var
   xSQL: String;
   xTMonto, xTotVen, dIGV: Double;
   xTIgv1: Double;
   xTRecargo: Double;
   xTFact: Double;
Begin

End;

Procedure TFFactSGuia.bbtnEditaCliClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString <> 'INICIAL' Then
   Begin
      ShowMessage('Para modificar los Datos del Cliente, la boleta/factura debe estar en estado INICIAL');
      Exit;
   End;

   If dblcTClie.Text = '01' Then
   Begin
      ShowMessage('Datos de Asociado no se pueden cambiar por esta opción');
      Exit;
   End;

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

   DMFAC.wModo := 'M';
   Try
      FMaesClieCorto := TFMaesClieCorto.Create(Application);
      FMaesClieCorto.ShowModal;
   Finally
      FMaesClieCorto.Free;
   End;
   If (DMFAC.cdsFact2.FieldByName('CLIERUC').AsString = '') Or
      (Length(Trim(DMFAC.cdsFact2.FieldByName('CLIERUC').AsString)) < 8) Then
   Begin
      If Length(Trim(DMFAC.cdsClie.FieldByName('CLIERUC').AsString)) < 11 Then
      Begin
         If Length(Trim(DMFAC.cdsClie.FieldByName('CLIEDNI').AsString)) = 8 Then
         Begin
            DMFAC.cdsFact2.Edit;
            DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsClie.FieldByName('CLIEDNI').AsString;
         End;
      End
      Else
      Begin
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('CLIERUC').AsString := DMFAC.cdsClie.FieldByName('CLIERUC').AsString;
      End;
   End;

   If (Length(trim(DMFAC.cdsFact2.FieldByName('CLIEDIR').AsString)) < 5) Then
   Begin
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('CLIEDIR').AsString := DMFAC.cdsClie.FieldByName('CLIEDIR').AsString;
   End;
   DMFAC.cdsFact2.Post;
   xSQL := 'Update FAC305 '
      + '      Set CLIERUC=' + quotedstr(DMFAC.cdsFact2.FieldByName('CLIERUC').AsString) + ','
      + '          CLIEDIR=' + quotedstr(DMFAC.cdsFact2.FieldByName('CLIEDIR').AsString) + ' '
      + '    where CIAID=' + Quotedstr(dblcCia.Text)
      + '      and CLIEID=' + Quotedstr(dblcdAso.Text)
      + '      and FACSERIE=' + Quotedstr(dblcSerie.Text)
      + '      and NFAC=' + Quotedstr(dbeNFac.Text);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo actualizar el RUC / DIRECCIÓN en Cabecera de Factura');
      xContinuaGrab := False;
      exit;
   End;
End;

Function TFFactSGuia.GetTasaIgv(xxCompania, xxTipoDoc, xxMoneda, xxTipoPago, xxArticulo: String): Double;
Var
   xDinamica: String;
   xSQL: String;
Begin
   xDinamica := GetDinamicaContable(xxCompania, xxTipoDoc, xxMoneda, xxTipoPago, xxArticulo);

   xSQL := ' SELECT DET.*, CAB.ARTID FROM CXC208 CAB, CXC102 DET '
      + '  WHERE CAB.CIAID = DET.CIAID '
      + '    AND CAB.CPTOCAB = DET.CPTOCAB '
      + '    AND CAB.CIAID = ' + Quotedstr(xxCompania)
      + '    AND CAB.DOCID = ' + Quotedstr(xxTipoDoc)
      + '    AND CAB.TMONID = ' + Quotedstr(xxMoneda)
      + '    AND CAB.CPTOCCOMER   = ' + Quotedstr(xxTipoPago)
      + '    AND CAB.CPTOCABVTA=' + Quotedstr('S')
      + '    AND CAB.CPTOCAB = ' + Quotedstr(xDinamica)
      + '    AND DET.TIPDET = ' + Quotedstr('I1');

   DMFAC.cdsQry16.Close;
   DMFAC.cdsQry16.DataRequest(xSQL);
   DMFAC.cdsQry16.open;
   If DMFAC.cdsQry16.recordcount > 0 Then
   Begin
      //retornamos el IGV asociado a la dinámica contable para el articulo actual
      Result := DMFAC.cdsQry16.FieldByName('TASA').AsFloat;
   End
   Else
   Begin
      Result := 0;
   End;

End;

Function TFFactSGuia.GetDinamicaContable(xxCompania, xxTipoDoc, xxMoneda, xxTipoPago, xxArticulo: String): String;
Var
   xSQL: String;
Begin

   xSQL := ' SELECT CAB.* FROM CXC208 CAB'
      + '  WHERE CAB.CIAID = ' + Quotedstr(xxCompania)
      + '    AND CAB.DOCID = ' + Quotedstr(xxTipoDoc)
      + '    AND CAB.TMONID = ' + Quotedstr(xxMoneda)
      + '    AND CAB.CPTOCCOMER   = ' + Quotedstr(xxTipoPago)
      + '    AND CAB.CPTOCABVTA=' + Quotedstr('S')
      + '    AND CAB.ARTID =' + Quotedstr(xxArticulo);
   DMFAC.cdsQry16.Close;
   DMFAC.cdsQry16.DataRequest(xSQL);
   DMFAC.cdsQry16.open;
   If DMFAC.cdsQry16.recordcount > 0 Then
   Begin
      result := DMFAC.cdsQry16.FieldByName('CPTOCAB').AsString;
   End
   Else
   Begin
      xSQL := ' SELECT CAB.* FROM CXC208 CAB'
         + '  WHERE CAB.CIAID = ' + Quotedstr(xxCompania)
         + '    AND CAB.DOCID = ' + Quotedstr(xxTipoDoc)
         + '    AND CAB.TMONID = ' + Quotedstr(xxMoneda)
         + '    AND CAB.CPTOCCOMER   = ' + Quotedstr(xxTipoPago)
         + '    AND CAB.CPTOCABVTA=' + Quotedstr('S')
         + '    AND CAB.ARTID is null ';
      DMFAC.cdsQry16.Close;
      DMFAC.cdsQry16.DataRequest(xSQL);
      DMFAC.cdsQry16.open;
      If DMFAC.cdsQry16.recordcount > 0 Then
      Begin
         result := DMFAC.cdsQry16.FieldByName('CPTOCAB').AsString;
      End
      Else
      Begin
         result := '';
      End;

   End;

End;

Function TFFactSGuia.FlagArticuloConDinamica(xxCompania, xxTipoDoc, xxMoneda, xxTipoPago, xxArticulo: String): boolean;
Var
   xSQL: String;
Begin
   xSQL := ' SELECT CAB.* FROM CXC208 CAB'
      + '  WHERE CAB.CIAID = ' + Quotedstr(xxCompania)
      + '    AND CAB.DOCID = ' + Quotedstr(xxTipoDoc)
      + '    AND CAB.TMONID = ' + Quotedstr(xxMoneda)
      + '    AND CAB.CPTOCCOMER   = ' + Quotedstr(xxTipoPago)
      + '    AND CAB.CPTOCABVTA=' + Quotedstr('S')
      + '    AND CAB.ARTID =' + Quotedstr(xxArticulo);
   DMFAC.cdsQry16.Close;
   DMFAC.cdsQry16.DataRequest(xSQL);
   DMFAC.cdsQry16.open;
   If DMFAC.cdsQry16.recordcount > 0 Then
   Begin
      result := true;
   End
   Else
   Begin
      result := false;
   End;

End;

Procedure TFFactSGuia.ActualizaCabCXC(xxCompania, xxAnioMes, xxTipoDiario, xxNoRegistro, xxNoDocumento: String);
Var
   xSQL: String;
Begin
   xSQL := 'Update CXC301 CXCCAB set (CCGRAVAD,CCNOGRAV,CCFLETE,CCGASFIN,CCSERVIC,CCDCTO,CCIGV,CCISC,CXC_IMP_EXO,CCMTOORI ) =   '
      + '         (select sum(case when cxcdet.tipdet = ' + QuotedStr('MG') + ' then cxcdet.ccmtoori else 0 end ) MontoGravado, '
      + '                 sum(case when cxcdet.tipdet = ' + QuotedStr('MN') + ' then cxcdet.ccmtoori else 0 end ) MontoNoGravado, '
      + '                 sum(case when cxcdet.tipdet = ' + QuotedStr('FL') + ' then cxcdet.ccmtoori else 0 end ) Flete, '
      + '                 sum(case when cxcdet.tipdet = ' + QuotedStr('GF') + ' then cxcdet.ccmtoori else 0 end ) GastosFinancieros, '
      + '                 sum(case when cxcdet.tipdet = ' + QuotedStr('SV') + ' then cxcdet.ccmtoori else 0 end ) Servicio, '
      + '                 sum(case when cxcdet.tipdet = ' + QuotedStr('DC') + ' then cxcdet.ccmtoori else 0 end ) Descuento, '
      + '                 sum(case when cxcdet.tipdet = ' + QuotedStr('I1') + ' then cxcdet.ccmtoori else 0 end ) Igv, '
      + '                 sum(case when cxcdet.tipdet = ' + QuotedStr('IS') + ' then cxcdet.ccmtoori else 0 end ) Isc, '
      + '                 sum(case when cxcdet.tipdet = ' + QuotedStr('ME') + ' then cxcdet.ccmtoori else 0 end ) MontoExon, '
      + '                 sum(case when cxcdet.tipdet = ' + QuotedStr('TO') + ' then cxcdet.ccmtoori else 0 end ) Total '
      + '            from CXC302 CXCDET '
      + '           where CXCDET.CIAID    = CXCCAB.CIAID '
      + '             and CXCDET.CCANOMES = CXCCAB.CCANOMES '
      + '             and CXCDET.TDIARID  = CXCCAB.TDIARID '
      + '             and CXCDET.CCNODOC  = CXCCAB.CCNODOC '
      + '             and CXCDET.CCNOREG   = CXCCAB.CCNOREG) '
      + ' where CXCCAB.CIAID  = ' + QuotedStr(xxCompania)
      + '   and CXCCAB.CCANOMES = ' + QuotedStr(xxAnioMes)
      + '   and CXCCAB.TDIARID  = ' + QuotedStr(xxTipoDiario)
      + '   and CXCCAB.CCNOREG  = ' + QuotedStr(xxNoRegistro)
      + '   and CXCCAB.CCNODOC  = ' + QuotedStr(xxNoDocumento);
   xSQL := UpperCase(xSQL);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo actualizar cabecera de CxC');
      xContinuaGrab := False;
      exit;
   End;
End;

Procedure TFFactSGuia.InicializaPorUsuario_1;
Var
   xSQL: String;
Begin
   xSQL := 'Select * from FAC206 '
      + ' Where USERID=' + quotedstr(DMFAC.wUsuario)
      + '   AND CIAID =  ' + quotedstr(dblcCia.text);
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(xSQL);
   Try
      DMFAC.cdsQry3.Open;
   Except
      Exit;
   End;

   If DMFAC.cdsQry3.RecordCount <= 0 Then
   Begin
      DMFAC.cdsFact2.FieldByName('LOCID').AsString := '';
      DMFAC.cdsFact2.FieldByName('TINID').AsString := '';
      DMFAC.cdsFact2.FieldByName('ALMID').AsString := '';
      DMFAC.cdsFact2.FieldByName('DOCID').AsString := '';
      DMFAC.cdsFact2.FieldByName('FACSERIE').AsString := '';
      exit;
   End;

   Try
   // Localidad
      DMFAC.cdsFact2.FieldByName('LOCID').AsString := DMFAC.cdsQry3.FieldByName('LOCID').AsString;

   // Tipo de Venta
      DMFAC.cdsFact2.FieldByName('TIPOADQ').AsString := DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString;

      If DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString = 'C' Then
      Begin
      // Tipo de Inventario
         DMFAC.cdsFact2.FieldByName('TINID').AsString := DMFAC.cdsQry3.FieldByName('TINID').AsString;
      // Almacén
         DMFAC.cdsFact2.FieldByName('ALMID').AsString := DMFAC.cdsQry3.FieldByName('ALMID').AsString;
      End;
      If DMFAC.cdsQry3.FieldByName('TIPOADQ').AsString = 'S' Then
      Begin
   // Tipo de Inventario
         DMFAC.cdsFact2.FieldByName('TINID').AsString := '00';
   // Almacén
         DMFAC.cdsFact2.FieldByName('ALMID').AsString := '00';
      End;

      If DMFAC.cdsQry3.FieldByName('DOCID').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('DOCID').AsString := DMFAC.cdsQry3.FieldByName('DOCID').AsString;
      End;

      If DMFAC.cdsQry3.FieldByName('FACSERIE').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('FACSERIE').AsString := DMFAC.cdsQry3.FieldByName('FACSERIE').AsString;
      End;

      If DMFAC.cdsQry3.FieldByName('FPAGOID').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('FPAGOID').AsString := DMFAC.cdsQry3.FieldByName('FPAGOID').AsString;
      End;

      If DMFAC.cdsQry3.FieldByName('TMONID').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('TMONID').AsString := DMFAC.cdsQry3.FieldByName('TMONID').AsString;
      End;

      If DMFAC.cdsQry3.FieldByName('TLISTAID').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('TLISTAID').AsString := DMFAC.cdsQry3.FieldByName('TLISTAID').AsString;
      End;

      If DMFAC.cdsQry3.FieldByName('VEID').AsString <> '' Then
      Begin
         DMFAC.cdsFact2.FieldByName('VEID').AsString := DMFAC.cdsQry3.FieldByName('VEID').AsString;
         EdtVen.Text := DMFAC.BuscaQry('dspUltTGE', 'CXC203', 'VENOMBRES', 'CIAID=' + QuotedStr(dblcCia.Text) + ' AND VEID=' + QuotedStr(dblcVen.Text), 'VENOMBRES');
      End;

   Except

   End;
End;

Procedure TFFactSGuia.bbtnTicketClick(Sender: TObject);
Var
   xSQL, sTipDocFac: String;
   xConta, nPr: Integer;
   xTFact: Double;
   xR1, xR2, xR3: Double;
   fObsequio, fCombo: Boolean;
   xSQL1, xSQL2, xSQL3: String;
Begin
   DMFAC.cdsDetFact2.First;
   DMFAC.cdsDetFact2.DisableControls;
   While Not DMFAC.cdsDetFact2.eof Do
   Begin
      If DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString <> 'N' Then
      Begin
         xTFact := xTFact + DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat;
      End;
      DMFAC.cdsDetFact2.Next;
   End;
   DMFAC.cdsDetFact2.EnableControls;

   xR1 := FRound(DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat, 15, 2);
   xR2 := FRound(xTFact, 15, 2);
   xR3 := FRound(DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat, 15, 2) - FRound(xTFact, 15, 2);

   If (FRound(DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat, 15, 2) - FRound(xTFact, 15, 2) > 0.01) Or
      (FRound(DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat, 15, 2) - FRound(xTFact, 15, 2) < (-0.01)) Then
   Begin
      ShowMessage('Problemas con los totales. Avise a Sistemas...');
      Exit;
   End;

   If DMFAC.cdsFact2.FieldByName('FACIMPREP').AsString = 'S' Then
   Begin
      ShowMessage('NO se puede volver a imprimir el documento. Avise al Supervisor...');
      Exit;
   End;

   Screen.Cursor := crHourGlass;

   xConta := 0;
   DMFAC.cdsDetFact2.First;
   If sTipoRQS = 'C' Then
   Begin
      While Not DMFAC.cdsDetFact2.Eof Do
      Begin
         If DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString = 'N' Then
            xConta := xConta + 1;
         DMFAC.cdsDetFact2.Next;
      End;

      If xConta > 0 Then
      Begin
         Screen.Cursor := crDefault;
         ErrorMsg(Caption, 'Existen Artículos que no han Terminado su Proceso');
         Exit;
      End;
   End;

   If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString = 'INICIAL' Then
   Begin
      Screen.Cursor := crDefault;
      Information(Caption, 'El Documento no se Encuentra Aceptado no es Posible Imprimir');
      Exit;
   End;

   xSQL1 := 'select A.CIAID, A.LOCID, A.TINID, A.ALMID, A.CLIEID, A.FACSERIE, A.NFAC, A.CLAUXID, '
      + 'CASE WHEN C.CLIERUC=''00000000000'' THEN '' '' ELSE C.CLIERUC END CLIERUC, A.VEID, '
      + 'A.GRARID, A.FAMID, A.SFAMID, A.TLISTAID, A.ARTID, A.UNMIDG, A.UNMABR, A.DFACCANTG,'
      + 'round(A.DFACMTOMO/DFACCANTG,2) DFACPREUMO, round(A.DFACMTOMN/DFACCANTG,2) DFACPREUMN,'
      + 'round(A.DFACMTOME/DFACCANTG,2) DFACPREUME, A.DFACTCAM, A.TMONID, '
      + 'A.DFACDTOUMO, A.DFACMTOMO, A.DFACMTOMN, A.DFACPREUMO PRECIOUNI, '
      + 'A.DFACMTOME, A.DFACAAAA, A.DFACMM, A.DFACDD, '
      + 'A.DFACIGV, A.DFACISC, A.DFACDCTO, A.DFACESTADO, A.DFACCANTAT, A.DFACGARAN, A.FPAGOID,'
      + 'A.SERIE, A.NGUIA, A.UNMIDU, A.DFACFLAGRE, A.UNMIDO, A.DFACCOMLMO, A.DFACFLAGV,'
      + 'A.DFACDCTO2, A.DFACDTOMO2, A.DFACDCTO3, A.DFACDTOMO3, '
      + 'A.CLIEDIRID, A.DFACDIRENT, A.DFACITEM, A.DOCID, A.DFACHOR, A.FACFECHA, A.DFACSALDO, A.DFACCONT, A.DFACPREVMO,'
      + 'TO_CHAR(A.FACFECHA,''yyyy'') ANO, TO_CHAR(A.FACFECHA,''mm'') MES, TO_CHAR(A.FACFECHA,''dd'') DIA,'
      + 'A.FACTIP, A.FACTCLI, A.TIPOADQ, A.DFACIMP1, A.DFACIMPMTO1, A.DFACIMP2, A.DFACIMPMTO2,'
      + 'A.ARTDES, A.DFACVTOTMO, A.DFACIMPMTN1, A.DFACIMPMTE1, A.DFACIMPMTE2, A.DFACIMPMTN2,'
      + 'A.FACID, A.DFACTFLAG, A.FLAGVAR, U.USERNOM, ''Cajero : ''||U.USERNOM CAJERO, '
      + 'C.TIPVTAID, C.FACPO, C.FACMTOMO, C.FACESTADO, C.FACFECENT, C.FACDCTOMN, C.FACDCTOME, '
      + 'C.FACFLAGD, C.FACSIT, C.FACTOTMO, '
      + 'C.FACGARAN, C.FACIGVMO, C.FACISCMO, C.FACCOMVEMO, C.FACEMBMO, '
      + 'C.ZONVTAID, C.PEDIDO, C.TIPPERID, C.GUIASERIE, C.GUIANUM, C.FACTDOC, C.ZIPID, C.FACTOBS, C.FACFECHA, '
      + 'C.FACDSCTO1, C.FACIMPREP, C.FACFEVCMTO, C.CLIEDES, C.CLIEDIR, C.FACIGV2MO, '
      + 'DECODE(DARTOBS,NULL,A.ARTDES,B.DARTOBS) ARTDESOBS, B.DARTOBS, '
      + '''                                                                                '' MONTOLETRA, ';

   xSQL2 :=
      'DFACPREUMO DFACPREUMO_FAC, DFACDTOMO2 DFACDTOMO2_FAC, '
      + 'A.FACSERIE||''-''||A.NFAC TICKET, ''(''||A.ALMID||'')'' ALM_TICKECT, '
      + 'UPPER(DC.DOCABR)||''  No: ''||A.FACSERIE||''-''||A.NFAC TICKET_DESC, '
      + 'TMONABR||TRIM(TO_CHAR(A.DFACVTOTMO,''999,999.0000'')) DFACVTOTMO_M, '
      + 'TMONABR||TRIM(TO_CHAR(A.DFACMTOMO,''999,999.0000'')) DFACMTOMO_M, '
      + 'TMONABR||TRIM(TO_CHAR(C.FACTOTMO,''999,999.0000'')) FACTOTMO_M, '
      + 'TMONABR||TRIM(TO_CHAR(C.FACIGVMO,''999,999.0000'')) FACIGVMO_M, '
      + 'TMONABR||TRIM(TO_CHAR(C.FACSERMO,''999,999.0000'')) FACSERMO_M, '
      + 'TMONABR||TRIM(TO_CHAR(C.FACTOTMO-C.FACIGVMO-C.FACSERMO,''999,999.0000'')) SUB_TOTAL_M, '
      + 'TMONABR||TRIM(TO_CHAR( round(A.DFACMTOMO/DFACCANTG,2),''999,999.0000'')) DFACPREUMO_M, '
      + 'TMONABR||TRIM(TO_CHAR( A.DFACVTOTMO + ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) ,''999,999.0000'')) BAZAR_SUBTOT_M, '
      + 'TMONABR||TRIM(TO_CHAR( (A.DFACVTOTMO+ ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) )/A.DFACCANTAT ,''999,999.0000'')) BAZAR_PREUNI_M, '
      + 'TMONABR||TRIM(TO_CHAR( ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2),''99,999.0000'')) BAZAR_DCTO_M,  '
      + '''' + DMFAC.wTerminal + ''' SER_TERMINAL, '
      + '''' + DMFAC.wPC_Serie + ''' SER_COMPUTER, '
      + '''' + DMFAC.wPR_serie + ''' SER_PRINTER, ';

   xSQL3 :=
      'DFACPREUMO * ( 1 + ((DFACIMP1/100) + (DFACIMP2/100)) ) PREUNITIMPU, DFACDTOUMO + DFACDTOMO2 DSCTO, DFACPREVMO*(1+DFACIMP1/100) DFACPREVIMO, '
      + ' (DFACDTOUMO + DFACDTOMO2+DFACVTOTMO) VVTA, TMONABR, '
      + ' CASE WHEN FACIGVMO=0 THEN ''Exonerado del I.G.V. de acuerdo al Apendice I  inciso B de la ley del I.G.V.'' else '' '' end MENSAJE, '
      + ' C.DOCPAG, C.NUMDOCPAG, A.CODCOM, '
      + ' A.DFACVTOTMO + ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) BAZAR_SUBTOT, '
      + 'round( (A.DFACVTOTMO+ ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) )/A.DFACCANTAT,2) BAZAR_PREUNI, '
      + 'ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) BAZAR_DCTO,  '
      + 'CASE WHEN DFACVTOTMO=0 THEN ''Obsequio'' ELSE '''' END OBSEQUIO, '
      + 'CASE WHEN DFACVTOTMO=0 THEN ''X'' ELSE NULL END FLOBSEQUIO, SUBSTR(CODCOM,4,5) COMBO, '
      + '''          '' TITCOM, ''          '' TITOBS, ''     '' TITOBS1, ''     '' TITOBS2, '
      + 'CASE WHEN NVL(DETRACCION,0)>0 THEN ''C/Detracción : ''||DETRACCION ELSE '' '' END OBSDET, '
      + 'C.FACUSER, C.FACFREG, C.FACHREG, E.VENOMBRES, ''Vendedor : ''||E.VENOMBRES VENDEDOR, '
      + 'T.CIADES, T.CIAABR, T.CIARUC, T.CIADIRE, T.CIATLF, T.CIAFAX, DC.DOCABR, DC.DOCDES, '
      + 'TI.TIE_DES, TI.TIE_DIR, TI.TIE_TEL '
      + 'FROM FAC306 A, FAC313 B, FAC305 C, TGE103 D, CXC203 E, TGE101 T, TGE110 DC, TGE006 U, tge151 alm, fac_tienda TI '
      + 'WHERE A.CIAID=' + '''' + dblcCIA.Text + ''' '
      + ' AND A.DOCID=' + '''' + dblcTdoc.Text + ''' '
      + ' AND A.FACSERIE =' + '''' + dblcSerie.Text + ''' '
      + ' AND A.NFAC =' + QuotedStr(dbeNFac.Text) + ' '
      + ' AND A.CLIEID=' + QuotedStr(dblcdAso.text) + ' '
      + ' AND A.CIAID=C.CIAID AND A.DOCID=C.DOCID AND A.FACSERIE=C.FACSERIE AND A.NFAC=C.NFAC AND A.TMONID=D.TMONID '
      + ' AND A.CLIEID=C.CLIEID '
      + ' AND A.CIAID=E.CIAID(+) AND A.VEID=E.VEID(+) '
      + ' AND A.CIAID=T.CIAID(+) '
      + ' AND A.DOCID=DC.DOCID AND DC.DOCMOD=''CXC'' '
      + ' AND C.FACUSER=U.USERID(+) '
      + ' and C.CIAID=ALM.CIAID(+) AND C.ALMID=ALM.ALMID(+) '
      + ' and ALM.TIE_ID=TI.TIE_ID(+)';

   xSQL := xSQL1 + xSQL2 + xSQL3;

   If sTipoRQS = 'C' Then
      xSQL := xSQL + 'AND A.CIAID=B.CIAID(+) AND A.DOCID=B.DOCID(+) AND A.FACSERIE=B.FACSERIE(+) AND A.NFAC=B.NFAC(+) AND A.ARTID=B.DFACITEM(+) ORDER BY A.DFACITEM'
   Else
      If sTipoRQS = 'S' Then
         xSQL := xSQL + 'AND A.CIAID=B.CIAID(+) AND A.DOCID=B.DOCID(+) AND A.FACSERIE=B.FACSERIE(+) AND A.NFAC=B.NFAC(+) AND A.DFACITEM=B.DFACITEM(+) ORDER BY A.DFACITEM';

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.recordcount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      showmessage('No Existen Datos a Imprimir');
      Exit;
   End;

   fObsequio := False;
   fCombo := False;
   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      If DMFAC.cdsReporte.FieldByname('FLOBSEQUIO').AsString = 'X' Then
         fObsequio := True;
      If DMFAC.cdsReporte.FieldByname('CODCOM').AsString <> '' Then
         fCombo := True;
      DMFAC.cdsReporte.Next;
   End;

   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      If fObsequio Then
      Begin
         DMFAC.cdsReporte.Edit;
         DMFAC.cdsReporte.FieldByname('TITOBS').AsString := 'Obseq.';
         DMFAC.cdsReporte.FieldByname('TITOBS1').AsString := 'Obse-';
         DMFAC.cdsReporte.FieldByname('TITOBS2').AsString := 'quio';
         DMFAC.cdsReporte.Post;
      End;
      If fCombo Then
      Begin
         DMFAC.cdsReporte.Edit;
         DMFAC.cdsReporte.FieldByname('TITCOM').AsString := 'COMBO';
         DMFAC.cdsReporte.Post;
      End;
      DMFAC.cdsReporte.Next;
   End;
   DMFAC.cdsReporte.First;

   sTipDocFac := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''T''', 'DOCID');

   If sTipDocFac = dblcTdoc.Text Then
   Begin
      wGenTipDoc := 'F';
      ppFact.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\FacturaTicket' + dblcCia.Text + '.Rtm';
      ppFact.Template.LoadFromFile;
      AsignaConstantedeImpresionDema;
   End
   Else
   Begin
      If sTipDocFac = dblcTdoc.Text Then
      Begin
         wGenTipDoc := 'B';
         ppBol.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\BoletaTicket' + dblcCia.Text + '.Rtm';
         ppBol.Template.LoadFromFile;
         AsignaConstantedeImpresionDema;
      End
      Else
      Begin

         wGenTipDoc := 'T';
         pprTicket.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\FacturaTicket' + dblcCia.Text + '.Rtm';
         pprTicket.Template.LoadFromFile;
         AsignaConstantedeImpresionDema;
      End
   End;

   If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString = 'ANULADO' Then
   Begin
      If sTipDocFac = dblcTdoc.Text Then
      Begin
         ppFact.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\FacturaTicket' + dblcCia.Text + 'Anulado.Rtm';
         ppFact.Template.LoadFromFile;
      End
      Else
      Begin
         ppBol.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\BoletaTicket' + dblcCia.Text + 'Anulado.Rtm';
         ppBol.Template.LoadFromFile;
      End;
   End;

   Try
      ppFact.PrinterSetup.MarginLeft := 1;
      ppBol.PrinterSetup.MarginLeft := 1;
      pprTicket.PrinterSetup.MarginLeft := 1;
      For nPr := 1 To ppFact.PrinterSetup.PrinterNames.Count Do
      Begin
         If Copy(ppFact.PrinterSetup.PrinterNames[nPr - 1], 1, 36) = 'EPSON TM-U220 Receipt (from Sun SGD)' Then
         Begin
            ppFact.PrinterSetup.PrinterName := ppFact.PrinterSetup.PrinterNames[nPr - 1];
            ppFact.PrinterSetup.MarginLeft := 8;
            ppBol.PrinterSetup.PrinterName := ppFact.PrinterSetup.PrinterNames[nPr - 1];
            ppBol.PrinterSetup.MarginLeft := 8;
            pprTicket.PrinterSetup.PrinterName := ppFact.PrinterSetup.PrinterNames[nPr - 1];
            pprTicket.PrinterSetup.MarginLeft := 8;
         End;
      End;

      If Copy(ppFact.PrinterSetup.PrinterName, 1, 36) <> 'EPSON TM-U220 Receipt (from Sun SGD)' Then
      Begin
         For nPr := 1 To ppFact.PrinterSetup.PrinterNames.Count Do
         Begin
            If Copy(ppFact.PrinterSetup.PrinterNames[nPr - 1], 1, 21) = 'EPSON TM-U220 Receipt' Then
            Begin
               ppFact.PrinterSetup.PrinterName := ppFact.PrinterSetup.PrinterNames[nPr - 1];
               ppFact.PrinterSetup.MarginLeft := 8;
               ppBol.PrinterSetup.PrinterName := ppFact.PrinterSetup.PrinterNames[nPr - 1];
               ppBol.PrinterSetup.MarginLeft := 8;
               pprTicket.PrinterSetup.PrinterName := ppFact.PrinterSetup.PrinterNames[nPr - 1];
               pprTicket.PrinterSetup.MarginLeft := 8;
            End;
         End;
      End;
   Except
   End;

   Screen.Cursor := crDefault;
   If sTipDocFac = dblcTdoc.Text Then
   Begin
      ppFact.OnPrintingComplete := ReciboCompletoFac;

      If cbDiseno.checked Then
      Begin
         Diseno.Report := ppFact;
         Diseno.Show
      End
      Else
         ppFact.Print;
   End
   Else
   Begin
      pprTicket.OnPrintingComplete := ReciboCompletoTkt;
      If cbDiseno.checked Then
      Begin
         Diseno.Report := pprTicket;
         Diseno.Show
      End
      Else
         pprTicket.Print;
   End;
End;

Procedure TFFactSGuia.ReciboCompletoFac;
Var
   xSQL: String;
Begin
   If DMFAC.cdsFact2.FieldByName('FACIMPREP').AsString <> 'S' Then
   Begin
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('FACIMPREP').AsString := 'S';
      DMFAC.cdsFact2.Post;
      xSQL := 'update FAC305 '
         + '   set FACIMPREP= ''S'' '
         + ' where CIAID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
         + '   and DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
         + '   and FACSERIE =' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
         + '   and NFAC =' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar el flag de Impresión de la Factura/Boleta (FAC305)');
         exit;
      End;
   End;
   ppFact.PreviewForm.Close;
End;

Procedure TFFactSGuia.ReciboCompletoBol;
Var
   xSQL: String;
Begin
   Try
      If DMFAC.cdsFact2.FieldByName('FACIMPREP').AsString <> 'S' Then
      Begin
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('FACIMPREP').AsString := 'S';
         DMFAC.cdsFact2.Post;
         xSQL := 'update FAC305 '
            + '   set FACIMPREP= ''S'' '
            + ' where CIAID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
            + '   and DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
            + '   and FACSERIE =' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
            + '   and NFAC =' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo actualizar el flag de Impresión de la Factura/Boleta (FAC305)');
            exit;
         End;
      End;
      ppBol.PreviewForm.Close;
   Except
   End;
End;

Procedure TFFactSGuia.ReciboCompletoTkt;
Var
   xSQL: String;
Begin
   Try
      If DMFAC.cdsFact2.FieldByName('FACIMPREP').AsString <> 'S' Then
      Begin
         DMFAC.cdsFact2.Edit;
         DMFAC.cdsFact2.FieldByName('FACIMPREP').AsString := 'S';
         DMFAC.cdsFact2.Post;
         xSQL := 'update FAC305 '
            + '      set FACIMPREP= ''S'' '
            + '    where CIAID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
            + '      and DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
            + '      and FACSERIE =' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
            + '      and NFAC =' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
         Try
            DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo actualizar el flag de Impresión de la Factura/Boleta (FAC305)');
            exit;
         End;
      End;
      pprTicket.PreviewForm.Close;
   Except
   End;
End;

//Determina si se inluye el IGV segun las tablas de parametros
Function TFFactSGuia.ConIGV: String;
Var
   Xsql, xIGV: String;
Begin

  //1ero Segun el Cliente
   XSQL := 'Select B.FLGIGV From TGE204 A,TGE109 B Where A.CLIEID=''' + dblcdAso.Text + ''' And NVL(A.TIPPERID,''01'')=B.TIPPERID ';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If Length(trim(DMFAC.cdsQry.FieldByName('FLGIGV').AsString)) <> 0 Then
   Begin
      xIGV := DMFAC.cdsQry.FieldByName('FLGIGV').AsString
   End
   Else
   Begin
   //2do Segun Forma de Pago
      XSQL := 'Select A.FLGIGV From TGE180 A Where A.CIAID=''' + dblcCia.Text + ''' AND A.DCCOMFLAG=''S'' AND A.CCOMERID=''' + dblcFPago.Text + ''' ';
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      If Length(trim(DMFAC.cdsQry.FieldByName('FLGIGV').AsString)) <> 0 Then
      Begin
         xIGV := DMFAC.cdsQry.FieldByName('FLGIGV').AsString
      End
      Else
      Begin
    //3ro Según el Artículo
         xSQL := 'CIAID =' + QuotedStr(dblcCia.Text) + ' AND TINID =' + QuotedStr(dblcTInv.Text) + ' AND ARTID =' + QuotedStr(dblcdArticulo.Text);
         xIGV := DMFAC.BuscaQry('dspUltTGE', 'TGE205', 'ARTIGV', xSQL, 'ARTIGV');
      End;
   End;

// Para Ventas de Mercadería siempre se cobra IGV,
// independientemente del Tipo de Cliente, Condición Comercial o Marca en Maestro de Artículos
// Inicio FAC-201806
// 31/10/2018 Siempre se cobra IGV excepto en Hoteles
   If (dblcCia.Text <> '14') Then xIGV := 'S';
// Fin FAC-201806

   Result := xIGV;
End;

Procedure TFFactSGuia.dtpFFacChange(Sender: TObject);
Begin
   DMFAC.cdsFact2.Edit;
   DMFAC.cdsFact2.FieldByName('FACFEVCMTO').AsDateTime := dtpFFac.Date;
End;

Procedure TFFactSGuia.GrabaCabecera(xModAdi: String);
Var
   xSql, vTipperid, xWhere: String;
Begin
   xSql := 'Select * '
      + '     From FAC305 '
      + '    Where CIAID=' + quotedstr(vCiaid)
      + '      and CLIEID=' + quotedstr(vClieid)
      + '      and FACSERIE=' + quotedstr(vFacserie)
      + '      and NFAC=' + quotedstr(vNfac)
      + '      and FACFECHA=' + quotedstr(vFacFecha);
   DMFAC.cdsQry5.Close;
   DMFAC.cdsQry5.DataRequest(xSql);
   DMFAC.cdsQry5.Open;

   xWhere := 'CLAUXID=' + quotedstr(xClaux)
      + ' AND CLIEID =' + quotedstr(dblcdAso.Text);
   vTipperid := DMFAC.BuscaQry('dspUltTGE', 'TGE204', 'TIPPERID', xWhere, 'TIPPERID');

   If Length(Trim(dbeMonto.Text)) = 0 Then dbeMonto.Text := '0.0000';

   xZonaAso := DMFAC.BuscaQry('dspUltTGE', 'FAC105', 'TVTAID', 'TVTAFLAG =' + QuotedStr('L'), 'TVTAID');
   sZonaAso := DMFAC.BuscaQry('dspUltTGE', 'FAC106', 'ZVTAID', 'TVTAID =' + QuotedStr(xZonaAso) + ' And ZONADEFAUL =' + QuotedStr('S'), 'ZVTAID');
   xCliedes := edtClie.Text;
   If DMFAC.xTipCli = 'S' Then
   Begin
      xWhere := 'CLAUXID=' + QuotedStr('C') + ' AND CLIEID =''' + dblcdAso.Text + ''' ';
      vTipperid := DMFAC.BuscaQry('dspUltTGE', 'TGE204', 'TIPPERID', xWhere, 'TIPPERID');
      xClAux := 'C';
   End
   Else
   Begin
      xClAux := 'AS';
      vTipperid := '01'
   End;

   If DMFAC.cdsQry5.RecordCount = 0 Then
   Begin
      xSQL := 'Insert Into FAC305(CIAID, LOCID, TIPOADQ, TINID, ALMID,'
         + '                      DOCID, FACFECHA, FACTCLI, CLIEID, PROFID,'
         + '                      FACSERIE, CLIERUC, CLIEDIR, FACGARAN, FACDSCTO1,'
         + '                      FPAGOID, OFDESID, CLIEDIRID, FACFEVCMTO, VEID,'
         + '                      TLISTAID, TMONID, FACTCAM, NFAC, CLIECREMAX,'
         + '                      FACTOBS, FACESTADO, INICIAL, NUMINI, FECINI,'
         + '                      CLAUXID, ZONVTAID, TIPVTAID, TIPPERID, CLIEDES,'
         + '                      FACHREG, FACFREG, FACUSER, FACTIP, FACFLAGD, FACANOMES)'
         + '   Values(' + quotedstr(dblcCia.Text) + ','
         + quotedstr(dblcLocal.Text) + ','
         + quotedstr(dblcTipoCompra.Text) + ','
         + quotedstr(dblcTInv.Text) + ','
         + quotedstr(dblcAlmacen.Text) + ','
         + quotedstr(dblcTdoc.Text) + ','
         + quotedstr(dtpFFac.Text) + ','
         + quotedstr(dblcTClie.Text) + ','
         + quotedstr(dblcdAso.Text) + ','
         + quotedstr(dblcdProf.Text) + ','
         + quotedstr(dblcSerie.Text) + ','
         + quotedstr(dblcdClieRuc.Text) + ','
         + quotedstr(Trim(edtDireccion.Text)) + ','
         + quotedstr(dbeGarantia.Text) + ','
         + quotedstr(dbePorcentaje.Text) + ','
         + quotedstr(dblcFPago.Text) + ','
         + quotedstr(dblcOfide.Text) + ','
         + quotedstr(dblcLentrega.Text) + ','
         + quotedstr(dtpFVcmto.Text) + ','
         + quotedstr(dblcVen.Text) + ','
         + quotedstr(dblcLPrecio.Text) + ','
         + quotedstr(dblcTMon.Text) + ','
         + quotedstr(dbeTCambio.Text) + ','
         + quotedstr(dbeNFac.Text) + ','
         + quotedstr(dbeCredito.Text) + ','
         + quotedstr(dbmObs.Lines.Text) + ','
         + quotedstr(Trim(lblEstado.Caption)) + ','
         + quotedstr(dbeMonto.Text) + ','
         + quotedstr(dbeOpe.Text) + ','
         + quotedstr(dtpFecOpe.Text) + ','
         + quotedstr(xClaux) + ','
         + quotedstr(sZonaAso) + ','
         + quotedstr(copy(xZonaAso, 1, 2)) + ','
         + quotedstr(vTipperid) + ','
         + quotedstr(xCliedes) + ','
         + '              sysdate,'
         + '              trunc(sysdate),'
         + quotedstr(DMFAC.wUsuario) + ','
         + quotedstr('N') + ','
         + quotedstr('N') + ','
         + quotedstr(copy(dtpFFac.Text, 7, 4) + copy(dtpFFac.Text, 4, 2))
         + '         )';
   End
   Else
   Begin
      xSQL := 'Update FAC305 '
         + '      set CIAID=' + quotedstr(dblcCia.Text) + ','
         + '          LOCID=' + quotedstr(dblcLocal.Text) + ','
         + '          TIPOADQ=' + quotedstr(dblcTipoCompra.Text) + ','
         + '          TINID=' + quotedstr(dblcTInv.Text) + ','
         + '          ALMID=' + quotedstr(dblcAlmacen.Text) + ','
         + '          DOCID=' + quotedstr(dblcTdoc.Text) + ','
         + '          FACFECHA=' + quotedstr(dtpFFac.Text) + ','
         + '          FACTCLI=' + quotedstr(dblcTClie.Text) + ','
         + '          CLIEID=' + quotedstr(dblcdAso.Text) + ','
         + '          PROFID=' + quotedstr(dblcdProf.Text) + ','
         + '          FACSERIE=' + quotedstr(dblcSerie.Text) + ','
         + '          CLIERUC=' + quotedstr(dblcdClieRuc.Text) + ','
         + '          CLIEDIR=' + quotedstr(Trim(edtDireccion.Text)) + ','
         + '          FACGARAN=' + quotedstr(dbeGarantia.Text) + ','
         + '          FACDSCTO1=' + quotedstr(dbePorcentaje.Text) + ','
         + '          FPAGOID=' + quotedstr(dblcFPago.Text) + ','
         + '          OFDESID=' + quotedstr(dblcOfide.Text) + ','
         + '          CLIEDIRID=' + quotedstr(dblcLentrega.Text) + ','
         + '          FACFEVCMTO=' + quotedstr(dtpFVcmto.Text) + ','
         + '          VEID=' + quotedstr(dblcVen.Text) + ','
         + '          TLISTAID=' + quotedstr(dblcLPrecio.Text) + ','
         + '          TMONID=' + quotedstr(dblcTMon.Text) + ','
         + '          FACTCAM=' + quotedstr(dbeTCambio.Text) + ','
         + '          NFAC=' + quotedstr(dbeNFac.Text) + ','
         + '          CLIECREMAX=' + quotedstr(dbeCredito.Text) + ','
         + '          FACTOBS=' + quotedstr(dbmObs.Lines.Text) + ','
         + '          FACESTADO=' + quotedstr(Trim(lblEstado.Caption)) + ','
         + '          INICIAL=' + quotedstr(dbeMonto.Text) + ','
         + '          NUMINI=' + quotedstr(dbeOpe.Text) + ','
         + '          FECINI=' + quotedstr(dtpFecOpe.Text) + ','
         + '          FACHREG=sysdate,'
         + '          FACFREG=trunc(sysdate),'
         + '          FACUSER=' + quotedstr(DMFAC.wUsuario) + ','
         + '          FACTIP=' + quotedstr('N') + ','
         + '          FACFLAGD=' + quotedstr('N') + ','
         + '          CLAUXID=' + quotedstr(xClaux) + ','
         + '          ZONVTAID=' + quotedstr(sZonaAso) + ','
         + '          TIPPERID=' + quotedstr(vTipperid) + ','
         + '          CLIEDES=' + quotedstr(xCliedes) + ','
         + '          TIPVTAID=' + quotedstr(copy(xZonaAso, 1, 2)) + ','
         + '          FACANOMES=' + quotedstr(copy(dtpFFac.Text, 7, 4) + copy(dtpFFac.Text, 4, 2))
         + '    Where CIAID=' + quotedstr(vCiaid)
         + '      and CLIEID=' + quotedstr(vClieid)
         + '      and FACSERIE=' + quotedstr(vFacserie)
         + '      and NFAC=' + quotedstr(vNfac)
         + '      and FACFECHA=' + quotedstr(vFacFecha);
   End;

   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo actualizar el archivo (FAC305) al pasar de Cabecera a Detalle');
      xContinuaGrab := False;
      exit;
   End;
End;

Procedure TFFactSGuia.GrabaDetalle(xModAdi: String);
Var
   vDFACTCAM, vDFACPREUMO, vDFACDCTO, vDFACDTOUMO, vDFACDCTO2, vDFACDTOMO2, vDFACCOMLMO, vDFACIMP1, vDFACIMPMTO1, vDFACIMP2, vDFACIMPMTO2,
      vDFACMTOMO, vDFACVTOTMO, vDFACCANTG, vDFACCANTAT, vDFACPREVMO, vDFACPREUMN, vDFACDTOUMN, vDFACDTOMN2, vDFACMTOMN, vDFACVTOTMN, vDFACIMPMTN1,
      vDFACIMPMTN2, vDFACPREUME, vDFACDTOUME, vDFACDTOME2, vDFACMTOME, vDFACVTOTME, vDFACIMPMTE1, vDFACIMPMTE2, vCLIECREMAX: Double;
   vDFACSERMO, vDFACSERMN, vDFACSERME: Double;

   vGRARID, vFAMID, vSFAMID, vTINID, vUNMIDG, vUNMIDO, vUNMABR, vDFACCONT, vUNMIDU, vARTID, vALMID, vDFACITEM, vTIPOADQ, vARTDES, vDOCID,
      vDFACGARAN, vCLIERUC, vTLISTAID, vFPAGOID, vVEID, vLOCID, vFACTIP, vDFACTFLAG, vCODCOM, vCIAID, vCLIEID, vFACSERIE, vNFAC,
      vCLAUXID, vTMONID, vDFACESTADO, vDFACUSER, vFACFECHA, vDFACFREG, vFACTCLI, vDFACHREG, vDFACHOR, vDFACANOMES, vDFACIGV, vDFACISC: String;

   sArticulo, sArtDes, xIGVSN: String;
   xCtAceptada, xInc5, xTotInc5, xDscto1, xTotDscto1, xDscto2, xTotDscto2, xImp1, xImp2, xValor, xPrecio, xImporte, xStotal, xTotal, xTotImp1, xTotImp2, xPVentaTot: Double;
   xServicio, xTasaServ: double;
   bContenido: boolean;
   xSQL: String;
Begin
   If Length(TRim(dbeImporteIGV.text)) = 0 Then dbeImporteIGV.text := '0.0000';

// Incremento 5% por Tarjeta
   xInc5 := 0;
   If length(dbeInc.Text) > 0 Then
      xInc5 := FRound(strtofloat(dbeInc.Text), 8, 4);

// Venta de Artículo
   If sTipoRQS = 'C' Then
   Begin
      sArticulo := dblcdArticulo.Text;
      sArtDes := copy(Trim(dbeArticulo.Text), 1, 60);

      If dbeRed.Text = dbeImporteIGV.Text Then
         xPrecio := FRound(StrToFloat(dbePrecioG.Text), 15, 4)
      Else
         xPrecio := FRound(StrToFloat(dbePrecioG.Text), 15, 4);

   // Recargo por tarjeta se suma al precio
      If fTipoInc = 2 Then
      Begin
         If xInc5 > 0 Then
            xTotInc5 := FRound(xPrecio * (xInc5 / 100),15,4)
         Else
            xTotInc5 := 0;
         xPrecio := FRound(xPrecio + xTotInc5,15,4);
      End;

   // Comisión por tarjeta, se resta al Precio
      If fTipoInc = 1 Then
      Begin
         If FRound(xTotInc5, 15, 4) > 0 Then
            xPrecio := xPrecio - FRound(xTotInc5, 15, 4);
      End;
      xCtAceptada := FRound(StrToFloat(dbeCantGA.Text), 15, 2);

   // Descuento porcentual a nivel de Condicion Comercial
      If length(dbePorcentaje.Text) > 0 Then
         xDscto1 := FRound(strtofloat(dbePorcentaje.Text), 8, 2)
      Else
         xDscto1 := 0;

   // Descuento 2
      If length(edtDsto2.Text) > 0 Then
         xDscto2 := FRound(strtofloat(edtDsto2.Text), 8, 2)
      Else
         xDscto2 := 0;

   // Tasa de IGV DEL 19%
      If dtpFFac.date <= strtodate('28/02/2011') Then
         xImp1 := StrToFloat(xImpTasa19)
      Else
         xImp1 := StrToFloat(xImpTasa);
      xImp2 := 0;

   // Tasa de Servicio
      xTasaServ := DMFAC.cdsTLPrecio.FieldByname('TASSERV').Ascurrency;

   // Servicios
      If length(dbeServicio.Text) > 0 Then
         xServicio := FRound(StrToFloat(dbeServicio.Text), 15, 4)
      Else
         xServicio := 0;

   // Cantidad Aceptada Unidad
      If length(dbeCantUA.Text) > 0 Then
      Begin
         xValor := strtofloat(DMFAC.BuscaQry('dspUltTGE', 'TGE156', 'EUNMEQ', 'EUNMID1=' + QuotedStr(dbeUmg.Text), 'EUNMEQ'));
         xCtAceptada := Fround(xCtAceptada + (strtofloat(dbeCantUA.Text) / xValor), 15, 2);
      End;
   End
   Else
   Begin
   // Venta de Servicios - Tipo de Requerimiento='S'
      If sTipoRQS = 'S' Then
      Begin
      // Para ingresar Servicios con código de Concesión
         sArticulo := dblcdServicio.Text;
         If Length(Trim(memDetServ.Text)) > 0 Then
            sArtDes := Copy(memDetServ.Text, 1, 60)
         Else
            sArtDes := Copy(memDetalle.Text, 1, 60);

         xPrecio := FRound(StrToFloat(dbePUnit.Text), 15, 4);
         xCtAceptada := fRound(StrToFloat(dbeCnt.Text), 15, 4);

      // Descuento porcentual a nivel de Condición Comercial
         If Length(dbePorcentaje.Text) > 0 Then
            xDscto1 := FRound(StrToFloat(dbePorcentaje.Text), 8, 2)
         Else
            xDscto1 := 0;

      // Descuento 2
         If Length(dbeDscto.Text) > 0 Then
            xDscto2 := FRound(StrToFloat(dbeDscto.Text), 8, 2)
         Else
            xDscto2 := 0;

      // Impuesto IGV
         If Length(dbeImpIgv.Text) > 0 Then
            xImp1 := FRound(StrToFloat(dbeImpIgv.Text), 15, 4)
         Else
            xImp1 := 0;

      // Otro Impuesto
         If length(dbeImp2.Text) > 0 Then
            xImp2 := FRound(StrToFloat(dbeImp2.Text), 15, 4)
         Else
            xImp2 := 0;

      // Tasa de Servicio
         xTasaServ := DMFAC.cdsVende.FieldByname('TASSERV').Ascurrency;

      // Servicios
         If length(dbeServicio2.Text) > 0 Then
            xServicio := FRound(StrToFloat(dbeServicio2.Text), 15, 4)
         Else
            xServicio := 0;

      End;
   End;

   xImporte := FRound(xPrecio * xCtAceptada, 15, 4);

   xTotDscto1 := xImporte * (xDscto1 / 100);
   xTotDscto1 := FRound(xTotDscto1, 15, 4);

   xStotal := FRound((xImporte - xTotDscto1), 15, 4);

   If xDscto2 > 0 Then
      xTotDscto2 := xStotal * (xDscto2 / 100)
   Else
      xTotDscto2 := 0;

   xTotal := FRound(xStotal - xTotDscto2, 15, 4);

// Verifica si esta marcado para calcular IGV
   xIGVSN := ConIGV();
   If xIGVSN = 'N' Then
   Begin
      xImp1 := 0.00;
      xTotImp1 := 0.00;
   End
   Else
   Begin
      xTotImp1 := FRound(xTotal * (xImp1 / 100), 15, 4);
   End;

   xTotImp2 := FRound(xTotal * (xImp2 / 100), 15, 4);
   xPVentaTot := FRound(xTotal + xTotImp1 + xTotImp2 + xServicio, 15, 4); // precio de venta total

   If sTipoRQS = 'C' Then
   Begin
      If dbeRed.visible Then
      Begin
         If length(trim(dbeRed.Text)) = 0 Then dbeRed.Text := '0';
         If StrToFloat(dbeRed.Text) = StrToFloat(dbeImporteIGV.Text) Then
            xPVentaTot := FRound(xTotal + xTotImp1 + xTotImp2 + xServicio, 15, 4) // precio de venta total
         Else
         Begin
            If StrToFloat(dbeRed.Text) > StrToFloat(dbeImporteIGV.Text) Then
               xTotImp1 := xTotImp1 + (StrToFloat(dbeRed.Text) - StrToFloat(dbeImporteIGV.Text))
            Else
               xTotal := xTotal - (StrToFloat(dbeImporteIGV.Text) - StrToFloat(dbeRed.Text));

            xTotImp1 := xTotImp1 + (StrToFloat(dbeRed.Text) - (xTotal + xTotImp1));
            xPVentaTot := FRound(xTotal + xTotImp1 + xTotImp2 + xServicio, 15, 4); // precio de venta total
         End;
      End;
   End;

   xTotImp1 := FRound(xTotImp1, 15, 4);
   xTotImp2 := FRound(xTotImp2, 15, 4);
   xTotal := FRound(xPVentaTot - xTotImp1 - xTotImp2 - xServicio, 15, 4); // Base Imponible (*Cantidad Total)

   If xFlagInsert Then
      vDFACITEM := DMFAC.StrZero(DMFAC.MaxValue('DFACITEM', DMFAC.cdsDetFact2), 3)
   Else
      vDFACITEM := DMFAC.cdsDetFact2.FieldByName('DFACITEM').AsString;

   vCIAID      := DMFAC.cdsFact2.FieldByName('CIAID').AsString;
   vCLIEID     := DMFAC.cdsFact2.FieldByName('CLIEID').AsString;
   vFACSERIE   := DMFAC.cdsFact2.FieldByName('FACSERIE').AsString;
   vNFAC       := DMFAC.cdsFact2.FieldByName('NFAC').AsString;
   vCLAUXID    := DMFAC.cdsFact2.FieldByName('CLAUXID').AsString;
   vTMONID     := DMFAC.cdsFact2.FieldByName('TMONID').AsString;
   vDFACTCAM   := FRound(DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat, 15, 3);
   vDFACESTADO := 'ACEPTADO';
   vDFACUSER   := DMFAC.wUsuario;
   vFACFECHA   := dtpFFac.Text;
   vFACTCLI    := DMFAC.cdsFact2.FieldByName('FACTCLI').AsString;
   vDFACANOMES := DMFAC.cdsFact2.FieldByName('FACANOMES').AsString;
   vDFACPREUMO := FRound(xPrecio, 15, 4); //Precio
   vDFACDCTO   := FRound(xDscto1, 8, 2); //Porcentaje Descuentos 1
   vDFACDTOUMO := FRound(xTotDscto1, 15, 2); //Monto Descuento 1
   vDFACDCTO2  := FRound(xDscto2, 8, 2); //Porcentaje Descuentos 2
   vDFACDTOMO2 := FRound(xTotDscto2, 15, 2); //Descuento 2
   vDFACCOMLMO := FRound(xTotInc5, 15, 4); //Comision por Tarjeta
   vDFACIMP1   := FRound(xImp1, 15, 4); //Porcentaje Impuesto 1
   vDFACIMPMTO1:= FRound(xTotImp1, 15, 4); //Monto Impuesto 1
   vDFACIMP2   := FRound(xImp2, 15, 4); //Porcentaje Impuesto 2
   vDFACIMPMTO2:= FRound(xTotImp2, 15, 4); //Monto Impuesto 2
   vDFACMTOMO  := FRound(xTotal, 15, 4); //Montos
   vDFACVTOTMO := FRound(xPVentaTot, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
   vDFACCANTG  := xCtAceptada;
   vDFACCANTAT := xCtAceptada;
   vDFACPREVMO := FRound(vDFACMTOMO / vDFACCANTAT, 15, 4);
   vDFACSERMO  := xServicio;

   If (vTMONID = DMFAC.wTMonLoc) Then
   Begin
      vDFACPREUMN  := FRound(vDFACPREUMO, 15, 4);
      vDFACDTOUMN  := FRound(vDFACDTOUMO, 15, 4);
      vDFACDTOMN2  := FRound(vDFACDTOMO2, 15, 4);
      vDFACMTOMN   := FRound(vDFACMTOMO, 15, 4);
      vDFACVTOTMN  := FRound(vDFACVTOTMO, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
      vDFACIMPMTN1 := FRound(vDFACIMPMTO1, 15, 4);
      vDFACIMPMTN2 := FRound(vDFACIMPMTO2, 15, 4); //Monto Impuesto 2
      vDFACSERMN   := FRound(vDFACSERMO, 15, 4); //Monto Servicio

      If DMFAC.cdsFact2.FieldByName('FACTCAM').AsFloat > 0 Then
      Begin
         vDFACPREUME  := FRound(vDFACPREUMO / vDFACTCAM, 15, 4); //Precios
         vDFACDTOUME  := FRound(vDFACDTOUMO / vDFACTCAM, 15, 4); //descuentos 1
         vDFACDTOME2  := FRound(vDFACDTOMO2 / vDFACTCAM, 15, 4); //descuentos 2
         vDFACMTOME   := FRound(vDFACMTOMO / vDFACTCAM, 15, 4);
         vDFACVTOTME  := FRound(vDFACVTOTMO / vDFACTCAM, 15, 4); //Monto Total + Impuesto 1 + Impuesto 2
         vDFACIMPMTE1 := FRound(vDFACIMPMTO1 / vDFACTCAM, 15, 4);
         vDFACIMPMTE2 := FRound(vDFACIMPMTO2 / vDFACTCAM, 15, 4);
         vDFACSERME   := FRound(vDFACSERMO / vDFACTCAM, 15, 4);
      End;
   End
   Else
   Begin
      vDFACPREUME  := FRound(vDFACPREUMO, 15, 4);
      vDFACPREUMN  := FRound(vDFACPREUMO * vDFACTCAM, 15, 4);
      vDFACDTOUMN  := FRound(vDFACDTOUMO * vDFACTCAM, 15, 4); //Descuentos
      vDFACDTOUME  := FRound(vDFACDTOUMO, 15, 4);
      vDFACDTOMN2  := FRound(vDFACDTOMO2 * vDFACTCAM, 15, 4); //Descuentos
      vDFACDTOME2  := FRound(vDFACDTOMO2, 15, 4);
      vDFACMTOMN   := FRound(vDFACMTOMO * vDFACTCAM, 15, 4);
      vDFACMTOME   := FRound(vDFACMTOMO, 15, 4);
      vDFACVTOTMN  := FRound(vDFACVTOTMO * vDFACTCAM, 15, 4);
      vDFACVTOTME  := FRound(vDFACVTOTMO, 15, 4);
      vDFACIMPMTN1 := FRound(vDFACIMPMTO1 * vDFACTCAM, 15, 4);
      vDFACIMPMTE1 := FRound(vDFACIMPMTO1, 15, 4);
      vDFACIMPMTN2 := FRound(vDFACIMPMTO2 * vDFACTCAM, 15, 4);
      vDFACIMPMTE2 := FRound(vDFACIMPMTO2, 15, 4);
      vDFACSERMN   := FRound(vDFACSERMO * vDFACTCAM, 15, 4);
      vDFACSERME   := FRound(vDFACSERMO, 15, 4);
   End;

   If sTipoRQS = 'C' Then
   Begin
      xFiltro := 'CIAID=' + QuotedStr(dblcCia.Text) + ' AND TINID =' + QuotedStr(dblcTInv.Text) + ' and ARTID=' + QuotedStr(dblcdArticulo.Text);
      Filtracds(DMFAC.cdsUltTGE, 'SELECT GRARID, FAMID, SFAMID, TINID, ARTCONT, UNMIDG, UNMIDU FROM TGE205 WHERE ' + xFiltro);

   // Llenado de Campos del Maestro de Articulos
      vGRARID := DMFAC.cdsUltTGE.FieldByName('GRARID').AsString; // Linea
      vFAMID := DMFAC.cdsUltTGE.FieldByName('FAMID').AsString; // Familia
      vSFAMID := DMFAC.cdsUltTGE.FieldByName('SFAMID').AsString; // SubFamilia
      vTINID := DMFAC.cdsUltTGE.FieldByName('TINID').AsString; // SubFamilia
      vALMID := DMFAC.cdsQry4.FieldByName('ALMID').AsString; // Almacen

      vARTID := sArticulo;

      If Length(Trim(vALMID)) = 0 Then
         vALMID := DMFAC.cdsTLPrecio.FIELDBYNAME('ALMID').ASSTRING;

      bContenido := (DMFAC.cdsUltTGE.FieldByName('ARTCONT').AsInteger > 1);
      If Not bContenido Then
      Begin
         vUNMIDG := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
         vUNMIDO := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
         vUNMABR := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
         vDFACCONT := 'S';
      End
      Else
      Begin
         If (cbTipoUm.ItemIndex = 0) Then //General
         Begin
            vDFACCONT := 'S';
            vUNMIDG := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString;
            vUNMIDO := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
            vUNMABR := DMFAC.cdsUltTGE.FieldByName('UNMIDG').AsString; // Un.de Medida  Gen
         End
         Else
            If (cbTipoUm.ItemIndex = 1) Then //Unitaria
            Begin
               vDFACCONT := 'N';
               vUNMIDU := DMFAC.cdsUltTGE.FieldByName('UNMIDU').AsString; // Unid.Medida Unit
               vUNMIDO := DMFAC.cdsUltTGE.FieldByName('UNMIDU').AsString; // Un.de Medida  Gen
               vUNMABR := DMFAC.cdsUltTGE.FieldByName('UNMIDU').AsString; // Un.de Medida  Gen
            End;
         DMFAC.cdsUltTGE.Close;
      End;
   End;

   If sTipoRQS = 'S' Then
   Begin
      vARTID := sArticulo;
      vALMID := dblcAlmacen.Text;
      vTINID := '00';
      vGRARID := '00';
      vFAMID := '00';
      vSFAMID := '00';
      vUNMIDG := 'UND'; // Un.de Medida  Gen
      vUNMIDO := 'UND'; // Un.de Medida  Gen
      vUNMABR := 'UND'; // Un.de Medida  Gen
      vDFACCONT := 'N';
      vDFACIGV := 'S';
      vDFACISC := 'N';
      vDFACITEM := dbeItem.Text;
      vALMID := dblcAlmacen.Text;
   End
   Else
   Begin
      vDFACIGV := xCIgv;
      vDFACISC := xCIsc;
   End;

   vTIPOADQ := sTipoRQS;
   vARTDES := sArtDes;
   vDOCID := dblcTdoc.Text;
   vDFACGARAN := dbeDGarantia.Text;
   vCLIECREMAX := FRound(DMFAC.cdsFact2.FieldByName('CLIECREMAX').AsFloat, 15, 4);
   vTLISTAID := DMFAC.cdsFact2.FieldByName('TLISTAID').Asstring; // Monto Dsctos
   vFPAGOID := DMFAC.cdsFact2.FieldByName('FPAGOID').AsString;
   vVEID := DMFAC.cdsFact2.FieldByName('VEID').AsString;
   vLOCID := DMFAC.cdsFact2.FieldByName('LOCID').AsString;
   vFACTIP := 'N'; // Variable para indicar el tipo de Factura en Filtros; con Guia
   vDFACTFLAG := 'X';
   vCLIERUC := DMFAC.cdsFact2.FieldByName('CLIERUC').AsString; // Monto Dsctos
   If Length(trim(vCLIERUC)) = 0 Then vCLIERUC := '00000000000';

   If cCombo = 'xyz123' Then
   Else
      vCODCOM := cCombo;

   If sTipoRQS = 'C' Then
   Begin
      If xFlagInsert Then
      Begin
         dbeDGarantia.Text := dbeGarantia.Text;
         dbeArticulo.Text := '';
      End
      Else
      Begin
         dbgDetFac.Refresh;
         pnlDetalle.Enabled := True;
         pnlPie.Enabled := True;
      End;
   End;

   xSQL := 'Select ARTID '
      + '     from FAC306 '
      + '    where CIAID=' + quotedstr(dblcCia.Text)
      + '      and DOCID =' + quotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + '      and FACSERIE =' + quotedStr(dblcSerie.Text)
      + '      and NFAC =' + quotedStr(dbeNFac.Text)
      + '      and ARTID=' + quotedStr(vARTID);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount > 0 Then
      wInserta := False
   Else
      wInserta := True;

   If wInserta Then
   Begin
      xSQL := 'Insert into '
         + '      DB2ADMIN.FAC306(ALMID, ARTDES, ARTID, CIAID, CLAUXID, CLIECREMAX, CLIEID, '
         + '             CLIERUC, CODCOM, DFACANOMES, DFACCANTAT, DFACCANTG, DFACCOMLMO,'
         + '             DFACCONT, DFACDCTO, DFACDCTO2, DFACDTOME2, DFACDTOMN2, DFACDTOMO2, '
         + '             DFACDTOUME, DFACDTOUMN, DFACDTOUMO, DFACESTADO, DFACGARAN, DFACIGV, '
         + '             DFACIMP1, DFACIMP2, DFACIMPMTE1, DFACIMPMTE2, DFACIMPMTN1, DFACIMPMTN2, '
         + '             DFACIMPMTO1, DFACIMPMTO2, DFACISC, DFACITEM, DFACMTOME, DFACMTOMN, '
         + '             DFACMTOMO, DFACPREUME, DFACPREUMN, DFACPREUMO, DFACPREVMO, DFACTCAM, '
         + '             DFACTFLAG, DFACUSER, DFACVTOTME, DFACVTOTMN, DFACVTOTMO, DOCID, '
         + '             FACFECHA, FACSERIE, FACTCLI, FACTIP, FAMID, FPAGOID, GRARID, '
         + '             LOCID, NFAC, SFAMID, TINID, TIPOADQ, TLISTAID, TMONID, UNMABR, '
         + '             UNMIDG, UNMIDO, UNMIDU, VEID,DFACSERMO, DFACSERMN, DFACSERME, '
         + '             PORSER, DFACFREG, DFACHREG, DFACHOR) '
         + '   values('
         +            quotedstr(vALMID) + ',' + quotedstr(vARTDES) + ',' + quotedstr(vARTID) + ','
         +            quotedstr(vCIAID) + ',' + quotedstr(vCLAUXID) + ',' + FloatToStr(vCLIECREMAX) + ','
         +            quotedstr(vCLIEID) + ',' + quotedstr(vCLIERUC) + ',' + quotedstr(vCODCOM) + ','
         +            quotedstr(vDFACANOMES) + ',' + FloatToStr(vDFACCANTAT) + ',' + FloatToStr(vDFACCANTG) + ','
         +            FloatToStr(vDFACCOMLMO) + ',' + quotedstr(vDFACCONT) + ',' + FloatToStr(vDFACDCTO) + ','
         +            FloatToStr(vDFACDCTO2) + ',' + FloatToStr(vDFACDTOME2) + ',' + FloatToStr(vDFACDTOMN2) + ','
         +            FloatToStr(vDFACDTOMO2) + ',' + FloatToStr(vDFACDTOUME) + ',' + FloatToStr(vDFACDTOUMN) + ','
         +            FloatToStr(vDFACDTOUMO) + ',' + quotedstr(vDFACESTADO) + ',' + quotedstr(vDFACGARAN) + ','
         +            quotedstr(vDFACIGV) + ',' + FloatToStr(vDFACIMP1) + ',' + FloatToStr(vDFACIMP2) + ','
         +            FloatToStr(vDFACIMPMTE1) + ',' + FloatToStr(vDFACIMPMTE2) + ',' + FloatToStr(vDFACIMPMTN1) + ','
         +            FloatToStr(vDFACIMPMTN2) + ',' + FloatToStr(vDFACIMPMTO1) + ',' + FloatToStr(vDFACIMPMTO2) + ','
         +            quotedstr(vDFACISC) + ',' + quotedstr(vDFACITEM) + ',' + FloatToStr(vDFACMTOME) + ','
         +            FloatToStr(vDFACMTOMN) + ',' + FloatToStr(vDFACMTOMO) + ',' + FloatToStr(vDFACPREUME) + ','
         +            FloatToStr(vDFACPREUMN) + ',' + FloatToStr(vDFACPREUMO) + ',' + FloatToStr(vDFACPREVMO) + ','
         +            FloatToStr(vDFACTCAM) + ',' + quotedstr(vDFACTFLAG) + ',' + quotedstr(vDFACUSER) + ','
         +            FloatToStr(vDFACVTOTME) + ',' + FloatToStr(vDFACVTOTMN) + ',' + FloatToStr(vDFACVTOTMO) + ','
         +            quotedstr(vDOCID) + ',' + quotedstr(vFACFECHA) + ',' + quotedstr(vFACSERIE) + ','
         +            quotedstr(vFACTCLI) + ',' + quotedstr(vFACTIP) + ',' + quotedstr(vFAMID) + ','
         +            quotedstr(vFPAGOID) + ',' + quotedstr(vGRARID) + ',' + quotedstr(vLOCID) + ','
         +            quotedstr(vNFAC) + ',' + quotedstr(vSFAMID) + ',' + quotedstr(vTINID) + ','
         +            quotedstr(vTIPOADQ) + ',' + quotedstr(vTLISTAID) + ',' + quotedstr(vTMONID) + ','
         +            quotedstr(vUNMABR) + ',' + quotedstr(vUNMIDG) + ',' + quotedstr(vUNMIDO) + ','
         +            quotedstr(vUNMIDU) + ',' + quotedstr(vVEID) + ',' + FloatToStr(vDFACSERMO) + ','
         +            FloatToStr(vDFACSERMN) + ',' + FloatToStr(vDFACSERME) + ','
         +            FloatToStr(xTasaServ) + ',Trunc(sysdate),sysdate,sysdate)';
   End
   Else
   Begin
      xSQL := 'Update DB2ADMIN.FAC306 '
         + '      set ALMID=' + quotedstr(vALMID) + ','
         + '          ARTDES=' + quotedstr(vARTDES) + ','
         + '          ARTID=' + quotedstr(vARTID) + ','
         + '          CLAUXID=' + quotedstr(vCLAUXID) + ','
         + '          CLIECREMAX=' + FloatToStr(vCLIECREMAX) + ','
         + '          CLIEID=' + quotedstr(vCLIEID) + ','
         + '          CLIERUC=' + quotedstr(vCLIERUC) + ','
         + '          CODCOM=' + quotedstr(vCODCOM) + ','
         + '          DFACANOMES=' + quotedstr(vDFACANOMES) + ','
         + '          DFACCANTAT=' + FloatToStr(vDFACCANTAT) + ','
         + '          DFACCANTG=' + FloatToStr(vDFACCANTG) + ','
         + '          DFACCOMLMO=' + FloatToStr(vDFACCOMLMO) + ','
         + '          DFACCONT=' + quotedstr(vDFACCONT) + ','
         + '          DFACDCTO=' + FloatToStr(vDFACDCTO) + ','
         + '          DFACDCTO2=' + FloatToStr(vDFACDCTO2) + ','
         + '          DFACDTOME2=' + FloatToStr(vDFACDTOME2) + ','
         + '          DFACDTOMN2=' + FloatToStr(vDFACDTOMN2) + ','
         + '          DFACDTOMO2=' + FloatToStr(vDFACDTOMO2) + ','
         + '          DFACDTOUME=' + FloatToStr(vDFACDTOUME) + ','
         + '          DFACDTOUMN=' + FloatToStr(vDFACDTOUMN) + ','
         + '          DFACDTOUMO=' + FloatToStr(vDFACDTOUMO) + ','
         + '          DFACESTADO=' + quotedstr(vDFACESTADO) + ','
         + '          DFACGARAN=' + quotedstr(vDFACGARAN) + ','
         + '          DFACIGV=' + quotedstr(vDFACIGV) + ','
         + '          DFACIMP1=' + FloatToStr(vDFACIMP1) + ','
         + '          DFACIMP2=' + FloatToStr(vDFACIMP2) + ','
         + '          DFACIMPMTE1=' + FloatToStr(vDFACIMPMTE1) + ','
         + '          DFACIMPMTE2=' + FloatToStr(vDFACIMPMTE2) + ','
         + '          DFACIMPMTN1=' + FloatToStr(vDFACIMPMTN1) + ','
         + '          DFACIMPMTN2=' + FloatToStr(vDFACIMPMTN2) + ','
         + '          DFACIMPMTO1=' + FloatToStr(vDFACIMPMTO1) + ','
         + '          DFACIMPMTO2=' + FloatToStr(vDFACIMPMTO2) + ','
         + '          DFACISC=' + quotedstr(vDFACISC) + ','
         + '          DFACMTOME=' + FloatToStr(vDFACMTOME) + ','
         + '          DFACMTOMN=' + FloatToStr(vDFACMTOMN) + ','
         + '          DFACMTOMO=' + FloatToStr(vDFACMTOMO) + ','
         + '          DFACPREUME=' + FloatToStr(vDFACPREUME) + ','
         + '          DFACPREUMN=' + FloatToStr(vDFACPREUMN) + ','
         + '          DFACPREUMO=' + FloatToStr(vDFACPREUMO) + ','
         + '          DFACPREVMO=' + FloatToStr(vDFACPREVMO) + ','
         + '          DFACTCAM=' + FloatToStr(vDFACTCAM) + ','
         + '          DFACTFLAG=' + quotedstr(vDFACTFLAG) + ','
         + '          DFACUSER=' + quotedstr(vDFACUSER) + ','
         + '          DFACVTOTME=' + FloatToStr(vDFACVTOTME) + ','
         + '          DFACVTOTMN=' + FloatToStr(vDFACVTOTMN) + ','
         + '          DFACVTOTMO=' + FloatToStr(vDFACVTOTMO) + ','
         + '          DOCID=' + quotedstr(vDOCID) + ','
         + '          FACFECHA=' + quotedstr(vFACFECHA) + ','
         + '          FACTCLI=' + quotedstr(vFACTCLI) + ','
         + '          FACTIP=' + quotedstr(vFACTIP) + ','
         + '          FAMID=' + quotedstr(vFAMID) + ','
         + '          FPAGOID=' + quotedstr(vFPAGOID) + ','
         + '          GRARID=' + quotedstr(vGRARID) + ','
         + '          LOCID=' + quotedstr(vLOCID) + ','
         + '          SFAMID=' + quotedstr(vSFAMID) + ','
         + '          TINID=' + quotedstr(vTINID) + ','
         + '          TIPOADQ=' + quotedstr(vTIPOADQ) + ','
         + '          TLISTAID=' + quotedstr(vTLISTAID) + ','
         + '          TMONID=' + quotedstr(vTMONID) + ','
         + '          UNMABR=' + quotedstr(vUNMABR) + ','
         + '          UNMIDG=' + quotedstr(vUNMIDG) + ','
         + '          UNMIDO=' + quotedstr(vUNMIDO) + ','
         + '          UNMIDU=' + quotedstr(vUNMIDU) + ','
         + '          VEID=' + quotedstr(vVEID) + ','
         + '          DFACSERMO=' + FloatToStr(vDFACSERMO) + ','
         + '          DFACSERMN=' + FloatToStr(vDFACSERMN) + ','
         + '          DFACSERME=' + FloatToStr(vDFACSERME) + ','
         + '          PORSER=' + FloatToStr(xTasaServ) + ' '
         + '    Where CIAID=' + quotedstr(vCIAID)
         + '      and FACSERIE=' + quotedstr(vFACSERIE)
         + '      and NFAC=' + quotedstr(vNFAC)
         + '      and DFACITEM=' + quotedstr(vDFACITEM);
   End;

   Try
      xContinuaGrab := True;
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSql);
      wInserta := False;
   Except
      Showmessage('No se pudo grabar el Detalle de la Facturación');
      xContinuaGrab := False;
      exit;
   End;
End;

Procedure TFFactSGuia.AcumulaTotCabecera;
Var
   xTMonto, xTDscto: double;
   xTIgv1, xTIgv2, xTIsc, xTFact, xTServicio, xTasServ, vFACSERME, vFACSERMN, vFACMTOMO, vFACSERM, vFACDCTOMO, vFACIGVMO, vFACIGV2MO, vFACISCMO, vFACTOTMO: double;
   vFACTOTMN, vFACTOTME, vFACIGVMN, vFACIGVME, vFACIGV2MN, vFACIGV2ME, vFACISCMN, vFACISCME, vFACMTOMN, vFACMTOME, vFACDCTOMN, vFACDCTOME, vFACEMBMN, vFACEMBME, vINICIAL: double;
   vFACSERMO: double;
   xsSQL: String;
Begin
   If DMFAC.wAdmin = 'G' Then Exit;
   xsSQL := 'Select CIAID, DOCID, FACSERIE, NFAC, '
       + '          round(sum(nvl(DFACMTOMO,0)), 4) FACMTOMO, '
       + '          round(sum(nvl(DFACDTOUMO,0) + nvl(DFACDTOMO2,0)),4) FACDCTOMO, '
       + '          round(sum(nvl(DFACIMPMTO1,0)), 4) FACIGVMO, '
       + '          round(sum(nvl(DFACIMPMTO2,0)), 4) FACIGV2MO, '
       + '          0.00 FACISCMO, 0.00 FACISCMN, 0.00 FACISCME, '
       + '          round(sum(nvl(DFACVTOTMO,0)), 4) FACTOTMO, '
       + '          round(sum(nvl(DFACVTOTMN,0)), 4) FACTOTMN, '
       + '          round(sum(nvl(DFACVTOTME,0)), 4) FACTOTME, '
       + '          round(sum(nvl(DFACIMPMTN1,0)), 4) FACIGVMN, '
       + '          round(sum(nvl(DFACIMPMTE1,0)), 4) FACIGVME, '
       + '          round(sum(nvl(DFACIMPMTN2,0)), 4) FACIGV2MN,'
       + '          round(sum(nvl(DFACIMPMTE2,0)), 4) FACIGV2ME,'
       + '          round(sum(nvl(DFACMTOMN,0)), 4) FACMTOMN, '
       + '          round(sum(nvl(DFACMTOME,0)), 4) FACMTOME, '
       + '          round(sum(nvl(DFACDTOUMN,0)), 4) + round(sum(nvl(DFACDTOMN2,0)), 4) FACDCTOMN, '
       + '          round(sum(nvl(DFACDTOUME,0)), 4) + round(sum(nvl(DFACDTOME2,0)), 4) FACDCTOME, '
       + '          round(sum(nvl(DFACSERMO,0)), 4) FACSERMO, '
       + '          round(sum(nvl(DFACSERMN,0)), 4) FACSERMN, '
       + '          round(sum(nvl(DFACSERME,0)), 4) FACSERME, '
       + '          max(PORSER) PORSER '
       + '     from DB2ADMIN.FAC306 '
       + '    where CIAID=' + Quotedstr(dblcCia.Text)
       + '      and DOCID=' + Quotedstr(dblcTdoc.Text)
       + '      and FACSERIE='  + Quotedstr(dblcSerie.Text)
       + '      and NFAC='+Quotedstr(dbeNFac.Text)
       + '    group by CIAID, DOCID, FACSERIE, NFAC ';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xsSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount>0 Then
   Begin
      xsSQL := 'update FAC305 '
         + '   set FACMTOMO  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACMTOMO').AsFloat) + ','
         + '       FACDCTOMO = ' + floattostr(DMFAC.cdsQry.FieldByName('FACDCTOMO').AsFloat) + ','
         + '       FACIGVMO  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACIGVMO').AsFloat) + ','
         + '       FACIGV2MO = ' + floattostr(DMFAC.cdsQry.FieldByName('FACIGV2MO').AsFloat) + ','
         + '       FACISCMO  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACISCMO').AsFloat) + ','
         + '       FACTOTMO  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACTOTMO').AsFloat) + ','
         + '       FACTOTMN  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACTOTMN').AsFloat) + ','
         + '       FACTOTME  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACTOTME').AsFloat) + ','
         + '       FACIGVMN  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACIGVMN').AsFloat) + ','
         + '       FACIGVME  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACIGVME').AsFloat) + ','
         + '       FACIGV2MN = ' + floattostr(DMFAC.cdsQry.FieldByName('FACIGV2MN').AsFloat) + ','
         + '       FACIGV2ME = ' + floattostr(DMFAC.cdsQry.FieldByName('FACIGV2ME').AsFloat) + ','
         + '       FACISCMN  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACISCMN').AsFloat) + ','
         + '       FACISCME  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACISCME').AsFloat) + ','
         + '       FACMTOMN  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACMTOMN').AsFloat) + ','
         + '       FACMTOME  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACMTOME').AsFloat) + ','
         + '       FACDCTOMN = ' + floattostr(DMFAC.cdsQry.FieldByName('FACDCTOMN').AsFloat) + ','
         + '       FACDCTOME = ' + floattostr(DMFAC.cdsQry.FieldByName('FACDCTOME').AsFloat) + ','
         + '       FACSERMO  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACSERMO').AsFloat) + ','
         + '       FACSERMN  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACSERMN').AsFloat) + ','
         + '       FACSERME  = ' + floattostr(DMFAC.cdsQry.FieldByName('FACSERME').AsFloat) + ','
         + '       PORSER    = ' + floattostr(DMFAC.cdsQry.FieldByName('PORSER').AsFloat) + ','
         + '       FACEMBMO  = ' + floattostr(0.00) + ','
         + '       FACEMBMN  = ' + floattostr(0.00) + ','
         + '       FACEMBME  = ' + floattostr(0.00);
      If (DMFAC.cdsFact2.FieldByName('CIAID').AsString = '04') And (DMFAC.cdsFact2.FieldByName('FPAGOID').AsString = '01') Then
         xsSQL := xsSQL + ', INICIAL = ' + floattostr(vINICIAL);
      xsSQL := xsSQL
         + ' where CIAID=' + Quotedstr(dblcCia.Text)
         + '   and CLIEID=' + Quotedstr(dblcdAso.Text)
         + '   and FACSERIE=' + Quotedstr(dblcSerie.Text)
         + '   and NFAC=' + Quotedstr(dbeNFac.Text);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xsSQL);
      Except
         xContinuaGrab := False;
         exit;
      End;
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('FACMTOMO').AsFloat  := DMFAC.cdsQry.FieldByName('FACMTOMO').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACDCTOMO').AsFloat := DMFAC.cdsQry.FieldByName('FACDCTOMO').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACIGVMO').AsFloat  := DMFAC.cdsQry.FieldByName('FACIGVMO').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACIGV2MO').AsFloat := DMFAC.cdsQry.FieldByName('FACIGV2MO').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACISCMO').AsFloat  := DMFAC.cdsQry.FieldByName('FACISCMO').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACTOTMO').AsFloat  := DMFAC.cdsQry.FieldByName('FACTOTMO').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACTOTMN').AsFloat  := DMFAC.cdsQry.FieldByName('FACTOTMN').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACTOTME').AsFloat  := DMFAC.cdsQry.FieldByName('FACTOTME').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACIGVMN').AsFloat  := DMFAC.cdsQry.FieldByName('FACIGVMN').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACIGVME').AsFloat  := DMFAC.cdsQry.FieldByName('FACIGVME').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACIGV2MN').AsFloat := DMFAC.cdsQry.FieldByName('FACIGV2MN').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACIGV2ME').AsFloat := DMFAC.cdsQry.FieldByName('FACIGV2ME').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACISCMN').AsFloat  := DMFAC.cdsQry.FieldByName('FACISCMN').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACISCME').AsFloat  := DMFAC.cdsQry.FieldByName('FACISCME').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACMTOMN').AsFloat  := DMFAC.cdsQry.FieldByName('FACMTOMN').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACMTOME').AsFloat  := DMFAC.cdsQry.FieldByName('FACMTOME').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACDCTOMN').AsFloat := DMFAC.cdsQry.FieldByName('FACDCTOMN').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACDCTOME').AsFloat := DMFAC.cdsQry.FieldByName('FACDCTOME').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACEMBMO').AsFloat  := 0.00;
      DMFAC.cdsFact2.FieldByName('FACEMBMN').AsFloat  := 0.00;
      DMFAC.cdsFact2.FieldByName('FACEMBME').AsFloat  := 0.00;
      DMFAC.cdsFact2.FieldByName('FACSERMO').AsFloat  := DMFAC.cdsQry.FieldByName('FACSERMO').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACSERMN').AsFloat  := DMFAC.cdsQry.FieldByName('FACSERMN').AsFloat;
      DMFAC.cdsFact2.FieldByName('FACSERME').AsFloat  := DMFAC.cdsQry.FieldByName('FACSERME').AsFloat;
      DMFAC.cdsFact2.FieldByName('PORSER').AsFloat    := xTasServ;
      DMFAC.cdsFact2.Post;
   End;
End;

Procedure TFFactSGuia.GrabaObservacion;
Var
   xSql, vItem, vDeObservacion: String;
Begin

   If sTipoRQS = 'C' Then //Articulos
   Begin
      vItem := dblcdArticulo.Text;
      vDeObservacion := memDetArt.Lines.Text
   End
   Else //Servicios
   Begin
      vItem := DMFAC.cdsDetFact2.FieldByName('DFACITEM').AsString;
      vDeObservacion := memDetServ.Lines.Text;
   End;

   wSQL := 'CIAID =' + QuotedStr(dblcCia.Text)
      + ' and DOCID =' + QuotedStr(dblcTDoc.Text)
      + ' and FACSERIE =' + QuotedStr(dblcSerie.Text)
      + ' and NFAC =' + QuotedStr(dbeNFac.Text)
      + ' and DFACITEM=' + QuotedStr(vItem);
   DMFAC.cdsDetFactObs2.Close;
   DMFAC.cdsDetFactObs2.DataRequest('SELECT * FROM FAC313 WHERE ' + wSQL);
   DMFAC.cdsDetFactObs2.Open;

   If DMFAC.cdsDetFactObs2.RecordCount = 0 Then
      xSql := 'Insert Into FAC313(CIAID,DOCID,FACSERIE,NFAC,DFACITEM,DARTOBS) ' +
         '            VALUES(''' + dblcCia.Text + ''',''' + dblcTDoc.Text + ''',''' + dblcSerie.Text + ''',''' + dbeNFac.Text + ''',''' + vITem + ''',''' + vDeObservacion + ''')'
   Else
      xSql := 'Update FAC313 Set DARTOBS=''' + vDeObservacion + ''' Where ' + wSQL;

   Try
      xContinuaGrab := True;
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSql);
   Except
      Showmessage('No se pudo grabar las Observaciones en el Detalle de Facturas');
      xContinuaGrab := False;
      exit;
   End;
   memDetArt.Clear;

End;

// Inicio FAC-201806
// 26/10/2018 retira rutina que no se usa
{
Var
   xfiltro, sArticulo, sArtDes, xUm: String;
   xPrecio, xTotDscto1, xTotDscto2, xTotImp1, xTotImp2, xImporte, xSTotal, xTotal: double;
   bContenido: boolean;
   xValor, xCtAceptada: double;
   xDscto1, xDscto2, xImp1, xImp2, xPVentaTot, xInc5, xTotInc5: double;
   xIGVSN: String;
Begin

   If xAdicArt = 'S' Then
   Begin
      ErrorMsg(Caption, 'No Puede Continuar Registrando este Artículo');
      Exit;
   End;

   If bbtnKDXSerie.Visible Then
      VerificaNumeroSerie;

   If sTipoRQS = 'C' Then
   Begin
      pnlRegistro.Width := 382;
      memDetArt.Visible := False;
   End;

   If Not ConsistenciaDet Then Exit;

   Screen.Cursor := crHourGlass;

   xCtAceptada := 0;
   xDscto1 := 0;
   xDscto2 := 0;
   xPrecio := 0;
   xImp1 := 0;
   xImp2 := 0;

   DMFAC.DCOM1.AppServer.IniciaTransaccion;

   xContinuaGrab := True;

   GrabaDetalle(DMFAC.wModo);
   If Not xContinuaGrab Then
   Begin
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      Exit;
   End;

   GrabaObservacion;
   If Not xContinuaGrab Then
   Begin
      DMFAC.DCOM1.AppServer.RetornaTransaccion;
      Exit;
   End;

   wSQL := 'CIAID =' + QuotedStr(dblcCia.Text)
      + ' AND DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + ' AND FACSERIE =' + QuotedStr(dblcSerie.Text)
      + ' AND NFAC =' + QuotedStr(dbeNFac.Text)
      + ' ORDER BY DFACITEM';
   Filtracds(DMFAC.cdsDetFact2, 'SELECT * FROM FAC306 WHERE ' + wSQL);

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

   If sTipoRQS = 'C' Then
   Begin
      CalculaFooter;
      AcumulaTotCabecera;
      If Not xContinuaGrab Then
      Begin
         Showmessage('No Actualizó cabecera con Acumulado de Totales');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
      InicializaCamposDetalle;
      edtDsto1.text := dbePorcentaje.text;
      wFlagedi := '';
      xxReservaAnt := 0;
      Screen.Cursor := crDefault;
      If pnlRegistro.Visible Then
         dblcdArticulo.SetFocus;
   End
   Else
   Begin
      If sTipoRQS = 'S' Then
      Begin
         pnlDetalle.Enabled := True;
         pnlPie.Enabled := True;
         CalculaFooter;
         AcumulaTotCabecera;
         If Not xContinuaGrab Then
         Begin
            Showmessage('No Actualizó cabecera con Acumulado de Totales');
            DMFAC.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
         InicializaCamposDetalle;
         wFlagedi := '';
         Screen.Cursor := crDefault;
         pnlDetalleA.Visible := False;
      End;
   End;

   //Graba transaccion
   DMFAC.DCOM1.AppServer.GrabaTransaccion;

End;
}
// Fin FAC-201806

Procedure TFFactSGuia.BorrarRegistro;
Var
   sSQL, cMsg, cComboE: String;
Begin
   If Length(Trim(DMFAC.cdsDetFact2.FieldByName('CODCOM').AsString)) = 0 Then
   Begin
      sSQL := 'Delete Fac306  Where CIAID=''' + dblcCia.Text + ''' and FACSERIE=''' + dblcSerie.Text + ''' And DFACITEM=''' + DMFAC.cdsDetFact2.FieldByName('DFACITEM').AsString + ''' and NFAC=''' + dbeNFac.Text + ''' and ARTID=''' + DMFAC.cdsDetFact2.FieldByName('ARTID').AsString + ''' ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         Showmessage('No se pudo borrar el Item');
         exit;
      End;
   End
   Else
   Begin
      cComboE := Trim(DMFAC.cdsDetFact2.FieldByName('CODCOM').AsString);
      sSQL := 'Delete Fac306  Where CIAID=''' + dblcCia.Text + ''' and FACSERIE=''' + dblcSerie.Text + ''' and NFAC=''' + dbeNFac.Text + ''' and CODCOM=''' + cComboE + ''' ';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
         Showmessage('No se pudo borrar el Item');
         Exit
      End;
   End;

   wSQL := 'CIAID =' + QuotedStr(dblcCia.Text)
      + ' AND DOCID =' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + ' AND FACSERIE =' + QuotedStr(dblcSerie.Text)
      + ' AND NFAC =' + QuotedStr(dbeNFac.Text)
      + ' ORDER BY DFACITEM';
   Filtracds(DMFAC.cdsDetFact2, 'SELECT * FROM FAC306 WHERE ' + wSQL);

   CalculaFooter;
   AcumulaTotCabecera;
   wInserta := False;
   dbgDetFac.Refresh;
   dbgDetFac.SetFocus;
End;

Function TFFactSGuia.SiExisteDetalle: boolean;
Var
   reultado: boolean;
   xSql: String;
Begin
   xSql := ' Select * From Fac306 '
      + ' where CIAID=' + quotedstr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
      + '   and FACSERIE=' + quotedstr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
      + '   and NFAC=' + quotedstr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
   DMFAC.cdsQry1.Close;
   DMFAC.cdsQry1.DataRequest(xSql);
   DMFAC.cdsQry1.Open;
   If DMFAC.cdsQry1.RecordCount = 0 Then
      reultado := True
   Else
      reultado := False;

   Result := reultado;
End;

Procedure TFFactSGuia.ActualizaSaldos(xxArticulo, xxalmid, xxCant, xxNumDoc, xxFecha, xxTipTran, xxcosto: String);
Var
   Y, M, D: word;
   xSQL, xAno, xCantS: String;
   xCantF: Double;
   xAnoMes, xCampoMes, xMes: String;
   xError: Boolean;
Begin

   xAdicArt := 'N';
   DecodeDate(dtpFFac.date, Y, M, D);
   xAno := IntToStr(Y);
   xMes := DMFAC.Strzero(inttostr(M), 2);
   xAnoMes := xAno + xMes;

   DMFAC.cdsDetFact2.First;
   If Not (DMFAC.cdsDetFact2.Locate('CIAID;FACSERIE;NFAC;ARTID',
      VarArrayOf([FFactSGuia.dblcCia.Text, FFormaPago.dblcSerieConf.Text, FFormaPago.dbeNFacConf.Text, xxArticulo]),
      [loCaseInsensitive])) Then
   Begin
      ShowMessage('Error en el Detalle del Documento verifique..');
      xContinuaGrab := False;
      exit;
   End;

   xFiltro := 'Select STKFIN STKSACTG '
      + '        from LOG319 '
      + '       where CIAID =' + QuotedStr(dblcCia.Text)
      + '         and ALMID =' + QuotedStr(xxalmid)
      + '         and LOGANOMM = ' + Quotedstr(xAnoMes)
      + '         and ARTID = ' + Quotedstr(xxArticulo);
   DMFAC.cdsQry4.Close;
   DMFAC.cdsQry4.DataRequest(xFiltro);
   DMFAC.cdsQry4.Open;
   xError := False;
   If DMFAC.cdsQry4.RecordCount = 0 Then
   Begin
      ShowMessage('No se ha encontrado al Artículo ' + xxArticulo + ' en la Tabla de Stocks');
      xError := True;
   End
   Else
   Begin
      If DMFAC.cdsQry4.FieldByName('STKSACTG').AsFloat < 0 Then
      Begin
         ShowMessage('El Stock del Artículo ' + xxArticulo + ' es Negativo');
         xError := True;
      End
      Else
      Begin
         If DMFAC.cdsQry4.FieldByName('STKSACTG').AsFloat < strtofloat(xxCant) Then
         Begin
            ShowMessage('No hay suficiente Stock del artículo ' + xxArticulo + ' para atender el documento de Venta');
            xError := True;
         End;
      End;
   End;

   If xError Then
   Begin
      DMFAC.cdsDetFact2.Edit;
      DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString := 'N';
      DMFAC.cdsDetFact2.Post;
      xSQL := 'Update FAC306 '
         + '      Set DFACTFLAG=''N'' '
         + '    Where CIAID=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
         + '      and FACSERIE=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('FACSERIE').AsString)
         + '      and NFAC=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('NFAC').AsString)
         + '      and ARTID=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar el detalle indicando que no tiene Stock');
      End;
      xContinuaGrab := False;
      exit;
   End;

// Inicio FAC-201806
// 26/10/2018 cambia display de importes a 2 dígitos
   {
   TNumericField(DMFAC.cdsQry4.FieldByName('STKSACTG')).DisplayFormat := '###,##0.0000';
   }
   TNumericField(DMFAC.cdsQry4.FieldByName('STKSACTG')).DisplayFormat := '###,##0.00';
// Fin FAC-201806

   xAdicArt := 'N';

// TGE205 - Maestro de Artículos
   xSQL := 'Update TGE205 '
      + '   Set ARTCNTG = nvl(ARTCNTG,0)-' + xxCant + ', '
      + '       ARTMNTG = (nvl(ARTCNTG,0)-' + xxCant + ')*ARTCPROG, '
      + '       CCUSER = ' + quotedstr(DMFAC.wUsuario) + ','
      + '       ARTFUMV = sysdate '
      + ' Where CIAID   = ' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
      + '   and ARTID   = ' + quotedstr(xxArticulo);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo actualizar el Maestro de Artículos del artículo ' + xxArticulo);
      xContinuaGrab := False;
      exit;
   End;

// LOG319
   xSQL := 'Update LOG319 '
      + '   Set CANTOTSAL=NVL(CANTOTSAL,0)+' + xxCant + ','
      + '       STKFIN=' + floattostr(DMFAC.cdsQry4.FieldByName('STKSACTG').AsFloat - strtofloat(xxCant))
      + ' Where CIAID  = ' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
      + '   and LOGANOMM = ' + quotedstr(xAnoMes)
      + '   and ALMID  = ' + quotedStr(xxalmid)
      + '   and ARTID  = ' + quotedstr(xxArticulo);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo actualizar el archivo de Saldos por Almacén y Mes del artículo ' + xxArticulo);
      xContinuaGrab := False;
      exit;
   End;

// LOG337
   xSQL := 'Update LOG337 '
      + '   Set CANTOTSAL = nvl(CANTOTSAL,0)+' + xxCant + ','
      + '       MONTOTSAL = (nvl(CANTOTSAL,0)+' + xxCant + ')*PREPROMFIN, '
      + '       USUARIO     = ' + quotedstr(DMFAC.wUsuario) + ','
      + '       FREG        = sysdate, '
      + '       STKFIN      = STKFIN-' + xxCant + ','
      + '       VALTOTFIN   = (STKFIN-' + xxCant + ')*PREPROMFIN '
      + ' Where CIAID  = ' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
      + '   and LOGANOMM = ' + quotedstr(xAnoMes)
      + '   and ARTID  = ' + quotedstr(xxArticulo);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo actualizar el archivo de Saldos por Mes del artículo ' + xxArticulo);
      xContinuaGrab := False;
      exit;
   End;

   DMFAC.cdsDetFact2.Edit;
   DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString := 'S';
   DMFAC.cdsDetFact2.Post;

   xSQL := 'Update FAC306 '
      + '      Set DFACTFLAG=''S'' '
      + '    Where CIAID=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
      + '      and FACSERIE=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('FACSERIE').AsString)
      + '      and NFAC=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('NFAC').AsString)
      + '      and ARTID=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('No se pudo actualizar el detalle indicando la actualización correcta del Stock');
      xContinuaGrab := False;
      exit;
   End;
End;

Procedure TFFactSGuia.ActualizaSaldos1;
Var
   xSql, xNumFac: String;
Begin
// cambio en ACEPTACIÓN  de Nota(s) de Salida
   xSQL := 'Select ALMID '
      + '     from FAC306 A '
      + '    where A.CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
      + '      and A.DOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
      + '      and A.FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
      + '      and A.NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString)
      + '    group by ALMID';
   DMFAC.cdsAlmVar.Close;
   DMFAC.cdsAlmVar.DataRequest(xSQL);
   DMFAC.cdsAlmVar.Open;

   If DMFAC.cdsAlmVar.recordcount=0 Then
   Begin
      xContinuaGrab := False;
      xMsgError := 'No se encontró Almacén(es) en el Detalle de la Factura';
      Exit;
   End;

   xNumFac := DMFAC.cdsFact2.FieldByName('DOCID').AsString
            + DMFAC.cdsFact2.FieldByName('FACSERIE').AsString
            + DMFAC.cdsFact2.FieldByName('NFAC').AsString;

   DMFAC.cdsAlmVar.First;
   While Not DMFAC.cdsAlmVar.Eof Do
   Begin
      xSQL := 'Begin DB2ADMIN.SP_ALM_ACEPTA_NOTA_IS('
         + quotedstr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)+','
         + quotedstr(DMFAC.cdsAlmVar.FieldByName('ALMID').AsString)+','
         + quotedstr('SALIDA')+','
         + quotedstr(xNumFac)+'); End;';
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);

      xSQL := 'Select NISSIT from DB2ADMIN.LOG315 '
         + '    where CIAID='+ quotedstr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
         + '      and ALMID='+ quotedstr(DMFAC.cdsAlmVar.FieldByName('ALMID').AsString)
         + '      and NISATIP='+ quotedstr('SALIDA')
         + '      and NISAID='+ quotedstr(xNumFac);
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      If DMFAC.cdsQry.FieldByName('NISSIT').AsString<>'ACEPTADO' Then
      Begin
         xContinuaGrab := False;
         ShowMessage('No se pudo ACEPTAR la Nota de Salida');
         Exit;
      End;
      DMFAC.cdsAlmVar.Next;
   End;
End;

Procedure TFFactSGuia.bbtnRecalSldClick(Sender: TObject);
Var
   xSQL: String;
Begin
End;

// Inicio FAC-201806
// 16/10/2018 retira rutina que no se usa
(*
Procedure TFFactSGuia.GrabaDetalleFac;
Var
   xSQL: String;
Begin
   xSQL := 'Select ARTID '
      + '     from FAC306 '
      + '    where CIAID=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
      + '      and DOCID =' + quotedStr(DMFAC.cdsDetFact2.FieldByName('DOCID').AsString)
      + '      and FACSERIE =' + quotedStr(DMFAC.cdsDetFact2.FieldByName('FACSERIE').AsString)
      + '      and NFAC =' + quotedStr(DMFAC.cdsDetFact2.FieldByName('NFAC').AsString)
      + '      and ARTID=' + quotedStr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount > 0 Then
      wInserta := False
   Else
      wInserta := True;

   If wInserta Then
   Begin
      xSQL := 'Insert into '
         + '      FAC306(ALMID, ARTDES, ARTID, CIAID, CLAUXID, CLIECREMAX, CLIEID, '
         + '             CLIERUC, CODCOM, DFACANOMES, DFACCANTAT, DFACCANTG, DFACCOMLMO,'
         + '             DFACCONT, DFACDCTO, DFACDCTO2, DFACDTOME2, DFACDTOMN2, DFACDTOMO2, '
         + '             DFACDTOUME, DFACDTOUMN, DFACDTOUMO, DFACESTADO, DFACGARAN, DFACIGV, '
         + '             DFACIMP1, DFACIMP2, DFACIMPMTE1, DFACIMPMTE2, DFACIMPMTN1, DFACIMPMTN2, '
         + '             DFACIMPMTO1, DFACIMPMTO2, DFACISC, DFACITEM, DFACMTOME, DFACMTOMN, '
         + '             DFACMTOMO, DFACPREUME, DFACPREUMN, DFACPREUMO, DFACPREVMO, DFACTCAM, '
         + '             DFACTFLAG, DFACUSER, DFACVTOTME, DFACVTOTMN, DFACVTOTMO, DOCID, '
         + '             FACFECHA, FACSERIE, FACTCLI, FACTIP, FAMID, FPAGOID, GRARID, '
         + '             LOCID, NFAC, SFAMID, TINID, TIPOADQ, TLISTAID, TMONID, UNMABR, '
         + '             UNMIDG, UNMIDO, UNMIDU, VEID,DFACSERMO, DFACSERMN, DFACSERME, '
         + '             PORSER, DFACFREG, DFACHREG, DFACHOR) '
         + '   values('
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('ALMID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTDES').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('CLAUXID').AsString) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('CLIECREMAX').AsFloat) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('CLIEID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('CLIERUC').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('CODCOM').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACANOMES').AsString) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACCANTG').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACCOMLMO').AsFloat) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACCONT').AsString) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDCTO').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDCTO2').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACESTADO').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACGARAN').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACIGV').AsString) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMP1').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMP2').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACISC').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACITEM').AsString) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACUSER').AsString) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('DOCID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('FACFECHA').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('FACSERIE').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('FACTCLI').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('FACTIP').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('FAMID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('FPAGOID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('GRARID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('LOCID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('NFAC').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('SFAMID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('TINID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('TIPOADQ').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('TLISTAID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('TMONID').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('UNMABR').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('UNMIDG').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('UNMIDO').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('UNMIDU').AsString) + ','
         + quotedstr(DMFAC.cdsDetFact2.FieldByName('VEID').AsString) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACSERMO').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACSERMN').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACSERME').AsFloat) + ','
         + FloatToStr(DMFAC.cdsDetFact2.FieldByName('PORSER').AsFloat) + ','
         + 'Trunc(sysdate),sysdate,sysdate)';
   End
   Else
   Begin
      xSQL := 'Update FAC306 '
         + '      set ALMID      =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('ALMID').AsString) + ','
         + '          ARTDES     =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTDES').AsString) + ','
         + '          ARTID      =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString) + ','
         + '          CLAUXID    =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CLAUXID').AsString) + ','
         + '          CLIECREMAX =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('CLIECREMAX').AsFloat) + ','
         + '          CLIEID     =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CLIEID').AsString) + ','
         + '          CLIERUC    =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CLIERUC').AsString) + ','
         + '          CODCOM     =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CODCOM').AsString) + ','
         + '          DFACANOMES =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACANOMES').AsString) + ','
         + '          DFACCANTAT =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACCANTAT').AsFloat) + ','
         + '          DFACCANTG  =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACCANTG').AsFloat) + ','
         + '          DFACCOMLMO =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACCOMLMO').AsFloat) + ','
         + '          DFACCONT   =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACCONT').AsString) + ','
         + '          DFACDCTO   =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDCTO').AsFloat) + ','
         + '          DFACDCTO2  =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDCTO2').AsFloat) + ','
         + '          DFACDTOME2 =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDTOME2').AsFloat) + ','
         + '          DFACDTOMN2 =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDTOMN2').AsFloat) + ','
         + '          DFACDTOMO2 =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat) + ','
         + '          DFACDTOUME =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDTOUME').AsFloat) + ','
         + '          DFACDTOUMN =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMN').AsFloat) + ','
         + '          DFACDTOUMO =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat) + ','
         + '          DFACESTADO =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACESTADO').AsString) + ','
         + '          DFACGARAN  =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACGARAN').AsString) + ','
         + '          DFACIGV    =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACIGV').AsString) + ','
         + '          DFACIMP1   =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMP1').AsFloat) + ','
         + '          DFACIMP2   =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMP2').AsFloat) + ','
         + '          DFACIMPMTE1=' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE1').AsFloat) + ','
         + '          DFACIMPMTE2=' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTE2').AsFloat) + ','
         + '          DFACIMPMTN1=' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN1').AsFloat) + ','
         + '          DFACIMPMTN2=' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTN2').AsFloat) + ','
         + '          DFACIMPMTO1=' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO1').AsFloat) + ','
         + '          DFACIMPMTO2=' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACIMPMTO2').AsFloat) + ','
         + '          DFACISC    =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACISC').AsString) + ','
         + '          DFACMTOME  =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACMTOME').AsFloat) + ','
         + '          DFACMTOMN  =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACMTOMN').AsFloat) + ','
         + '          DFACMTOMO  =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat) + ','
         + '          DFACPREUME =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACPREUME').AsFloat) + ','
         + '          DFACPREUMN =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACPREUMN').AsFloat) + ','
         + '          DFACPREUMO =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat) + ','
         + '          DFACPREVMO =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat) + ','
         + '          DFACTCAM   =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACTCAM').AsFloat) + ','
         + '          DFACTFLAG  =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACTFLAG').AsString) + ','
         + '          DFACUSER   =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('DFACUSER').AsString) + ','
         + '          DFACVTOTME =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACVTOTME').AsFloat) + ','
         + '          DFACVTOTMN =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMN').AsFloat) + ','
         + '          DFACVTOTMO =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACVTOTMO').AsFloat) + ','
         + '          DOCID      =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('DOCID').AsString) + ','
         + '          FACFECHA   =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('FACFECHA').AsString) + ','
         + '          FACTCLI    =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('FACTCLI').AsString) + ','
         + '          FACTIP     =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('FACTIP').AsString) + ','
         + '          FAMID      =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('FAMID').AsString) + ','
         + '          FPAGOID    =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('FPAGOID').AsString) + ','
         + '          GRARID     =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('GRARID').AsString) + ','
         + '          LOCID      =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('LOCID').AsString) + ','
         + '          SFAMID     =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('SFAMID').AsString) + ','
         + '          TINID      =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('TINID').AsString) + ','
         + '          TIPOADQ    =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('TIPOADQ').AsString) + ','
         + '          TLISTAID   =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('TLISTAID').AsString) + ','
         + '          TMONID     =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('TMONID').AsString) + ','
         + '          UNMABR     =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('UNMABR').AsString) + ','
         + '          UNMIDG     =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('UNMIDG').AsString) + ','
         + '          UNMIDO     =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('UNMIDO').AsString) + ','
         + '          UNMIDU     =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('UNMIDU').AsString) + ','
         + '          VEID       =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('VEID').AsString) + ','
         + '          DFACSERMO  =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACSERMO').AsFloat) + ','
         + '          DFACSERMN  =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACSERMN').AsFloat) + ','
         + '          DFACSERME  =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('DFACSERME').AsFloat) + ','
         + '          PORSER     =' + FloatToStr(DMFAC.cdsDetFact2.FieldByName('PORSER').AsFloat)
         + '    Where CIAID=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
         + '      and FACSERIE=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('FACSERIE').AsString)
         + '      and NFAC=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('NFAC').AsString)
         + '      and ARTID=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
   End;

   Try
      xContinuaGrab := True;
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSql);
      wInserta := False;
   Except
      Showmessage('No se pudo grabar el Detalle de la Facturación');
      xContinuaGrab := False;
      exit;
   End;
End;
*)
// Fin FAC-201806

Procedure TFFactSGuia.GeneraTxtFactElec0;
Var
// Variables para Cabecera
   wsA_Cod_Empr: String; // varchar2(30);  Código de empresa asignado en Suite Electrónica
   wsA_TipDTE: String; // varchar2(30);  Tipo de documento (Factura, Boleta, NC, ND, GR, CR, CP)
   wsA_Serie: String; // varchar2(4);   Serie
   wsA_Correlativo: String; // varchar2(8);   Número Correlativo (Nro de Documento)
   wsA_FchEmis: String; // varchar2(10);  Fecha de Emisión
   wsA_TipoMoneda: String; // varchar2(3);   Tipo de moneda del documento

// Variables para Datos del Emisor (Derrama Magisterial)
   wsA_RUCEmis: String; // numeric(11,0); Número de RUC o documento de identificación
   wsA_TipoRUCEmis: String; // varchar2(1);   Tipo Documento de identificacion del Emisor
   wsA_NomComer: String; // varchar2(100); Nombre Comercial
   wsA_RznSocEmis: String; // varchar2(100); Apellidos y Nombres o Denominación o Razón Social
   wsA_ComuEmis: String; // varchar2(6);   Código de Ubicación Geográfica (UBIGEO)
   wsA_DirEmis: String; // varchar2(100); Direccion completa y detallada
   wsA_UrbanizaEmis: String; // varchar2(25);  Urbanización
   wsA_ProviEmis: String; // varchar2(30);  Provincia
   wsA_DeparEmis: String; // varchar2(30);  Departamento
   wsA_DistriEmis: String; // varchar2(30);  Distrito
   wsA_PaisEmis: String; // varchar2(2);   Codigo de País

// Variables para Datos del Receptor (Cliente de Ventas)
   wsA_TipoRUCReceptor: integer; // numeric(1,0);  Tipo de documento de identidad del adquirente o usuario
   wsA_RUCRecep: String; // varchar2(15);  Número de documento de identidad del adquirente o usuario
   wsA_RznSocRecep: String; // varchar2(100); Apellidos y nombres o denominación o razón social del adquirente o usuario
   wsA_DirRecepUbigeo: String; // varchar2(6);   Código de Ubigeo
   wsA_DirRecep: String; // varchar2(200); Dirección completa y detallada
   wsA_DirRecepUrbaniza: String; // varchar2(25);  Urbanización
   wsA_DirRecepProvincia: String; // varchar2(30);  Provincia
   wsA_DirRecepDepartamento: String; // varchar2(30);  Departamento
   wsA_DirRecepDistrito: String; // varchar2(30);  Distrito
   wsA_DirRecepCodPais: String; // varchar2(2);   Código de País

// Variables para Totales
   wsA_MntNeto: Currency; // numeric(12,2);  Total de valor de venta neto - operaciones gravadas
   wsA_MntExe: Currency; // numeric(12,2);  Total de valor de venta neto - operaciones no gravadas
   wsA_MntExo: Currency; // numeric(12,2);  Total de valor de venta neto - operaciones exoneradas
   wsA_MntTotGrat: Currency; // numeric(12,2);  Total Valor de Venta de Operaciones gratuitas
   wsA_MntTotBoni: Currency; // numeric(12,2);  Monto Total de la Bonificación
   wsA_MntTotAnticipo: Currency; // numeric(12,2);  Monto Total de Anticipos
   wsA_MntTotal: Currency; // numeric(12,2);  Importe total de la venta, de la cesión en uso o del servicio prestado

// Variables para Impuestos Globales
   wsCodigoImpuesto: String; // varchar2(4);    Código de Impuesto
   wsMontoImpuesto: Currency; // numeric(12,2);  Monto Impuesto
   wsTasaImpuesto: Currency; // numeric(3,2);   Tasa de Impuesto

// Variables para Detalle de Artículos del documento de Venta
   wsB_NroLinDet: Array[1..20] Of Integer; // numeric(3);      Número de orden del Ítem
   wsB_QtyItem: Array[1..20] Of Currency; // numeric(12,2);   Cantidad de unidades vendidas por ítem (Q)
   wsB_UnmdItem: Array[1..20] Of String; // varchar2(3);     Unidad de medida de los bienes vendidos por ítem
   wsB_VlrCodigo: Array[1..20] Of String; // varchar2(30);    Código del producto
   wsB_NmbItem: Array[1..20] Of String; // varchar2(250);   Descripción detallada del bien vendido o cedido en uso, descripción o tipo de servicio prestado por ítem
   wsB_PrcItem: Array[1..20] Of Currency; // numeric(12,2);   Precio de venta unitario por item (incluyendo IGV) o para el caso: Valor referencial unitario por ítem en operaciones no onerosas
   wsB_PrcItemSinIgv: Array[1..20] Of Currency; // numeric(12,2);   Valor de venta unitario por ítem (sin considerar IGV)
   wsB_MontoItem: Array[1..20] Of Currency; // numeric(12,2);   Valor de venta por ítem (sin considerar IGV)
   wsB_DescuentoMonto: Array[1..20] Of Currency; // numeric(12,2);   Descuentos aplicados al ítem
   wsB_IndExe: Array[1..20] Of String; // varchar2(2);     Afectación al IGV por ítem
   wsB_CodigoTipoIgv: Array[1..20] Of Integer; // numeric(4);      Codigo IGV (1000)
   wsB_TasaIgv: Array[1..20] Of Currency; // numeric(12,2);   Tasa de IGV por ítem
   wsB_ImpuestoIgv: Array[1..20] Of Currency; // numeric(3,2);    IGV del ítem
   wsB_CodigoIsc: Array[1..20] Of Integer; // numeric(4);      Codigo ISC (2000)
   wsB_CodigoTipoIsc: Array[1..20] Of String; // varchar2(2);     Sistema de ISC por ítem
   wsB_MontoIsc: Array[1..20] Of Currency; // numeric(12,2);   ISC del ítem
   wsB_TasaIsc: Array[1..20] Of Currency; // numeric(12,2);   Tasa ISC del ítem

   xSQL: String;
   xNumArr: Integer;
   xfArchivoTexto: TextFile;
   xsNombreTxt, xCarpeta: String;
   wAno, wMes, wDia: Word;

Begin
   xSQL := 'Select TDOC_SUNAT '
      + ' From TGE110 '
      + 'Where DOCID = ' + quotedstr(dblcTdoc.Text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   wsA_TipDTE := DMFAC.cdsQry.FieldByName('TDOC_SUNAT').AsString;

   xCarpeta := 'Y:\Pases a Produccion\Facturación Electrónica\';
   xsNombreTxt := xCarpeta + 'FE_' + wsA_TipDTE + '_' + dblcSerie.Text + '_' + dbeNFac.Text + '.txt';

   AssignFile(xfArchivoTexto, xsNombreTxt);
   Rewrite(xfArchivoTexto);

// Extracción de datos

//////////////////////////////////////////////////////
// Encabezado
//////////////////////////////////////////////////////

// Código de empresa asignado en Suite Electrónica
   wsA_Cod_Empr := 'A;CODI_EMPR;;' + '1';
   WriteLn(xfArchivoTexto, wsA_Cod_Empr);

// Tipo de Documento (Factura, Boleta, NC, ND, GR, CR, CP)
   wsA_TipDTE := 'A;TipoDTE;;' + DMFAC.cdsQry.FieldByName('TDOC_SUNAT').AsString;
   WriteLn(xfArchivoTexto, wsA_TipDTE);

// Serie
   If (copy(dblcSerie.Text, 1, 1) = 'B') Or (copy(dblcSerie.Text, 1, 1) = 'F') Then
      wsA_Serie := 'A;Serie;;' + dblcSerie.Text
   Else
   Begin
      xSQL := 'Select FLAGV '
         + '  from FAC103 '
         + ' Where CIAID=' + quotedstr(dblcCia.Text)
         + '   and DOCID=' + quotedstr(dblcTdoc.Text)
         + '   and SERIEID=' + quotedstr(dblcSerie.Text);
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      wsA_Serie := 'A;Serie;;' + DMFAC.cdsQry.FieldByName('FLAGV').AsString + copy(dblcSerie.Text, length(dblcSerie.Text) - 2, 3);
   End;
   WriteLn(xfArchivoTexto, wsA_Serie);

// Número Correlativo (Nro de Documento)
   wsA_Correlativo := 'A;Correlativo;;' + dbeNFac.Text;
   WriteLn(xfArchivoTexto, wsA_Correlativo);

// Fecha de Emisión
   decodedate(dtpFFac.Date, wAno, wMes, wDia);
   wsA_FchEmis := 'A;FchEmis;;' + inttostr(wAno) + '-' + DMFAC.StrZero(inttostr(wMes), 2) + '-' + DMFAC.StrZero(inttostr(wDia), 2);
   WriteLn(xfArchivoTexto, wsA_FchEmis);

// Tipo de moneda del documento
   xSQL := 'Select ISOCODEALF from TGE103 where TMONID=' + quotedstr(dblcTMon.Text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;

   wsA_TipoMoneda := 'A;TipoMoneda;;' + DMFAC.cdsQry.FieldByName('ISOCODEALF').AsString;
   WriteLn(xfArchivoTexto, wsA_TipoMoneda);

//////////////////////////////////////////////////////
// Datos del Emisor (Derrama Magisterial)
//////////////////////////////////////////////////////

   xSQL := 'Select CIAS.CIARUC, CIAS.CIADES, CIAS.CIADIRE, '
      + '       PROVINCIAS.UBIGEODES DIREMISPROVINCIA, '
      + '       DPTOS.UBIGEODES DIREMISDEPARTAMENTO, '
      + '       DISTRITOS.UBIGEODES DIREMISDISTRITO, '
      + '       PAISES.ISO_3166_ALFA_2 DIREMISCODPAIS, '
      + '       CIAS.UBIGEOID '
      + '  From TGE101 CIAS, '
      + '       TGE147 DPTOS,  TGE147 PROVINCIAS, DB2ADMIN.TGE147 DISTRITOS, DB2ADMIN.TGE118 PAISES '
      + ' Where CIAS.CNTCONSOL=''S'' '
      + '   and substr(DPTOS.UBIGEOID(+),1,2)=substr(CIAS.UBIGEOID,1,2) and substr(DPTOS.UBIGEOID,3,4)=''0000''  '
      + '   and substr(PROVINCIAS.UBIGEOID(+),1,4)=substr(CIAS.UBIGEOID,1,4) and substr(PROVINCIAS.UBIGEOID(+),5,2)=''00''  '
      + '   and DISTRITOS.UBIGEOID(+)=CIAS.UBIGEOID '
      + '   and PAISES.PAISID(+)=''01'' ';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;

// numeric(11,0); Número de RUC o documento de identificación
   wsA_RUCEmis := 'A;RUTEmis;;' + DMFAC.cdsQry.FieldByName('CIARUC').AsString;
   WriteLn(xfArchivoTexto, wsA_RUCEmis);

// varchar2(1);   Tipo Documento de identificacion del Emisor
   wsA_TipoRUCEmis := 'A;TipoRucEmis;;' + '6';
   WriteLn(xfArchivoTexto, wsA_TipoRUCEmis);

// varchar2(100); Nombre Comercial
   wsA_NomComer := 'A;NomComer;;' + DMFAC.cdsQry.FieldByName('CIADES').AsString;
   WriteLn(xfArchivoTexto, wsA_NomComer);

// varchar2(100); Apellidos y Nombres o Denominación o Razón Social
   wsA_RznSocEmis := 'A;RznSocEmis;;' + DMFAC.cdsQry.FieldByName('CIADES').AsString;
   WriteLn(xfArchivoTexto, wsA_RznSocEmis);

// varchar2(6);   Código de Ubicación Geográfica (UBIGEO)
   wsA_ComuEmis := 'A;ComuEmis;;' + DMFAC.cdsQry.FieldByName('UBIGEOID').AsString;
   WriteLn(xfArchivoTexto, wsA_ComuEmis);

// varchar2(100); Direccion completa y detallada
   wsA_DirEmis := 'A;DirEmis;;' + DMFAC.cdsQry.FieldByName('CIADIRE').AsString;
   WriteLn(xfArchivoTexto, wsA_DirEmis);

// varchar2(25);  Urbanización
   wsA_UrbanizaEmis := 'A;UrbanizaEmis;;' + '';
   WriteLn(xfArchivoTexto, wsA_UrbanizaEmis);

// varchar2(30);  Provincia
   wsA_ProviEmis := 'A;ProviEmis;;' + DMFAC.cdsQry.FieldByName('DIREMISPROVINCIA').AsString;
   WriteLn(xfArchivoTexto, wsA_ProviEmis);

// varchar2(30);  Departamento
   wsA_DeparEmis := 'A;DeparEmis;;' + DMFAC.cdsQry.FieldByName('DIREMISDEPARTAMENTO').AsString;
   WriteLn(xfArchivoTexto, wsA_DeparEmis);

// varchar2(30);  Distrito
   wsA_DistriEmis := 'A;DistriEmis;;' + DMFAC.cdsQry.FieldByName('DIREMISDISTRITO').AsString;
   WriteLn(xfArchivoTexto, wsA_DistriEmis);

// varchar2(2);   Codigo de País
   wsA_PaisEmis := 'A;PaisEmis;;' + DMFAC.cdsQry.FieldByName('DIREMISCODPAIS').AsString;
   WriteLn(xfArchivoTexto, wsA_PaisEmis);

//////////////////////////////////////////////////////
// Datos del Receptor (Cliente de Ventas)
//////////////////////////////////////////////////////
   If length(trim(xClauxId)) = 0 Then
   Begin
      xSQL := 'TCLIEID =' + '''' + dblcTClie.Text + '''';
      xClauxId := DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'CLAUXID,TCLIEDES,TCLIEFLAG', xSQL, 'CLAUXID');
   End;

   xSQL := 'Select nvl(substr(TIPOPERSONA.TDOC_SUNAT,1),MAESTRO.TDOC_ID_SUNAT) TIPORUCRECEPTOR, '
      + '       nvl(MAESTRO.CLIERUC, MAESTRO.CLIEDNI) RUCRECEP, '
      + '       MAESTRO.CLIEDES RZNSOCRECEP, '
      + '       MAESTRO.CLIECZIP DIRRECEPUBIGEO, '
      + '       MAESTRO.CLIEDIR DIRRECEP, '
      + '       '''' DIRRECEPURBANIZA, '
      + '       PROVINCIAS.UBIGEODES DIRRECEPPROVINCIA, '
      + '       DPTOS.UBIGEODES DIRRECEPDEPARTAMENTO, '
      + '       DISTRITOS.UBIGEODES DIRRECEPDISTRITO, '
      + '       PAISES.ISO_3166_ALFA_2 DIRRECEPCODPAIS '
      + '  from DB2ADMIN.TGE204 MAESTRO,   DB2ADMIN.TGE147 DPTOS,  DB2ADMIN.TGE147 PROVINCIAS, '
      + '            DB2ADMIN.TGE147 DISTRITOS, DB2ADMIN.TGE118 PAISES, DB2ADMIN.TGE109 TIPOPERSONA '
      + '      where MAESTRO.CLAUXID=' + quotedstr(xClauxId)
      + '        and MAESTRO.CLIEID=' + quotedstr(dblcdAso.Text)
      + '        and substr(DPTOS.UBIGEOID(+),1,2)=MAESTRO.DPTOID and substr(DPTOS.UBIGEOID,3,4)=''0000'' '
      + '        and substr(PROVINCIAS.UBIGEOID(+),1,4)=MAESTRO.CIUDID and substr(PROVINCIAS.UBIGEOID(+),5,2)=''00'' '
      + '        and DISTRITOS.UBIGEOID(+)=MAESTRO.CLIECZIP '
      + '        and PAISES.PAISID(+)=MAESTRO.PAISID '
      + '        and TIPOPERSONA.TIPPERID(+)=MAESTRO.TIPPERID';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;

// Tipo de documento de identidad del adquirente o usuario
   wsA_TipoRUCReceptor := strtoint(DMFAC.cdsQry.FieldByName('TIPORUCRECEPTOR').AsString);
   WriteLn(xfArchivoTexto, 'A;TipoRutReceptor;;' + inttostr(wsA_TipoRUCReceptor));

// Número de documento de identidad del adquirente o usuario
   wsA_RUCRecep := 'A;RUTRecep;;' + DMFAC.cdsQry.FieldByName('RUCRECEP').AsString;
   WriteLn(xfArchivoTexto, wsA_RUCRecep);

// Apellidos y nombres o denominación o razón social del adquirente o usuario
   wsA_RznSocRecep := 'A;RznSocRecep;;' + DMFAC.cdsQry.FieldByName('RZNSOCRECEP').AsString;
   WriteLn(xfArchivoTexto, wsA_RznSocRecep);

// Código de UBIGEO
   wsA_DirRecepUbigeo := 'A;DirRecepUbiGeo;;' + DMFAC.cdsQry.FieldByName('DIRRECEPUBIGEO').AsString;
   WriteLn(xfArchivoTexto, wsA_DirRecepUbigeo);

// Dirección completa y detallada de la Factura
   If length(edtDireccion.Text) > 1 Then
      wsA_DirRecep := edtDireccion.Text
   Else
      wsA_DirRecep := DMFAC.cdsQry.FieldByName('DIRRECEP').AsString;
   WriteLn(xfArchivoTexto, 'A;DirRecep;;' + wsA_DirRecep);

// Urbanización
   wsA_DirRecepUrbaniza := 'A;DirRecepUrbaniza;;' + '';
   WriteLn(xfArchivoTexto, wsA_DirRecepUrbaniza);

// Provincia
   wsA_DirRecepProvincia := 'A;DirRecepProvincia;;' + DMFAC.cdsQry.FieldByName('DIRRECEPPROVINCIA').AsString;
   WriteLn(xfArchivoTexto, wsA_DirRecepProvincia);

// Departamento
   wsA_DirRecepDepartamento := 'A;DirRecepDepartamento;;' + DMFAC.cdsQry.FieldByName('DIRRECEPDEPARTAMENTO').AsString;
   WriteLn(xfArchivoTexto, wsA_DirRecepDepartamento);

// Distrito
   wsA_DirRecepDistrito := 'A;DirRecepDistrito;;' + DMFAC.cdsQry.FieldByName('DIRRECEPDISTRITO').AsString;
   WriteLn(xfArchivoTexto, wsA_DirRecepDistrito);

// Código de País
   wsA_DirRecepCodPais := 'A;DirRecepCodPais;;' + DMFAC.cdsQry.FieldByName('DIRRECEPCODPAIS').AsString;
   WriteLn(xfArchivoTexto, wsA_DirRecepCodPais);

//////////////////////////////////////////////////////
// Totales
//////////////////////////////////////////////////////
   xSQL := 'Select to_char(CCFEMIS, ''YYYY-MM-DD''), '
      + '          (case when TMONID =''N'' then ''PEN'' else ''USD'' end) TMONID, '
      + '          nvl(CXC.CCGRAVAD,0) CCGRAVAD, '
      + '          (nvl(CXC.CCEXPORT,0)+nvl(CXC.CCNOGRAV,0)) CCNOGRAV, '
      + '          nvl(CXC.CXC_IMP_EXO,0) CCEXONER, '
      + '          nvl(CXC.CCIGV,0) CCIGV, '
      + '          nvl(CXC.CCMTOORI,0) CCMTOORI '
      + '    From CXC301 CXC '
      + '   Where CXC.CIAID=' + quotedstr(dblcCia.Text)
      + '     and CXC.DOCID=' + quotedstr(dblcTdoc.Text)
      + '     and CXC.CCSERIE=' + quotedstr(dblcSerie.Text)
      + '     and CXC.CCNODOC=' + quotedstr(dbeNFac.Text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;

// Total de valor de Venta Neto - Operaciones Gravadas
   wsA_MntNeto := DMFAC.cdsQry.FieldByName('CCGRAVAD').AsFloat;
   WriteLn(xfArchivoTexto, 'A;MntNeto;;' + floattostr(wsA_MntNeto));

// Total de valor de venta neto - operaciones no gravadas
   wsA_MntExe := DMFAC.cdsQry.FieldByName('CCNOGRAV').AsFloat;
   WriteLn(xfArchivoTexto, 'A;MntExe;;' + floattostr(wsA_MntExe));

// Total de valor de venta neto - operaciones exoneradas
   wsA_MntExo := DMFAC.cdsQry.FieldByName('CCEXONER').AsFloat;
   WriteLn(xfArchivoTexto, 'A;MntExo;;' + floattostr(wsA_MntExo));

// Total Valor de Venta de Operaciones gratuitas
   wsA_MntTotGrat := 0.00;
   WriteLn(xfArchivoTexto, 'A;MntTotGrat;;' + floattostr(wsA_MntTotGrat));

// Monto Total de la Bonificación
   wsA_MntTotBoni := 0.00;
   WriteLn(xfArchivoTexto, 'A;MntTotBoni;;' + floattostr(wsA_MntTotBoni));

// Monto Total de Anticipos
   wsA_MntTotAnticipo := 0.00;
   WriteLn(xfArchivoTexto, 'A;MntTotAnticipo;;' + floattostr(wsA_MntTotAnticipo));

// Importe total de la venta, de la cesión en uso o del servicio prestado
   wsA_MntTotal := DMFAC.cdsQry.FieldByName('CCMTOORI').AsFloat;
   WriteLn(xfArchivoTexto, 'A;MntTotal;;' + floattostr(wsA_MntTotal));

//////////////////////////////////////////////////////
// Impuestos Globales
//////////////////////////////////////////////////////
// Monto Impuesto
   wsMontoImpuesto := DMFAC.cdsQry.FieldByName('CCIGV').Asfloat;

// Abre Tasa de Impuesto
   xSQL := 'Select TASACAN, COD_IMP_SUNAT from TGE108 where TASAFLG=''I'' ';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;

// Código de Impuesto
   wsCodigoImpuesto := DMFAC.cdsQry.FieldByName('COD_IMP_SUNAT').AsString;
   WriteLn(xfArchivoTexto, 'A2;CodigoImpuesto;;' + wsCodigoImpuesto);

// Monto Impuesto
   WriteLn(xfArchivoTexto, 'A2;MontoImpuesto;;' + floattostr(wsMontoImpuesto));

// Tasa de Impuesto
   wsTasaImpuesto := DMFAC.cdsQry.FieldByName('TASACAN').AsFloat;
   WriteLn(xfArchivoTexto, 'A2;TasaImpuesto;;' + floattostr(wsTasaImpuesto));

//////////////////////////////////////////////////////
// Detalle de Artículos del documento de Venta
//////////////////////////////////////////////////////
   xNumArr := 1;
   DMFAC.cdsDetFact2.First;
   While Not DMFAC.cdsDetFact2.EOF Do
   Begin
   // Número de orden del Ítem
      wsB_NroLinDet[xNumArr] := strtoint(DMFAC.cdsDetFact2.FieldByName('DFACITEM').AsString);
      WriteLn(xfArchivoTexto, 'B;NroLinDet;;' + inttostr(wsB_NroLinDet[xNumArr]));

   // Cantidad de unidades vendidas por ítem (Q)
      wsB_QtyItem[xNumArr] := DMFAC.cdsDetFact2.FieldByName('DFACCANTG').AsFloat;
      WriteLn(xfArchivoTexto, 'B;QtyItem;;' + floattostr(wsB_QtyItem[xNumArr]));

   // Unidad de medida de los bienes vendidos por ítem
      wsB_UnmdItem[xNumArr] := 'B;UnmdItem;;' + 'NIU';
      WriteLn(xfArchivoTexto, wsB_UnmdItem[xNumArr]);

   // Código del producto
      wsB_VlrCodigo[xNumArr] := 'B;VlrCodigo;;'
         + DMFAC.cdsDetFact2.FieldByName('CIAID').AsString
         + DMFAC.cdsDetFact2.FieldByName('ARTID').AsString;
      WriteLn(xfArchivoTexto, wsB_VlrCodigo[xNumArr]);

   // Descripción detallada del bien vendido o cedido en uso, descripción o tipo de servicio prestado por ítem
      wsB_NmbItem[xNumArr] := 'B;NmbItem;;' + DMFAC.cdsDetFact2.FieldByName('ARTDES').AsString;
      WriteLn(xfArchivoTexto, wsB_NmbItem[xNumArr]);

   // Precio de venta unitario por item (incluyendo IGV) o para el caso: Valor referencial unitario por ítem en operaciones no onerosas
      wsB_PrcItem[xNumArr] := FRound(DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat *
         DMFAC.cdsDetFact2.FieldByName('DFACIMP1').AsFloat, 15, 2);
      WriteLn(xfArchivoTexto, 'B;PrcItem;;' + floattostr(wsB_PrcItem[xNumArr]));

   // Valor de venta unitario por ítem (sin considerar IGV)
      wsB_PrcItemSinIgv[xNumArr] := DMFAC.cdsDetFact2.FieldByName('DFACPREUMO').AsFloat;
      WriteLn(xfArchivoTexto, 'B;PrcItemSinIgv;;' + floattostr(wsB_PrcItemSinIgv[xNumArr]));

   // Valor de venta por ítem (sin considerar IGV)
      wsB_MontoItem[xNumArr] := DMFAC.cdsDetFact2.FieldByName('DFACMTOMO').AsFloat;
      WriteLn(xfArchivoTexto, 'B;MontoItem;;' + floattostr(wsB_MontoItem[xNumArr]));

   // Descuentos aplicados al ítem
      wsB_DescuentoMonto[xNumArr] := (DMFAC.cdsDetFact2.FieldByName('DFACDTOUMO').AsFloat
         + DMFAC.cdsDetFact2.FieldByName('DFACDTOMO2').AsFloat
         + DMFAC.cdsDetFact2.FieldByName('DFACDTOMO3').AsFloat);
      WriteLn(xfArchivoTexto, 'B;DescuentoMonto;;' + floattostr(wsB_DescuentoMonto[xNumArr]));

   // Afectación al IGV por ítem
      xSQL := 'Select ARTIGV, ART_IGV_EXO '
         + '     from TGE205 '
         + '    where CIAID =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('CIAID').AsString)
         + '      and TINID =' + quotedstr(DMFAC.cdsDetFact2.FieldByName('TINID').AsString)
         + '      and GRARID=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('GRARID').AsString)
         + '      and ARTID=' + quotedstr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      If DMFAC.cdsQry.FieldByname('ARTIGV').AsString = 'N' Then
      Begin
      // Registrar Exonerado de IGV
         If DMFAC.cdsQry.FieldByname('ART_IGV_EXO').AsString = 'S' Then
         // Exonerado
            wsB_IndExe[xNumArr] := '20'
         Else
         // Inafecto
            wsB_IndExe[xNumArr] := '30';
      End
      Else
      Begin
      // Gravado
         wsB_IndExe[xNumArr] := '10';
      End;
      WriteLn(xfArchivoTexto, 'B;IndExe;;' + wsB_IndExe[xNumArr]);

   // Codigo IGV (1000)
      wsB_CodigoTipoIgv[xNumArr] := strtoint(wsCodigoImpuesto);
      WriteLn(xfArchivoTexto, 'B;CodigoTipoIgv;;' + inttostr(wsB_CodigoTipoIgv[xNumArr]));

   // Tasa de IGV por ítem
      wsB_TasaIgv[xNumArr] := wsTasaImpuesto;
      WriteLn(xfArchivoTexto, 'B;TasaIgv;;' + floattostr(wsB_TasaIgv[xNumArr]));

   // IGV del ítem
      wsB_ImpuestoIgv[xNumArr] := FRound(DMFAC.cdsDetFact2.FieldByName('DFACCANTG').AsFloat *
         DMFAC.cdsDetFact2.FieldByName('DFACPREVMO').AsFloat * wsTasaImpuesto / 100, 15, 2);
      WriteLn(xfArchivoTexto, 'B;ImpuestoIgv;;' + floattostr(wsB_ImpuestoIgv[xNumArr]));

      DMFAC.cdsDetFact2.Next;
   End;
   CloseFile(xfArchivoTexto);

End;

// Escribe TXT en ruta predefinida y escoge Impresora donde se imprimirá representación Impresa
Procedure TFFactSGuia.GeneraTxtFactElec;
Var
   xSQL: String;
   xfArchivoTexto: TextFile;
   xsNombreTxt, xCarpeta, xsClave, xTDocSunat: String;
Begin
   Begin
      xSQL := ' Declare v_cursor SYS_REFCURSOR;'
         + ' Begin db2admin.SP_FAC_GEN_TXT_FACELE_V2('
         + QuotedStr(dblcCia.text) + ','
         + QuotedStr(dblcTdoc.text) + ','
         + QuotedStr(dblcSerie.text) + ','
         + QuotedStr(dbeNFac.Text) + ','
         + QuotedStr(DMFAC.wUsuario) + ','
         + QuotedStr('ACEPTADO') + ','
         + QuotedStr(wIP_Impresora) + ','
         + ' v_cursor ); End;';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo generar el archivo electrónico para SUNAT');
         Screen.Cursor := crDefault;
         xEnvioSunat := '1';
         exit;
      End;
   End;

   If DMFAC.DCOM1.AppServer.GenTxtFAC(dblcCia.text, dblcTdoc.text, dblcSerie.text, dbeNFac.Text, wId_Rutadest) = 'OK' Then
      xEnvioSunat := ''
   Else
   Begin
      ShowMessage('Archivo TXT NO se Generó');
      Exit;
   End;
End;

Procedure TFFactSGuia.Z2bbtnReImprimeClick(Sender: TObject);
Begin
   If MessageDlg('¿Seguro de Reenviar Comprobante?', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
   Begin
      pnlImprDest.visible := True;
      SelecImpresDest;
   End;

End;

Procedure TFFactSGuia.SelecImpresDest;
Var
   xSQL, xImpdefault: String;
Begin
       // Resolviendo Tienda / Id Impresora
   wIP_Impresora := '';
   xSQL := 'Select TIE_ID, PVTA_ID '
      + '  From db2admin.fac103 t '
      + '  Where CIAID   = ' + QuotedStr(dblcCia.Text)
      + '   And  DOCID   = ' + QuotedStr(dblcTdoc.text)
      + '   And  SERIEID = ' + QuotedStr(dblcSerie.text);

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
      + '   And  nvl(t.IMP_ACTIVO,''N'')=''S'' ';
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   xImpdefault := DMFAC.cdsQry.FieldByName('IMP_DES').AsString;
   wIP_Impresora := DMFAC.cdsQry.FieldByName('IMP_IP').AsString;
   wId_Rutadest := DMFAC.cdsQry.FieldByName('IMP_RUTAID').AsString;

       // Carga Todas las Impresoras de Tienda
   xSQL := 'Select R.IMP_ID, R.IMP_DES, R.IMP_IP, R.IMP_RUTAID '
      + '  From DB2ADMIN.FAC_FE_PVTA T, DB2ADMIN.FAC_FE_IMPR R  '
      + '  Where T.CIAID   = ' + QuotedStr(dblcCia.Text)
      + '   And  T.TIE_ID  = ' + QuotedStr(xTienda)
      + '   And  R.IMP_ID  = T.IMP_ID '
      + '   And  nvl(R.IMP_ACTIVO,''N'')=''S'' ';
   DMFAC.cdsQry10.Close;
   DMFAC.cdsQry10.DataRequest(xSQL);
   DMFAC.cdsQry10.Open;
   DMFAC.cdsQry10.IndexFieldNames := 'IMP_DES';
   dblcdImpDest.text := xImpdefault;

// Inicio FAC-201806
// 31/10/2018 Inicializa panel que envía a Facturación Electrónica 
   pnlImprDest.Left := 331;
   pnlImprDest.Top := 334;
// Fin FAC-201806
   pnlImprDest.visible := True;

End;

Procedure TFFactSGuia.bbtnImpDestClick(Sender: TObject);
Begin
   pnlImprDest.visible := False;
   If (copy(dblcSerie.text, 1, 1) = 'B') Or (copy(dblcSerie.text, 1, 1) = 'F') Then
      GeneraTxtFactElec
   Else
   Begin
      xEnvioSunat := '1';
      ShowMessage('Comprobante Manual... NO se enviará a Sunat!');
   End;

   If xEnvioSunat <> '1' Then
      ShowMessage('Comprobante Electrónico fue Enviado a Sunat');
   exit;
End;

Procedure TFFactSGuia.bbtnImpDestCancClick(Sender: TObject);
Begin
   pnlImprDest.visible := False;
   ShowMessage('Comprobante Electrónico NO fue Enviado a Sunat');
   Exit;
End;

Procedure TFFactSGuia.dblcdImpDestExit(Sender: TObject);
Begin
   If DMFAC.cdsQry10.Locate('IMP_ID', dblcdImpDest.Text, [loCaseInsensitive]) Then
   Begin
      wIP_Impresora := DMFAC.cdsQry10.FieldByName('IMP_IP').AsString;
      wId_Rutadest := DMFAC.cdsQry10.FieldByName('IMP_RUTAID').AsString;
   End;
End;

Procedure TFFactSGuia.bbtnObsClick(Sender: TObject);
Var
   xi, xLargo : integer;
Begin
//
   edtObs1.text := '';
   edtObs2.text := '';
   edtObs3.text  := '';
   If length(trim(dbmObs.text))>0 Then
   Begin
      xi := 1;
      While (xi<77) and (copy(dbmObs.Text,xi,1)<>'|') do
      Begin
         edtObs1.text := edtObs1.text + copy(dbmObs.Text,xi,1);
         xi := xi+1;
      End;
      xi := xi+1;
      While (xi<154) and (copy(dbmObs.Text,xi,1)<>'|') do
      Begin
         edtObs2.text := edtObs2.text + copy(dbmObs.Text,xi,1);
         xi := xi+1;
      End;
      xi := xi+1;
      While (xi<231) and (copy(dbmObs.Text,xi,1)<>'|') do
      Begin
         edtObs3.text := edtObs3.text + copy(dbmObs.Text,xi,1);
         xi := xi+1;
      End;
   End;
(*
// distribución de observaciones
   If length(dbmObs.text)>=153 then
   Begin
      edtObs1.text := copy(dbmObs.text,1,76);
      edtObs2.text := copy(dbmObs.text,77,76);
      edtObs3.text  := copy(dbmObs.text,153,76);
   End;
   If (length(dbmObs.text)>76) and (length(dbmObs.text)<=152) then
   Begin
      edtObs1.text := copy(dbmObs.text,1,76);
      edtObs2.text := copy(dbmObs.text,77,76);
      edtObs3.text  := '';
   End;
   If (length(dbmObs.text)>0) and (length(dbmObs.text)<=76) then
   Begin
      edtObs1.text := copy(dbmObs.text,1,76);
      edtObs2.text := '';
      edtObs3.text  := '';
   End;
*)
// Ajusta la posición del panel de observaciones
   pnlObs.Top := 33;
   pnlObs.Left := 47;
   pnlObs.visible := True;
End;

Procedure TFFactSGuia.bbtnObsCancClick(Sender: TObject);
Begin
   dbmObs.text := '';
   pnlObs.visible := False;
End;

Procedure TFFactSGuia.bbtnObsOkClick(Sender: TObject);
Begin
   dbmObs.text := edtObs1.text + '|' + edtObs2.text + '|' + edtObs3.text + '|';
   pnlObs.visible := False;
End;

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.dblcSerieEnter(Sender: TObject);
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

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.dblcdClieRucEnter(Sender: TObject);
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

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.dbePorcentajeEnter(Sender: TObject);
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

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.dblcFPagoEnter(Sender: TObject);
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

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.dblcOfideEnter(Sender: TObject);
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

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.dblcLentregaEnter(Sender: TObject);
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

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.dtpFVcmtoEnter(Sender: TObject);
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

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.dblcVenEnter(Sender: TObject);
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

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.dblcLPrecioEnter(Sender: TObject);
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

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.dblcTMonEnter(Sender: TObject);
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

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.bbtnObsEnter(Sender: TObject);
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

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.bbtnObsExit(Sender: TObject);
begin
   If btnExec.Focused Then Exit;
end;

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.edtDireccionEnter(Sender: TObject);
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

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.edtDireccionExit(Sender: TObject);
begin
   If btnExec.Focused Then Exit;
end;

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.dbeGarantiaExit(Sender: TObject);
begin
   If btnExec.Focused Then Exit;
end;

// Si Cliente aún no ha sido elegido fuerza que se levante ventana de Clientes
procedure TFFactSGuia.dbeGarantiaEnter(Sender: TObject);
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

// Inicio FAC-201807
// Impresión de Entrega de Mercadería
procedure TFFactSGuia.bbtnEntregaClick(Sender: TObject);
Var
   xSQL, xSQL1, xSQL2, sTipDocFac: String;
   xConta, xcaracteresSQL1, xcaracteresSQL2: Integer;
   xTFact: Double;
   xR1, xR2, xR3: Double;
   fObsequio, fCombo: Boolean;
   xFlagTDoc : String;
Begin

   If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString <> 'ACEPTADO' Then
   Begin
      Screen.Cursor := crDefault;
      Information(Caption, 'El Documento no se Encuentra Aceptado no es Posible Imprimir');
      Exit;
   End;

   If DMFAC.cdsFact2.FieldByName('TIPOADQ').AsString <> 'C' Then
   Begin
      Screen.Cursor := crDefault;
      Information(Caption, 'Sólo se emiten Constancias para Mercaderías (Tipo de Venta = ''C'')');
      Exit;
   End;

   xFlagTDoc := copy(dblcSerie.Text,1,1);

   xSQL1:= 'select FAC306.CIAID, FAC306.LOCID, FAC306.TINID, FAC306.ALMID, FAC306.CLIEID, FAC306.FACSERIE, FAC306.NFAC, FAC306.CLAUXID, '
      + '          TGE204.NUMDOCID CLIERUC, '
      + '          FN_FAC_DIREC_CLIE(TGE204.CLAUXID, TGE204.CLIEID, trim(FAC305.CLIEDIR), ''1'') DIR_C_DPTO, '
      + '          FAC306.VEID, FAC306.GRARID, FAC306.FAMID, FAC306.SFAMID, FAC306.TLISTAID, FAC306.ARTID, FAC306.UNMIDG, FAC306.UNMABR, '
      + '          FAC306.DFACCANTG, FAC306.DFACCANTAT, FAC306.DFACTCAM, FAC306.TMONID,  TGE103.TMONABR, TGE103.TMONDES, ';
   If xFlagTDoc='B' then
      xSQL1 := xSQL1 + quotedstr('BOLETA DE VENTA ELECTRÓNICA')+' DOCDES, '
   Else
      xSQL1 := xSQL1 + quotedstr('FACTURA ELECTRÓNICA')+' DOCDES, ';

   xSQL1 := xSQL1
   // Base Imponible sin Descuentos
      + '          FAC306.DFACPREUMO, FAC306.DFACPREUMN, FAC306.DFACPREUME,'
   // Descuento 1
      + '          FAC306.DFACDCTO, FAC306.DFACDTOUMO, FAC306.DFACMTOMO, FAC306.DFACMTOMN, '
   // Descuento 2
      + '          FAC306.DFACDCTO2, FAC306.DFACDTOMO2, FAC306.DFACDTOMN2, '
   // Precio Unitario de Venta sin Descuentos
      + '          FAC306.DFACPREVMO, '
   // Precio Total de Venta sin Descuentos
      + '          FAC306.DFACMTOMO, FAC306.DFACMTOME, '
   // IGV
      + '          FAC306.DFACIGV, FAC306.DFACIMP1, FAC306.DFACIMPMTO1, FAC306.DFACIMPMTN1, FAC306.DFACIMPMTE1, '
   // ISC
      + '          FAC306.DFACISC, FAC306.DFACIMP2, FAC306.DFACIMPMTO2, FAC306.DFACIMPMTN2, FAC306.DFACIMPMTE2, '
   // Precio Unitario con Impuestos
      + '          round(FAC306.DFACIMPMTO1/FAC306.DFACCANTG,2) IGV_UNITARIO, '
      + '          (FAC306.DFACPREUMO - FAC306.DFACDTOUMO - FAC306.DFACDTOMO2 + round(FAC306.DFACIMPMTO1/FAC306.DFACCANTG,2)) DFACPREUNI, '
   // Servicio
      + '          FAC306.DFACSERMO, FAC306.DFACSERMN, FAC306.DFACSERME, '
   // Venta Total
      + '          FAC306.DFACVTOTMO,  '

      + '          FAC306.DFACPREUMO PRECIOUNI, '
      + '          FAC306.DFACAAAA, FAC306.DFACMM, FAC306.DFACDD, '

      + '          FAC306.DFACESTADO, FAC306.DFACGARAN, '
      + '          FAC306.FPAGOID, FAC306.SERIE, FAC306.NGUIA, FAC306.UNMIDU, FAC306.DFACFLAGRE, FAC306.UNMIDO, FAC306.DFACCOMLMO, '
      + '          FAC306.DFACFLAGV, FAC306.DFACDCTO3, FAC306.DFACDTOMO3, '
      + '          FAC306.CLIEDIRID, FAC306.DFACDIRENT, FAC306.DFACITEM, FAC306.DOCID, FAC306.DFACHOR, FAC306.FACFECHA, '
      + '          FAC306.DFACSALDO, FAC306.DFACCONT,  '
      + '          to_char(FAC306.FACFECHA,''yyyy'') ANO, to_char(FAC306.FACFECHA,''mm'') MES, '
      + '          to_char(FAC306.FACFECHA,''dd'') DIA,'
      + '          FAC306.FACTIP, FAC306.FACTCLI, FAC306.TIPOADQ, '
      + '          FAC306.ARTDES,  '
      + '          FAC306.FACID, FAC306.DFACTFLAG, FAC306.FLAGVAR, '
      + '          FAC305.TIPVTAID, FAC305.FACPO, FAC305.FACMTOMO, FAC305.FACESTADO, FAC305.FACFECENT, '
      + '          FAC305.FACDCTOMN, FAC305.FACDCTOME, FAC305.FACFLAGD, FAC305.FACSIT, FAC305.FACTOTMO, '
      + '          FAC305.FACGARAN, FAC305.FACIGVMO, FAC305.FACISCMO, FAC305.FACCOMVEMO, FAC305.FACEMBMO, '
      + '          FAC305.ZONVTAID, FAC305.PEDIDO, FAC305.TIPPERID, FAC305.GUIASERIE, FAC305.GUIANUM, FAC305.FACTDOC, '
      + '          FAC305.ZIPID, FAC305.FACTOBS, FAC305.FACFECHA, '
      + '          trim(substr(FACTOBS,1,instr(FACTOBS, ''|'')-1)) OBS1, '
      + '          trim(substr(FACTOBS, instr(FACTOBS, ''|'')+1, instr(FACTOBS, ''|'',1,2)-1-instr(FACTOBS, ''|''))) OBS2, '
      + '          trim(substr(substr(FACTOBS, instr(FACTOBS, ''|'',1,2)+1),1,length(substr(FACTOBS, instr(FACTOBS, ''|'',1,2)+1))-1)) OBS3, '
      + '          FAC305.FACDSCTO1, FAC305.FACIMPREP, FAC305.FACFEVCMTO, TGE204.CLIEDES, FAC305.CLIEDIR, FAC305.FACIGV2MO, '
      + '          case when DARTOBS is NULL then FAC306.ARTDES else FAC313.DARTOBS end ARTDESOBS, '
      + '          FAC313.DARTOBS, '
      + '          ''                                                                                '' MONTOLETRA, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC306.DFACVTOTMO,''999,999.0000'')) DFACVTOTMO_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC306.DFACMTOMO,''999,999.0000'')) DFACMTOMO_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC305.FACTOTMO,''999,999.0000'')) FACTOTMO_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC305.FACIGVMO,''999,999.0000'')) FACIGVMO_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC305.FACSERMO,''999,999.0000'')) FACSERMO_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC305.FACTOTMO-FAC305.FACIGVMO-FAC305.FACSERMO,''999,999.0000'')) SUB_TOTAL_M, ';
   xSQL2 :=
        '          TGE103.TMONABR||TRIM(TO_CHAR(round(FAC306.DFACMTOMO/DFACCANTG,2),''999,999.0000'')) DFACPREUMO_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(FAC306.DFACVTOTMO + ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) ,''999,999.0000'')) BAZAR_SUBTOT_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR((FAC306.DFACVTOTMO+ ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) )/FAC306.DFACCANTAT ,''999,999.0000'')) BAZAR_PREUNI_M, '
      + '          TGE103.TMONABR||TRIM(TO_CHAR(ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2),''99,999.0000'')) BAZAR_DCTO_M,  '
      + '          round((DFACVTOTMO/DFACCANTAT),2) PREUNITIMPU, '
      + '          DFACDTOUMO + DFACDTOMO2 DSCTO, '
      + '          DFACPREVMO*(1+DFACIMP1/100) DFACPREVIMO, '
      + '          (DFACDTOUMO + DFACDTOMO2+DFACVTOTMO) VVTA, '
      + '          CASE WHEN FACIGVMO=0 THEN ''Exonerado del I.G.V. de acuerdo al Apendice I  inciso B de la ley del I.G.V.'' else '' '' end MENSAJE, '
      + '          FAC305.DOCPAG, FAC305.NUMDOCPAG, FAC306.CODCOM, '
      + '          FAC306.DFACVTOTMO + ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) BAZAR_SUBTOT, '
      + '          round( (FAC306.DFACVTOTMO+ ( DFACDTOUMO + ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) ) )/FAC306.DFACCANTAT,2) BAZAR_PREUNI, '
      + '          ROUND(DFACDTOMO2 * ( 1 + ((DFACIMP1/100))),2) BAZAR_DCTO,  '
      + '          CASE WHEN DFACVTOTMO=0 THEN ''Obsequio'' ELSE '''' END OBSEQUIO, '
      + '          CASE WHEN DFACVTOTMO=0 THEN ''X'' ELSE NULL END FLOBSEQUIO, SUBSTR(CODCOM,4,5) COMBO, '
      + '          ''          '' TITCOM, ''          '' TITOBS, ''     '' TITOBS1, ''     '' TITOBS2, '
      + '          CASE WHEN NVL(DETRACCION,0)>0 THEN ''C/Detracción : ''||DETRACCION ELSE '' '' END OBSDET, '
      + '          FAC305.FACUSER, FAC305.FACFREG, FAC305.FACHREG, CXC203.VENOMBRES, ''Vendedor : ''||CXC203.VENOMBRES VENDEDOR, '
      + '          nvl(CXC301.CCGRAVAD,0) CCGRAVAD, nvl(CCNOGRAV,0) CCNOGRAV, nvl(CXC_IMP_EXO,0) CXC_IMP_EXO, '
      + '          nvl(CXC301.CCEXPORT,0) CCEXPORT, nvl(CXC_IMP_EXO,0) + nvl(CXC301.CCEXPORT,0) CCEXONERADO, '
      + '          0.00 CCANTICIPO, 0.00 CCDESCUENTOS, nvl(CCSERVIC,0.00) CCSERVIC, nvl(CCIGV,0.00) CCIGV, nvl(CCMTOORI, 0.00) CCMTOORI, '
      + '          FAC_TIENDA.TIE_DES, FAC_TIENDA.TIE_DIR '
      + '     from FAC306, FAC313, FAC305, TGE103, CXC203, TGE204, CXC301, FAC103, FAC_TIENDA '
      + '    where FAC306.CIAID=' + quotedstr(dblcCIA.Text)
      + '      and FAC306.DOCID=' + quotedstr(dblcTdoc.Text)
      + '      and FAC306.FACSERIE =' + quotedstr(dblcSerie.Text)
      + '      and FAC306.NFAC =' + quotedStr(dbeNFac.Text)
      + '      and FAC305.CIAID=FAC306.CIAID AND FAC305.DOCID=FAC306.DOCID AND FAC305.FACSERIE=FAC306.FACSERIE AND FAC305.NFAC=FAC306.NFAC '
      + '      and TGE103.TMONID=FAC306.TMONID '
      + '      and FAC305.CIAID=CXC203.CIAID(+) AND FAC305.VEID=CXC203.VEID(+) '
      + '      and TGE204.CLAUXID=FAC305.CLAUXID and TGE204.CLIEID=FAC305.CLIEID '
      + '      and CXC301.CIAID=FAC306.CIAID and CXC301.DOCID=FAC306.DOCID and CXC301.CCSERIE=FAC306.FACSERIE and CXC301.CCNODOC=FAC306.NFAC '
      + '      and FAC103.CIAID=FAC306.CIAID and FAC103.SERIEID=FAC306.FACSERIE and FAC103.FLAGV='+quotedstr(xFlagTDoc)
      + '      and FAC_TIENDA.CIAID(+)=FAC103.CIAID and FAC_TIENDA.TIE_ID(+)=FAC103.TIE_ID ';
   If sTipoRQS = 'C' Then
      xSQL2 := xSQL2 + ' AND FAC313.CIAID(+)=FAC306.CIAID AND FAC313.DOCID(+)=FAC306.DOCID AND FAC313.FACSERIE(+)=FAC306.FACSERIE AND FAC313.NFAC(+)=FAC306.NFAC AND FAC313.DFACITEM(+)=FAC306.ARTID ORDER BY FAC306.DFACITEM'
   Else
      If sTipoRQS = 'S' Then
         xSQL2 := xSQL2 + ' AND FAC313.CIAID(+)=FAC306.CIAID AND FAC313.DOCID(+)=FAC306.DOCID AND FAC313.FACSERIE(+)=FAC306.FACSERIE AND FAC313.NFAC(+)=FAC306.NFAC AND FAC313.DFACITEM(+)=FAC306.DFACITEM ORDER BY FAC306.DFACITEM';

   xSQL := xSQL1 + xSQL2;
   xSQL1:= '';
   xSQL2:= '';
   If (length(xSQL) Mod 2) > 0 Then
      xcaracteresSQL1 := strtoint(floattostr((length(xSQL) - 1) / 2))
   Else
      xcaracteresSQL1 := strtoint(floattostr((length(xSQL)) / 2));
   xcaracteresSQL2 := xcaracteresSQL1 + 2;
   xSQL1 := copy(xSQL, 1, xcaracteresSQL1);
   xSQL2 := copy(xSQL, xcaracteresSQL1 + 1, xcaracteresSQL2);

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(xSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.recordcount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      showmessage('No Existen Datos a Imprimir');
      Exit;
   End;

   DMFAC.cdsReporte.First;

   sTipDocFac := DMFAC.BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''F''', 'DOCID');

   Data.Datasource := DMFAC.dsReporte;

   ppBol.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\BoletaVentaEntrega.Rtm';
   ppBol.Template.LoadFromFile;
   AsignaConstantedeImpresionDema;

   If cbDiseno.Checked Then
   Begin
      Diseno.Report := ppBol;
      Diseno.Show
   End
   Else
   Begin
      ppBol.Print;
      ppBol.Stop;
   End;
end;
// Fin FAC-201807

End.

