Unit FacDM;

// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : FacDM
// FORMULARIO               : DMFAC
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Contiene los métodos del módulo de datos
//

// Actualizaciones:
// HPC_201210_FAC 29/10/2012  Implementación del control de versiones
// HPC_201403_FAC             Se modifica en procedure "Graba Ultimo Registro" de adiciona Set Transaccion
// HPC_201408_FAC             Se retira Clase Excel2000
// HPC_201601_FAC             Se añade PacketRecords = 50
// HPC_201602_FAC 25/04/2016  Se Cambia definición de nro.máximo Nota Ingreso/Salñida a llave CIA+TIPO+ALM
// HPC_201701_FAC 30/06/2017  Adecuaciones para facturación Electrónica
// HPC_201801_FAC 26/03/2018  Define variable Global xgClAuxId
// HPC_201805_FAC 24/07/2018  Define variable Global xContinuaGrab
// 

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, DBClient, MConnect, Wwdatsrc, wwclient, RecError, variants,
   IniFiles, Mant, OleServer, DBGrids, SConnect, winsock, Wwdbigrd, Wwdbgrid,
   wwexport, shellapi, oaVariables, Excel2000;

Type
   TDMFAC = Class(TDataModule)
      dsMovFac: TwwDataSource;
      dsUsuarios: TwwDataSource;
      dsAcceso: TwwDataSource;
      dsGrupos: TwwDataSource;
      dsMGrupo: TwwDataSource;
      dsClie: TwwDataSource;
      dsVen: TwwDataSource;
      dsLPrecio: TwwDataSource;
      dsTVta: TwwDataSource;
      cdsQry: TwwClientDataSet;
      cdsQry1: TwwClientDataSet;
      cdsQry2: TwwClientDataSet;
      dsCia: TwwDataSource;
      cdsTMon: TwwClientDataSet;
      cdsUltTGE: TwwClientDataSet;
      dsStkArt: TwwDataSource;
      cdsTLista: TwwClientDataSet;
      cdsTReg: TwwClientDataSet;
      dsGuia: TwwDataSource;
      dsDetGuia: TwwDataSource;
      dsMovFac2: TwwDataSource;
      dsDetFac2: TwwDataSource;
      cdsLocal: TwwClientDataSet;
      cdsAlmacen: TwwClientDataSet;
      cdsTTran: TwwClientDataSet;
      cdsCosto: TwwClientDataSet;
      cdsChofer: TwwClientDataSet;
      cdsArticulo: TwwClientDataSet;
      dsGuia2: TwwDataSource;
      dsDetguia2: TwwDataSource;
      cdsSerie: TwwClientDataSet;
      cdsParPres: TwwClientDataSet;
      cdsTipPres: TwwClientDataSet;
      dsFact: TwwDataSource;
      dsDetFact: TwwDataSource;
      cdsGuiaPend: TwwClientDataSet;
      dsGuiaPend: TwwDataSource;
      cdsDetPend: TwwClientDataSet;
      dsDetPend: TwwDataSource;
      cdsFact2: TwwClientDataSet;
      cdsDetFact2: TwwClientDataSet;
      dsFact2: TwwDataSource;
      dsDetFact2: TwwDataSource;
      cdsEmpresa: TwwClientDataSet;
      dsEmpresa: TwwDataSource;
      cdsRepClie: TwwClientDataSet;
      dsRepclie: TwwDataSource;
      cdsRepPed: TwwClientDataSet;
      dsRepPed: TwwDataSource;
      cdsRepDPed: TwwClientDataSet;
      dsRepDPed: TwwDataSource;
      cdsRepGuia: TwwClientDataSet;
      dsRepGuia: TwwDataSource;
      cdsRepDGuia: TwwClientDataSet;
      dsRepDGuia: TwwDataSource;
      cdsQry3: TwwClientDataSet;
      cdsQry4: TwwClientDataSet;
      cdsTDoc: TwwClientDataSet;
      dsTDoc: TwwDataSource;
      dsComision: TwwDataSource;
      dsDetComision: TwwDataSource;
      cdsFactPend: TwwClientDataSet;
      dsFactPend: TwwDataSource;
      cdsReglas: TwwClientDataSet;
      dsDetFac: TwwDataSource;
      dsDireccion: TwwDataSource;
      cdsStk: TwwClientDataSet;
      dsStk: TwwDataSource;
      cdsArtiStk: TwwClientDataSet;
      dsArtiStk: TwwDataSource;
      cdsPPrecio: TwwClientDataSet;
      dsPPrecio: TwwDataSource;
      cdsDscto: TwwClientDataSet;
      dsDscto: TwwDataSource;
      cdsTInven: TwwClientDataSet;
      dsTInven: TwwDataSource;
      cdsLinea: TwwClientDataSet;
      dsLinea: TwwDataSource;
      cdsFam: TwwClientDataSet;
      cdsSFam: TwwClientDataSet;
      dsFam: TwwDataSource;
      dsSFam: TwwDataSource;
      dsCanal: TwwDataSource;
      cdsDHojaT: TwwClientDataSet;
      dsDHojaT: TwwDataSource;
      cdsHojaT: TwwClientDataSet;
      dsHojaT: TwwDataSource;
      cdsCComer: TwwClientDataSet;
      cdsUsuarios: TwwClientDataSet;
      cdsAcceso: TwwClientDataSet;
      cdsGrupos: TwwClientDataSet;
      cdsMGrupo: TwwClientDataSet;
      cdsVen: TwwClientDataSet;
      cdsClie: TwwClientDataSet;
      cdsStkArt: TwwClientDataSet;
      cdsTVta: TwwClientDataSet;
      cdsCia: TwwClientDataSet;
      cdsDireccion: TwwClientDataSet;
      cdsCanal: TwwClientDataSet;
      cdsLPrecio: TwwClientDataSet;
      cdsMovFac: TwwClientDataSet;
      cdsDetFac: TwwClientDataSet;
      cdsGuia: TwwClientDataSet;
      cdsDetGuia: TwwClientDataSet;
      cdsMovFac2: TwwClientDataSet;
      cdsDetFac2: TwwClientDataSet;
      cdsGuia2: TwwClientDataSet;
      cdsDetGuia2: TwwClientDataSet;
      cdsFact: TwwClientDataSet;
      cdsDetFact: TwwClientDataSet;
      cdsComision: TwwClientDataSet;
      cdsDetComision: TwwClientDataSet;
      cdsKdx: TwwClientDataSet;
      dsKdx: TwwDataSource;
      cdsPeriodo: TwwClientDataSet;
      dsPeriodo: TwwDataSource;
      cdsProv: TwwClientDataSet;
      dsProv: TwwDataSource;
      cdsProvPROV: TStringField;
      cdsProvPROVDES: TStringField;
      cdsRComp: TwwClientDataSet;
      cdsDRComp: TwwClientDataSet;
      dsArticulo: TwwDataSource;
      dsQry3: TwwDataSource;
      dsQry4: TwwDataSource;
      cdsCanjes: TwwClientDataSet;
      cdsDetCanje: TwwClientDataSet;
      cdsMovCxC: TwwClientDataSet;
      dsCanjes: TwwDataSource;
      dsDetCanje: TwwDataSource;
      dsMovCxC: TwwDataSource;
      cdsLetras: TwwClientDataSet;
      dsLetras: TwwDataSource;
      cdsCCanje: TwwClientDataSet;
      dsCCanje: TwwDataSource;
      cdsCuota: TwwClientDataSet;
      dsCuota: TwwDataSource;
      cdsReporte: TwwClientDataSet;
      dsReporte: TwwDataSource;
      cdsTransf: TwwClientDataSet;
      dsTransf: TwwDataSource;
      cdsDetTransf: TwwClientDataSet;
      dsDetTransf: TwwDataSource;
      cdsMovIS: TwwClientDataSet;
      dsMovIS: TwwDataSource;
      cdsHPedido: TwwClientDataSet;
      dsHPedido: TwwDataSource;
      cdsQry5: TwwClientDataSet;
      dsQry5: TwwDataSource;
      cdsResultSet: TwwClientDataSet;
      cdsDeltaSet: TwwClientDataSet;
      dsDeltaSet: TwwDataSource;
      dsDiasGracia: TwwDataSource;
      cdsDiasGracia: TwwClientDataSet;
      cdsQry6: TwwClientDataSet;
      dsQry6: TwwDataSource;
      cdsQry7: TwwClientDataSet;
      dsQry7: TwwDataSource;
      dsTLPrecio: TwwDataSource;
      cdsTLPrecio: TwwClientDataSet;
      dsCabPed: TwwDataSource;
      dsDetPed: TwwDataSource;
      cdsCabPed: TwwClientDataSet;
      cdsDetPed: TwwClientDataSet;
      cdsProforma: TwwClientDataSet;
      dsProforma: TwwDataSource;
      dsDetProf: TwwDataSource;
      cdsDetProf: TwwClientDataSet;
      cdsAsocia: TwwClientDataSet;
      dsAsocia: TwwDataSource;
      cdsTClie: TwwClientDataSet;
      dsTClie: TwwDataSource;
      cdsTipSol: TwwClientDataSet;
      dsTipSol: TwwDataSource;
      cdsDetFactObs2: TwwClientDataSet;
      dsDetFactObs2: TwwDataSource;
      cdsDetProfObs2: TwwClientDataSet;
      dsDetProfObs2: TwwDataSource;
      dsQry: TwwDataSource;
      cdsKDXSerie: TwwClientDataSet;
      dsKDXSerie: TwwDataSource;
      cdsSerieG: TwwClientDataSet;
      cdsVinculo: TwwClientDataSet;
      dsVinculo: TwwDataSource;
      cdsGiro: TwwClientDataSet;
      dsGiro: TwwDataSource;
      cdsClasif: TwwClientDataSet;
      dsClasif: TwwDataSource;
      cdsSitClie: TwwClientDataSet;
      dsSitClie: TwwDataSource;
      cdsPais: TwwClientDataSet;
      dsPais: TwwDataSource;
      cdsDpto: TwwClientDataSet;
      dsDpto: TwwDataSource;
      cdsZona: TwwClientDataSet;
      dsZona: TwwDataSource;
      cdsDistrito: TwwClientDataSet;
      dsDistrito: TwwDataSource;
      dsProvinc: TwwDataSource;
      cdsProvinc: TwwClientDataSet;
      cdsZona1: TwwClientDataSet;
      dsZona1: TwwDataSource;
      cdsVende: TwwClientDataSet;
      dsVende: TwwDataSource;
      cdsCondP: TwwClientDataSet;
      dsCondP: TwwDataSource;
      cdsSecEco: TwwClientDataSet;
      dsSecEco: TwwDataSource;
      cdsCIUU: TwwClientDataSet;
      dsCIUU: TwwDataSource;
      cdsCargos: TwwClientDataSet;
      dsCargos: TwwDataSource;
      cdsTipBien: TwwClientDataSet;
      dsTipBien: TwwDataSource;
      cdsClAux: TwwClientDataSet;
      dsClAux: TwwDataSource;
      cdsTipPer: TwwClientDataSet;
      dsTipPer: TwwDataSource;
      cdsLineaCredito: TwwClientDataSet;
      dsLineaCredito: TwwDataSource;
      cdsMiemEmpre: TwwClientDataSet;
      dsMiemEmpre: TwwDataSource;
      cdsBienes: TwwClientDataSet;
      dsBienes: TwwDataSource;
      dsClieComent: TwwDataSource;
      cdsClieComent: TwwClientDataSet;
      cdsUser: TwwClientDataSet;
      dsUser: TwwDataSource;
      cdsQry8: TwwClientDataSet;
      dsQry8: TwwDataSource;
      cdsQry9: TwwClientDataSet;
      dsQry9: TwwDataSource;
      cdsQry10: TwwClientDataSet;
      dsQry10: TwwDataSource;
      cdsQry11: TwwClientDataSet;
      dsQry11: TwwDataSource;
      cdsQry12: TwwClientDataSet;
      dsQry12: TwwDataSource;
      cdsQry13: TwwClientDataSet;
      dsQry13: TwwDataSource;
      cdsLC: TwwClientDataSet;
      dsLC: TwwDataSource;
      dsTReg: TDataSource;
      cdsRepo2: TwwClientDataSet;
      dsRepo2: TwwDataSource;
      ExcelApp: TExcelApplication;
      ExcelBook: TExcelWorkbook;
      WS: TExcelWorksheet;
      dsQry14: TwwDataSource;
      cdsQry14: TwwClientDataSet;
      dsQry15: TwwDataSource;
      cdsQry15: TwwClientDataSet;
      dsQry16: TwwDataSource;
      cdsQry16: TwwClientDataSet;
      cdsRepo3: TwwClientDataSet;
      dsRepo3: TwwDataSource;
      cdsQry17: TwwClientDataSet;
      dsQry17: TwwDataSource;
      dsQryDet: TwwDataSource;
      cdsQryDet: TwwClientDataSet;
      cdsAlmVar: TwwClientDataSet;
      dsAlmVar: TwwDataSource;
      DCOM1: TSocketConnection;
      cdsQry18: TwwClientDataSet;
      dsQry18: TwwDataSource;
      cdsQry20: TwwClientDataSet;
      dsQry20: TwwDataSource;
      dsTienda: TwwDataSource;
      cdsTienda: TwwClientDataSet;
      dsMarca: TwwDataSource;
      cdsMarca: TwwClientDataSet;
      cdsTDocSunat: TwwClientDataSet;
      dsTDocSunat: TwwDataSource;

      Procedure DataModuleCreate(Sender: TObject);
      Procedure cdsMovFacReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);
      Procedure cdsClieReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);
      Procedure cdsProformaReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);
      Procedure cdsDetProfReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);
      Procedure cdsDetFactObs2ReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);
      Procedure cdsKDXSerieReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);
      Procedure cdsDetFact2ReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);
   Private
    { Private declarations }
      FormatCel: Array Of OleVariant;

   Public
    { Public declarations }
      cIP, wOfiId, widepc, ideconex, fechorcon: String;

      wVRN_TipoCambio: String;
      wVRN_TCambioFijo: String;
      wVRN_Comision: String; // Tipo Comision por Vendedor, Linea de Producto,Articulo
      wVRN_Lineas: String; // Lis	neas de Guia/ Factura
// wAreaSolu          : string;
      wTMonExt: String; // Tipo de Moneda extranjera oficial (normalmente dólares)
      wTMonLoc: String;
      wUsuario: String;
      wComponente: TControl;
      wObjetoDescr: String;
      wObjetoForma: String;
      wObjetoNombr: String;
      wObjetoDesPr: String;
      wModulo: String;
      wGrupo: String;
      wGrupoTmp: String;
      wAdmin: String;
      wModifica: Boolean;
      wModo: String;
      wBumG: boolean; //Flag para saber si es UM General
      wBumU: boolean; //Flag para saber si es UM Unitaria
      sClose, wSRV: String;
      SRV_E, SRV_D, SRV_V: String;
      wAnchoPu, wAnchoProv: integer;
      WAnchoArt: integer;
      wFormatFecha, wFormatHoras, wReplacCeros, wRepFecServi, wRepFuncDate, wRepFuncChar: String;
      wRepTimeServi: String;
      wRutaRpt: String;
      wRptCia: String;

      wsFact: String; //Flag de id Factura
      wsBol: String; //Flag de id Boleta
      wsGuia: String; //Flag de id Guia
      wsChe: String; //Flag de id Cheque
      wsAnt: String; //Flag de Id Anticipo
      wsLet: String; //Flag de id de Letra
      wsNCre: String; //Flag de Id de Nota de credito
      wsClie: String; //Flag de Clase de Auxiliar de Cliente
      wOfid: String; //Flag de id de oficina
      wContGF: integer; // Nro de Detalle de Guia,Factura
      wVtaLocal: String; // BuscaQry('dspUltTGE','FAC105','TVTAID','TVTAFLAG='+quotedstr('L'),'TVTAID'); Tipo de Venta Local
      wVtaProv: String; // BuscaQry('dspUltTGE','FAC105','TVTAID','TVTAFLAG='+quotedstr('P'),'TVTAID'); Tipo de Venta Provincia
      wBancosFact: String; // Bancos que se imprimen en la cabecera de Factura
      wCondCEF: String; //Cond Pago Contraentrega Efectivo
      wCondCECH: String; // CondPago Contraentrega Cheque;
      wTransVta: String; //Transaccion de Salida de Almacen
      wTransCons: String; //Transaccion por Consignacion
      wPNatural: String; //Persona Natural
      wPJuridica: String; //Persona Juridica
      wTipoInv: String;
      wAnchoSal: integer; //Ancho del Correlativo de la Nota Salida
      wTdaid: String; // tipo de Doc. Almacen
      wTdaFid: String; // Factura para Almacen
      wAnchoGuia: integer; // Ancho de Guia
      wAnchoFact: integer; // Ancho de Factura
      wsFactCxC: String;
      wsBolCxC: String;
      wLineaInd: String; //Linea Industrial
      wLineaStanley: String; //Linea Stanley
      wNIxNC: String; //Trans de Nota Ing x N.C.
      wTipoAdicion: String; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa

    // TERMINAL
      wTerminal: String;
      wPC_Serie: String;
      wPR_serie: String;
      wVT_Serie: String;
   // Inicio HPC_201801_FAC
   // Define variable Global xgClAuxId
      xgClAuxId : String;
      xTipCli: String;
   // Fin HPC_201801_FAC

      Procedure HojaExcel(Tit: String; TDs: TDataSource; TDb: TDBGrid);
      Procedure FormatosCeldas(N: Integer; TDs: TDataSource);
      Function DesEncripta(wPalabra: String): String;
      Function BuscaUltTGE(xPrv, xTabla, xCampo, xWhere: String): integer;
      Function DateS(): TDatetime; // devuelve fecha del servidor
      Function BuscaQry(wPrv, wTabla, wCampos, wWhere, wResult: String): String;
      Function BuscaArticulo(PTable, PDescrip, PKey: String; PVal: String): Boolean;
      Function BuscaRegPrecio(PTLista, PArt: String): Boolean;
      Function BuscaFacPed(PCia, PClie, PPedido, PClaux: String): Boolean;
      Function BuscaFacPro(PCia, PClie, PPedido, PClaux: String): Boolean;
      Function BuscaFacGuia(PCia, PClie, PSerie, PNGuia: String): Boolean;
      Function BuscaFacFactura(PCia, PClie, PSerie, PNFac: String): Boolean;
      Function UltimoRegistroCxC(xAutoNum, xCia, xTDiario, xAno, xMes: String): String;
      Function GrabaUltimoRegistro(xAutoNum, xCia, xTDiario, xAno, xMes: String; xNumUsu: Integer): String;
      Function Encripta(wPalabra: String): String;
      Procedure AccesosUsuarios(xxModulo, xxUsuario, xxTipo, xxForma: String);
      Procedure AccesosUsuariosR(xxModulo, xxUsuario, xxTipo: String; xxForma: TForm);
      Procedure cdsTMonAfterOpen(DataSet: TDataSet);
      Function strAno(Fecha: TDateTime): String;
      Function StrZero(xVar: String; xLargo: integer): String;
      Function BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
      Function BuscaFecha(PTable, PDescrip, PKey: String; PVal: TDateTime): Boolean;
      Procedure AplicaDatos(wCDS: TClientDataSet; wNomArch: String);
      Function DisplayDescrip(PTable, PDescrip, PKey, PVal: String): String; Overload;
      Procedure ControlTran(wControlError: Integer; wCDS: TClientDataSet; wNomArch: String);
      Procedure SaldosAuxiliar(xxCia, xxAnoMes, xxClAux, xxAux, xxSigno: String; xxImpMN, xxImpME: Double; xxtmonid: String);
      Procedure SaldosAuxiliarCLG(xxCia, xxAnoMes, xxClAux, xxAux, xxSigno: String; xxImpMN, xxImpME: Double; xxtmonid: String);
      Procedure ControlStock(sCIA, sALM, sLOC, sTIN, sArt, Ano, Mes: String; Contenido: Double; IngSal: Char);
      Procedure ActualizaCantidad(CantidadG, CantidadU, Contenido: double; SumaResta: Char; Var CantidadActG, CantidadActU: Double);
      Procedure ActualizaArticulo(sCIA, sArt: String; Contenido: Double; IngSal: Char);
      Procedure ActualizaCantidadMonto(CantidadG, CantidadU, Contenido: double; SumaResta: Char; Var PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU: Double);
      Procedure CocienteResto(Num1, Num2: double; Var Cociente, Resto: double);
      Procedure CocienteRestoFalta(Num1, Num2: double; Var Cociente, Resto: double);
      Procedure SaldosIniciales(sCIA, sArt, xAnoMes: String; sContenido, sPrecio: Double);
      Function OperClientDataSet(ClientDataSet: TwwClientDataSet; Expression, Condicion: String): Double;
      Function BuscaCxCLet(PCia, PDoc, PNoDoc: String): Boolean;
      Function IsNumeric(S: String): Boolean;
      Function CountFor(cds: TwwClientDataSet; sCondicion: String): LongInt;
      Function MaxReqA(Const sCIA, sLOC: String): String;
      Function MaxProf(Const sCIA, sLoc: String): String;
      Function MaxSQL(Const sTabla, sMxCampo, sCondicion: String): String;
      Function MaxValue(Const sDetail: String; CD: TDataSet): String;
      Procedure GrabaAuxConta(wCDST: TClientDataSet);
      Function BuscaCliente(xxCia, xxClaux, xxClie: String): Boolean;
      Function StrNum(wNumero: double): String;
      Function NombreMes(wwMes: integer): String;
      Function MaxNIS(Const sCIA, sALM, sTIN, sLOC, sTDA: String): String;
      Function MesCerrado(xMes, xAno, xCiaid: String): Boolean;
      Procedure cdsPost(xxCds: TwwClientDataSet);

      Function strMes(Fecha: TDateTime): String;
      Function Control_Fecha(FecSis, FecDoc: TDateTime): String;
      Function MaxNIA(Const sCIA, sALM, sTIN, sLOC, sTDA: String): String;
      Procedure VerificaPeriodoVentas(sCia, sLoc, sTin, sAlm: String; dFechaSistema, dFechaMovimiento: TDateTime);
      Procedure DisminuyeForma(Sender: TObject);
      Procedure ActualizaFiltro(wwFiltro: TMant; wwCdsLee: TwwClientDataSet; wwAccion: String);
      Procedure FiltraTabla(xxCds: TwwClientDataSet; xxArchivo, xxCampo: String; xxWhere: String = '');
      Function FiltraCiaPorUsuario(cdsCiaUser: TwwClientDataSet): String;

      Function ObtenerIpdeNetbios(Host: String): String;
      Function ComputerName: String;
      Function AccesosModulo: Boolean;

      Procedure ExportaGridExcel(xDataGrid: TwwDBGrid; xFileName: String);
     //INICIO HPC_201210_FAC
      Function fg_VerificaVersion(wgVersion: String): Boolean;
     //FIN HPC_201210_FAC

   // Inicio HPC_201608_ALM
      Function wf_AccesoOpcion(wOpcion: String): Boolean;
   // Fin HPC_201608_ALM

   End;

Var
   DMFAC: TDMFAC;
   ErrorCount, wAnchoIng: integer;
   xBorrar, wFil_Asoc, wCie_Ant, wCie_Des, wFSerie, wSerieNum: String; // Si se va a eliminar no tiene que ingresar al ParamDSPGraba si sale error
   sWhere, xCiaEnviar, xFec_Sis, xHor_Sis: String;
   wVerifPerVentas: Boolean;
   wNomAplicacion: String;
// Inicio HPC_201805_FAC
// Define variable Global xContinuaGrab
   xContinuaGrab: boolean;
// Fin HPC_201805_FAC

Procedure Filtracds(xxCds: TwwClientDataSet; xxSQL: String);
Function FRound(xReal: double; xEnteros, xDecimal: Integer): double;
Procedure UpdCont(Const CIA, TDO, NDO, UBI, SIT, TMO, ZNA: String; FEC: TDate);

Implementation

Uses FAC020;

{$R *.DFM}

Procedure TDMFAC.ExportaGridExcel(xDataGrid: TwwDBGrid; xFileName: String);
Begin
   Screen.Cursor := crHourGlass;
   With xDataGrid, xDataGrid.ExportOptions Do
   Begin
      ExportType := wwgetSYLK;
      FileName := xFileName + '.slk';
      Save;
      If Not (esoClipboard In Options) Then
         ShellExecute(Handle, 'Open', PChar(xDataGrid.exportoptions.Filename), Nil, Nil, sw_shownormal);
   End;
   Screen.Cursor := crDefault;

End;

Function TDMFAC.Control_Fecha(FecSis, FecDoc: TDateTime): String;
Var
   AntSis, DesSis: TDateTime;
Begin
   AntSis := FecSis - StrtoFloat(wCie_Ant);
   DesSis := FecSis + StrtoFloat(wCie_Des);

   If AntSis >= FecDoc Then
      Result := 'ANT'
   Else
      If DesSis <= FecDoc Then
         Result := 'DES'
      Else
         Result := ''
End;

Function TDMFAC.DesEncripta(wPalabra: String): String;
Var
   xLargoPal, i, j: integer;
   xReal, xEncriptado1, xEncriptado2, xEncriptado3, xEncriptado4,
      xEncriptado5, xNuevaPal, xEncriptado: String;
   xTiene: boolean;
Begin
   xReal := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1 := '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2 := '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3 := '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4 := 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5 := ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal := length(wPalabra);
   xNuevaPal := '';
   i := 1;
   While i <= xLargoPal Do
   Begin
      j := 1;
      xTiene := False;
      If (i = 1) Or (i = 11) Or (i = 21) Or (i = 31) Then xEncriptado := xEncriptado1;
      If (i = 2) Or (i = 12) Or (i = 22) Or (i = 32) Then xEncriptado := xEncriptado2;
      If (i = 3) Or (i = 13) Or (i = 23) Or (i = 33) Then xEncriptado := xEncriptado3;
      If (i = 4) Or (i = 14) Or (i = 24) Or (i = 34) Then xEncriptado := xEncriptado4;
      If (i = 5) Or (i = 15) Or (i = 25) Or (i = 35) Then xEncriptado := xEncriptado5;
      If (i = 6) Or (i = 16) Or (i = 26) Or (i = 36) Then xEncriptado := xEncriptado1;
      If (i = 7) Or (i = 17) Or (i = 27) Or (i = 37) Then xEncriptado := xEncriptado2;
      If (i = 8) Or (i = 18) Or (i = 28) Or (i = 38) Then xEncriptado := xEncriptado3;
      If (i = 9) Or (i = 19) Or (i = 29) Or (i = 39) Then xEncriptado := xEncriptado4;
      If (i = 10) Or (i = 20) Or (i = 30) Or (i = 40) Then xEncriptado := xEncriptado5;
      While j <= length(xReal) Do
      Begin
         If copy(wPalabra, i, 1) = copy(xEncriptado, j, 1) Then
         Begin
            xNuevaPal := xNuevaPal + copy(xReal, j, 1);
            xTiene := True;
         End;
         j := j + 1;
      End;
      If Not xTiene Then xNuevaPal := xNuevaPal + copy(wPalabra, i, 1);
      i := i + 1;
   End;
   result := xNuevaPal;
End;

Procedure TDMFAC.AplicaDatos(wCDS: TClientDataSet; wNomArch: String);
Var
   Results, OwnerData: OleVariant;
Begin
   If (wCDS.ChangeCount > 0) Or (wCDS.Modified) Then
   Begin
      If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
         If xBorrar = '0' Then
            DCOM1.AppServer.ParamDSPGraba('1', wNomArch);

      wCDS.CheckBrowseMode;
      Results := DCOM1.AppServer.AS_ApplyUpdates(wCDS.ProviderName, wcds.Delta, -1, ErrorCount, OwnerData);
      cdsResultSet.Data := Results;
      wCDS.Reconcile(Results);
      If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
         If xBorrar = '0' Then
            DCOM1.AppServer.ParamDSPGraba('0', wNomArch);
   End;
End;

Procedure TDMFAC.ControlTran(wControlError: Integer; wCDS: TClientDataSet; wNomArch: String);
Begin
// wControlError=1 errores en el SQL, entra a través del Except
// wControlError=9 para la grabación en línea
// wControlError=0 grabación a través de procesos batch, no actualiza físicamente
// wControlError=8 commit;
// ControlTran( 0, nil, '' ); para grabar todas los cds que han sido modificados
// ControlTran( 0, cdsGuia, 'GUIA');  graba sólo el cds especificado

   If wControlError = 1 Then
   Begin
      Dcom1.AppServer.RetornaTransaccion;
      ErrorCount := 1;
      ShowMessage('Avise a su Proveedor de Software...( 1 )');
      Application.Terminate;
      Abort;
   End;

   If wControlError = 9 Then
   Begin
      DCOM1.AppServer.IniciaTransaccion;
      ErrorCount := 0;
   End;

   If (wControlError = 0) Or (wControlError = 9) Then
   Begin
      If wNomArch <> '' Then
      Begin
         If ErrorCount = 0 Then
            AplicaDatos(wCDS, wNomArch);
      End
      Else
      Begin
         If ErrorCount = 0 Then
            AplicaDatos(cdsGuia, 'GUIA');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDetGuia, 'DETGUIA');
         If ErrorCount = 0 Then
            AplicaDatos(cdsFact, 'FACTURA');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDetFact, 'DETFACTURA');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDetPed, 'DETPED');
         If ErrorCount = 0 Then
            AplicaDatos(cdsAlmacen, 'MOVFAC'); // actualiza cabecera de Pedidos
         If ErrorCount = 0 Then
            AplicaDatos(cdsLetras, 'LETRAS');
         If ErrorCount = 0 Then
            AplicaDatos(cdsCCanje, 'CCanje');
         If ErrorCount = 0 Then
            AplicaDatos(cdsCanjes, 'Canjes');
         If ErrorCount = 0 Then
            AplicaDatos(cdsMovCxC, 'MovCxC');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDetCanje, 'DetCanje');
         If ErrorCount = 0 Then
            AplicaDatos(cdsMovFac, 'MOVFAC');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDetFac, 'DETFAC');
         If ErrorCount = 0 Then
            AplicaDatos(cdsFact, 'FACT');
         If ErrorCount = 0 Then
            AplicaDatos(cdsHojaT, 'HOJAT');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDHojaT, 'DHOJAT');
         If ErrorCount = 0 Then
            AplicaDatos(cdsProforma, 'PROF');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDetProf, 'DPROF');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDetProfObs2, 'DPROFSOBS'); // Paralelo al FAC312
         If ErrorCount = 0 Then
            AplicaDatos(cdsFact2, 'FACSGUIA');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDetFact2, 'DFACSGUIA');
         If ErrorCount = 0 Then
            AplicaDatos(cdsDetFactObs2, 'DFACSOBS'); // Paralelo al FAC306
         If ErrorCount = 0 Then
            AplicaDatos(cdsGrupos, 'GRUPOS');
         If ErrorCount = 0 Then
            AplicaDatos(cdsMGrupo, 'MGRUPO');
         If ErrorCount = 0 Then
            AplicaDatos(cdsKDXSerie, 'KDXSERIE');
      End;
   End;

   If wControlError = 9 Then
   Begin
      wControlError := 8;
   End;

   If wControlError = 8 Then
      If ErrorCount = 0 Then
         DCOM1.AppServer.GrabaTransaccion;

   If ErrorCount > 0 Then
   Begin
      DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Avise a su Proveedor de Software...( 1 )');
      Application.Terminate;
      Abort;
   End;
End;

Function TDMFAC.strMes(Fecha: TDateTime): String;
Var
   Year, Month, Day: Word;
Begin
   If Fecha = 0 Then
      Result := ''
   Else
   Begin
      DecodeDate(Fecha, Year, Month, Day);
      Result := Strzero(inttostr(Month), 2);
   End;
End;

Function TDMFAC.strAno(Fecha: TDateTime): String;
Var
   Year, Month, Day: Word;
Begin
   If Fecha = 0 Then
      Result := ''
   Else
   Begin
      DecodeDate(Fecha, Year, Month, Day);
      Result := Strzero(inttostr(Year), 4);
   End;
End;

Function FRound(xReal: double; xEnteros, xDecimal: Integer): double;
Var
   xParteDec, xflgneg: String;
   xDec: Integer;
   xMultiplo10, xUltdec, xNReal: Double;
Begin
   Result := 0;
   xMultiplo10 := 0;
   xflgneg := '0';

   If xReal < 0 Then
   Begin
      xflgneg := '1';
      xReal := xReal * -1;
   End;

   If xReal = 0 Then exit;
// primer redondeo a un decimal + de lo indicado en los parámetros
   xDec := xDecimal + 1;
   If xDec = 0 Then xMultiplo10 := 1;
   If xDec = 1 Then xMultiplo10 := 10;
   If xDec = 2 Then xMultiplo10 := 100;
   If xDec = 3 Then xMultiplo10 := 1000;
   If xDec = 4 Then xMultiplo10 := 10000;
   If xDec = 5 Then xMultiplo10 := 100000;
   If xDec = 6 Then xMultiplo10 := 1000000;
   If xDec = 7 Then xMultiplo10 := 10000000;
   xParteDec := floattostr(int(xReal * xMultiplo10 - (int(xReal) * xMultiplo10)));
   If length(xParteDec) < xDec Then xParteDec := DMFAC.strZero(xParteDec, xDec);

   If length(xParteDec) >= xDec Then
      xultdec := strtofloat(copy(xParteDec, xDec, 1))
   Else
   Begin
      xUltDec := 0;
   End;
   xNReal := int(xReal * xMultiplo10 / 10);
   If xultdec >= 5 Then xNReal := xNReal + 1;

   If xflgneg = '1' Then
   Begin
      Result := (xNReal / (xMultiplo10 / 10)) * -1;
   End
   Else
   Begin
      Result := xNReal / (xMultiplo10 / 10);
   End;
End;

Function TDMFAC.StrZero(xVar: String; xLargo: integer): String;
Var
   i: integer;
   s: String;
Begin
   s := '';
   For i := 1 To xLargo Do
   Begin
      s := s + '0';
   End;
   s := s + trim(xVar);
   result := copy(s, length(s) - (xLargo - 1), xLargo);
End;

Function TDMFAC.Encripta(wPalabra: String): String;
Var
   xLargoPal, i, j: integer;
   xReal, xEncriptado1, xEncriptado2, xEncriptado3, xEncriptado4,
      xEncriptado5, xNuevaPal, xEncriptado: String;
   xTiene: boolean;
Begin
   xReal := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1 := '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2 := '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3 := '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4 := 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5 := ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal := length(wPalabra);
   xNuevaPal := '';
   i := 1;
   While i <= xLargoPal Do
   Begin
      j := 1;
      xTiene := False;
      If (i = 1) Or (i = 11) Or (i = 21) Or (i = 31) Then xEncriptado := xEncriptado1;
      If (i = 2) Or (i = 12) Or (i = 22) Or (i = 32) Then xEncriptado := xEncriptado2;
      If (i = 3) Or (i = 13) Or (i = 23) Or (i = 33) Then xEncriptado := xEncriptado3;
      If (i = 4) Or (i = 14) Or (i = 24) Or (i = 34) Then xEncriptado := xEncriptado4;
      If (i = 5) Or (i = 15) Or (i = 25) Or (i = 35) Then xEncriptado := xEncriptado5;
      If (i = 6) Or (i = 16) Or (i = 26) Or (i = 36) Then xEncriptado := xEncriptado1;
      If (i = 7) Or (i = 17) Or (i = 27) Or (i = 37) Then xEncriptado := xEncriptado2;
      If (i = 8) Or (i = 18) Or (i = 28) Or (i = 38) Then xEncriptado := xEncriptado3;
      If (i = 9) Or (i = 19) Or (i = 29) Or (i = 39) Then xEncriptado := xEncriptado4;
      If (i = 10) Or (i = 20) Or (i = 30) Or (i = 40) Then xEncriptado := xEncriptado5;
      While j <= length(xReal) Do
      Begin
         If copy(wPalabra, i, 1) = copy(xReal, j, 1) Then
         Begin
            xNuevaPal := xNuevaPal + copy(xEncriptado, j, 1);
            xTiene := True;
         End;
         j := j + 1;
      End;
      If Not xTiene Then xNuevaPal := xNuevaPal + copy(wPalabra, i, 1);
      i := i + 1;
   End;
   result := xNuevaPal;
End;

Function TDMFAC.UltimoRegistroCxC(xAutoNum, xCia, xTDiario, xAno, xMes: String): String;
Var
   xSQL: String;
Begin
   If xAutoNum <> 'N' Then
   Begin
      xSQL := '';
      xSQL := 'SELECT NUMERO FROM TGE301 WHERE CIAID=' + '''' + xCia + '''' + ' and '
         + 'TDIARID=' + '''' + xTDiario + '''';
      If (xAutoNum = 'A') Or (xAutoNum = 'M') Then xSQL := xSQL + ' AND ANO=' + '''' + xAno + '''';
      If xAutoNum = 'M' Then xSQL := xSQL + ' AND MES=' + '''' + xMes + '''';

   // Inicio HPC_201805_FAC
   // Determina Número Máximo en base a valores de Tablas CXC301 y CXC302
      xSQL := 'Select max(NUMERO) NUMERO '
         + '     from (Select (cast(nvl(max(CCNOREG),0) as integer)) NUMERO '
         + '             from DB2ADMIN.CXC301 '
         + '            where CIAID='+quotedstr(xCia)+' and TDIARID='+quotedstr(xTDiario)+' and CCANOMES='+quotedstr(xAno+xMes)
         + '            Union all '
         + '           Select (cast(nvl(max(CCNOREG),0) as integer)) NUMERO '
         + '             from DB2ADMIN.CXC302 '
         + '            where CIAID='+quotedstr(xCia)+' and TDIARID='+quotedstr(xTDiario)+' and CCANOMES='+quotedstr(xAno+xMes)+')';
   // Fin HPC_201805_FAC
      cdsQry2.Close;
      cdsQry2.ProviderName := 'prvEjecuta';
      cdsQry2.DataRequest(xSQL); //este es la llamada remota al provider del servidor
      cdsQry2.Open;

      If cdsQry2.FieldByName('NUMERO').Value = null Then
         result := '1'
      Else
      Begin
         result := inttostr(cdsQry2.FieldByName('NUMERO').Value + 1);
      End;
   End
   Else
      result := '';
End;

Procedure TDMFAC.AccesosUsuarios(xxModulo, xxUsuario, xxTipo, xxForma: String);
Begin
   If Trim(cdsUsuarios.FieldByName('GRUPOID').AsString) = '' Then
   Begin
      If cdsUsuarios.IndexFieldNames <> 'USERID' Then
         cdsUsuarios.IndexFieldNames := 'USERID';
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByName('USERID').AsString := xxUsuario;
      If Not cdsUsuarios.GotoKey Then
         Exit;
   End;
   cdsGrupos.Filter := '';

   If xxTipo = '1' Then
   Begin
      cdsGrupos.Filter := 'GRUPOID=' + '''' + cdsUsuarios.FieldByname('GRUPOID').AsString + '''' + ' and '
         + 'MODULOID=' + '''' + xxModulo + '''' + ' and '
         + 'TIPO=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;

   If xxTipo = '2' Then
   Begin
      cdsGrupos.Filter := 'GRUPOID=' + '''' + cdsUsuarios.FieldByname('GRUPOID').AsString + '''' + ' and '
         + 'MODULOID=' + '''' + xxModulo + '''' + ' and '
         + 'FORMA=' + '''' + xxForma + '''' + ' and '
         + 'TIPO=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;
End;

Procedure TDMFAC.AccesosUsuariosR(xxModulo, xxUsuario, xxTipo: String; xxForma: TForm);
Begin
   If Trim(cdsUsuarios.FieldByname('GRUPOID').AsString) = '' Then
   Begin
      If cdsUsuarios.IndexFieldNames <> 'USERID' Then
         cdsUsuarios.IndexFieldNames := 'USERID';
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByname('USERID').AsString := xxUsuario;
      If Not cdsUsuarios.GotoKey Then Exit;
   End;

   cdsGrupos.Filter := '';
   If xxTipo = '1' Then
   Begin
      cdsGrupos.Filter := 'GrupoID=' + '''' + cdsUsuarios.FieldByname('GRUPOID').AsString + '''' + ' and '
         + 'ModuloID=' + '''' + xxModulo + '''' + ' and '
         + 'Tipo=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;

      If (DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P') Then Exit;

      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;

   If xxTipo = '2' Then
   Begin
      cdsGrupos.Filter := 'GrupoID=' + '''' + cdsUsuarios.FieldByname('GRUPOID').AsString + '''' + ' and '
         + 'ModuloID=' + '''' + xxModulo + '''' + ' and '
         + 'Forma=' + '''' + xxForma.Name + '''' + ' and '
         + 'Tipo=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;

      If (DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P') Then Exit;

      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma);
//         If (wComponente.Name='Z2bbtnModifica') or
//            (wComponente.Name='Z2bbtnConsulta') then
         wComponente.Enabled := False;
//         else begin
//            wComponente.Visible := False;
//         end;
         cdsGrupos.Next;
      End;
   End;
End;

Procedure TDMFAC.cdsTMonAfterOpen(DataSet: TDataSet);
Var
   xWhere: String;
Begin
   // determina Tipo de Moneda Extranjera Oficial (normalmente dólares)
   xWhere := 'TMon_Loc=' + '''' + 'E' + '''';
   wTMonExt := BuscaQry('dspTGE', 'TGE103', '*', xWhere, 'TMonId');
   xWhere := 'TMon_Loc=' + '''' + 'L' + '''';
   wTMonLoc := BuscaQry('dspTGE', 'TGE103', '*', xWhere, 'TMonId');
End;

Function TDMFAC.BuscaQry(wPrv, wTabla, wCampos, wWhere, wResult: String): String;
Var
   xSQL: String;
Begin
{  wPrv    = Provider al que hace referencia el cdsQry
   wTabla  = Tabla en la que se va a hacer la búsqueda
   wCampos = Campos que va a considerar en el "select" de sentencia SQL
   wWhere  = Condicional de la búsqueda
   wResult = Resultado que entrega la búsqueda }

   xSQL := '';
   xSQL := 'SELECT ' + wCampos + ' FROM ' + wTabla;
   If length(wWhere) > 0 Then xSQL := xSQL + ' WHERE ' + wWhere;
   cdsQry.Close;
   cdsQry.ProviderName := wPrv; //PONER FIJO EL PROVIDER
   cdsQry.DataRequest(xSQL); //esta es la llamada remota al provider del servidor
   cdsQry.Open;
   result := cdsQry.FieldByName(wResult).AsString;
End;

Function TDMFAC.BuscaFacPed(PCia, PClie, PPedido, PClaux: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'select PEDIDO from FAC301 Where ';
   xSQL := xSQL + 'CIAID=' + quotedstr(PCia);
   xSQL := xSQL + ' AND PEDIDO=' + quotedstr(PPedido);
   xSQL := UpperCase(xSQL);
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName := 'dspUltTGE';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount > 0 Then
      result := True
   Else
      result := False;
End;

Function TDMFAC.BuscaFacGuia(PCia, PClie, PSerie, PNGuia: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT * FROM FAC303 WHERE ';
   xSQL := xSQL + 'CiaID=' + quotedstr(PCia);
   xSQL := xSQL + ' AND SERIE=' + quotedstr(PSerie);
   xSQL := xSQL + ' AND NGUIA=' + quotedstr(PNguia);
   xSQL := UpperCase(xSQL);
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName := 'dspUltTGE';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount > 0 Then
      result := True
   Else
      result := False;
End;

Function TDMFAC.BuscaFacFactura(PCia, PClie, PSerie, PNFac: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT * FROM FAC305 WHERE '
      + ' CIAID=' + quotedstr(PCia)
      + ' AND FACSERIE=' + quotedstr(PSerie)
      + ' AND NFAC=' + quotedstr(PNFac);
   xSQL := UpperCase(xSQL);
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName := 'dspUltTGE';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount > 0 Then
      result := True
   Else
      result := False;
End;

Function TDMFAC.BuscaRegPrecio(PTLista, PArt: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT * FROM FAC201 WHERE ';
   xSQL := xSQL + 'TLISTAID=' + '''' + PTLista + '''' + ' AND ';
   xSQL := xSQL + 'ARTID=' + '''' + PArt + '''';
   xSQL := UpperCase(xSQL);
   cdsUltTGE.Close;
 //cdsUltTGE.ProviderName:='dspCxP';
   cdsUltTGE.ProviderName := 'dspUltTGE';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount > 0 Then
      result := True
   Else
      result := False;
End;

Procedure Filtracds(xxCds: TwwClientDataSet; xxSQL: String);
Begin
   If Length(xxSQL) > 0 Then
   Begin
      xxCds.Close;
      xxCds.IndexFieldNames := '';
      xxCds.Filter := '';
      xxCds.Filtered := False;
      xxCds.DataRequest(xxSQL);
   End;
   xxCds.Open;
End;

Function TDMFAC.BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
Var
   ic: Integer;
Begin
   Result := Nil;
   For ic := 0 To xForm.ComponentCount - 1 Do
   Begin
      If xForm.Components[ic].Name = xNombre Then
         Result := TControl(xForm.Components[ic]);
   End;
End;

Function TDMFAC.DisplayDescrip(PTable, PDescrip, PKey, PVal: String): String;
Var
   xSQL: String;
Begin
   xSQL := 'select * from ' + PTable + ' ';
   xSQL := xSQL + 'where ' + PKey + '=' + '''' + PVal + '''';
   xSQL := UpperCase(xSQL);
   cdsULTTGE.Close;
   cdsULTTGE.ProviderName := 'dspUltTGE';
   cdsULTTGE.DataRequest(xSQL); //este es la llamada remota al provider del servidor
   cdsULTTGE.Open;
   result := cdsULTTGE.FieldByName(PDescrip).AsString;
End;

Function TDMFAC.BuscaFecha(PTable, PDescrip, PKey: String; PVal: TDateTime): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'select * from ' + PTable + ' ';
//   xSQL:= xSQL + 'where '+ PKey +'= DATE('+''''+ FORMATDATETIME('YYYY-MM-DD',PVal)+''''+')';
   xSQL := xSQL + 'where ' + PKey + '=' + wRepFuncDate + '''' + FORMATDATETIME(wFormatFecha, PVal) + '''' + ')';
   xSQL := UpperCase(xSQL);
   cdsULTTGE.Close;
   cdsULTTGE.ProviderName := 'dspUltTGE';
   cdsULTTGE.DataRequest(xSQL); //este es la llamada remota al provider del servidor
   cdsULTTGE.Open;
   If cdsULTTGE.RecordCount > 0 Then
      Result := True
   Else
      Result := False;
End;

Function TDMFAC.BuscaArticulo(PTable, PDescrip, PKey: String; PVal: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'select * from ' + PTable + ' ';
   xSQL := xSQL + 'where ' + PKey + ' = ' + Pval + '''';
   xSQL := UpperCase(xSQL);
   cdsArticulo.Close;
   cdsArticulo.ProviderName := 'dspArticulo';
   cdsArticulo.DataRequest(xSQL); //este es la llamada remota al provider del servidor
   cdsArticulo.Execute;
   If cdsArticulo.RecordCount > 0 Then
      Result := True
   Else
      Result := False;
End;

Function TDMFAC.BuscaUltTGE(xPrv, xTabla, xCampo, xWhere: String): INTEGER;
Var
   xSQL: String;
Begin
   xSQL := '';
   xSQL := 'Select max(' + xCampo + ') as MaxNum from ' + xTabla;
   If length(xWhere) > 0 Then xSQL := xSQL + ' where ' + xWhere;
   xSQL := UpperCase(xSQL);
   cdsULTTGE.Close;
   cdsULTTGE.ProviderName := xPrv;
   cdsULTTGE.DataRequest(xSQL); //esta es la llamada remota al provider del servidor
   cdsULTTGE.Open;
   If cdsULTTGE.FieldByName('MaxNum').Value = null Then
      result := 1
   Else
   Begin
      result := cdsULTTGE.FieldByName('MaxNum').AsInteger + 1;
   End;
End;

Function TDMFAC.GrabaUltimoRegistro(xAutoNum, xCia, xTDiario, xAno, xMes: String; xNumUsu: Integer): String;
Var
   xSQL: String;
Begin
   //INICIO HPC_201403_FAC
   Result := 'S';
   //FINAL HPC_201403_FAC
   If xAutoNum <> 'N' Then
   Begin
      xSQL := '';
      xSQL := 'Select Numero from TGE301 '
         + 'Where CiaID=' + '''' + xCia + '''' + ' and '
         + 'TDiarID=' + '''' + xTDiario + '''';
      If (xAutoNum = 'A') Or (xAutoNum = 'M') Then xSQL := xSQL + ' and Ano=' + '''' + xAno + '''';
      If xAutoNum = 'M' Then xSQL := xSQL + ' and Mes=' + '''' + xMes + '''';
      xSQL := UpperCase(xSQL);
      cdsQry2.Close;
      cdsQry2.ProviderName := 'dspUltTGE';
      cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
      cdsQry2.Open;
      Try
         If cdsQry2.FieldByName('Numero').Value = null Then
         Begin
            Result := IntToStr(xNumUsu);

            xSQL := 'Insert into TGE301(CiaID,TDiarID';
            If (xAutoNum = 'A') Or (xAutoNum = 'M') Then xSQL := xSQL + ',Ano';
            If xAutoNum = 'M' Then xSQL := xSQL + ',Mes';
            xSQL := xSQL + ',Numero ) Values (' + '''' + xCia + '''' + ',' + '''' + xTDiario + '''';
            If (xAutoNum = 'A') Or (xAutoNum = 'M') Then xSQL := xSQL + ',' + '''' + xAno + '''';
            If xAutoNum = 'M' Then xSQL := xSQL + ',' + '''' + xMes + '''';
            xSQL := xSQL + ',' + Result + ' )';
            xSQL := UpperCase(xSQL);

            //INICIO HPC_201403_FAC
            //DCOM1.AppServer.EjecutaSQL(xSQL);
            Try
               DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al insertar en el Archivo de Control de Numeración (TGE301)');
            // Inicio HPC_201805_FAC
            // error en grabación de último número de registro contable de CXC
            //   DMFAC.DCOM1.AppServer.RetornaTransaccion;
               xContinuaGrab := False;
            // Fin HPC_201805_FAC
               Result := 'N';
               exit;
            End;
           //FINAL HPC_201403_FAC
         End
         Else
         Begin
            Result := IntToStr(xNumUsu);
            xSQL := 'Update TGE301 Set Numero=' + Result + ' ';
            xSQL := xSQL + 'Where CiaID=' + '''' + xCia + '''' + ' and TDiarID=' + '''' + xTDiario + '''';
            If (xAutoNum = 'A') Or (xAutoNum = 'M') Then xSQL := xSQL + ' and Ano=' + '''' + xAno + '''';
            If xAutoNum = 'M' Then xSQL := xSQL + ' and Mes=' + '''' + xMes + '''';
            xSQL := UpperCase(xSQL);

            //INICIO HPC_201403_FAC
            //DCOM1.AppServer.EjecutaSQL(xSQL);
            Try
               DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al actualizar el Archivo de Control de Numeración (TGE301)');
            // Inicio HPC_201805_FAC
            // error en grabación de último número de registro contable de CXC
            //   DMFAC.DCOM1.AppServer.RetornaTransaccion;
               xContinuaGrab := False;
            // Fin HPC_201805_FAC
               Result := 'N';
               exit;
            End;
            //FINAL HPC_201403_FAC

         End;
      Except
         //INICIO HPC_201403_FAC
         // ControlTran(1, Nil, '');
         //FINAL HPC_201403_FAC
      End;
   End;
End;

Procedure TDMFAC.DataModuleCreate(Sender: TObject);
Var
   ssql, xWhere, xSQL2: String;
   inifile: TIniFile;
   xIPServer: String;
Begin
   DCOM1.Connected := False;

   If ParamStr(1) = '' Then
   Begin
      inifile := TIniFile.Create(ExtractFilePath(application.ExeName) + '\oaCfg.ini');
      xIPServer := IniFile.ReadString('TCPIP', 'ADDRESS', '');
      wSRV := IniFile.ReadString('MOTOR', 'NAME', '');
   End;

   FCtrlAcceso := TFCtrlAcceso.Create(Application);
   wModulo := 'FAC';
   DCOM1.Address := xIPServer;
   Try
      DCOM1.Connected := true;
   Except
   // por no realizar la conexion
      ShowMessage('ERROR de Conexión con la Aplicación Servidor');
      Exit;
   End;

   FCtrlAcceso.wDCOM1 := DCOM1;
   Screen.Cursor := crHourGlass;
   FCtrlAcceso.ShowModal;

   If FCtrlAcceso.cAccesoSistema = 'S' Then
   Begin
      wUsuario := FCtrlAcceso.dbeUsuario.Text;
      FCtrlAcceso.free;
   End
   Else
   Begin
      DCOM1.Connected := False;
      FCtrlAcceso.free;
      Exit;
   End;

   If Not AccesosModulo Then
   Begin
      DCOM1.Connected := False;
      Screen.Cursor := CrDefault;
   End
   Else
   Begin
      wModulo := 'FAC';
      If (wSRV = 'ORACLE') Then
      Begin
         xSQL2 := 'Select A.USERID, A.GRUPOID, B.MODULOID, B.TIPO, B.OBJETO, B.FORMA, C.GRUPOADM '
            + 'From TGE007 A, TGE001 B, TGE003 C '
            + 'WHERE A.USERID=''' + wUsuario + ''' '
            + 'AND A.GRUPOID=B.GRUPOID(+) and B.MODULOID=''' + wModulo + ''''
            + 'AND A.GRUPOID=C.GRUPOID(+)';
      End;
      If (wSRV = 'DB2NT') Or (wSRV = 'DB2400') Then
      Begin
         xSQL2 := 'Select A.USERID, A.GRUPOID, B.MODULOID, B.TIPO, B.OBJETO, B.FORMA, C.GRUPOADM '
            + 'From TGE007 A '
            + 'Left Outer Join TGE001 B ON (A.GRUPOID=B.GRUPOID) '
            + 'Left Outer Join TGE003 C ON (A.GRUPOID=C.GRUPOID) '
            + 'WHERE A.USERID=''' + wUsuario + ''' '
            + 'and B.MODULOID=''' + wModulo + '''';
      End;

      cdsUsuarios.Close;
      cdsUsuarios.DataRequest(xSQL2);
      cdsUsuarios.Open;

      cdsMGrupo.Close;
      cdsMGrupo.DataRequest('Select * from TGE003');
      cdsMGrupo.Open;

      cdsGrupos.Close;
      cdsGrupos.DataRequest('Select * from TGE001');
      cdsGrupos.Open;

//      cdsAcceso.Close;
//      cdsAcceso.DataRequest('Select * from TGE004');
//      cdsAcceso.Open;

      BuscaQry('dspUltTGE', 'oaCONFIG_ANT', '*', '', 'SRV_DB');
      SRV_E := cdsqry.fieldbyname('SRV_EQUIP').AsString;
      SRV_D := cdsqry.fieldbyname('SRV_DB').AsString;
      SRV_V := cdsqry.fieldbyname('SRV_VERS').AsString;
      wAnchoPu := cdsqry.fieldbyname('DECPU_OC').AsInteger;
      wAnchoProv := cdsqry.fieldbyname('NDIG_PROV').AsInteger;
      wAnchoArt := cdsqry.fieldbyname('NDIG_ARTIC').AsInteger;

      wNomAplicacion := 'Facturación';
      wRptCia := cdsqry.fieldbyname('RPTCIA').AsString;
      wRutaRpt := 'RTMS\' + wModulo + '\' + wRptCia;

      If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      Begin
         wFormatFecha := 'YYYY-MM-DD';
         wReplacCeros := 'COALESCE';
         wRepFecServi := 'CURRENT DATE';
         wRepTimeServi := 'CURRENT TIME';
         wRepFuncDate := 'DATE(';
         wRepFuncChar := 'CHAR(';
      End;

      If SRV_D = 'ORACLE' Then
      Begin
         wFormatFecha := 'DD-MM-YYYY';
         wFormatHoras := 'HH:MM:SS';
         wReplacCeros := 'NVL';
         wRepFecServi := 'SYSDATE';
         wRepTimeServi := 'SYSDATE';
         wRepFuncDate := 'TO_DATE(';
         wRepFuncChar := 'TO_CHAR(';
      End;

      wAdmin := cdsUsuarios.fieldbyname('GrupoAdm').AsString;
      wPNatural := BuscaQry('dspUltTGE', 'TGE109', 'TIPPERID', 'TIPPERS=''S''', 'TIPPERID'); //Persona Natural
      wPJuridica := BuscaQry('dspUltTGE', 'TGE109', 'TIPPERID', 'TIPPERS=''N''', 'TIPPERID'); //Persona Juridica
      xWhere := 'TINVENTAS=' + quotedstr('S');
      wTipoInv := BuscaQry('dspUltTGE', 'TGE152', 'TINID,TINVENTAS', xWhere, 'TINID'); //Persona Juridica
      wOfid := BuscaQry('dspUltTGE', 'CXC105', 'UBICAID', 'UBICAFLAG=''O''', 'UBICAID');

      xSQL2 := 'Select * '
         + '  from TGE004 where MODULOID=' + '''' + wModulo + ''''
         + '   and USERID=' + '''' + wUsuario + '''';
      cdsAcceso.Filtered := False;
      cdsAcceso.Filter := '';
      cdsAcceso.IndexFieldNames := '';
      cdsAcceso.Close;
      cdsAcceso.DataRequest(xSQL2);
      cdsAcceso.Open;

      wContGF := 29;
      wAnchoIng := 8;
      xWhere := 'TMon_Loc=' + Quotedstr('E');
      wTMonExt := BuscaQry('dspUltTGE', 'TGE103', '*', xWhere, 'TMONID');
      xWhere := 'TMon_Loc=' + Quotedstr('L');
      wTMonLoc := BuscaQry('dspUltTGE', 'TGE103', '*', xWhere, 'TMONID');
      wBancosFAct := quotedstr('01') + ',' + quotedstr('02');
      wCondCEF := '01';
      wCondCECH := '02';
      wTransVta := BuscaQry('dspUltTGE', 'TGE208', 'TRIID', 'TRIGENFACT=''S''', 'TRIID');
      wTransCons := BuscaQry('dspUltTGE', 'TGE208', 'TRIID', 'TRICONSIG=''S''', 'TRIID');
      wAnchoSal := 8; //Ancho de NISAID de Almacen
      wTdaid := BuscaQry('dspUltTGE', 'TGE157', 'TDAID', 'TDAFLAGV=''S''', 'TDAID');
      wTdaFid := BuscaQry('dspUltTGE', 'TGE157', 'TDAID', 'TDAFACT=''S''', 'TDAID');
      wAnchoGuia := 7;
      wAnchoFact := 7;

      wLineaInd := '02';
      wLineaStanley := '25';
      xBorrar := '0';
      wNIxNC := '22';

      wVtaLocal := BuscaQry('dspUltTGE', 'FAC105', 'TVTAID', 'TVTAFLAG=' + quotedstr('L'), 'TVTAID');
      wVtaProv := BuscaQry('dspUltTGE', 'FAC105', 'TVTAID', 'TVTAFLAG=' + quotedstr('P'), 'TVTAID');
      If cdsQry.RecordCount = 0 Then
         wVtaProv := 'XX';

      wsFact := BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''F''', 'DOCID');
      wsBol := BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''B''', 'DOCID');
      wsGuia := BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''G''', 'DOCID');

      wsChe := BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOC_FREG=''H''', 'DOCID');
      wsAnt := BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOC_FREG=''A''', 'DOCID');
      wsLet := BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOC_FREG=''L''', 'DOCID');
      wsNCre := BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOC_FREG=''N''', 'DOCID');

      wsFactCxC := BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''F''', 'DOCID');
      wsBolCxC := BuscaQry('dspUltTGE', 'TGE110', 'DOCID', 'DOCMOD=''CXC'' AND DOCTIPREG=''B''', 'DOCID');

      wsClie := BuscaQry('dspUltTGE', 'TGE102', 'CLAUXID', 'CLAUXCP=''C''', 'CLAUXID');

      cdsReglas.Close;
      cdsReglas.Open;

      cdsTienda.Close;
      cdsTienda.DataRequest('Select * from DB2ADMIN.FAC_TIENDA ORDER BY TIE_ID');
      cdsTienda.Open;

      BuscaQry('dspUltTGE', 'oaREGLAS', '*', 'VRN_MODULO=''FAC''', 'VRN_MODULO');
      wFil_Asoc := cdsQry.FieldByName('VRN_ASOCIA').AsString;
      wCie_Ant := cdsQry.FieldByName('VRN_CIEOPEANT').AsString;
      wCie_Des := cdsQry.FieldByName('VRN_CIEOPEDES').AsString;
      wSerieNum := cdsQry.FieldByName('VRN_SERIENUM').AsString;
   //	wRutaRpt := 'SOLFormatos\'+wModulo+'\'+wRptCia;
      BuscaQry('dspUltTGE', 'oaREGLAS', '*', 'VRN_MODULO=''ALM''', 'VRN_MODULO');
      wFSerie := cdsQry.FieldByName('VRN_FLAGNSERIE').AsString;

      FVariables.w_Var_sktDCOM := DCOM1;

   End;
   Screen.Cursor := CrDefault;
End;

Function TDMFAC.OperClientDataSet(ClientDataSet: TwwClientDataSet; Expression, Condicion: String): Double;
Var
   cdsClone: TwwClientDataSet;
  //bmk         : TBookmark;
   Agg: TAggregate;
Begin
   result := 0;
   If trim(Expression) = '' Then Exit;
  //  bmk:=ClientDataSet.GetBookmark;
   cdsClone := TwwClientDataSet.Create(Nil);
   Try
      With cdsClone Do
      Begin
         CloneCursor(ClientDataSet, True);
      //Agg := nil;
         Agg := Aggregates.Add;
         Agg.AggregateName := 'OPER';
         Agg.Expression := Expression;
         Agg.Active := True;

         If Trim(Condicion) <> '' Then
         Begin
            Filtered := False;
            Filter := Condicion;
            Filtered := True;
         End;

         If Aggregates.Items[Aggregates.IndexOf('OPER')].Value <> NULL Then
            result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;

         Aggregates.Clear;
      End;
   Finally
      cdsClone.Free;
   End;
End;

///08/03/2001

{ Hacer el control de stock, debido a una aceptacion de una nota de Ingreso }
{OUT: Control de stock, LOG316, cdsStk
 INP: Kardex(detalle de la nota), cdsKDX}
{ Mes es de forma mm}

Procedure TDMFAC.ControlStock(sCIA, sALM, sLOC, sTIN, sArt, Ano, Mes: String; Contenido: Double; IngSal: Char);
Var
   CantidadG, CantidadU: Double;
   PrecioG, PrecioU: Double;
 //KSANTG,STKSANTU					: Double;
   CantidadActG, CantidadActU, MontoActG, MontoActU: Double;
   CntGFName, CntUFName, MntGFName, MntUFName: String;
   SumaResta: Char;
Begin
   PrecioG := 0;
   PrecioU := 0;
   SumaResta := 'S';
   If IngSal = 'S' Then
   Begin
// En el caso de las salidas, los precios se toma del precio de costo promedio del maestro de articulos
      PrecioG := cdsArtiStk.FieldByName('ARTCPROG').AsFloat;
      PrecioU := cdsArtiStk.FieldByName('ARTCPROU').AsFloat;
      SumaResta := 'R';
   End;

   CantidadG := 0;
   CantidadU := 0;
   If wbumg Then
      CantidadG := cdsDetGuia.fieldbyname('GREMCANTAT').AsFloat;
   If wbumu Then
      CantidadU := cdsDetGuia.fieldbyname('GREMCANTAT').AsFloat;

   //STKSANTG   := 0;
   //STKSANTU   := 0;
   CantidadActG := 0;
   CantidadActU := 0;
   MontoActG := 0;
   MontoActU := 0;

   CntGFName := 'STK' + IngSal + 'SG' + Mes;
   CntUFName := 'STK' + IngSal + 'SU' + Mes;
   MntGFName := 'STK' + IngSal + 'MG' + Mes;
   MntUFName := 'STK' + IngSal + 'MU' + Mes;

   cdsSTK.SetKey;
   cdsSTK.fieldbyname('CIAID').AsString := sCIA;
   cdsSTK.fieldbyname('LOCID').AsString := sLOC;
   cdsSTK.fieldbyname('TINID').AsString := sTIN;
   cdsSTK.fieldbyname('ALMID').AsString := sALM;
   cdsSTK.fieldbyname('ARTID').AsString := sART;
   cdsSTK.fieldbyname('STKANO').AsString := ANO;
   If Not cdsSTK.Gotokey Then
      Raise exception.create('No existe el Articulo en el Almacen !!!')
   Else
   Begin
      CantidadActG := cdsSTK.FieldByName(CntGFName).AsFloat; // STKISG03
      CantidadActU := cdsSTK.FieldByName(CntUFName).AsFloat; // STKISU03
      MontoActG := cdsSTK.FieldByName(MntGFName).AsFloat; // STKIMG03
      MontoActU := cdsSTK.FieldByName(MntUFName).AsFloat; // STKIMU03
   End;
   cdsSTK.Edit;

// aqui calcula los totales Ingresos y Salidas de las columnas del mes del LOG316
   ActualizaCantidadMonto(CantidadG, CantidadU, Contenido, 'S', PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU);

   cdsSTK.FieldByName(CntGFName).AsFloat := FRound(CantidadActG, 15, 4);
   cdsSTK.FieldByName(CntUFName).AsFloat := FRound(CantidadActU, 15, 4);
   cdsSTK.FieldByName(MntGFName).AsFloat := FRound(MontoActG, 15, 4);
   cdsSTK.FieldByName(MntUFName).AsFloat := FRound(MontoActU, 15, 4);

// aqui calcula los totales Ingresos y Salidas en general del LOG316
   CantidadActG := cdsSTK.FieldByName('STKSACTG').AsFloat;
   CantidadActU := cdsSTK.FieldByName('STKSACTU').AsFloat;

   ActualizaCantidad(CantidadG, CantidadU, Contenido, SumaResta, CantidadActG, CantidadActU);

   cdsSTK.FieldByName('STKSACTG').AsFloat := FRound(CantidadActG, 15, 4);
   cdsSTK.FieldByName('STKSACTU').AsFloat := FRound(CantidadActU, 15, 4);
   cdsSTK.FieldByName('STKMACTG').AsFloat := FRound(CantidadActG * PrecioU * Contenido, 15, 4);
   cdsSTK.FieldByName('STKMACTU').AsFloat := FRound(CantidadActU * PrecioU, 15, 4);
End;

Procedure TDMFAC.ActualizaCantidad(CantidadG, CantidadU, Contenido: double; SumaResta: Char;
   Var CantidadActG, CantidadActU: Double);
Var
   CantidadUT: Double;
   AcarreoG: Double;
Begin
 // En el caso de resta, inverimos el signo de las cantidades
   If (SumaResta = 'R') Then
   Begin
      CantidadG := -CantidadG;
      CantidadU := -CantidadU;
   End;

   CantidadUT := CantidadActU + CantidadU;
   If SumaResta = 'S' Then
      CocienteResto(CantidadUT, Contenido, AcarreoG, CantidadU)
   Else
      CocienteRestoFalta(CantidadUT, Contenido, AcarreoG, CantidadU);
   CantidadActG := CantidadActG + CantidadG + AcarreoG;
   CantidadActU := CantidadU;
End;

{ Actualiza las cantidades y montos de los articulos a nivel de empresa }
{ INP: Kardex (detalle de la nota), cdsKDX
  OUP: Maestro de Artículo, cdsArt}

Procedure TDMFAC.ActualizaArticulo(sCIA, sArt: String; Contenido: Double; IngSal: Char);
Var
   CantidadActG, CantidadActU, MontoActG, MontoActU: Double;
   CantidadG, CantidadU, PrecioG, PrecioU: Double;
   SumaResta: Char;
Begin
   If (IngSal <> 'S') And (IngSal <> 'I') Then
   Begin
      showMessage('Error en parámetro para actualizar Maestro de Artículos');
      exit;
   End;
   If IngSal = 'S' Then
   Begin
      PrecioG := FRound(cdsArtiStk.FieldByName('ARTCPROG').AsFloat, 15, 4);
      PrecioU := FRound(cdsArtiStk.FieldByName('ARTCPROU').AsFloat, 15, 4);
      SumaResta := 'R';
   End
   Else
   Begin
      PrecioG := cdsKDX.FieldByName('ARTPCG').AsFloat;
      PrecioU := cdsKDX.FieldByName('ARTPCU').AsFloat;
      SumaResta := 'S';
   End;

   CantidadG := 0;
   CantidadU := 0;

   If WbumG Then
      CantidadG := cdsDetGuia.fieldbyname('GREMCANTAT').AsFloat;
   If WbumU Then
      CantidadU := cdsDetGuia.fieldbyname('GREMCANTAT').AsFloat;

   CantidadActG := cdsArtiStk.FieldByName('ARTCNTG').AsFloat;
   CantidadActU := cdsArtiStk.FieldByName('ARTCNTU').AsFloat;
   MontoActG := cdsArtiStk.FieldByName('ARTMNTG').AsFloat;
   MontoActU := cdsArtiStk.FieldByName('ARTMNTU').AsFloat;

   ActualizaCantidadMonto(CantidadG, CantidadU, Contenido, SumaResta, PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU);

   cdsArtiStk.edit;
   cdsArtiStk.FieldByName('ARTCNTG').AsFloat := FRound(CantidadActG, 15, 4);
   cdsArtiStk.FieldByName('ARTCNTU').AsFloat := FRound(CantidadActU, 15, 4);
   cdsArtiStk.FieldByName('ARTMNTG').AsFloat := FRound(MontoActG, 15, 4);
   cdsArtiStk.FieldByName('ARTMNTU').AsFloat := FRound(MontoActU, 15, 4);

   cdsArtiStk.FieldByName('ARTCPROG').AsFloat := FRound(PrecioG, 15, 4);
   cdsArtiStk.FieldByName('ARTCPROU').AsFloat := FRound(PrecioU, 15, 4);

 // if cdsCia.FieldByName('CIAACPRC').AsString = 'S' then
 // begin
   If IngSal = 'I' Then
   Begin
      cdsArtiStk.FieldByName('ARTFUC').AsDateTime := cdsKDX.FieldByName('NISAFREG').AsDateTime;
      If cdsKDX.FieldByName('NISAFREG').AsDateTime > cdsArtiStk.FieldByName('ARTFUPRC').AsDateTime Then
      Begin
         cdsArtiStk.FieldByName('ARTPCG').AsFloat := FRound(cdsKDX.FieldByName('ARTPCG').AsFloat, 15, 4);
         cdsArtiStk.FieldByName('ARTPCU').AsFloat := FRound(cdsKDX.FieldByName('ARTPCU').AsFloat, 15, 4);
         cdsArtiStk.FieldByName('ARTFUPRC').AsDateTime := cdsKDX.FieldByName('NISAFDOC').AsDateTime;
      End;
   End;
   cdsArtiStk.FieldByName('ARTFUMV').AsDateTime := cdsGuia.FieldByName('GREMFECHA').AsDatetime;
 //end;
   cdsArtiStk.post;
End;

Procedure TDMFAC.ActualizaCantidadMonto(CantidadG, CantidadU, Contenido: double; SumaResta: Char;
   Var PrecioG, PrecioU, CantidadActG, CantidadActU, MontoActG, MontoActU: Double);
Var
   CantidadUT: Double;
   AcarreoG, MontoAcarreo: Double;
   xTotalPlata, xCantTotalU: Double;
Begin
// En el caso de resta, invertimos el signo de las cantidades
   If (SumaResta = 'R') Then
   Begin
      CantidadG := -CantidadG;
      CantidadU := -CantidadU;
   End;
   If SumaResta = 'S' Then
   Begin
      xTotalPlata := MontoActG + MontoActU + PrecioG * CantidadG + PrecioU * CantidadU;
      xCantTotalU := CantidadActG * Contenido + CantidadActU + CantidadG * Contenido + CantidadU;
      If xCantTotalU > 0 Then
      Begin
         PrecioU := xTotalPlata / xCantTotalU;
         PrecioU := FRound(PrecioU, 15, 4);
      End;
   End;
   CantidadUT := CantidadActU + CantidadU;
   AcarreoG := 0;
  //MontoAcarreo := 0;
   If SumaResta = 'S' Then
      CocienteResto(CantidadUT, Contenido, AcarreoG, CantidadU)
   Else
   Begin
      CocienteRestoFalta(CantidadUT, Contenido, AcarreoG, CantidadU);
   End;
   MontoAcarreo := AcarreoG * PrecioU * Contenido;
   CantidadActG := CantidadActG + CantidadG + AcarreoG;
   CantidadActU := CantidadU;
   MontoActG := MontoActG + (CantidadG * PrecioG) + MontoAcarreo;
   MontoActU := CantidadU * PrecioU;
   If SumaResta = 'S' Then
      PrecioG := PrecioU * Contenido;
   If Contenido = 1 Then
      PrecioU := 0;
End;

 /////////////////////////////////////////////////////////////////////////
//                                                                     //
//   Actualiza Saldos Inicales Generales y Unitarios de Stock y Monto  //
//                                                								     //
/////////////////////////////////////////////////////////////////////////

Procedure TDMFAC.SaldosIniciales(sCIA, sArt, xAnoMes: String; sContenido, sPrecio: Double);
Var
   xMes: Integer;
   xPrestUniG, xPrestUniU, xPrestPrecio: double;
Begin

   xMes := StrtoInt(copy(xAnoMes, 5, 2));
   If cdsSTK.State In [dsEdit, dsInsert] Then
      cdsSTK.Post;
   cdsstk.Edit; //  SALDOS INICIALES

   If sContenido > 1 Then
   Begin
// Saldos Iniciales de Febrero
      If XMes <= 1 Then
      Begin
         xPrestUniG := 0; // Acarreo a descontar de la cantidad general
         xPrestUniU := 0; // Contenido del artículo a prestar a la cantidad unitaria
         xPrestPrecio := 0; // Precio a considerar en acarreo
         If cdsSTK.FieldByName('STKSSU01').AsFloat >
            (cdsSTK.FieldByName('STKTSU01').AsFloat + cdsSTK.FieldByName('STKISU01').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG02').AsFloat := FRound(cdsSTK.FieldByName('STKTSG01').AsFloat
            + cdsSTK.FieldByName('STKISG01').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG01').AsFloat, 15, 4);

         cdsSTK.FieldByName('STKTSU02').AsFloat := FRound(cdsSTK.FieldByName('STKTSU01').AsFloat
            + cdsSTK.FieldByName('STKISU01').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU01').AsFloat, 15, 4);

         cdsSTK.FieldByName('STKTMG02').AsFloat := FRound(cdsSTK.FieldByName('STKTMG01').AsFloat
            + cdsSTK.FieldByName('STKIMG01').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG01').AsFloat, 15, 4);

         cdsSTK.FieldByName('STKTMU02').AsFloat := FRound(cdsSTK.FieldByName('STKTMU01').AsFloat
            + cdsSTK.FieldByName('STKIMU01').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU01').AsFloat, 15, 4);
      End;
// Saldos Iniciales de Marzo
      If XMes <= 2 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU02').AsFloat >
            (cdsSTK.FieldByName('STKTSU02').AsFloat + cdsSTK.FieldByName('STKISU02').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG03').AsFloat := FRound(cdsSTK.FieldByName('STKTSG02').AsFloat
            + cdsSTK.FieldByName('STKISG02').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG02').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU03').AsFloat := FRound(cdsSTK.FieldByName('STKTSU02').AsFloat
            + cdsSTK.FieldByName('STKISU02').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU02').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG03').AsFloat := FRound(cdsSTK.FieldByName('STKTMG02').AsFloat
            + cdsSTK.FieldByName('STKIMG02').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG02').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU03').AsFloat := FRound(cdsSTK.FieldByName('STKTMU02').AsFloat
            + cdsSTK.FieldByName('STKIMU02').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU02').AsFloat, 15, 4);
      End;
// Saldos Iniciales de Abril
      If XMes <= 3 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU03').AsFloat >
            (cdsSTK.FieldByName('STKTSU03').AsFloat + cdsSTK.FieldByName('STKISU03').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG04').AsFloat := FRound(cdsSTK.FieldByName('STKTSG03').AsFloat
            + cdsSTK.FieldByName('STKISG03').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG03').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU04').AsFloat := FRound(cdsSTK.FieldByName('STKTSU03').AsFloat
            + cdsSTK.FieldByName('STKISU03').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU03').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG04').AsFloat := FRound(cdsSTK.FieldByName('STKTMG03').AsFloat
            + cdsSTK.FieldByName('STKIMG03').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG03').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU04').AsFloat := FRound(cdsSTK.FieldByName('STKTMU03').AsFloat
            + cdsSTK.FieldByName('STKIMU03').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU03').AsFloat, 15, 4);
      End;
// Saldos Iniciales de Mayo
      If XMes <= 4 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU04').AsFloat >
            (cdsSTK.FieldByName('STKTSU04').AsFloat + cdsSTK.FieldByName('STKISU04').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG05').AsFloat := FRound(cdsSTK.FieldByName('STKTSG04').AsFloat
            + cdsSTK.FieldByName('STKISG04').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG04').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU05').AsFloat := FRound(cdsSTK.FieldByName('STKTSU04').AsFloat
            + cdsSTK.FieldByName('STKISU04').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU04').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG05').AsFloat := FRound(cdsSTK.FieldByName('STKTMG04').AsFloat
            + cdsSTK.FieldByName('STKIMG04').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG04').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU05').AsFloat := FRound(cdsSTK.FieldByName('STKTMU04').AsFloat
            + cdsSTK.FieldByName('STKIMU04').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU04').AsFloat, 15, 4);
      End;
// Saldos Iniciales de Junio
      If XMes <= 5 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU05').AsFloat >
            (cdsSTK.FieldByName('STKTSU05').AsFloat + cdsSTK.FieldByName('STKISU05').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG06').AsFloat := FRound(cdsSTK.FieldByName('STKTSG05').AsFloat
            + cdsSTK.FieldByName('STKISG05').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG05').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU06').AsFloat := FRound(cdsSTK.FieldByName('STKTSU05').AsFloat
            + cdsSTK.FieldByName('STKISU05').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU05').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG06').AsFloat := FRound(cdsSTK.FieldByName('STKTMG05').AsFloat
            + cdsSTK.FieldByName('STKIMG05').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG05').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU06').AsFloat := FRound(cdsSTK.FieldByName('STKTMU05').AsFloat
            + cdsSTK.FieldByName('STKIMU05').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU05').AsFloat, 15, 4);
      End;
// Saldos Iniciales de Julio
      If XMes <= 6 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU06').AsFloat >
            (cdsSTK.FieldByName('STKTSU06').AsFloat + cdsSTK.FieldByName('STKISU06').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG07').AsFloat := FRound(cdsSTK.FieldByName('STKTSG06').AsFloat
            + cdsSTK.FieldByName('STKISG06').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG06').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU07').AsFloat := FRound(cdsSTK.FieldByName('STKTSU06').AsFloat
            + cdsSTK.FieldByName('STKISU06').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU06').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG07').AsFloat := FRound(cdsSTK.FieldByName('STKTMG06').AsFloat
            + cdsSTK.FieldByName('STKIMG06').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG06').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU07').AsFloat := FRound(cdsSTK.FieldByName('STKTMU06').AsFloat
            + cdsSTK.FieldByName('STKIMU06').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU06').AsFloat, 15, 4);
      End;
// Saldos Iniciales de Agosto
      If XMes <= 7 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU07').AsFloat >
            (cdsSTK.FieldByName('STKTSU07').AsFloat + cdsSTK.FieldByName('STKISU07').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG08').AsFloat := FRound(cdsSTK.FieldByName('STKTSG07').AsFloat
            + cdsSTK.FieldByName('STKISG07').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG07').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU08').AsFloat := FRound(cdsSTK.FieldByName('STKTSU07').AsFloat
            + cdsSTK.FieldByName('STKISU07').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU07').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG08').AsFloat := FRound(cdsSTK.FieldByName('STKTMG07').AsFloat
            + cdsSTK.FieldByName('STKIMG07').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG07').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU08').AsFloat := FRound(cdsSTK.FieldByName('STKTMU07').AsFloat
            + cdsSTK.FieldByName('STKIMU07').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU07').AsFloat, 15, 4);
      End;
// Saldos Iniciales de Setiembre
      If XMes <= 8 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU08').AsFloat >
            (cdsSTK.FieldByName('STKTSU08').AsFloat + cdsSTK.FieldByName('STKISU08').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG09').AsFloat := FRound(cdsSTK.FieldByName('STKTSG08').AsFloat
            + cdsSTK.FieldByName('STKISG08').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG08').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU09').AsFloat := FRound(cdsSTK.FieldByName('STKTSU08').AsFloat
            + cdsSTK.FieldByName('STKISU08').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU08').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG09').AsFloat := FRound(cdsSTK.FieldByName('STKTMG08').AsFloat
            + cdsSTK.FieldByName('STKIMG08').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG08').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU09').AsFloat := FRound(cdsSTK.FieldByName('STKTMU08').AsFloat
            + cdsSTK.FieldByName('STKIMU08').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU08').AsFloat, 15, 4);
      End;
// Saldos Iniciales de Octubre
      If XMes <= 9 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU09').AsFloat >
            (cdsSTK.FieldByName('STKTSU09').AsFloat + cdsSTK.FieldByName('STKISU09').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG10').AsFloat := FRound(cdsSTK.FieldByName('STKTSG09').AsFloat
            + cdsSTK.FieldByName('STKISG09').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG09').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU10').AsFloat := FRound(cdsSTK.FieldByName('STKTSU09').AsFloat
            + cdsSTK.FieldByName('STKISU09').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU09').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG10').AsFloat := FRound(cdsSTK.FieldByName('STKTMG09').AsFloat
            + cdsSTK.FieldByName('STKIMG09').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG09').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU10').AsFloat := FRound(cdsSTK.FieldByName('STKTMU09').AsFloat
            + cdsSTK.FieldByName('STKIMU09').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU09').AsFloat, 15, 4);
      End;
// Saldos Iniciales de Noviembre
      If XMes < 10 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU10').AsFloat >
            (cdsSTK.FieldByName('STKTSU10').AsFloat + cdsSTK.FieldByName('STKISU10').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG11').AsFloat := FRound(cdsSTK.FieldByName('STKTSG10').AsFloat
            + cdsSTK.FieldByName('STKISG10').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG10').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU11').AsFloat := FRound(cdsSTK.FieldByName('STKTSU10').AsFloat
            + cdsSTK.FieldByName('STKISU10').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU10').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG11').AsFloat := FRound(cdsSTK.FieldByName('STKTMG10').AsFloat
            + cdsSTK.FieldByName('STKIMG10').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG10').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU11').AsFloat := FRound(cdsSTK.FieldByName('STKTMU10').AsFloat
            + cdsSTK.FieldByName('STKIMU10').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU10').AsFloat, 15, 4);
      End;
// Saldos Iniciales de Diciembre
      If XMes <= 11 Then
      Begin
         xPrestUniG := 0;
         xPrestUniU := 0;
         xPrestPrecio := 0;
         If cdsSTK.FieldByName('STKSSU11').AsFloat >
            (cdsSTK.FieldByName('STKTSU11').AsFloat + cdsSTK.FieldByName('STKISU11').AsFloat) Then
         Begin
            xPrestUniG := 1;
            xPrestUniU := sContenido;
            xPrestPrecio := sPrecio;
         End;
         cdsSTK.FieldByName('STKTSG12').AsFloat := FRound(cdsSTK.FieldByName('STKTSG11').AsFloat
            + cdsSTK.FieldByName('STKISG11').AsFloat - xPrestUniG // otorga acarreo
            - cdsSTK.FieldByName('STKSSG11').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTSU12').AsFloat := FRound(cdsSTK.FieldByName('STKTSU11').AsFloat
            + cdsSTK.FieldByName('STKISU11').AsFloat + xPrestUniU // recibe acarreo
            - cdsSTK.FieldByName('STKSSU11').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMG12').AsFloat := FRound(cdsSTK.FieldByName('STKTMG11').AsFloat
            + cdsSTK.FieldByName('STKIMG11').AsFloat - xPrestPrecio // otorga acarreo
            - cdsSTK.FieldByName('STKSMG11').AsFloat, 15, 4);
         cdsSTK.FieldByName('STKTMU12').AsFloat := FRound(cdsSTK.FieldByName('STKTMU11').AsFloat
            + cdsSTK.FieldByName('STKIMU11').AsFloat + xPrestPrecio // recibe acarreo
            - cdsSTK.FieldByName('STKSMU11').AsFloat, 15, 4);
      End;
   End
   Else
   Begin // si el contenido del artículo ARTCONT=1
      cdsSTK.FieldByName('STKTSG02').AsFloat := FRound(cdsSTK.FieldByName('STKTSG01').AsFloat
         + cdsSTK.FieldByName('STKISG01').AsFloat
         - cdsSTK.FieldByName('STKSSG01').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG02').AsFloat := FRound(cdsSTK.FieldByName('STKTMG01').AsFloat
         + cdsSTK.FieldByName('STKIMG01').AsFloat
         - cdsSTK.FieldByName('STKSMG01').AsFloat, 15, 4);

      cdsSTK.FieldByName('STKTSG03').AsFloat := FRound(cdsSTK.FieldByName('STKTSG02').AsFloat
         + cdsSTK.FieldByName('STKISG02').AsFloat
         - cdsSTK.FieldByName('STKSSG02').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG03').AsFloat := FRound(cdsSTK.FieldByName('STKTMG02').AsFloat
         + cdsSTK.FieldByName('STKIMG02').AsFloat
         - cdsSTK.FieldByName('STKSMG02').AsFloat, 15, 4);

      cdsSTK.FieldByName('STKTSG04').AsFloat := FRound(cdsSTK.FieldByName('STKTSG03').AsFloat
         + cdsSTK.FieldByName('STKISG03').AsFloat
         - cdsSTK.FieldByName('STKSSG03').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG04').AsFloat := FRound(cdsSTK.FieldByName('STKTMG03').AsFloat
         + cdsSTK.FieldByName('STKIMG03').AsFloat
         - cdsSTK.FieldByName('STKSMG03').AsFloat, 15, 4);

      cdsSTK.FieldByName('STKTSG05').AsFloat := FRound(cdsSTK.FieldByName('STKTSG04').AsFloat
         + cdsSTK.FieldByName('STKISG04').AsFloat
         - cdsSTK.FieldByName('STKSSG04').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG05').AsFloat := FRound(cdsSTK.FieldByName('STKTMG04').AsFloat
         + cdsSTK.FieldByName('STKIMG04').AsFloat
         - cdsSTK.FieldByName('STKSMG04').AsFloat, 15, 4);

      cdsSTK.FieldByName('STKTSG06').AsFloat := FRound(cdsSTK.FieldByName('STKTSG05').AsFloat
         + cdsSTK.FieldByName('STKISG05').AsFloat
         - cdsSTK.FieldByName('STKSSG05').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG06').AsFloat := FRound(cdsSTK.FieldByName('STKTMG05').AsFloat
         + cdsSTK.FieldByName('STKIMG05').AsFloat
         - cdsSTK.FieldByName('STKSMG05').AsFloat, 15, 4);

      cdsSTK.FieldByName('STKTSG07').AsFloat := FRound(cdsSTK.FieldByName('STKTSG06').AsFloat
         + cdsSTK.FieldByName('STKISG06').AsFloat
         - cdsSTK.FieldByName('STKSSG06').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG07').AsFloat := FRound(cdsSTK.FieldByName('STKTMG06').AsFloat
         + cdsSTK.FieldByName('STKIMG06').AsFloat
         - cdsSTK.FieldByName('STKSMG06').AsFloat, 15, 4);

      cdsSTK.FieldByName('STKTSG08').AsFloat := FRound(cdsSTK.FieldByName('STKTSG07').AsFloat
         + cdsSTK.FieldByName('STKISG07').AsFloat
         - cdsSTK.FieldByName('STKSSG07').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG08').AsFloat := FRound(cdsSTK.FieldByName('STKTMG07').AsFloat
         + cdsSTK.FieldByName('STKIMG07').AsFloat
         - cdsSTK.FieldByName('STKSMG07').AsFloat, 15, 4);

      cdsSTK.FieldByName('STKTSG09').AsFloat := FRound(cdsSTK.FieldByName('STKTSG08').AsFloat
         + cdsSTK.FieldByName('STKISG08').AsFloat
         - cdsSTK.FieldByName('STKSSG08').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG09').AsFloat := FRound(cdsSTK.FieldByName('STKTMG08').AsFloat
         + cdsSTK.FieldByName('STKIMG08').AsFloat
         - cdsSTK.FieldByName('STKSMG08').AsFloat, 15, 4);

      cdsSTK.FieldByName('STKTSG10').AsFloat := FRound(cdsSTK.FieldByName('STKTSG09').AsFloat
         + cdsSTK.FieldByName('STKISG09').AsFloat
         - cdsSTK.FieldByName('STKSSG09').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG10').AsFloat := FRound(cdsSTK.FieldByName('STKTMG09').AsFloat
         + cdsSTK.FieldByName('STKIMG09').AsFloat
         - cdsSTK.FieldByName('STKSMG09').AsFloat, 15, 4);

      cdsSTK.FieldByName('STKTSG11').AsFloat := FRound(cdsSTK.FieldByName('STKTSG10').AsFloat
         + cdsSTK.FieldByName('STKISG10').AsFloat
         - cdsSTK.FieldByName('STKSSG10').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG11').AsFloat := FRound(cdsSTK.FieldByName('STKTMG10').AsFloat
         + cdsSTK.FieldByName('STKIMG10').AsFloat
         - cdsSTK.FieldByName('STKSMG10').AsFloat, 15, 4);

      cdsSTK.FieldByName('STKTSG12').AsFloat := FRound(cdsSTK.FieldByName('STKTSG11').AsFloat
         + cdsSTK.FieldByName('STKISG11').AsFloat
         - cdsSTK.FieldByName('STKSSG11').AsFloat, 15, 4);
      cdsSTK.FieldByName('STKTMG12').AsFloat := FRound(cdsSTK.FieldByName('STKTMG11').AsFloat
         + cdsSTK.FieldByName('STKIMG11').AsFloat
         - cdsSTK.FieldByName('STKSMG11').AsFloat, 15, 4);

   End;
   cdsstk.Post; //  SALDOS INICIALES
End;

// Hacer la operacion de Num1/Num2, y devuelve el cociente y el resto

Procedure TDMFAC.CocienteResto(Num1, Num2: double; Var Cociente, Resto: double);
Begin
   Cociente := 0;
   Resto := 0;
   While (Num1 >= Num2) Do
   Begin
      If Num2 = 0 Then exit;
      Cociente := Cociente + 1;
      Num1 := Num1 - Num2;
   End;
   Resto := Num1;
End;

{
// Falta Num1 unidades, Num1 es un numero con signo, negativo indica falta
 ejm: Num1 = -3 , Num2 = 12
 ==> -3 = (-1)*12 + 9, Cociente = -1 Resto = 9
 ejm: Num1 = -25, Num2 = 12
  ==> -25 = (-3)*12 + 11, Cociente = -3, Resto = 11
}

Procedure TDMFAC.CocienteRestoFalta(Num1, Num2: double; Var Cociente, Resto: double);
Begin
   Cociente := 0;
   Resto := 0;
   While (Num1 < 0) Do
   Begin
      Cociente := Cociente - 1;
      Num1 := NUm1 + Num2;
   End;
   Resto := Num1;
End;

Procedure TDMFAC.SaldosAuxiliar(xxCia, xxAnoMes, xxClAux, xxAux, xxSigno: String;
   xxImpMN, xxImpME: Double; xxtmonid: String);
Var
   xxAno, xxMes, xSQL: String;
  //xxSaldo01, xxSaldo02, xxSaldo03, xxSaldo04, xxSaldo05, xxSaldo06 : String;
  //xxSaldo07, xxSaldo08, xxSaldo09, xxSaldo10, xxSaldo11, xxSaldo12 : String;
   xxTotMN, xxTotME, xxToSMN, xxToSME: Double;
  //**03/01/2001 pjsv
   iX: integer;
   ssql, xmes: String;
  //**
Begin
   xxAno := Copy(xxAnoMes, 1, 4);
   xxMes := Copy(xxAnoMes, 5, 2);
   xSQL := '';
   xSQL := 'Select * from TGE401 where '
      + 'CIAID=' + '''' + xxCia + '''' + ' and '
      + 'ANO=' + '''' + xxAno + '''' + ' and '
      + 'CLAUXID=' + '''' + xxClAux + '''' + ' and '
      + 'AUXID=' + '''' + xxAux + '''';
   xSQL := UpperCase(xSQL);
   cdsQry.Close;
   cdsQry.ProviderName := 'dspUltTGE';
   cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      xSQL := 'Insert into TGE401(CIAID,ANO,CLAUXID,AUXID';
      If (xxSigno = '+') Or (xxSigno = '=') Then
      Begin
         xSQL := xSQL + ', DEBETMN' + xxMes + ', DEBETME' + xxMes;
         If xxtmonid = wTMonLoc Then
            xSQL := xSQL + ', DEBESMN' + xxMes;
         If xxtmonid = wTMonExt Then
            xSQL := xSQL + ', DEBESME' + xxMes;
      End;
      If (xxSigno = '-') Or (xxSigno = '=') Then
      Begin
         xSQL := xSQL + ', HABETMN' + xxMes + ', HABETME' + xxMes;
         If xxtmonid = wTMonLoc Then
            xSQL := xSQL + ', HABESMN' + xxMes;
         If xxtmonid = wTMonExt Then
            xSQL := xSQL + ', HABESME' + xxMes;
      End;
      xSQL := xSQL + ') Values (' + '''' + xxCia + '''' + ',' + '''' + xxAno + '''' + ','
         + '''' + xxClAux + '''' + ',' + '''' + xxAux + '''';
      xSQL := xSQL + ', ' + FloatToStr(xxImpMN) + ', ' + FloatToStr(xxImpME);
      If xxtmonid = wTMonLoc Then
         xSQL := xSQL + ', ' + FloatToStr(xxImpMN);
      If xxtmonid = wTMonExt Then
         xSQL := xSQL + ', ' + FloatToStr(xxImpME);

      If xxSigno = '=' Then
      Begin
         xSQL := xSQL + ', ' + FloatToStr(xxImpMN) + ', ' + FloatToStr(xxImpME);
         If xxtmonid = wTMonLoc Then
            xSQL := xSQL + ', ' + FloatToStr(xxImpMN);
         If xxtmonid = wTMonExt Then
            xSQL := xSQL + ', ' + FloatToStr(xxImpME);
      End;
      xSQL := UpperCase(xSQL + ' ) ');
      DCOM1.AppServer.EjecutaSQL(xSQL);
   End
   Else
   Begin
  //** 15/02/2001 - pjsv, se quita porque duplicaba los montos
  //xxTotMN:= cdsQry.FieldByName('DEBETMN'+xxMes).AsFloat + xxImpMN;
  //xxTotME:= cdsQry.FieldByName('DEBETME'+xxMes).AsFloat + xxImpME;
  //xxToSMN:= cdsQry.FieldByName('DEBESMN'+xxMes).AsFloat + xxImpMN;
  //xxToSME:= cdsQry.FieldByName('DEBESME'+xxMes).AsFloat + xxImpME;
      xxTotMN := xxImpMN;
      xxTotME := xxImpME;
      xxToSMN := xxImpMN;
      xxToSME := xxImpME;
  //**

      xSQL := 'Update TGE401 Set ';
      If (xxSigno = '+') Or (xxSigno = '=') Then
      Begin
         xSQL := xSQL + '  DEBETMN' + xxMes + '=' + wReplacCeros + '(DEBETMN' + xxMes + ' ,0)+ ' + FloatToStr(xxTotMN);
         xSQL := xSQL + ', DEBETME' + xxMes + '=' + wReplacCeros + '(DEBETME' + xxMes + ' ,0)+ ' + FloatToStr(xxTotME);
         If xxtmonid = wTMonLoc Then
            xSQL := xSQL + ', DEBESMN' + xxMes + '=' + wReplacCeros + '(DEBESMN' + xxMes + ' ,0)+ ' + FloatToStr(xxToSMN);
         If xxtmonid = wTMonExt Then
            xSQL := xSQL + ', DEBESME' + xxMes + '=' + wReplacCeros + '(DEBESME' + xxMes + ' ,0)+ ' + FloatToStr(xxToSME);
      End;

      If (xxSigno = '-') Or (xxSigno = '=') Then
      Begin
         If xxSigno = '=' Then
            xSQL := xSQL + ',';
         xSQL := xSQL + '  HABETMN' + xxMes + '=' + wReplacCeros + '(HABETMN' + xxMes + ' ,0)+ ' + FloatToStr(xxTotMN);
         xSQL := xSQL + ', HABETME' + xxMes + '=' + wReplacCeros + '(HABETME' + xxMes + ' ,0)+ ' + FloatToStr(xxTotME);
         If xxtmonid = wTMonLoc Then
            xSQL := xSQL + ', HABESMN' + xxMes + '=' + wReplacCeros + '(HABESMN' + xxMes + ' ,0)+ ' + FloatToStr(xxToSMN);
         If xxtmonid = wTMonExt Then
            xSQL := xSQL + ', HABESME' + xxMes + '=' + wReplacCeros + '(HABESME' + xxMes + ' ,0)+ ' + FloatToStr(xxToSME);
      End;
      xSQL := xSQL + ' Where CIAID=' + '''' + xxCia + '''' + ' and '
         + 'ANO=' + '''' + xxAno + '''' + ' and '
         + 'CLAUXID=' + '''' + xxClAux + '''' + ' and '
         + 'AUXID=' + '''' + xxAux + '''';
      xSQL := UpperCase(xSQL);
      DCOM1.AppServer.EjecutaSQL(xSQL);
   End;
//////////////////////////////////////
//                                  //
//   Actualiza DebeTMN y HaberTME   //
//                                  //
//////////////////////////////////////
   xSQL := 'Update TGE401 Set ';
   sSQL := ' Where CIAID=' + '''' + xxCia + '''' + ' and '
      + 'ANO=' + '''' + xxAno + '''' + ' and '
      + 'CLAUXID=' + '''' + xxClAux + '''' + ' and '
      + 'AUXID=' + '''' + xxAux + '''';
  //** 03/01/2001 - pjsv
   For iX := 0 To 13 Do
   Begin
      If iX = 0 Then
      Begin
         xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX), 2);
         xSQL := xSQL + 'SaldTMN' + xmes + '=' +
            '(' + wReplacCeros + '(SaldTMN' + xmes + ',0)+' + wReplacCeros + '(DebeTMN' + xmes + ',0)-' + wReplacCeros + '(HabeTMN' + xmes + ',0) )';
         xSQL := UpperCase(xSQL + ssql);
         DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
      If iX > 0 Then
      Begin
         xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX), 2);
         xSQL := xSQL + 'SaldTMN' + xmes + '=';
         xmes := strzero(IntToStr(iX - 1), 2);
         xSQL := xSQL + '(' + wReplacCeros + '(SaldTMN' + xmes + ',0)';
         xmes := strzero(IntToStr(iX), 2);
         xSQL := xSQL + '+ ' + wReplacCeros + '(DebeTMN' + xmes + ',0)-' + wReplacCeros + '(HabeTMN' + xmes + ',0) )';
         xSQL := UpperCase(xSQL + ssql);
         DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
   End;
   For iX := 0 To 13 Do
   Begin
      If iX = 0 Then
      Begin
         xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX), 2);
         xSQL := xSQL + 'SaldTME' + xmes + '=' +
            '(' + wReplacCeros + '(SaldTME' + xmes + ',0)+' + wReplacCeros + '(DebeTME' + xmes + ',0)-' + wReplacCeros + '(HabeTME' + xmes + ',0) )';
         xSQL := UpperCase(xSQL + ssql);
         DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
      If iX > 0 Then
      Begin
         xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX), 2);
         xSQL := xSQL + 'SaldTME' + xmes + '=';
         xmes := strzero(IntToStr(iX - 1), 2);
         xSQL := xSQL + '(' + wReplacCeros + '(SaldTME' + xmes + ',0)';
         xmes := strzero(IntToStr(iX), 2);
         xSQL := xSQL + '+ ' + wReplacCeros + '(DebeTME' + xmes + ',0)-' + wReplacCeros + '(HabeTME' + xmes + ',0) )';
         xSQL := UpperCase(xSQL + ssql);
         DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
   End;
  //**
//////////////////////////////////////
//                                  //
//   Actualiza DebeSMN y HaberSME   //
//                                  //
//////////////////////////////////////
  //** 03/01/2001 - pjsv
   For iX := 0 To 13 Do
   Begin
      If iX = 0 Then
      Begin
         xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX), 2);
         xSQL := xSQL + 'SaldSMN' + xmes + '=' +
            '(' + wReplacCeros + '(SaldSMN' + xmes + ',0)+' + wReplacCeros + '(DebeSMN' + xmes + ',0)-' + wReplacCeros + '(HabeSMN' + xmes + ',0) )';
         xSQL := UpperCase(xSQL + ssql);
         DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
      If iX > 0 Then
      Begin
         xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX), 2);
         xSQL := xSQL + 'SaldSMN' + xmes + '=';
         xmes := strzero(
            IntToStr(iX - 1), 2);
         xSQL := xSQL + '(' + wReplacCeros + '(SaldSMN' + xmes + ',0)';
         xmes := strzero(IntToStr(iX), 2);
         xSQL := xSQL + '+ ' + wReplacCeros + '(DebeSMN' + xmes + ',0)-' + wReplacCeros + '(HabeSMN' + xmes + ',0) )';
         xSQL := UpperCase(xSQL + ssql);
         DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
   End;
   For iX := 0 To 13 Do
   Begin
      If iX = 0 Then
      Begin
         xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX), 2);
         xSQL := xSQL + 'SaldSME' + xmes + '=' +
            '(' + wReplacCeros + '(SaldSME' + xmes + ',0)+' + wReplacCeros + '(DebeSME' + xmes + ',0)-' + wReplacCeros + '(HabeSME' + xmes + ',0) )';
         xSQL := UpperCase(xSQL + ssql);
         DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
      If iX > 0 Then
      Begin
         xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX), 2);
         xSQL := xSQL + 'SaldSME' + xmes + '=';
         xmes := strzero(IntToStr(iX - 1), 2);
         xSQL := xSQL + '(' + wReplacCeros + '(SaldSME' + xmes + ',0)';
         xmes := strzero(IntToStr(iX), 2);
         xSQL := xSQL + '+ ' + wReplacCeros + '(DebeSME' + xmes + ',0)-' + wReplacCeros + '(HabeSME' + xmes + ',0) )';
         xSQL := UpperCase(xSQL + ssql);
         DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
   End;
  //**
End;

Procedure TDMFAC.SaldosAuxiliarCLG(xxCia, xxAnoMes, xxClAux, xxAux, xxSigno: String; xxImpMN, xxImpME: Double; xxtmonid: String);
Var
   xxAno, xxMes, xSQL: String;
 //xxSaldo01, xxSaldo02, xxSaldo03, xxSaldo04, xxSaldo05, xxSaldo06 : String;
 //xxSaldo07, xxSaldo08, xxSaldo09, xxSaldo10, xxSaldo11, xxSaldo12 : String;
   xxTotMN, xxTotME, xxToSMN, xxToSME: Double;
 //**03/01/2001 pjsv
   iX: integer;
   ssql, xmes, sSQL1, sSQL2, sSQL3, sSQL4: String;
 //**
Begin
   xxAno := Copy(xxAnoMes, 1, 4);
   xxMes := Copy(xxAnoMes, 5, 2);
   xSQL := '';
   sSQL1 := '';
   sSQL2 := '';
   sSQL3 := '';
   sSQL4 := '';
 //CLG  *
   xSQL := 'SELECT CIAID FROM TGE401 WHERE '
      + 'CIAID=' + Quotedstr(xxCia)
      + ' AND ANO=' + Quotedstr(xxAno)
      + ' AND CLAUXID=' + Quotedstr(xxClAux)
      + ' AND AUXID=' + Quotedstr(xxAux);
   xSQL := UpperCase(xSQL);
   cdsQry.Close;
   cdsQry.ProviderName := 'dspUltTGE';
   cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      xSQL := '';
      xSQL := 'INSERT INTO TGE401(CIAID,ANO,CLAUXID,AUXID';
      If (xxSigno = '+') Or (xxSigno = '=') Then
      Begin
         xSQL := xSQL + ', DEBETMN' + xxMes + ', DEBETME' + xxMes;
         If xxtmonid = wTMonLoc Then
            xSQL := xSQL + ', DEBESMN' + xxMes;
         If xxtmonid = wTMonExt Then
            xSQL := xSQL + ', DEBESME' + xxMes;
      End;
      If (xxSigno = '-') Or (xxSigno = '=') Then
      Begin
         xSQL := xSQL + ', HABETMN' + xxMes + ', HABETME' + xxMes;
         If xxtmonid = wTMonLoc Then
            xSQL := xSQL + ', HABESMN' + xxMes;
         If xxtmonid = wTMonExt Then
            xSQL := xSQL + ', HABESME' + xxMes;
      End;

      If Length(Trim(xCiaEnviar)) > 0 Then
         xSQL := xSQL + ') VALUES (' + Quotedstr(xCiaEnviar) + ', ' + Quotedstr(xxAno) + ', ' + Quotedstr(xxClAux) + ',' + Quotedstr(xxAux)
      Else
         xSQL := xSQL + ') VALUES (' + Quotedstr(xxCia) + ', ' + Quotedstr(xxAno) + ', ' + Quotedstr(xxClAux) + ',' + Quotedstr(xxAux);

      xSQL := xSQL + ', ' + FloatToStr(xxImpMN) + ', ' + FloatToStr(xxImpME);
      If xxtmonid = wTMonLoc Then
         xSQL := xSQL + ', ' + FloatToStr(xxImpMN);
      If xxtmonid = wTMonExt Then
         xSQL := xSQL + ', ' + FloatToStr(xxImpME);

      If xxSigno = '=' Then
      Begin
         xSQL := xSQL + ', ' + FloatToStr(xxImpMN) + ', ' + FloatToStr(xxImpME);
         If xxtmonid = wTMonLoc Then
            xSQL := xSQL + ', ' + FloatToStr(xxImpMN);
         If xxtmonid = wTMonExt Then
            xSQL := xSQL + ', ' + FloatToStr(xxImpME);
      End;
      xSQL := UpperCase(xSQL + ' ) ');
      DCOM1.AppServer.EjecutaSQL(xSQL);
   End
   Else
   Begin
  //** 15/02/2001 - pjsv, se quita porque duplicaba los montos
  //xxTotMN:= cdsQry.FieldByName('DEBETMN'+xxMes).AsFloat + xxImpMN;
  //xxTotME:= cdsQry.FieldByName('DEBETME'+xxMes).AsFloat + xxImpME;
  //xxToSMN:= cdsQry.FieldByName('DEBESMN'+xxMes).AsFloat + xxImpMN;
  //xxToSME:= cdsQry.FieldByName('DEBESME'+xxMes).AsFloat + xxImpME;
      xxTotMN := xxImpMN;
      xxTotME := xxImpME;
      xxToSMN := xxImpMN;
      xxToSME := xxImpME;
  //**

      xSQL := 'UPDATE TGE401 SET ';
      If (xxSigno = '+') Or (xxSigno = '=') Then
      Begin
         xSQL := xSQL + '  DEBETMN' + xxMes + '=' + wReplacCeros + '(DEBETMN' + xxMes + ' ,0)+ ' + FloatToStr(xxTotMN);
         xSQL := xSQL + ', DEBETME' + xxMes + '=' + wReplacCeros + '(DEBETME' + xxMes + ' ,0)+ ' + FloatToStr(xxTotME);
         If xxtmonid = wTMonLoc Then
            xSQL := xSQL + ', DEBESMN' + xxMes + '=' + wReplacCeros + '(DEBESMN' + xxMes + ' ,0)+ ' + FloatToStr(xxToSMN);
         If xxtmonid = wTMonExt Then
            xSQL := xSQL + ', DEBESME' + xxMes + '=' + wReplacCeros + '(DEBESME' + xxMes + ' ,0)+ ' + FloatToStr(xxToSME);
      End;

      If (xxSigno = '-') Or (xxSigno = '=') Then
      Begin
         If xxSigno = '=' Then
            xSQL := xSQL + ',';
         xSQL := xSQL + '  HABETMN' + xxMes + '=' + wReplacCeros + '(HABETMN' + xxMes + ' ,0)+ ' + FloatToStr(xxTotMN);
         xSQL := xSQL + ', HABETME' + xxMes + '=' + wReplacCeros + '(HABETME' + xxMes + ' ,0)+ ' + FloatToStr(xxTotME);
         If xxtmonid = wTMonLoc Then
            xSQL := xSQL + ', HABESMN' + xxMes + '=' + wReplacCeros + '(HABESMN' + xxMes + ' ,0)+ ' + FloatToStr(xxToSMN);
         If xxtmonid = wTMonExt Then
            xSQL := xSQL + ', HABESME' + xxMes + '=' + wReplacCeros + '(HABESME' + xxMes + ' ,0)+ ' + FloatToStr(xxToSME);
      End;

      If Length(Trim(xCiaEnviar)) > 0 Then
         xxCia := xCiaEnviar
      Else
         xxCia := xxCia;

      xSQL := xSQL + ' WHERE CIAID=' + '''' + xxCia + '''' + ' and '
         + 'ANO=' + '''' + xxAno + '''' + ' and '
         + 'CLAUXID=' + '''' + xxClAux + '''' + ' and '
         + 'AUXID=' + '''' + xxAux + '''';
      xSQL := UpperCase(xSQL);

      Try
         DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ControlTran(1, Nil, '');
      End;

   End;
//////////////////////////////////////
//                                  //
//   Actualiza DebeTMN y HaberTME   //
//                                  //
//////////////////////////////////////
   xSQL := 'Update TGE401 Set ';
   sSQL := ' Where CIAID=' + Quotedstr(xxCia)
      + ' AND ANO=' + Quotedstr(xxAno)
      + 'AND CLAUXID=' + Quotedstr(xxClAux)
      + 'AND AUXID=' + Quotedstr(xxAux);

   xSQL := ' UPDATE TGE401 SET ';

   For iX := 0 To 13 Do
   Begin
      xMes := strzero(IntToStr(iX), 2);

      If iX = 0 Then
      Begin
         sSQL1 := sSQL1 + '(' + wReplacCeros + '(SALDTMN' + xmes + ',0)+' + wReplacCeros + '(DEBETMN' + xmes + ',0)-' + wReplacCeros + '(HABETMN' + xmes + ',0) ) ';
         xSQL := xSQL + ' SALDTMN' + xmes + '=' + sSQL1 + ',';

         sSQL2 := sSQL2 + '(' + wReplacCeros + '(SALDTME' + xmes + ',0)+' + wReplacCeros + '(DEBETME' + xmes + ',0)-' + wReplacCeros + '(HABETME' + xmes + ',0) ) ';
         xSQL := xSQL + ' SALDTME' + xmes + '=' + sSQL2 + ',';

         sSQL3 := sSQL3 + '(' + wReplacCeros + '(SALDSMN' + xmes + ',0)+' + wReplacCeros + '(DEBESMN' + xmes + ',0)-' + wReplacCeros + '(HABESMN' + xmes + ',0) ) ';
         xSQL := xSQL + ' SALDSMN' + xmes + '=' + sSQL3 + ',';

         sSQL4 := sSQL4 + '(' + wReplacCeros + '(SALDSME' + xmes + ',0)+' + wReplacCeros + '(DEBESME' + xmes + ',0)-' + wReplacCeros + '(HABESME' + xmes + ',0) ) ';
         xSQL := xSQL + ' SALDSME' + xmes + '=' + sSQL4;
      End
      Else
      Begin
  //xMesA := strzero(IntToStr(iX-1),2);
         sSQL1 := sSQL1 + '+ ' + wReplacCeros + '(DEBETMN' + xmes + ',0)-' + wReplacCeros + '(HABETMN' + xmes + ',0)';
         xSQL := xSQL + ' ,SALDTMN' + xmes + '=' + sSQL1;

         sSQL2 := sSQL2 + '+ ' + wReplacCeros + '(DEBETME' + xmes + ',0)-' + wReplacCeros + '(HABETME' + xmes + ',0)';
         xSQL := xSQL + ' ,SALDTME' + xmes + '=' + sSQL2;

         sSQL3 := sSQL3 + '+ ' + wReplacCeros + '(DEBESMN' + xmes + ',0)-' + wReplacCeros + '(HABESMN' + xmes + ',0)';
         xSQL := xSQL + ' ,SALDSMN' + xmes + '=' + sSQL3;

         sSQL4 := sSQL4 + '+ ' + wReplacCeros + '(DEBESME' + xmes + ',0)-' + wReplacCeros + '(HABESME' + xmes + ',0)';
         xSQL := xSQL + ' ,SALDSME' + xmes + '=' + sSQL4;
      End;
   End;
   Try
      DCOM1.AppServer.EjecutaSQL(xSQL + ssql);

   Except
      ControlTran(1, Nil, '');
   End;
End;

Function TDMFAC.BuscaCxCLet(PCia, PDoc, PNoDoc: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'select CLIEID from CXC301 Where ';
   xSQL := xSQL + 'CIAID=' + '''' + PCia + '''' + ' and ';
   xSQL := xSQL + 'DOCID=' + '''' + PDoc + '''' + ' and ';
   xSQL := xSQL + 'CCNODOC=' + '''' + PNoDoc + '''';
   xSQL := UpperCase(xSQL);
   cdsQry.Close;
   cdsQry.ProviderName := 'dspUltTGE';
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.RecordCount > 0 Then
      result := True
   Else
      result := False;
End;

Function TDMFAC.IsNumeric(S: String): Boolean;
Var
   xCodigo: Integer;
   xReal: Double;
Begin
   Result := False;
   If S = '.' Then
      exit;
   Val(S, xReal, xCodigo);
   If xCodigo <> 0 Then
      exit;
   result := True;
End;

Function TDMFAC.CountFor(cds: TwwClientDataSet; sCondicion: String): LongInt;
Var
   cdsClone: TwwClientDataSet;
   bmk: TBookmark;
Begin
   bmk := cds.GetBookmark;
 //result := 0;
   cdsClone := TwwClientDataSet.Create(Nil);
   Try
      cdsClone.CloneCursor(cds, True);
      cdsClone.Filtered := False;
      cdsClone.Filter := sCondicion;
      cdsClone.Filtered := True;
      result := cdsClone.RecordCount;
   Finally
      cdsClone.Free;
   End;
   cds.GotoBookmark(bmk);
   cds.FreeBookmark(bmk);
End;

Function TDMFAC.MaxReqA(Const sCIA, sLOC: String): String;
Var
   sWhere: String;
Begin
   sWhere := 'CIAID=''' + sCIA + ''' AND LOCID=''' + sLOC + '''';
   result := MaxSQL('LOG308', 'RQSID', sWhere);
End;

Function TDMFAC.MaxProf(Const sCIA, sLOC: String): String;
Begin
   sWhere := 'CIAID=' + QuotedStr(sCIA) + ' AND LOCID=' + QuotedStr(sLOC);
   result := MaxSQL('FAC311', 'PROFID', sWhere);
End;

Function TDMFAC.MaxSQL(Const sTabla, sMxCampo, sCondicion: String): String;
Var
   sSQL, sWhere: String;
Begin
   sWhere := 'WHERE ' + SMXCAMPO + ' NOT LIKE (''%A%'') AND ' + SMXCAMPO + ' NOT LIKE (''%B%'') AND ' + SMXCAMPO + ' NOT LIKE (''%C%'') ' +
      'AND ' + SMXCAMPO + ' NOT LIKE (''%D%'') AND ' + SMXCAMPO + ' NOT LIKE (''%E%'') AND ' + SMXCAMPO + ' NOT LIKE (''%F%'') ' +
      'AND ' + SMXCAMPO + ' NOT LIKE (''%G%'') AND ' + SMXCAMPO + ' NOT LIKE (''%H%'') AND ' + SMXCAMPO + ' NOT LIKE (''%I%'') ' +
      'AND ' + SMXCAMPO + ' NOT LIKE (''%J%'') AND ' + SMXCAMPO + ' NOT LIKE (''%K%'') AND ' + SMXCAMPO + ' NOT LIKE (''%L%'') ' +
      'AND ' + SMXCAMPO + ' NOT LIKE (''%M%'') AND ' + SMXCAMPO + ' NOT LIKE (''%N%'') AND ' + SMXCAMPO + ' NOT LIKE (''%O%'') ' +
      'AND ' + SMXCAMPO + ' NOT LIKE (''%P%'') AND ' + SMXCAMPO + ' NOT LIKE (''%Q%'') AND ' + SMXCAMPO + ' NOT LIKE (''%R%'') ' +
      'AND ' + SMXCAMPO + ' NOT LIKE (''%S%'') AND ' + SMXCAMPO + ' NOT LIKE (''%T%'') AND ' + SMXCAMPO + ' NOT LIKE (''%U%'') ' +
      'AND ' + SMXCAMPO + ' NOT LIKE (''%V%'') AND ' + SMXCAMPO + ' NOT LIKE (''%W%'') AND ' + SMXCAMPO + ' NOT LIKE (''%X%'') ' +
      'AND ' + SMXCAMPO + ' NOT LIKE (''%Y%'') AND ' + SMXCAMPO + ' NOT LIKE (''%Z%'') AND ' + wReplacCeros + '(' + SMXCAMPO + ',''VAC'') <> ''VAC'' ';

   If Length(Trim(sCondicion)) > 0 Then
      sWhere := sWhere + ' and ' + sCondicion;

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      sSQL := 'SELECT MAX(CAST(COALESCE(' + SMXCAMPO + ',''0'') AS INTEGER)) AS X FROM ' + sTabla + ' ' + sWhere
   Else
      If SRV_D = 'ORACLE' Then
         sSQL := 'SELECT MAX(TO_NUMBER(NVL(' + SMXCAMPO + ',''0''))) AS X FROM ' + sTabla + ' ' + sWhere;

   cdsUltTGE.Close;
   cdsUltTGE.DataRequest(sSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.FieldByName('X').IsNull Then
      result := '1'
   Else
      result := IntToStr(cdsUltTGE.FieldByName('X').AsInteger + 1);
End;

Function TDMFAC.MaxValue(Const sDetail: String; CD: TDataSet): String;
Var
   iMx: LongInt;
   dsI, dsE: Boolean;
   bmk: TBookMark;
Begin
  // --------------------------- ADVERTENCIA !!!!!!!! --------------------------
  //  ESTO NO FUNCIONA EN EL CACHÉ
  //  result := MaxSQL('LOG309','DRQSID',
  //                   'where CIAID='''+sCIA+''' and '+'RQSID = '''+sRqs+'''' );
  // ---------------------------------------------------------------------------
   iMx := 0;
   bmk := Nil;
   dsI := CD.State = dsInsert;
   dsE := CD.State = dsEdit;

   If CD.RecordCount > 0 Then
   Begin
      If dsE Then bmk := CD.GetBookmark;
      If dsI Or dsE Then CD.Cancel;
      CD.DisableControls;
      CD.First;
      While Not CD.Eof Do
      Begin
      {if CD.FieldByName(sDetail).isNull then iMx := 0
   else
      if CD.FieldByName(sDetail).AsInteger > iMx then
        iMx := CD.FieldByName(sDetail).AsInteger;}
         If CD.FieldByName(sDetail).isNull Then
            iMx := 0
         Else
            If CD.FieldByName(sDetail).AsInteger > iMx Then
               iMx := CD.FieldByName(sDetail).AsInteger;
         CD.Next;
      End;
      CD.EnableControls;
      If dsI Then
         CD.Insert
      Else
         If dsE Then
            CD.Edit;
      If dsE Then
      Begin
         CD.GotoBookmark(bmk);
         CD.FreeBookmark(bmk);
      End;
   End;
   Result := IntToStr(iMx + 1);
End;

Procedure TDMFAC.GrabaAuxConta(wCDST: TClientDataSet);
Var
   xSQL2: String;
Begin
   xSQL2 := 'Select * from CNT201 '
      + 'Where AUXID=' + '''' + wCDST.FieldByName('ClieId').AsString + '''' + ' and '
      + 'CLAUXID=' + '''' + wCDST.FieldByName('ClAuxId').AsString + '''';
   cdsQry.Active := False;
   cdsQry.ProviderName := 'dspUltTGE';
   cdsQry.DataRequest(xSQL2); // Llamada remota al provider del servidor
   cdsQry.Active := True;

   If cdsQry.RecordCount > 0 Then
   Begin
      xSQL2 := 'Update CNT201 '
         + ' Set AUXID=' + '''' + wCDST.FieldByName('ClieId').AsString + ''', '
         + 'AUXNOMB=' + '''' + wCDST.FieldByName('ClieDes').AsString + ''', '
         + 'AUXRUC=' + '''' + wCDST.FieldByName('ClieRuc').AsString + ''', '
         + 'CLAUXID=' + '''' + wCDST.FieldByName('ClAuxId').AsString + ''', '
         + 'AUXABR=' + '''' + wCDST.FieldByName('ClieAbr').AsString + ''', '
         + 'PAISID=' + '''' + wCDST.FieldByName('PaisId').AsString + ''', '
         + 'AUXDIR=' + '''' + wCDST.FieldByName('ClieDir').AsString + ''', '
         + 'AUXCZIP=' + '''' + wCDST.FieldByName('ClieCZip').AsString + ''', '
         + 'AUXTELF=' + '''' + wCDST.FieldByName('ClieTelf').AsString + ''', '
         + 'AUXFAX=' + '''' + wCDST.FieldByName('ClieFax').AsString + ''', '
         + 'AUXEMAIL=' + '''' + wCDST.FieldByName('ClieEMai').AsString + ''', '
         + 'ACTIVO=' + '''' + wCDST.FieldByName('ACTIVO').AsString + ''' '
         + ' Where AUXID=' + '''' + wCDST.FieldByName('ClieId').AsString + '''' + ' and '
         + 'CLAUXID=' + '''' + wCDST.FieldByName('ClAuxId').AsString + '''';
   End
   Else
   Begin
      xSQL2 := 'INSERT INTO CNT201(AUXID, AUXNOMB, AUXABR, AUXRUC, PAISID, AUXDIR, '
         + 'AUXCZIP, AUXTELF, AUXFAX, AUXEMAIL, CLAUXID, ACTIVO ) '
         + 'VALUES('
         + '''' + wCDSt.FieldByName('ClieId').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ClieDes').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ClieAbr').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ClieRuc').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('PaisId').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ClieDir').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ClieCZip').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ClieTelf').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ClieFax').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ClieEMai').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ClAuxId').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ACTIVO').AsString + '''' + ' ) ';
   End;
   DCOM1.AppServer.EjecutaSQL(xSQL2);
End;

Function TDMFAC.BuscaCliente(xxCia, xxClaux, xxClie: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'select CLIEID from TGE204 Where ';
   xSQL := xSQL + 'CIAID=' + quotedstr(xxCia);
   xSQL := xSQL + ' AND CLAUXID=' + quotedstr(xxClaux);
   xSQL := xSQL + ' AND CLIEID=' + quotedstr(xxClie);
   xSQL := UpperCase(xSQL);
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName := 'dspUltTGE';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount > 0 Then
      result := True
   Else
      result := False;
End;

Function TDMFAC.StrNum(wNumero: double): String;
Var
   xNumStr, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12: String;
   xGrupo, xTotal, xDecimal: String;
   xLargo, xVeces: integer;
   xcontador: integer;
Begin
 // w1 para Unidades
   xNumStr := floattostr(int(wNumero));
   For xcontador := 1 To Length(FloatToStr(wNumero)) Do
   Begin
      If copy(FloatToStr(wNumero), xcontador, 1) = '.' Then
      Begin
         xDecimal := copy(FloatToStr(wNumero), xcontador + 1, Length(FloatToStr(wNumero)));
         break;
      End;
   End;
//  xDecimal:= floattostr(wNumero-int(wNumero));

   If wNumero - int(wNumero) > 0 Then
   Begin
//  	if strtoint(copy(xDecimal,Length(xDecimal),1)) >= 5 then
    //** 02/01/2001 - pjsv
{    if copy(xDecimal,Length(xDecimal),1) <> '' then
    //**
     if strtoint(copy(xDecimal,Length(xDecimal),1)) >= 5 then
       xDecimal := inttostr(strtoint(copy(xDecimal,3,2))+1)
      else	xDecimal := copy(xDecimal,3,2)
    //** 02/01/2001 - pjsv
    else 	xDecimal := copy(xDecimal,3,2);
    //**
}
   End
   Else
   Begin
      xDecimal := '00';
   End;
  //** 02/01/2001 - pjsv
   If length(xdecimal) = 1 Then xdecimal := xdecimal + '0';
  //**
   xDecimal := ' y ' + xDecimal + '/100';

   xLargo := length(xNumStr);
   x1 := '';
   x2 := '';
   x3 := '';
   x4 := '';
   x5 := '';
   x6 := '';
   x7 := '';
   x8 := '';
   x9 := '';
   x10 := '';
   If xLargo >= 1 Then x1 := copy(xNumStr, xLargo, 1);
   If xLargo >= 2 Then x2 := copy(xNumStr, xLargo - 1, 1);
   If xLargo >= 3 Then x3 := copy(xNumStr, xLargo - 2, 1);
   If xLargo >= 4 Then x4 := copy(xNumStr, xLargo - 3, 1);
   If xLargo >= 5 Then x5 := copy(xNumStr, xLargo - 4, 1);
   If xLargo >= 6 Then x6 := copy(xNumStr, xLargo - 5, 1);
   If xLargo >= 7 Then x7 := copy(xNumStr, xLargo - 6, 1);
   If xLargo >= 8 Then x8 := copy(xNumStr, xLargo - 7, 1);
   If xLargo >= 9 Then x9 := copy(xNumStr, xLargo - 8, 1);
   If xLargo >= 10 Then x10 := copy(xNumStr, xLargo - 9, 1);
   If xLargo >= 11 Then x11 := copy(xNumStr, xLargo - 10, 1);
   If xLargo >= 12 Then x12 := copy(xNumStr, xLargo - 11, 1);
   xVeces := 1;
   xTotal := '';
   While xVeces <= 4 Do // hasta 999,999'999,999
   Begin
      If xVeces = 2 Then
      Begin
         x1 := x4;
         x2 := x5;
         x3 := x6;
      End;
      If xVeces = 3 Then
      Begin
         x1 := x7;
         x2 := x8;
         x3 := x9;
      End;
      If xVeces = 4 Then
      Begin
         x1 := x10;
         x2 := x11;
         x3 := x12;
      End;

      If x2 = '1' Then // del 11 a 19
      Begin
         If x1 = '0' Then x2 := 'DIEZ';
         If x1 = '1' Then x2 := 'ONCE';
         If x1 = '2' Then x2 := 'DOCE';
         If x1 = '3' Then x2 := 'TRECE';
         If x1 = '4' Then x2 := 'CATORCE';
         If x1 = '5' Then x2 := 'QUINCE';
         If x1 = '6' Then x2 := 'DIECISEIS';
         If x1 = '7' Then x2 := 'DIECISIETE';
         If x1 = '8' Then x2 := 'DIECIOCHO';
         If x1 = '9' Then x2 := 'DIECINUEVE';
         x1 := '0';
      End
      Else
      Begin // del 0 al 9
         If x1 = '1' Then x1 := 'UNO';
         If (xVeces > 1) And (x1 = 'UNO') Then x1 := 'UN';
         If x1 = '2' Then x1 := 'DOS';
         If x1 = '3' Then x1 := 'TRES';
         If x1 = '4' Then x1 := 'CUATRO';
         If x1 = '5' Then x1 := 'CINCO';
         If x1 = '6' Then x1 := 'SEIS';
         If x1 = '7' Then x1 := 'SIETE';
         If x1 = '8' Then x1 := 'OCHO';
         If x1 = '9' Then x1 := 'NUEVE';
         If x2 = '0' Then
         Begin // veinte
            x2 := ' ';
         End;
         If x2 = '2' Then
         Begin // veinte
            x2 := 'VEINTI';
            If x1 = '0' Then x2 := 'VEINTE';
         End;
         If x2 = '3' Then
         Begin
            x2 := 'TREINTI';
            If x1 = '0' Then x2 := 'TREINTA';
         End;
         If x2 = '4' Then
         Begin
            x2 := 'CUARENTI';
            If x1 = '0' Then x2 := 'CUARENTA';
         End;
         If x2 = '5' Then
         Begin
            x2 := 'CINCUENTI';
            If x1 = '0' Then x2 := 'CINCUENTA';
         End;
         If x2 = '6' Then
         Begin
            x2 := 'SESENTI';
            If x1 = '0' Then x2 := 'SESENTA';
         End;
         If x2 = '7' Then
         Begin
            x2 := 'SETENTI';
            If x1 = '0' Then x2 := 'SETENTA';
         End;
         If x2 = '8' Then
         Begin
            x2 := 'OCHENTI';
            If x1 = '0' Then x2 := 'OCHENTA';
         End;
         If x2 = '9' Then
         Begin
            x2 := 'NOVENTI';
            If x1 = '0' Then x2 := 'NOVENTA';
         End;
      End;
      If x3 = '1' Then x3 := 'CIENTO';
      If (x2 = '0') And (x1 = '0') And (x3 = 'CIENTO') Then
         x3 := 'CIEN';
      If x3 = '2' Then x3 := 'DOSCIENTOS';
      If x3 = '3' Then x3 := 'TRESCIENTOS';
      If x3 = '4' Then x3 := 'CUATROCIENTOS';
      If x3 = '5' Then x3 := 'QUINIENTOS';
      If x3 = '6' Then x3 := 'SEISCIENTOS';
      If x3 = '7' Then x3 := 'SETECIENTOS';
      If x3 = '8' Then x3 := 'OCHOCIENTOS';
      If x3 = '9' Then x3 := 'NOVECIENTOS';
      xGrupo := '';
   //xGrupo := x3;
      If x3 <> '0' Then xGrupo := x3;
      If x2 <> '0' Then xGrupo := xGrupo + ' ' + x2;
      If (x2 = '0') And (x3 <> '0') Then xGrupo := xGrupo + ' ';
      If x1 <> '0' Then xGrupo := xGrupo + x1;
      If ((xVeces = 2) Or (xVeces = 4)) And (length(xGrupo) > 1) Then
      Begin
         xGrupo := xGrupo + ' MIL';
      End;
      If (xVeces = 3) And (length(xGrupo) > 1) Then
      Begin
         If x1 <> 'UN' Then
            xGrupo := xGrupo + ' MILLONES'
         Else
         Begin
            xGrupo := xGrupo + ' MILLÓN';
         End;
      End;
      If length(xTotal) > 0 Then xGrupo := xGrupo + ' ';
      xTotal := xGrupo + xTotal;
      xVeces := xVeces + 1;
   End;
   result := xTotal + xDecimal;
End;

Function TDMFAC.NombreMes(wwMes: integer): String;
Begin
   Case wwMes Of
      1: result := 'Enero';
      2: result := 'Febrero';
      3: result := 'Marzo';
      4: result := 'Abril';
      5: result := 'Mayo';
      6: result := 'Junio';
      7: result := 'Julio';
      8: result := 'Agosto';
      9: result := 'Setiembre';
      10: result := 'Octubre';
      11: result := 'Noviembre';
      12: result := 'Diciembre';
   End;

End;

Function TDMFAC.MaxNIS(Const sCIA, sALM, sTIN, sLOC, sTDA: String): String;
Begin
   result := MaxSQL('LOG314', 'NISAID', 'CIAID=''' + sCIA + // cia. alm, tipo (sal/ent)
      ''' AND ALMID=''' + sALM + ''' AND NISATIP=''SALIDA''' +
      ' AND TDAID=''' + sTDA + ''' AND LOCID=''' + sLOC + ''' AND TINID=''' + sTIN + ''''); // tipo Doc. local
End;

Function TDMFAC.BuscaFacPro(PCia, PClie, PPedido, PClaux: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT * FROM FAC311 WHERE ';
   xSQL := xSQL + 'CIAID=' + quotedstr(PCia);
   xSQL := xSQL + ' AND PROFID=' + quotedstr(PPedido);
   xSQL := UpperCase(xSQL);
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName := 'dspUltTGE';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount > 0 Then
      result := True
   Else
      result := False;
End;

Function TDMFAC.MesCerrado(xMes, xAno, xCiaid: String): Boolean;
Var
   xSql: String;
Begin
   xSql := 'SELECT PER' + strzero(xMes, 2) + ' FROM TGE154 WHERE CIAID=' + quotedstr(xCiaid) +
      ' AND ANO=' + quotedstr(xAno);
   cdsQry.Close;
   cdsQry.DataRequest(xSql);
   cdsQry.Open;
   If cdsQry.FieldByName('PER' + strzero(xMes, 2)).AsString = 'S' Then
      result := True
   Else
      result := False;
End;

Procedure UpdCont(Const CIA, TDO, NDO, UBI, SIT, TMO, ZNA: String; FEC: TDate);
Var
   sSQL, xSQL, xFDa: String;
   xFec, xAAMM, xAA, xMM, xDD, xTri, xSem, xSS: String;
   sFlagConta, sItemActual, sItemNuevo, xWhere, sSELECT: String;
   //wMes, wDia : word;
   xxTCambio: Double;
   UBIANT, SITANT: String;
   sNroAsiento, sTDiario: String;
Begin

//   DecodeDate(FEC ,wAno,wMes,wDia);
//   sPe:=InttoStr(wAno)+StrZero(IntToStr(wMes),2);
   // Tipo de Cambio

   //VERIFICA SI EL CAMBIO DE SITUACION GENERA UN ASIENTO CONTABLE
   sSQL := 'SELECT * FROM CXC104 WHERE SITUAID=''' + SIT + '''';
   DMFAC.cdsQry7.IndexFieldNames := '';
   DMFAC.cdsQry7.Filter := '';
   DMFAC.cdsQry7.Close;
   DMFAC.cdsQry7.DataRequest(sSQL);
   DMFAC.cdsQry7.Open;

   If DMFAC.cdsQry7.FieldByName('SITCONTA').AsString = 'S' Then
   Begin
     //DETECTA LAS OPERACIONES QUE SON CANCELACIONES
      If DMFAC.cdsQry7.FieldByName('SITUAFLAG').AsString = 'C' Then
      Begin
         sFlagConta := 'C'; //YA NO SE REGULARIZA DIFERENCIA DE CAMBIO
      End
      Else
      Begin
         sFlagConta := 'P'; //PENDIENTE DE REGULARIZAR DIFERENCIA DE CAMBIO
      End;
      DMFAC.cdsQry7.Close;
      DMFAC.cdsQry7.Filter := '';

      xWhere := 'TMonId=''' + DMFAC.wTMonExt + ''' and '
         + 'Fecha=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, FEC) + ''' )';
     //xxTCambio:=0;
      If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', '*', xWhere, 'TMonId')) > 0 Then
      Begin
//        xxTCambio:=cdsQry.fieldbyname('TCam'+wVRN_TipoCambio).Value;
         xxTCambio := DMFAC.cdsQry.fieldbyname('TCAMVBV').Value;
      End
      Else
      Begin
         Raise Exception.Create(' Error :  Fecha No tiene Tipo de Cambio ');
      End;

      xFDa := DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, FEC) + '''' + ')';
      xFec := DatetoStr(FEC);
//      xAAMM:= Copy(xFec,7,4)+Copy(xFec,4,2);
//      xAA  := Copy(xFec,7,4);
//      xMM  := Copy(xFec,4,2);
//      if BuscaFecha('TGE114','Fecha',FEC ) then begin
      If DMFAC.BuscaFecha('TGE114', 'FECANO', 'FECHA', FEC) Then
      Begin
         xDD := DMFAC.cdsULTTGE.FieldByName('FecDia').Value; // día
         xTri := DMFAC.cdsULTTGE.FieldByName('FecTrim').Value; // trimestre
         xSem := DMFAC.cdsULTTGE.FieldByName('FecSem').Value; // semestre
         xSS := DMFAC.cdsULTTGE.FieldByName('FecSS').Value; // semana
         xAAMM := DMFAC.cdsULTTGE.FieldByName('FecANO').Value + DMFAC.cdsULTTGE.FieldByName('FecMES').Value; //AÑO+MES
         xAA := DMFAC.cdsULTTGE.FieldByName('FecANO').Value; // AÑO
         xMM := DMFAC.cdsULTTGE.FieldByName('FecMES').Value; // MES
      End;

      xSQL := ' SELECT DISTINCT TDIARID,ITEM,UBIID,SITID FROM CXC302 ' +
         ' WHERE CIAID=' + QuotedStr(CIA) + ' AND CCANOMES=' + QuotedStr(xAAMM) + ' AND TMONID=' + QuotedStr(TMO) + ' AND TCANJEID=''TL'' AND CCNODOC=' + QuotedStr(NDO) + ' AND ITEM=(SELECT MAX(ITEM) FROM CXC302 ' +
         ' WHERE CIAID=' + QuotedStr(CIA) + ' AND CCANOMES=' + QuotedStr(xAAMM) + ' AND TMONID=' + QuotedStr(TMO) + ' AND TCANJEID=''TL'' AND CCNODOC=' + QuotedStr(NDO) + ') ';

{      xSQL:=' SELECT MAX(ITEM) ITEM FROM CXC302 '+
            ' WHERE CIAID='+QuotedStr(CIA)+' AND CCANOMES='+QuotedStr(xAAMM)+
            ' AND TCANJEID=''TL'' AND TMONID='+QuotedStr(TMO)+' AND CCNODOC='+QuotedStr(NDO);
 }

      DMFAC.cdsQry2.Close;
      DMFAC.cdsQry2.DataRequest(xSQL);
      DMFAC.cdsQry2.Open;
      UbiAnt := DMFAC.cdsQry2.FieldByName('UBIID').AsString;
      SitAnt := DMFAC.cdsQry2.FieldByName('SITID').AsString;
      sTDiario := DMFAC.cdsQry2.FieldByName('TDIARID').AsString;
      If DMFAC.cdsQry2.FieldByName('ITEM').IsNull Then
      Begin
         sItemNuevo := '00';
         sItemActual := '';
      End
      Else //SI EXISTE ASIENTO ANTERIOR SE TIENE QUE ACTUALIZAR POR DIFERENCIA DE CAMBIO
      Begin // CON FECHA DEL NUEVO ASIENTO
         sItemNuevo := DMFAC.StrZero(IntToStr(DMFAC.cdsQry2.FieldByName('ITEM').AsInteger + 1), 2);
         sItemActual := DMFAC.cdsQry2.FieldByName('ITEM').AsString;

         xSQL := ' SELECT MAX(NROASIENTO) NUMERO FROM CXC302 ' +
            ' WHERE CIAID=' + QuotedStr(CIA) + ' AND CCANOMES=' + QuotedStr(xAAMM) + ' AND TCANJEID=''TL'' AND TDIARID=' + QuotedStr(sTDiario);
         DMFAC.cdsQry2.Close;
         DMFAC.cdsQry2.DataRequest(xSQL);
         DMFAC.cdsQry2.Open;
         If (DMFAC.cdsQry2.FieldByName('NUMERO').AsString = '') Or (DMFAC.cdsQry2.FieldByName('NUMERO').IsNull) Then
         Begin
            sNroAsiento := '00001';
         End
         Else
         Begin
            sNroAsiento := DMFAC.StrZero(IntToStr(StrToInt(DMFAC.cdsQry2.FieldByName('NUMERO').AsString) + 1), 5);
         End;

        //SOLO CUANDO LA LETRA ES EN DOLARES
         If TMO = DMFAC.wTMonExt Then
         Begin
           // ACTUALIZA LOS MONTOS EN SOLES PARA EL TIPO DE CAMBIO DE LA OPERACION
            xSQL := ' UPDATE CXC302 A ' +
               ' SET A.CCTCAMPR=' + FloatToStr(xxTCambio) +
               '     ,A.CCMTOLOC=ROUND(A.CCMTOEXT*' + FloatToStr(xxTCambio) + ',2) ' +
               ' WHERE A.CIAID=' + QuotedStr(CIA) + ' AND A.CCANOMES=' + QuotedStr(xAAMM) +
               ' AND A.TCANJEID=''TL'' AND A.TMONID=' + QuotedStr(TMO) + ' AND A.CCNODOC=' + QuotedStr(NDO) +
               ' AND A.CCDH=''H'' AND A.TIPCTA=''P'' AND ITEM=' + QuotedStr(sItemActual);
            Try
               DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
//             ControlTran( 1, nil, '' );
            End;

           //CALCULA LA CANTIDAD EN SOLES PARA EL REGISTRO A SER INSERTADO
            If (DMFAC.SRV_D = 'DB2NT') Or
               (DMFAC.SRV_D = 'DB2400') Then
            Begin

               xSQL := ' SELECT SUM(CASE WHEN CCDH=''D'' THEN CCMTOLOC ELSE (-1)*CCMTOLOC END) MONTO FROM CXC302 A ' +
                  ' WHERE A.CIAID=' + QuotedStr(CIA) + ' AND A.CCANOMES=' + QuotedStr(xAAMM) +
                  ' AND A.TMONID=' + QuotedStr(TMO) + ' AND A.TCANJEID=''TL'' AND  A.CCNODOC=' + QuotedStr(NDO) + ' AND ITEM=' + QuotedStr(sItemActual);
            End
            Else
            Begin
               If (DMFAC.SRV_D = 'ORACLE') Then
               Begin
                  xSQL := ' SELECT SUM(DECODE (CCDH,''D'', CCMTOLOC , (-1)*CCMTOLOC )) MONTO FROM CXC302 A ' +
                     ' WHERE A.CIAID=' + QuotedStr(CIA) + ' AND A.CCANOMES=' + QuotedStr(xAAMM) +
                     ' AND A.TMONID=' + QuotedStr(TMO) + ' AND A.TCANJEID=''TL'' AND  A.CCNODOC=' + QuotedStr(NDO) + ' AND ITEM=' + QuotedStr(sItemActual);
               End;
            End;

            DMFAC.cdsQry2.Close;
            DMFAC.cdsQry2.DataRequest(xSQL);
            DMFAC.cdsQry2.Open;

           // INSERTA LA CUENTA DE DIFERENCIA DE CAMBIO QUE HACE CUADRAR EL ASIENTO ANTERIOR
            xSQL := ' INSERT INTO CXC302 ( ';
            xSQL := xSQL + ' CCGLOSA,CIAID, TDIARID, CCANOMES, NROASIENTO, CCNOREG, CUENTAID, CPTOID, ';
            xSQL := xSQL + ' CLAUXID, ORDEN, CLIEID, SITID, UBIID, FLAGCONTA, ITEM, CCOSID, DOCID, CCSERIE, CCNODOC, ';
            xSQL := xSQL + ' CCDH, CCTCAMPR, CCMTOORI, CCMTOLOC, CCMTOEXT, ';
            xSQL := xSQL + ' CCFEMIS, CCFVCMTO, CCFCOMP, CCESTADO, ';
            xSQL := xSQL + ' CCUSER, CCFREG, CCHREG, TMONID, TCANJEID, ';
            xSQL := xSQL + ' CCAAAA, CCMM, CCDD, CCTRI, CCSEM, CCSS, ';
            xSQL := xSQL + ' CCAATRI, CCAASEM, CCAASS,TIPCTA ) ';

            If DMFAC.cdsQry2.FieldByName('MONTO').Value > 0 Then
            Begin
               If (DMFAC.SRV_D = 'DB2NT') Or
                  (DMFAC.SRV_D = 'DB2400') Then
               Begin
                  sSELECT := '';
                  sSELECT := sSELECT + ' (SELECT ''CD:''||L.CLIEID||'' LT:''||L.CCNODOC||'' DI:''||TGE104.TDIARABR||'' MD:''||TGE103.TMONABR GLOSA, F.CIAID,F.TDIARID,' + QuotedStr(xAAMM) + ' CCANOMES, ' + QuotedStr(sNroAsiento) + ' NROASIENTO, L.CCNOREG,F.CUENTAID,L.CCPTOTOT,L.CLAUXID, ';
                  sSELECT := sSELECT + ' F.ORDEN, L.CLIEID,' + QuotedStr(SITANT) + ' SITID, ' + QuotedStr(UBIANT) + ' UBIID, ' + QuotedStr(sFlagConta) + ' FLAGCONTA, ' + QuotedStr(sItemActual) + ' ITEM, '''' CCOSID,L.DOCID,L.CCSERIE,L.CCNODOC,F.DH CCDH,' + FloatToStr(xxTCambio) + ', ';
                  sSELECT := sSELECT + ' 0, ' + FloatToStr(FRound(Abs(DMFAC.cdsQry2.FieldByName('MONTO').AsFloat), 15, 2)) + ' , 0, ';
                  sSELECT := sSELECT + ' L.CCFEMIS, L.CCFVCMTO,' + xFDA + ' CCFCOMP, L.CCESTADO, L.CCUSER, L.CCFREG, ';
                  sSELECT := sSELECT + ' L.CCHREG, L.TMONID, ''TL'' TCANJEID, ' + QuotedStr(xAA) + ' CCAAAA, ' + QuotedStr(xMM) + ' CCMM, ' + QuotedStr(xDD) + ' CCDD, ' + QuotedStr(xTRI) + ' CCTRI, ' + QuotedStr(xSEM) + ' CCSEM, ';
                  sSELECT := sSELECT + QuotedStr(xSS) + ' CCSS, ' + QuotedStr(xAA + xTRI) + ' CCAATRI, ' + QuotedStr(xAA + xSEM) + ' CCAASEM, ' + QuotedStr(xAA + xSS) + ' CCAASS, F.TIPCTA ';
                  sSELECT := sSELECT + ' FROM CXC205 F ';
                  sSELECT := sSELECT + ' LEFT JOIN CXC301 L ON F.CIAID=L.CIAID AND L.DOCID=' + QuotedStr(TDO) + ' AND L.CCNODOC=' + QuotedStr(NDO) + ' AND ';
                  sSELECT := sSELECT + '                       F.TMONID=L.TMONID AND F.ZONA=L.TVTAID ';
                  sSELECT := sSELECT + ' LEFT JOIN TGE104 ON TGE104.TDIARID=F.TDIARID ';
                  sSELECT := sSELECT + ' LEFT JOIN TGE103 ON TGE103.TMONID=F.TMONID ';
                  sSELECT := sSELECT + ' WHERE F.CIAID=' + QuotedStr(CIA) + ' AND F.UBICAID=' + QuotedStr(UBIANT) + ' AND F.SITUAID=' + QuotedStr(SITANT)
                     + ' AND F.TMONID=' + QuotedStr(TMO) + ' AND F.ZONA=' + QuotedStr(ZNA) + ' AND F.TIPCTA=''D'' AND F.DH=''H'' ' + ')';

                  xSQL := xSQL + sSELECT
               End
               Else
                  If (DMFAC.SRV_D = 'ORACLE') Then
                  Begin
                     sSELECT := '';
                     sSELECT := sSELECT + ' (SELECT ''CD:''||L.CLIEID||'' LT:''||L.CCNODOC||'' DI:''||TGE104.TDIARABR||'' MD:''||TGE103.TMONABR GLOSA, F.CIAID,F.TDIARID,' + QuotedStr(xAAMM) + ' CCANOMES, ' + QuotedStr(sNroAsiento) + ' NROASIENTO, L.CCNOREG,F.CUENTAID,L.CCPTOTOT,L.CLAUXID, ';
                     sSELECT := sSELECT + ' F.ORDEN, L.CLIEID,' + QuotedStr(SITANT) + ' SITID, ' + QuotedStr(UBIANT) + ' UBIID, ' + QuotedStr(sFlagConta) + ' FLAGCONTA, ' + QuotedStr(sItemActual) + ' ITEM, '''' CCOSID,L.DOCID,L.CCSERIE,L.CCNODOC,F.DH CCDH,' + FloatToStr(xxTCambio) + ', ';
                     sSELECT := sSELECT + ' 0, ' + FloatToStr(FRound(Abs(DMFAC.cdsQry2.FieldByName('MONTO').AsFloat), 15, 2)) + ' , 0, ';
                     sSELECT := sSELECT + ' L.CCFEMIS, L.CCFVCMTO,' + xFDA + ' CCFCOMP, L.CCESTADO, L.CCUSER, L.CCFREG, ';
                     sSELECT := sSELECT + ' L.CCHREG, L.TMONID, ''TL'' TCANJEID, ' + QuotedStr(xAA) + ' CCAAAA, ' + QuotedStr(xMM) + ' CCMM, ' + QuotedStr(xDD) + ' CCDD, ' + QuotedStr(xTRI) + ' CCTRI, ' + QuotedStr(xSEM) + ' CCSEM, ';
                     sSELECT := sSELECT + QuotedStr(xSS) + ' CCSS, ' + QuotedStr(xAA + xTRI) + ' CCAATRI, ' + QuotedStr(xAA + xSEM) + ' CCAASEM, ' + QuotedStr(xAA + xSS) + ' CCAASS, F.TIPCTA ';
                     sSELECT := sSELECT + ' FROM CXC205 F,CXC301 L,TGE104,TGE103, ';
                     sSELECT := sSELECT + ' WHERE L.CCNODOC=' + QuotedStr(NDO) + ' AND F.CIAID=L.CIAID(+) AND F.UBICAID=' + QuotedStr(UBIANT) + ' AND ';
                     sSELECT := sSELECT + '                  F.SITUAID=' + QuotedStr(SITANT) + ' AND F.TMONID=L.TMONID(+) AND F.ZONA=L.TVTAID(+) AND L.DOCID=' + QuotedStr(TDO);
                     sSELECT := sSELECT + ' AND TGE104.TDIARID(+)=F.TDIARID ';
                     sSELECT := sSELECT + ' AND TGE103 ON TGE103.TMONID(+)=F.TMONID ';
                     sSELECT := sSELECT + ' AND F.TIPCTA=''D'' AND F.DH=''H'' AND F.CIAID=' + QuotedStr(CIA) + ' AND F.UBICAID=' + QuotedStr(UBIANT) + ' AND F.SITUAID=' + QuotedStr(SITANT) + ' AND F.TMONID=' + QuotedStr(TMO) + ' AND F.ZONA=' + QuotedStr(ZNA) + ')';
                     xSQL := xSQL + sSELECT;
                  End;
            End
            Else
            Begin
               If (DMFAC.SRV_D = 'DB2NT') Or
                  (DMFAC.SRV_D = 'DB2400') Then
               Begin
                  sSELECT := '';
                  sSELECT := sSELECT + ' (SELECT ''CD:''||L.CLIEID||'' LT:''||L.CCNODOC||'' DI:''||TGE104.TDIARABR||'' MD:''||TGE103.TMONABR GLOSA, F.CIAID,F.TDIARID,' + QuotedStr(xAAMM) + ' CCANOMES, ' + QuotedStr(sNroAsiento) + ' NROASIENTO, L.CCNOREG,F.CUENTAID,L.CCPTOTOT,L.CLAUXID, ';
                  sSELECT := sSELECT + ' F.ORDEN, L.CLIEID,' + QuotedStr(SITANT) + ' SITID, ' + QuotedStr(UBIANT) + ' UBIID, ' + QuotedStr(sFlagConta) + ' FLAGCONTA, ' + QuotedStr(sItemActual) + ' ITEM, '''' CCOSID,L.DOCID,L.CCSERIE,L.CCNODOC,F.DH CCDH,' + FloatToStr(xxTCambio) + ', ';
                  sSELECT := sSELECT + ' 0, ' + FloatToStr(FRound(Abs(DMFAC.cdsQry2.FieldByName('MONTO').AsFloat), 15, 2)) + ' , 0, ';
                  sSELECT := sSELECT + ' L.CCFEMIS, L.CCFVCMTO,' + xFDA + ' CCFCOMP, L.CCESTADO, L.CCUSER, L.CCFREG, ';
                  sSELECT := sSELECT + ' L.CCHREG, L.TMONID, ''TL'' TCANJEID, ' + QuotedStr(xAA) + ' CCAAAA, ' + QuotedStr(xMM) + ' CCMM, ' + QuotedStr(xDD) + ' CCDD, ' + QuotedStr(xTRI) + ' CCTRI, ' + QuotedStr(xSEM) + ' CCSEM, ';
                  sSELECT := sSELECT + QuotedStr(xSS) + ' CCSS, ' + QuotedStr(xAA + xTRI) + ' CCAATRI, ' + QuotedStr(xAA + xSEM) + ' CCAASEM, ' + QuotedStr(xAA + xSS) + ' CCAASS, F.TIPCTA ';
                  sSELECT := sSELECT + ' FROM CXC205 F ';
                  sSELECT := sSELECT + ' LEFT JOIN CXC301 L ON F.CIAID=L.CIAID AND L.DOCID=' + QuotedStr(TDO) + ' AND L.CCNODOC=' + QuotedStr(NDO) + ' AND ';
                  sSELECT := sSELECT + '                       F.TMONID=L.TMONID AND F.ZONA=L.TVTAID ';
                  sSELECT := sSELECT + ' LEFT JOIN TGE104 ON TGE104.TDIARID=F.TDIARID ';
                  sSELECT := sSELECT + ' LEFT JOIN TGE103 ON TGE103.TMONID=F.TMONID ';
                  sSELECT := sSELECT + ' WHERE F.CIAID=' + QuotedStr(CIA) + ' AND F.UBICAID=' + QuotedStr(UBIANT) + ' AND F.SITUAID=' + QuotedStr(SITANT) + ' AND F.TMONID=' + QuotedStr(TMO) + ' AND F.ZONA=' + QuotedStr(ZNA) + ' AND F.TIPCTA=''D'' AND F.DH=''D'' ' + ')';
                  xSQL := xSQL + sSELECT
               End
               Else
                  If (DMFAC.SRV_D = 'ORACLE') Then
                  Begin
                     sSELECT := '';
                     sSELECT := sSELECT + ' (SELECT ''CD:''||L.CLIEID||'' LT:''||L.CCNODOC||'' DI:''||TGE104.TDIARABR||'' MD:''||TGE103.TMONABR GLOSA, F.CIAID,F.TDIARID,' + QuotedStr(xAAMM) + ' CCANOMES, ' + QuotedStr(sNroAsiento) + ' NROASIENTO, L.CCNOREG,F.CUENTAID,L.CCPTOTOT,L.CLAUXID, ';
                     sSELECT := sSELECT + ' F.ORDEN, L.CLIEID,' + QuotedStr(SITANT) + ' SITID, ' + QuotedStr(UBIANT) + ' UBIID, ' + QuotedStr(sFlagConta) + ' FLAGCONTA, ' + QuotedStr(sItemActual) + ' ITEM, '''' CCOSID,L.DOCID,L.CCSERIE,L.CCNODOC,F.DH CCDH,' + FloatToStr(xxTCambio) + ', ';
                     sSELECT := sSELECT + ' 0, ' + FloatToStr(FRound(Abs(DMFAC.cdsQry2.FieldByName('MONTO').AsFloat), 15, 2)) + ' , 0, ';
                     sSELECT := sSELECT + ' L.CCFEMIS, L.CCFVCMTO,' + xFDA + ' CCFCOMP, L.CCESTADO, L.CCUSER, L.CCFREG, ';
                     sSELECT := sSELECT + ' L.CCHREG, L.TMONID, ''TL'' TCANJEID, ' + QuotedStr(xAA) + ' CCAAAA, ' + QuotedStr(xMM) + ' CCMM, ' + QuotedStr(xDD) + ' CCDD, ' + QuotedStr(xTRI) + ' CCTRI, ' + QuotedStr(xSEM) + ' CCSEM, ';
                     sSELECT := sSELECT + QuotedStr(xSS) + ' CCSS, ' + QuotedStr(xAA + xTRI) + ' CCAATRI, ' + QuotedStr(xAA + xSEM) + ' CCAASEM, ' + QuotedStr(xAA + xSS) + ' CCAASS, F.TIPCTA ';
                     sSELECT := sSELECT + ' FROM CXC205 F,CXC301 L,TGE104,TGE103 ';
                     sSELECT := sSELECT + ' WHERE  ON L.CCNODOC=' + QuotedStr(NDO) + ' AND F.CIAID=L.CIAID(+) AND F.UBICAID=' + QuotedStr(UBIANT) + ' AND ';
                     sSELECT := sSELECT + '                  F.SITUAID=' + QuotedStr(SITANT) + ' AND F.TMONID=L.TMONID(+) AND F.ZONA=L.TVTAID(+) AND L.DOCID=' + QuotedStr(TDO);
                     sSELECT := sSELECT + ' AND TGE104.TDIARID(+)=F.TDIARID ';
                     sSELECT := sSELECT + ' AND TGE103 ON TGE103.TMONID(+)=F.TMONID ';
                     sSELECT := sSELECT + ' AND F.TIPCTA=''D'' AND F.DH=''D'' AND F.CIAID=' + QuotedStr(CIA) + ' AND F.UBICAID=' + QuotedStr(UBIANT) + ' AND F.SITUAID=' + QuotedStr(SITANT) + ' AND F.TMONID=' + QuotedStr(TMO) + ' AND F.ZONA=' + QuotedStr(ZNA) + ')';
                     xSQL := xSQL + sSELECT;
                  End;
            End;
            Try
               DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               DMFAC.ControlTran(1, Nil, '');
            End;
         End;
      End; //DEL ELSE

      xSQL := ' INSERT INTO CXC302 ( ';
      xSQL := xSQL + ' CCGLOSA,CIAID, TDIARID, CCANOMES, NROASIENTO, CCNOREG, CUENTAID, CPTOID, ';
      xSQL := xSQL + ' CLAUXID, ORDEN, CLIEID, SITID, UBIID, FLAGCONTA, ITEM, CCOSID, DOCID, CCSERIE, CCNODOC, ';
      xSQL := xSQL + ' CCDH, CCTCAMPR, CCMTOORI, CCMTOLOC, CCMTOEXT, ';
      xSQL := xSQL + ' CCFEMIS, CCFVCMTO, CCFCOMP, CCESTADO, ';
      xSQL := xSQL + ' CCUSER, CCFREG, CCHREG, TMONID, TCANJEID, ';
      xSQL := xSQL + ' CCAAAA, CCMM, CCDD, CCTRI, CCSEM, CCSS, ';
      xSQL := xSQL + ' CCAATRI, CCAASEM, CCAASS,TIPCTA ) ';

      If (DMFAC.SRV_D = 'DB2NT') Or (DMFAC.SRV_D = 'DB2400') Then
      Begin
         sSELECT := '';
         sSELECT := sSELECT + ' (SELECT ''CD:''||L.CLIEID||'' LT:''||L.CCNODOC||'' DI:''||TGE104.TDIARABR||'' MD:''||TGE103.TMONABR GLOSA, F.CIAID,F.TDIARID,' + QuotedStr(xAAMM) + ' CCANOMES, ' + QuotedStr(sNroAsiento) + ' NROASIENTO, L.CCNOREG,F.CUENTAID,L.CCPTOTOT,L.CLAUXID, ';
         sSELECT := sSELECT + ' F.ORDEN, L.CLIEID,' + QuotedStr(SIT) + ' SITID, ' + QuotedStr(UBI) + ' UBIID, ' + QuotedStr(sFlagConta) + ' FLAGCONTA, ' + QuotedStr(sItemNuevo) + ' ITEM, '''' CCOSID,L.DOCID,L.CCSERIE,L.CCNODOC,F.DH CCDH,' + FloatToStr(xxTCambio) + ', ';
         sSELECT := sSELECT + ' L.CCMTOORI, L.CCMTOLOC, L.CCMTOEXT, L.CCFEMIS, L.CCFVCMTO,' + xFDA + ' CCFCOMP, L.CCESTADO, L.CCUSER, L.CCFREG, ';
         sSELECT := sSELECT + ' L.CCHREG, L.TMONID, ''TL'' TCANJEID, ' + QuotedStr(xAA) + ' CCAAAA, ' + QuotedStr(xMM) + ' CCMM, ' + QuotedStr(xDD) + ' CCDD, ' + QuotedStr(xTRI) + ' CCTRI, ' + QuotedStr(xSEM) + ' CCSEM, ';
         sSELECT := sSELECT + QuotedStr(xSS) + ' CCSS, ' + QuotedStr(xAA + xTRI) + ' CCAATRI, ' + QuotedStr(xAA + xSEM) + ' CCAASEM, ' + QuotedStr(xAA + xSS) + ' CCAASS, F.TIPCTA ';
         sSELECT := sSELECT + ' FROM CXC205 F ';
//          sSELECT:=sSELECT+' LEFT JOIN CXC301 L ON L.CCNODOC='+QuotedStr(NDO)+' AND F.CIAID=L.CIAID AND F.UBICAID=L.UBIID AND ';
//          sSELECT:=sSELECT+'                  F.SITUAID=L.SITID AND F.TMONID=L.TMONID AND F.ZONA=L.TVTAID AND L.DOCID='+QuotedStr(TDO);
         sSELECT := sSELECT + ' LEFT JOIN CXC301 L ON F.CIAID=L.CIAID AND L.DOCID=' + QuotedStr(TDO) + ' AND L.CCNODOC=' + QuotedStr(NDO) + ' AND ';
         sSELECT := sSELECT + '                       F.TMONID=L.TMONID AND F.ZONA=L.TVTAID ';
         sSELECT := sSELECT + ' LEFT JOIN TGE104 ON TGE104.TDIARID=F.TDIARID ';
         sSELECT := sSELECT + ' LEFT JOIN TGE103 ON TGE103.TMONID=F.TMONID ';
         sSELECT := sSELECT + ' WHERE F.CIAID=' + QuotedStr(CIA) + ' AND F.UBICAID=' + QuotedStr(UBI) + ' AND F.SITUAID=' + QuotedStr(SIT) + ' AND F.TMONID=' + QuotedStr(TMO) + ' AND F.ZONA=' + QuotedStr(ZNA) + ' AND F.TIPCTA<>''D'' ' + ')';
         xSQL := xSQL + sSELECT
      End
      Else
         If (DMFAC.SRV_D = 'ORACLE') Then
         Begin
            sSELECT := '';
            sSELECT := sSELECT + ' (SELECT ''CD:''||L.CLIEID||'' LT:''||L.CCNODOC||'' DI:''||TGE104.TDIARABR||'' MD:''||TGE103.TMONABR GLOSA, F.CIAID,F.TDIARID,' + QuotedStr(xAAMM) + ' CCANOMES, ' + QuotedStr(sNroAsiento) + ' NROASIENTO, L.CCNOREG,F.CUENTAID,L.CCPTOTOT,L.CLAUXID, ';
            sSELECT := sSELECT + ' F.ORDEN, L.CLIEID,' + QuotedStr(SIT) + ' SITID, ' + QuotedStr(UBI) + ' UBIID, ' + QuotedStr(sFlagConta) + ' FLAGCONTA, ' + QuotedStr(sItemNuevo) + ' ITEM, '''' CCOSID,L.DOCID,L.CCSERIE,L.CCNODOC,F.DH CCDH,' + FloatToStr(xxTCambio) + ', ';
            sSELECT := sSELECT + ' L.CCMTOORI, L.CCMTOLOC, L.CCMTOEXT, L.CCFEMIS, L.CCFVCMTO,' + xFDA + ' CCFCOMP, L.CCESTADO, L.CCUSER, L.CCFREG, ';
            sSELECT := sSELECT + ' L.CCHREG, L.TMONID, ''TL'' TCANJEID, ' + QuotedStr(xAA) + ' CCAAAA, ' + QuotedStr(xMM) + ' CCMM, ' + QuotedStr(xDD) + ' CCDD, ' + QuotedStr(xTRI) + ' CCTRI, ' + QuotedStr(xSEM) + ' CCSEM, ';
            sSELECT := sSELECT + QuotedStr(xSS) + ' CCSS, ' + QuotedStr(xAA + xTRI) + ' CCAATRI, ' + QuotedStr(xAA + xSEM) + ' CCAASEM, ' + QuotedStr(xAA + xSS) + ' CCAASS, F.TIPCTA ';
            sSELECT := sSELECT + ' FROM CXC205 F,CXC301 L,TGE104,TGE103 ';
//          sSELECT:=sSELECT+' WHERE L.CCNODOC='+QuotedStr(NDO)+' AND F.CIAID=L.CIAID(+) AND F.UBICAID=L.UBIID(+) AND ';
            sSELECT := sSELECT + ' WHERE L.CCNODOC=' + QuotedStr(NDO) + ' AND F.CIAID=L.CIAID(+) AND F.UBICAID=' + QuotedStr(UBI) + ' AND ';
//          sSELECT:=sSELECT+'                  F.SITUAID=L.SITID(+) AND F.TMONID=L.TMONID(+) AND F.ZONA=L.TVTAID(+) AND L.DOCID='+QuotedStr(TDO);
            sSELECT := sSELECT + '                  F.SITUAID=' + QuotedStr(SIT) + ' AND F.TMONID=L.TMONID(+) AND F.ZONA=L.TVTAID(+) AND L.DOCID=' + QuotedStr(TDO);
            sSELECT := sSELECT + ' AND TGE104.TDIARID(+)=F.TDIARID ';
            sSELECT := sSELECT + ' AND TGE103.TMONID(+)=F.TMONID ';
            sSELECT := sSELECT + ' AND F.TIPCTA<>''D'' AND F.CIAID=' + QuotedStr(CIA) + ' AND F.UBICAID=' + QuotedStr(UBI) + ' AND F.SITUAID=' + QuotedStr(SIT) + ' AND F.TMONID=' + QuotedStr(TMO) + ' AND F.ZONA=' + QuotedStr(ZNA) + ')';
            xSQL := xSQL + sSELECT;
         End;
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMFAC.ControlTran(1, Nil, '');
      End;
   End;
End;

Procedure TDMFAC.cdsPost(xxCds: TwwClientDataSet);
Var
   i: integer;
Begin
   For i := 0 To xxCds.Fields.Count - 1 Do
   Begin
      If xxCds.Fields[i].ClassType = TStringField Then
      Begin
         If xxCds.Fields[i].AsString = '' Then
            xxCds.Fields[i].Clear;
      End;

      If xxCds.Fields[i].ClassType = TMemoField Then
      Begin
         If xxCds.Fields[i].AsString = '' Then
            xxCds.Fields[i].AsString := '.';
      End;
   End;
End;

Function TDMFAC.MaxNIA(Const sCIA, sALM, sTIN, sLOC, sTDA: String): String;
Begin

// Inicio HPC_201602_FAC
// Se Cambia definición de nro.máximo Nota Ingreso/Salñida a llave CIA+TIPO+ALM

   result := MaxSQL('LOG314', 'NISAID', 'CIAID=''' + sCIA +
      ''' AND ALMID=''' + sALM + ''' AND NISATIP=''INGRESO''' +
      ' AND TDAID=''' + sTDA + ''' AND LOCID=''' + sLOC + ''' AND TINID=''' + sTIN + '''');
{
   result := MaxSQL('LOG314', 'NISAID',
      'CIAID='+quotedstr(sCIA)
     +' AND ALMID='+quotedstr(sALM)
     +' AND NISATIP='+quotedstr('INGRESO'));
    }
// Fin HPC_201602_FAC
End;

Procedure TDMFAC.VerificaPeriodoVentas(sCia, sLoc, sTin, sAlm: String; dFechaSistema, dFechaMovimiento: TDateTime);
Var
   sTipo, sSQL: String;
Begin
   wVerifPerVentas := False;
  // CONTROL DE FECHAS DE VENTAS DESDE oaREGLAS
   sTipo := Control_Fecha(dFechaSistema, dFechaMovimiento);

   If sTipo = 'ANT' Then
   Begin
      ShowMessage('No Puede Registrar el Documento con Fecha anterior a ' + DateToStr(dFechaSistema));
      exit;
   End;

   If sTipo = 'DES' Then
   Begin
      ShowMessage('No Puede Registrar el Documento Posterior a la Fecha ' + DateToStr(dFechaSistema));
      exit;
   End;

// Inicio HPC_201403_FAC
// Se quita validación de Periodo de Ventas para Servicios
   If sAlm <> '00' Then
   Begin
   // CONTROL DE FECHAS DEL ALMACEN DE VENTAS DESDE LOG317
      sSQL := ' SELECT * FROM LOG317 WHERE CIAID=' + QuotedStr(sCia) + ' AND LOCID=' + QuotedStr(sLoc) +
         ' AND TINID=' + QuotedStr(sTin) + ' AND ALMID=' + QuotedStr(sAlm) +
         ' ORDER BY CNSULTCIE DESC ';
      cdsQry.Close;
      cdsQry.DataRequest(sSQL);
      cdsQry.Open;
      If cdsQry.RecordCount = 0 Then
      Begin
         ShowMessage(' No Existe Apertura/Cierre operativo en Almacén ');
         exit;
      End
      Else
      Begin
         If Not ((dFechaMovimiento >= cdsQry.fieldbyname('CNSPRICIE').AsDateTime) And (dFechaMovimiento <= cdsQry.fieldbyname('CNSULTCIE').AsDateTime)) Then
         Begin
            ShowMessage('No se puede Registrar el Documento a la Fecha ' + DateToStr(dFechaMovimiento) + #13
               + 'Rango Permitido Desde ' + DateToStr(cdsQry.fieldbyname('CNSPRICIE').AsDateTime)
               + ' al ' + DateToStr(cdsQry.fieldbyname('CNSULTCIE').AsDateTime));
            exit;
         End;
      End;
   End;
// Fin HPC_201403_FAC

  // CONTROL DE FECHAS DE CUENTAS POR COBRAR
    // CONTROL DE FECHAS DE CUENTAS POR COBRAR
   sSQL := 'SELECT * FROM CXC312 '
      + 'WHERE CIAID=' + QuotedStr(sCia)
      + ' AND ''' + DateToStr(dFechaMovimiento) + '''>=CNSPRICIE and ''' + DateToStr(dFechaMovimiento) + '''<=CNSULTCIE '
      + 'ORDER BY CNSULTCIE DESC';

   cdsQry.Close;
   cdsQry.DataRequest(sSQL);
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No Existe Periodo Operativo en Cuentas por Cobrar');
      exit;
   End
   Else
   Begin
      If cdsQry.fieldbyname('ESTVEN').AsString = 'C' Then
      Begin
         ShowMessage('No se puede Registrar Documento con Fecha ' + DateToStr(dFechaMovimiento) + #13 + #13
            + 'Rango Desde ' + DateToStr(cdsQry.fieldbyname('CNSPRICIE').AsDateTime)
            + ' al ' + DateToStr(cdsQry.fieldbyname('CNSULTCIE').AsDateTime) + ' ya fue Cerrado');
         exit;
      End;
   End;
   wVerifPerVentas := True;
  {
 sSQL := ' SELECT * FROM CXC312 WHERE CIAID='+QuotedStr(sCia)+
     ' ORDER BY CNSULTCIE DESC ';
 cdsQry.Close;
 cdsQry.DataRequest(sSQL);
 cdsQry.Open;
 if cdsQry.RecordCount = 0 then
 begin
      ShowMessage(' No Existe Apertura/Cierre operativo en Almacén ');
      exit;
 end
 else
 begin
      if not( ( dFechaMovimiento >= cdsQry.fieldbyname('CNSPRICIE').AsDateTime ) and ( dFechaMovimiento <= cdsQry.fieldbyname('CNSULTCIE').AsDateTime )) then
      begin
         ShowMessage(' No se puede Registrar el Documento a la Fecha '+DateToStr(dFechaMovimiento)+#13
                    +'Rango Permitido Desde '+DateToStr(cdsQry.fieldbyname('CNSPRICIE').AsDateTime)
                    +' al '+DateToStr(cdsQry.fieldbyname('CNSULTCIE').AsDateTime));
         exit;
      end;
   end;
   }
End;

Procedure TDMFAC.cdsMovFacReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(Dataset, updateKind, E);
End;

Procedure TDMFAC.cdsClieReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(Dataset, updateKind, E);
End;

Procedure TDMFAC.cdsProformaReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(Dataset, updateKind, E);
End;

Procedure TDMFAC.cdsDetProfReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(Dataset, updateKind, E);
End;

Procedure TDMFAC.cdsDetFactObs2ReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(Dataset, updateKind, E);
End;

Procedure TDMFAC.cdsKDXSerieReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(Dataset, updateKind, E);
End;

Procedure TDMFAC.DisminuyeForma(Sender: TObject);
Begin
   //FVariables.w_Num_Formas := FVariables.w_Num_Formas-1;
End;

Function TDMFAC.DateS: TDatetime;
Var
   sSQL: String;
Begin
   sSQL := ' SELECT ' + wRepFecServi + ' FECHA  FROM TGE901 ';
   cdsQry.Close;
   cdsQry.DataRequest(sSQL);
   cdsQry.Open;
   Result := strtodate(datetostr(cdsQry.fieldbyname('FECHA').AsDateTime));
End;

Procedure TDMFAC.FiltraTabla(xxCds: TwwClientDataSet; xxArchivo, xxCampo,
   xxWhere: String);
Var
   xFiltro, xSQL2: String;
Begin
   cdsAcceso.Filtered := False;
   cdsAcceso.Filter := '';
   cdsAcceso.Filter := 'NTabla=' + '''' + xxArchivo + '''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   While Not cdsAcceso.Eof Do
   Begin
      If Length(xFiltro) = 0 Then
         xFiltro := xxCampo + '=' + '''' + cdsAcceso.fieldbyname('CODIGO').AsString + ''''
      Else
         xFiltro := xFiltro + ' OR ' + xxCampo + '=' + '''' + cdsAcceso.fieldbyname('CODIGO').AsString + '''';
      cdsAcceso.Next;
   End;

   If Length(Trim(xFiltro)) > 0 Then
   Begin
      xSQL2 := 'SELECT * FROM ' + xxArchivo + ' WHERE (' + xFiltro + ') ';
      If Length(Trim(xxWhere)) > 0 Then
         xSQL2 := xSQL2 + ' AND ( ' + xxWhere + ' )';

      xxCds.Close;
      xxCds.DataRequest(xSQL2);
   End
   Else
   Begin
      xSQL2 := 'SELECT * FROM ' + xxArchivo;
      If Length(Trim(xxWhere)) > 0 Then
         xSQL2 := xSQL2 + ' WHERE ( ' + xxWhere + ' )';

      xxCds.Close;
      xxCds.DataRequest(xSQL2);
   End;
   xxCds.Open;
End;

Function TDMFAC.FiltraCiaPorUsuario(cdsCiaUser: TwwClientDataSet): String;
Var
   cFilter: String;
Begin
   cFilter := '';
   cdsCiaUser.First;
   While Not cdsCiaUser.Eof Do
   Begin
      If cFilter = '' Then
         cFilter := ' CIAID IN ( ''' + cdsCiaUser.FieldByName('CIAID').AsString + ''''
      Else
         cFilter := cFilter + ', ''' + cdsCiaUser.FieldByName('CIAID').AsString + '''';

      cdsCiaUser.Next;
   End;

   If cFilter <> '' Then
      cFilter := cFilter + ' ) ';

   Result := cFilter;
End;

Procedure TDMFAC.ActualizaFiltro(wwFiltro: TMant; wwCdsLee: TwwClientDataSet;
   wwAccion: String);
Var
   i: integer;
Begin
// wFiltro : Es el Filtro que va a actualizar
// wCDsLee : Es el cds que contiene la información a actualizar
// wAccion : 'A' = Adición/Inserción/Nuevo Item
//           'M' = Actualización del Registro
//           'E' = Eliminación del Registro

   If wwAccion = 'E' Then
   Begin
      wwFiltro.FMant.cds2.Delete;
   End;

   If wwAccion = 'A' Then
   Begin
      wwFiltro.RefreshFilter;
      wwFiltro.FMant.cds2.Append;
   End;

   If wwAccion = 'M' Then
   Begin
      wwFiltro.FMant.cds2.Edit;
   End;

   If (wwAccion = 'A') Or (wwAccion = 'M') Then
   Begin
      For i := 0 To wwCdsLee.FieldCount - 1 Do
      Begin
         wwFiltro.FMant.cds2.FieldByName(wwCdsLee.Fields[i].FieldName).Value :=
            wwCdsLee.FieldByName(wwCdsLee.Fields[i].FieldName).Value;
      End;
      wwFiltro.FMant.cds2.Post;
   End;
End;

Procedure TDMFAC.cdsDetFact2ReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(Dataset, updateKind, E);
End;

Procedure TDMFAC.HojaExcel(Tit: String; TDs: TDataSource; TDb: TDBGrid);
Var
   Lcid, C, CH, CH1, I, W, X, Y, TotHoja: Integer;
   Bk: TBookmarkStr;
   Tabla: Variant;
   L, A: OleVariant;
   HH: Extended;
Begin
   If Not TDs.DataSet.Active Then Exit;
   If TDs.DataSet.RecordCount = 0 Then Exit;

   Lcid := GetUserDefaultLCID;
   C := TDb.Columns.Count;
   CH := 1;
   If TDs.DataSet.RecordCount > 15100 Then
   Begin
      HH := TDs.DataSet.RecordCount / 15100;
      CH := Trunc(HH);
      If Frac(HH) > 0 Then CH := CH + 1;
   End;

   ExcelApp.Visible[Lcid] := True;
   ExcelApp.Caption := 'Consultas en EXCEL';
   ExcelBook.ConnectTo(ExcelApp.Workbooks.Add(1, Lcid));
   If CH > 1 Then
   Begin
      ExcelBook.Worksheets.Add(NULL, NULL, (CH - 1), NULL, Lcid);
      For I := 1 To CH Do
      Begin
         WS.ConnectTo(ExcelBook.Worksheets[I] As _Worksheet);
         WS.Name := Tit + '_' + IntToStr(I);
      End;
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);
   If CH = 1 Then WS.Name := Tit;
   ExcelApp.ScreenUpdating[Lcid] := False;
   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);
      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         WS.Range[L, L].Value2 := TDb.Columns[I].Title.Caption;
      End;
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);

   CH1 := 1;
   W := 2;
   I := 1;
   Y := 1;
   TotHoja := 0;
   TDs.DataSet.DisableControls;
   Bk := TDs.DataSet.Bookmark;

   Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
   TDs.DataSet.First;
   While Not TDs.DataSet.Eof Do
   Begin
      For X := 0 To (C - 1) Do
         Tabla[Y, X] := TDs.DataSet.Fields[X].AsString;
      If Y = 5000 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I + 1, C]].Value2 := Tabla;
         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;

         Y := 0;
         W := I + 2;
      End;
      Inc(Y, 1);
      Inc(I, 1);
      Inc(TotHoja, 1);
      If TotHoja = 15100 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I, C]].Value2 := Tabla;

         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;

         CH1 := CH1 + 1;
         WS.ConnectTo(ExcelBook.Worksheets[CH1] As _Worksheet);
         WS.Activate(Lcid);

         Y := 1;
         W := 2;
         I := 1;
         TotHoja := 0;
      End;
      Application.ProcessMessages;
      TDs.DataSet.Next;
   End;
   CH1 := I;
   Try
      WS.Range['A' + IntToStr(W), WS.Cells.Item[CH1, C]].Value2 := Tabla;
   Finally
      Tabla := Unassigned;
   End;

   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);

      SetLength(FormatCel, C + 1);
      FormatosCeldas(C, TDs);
      For I := 1 To C Do
      Begin
         L := WS.Cells.Item[1, I];
         WS.Range[L, L].EntireColumn.NumberFormat := FormatCel[I];
      End;

      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         Y := TDs.DataSet.Fields[I].DisplayWidth;
         If Length(TDb.Columns[I].Title.Caption) > Y Then
            Y := Length(TDb.Columns[I].Title.Caption);
         WS.Range[L, L].EntireColumn.ColumnWidth := Y + 2;
         If TDb.Columns[I].Alignment = taLeftJustify Then A := 2;
         If TDb.Columns[I].Alignment = taCenter Then A := 3;
         If TDb.Columns[I].Alignment = taRightJustify Then A := 4;
         WS.Range[L, L].EntireColumn.HorizontalAlignment := A;
      End;

      L := WS.Cells.Item[1, C];
      WS.Range['A1', L].HorizontalAlignment := 3;
      WS.Range['A1', L].Interior.Color := clMaroon;
      WS.Range['A1', L].Font.Color := clWhite;
      WS.Range['A1', L].Font.Bold := True;

      If CH = 1 Then
         W := TDs.DataSet.RecordCount + 1
      Else
         If (CH > 1) And (X < CH) Then
            W := 15101
         Else
            If (CH > 1) And (X = CH) Then W := CH1;

      WS.PageSetup.PrintGridlines := True;
      WS.PageSetup.PrintTitleRows := '1:1';

      WS.DefaultInterface.Set_DisplayAutomaticPageBreaks(Lcid, True);
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);

   ExcelApp.ScreenUpdating[Lcid] := True;

   TDs.DataSet.EnableControls;
   TDs.DataSet.Bookmark := Bk;
End;

Procedure TDMFAC.FormatosCeldas(N: Integer; TDs: TDataSource);
Var
   I: Integer;
   F: TFieldDef;
Begin
   For I := 1 To N Do
   Begin
      F := TDs.DataSet.FieldDefs.Items[I - 1];
      Case F.DataType Of
         ftString: FormatCel[I] := DMFAC.StrZero('0', Length(TDs.DataSet.Fields[I - 1].AsString));
         ftDate: FormatCel[I] := 'dd/mm/yyyy';
         ftDateTime: FormatCel[I] := 'dd/mm/yyyy';
         ftTimeStamp: FormatCel[I] := 'dd/mm/yyyy';
         ftUnknown: FormatCel[I] := DMFAC.StrZero('0', Length(TDs.DataSet.Fields[I - 1].AsString));
      Else
         FormatCel[I] := Null;
      End;
   End;

End;

Function TDMFAC.ObtenerIpdeNetbios(Host: String): String;
Var
   WSAData: TWSADATA;
   HostEnt: phostent;
Begin
   Result := '';
   If WSAStartup(MAKEWORD(1, 1), WSADATA) = 0 Then
   Begin
      HostEnt := gethostbyname(PChar(Host));
      If HostEnt <> Nil Then
         Result := String(inet_ntoa(PInAddr(HostEnt.h_addr_list^)^));
      WSACleanup;
   End;
End;

Function TDMFAC.ComputerName: String;
Var
   Buffer: Array[0..100] Of Char;
   MaxSize: Cardinal;
Begin
   MaxSize := SizeOf(Buffer);
   If Not GetComputerName(@Buffer, MaxSize) Then
      Raise Exception.Create('No puedo determinar el nombre de la máquina');
   Result := StrPas(@Buffer);
End;

Function TDMFAC.AccesosModulo: Boolean;
Var
   xSQL: String;
   xfecfin: TDate;
   xdiasexppass: Integer;
   xdiasfaltantes: Integer;
   xdiasduracpass: Integer;
   xpassact, xctrl_ip, xingresa: String;
Begin
// busca en tabla DE USUARIO (TGE006) para determinar que es un usuario de base de datos
   xSQL := 'select FECEXP, OFDESID, nvl(CTRL_IP,''S'') CTRL_IP, '
      + '       TO_DATE(nvl(FECINI_PWD,sysdate-30)) FECINI_PWD, '
      + '       TO_DATE(nvl(FECFIN_PWD, sysdate-1)) FECFIN_PWD, '
      + '       nvl(DIASEXP_PWD,7) DIASEXP_PWD,'
      + '       nvl(DIASDURAC_PWD,30) DIASDURAC_PWD '
      + 'from TGE006 '
      + 'where USERID = ' + QuotedStr(wUsuario);
   cdsQry.Close;
   cdsQry.DataRequest(xSql);
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      Showmessage('Usuario no reconocido para el uso de Aplicaciones');
      Result := False;
      Exit;
   End;

// valida que contraseña en control de aplicaciones (TGE006), no haya expirado
   If (cdsQry.FieldByName('FECEXP').AsDateTime > 0) And
      (cdsQry.FieldByName('FECEXP').AsDateTime < Date) Then
   Begin
      Showmessage('Usuario ha caducado para el uso de Aplicaciones');
      Result := False;
      Exit;
   End;
   xfecfin := cdsQry.FieldByName('FECFIN_PWD').AsDateTime;
   xdiasexppass := cdsQry.FieldByName('DIASEXP_PWD').AsInteger;
   xdiasduracpass := cdsQry.FieldByName('DIASDURAC_PWD').AsInteger;
   //xpassact        := FCtrlAcceso.dbePassword.Text;

   wOfiId := cdsQry.FieldByName('OFDESID').AsString;
   xctrl_ip := cdsQry.FieldByName('CTRL_IP').AsString;
   widepc := computerName;

// determina que el usuario tenga acceso al módulo
// busca en tabla TGE006 para determinar que es un usuario de base de datos y de la aplicación
   xSQL := 'Select USUARIOS.USERID, USUARIOS.USERNOM, USUARIOGRUPO.GRUPOID, '
      + '       GRUPOS.GRUPODES, GRUPOS.GRUPOADM, ACCESOGRUPO.MODULOID, '
      + '       ACCESOGRUPO.TIPO, ACCESOGRUPO.OBJETO, ACCESOGRUPO.FORMA '
      + 'From TGE006 USUARIOS, TGE007 USUARIOGRUPO, TGE003 GRUPOS, TGE001 ACCESOGRUPO '
      + 'where USUARIOS.USERID=' + quotedstr(wUsuario) // -- TGE006 USUARIOS
      + '  and USUARIOGRUPO.USERID=USUARIOS.USERID' // -- TGE007 USUARIOGRUPO
      + '  and GRUPOS.GRUPOID=USUARIOGRUPO.GRUPOID' // -- TGE003 GRUPOS
      + '  and ACCESOGRUPO.GRUPOID=USUARIOGRUPO.GRUPOID '
      + '  and ACCESOGRUPO.MODULOID=' + quotedstr(wModulo)
      + '  and ACCESOGRUPO.TIPO=''0'' '; // TGE001 ACCESOGRUPO
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No tiene Acceso al módulo');
      Result := False;
      Exit;
   End;

// IP de la PC del usuario
   cIP := trim(ObtenerIpdeNetbios(computerName));

// Identifica si el usuario puede ejecutar los sistemas de cualquier maquina
// o solo de las máquina que se le han asignado
   xingresa := 'N';
   If xctrl_ip = 'S' Then
   Begin
      xSQL := 'SELECT IP_ASIGNADO FROM TGE010 WHERE USERID = ' + QuotedStr(DMFAC.wUsuario);
      cdsQry.Close;
      cdsQry.DataRequest(xSQL);
      cdsQry.Open;
      While Not cdsQry.Eof Do
      Begin
         If cdsQry.FieldByName('IP_ASIGNADO').AsString = cIP Then xingresa := 'S';
         cdsQry.Next;
      End;
   End;

   If (xingresa = 'N') And (xctrl_ip = 'S') Then
   Begin
      Showmessage('Usuario no autorizado para ingresar de este equipo');
      Result := False;
      Exit;
   End;

// DETERMINA NRO DE IDENTIFICADOR PARA GRABAR EN ARCHIVO LOG DE ACCESOS
// SE DETERMINA EN BASE A LA FECHA+HORA DE INGRESO A LA BASE DE DATOS
   xSQL := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') IDE, SYSDATE FECHORCON FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   ideconex := cdsQry.FieldByName('IDE').AsString;
   fechorcon := cdsQry.FieldByName('FECHORCON').AsString;

// Graba en archivo de auditoría : ACCESOS_LOG, el ingreso del usuario al módulo.
   DCOM1.AppServer.ConexionON(wUsuario, cIP, wModulo, ideconex, fechorcon, widepc);

// controla caducidad de contraseña
   xSQL := 'SELECT TO_DATE(' + QuotedStr(DateToStr(xfecfin)) + ') - TO_DATE(SYSDATE) DIASFALTANTE FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;

   xdiasfaltantes := cdsQry.FieldByName('DIASFALTANTE').AsInteger; // dias que faltan
   If xdiasfaltantes <= xdiasexppass Then
   Begin
      If xdiasfaltantes <= 0 Then
         MessageDlg('SU CONTRASEÑA HA CADUCADO, DEBE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
      Else
         If xdiasfaltantes = 1 Then
            MessageDlg('!!! FALTA 1 DíA PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡' + chr(13)
               + '            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0)
         Else
            MessageDlg('!!! FALTAN ' + IntToStr(xdiasfaltantes) + ' DÍAS PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡' + chr(13)
               + '            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0);
     { FCambioContrasena:= TFCambioContrasena.create(self);
      Try
         FCambioContrasena.ShowModal;
      Finally
         FCambioContrasena.Free;
      End;}
   End;
   If xdiasfaltantes <= 0 Then
   Begin
      Result := False;
     //RMZ Exit;
   End;

   Result := True;

End;

//INICIO HPC_201210_FAC

Function TDMFAC.fg_VerificaVersion(wgVersion: String): Boolean;
Var
   xsSQL: String;
Begin
   Result := False;
   xsSQL := 'SELECT * FROM TGE600 WHERE CODIGO = ' + QuotedStr(wModulo);
   cdsQry.Close;
   cdsQry.DataRequest(xsSQL);
   cdsQry.Open;
   If Trim(wgVersion) = Trim(cdsQry.FieldByName('VERSION').AsString) Then
      Result := True
   Else
      Result := False;
End;
//FIN HPC_201210_FAC

// Inicio HPC_201604_FAC

Function TDMFAC.wf_AccesoOpcion(wOpcion: String): Boolean;
Begin
   xSQL := 'Select OBJETO '
      + '     from TGE001 '
      + '    where GRUPOID=' + quotedstr(DMFAC.wGrupo)
      + '      and MODULOID=' + quotedstr(DMFAC.wModulo)
      + '      and TIPO=' + quotedstr('1')
      + '      and OBJETO=' + quotedstr(wOpcion);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No tiene Acceso a esta Opción');
      result := False;
   End
   Else
   Begin
      result := True;
   End;
End;
// Fin HPC_201604_FAC

End.

