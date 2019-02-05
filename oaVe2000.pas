Unit oaVe2000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaVe2000
// FORMULARIO               : FRegistros
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Contiene los métodos de la opcion de Transacciones
//

// Actualizaciones:
// HPC_201210_FAC 29/10/2012  Implementación del control de versiones
// HPC_201403_FAC 18/06/2014  Actualización de Version a 20140620083000
// HPC_201404_FAC 16/07/2014  Se Inicializa (nvl) valores de Terminal de Impresión
// HPC_201408_FAC             Se cambia descripción de Terminal, cuando no existe (nvl)
// HPC_201503_FAC 19/08/2015  Se valida en caso el usuario sea nuevo y no tenga proformas creadas
// HPC_201507_FAC 24/11/2014  Entrega al área de Calidad
// HPC_201603_FAC 08/08/2016 Cambio de Version a 20160808100000
// HPC_201604_FAC 21/10/2016 Cambio de Version a 20161024083000
// HPC_201701_FAC 30/06/2017  Adecuaciones para facturación Electrónica
// HPC_201801_FAC 19/03/2018  Se asigna el Tipo de Cliente derivado de la búsqueda en el Maestro de Clientes
//                            Retiro del Maestro de Cliente de Ventas
// HPC_201805_FAC 03/09/2018  Cambio de Version a 20180903083000
//                12/09/2018  Fuerza ejecución de evento onexit de nro de proforma
// FAC-201806     26/10/2018  Si no hay Tipo de Cambio para la fecha debe salir del formulario
//                31/10/2018  Cambio de Versión a FAC-201806
//

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, DBClient, wwclient, ExtCtrls, StdCtrls, Buttons, Wwdbigrd,
// Inicio HPC_201801_FAC
// 19/03/2018 Retiro del Maestro de Clientes
//   Grids, Wwdbgrid, Mask, wwdbedit, MsgDlgs, wwdbdatetimepicker, IniFiles, CLIEDM;
   Grids, Wwdbgrid, Mask, wwdbedit, MsgDlgs, wwdbdatetimepicker, IniFiles;
// Fin HPC_201801_FAC

Type
   TFRegistros = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }
      xxActualiza: Boolean;
      Procedure ToolAsociaCreate(Sender: TObject); //Asociados
      Procedure ToolCreateProf(Sender: TObject);

// FAC789 FToolProf
// FAC360VE FProforma
      Procedure ProformaInsert(Sender: TObject);
      Procedure ProformaEdita(Sender: TObject; MantFields: TFields);
      Procedure ProformaDelete(Sender: TObject; MantFields: TFields);

// FAC370 FFactSGuia
// FAC700 FToolFactSG
      Procedure ToolCreateFactSG(Sender: TObject); //Facturación sin Guias
      Procedure FactSGuiaInsert(Sender: TObject);
      Procedure FactSGuiaEdita(Sender: TObject; MantFields: TFields);
      Procedure DeleteFacSGuia(Sender: TObject; MantFields: TFields);

// FAC771 FToolAportes
      Procedure PGridShow(Sender: TObject);
      Procedure MueveMouse(xObjeto: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure OnEditAsoCta(Sender: TObject; MantFields: TFields);
// Inicio HPC_201701_FAC
//        Adecuaciones para facturación Electrónica
      Procedure OnEditCliente(Sender: TObject; MantFields: TFields);
// Fin HPC_201701_FAC

// Fac200 FMaesClie
   // Inicio HPC_201801_FAC
   // 19/03/2018 Retiro del Maestro de Clientes
      {
      Procedure AdicMaesClie(Sender: TObject);
      Procedure EditaMaesClie(Sender: TObject; MantFields: TFields);
      Procedure DeleteMaesClie(Sender: TObject; MantFields: TFields);
      }
   // Fin HPC_201801_FAC

   End;

Procedure VEProforma; stdcall;
Procedure VEProforma00; stdcall;
Procedure VEFacturaSG; stdcall;
Procedure VEFacturaSG00; stdcall;
Procedure VELPrecio; stdcall;
Procedure VEDataModuloClie; stdcall; //
Procedure VEMaesClie; stdcall;
// Inicio HPC_201507_FAC
//Procedure VEDescargaDepositos; stdcall;
// Fin HPC_201507_FAC
Procedure VEActualizaDatos; stdcall;
Procedure VEEntregaObsequios; stdcall;
Procedure VEVerificaVersion; stdcall;

Exports
   VEProforma, VEProforma00, VEFacturaSG, VEFacturaSG00, VELPrecio, VEMaesClie,
   VEVerificaVersion,
// Inicio HPC_201507_FAC
//   VEDescargaDepositos, VEActualizaDatos, VEEntregaObsequios, VEDataModuloClie;
   VEActualizaDatos, VEEntregaObsequios, VEDataModuloClie;
// Fin HPC_201507_FAC
Var
   FRegistros: TFRegistros;
   MtxAsocia: TMant;
   wFormaOrigen: String;
   GPedido,
      GFactura,
      GLPrecio,
      Mantc: TMant;
   fSigue: Boolean;
   fFacxCob: Boolean;
   cFlgComb: String;
   fSelCom: Boolean;
   sSupervisor: String;
   sAcepta: String;
   sAdmTienda: String;
   sFlAnula: String;
   sFlDscto: String;
   sEstadistica: String;

Implementation

{$R *.dfm}

// Inicio HPC_201808_CLI
// Retiro del Maestro de Clientes del sistema de Ventas
//Uses FACDM, FAC360VE, FAC789, FAC771, FAC370, FAC700, FAC265VE, Fac200,
Uses FACDM, FAC360VE, FAC789, FAC771, FAC370, FAC700, FAC265VE,
// Inicio HPC_201507_FAC - se quita FAC376
//   FAC374, FAC376, FAC390, FAC388, FAC396; //, CLIEDM;
   FAC374, FAC390, FAC388, FAC396; //, CLIEDM;
// Fin HPC_201507_FAC
// Fin HPC_201808_CLI


// FAC789    FToolProf
// FAC360VE  FProforma
// FAC771    FToolAportes
// FAC370    FFactSGuia
// FAC700    FToolFactSG
// FAC265VE  FLisPre
// Fac200    FMaesClie
// FAC374    FCobroServicios
// FAC376    FDescargo
// FAC390    FActualizaDatos
// FAC396    FObsequios

Procedure VEEntregaObsequios;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   Try
      FObsequios := TFObsequios.create(Application);
      FObsequios.ShowModal;
   Finally
      FObsequios.Free;
    //FVariables.w_Num_Formas:=FVariables.w_Num_Formas-1;
   End;
End;

Procedure VEActualizaDatos;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   Try
      FActualizaDatos := TFActualizaDatos.create(Application);
      FActualizaDatos.ShowModal;
   Finally
      FActualizaDatos.Free;
   End;
End;

// Inicio HPC_201507_FAC - Se retira Procedure
{
Procedure VEDescargaDepositos;
Var
   xSQL: String;
   cFilterCiaUser: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   Try
      FDescargo := TFDescargo.create(Application);
      FDescargo.ShowModal;
   Finally
      FDescargo.Free;
   End;
End;
}
// Fin HPC_201507_FAC

Procedure VEProforma;
Var
   xSQL: String;
   cFilterCiaUser: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   FRegistros := TFRegistros.Create(Application);
   Screen.Cursor := crHourGlass;
   DMFAC.FiltraTabla(DMFAC.cdsTLista, 'FAC101', 'TLISTAID');
   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

   cFilterCiaUser := DMFAC.FiltraCiaPorUsuario(DMFAC.cdsCia);

   xSQL := ' Select nvl(VEFLAGGADM,''N'') ACEPTAR, nvl(VEFLAG,''N'') SUPERVISOR, nvl(VECUENTA,''N'') ESTADISTICA, TER_DES, TER_SER, SER_VEN '
      + '   From FAC206 A, CXC203 B, FAC_TERMINAL C '
      + '  Where A.USERID=''' + DMFAC.wUsuario + ''' AND A.CIAID=B.CIAID(+) AND A.VEID=B.VEID(+)'
      + '    and A.CIAID=C.CIAID(+) AND A.TER_ID=C.TER_ID(+)';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.DataRequest(xSQL);
   Try
      sAcepta := 'N';
      DMFAC.cdsQry3.Open;
      sAcepta := DMFAC.cdsQry3.FieldByname('ACEPTAR').AsString;
      sSupervisor := DMFAC.cdsQry3.FieldByname('SUPERVISOR').AsString;
      sEstadistica := DMFAC.cdsQry3.FieldByname('ESTADISTICA').AsString;
   Except
      ShowMessage('Error : Falta registrar a Usuario en Tabla de Vendedores (CXC203/FAC206)');
      Exit;
   End;

   xSQL := 'SELECT * FROM FAC312 WHERE CIAID =' + quotedstr('jjjjjj');
   DMFAC.cdsReporte.Close;
   DMFAC.cdsDetProf.Close;

   xSQL := ' SELECT TRIID,TRIDES,TRIABR,TRIGENFACT,TRIFLAGV '
      + '   FROM TGE208 '
      + '  WHERE TRISGT = ''S'' '
      + '    AND TRIFLAGV=''S'' ';
   DMFAC.cdsTTran.Close;
   DMFAC.cdsTTran.DataRequest(xSQL);
   DMFAC.cdsTTran.Open;
   DMFAC.cdsTTran.IndexFieldNames := 'TRIID';

   DMFAC.cdsDireccion.Open;

   Try
      FToolProf := TFToolProf.Create(Application);
      FToolProf.Visible := False;
      DMFAC.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      GPedido := TMant.Create(Application);
      GPedido.Admin := DMFAC.wAdmin;
      GPedido.Module := DMFAC.wModulo;
      GPedido.OnInsert := FRegistros.ProformaInsert;
      GPedido.OnCreateMant := FRegistros.ToolCreateProf;
      GPedido.DComC := DMFAC.DCOM1;
      GPedido.OnEdit := FRegistros.ProformaEdita;
      GPedido.OnDelete := FRegistros.ProformaDelete;
      GPedido.OnShow := FRegistros.PGridShow;
      GPedido.ClientDataSet := DMFAC.cdsProforma;
      GPedido.TableName := 'FAC311';
      GPedido.Titulo := 'Proformas';
      GPedido.User := DMFAC.wUsuario;
      Gpedido.Filter := cFilterCiaUser;
      GPedido.SectionName := 'FACProforma';
      GPedido.FileNameIni := '\oaFAC.INI';
      GPedido.OnCierra := DMFAC.DisminuyeForma;
      GPedido.Execute;
   Finally
   End;
   Screen.Cursor := crDefault;
End;

Procedure VEProforma00;
Var
   xSQL, xWhere: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   xWhere := 'TMONID =' + QuotedStr(DMFAC.wTMonExt)
      + ' and FECHA = ' + DMFAC.wRepFuncDate + '''' + FormatDateTime(DMFAC.wFormatFecha, DMFAC.DateS) + '''' + ')';
   If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xWhere, 'TMONID')) = 0 Then
   Begin
      ShowMessage('Fecha No tiene Tipo de Cambio, regularice y luego reintente nuevamente');
      exit;
   End;

   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

   xSQL := ' Select nvl(VEFLAGGADM,''N'') ACEPTAR, nvl(VEFLAG,''N'') SUPERVISOR, nvl(VECUENTA,''N'') ESTADISTICA, TER_DES, TER_SER, SER_VEN '
      + '   From FAC206 A, CXC203 B, FAC_TERMINAL C '
      + '  Where A.USERID=''' + DMFAC.wUsuario + ''' AND A.CIAID=B.CIAID(+) AND A.VEID=B.VEID(+)'
      + '    and A.CIAID=C.CIAID(+) AND A.TER_ID=C.TER_ID(+)';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.DataRequest(xSQL);
   Try
      sAcepta := 'N';
      DMFAC.cdsQry3.Open;
      sAcepta := DMFAC.cdsQry3.FieldByname('ACEPTAR').AsString;
      sSupervisor := DMFAC.cdsQry3.FieldByname('SUPERVISOR').AsString;
      sEstadistica := DMFAC.cdsQry3.FieldByname('ESTADISTICA').AsString;
   Except
      ShowMessage('Error : Falta registrar a Usuario en Tabla de Vendedores (CXC203/FAC206)');
      Exit;
   End;

   xSQL := 'SELECT * FROM FAC312 WHERE 1<>1';
   DMFAC.cdsReporte.Close;
   DMFAC.cdsDetProf.Close;

   xSQL := ' SELECT TRIID,TRIDES,TRIABR,TRIGENFACT,TRIFLAGV '
      + '   FROM TGE208 '
      + '  WHERE TRISGT = ''S'' '
      + '    AND TRIFLAGV=''S'' ';
   DMFAC.cdsTTran.Close;
   DMFAC.cdsTTran.DataRequest(xSQL);
   DMFAC.cdsTTran.Open;
   DMFAC.cdsTTran.IndexFieldNames := 'TRIID';

   DMFAC.cdsDetProf.Filter := '';
   DMFAC.cdsDetProf.Filtered := False;
   DMFAC.cdsDetProf.IndexFieldNames := '';
   DMFAC.cdsDetProf.DataRequest(xSQL);
   DMFAC.cdsDetProf.Open;
   DMFAC.cdsDireccion.Open;

   xSQL := 'select * from FAC311 '
      + ' where PROFUSER=' + quotedstr(DMFAC.wUsuario)
      + '   and PROFID=(select substr(max(TO_CHAR(PROFFECHA,''YYYYMMDD'')||PROFID),9,10) PROFID '
      + '                 from FAC311 where PROFUSER=' + quotedstr(DMFAC.wUsuario)
      + '               ) '
      + ' order by PROFFECHA';
   DMFAC.cdsProforma.Close;
   DMFAC.cdsProforma.DataRequest(xSQL);
   DMFAC.cdsProforma.Open;

   DMFAC.wModo := 'A';
   DMFAC.wTipoAdicion := 'Directo';
   FProforma := TFProforma.Create(Application);
   FProforma.ActiveMDIChild;
End;

Procedure VEFacturaSG;
Var
   sDesde: String;
   Y, M, D: Word;
   cFilterCiaUser: String;
   inifile2: TIniFile;
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   // TERMINAL
   inifile2 := TIniFile.Create(ExtractFilePath(application.ExeName) + '\PuntoVenta.ini');
   DMFAC.wTerminal := IniFile2.ReadString('TERMINAL', 'TE_SERIE', '');
   DMFAC.wPC_Serie := IniFile2.ReadString('TERMINAL', 'PC_SERIE', '');
   DMFAC.wPR_serie := IniFile2.ReadString('TERMINAL', 'PR_SERIE', '');

   DecodeDate(Date, Y, M, D);
   Screen.Cursor := crHourGlass;
   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

   cFilterCiaUser := DMFAC.FiltraCiaPorUsuario(DMFAC.cdsCia);

   DMFAC.cdsQry8.Close;

   FToolFactSG := TFToolFactSG.Create(Application);
   sDesde := '01/' + IntToStr(M) + '/' + IntToStr(Y);
   FToolFactSG.dtpDesde.Date := StrToDate(sDesde);
   FToolFactSG.dtpHasta.Date := Date;
   FToolFactSG.Visible := False;

   xSQL := 'select CIAID, CIAUSER from TGE101 Where not CIAID in (''01'',''03'',''04'',''15'')';
   DMFAC.cdsQry10.Close;
   DMFAC.cdsQry10.indexfieldnames := '';
   DMFAC.cdsQry10.DataRequest(xSQL);
   DMFAC.cdsQry10.Open;

   xSQL := 'Select A.CIAID, nvl(VEFLAGGADM,''N'') ACEPTAR, nvl(VEFLAG,''N'') SUPERVISOR, nvl(VECUENTA,''N'') ESTADISTICA, '
      + '       nvl(TER_DES,'''') TER_DES, nvl(TER_SER,'''') TER_SER, nvl(SER_VEN,'''') SER_VEN, '
      + '       nvl(VEFCORP,''N'') ADMTIENDA, nvl(VEFLCOM,''N'') ANULAR, nvl(FLAGDESC,''N'') DSCTO '
      + '  From FAC206 A, CXC203 B, FAC_TERMINAL C '
      + ' Where A.USERID=''' + DMFAC.wUsuario + ''' AND A.CIAID=B.CIAID(+) AND A.VEID=B.VEID(+)'
      + '   and A.CIAID=C.CIAID(+) AND A.TER_ID=C.TER_ID(+)';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.DataRequest(xSQL);
   Try
      sAcepta := 'N';
      DMFAC.cdsQry3.Open;
      sAcepta := DMFAC.cdsQry3.FieldByname('ACEPTAR').AsString;
      sSupervisor := DMFAC.cdsQry3.FieldByname('SUPERVISOR').AsString;
      sAdmTienda := DMFAC.cdsQry3.FieldByname('ADMTIENDA').AsString;
      sFlAnula := DMFAC.cdsQry3.FieldByname('ANULAR').AsString;
      sFlDscto := DMFAC.cdsQry3.FieldByname('DSCTO').AsString;
      sEstadistica := DMFAC.cdsQry3.FieldByname('ESTADISTICA').AsString;
   Except
      ShowMessage('Error : Falta registrar a Usuario en Tabla de Vendedores (CXC203/FAC206)');
      Exit;
   End;

   DMFAC.wTerminal := DMFAC.cdsQry3.FieldByname('TER_DES').AsString;
   DMFAC.wPR_serie := DMFAC.cdsQry3.FieldByname('TER_SER').AsString;
   DMFAC.wVT_Serie := DMFAC.cdsQry3.FieldByname('SER_VEN').AsString;

   If sSupervisor = 'S' Then
   Begin
      If DMFAC.cdsQry3.FieldByname('CIAID').AsString = '04' Then
         FToolFactSG.sbtnInicial.Visible := False
      Else
         FToolFactSG.sbtnInicial.Visible := True;
   End;

   Try

      DMFAC.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      GFactura := TMant.Create(Application);
      GFactura.DComC := DMFAC.DCOM1;
      GFactura.Admin := DMFAC.wAdmin;
      GFactura.User := DMFAC.wUsuario;
      GFactura.Module := DMFAC.wModulo;
      GFactura.Titulo := 'Facturación';
      GFactura.TableName := 'FAC305';

      GFactura.TablaLlave := 'CIAID; DOCID; FACSERIE; NFAC; CLIEID';
      GFactura.Tabla2 := 'FAC306';
      GFactura.Tabla2Llave := 'CIAID; DOCID; FACSERIE; NFAC; CLIEID';

      GFactura.OnCreateMant := FRegistros.ToolCreateFactSG;
      GFactura.ClientDataSet := DMFAC.cdsFact2;
      GFactura.OnInsert := FRegistros.FactSGuiaInsert;
      GFactura.OnEdit := FRegistros.FactSGuiaEdita;
      GFactura.OnDelete := FRegistros.DeleteFacSGuia;
      GFactura.OnShow := FRegistros.PGridShow;
      GFactura.Filter := 'FACTIP =''N'' and ' + cFilterCiaUser;
      GFactura.SectionName := 'FACFacturación';
      GFactura.FileNameIni := '\oaFAC.INI';
      GFactura.OnCierra := DMFAC.DisminuyeForma;
      Screen.Cursor := crDefault;
      GFactura.Execute;
   Finally
   End;
End;

Procedure VEFacturaSG00;
Var
   xWhere: String;
   inifile2: TIniFile;
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   xWhere := 'USERID=' + QuotedStr(DMFAC.wUsuario) + ' AND NVL(CTLFAC,''N'')=''S''';
   If (DMFAC.wUsuario = DMFAC.BuscaQry('dspUltTGE', 'TGE006', 'USERID', xWhere, 'USERID')) Then
   Begin
      ShowMessage('Usuario No Puede registrar por esta Opción del Menú');
      Exit;
   End;

   xSQL := ' Select nvl(VEFLAGGADM,''N'') ACEPTAR, nvl(VEFLAG,''N'') SUPERVISOR, nvl(VECUENTA,''N'') ESTADISTICA, TER_DES, TER_SER, SER_VEN, '
      + '        nvl(VEFCORP,''N'') ADMTIENDA, nvl(VEFLCOM,''N'') ANULAR, nvl(FLAGDESC,''N'') DSCTO '
      + '   From FAC206 A, CXC203 B, FAC_TERMINAL C '
      + '  Where A.USERID=''' + DMFAC.wUsuario + ''' AND A.CIAID=B.CIAID(+) AND A.VEID=B.VEID(+)'
      + '    and A.CIAID=C.CIAID(+) AND A.TER_ID=C.TER_ID(+)';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.DataRequest(xSQL);
   Try
      sAcepta := 'N';
      DMFAC.cdsQry3.Open;
      sAcepta := DMFAC.cdsQry3.FieldByname('ACEPTAR').AsString;
      sSupervisor := DMFAC.cdsQry3.FieldByname('SUPERVISOR').AsString;
      sAdmTienda := DMFAC.cdsQry3.FieldByname('ADMTIENDA').AsString;
      sFlAnula := DMFAC.cdsQry3.FieldByname('ANULAR').AsString;
      sFlDscto := DMFAC.cdsQry3.FieldByname('DSCTO').AsString;
      sEstadistica := DMFAC.cdsQry3.FieldByname('ESTADISTICA').AsString;
   Except
      ShowMessage('Error : Falta registrar a Usuario en Tabla de Vendedores (CXC203/FAC206)');
      Exit;
   End;

   DMFAC.wTerminal := DMFAC.cdsQry3.FieldByname('TER_DES').AsString;
   DMFAC.wPR_serie := DMFAC.cdsQry3.FieldByname('TER_SER').AsString;
   DMFAC.wVT_Serie := DMFAC.cdsQry3.FieldByname('SER_VEN').AsString;

   xWhere := 'TMONID =' + QuotedStr(DMFAC.wTMonExt)
      + ' and FECHA = ' + DMFAC.wRepFuncDate + '''' + FormatDateTime(DMFAC.wFormatFecha, DMFAC.DateS) + '''' + ')';
   If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xWhere, 'TMONID')) = 0 Then
   Begin
      ShowMessage('Fecha No tiene Tipo de Cambio, regularice y luego reintente nuevamente');
      exit;
   End;

   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');
   DMFAC.wModo := 'A';
   DMFAC.wTipoAdicion := 'Directo';
   FFactSGuia := TFFactSGuia.Create(Application);
   FFactSGuia.ActiveMDIChild;
End;

Procedure VELPrecio;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   FLisPre := TFLisPre.Create(Application);
   Try
      FLisPre.ActiveMDIChild;
   Finally
   End;
End;

Procedure VEMaesClie;
Var
   xSQL: String;
Begin
// Inicio HPC_201801_FAC
// Retiro del Maestro de Clientes de OASIS-Ventas
{
// Registro de Maestro de Clientes
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

// DEPARTAMENTOS
   xSQL := 'SELECT SUBSTR(UBIGEOID,1,2) DPTOID,UBIGEODPTO DPTODES '
      + '  FROM TGE147 '
      + ' WHERE UBIGEOPROV IS NULL and SUBSTR(UBIGEOID,1,2)<>''00'' '
      + ' ORDER BY UBIGEOID';
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
   DMFAC.FiltraTabla(DMFAC.cdsSecEco, 'TGE163', 'SecEcoId');
   DMFAC.FiltraTabla(DMFAC.cdsTipPer, 'TGE109', 'TipPerId');
   DMFAC.FiltraTabla(DMFAC.cdsGiro, 'TGE116', 'GiroId');
   DMFAC.FiltraTabla(DMFAC.cdsClasif, 'TGE132', 'ClasifId');
   DMFAC.FiltraTabla(DMFAC.cdsVinculo, 'TGE133', 'VincId');
   DMFAC.FiltraTabla(DMFAC.cdsCIUU, 'TGE176', 'CIUUId');
   DMFAC.FiltraTabla(DMFAC.cdsCondP, 'TGE166', 'CONDPId');
   DMFAC.FiltraTabla(DMFAC.cdsTipBien, 'TGE164', 'TipBienId');
   DMFAC.FiltraTabla(DMFAC.cdsCargos, 'RRHH101', 'OCUPId');
   DMFAC.FiltraTabla(DMFAC.cdsTMon, 'TGE103', 'TMONID');
   DMFAC.cdsTMon.Filter := 'TMON_LOC=''L'' OR TMON_LOC=''E''';
   DMFAC.cdsTMon.Filtered := True;
   DMFAC.FiltraTabla(DMFAC.cdsZona, 'FAC105', 'TVDAID');
   DMFAC.FiltraTabla(DMFAC.cdsZona1, 'FAC106', 'ZVTAID');
   DMFAC.cdsTLista.Close;
   DMFAC.cdsTLista.DataRequest('SELECT * FROM FAC101');
   DMFAC.cdsTLista.Open;
   DMFAC.cdsSitClie.Open;
   DMFAC.cdsLineaCredito.DataRequest('SELECT * FROM CXC403');
   DMFAC.cdsClAux.Close;
   DMFAC.cdsClAux.DataRequest('SELECT * FROM TGE102 WHERE MODULO LIKE ' + QuotedStr('%FAC%'));
   DMFAC.cdsClAux.Open;
   DMFAC.cdsClAux.Filter := 'CLAUXCP=''C'' OR CLAUXCP=''A''';
   DMFAC.cdsClAux.Filtered := True;

   DMFAC.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
   Mantc := TMant.Create(Application);
   With Mantc Do
   Begin
      Admin := DMFAC.wadmin;
      Titulo := 'Maestro de Clientes';
      Module := DMFAC.wModulo;
      Tablename := 'TGE204';
      Filter := '';
      ClientDataset := DMFAC.cdsClie;
      DComC := DMFAC.DCOM1;
      User := DMFAC.wUsuario;

   // Eventos :
      OnInsert := FRegistros.AdicMaesClie;
      OnEdit := FRegistros.EditaMaesClie;
      OnDelete := FRegistros.DeleteMaesClie;
      SectionName := 'CXCClientes';
      FileNameIni := '\oaFAC.INI';
      OnCierra := DMFAC.DisminuyeForma;
      Execute;
   End;
}
// Fin HPC_201801_FAC
End;

// Inicio HPC_201801_FAC
// 19/03/2018 Retiro del Maestro de Clientes
{
Procedure TFRegistros.AdicMaesClie(Sender: TObject);
Var
   xSQL: String;
Begin
   If Not DMFAC.DCOM1.Connected Then Exit;

   xSQL := ' SELECT * FROM TGE204 '
      + '  WHERE CIAID=' + QuotedStr('XX')
      + '    AND CLAUXID=' + QuotedStr('XX')
      + '    AND CLIEID=' + QuotedStr('XX');
   DMFAC.cdsClie.Close;
   DMFAC.cdsClie.DataRequest(xSQL);
   DMFAC.cdsClie.Open;

   DMFAC.wModo := 'A';
   FMaesClie := TFMaesClie.Create(Application);
   FMaesClie.ActiveMDIChild;
End;
}
// Fin HPC_201801_FAC

Procedure TFRegistros.DeleteFacSGuia(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
   xSQL := ' Select * FROM FAC305 '
      + '  where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '    and LOCID=' + QuotedStr(MantFields.FieldByName('LOCID').AsString)
      + '    and TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString)
      + '    and ALMID=' + QuotedStr(MantFields.FieldByName('ALMID').AsString)
      + '    and DOCID=' + QuotedStr(MantFields.FieldByName('DOCID').AsString)
      + '    and FACSERIE=' + QuotedStr(MantFields.FieldByName('FACSERIE').AsString)
      + '    and NFAC=' + QuotedStr(MantFields.FieldByName('NFAC').AsString);
   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.DataRequest(xSQL);
   DMFAC.cdsFact2.Open;
   If DMFAC.cdsFact2.RecordCount = 0 Then
      exit;
   If (trim(DMFAC.cdsFact2.FieldbyName('FACESTADO').AsString) <> 'INICIAL') Then
   Begin
      ErrorMsg(Caption, 'Esta Factura ya fue Aceptada, No es Posible Eliminarla');
      Exit;
   End;
   If Question('Confirmar', 'Esta Seguro de Eliminar La Factura ' + #13 + #13 +
      'Nº ' + DMFAC.cdsFact2.FieldByName('NFAC').AsString + '  -  Cliente:  ' +
      DMFAC.cdsFact2.FieldByName('CLIEDES').AsString + #13 +
      #13 + ' Desea Continuar ') Then
   Begin
      Screen.Cursor := crHourGlass;
//      FVariables.w_VE_Registro := True;

      xFiltro := 'CIAID=' + quotedstr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
         + ' AND DOCID=' + quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
         + ' AND FACSERIE=' + quotedstr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
         + ' AND NFAC=' + quotedstr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
      Filtracds(DMFAC.cdsDetFact2, 'SELECT * FROM FAC306 WHERE ' + xFiltro);

      ErrorCount := 0;

      DMFAC.DCOM1.AppServer.IniciaTransaccion;
      DMFAC.cdsDetFact2.First;
      While Not DMFAC.cdsDetFact2.Eof Do
      Begin
         sSQL := 'CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString) + ' AND TINID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('TINID').AsString) + ' AND ARTID=' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString);
         If ((wFSerie = 'S') And (DMFAC.BuscaQry('dspUltTGE', 'TGE205', 'FNSERIE', sSQL, 'FNSERIE') = 'S')) Then
         Begin
            sSQL := ' UPDATE LOG332 '
               + '    SET ENTREGADO=''N'', FACSERIE=NULL, NFAC=NULL, TDAID2=NULL '
               + '  WHERE CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
               + '    AND LOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('LOCID').AsString)
               + '    AND TINID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('TINID').AsString)
               + '    AND ALMID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('ALMID').AsString)
               + '    AND ARTID=' + QuotedStr(DMFAC.cdsDetFact2.FieldByName('ARTID').AsString)
               + '    AND FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
               + '    AND NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
            Try
               DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
            Except
            End;
         End;
         DMFAC.cdsDetFact2.Next;
      End;

      sSQL := 'Delete FROM FAC306 '
         + ' where CIAID = ' + quotedstr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
         + '   and DOCID=' + quotedstr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
         + '   and FACSERIE=' + quotedstr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
         + '   and NFAC=' + quotedstr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      xBorrar := '1';

      DMFAC.cdsFact2.Delete;
      DMFAC.ControlTran(0, DMFAC.cdsFact2, 'FACSGUIA');
      DMFAC.ControlTran(8, Nil, '');
      xBorrar := '0';

      DMFAC.ActualizaFiltro(GFactura, DMFAC.cdsFact2, 'E');
      Screen.Cursor := crDefault;
   End;
End;

// Inicio HPC_201801_FAC
// 19/03/2018 Retiro del Maestro de Clientes
{
Procedure TFRegistros.DeleteMaesClie(Sender: TObject; MantFields: TFields);
Var
   xxCiaid, xxClieId, xxClAux: String;
   xSQL: String;
Begin
   If DMFAC.wAdmin <> 'G' Then
      Raise exception.create('No tiene Autorización para Eliminar el Registro');

   xxCiaid := MantFields.FieldByName('CIAID').AsString;
   xxClieId := MantFields.FieldByName('CLIEID').AsString;
   xxClaUX := MantFields.FieldByName('CLAUXID').AsString;

   xSQL := 'SELECT CLIEID FROM CXC301 WHERE CIAID=' + QuotedStr(xxCiaid) + ' AND CLIEID=' + QuotedStr(xxClieId);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount > 0 Then
      Raise exception.create('Cliente tiene documentos registrados. No es posible eliminar');

   If MantFields.FieldByName('FLAGMOV').AsString = 'S' Then
      Raise exception.create('Cliente tiene Pedidos. No es posible eliminar');

   If MessageDlg('¿  Eliminar Registro  ? ' + chr(13) + chr(13)
      + 'Cl.Auxiliar=' + '''' + xxClAux + '''' + chr(13)
      + 'Cliente    =' + '''' + xxClieId + '''' + chr(13) + chr(13),
      mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   xSQL := ' Delete from TGE204 '
      + '  Where CLIEID=' + quotedstr(xxClieId)
      + '    and CLAUXID=' + quotedstr(xxClAux);
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := 'Delete From TGE210 Where CLIEID=''' + xxClieId + '''';

   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := 'Delete From TGE211 Where CLIEID=''' + xxClieId + '''';
   Try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   DMFAC.ActualizaFiltro(Mantc, DMFAC.cdsClie, 'E');
   ShowMessage('Registro Eliminado')
End;
}
// Fin HPC_201801_FAC

// Inicio HPC_201801_FAC
// 19/03/2018 Retiro del Maestro de Clientes
{
Procedure TFRegistros.EditaMaesClie(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
   If Not DMFAC.DCOM1.Connected Then Exit;

   If (Not Mantc.FMant.Z2bbtnConsulta.Enabled) And
      (Not Mantc.FMant.Z2bbtnModifica.Enabled) Then
      Exit;
   If Mantc.FMant.Z2bbtnModifica.Enabled Then
      DMFAC.wModo := 'M'
   Else
      DMFAC.wModo := 'C';

   xSQL := ' Select * '
      + '   from TGE204 '
      + '  where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '    and CLAUXID=' + QuotedStr(MantFields.FieldByName('CLAUXID').AsString)
      + '    and CLIEID=' + QuotedStr(MantFields.FieldByName('CLIEID').AsString);
   DMFAC.cdsClie.Close;
   DMFAC.cdsClie.DataRequest(xSQL);
   DMFAC.cdsClie.Open;

   If DMFAC.cdsClie.recordcount = 0 Then exit;

   FMaesClie := TFMaesClie.Create(Application);
   FMaesClie.ActiveMDIChild;
End;
}
// Fin HPC_201801_FAC

Procedure TFRegistros.FactSGuiaEdita(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
   If Not DMFAC.DCOM1.Connected Then Exit;

   xSQL := ' Select * '
      + '   from FAC305 '
      + '  where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '    and LOCID=' + QuotedStr(MantFields.FieldByName('LOCID').AsString)
      + '    and TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString)
      + '    and ALMID=' + QuotedStr(MantFields.FieldByName('ALMID').AsString)
      + '    and DOCID=' + QuotedStr(MantFields.FieldByName('DOCID').AsString)
      + '    and FACSERIE=' + QuotedStr(MantFields.FieldByName('FACSERIE').AsString)
      + '    and NFAC=' + QuotedStr(MantFields.FieldByName('NFAC').AsString);
   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.DataRequest(xSQL);
   DMFAC.cdsFact2.Open;

// Inicio FAC-201806
// 26/10/2018 Si no hay Tipo de Cambio para la fecha debe salir del formulario
   If DMFAC.cdsFact2.FieldByName('FACESTADO').AsString='INICIAL' Then
   Begin
      xSQL := 'TMONID =' + QuotedStr(DMFAC.wTMonExt)
         + ' and FECHA = ' + DMFAC.wRepFuncDate + '''' + FormatDateTime(DMFAC.wFormatFecha, DMFAC.DateS) + '''' + ')';
      If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xSQL, 'TMONID')) = 0 Then
      Begin
         ShowMessage('Fecha No tiene Tipo de Cambio, regularice y luego reintente nuevamente');
         exit;
      End;
   End;
// Fin FAC-201806

   If DMFAC.cdsFact2.recordcount = 0 Then exit;

   DMFAC.wModo := 'M';
   FFactSGuia := TFFactSGuia.Create(Application);
   FFactSGuia.ActiveMDIChild;
End;

Procedure TFRegistros.FactSGuiaInsert(Sender: TObject);
Var
   xWhere: String;
   xSQL: String;
Begin
   If Not DMFAC.DCOM1.Connected Then Exit;
   xWhere := 'TMONID =' + QuotedStr(DMFAC.wTMonExt)
      + ' and FECHA = ' + DMFAC.wRepFuncDate + '''' + FormatDateTime(DMFAC.wFormatFecha, DMFAC.DateS) + '''' + ')';
   If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xWhere, 'TMONID')) = 0 Then
   Begin
      ShowMessage('Fecha No tiene Tipo de Cambio, regularice y luego reintente nuevamente');
      exit;
   End;

   DMFAC.wModo := 'A';

   fSigue := True;
   fFacxCob := False;

// Ejecuta rutina de Caja
   xWhere := 'USERID=' + QuotedStr(DMFAC.wUsuario) + ' AND NVL(CTLFAC,''N'')=''S''';
   If (DMFAC.wUsuario = DMFAC.BuscaQry('dspUltTGE', 'TGE006', 'USERID', xWhere, 'USERID')) Then
   Begin
      Try
         fSigue := False;
         FCobroServicios := TFCobroServicios.Create(self);
         FCobroServicios.ShowModal;
      Finally
         FCobroServicios.Free;
      End;

      If fSigue Then
      Begin
         xSQL := 'SELECT * FROM FAC305 '
            + ' WHERE CIAID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
            + '   AND DOCID=' + QuotedStr(DMFAC.cdsFact2.FieldByName('DOCID').AsString)
            + '   AND FACSERIE=' + QuotedStr(DMFAC.cdsFact2.FieldByName('FACSERIE').AsString)
            + '   AND NFAC=' + QuotedStr(DMFAC.cdsFact2.FieldByName('NFAC').AsString);
         DMFAC.cdsFact2.Close;
         DMFAC.cdsFact2.DataRequest(xSQL);
         DMFAC.cdsFact2.Open;

         DMFAC.wModo := 'M'
      End;
   End
   Else
   Begin
      xSQL := 'SELECT * FROM FAC305 WHERE 1<>1';
      DMFAC.cdsFact2.Close;
      DMFAC.cdsFact2.DataRequest(xSQL);
      DMFAC.cdsFact2.Open;
   End;

   If (fSigue) Or (fFacxCob) Then
   Begin
      FFactSGuia := TFFactSGuia.Create(Application);
      FFactSGuia.ActiveMDIChild;
   End;
End;

Procedure TFRegistros.MueveMouse(xObjeto: TObject; Shift: TShiftState; X,
   Y: Integer);
Var
   xComponente: String;
   xForma: TForm;
Begin
   xForma := Screen.ActiveForm;
   xComponente := xForma.Name;

   If xObjeto Is TForm Then
   Else
   Begin
      xComponente := xComponente + '.' + TControl(xObjeto).Name;
      DMFAC.wObjetoForma := xForma.Name;
      DMFAC.wObjetoNombr := TControl(xObjeto).Name;
      If Copy(DMFAC.wObjetoNombr, 2, 1) = '2' Then
         DMFAC.wObjetoDescr := DMFAC.wObjetoDesPr + ' - ' + TControl(xObjeto).Hint
      Else
      Begin
         DMFAC.wObjetoDescr := TControl(xObjeto).Hint;
      End;
   End;
End;

Procedure TFRegistros.OnEditAsoCta(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
   If Not DMFAC.DCOM1.Connected Then Exit;

   Screen.Cursor := crHourGlass;
   If wFormaOrigen = 'FACTURA' Then
   Begin
      FFactSGuia.dblcdAso.Text := MantFields.FieldByName('ASOID').AsString;
      FFactSGuia.dblcdAsoExit(Sender);
      TMant(Sender).FMant.Close;
      FFactSGuia.dblcdAso.SetFocus;
   End;
   If wFormaOrigen = 'PROFORMA' Then
   Begin
      FProforma.dblcdAso.Text := MantFields.FieldByName('ASOID').AsString;
      FProforma.dblcdAsoExit(Sender);
      TMant(Sender).FMant.Close;
      FProforma.dblcdAso.SetFocus;
   End;

   Screen.Cursor := crDefault;
End;

// Inicio HPC_201701_FAC
//        Adecuaciones para facturación Electrónica

Procedure TFRegistros.OnEditCliente(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
   If Not DMFAC.DCOM1.Connected Then Exit;

// Inicio HPC_201801_FAC
// Se asigna el Tipo de Cliente derivado de la búsqueda en el Maestro de Clientes
   If MantFields.FieldByName('ACTIVO').AsString<>'S' Then
   Begin
      ShowMessage('Situación del Registro del Cliente en Maestro esta DESACTIVO, regularice primero!');
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   If wFormaOrigen = 'FACTURA' Then
   Begin
      DMFAC.xgClAuxId := MantFields.FieldByName('CLAUXID').AsString;
      DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEID, TCLIEFLAG, TCLIEDES', 'CLAUXID=' + quotedstr(MantFields.FieldByName('CLAUXID').AsString), 'TCLIEFLAG');
      DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;
      FFactSGuia.dblcTClie.Text := DMFAC.cdsQry.FieldByName('TCLIEID').AsString;
      FFactSGuia.edtTClie.Text := DMFAC.cdsQry.FieldByName('TCLIEDES').AsString;

      FFactSGuia.dblcdAso.Text := MantFields.FieldByName('CLIEID').AsString;
      FFactSGuia.dblcdAsoExit(Sender);
      TMant(Sender).FMant.Close;
      Screen.Cursor := crDefault;
      FFactSGuia.dblcdAso.SetFocus;
   End;
   If wFormaOrigen = 'PROFORMA' Then
   Begin
      DMFAC.xgClAuxId := MantFields.FieldByName('CLAUXID').AsString;
      DMFAC.BuscaQry('dspUltTGE', 'FAC121', 'TCLIEID, TCLIEFLAG, TCLIEDES', 'CLAUXID=' + quotedstr(MantFields.FieldByName('CLAUXID').AsString), 'TCLIEFLAG');
      DMFAC.xTipCli := DMFAC.cdsQry.FieldByName('TCLIEFLAG').AsString;
      FProforma.dblcTClie.Text := DMFAC.cdsQry.FieldByName('TCLIEID').AsString;
      FProforma.edtTClie.Text := DMFAC.cdsQry.FieldByName('TCLIEDES').AsString;

      FProforma.dblcdAso.Text := MantFields.FieldByName('CLIEID').AsString;
      FProforma.dblcdAsoExit(Sender);
      TMant(Sender).FMant.Close;
      Screen.Cursor := crDefault;
      //FProforma.dblcdAso.SetFocus;
   // Inicio HPC_201805_FAC
   // fuerza salida de nro de proforma
      //FProforma.meNoPedido.SetFocus;
      FProforma.meNoPedidoExit(Sender);
   // Fin HPC_201805_FAC
   End;
// Fin HPC_201801_FAC

   Screen.Cursor := crDefault;
End;
// Fin HPC_201701_FAC

Procedure TFRegistros.PGridShow(Sender: TObject);
Var
   i: Integer;
   MGrid: TMant;
Begin

End;

Procedure TFRegistros.ProformaDelete(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
Begin
   sSQL := 'Select * from FAC311 '
      + ' Where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '   and LOCID=' + QuotedStr(MantFields.FieldByName('LOCID').AsString)
      + '   and TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString)
      + '   and ALMID=' + QuotedStr(MantFields.FieldByName('ALMID').AsString)
      + '   and PROFID=' + QuotedStr(MantFields.FieldByName('PROFID').AsString)
      + '   and CLIEID=' + QuotedStr(MantFields.FieldByName('CLIEID').AsString);
   DMFAC.cdsProforma.Close;
   DMFAC.cdsProforma.DataRequest(sSQL);
   DMFAC.cdsProforma.Open;

   If DMFAC.cdsProforma.RecordCount = 0 Then
      exit;

   If (trim(DMFAC.cdsProforma.FieldbyName('PROFSIT').AsString) = 'ACEPTADO') Then
   Begin
      ErrorMsg(Caption, 'Esta Proforma ya fue Aceptada, No es Posible Eliminarla');
      Exit;
   End;

   If (trim(DMFAC.cdsProforma.FieldbyName('PROFSIT').AsString) = 'ATENDIDO') Then
   Begin
      ErrorMsg(Caption, 'Esta Proforma ya fue Atendida, No es Posible Eliminarla');
      Exit;
   End;

   If Question('Confirmar', 'Se eliminará la Proforma Nº '
      + DMFAC.cdsProforma.FieldByName('PROFID').AsString + #13
      + 'Cliente: ' + DMFAC.cdsProforma.FieldByName('CLIEDES').AsString + #13 +
      #13 + ' ¿Desea Continuar? ') Then
   Begin
//      FVariables.w_VE_Registro := True;
      Screen.Cursor := crHourGlass;
      sSQL := 'DELETE FROM FAC312 '
         + ' WHERE CIAID = ''' + DMFAC.cdsProforma.FieldByName('CIAID').AsString + ''' '
         + '   AND PROFID=''' + DMFAC.cdsProforma.FieldByName('PROFID').AsString + '''';
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(sSQL);
      Except
      End;
      xBorrar := '1';
      DMFAC.cdsProforma.Delete;
      DMFAC.ControlTran(9, DMFAC.cdsProforma, 'PROF');
      xBorrar := '0';

      DMFAC.ActualizaFiltro(GPedido, DMFAC.cdsProforma, 'E');

      GPedido.FMant.cds2.Delete;

      Screen.Cursor := crDefault;
   End;
End;

Procedure TFRegistros.ProformaEdita(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
   If Not DMFAC.DCOM1.Connected Then Exit;
   xSQL := 'Select * '
      + '  from FAC311 '
      + ' Where CIAID=' + QuotedStr(MantFields.FieldByName('CIAID').AsString)
      + '   and LOCID=' + QuotedStr(MantFields.FieldByName('LOCID').AsString)
      + '   and TINID=' + QuotedStr(MantFields.FieldByName('TINID').AsString)
      + '   and ALMID=' + QuotedStr(MantFields.FieldByName('ALMID').AsString)
      + '   and PROFID=' + QuotedStr(MantFields.FieldByName('PROFID').AsString)
      + '   and CLIEID=' + QuotedStr(MantFields.FieldByName('CLIEID').AsString);
   DMFAC.cdsProforma.Close;
   DMFAC.cdsProforma.DataRequest(xSQL);
   DMFAC.cdsProforma.Open;

   xxActualiza := false;

   If DMFAC.cdsProforma.RecordCount = 0 Then
      Exit;

   DMFAC.wModo := 'M';
   FProforma := TFProforma.Create(Application);
   FProforma.ActiveMDIChild;
End;

Procedure TFRegistros.ProformaInsert(Sender: TObject);
Var
   xSQL, xWhere: String;
Begin
   If Not DMFAC.DCOM1.Connected Then Exit;

   xWhere := 'TMONID =' + QuotedStr(DMFAC.wTMonExt)
      + ' and FECHA = ' + DMFAC.wRepFuncDate + '''' + FormatDateTime(DMFAC.wFormatFecha, DMFAC.DateS) + '''' + ')';
   If length(DMFAC.BuscaQry('dspUltTGE', 'TGE107', 'TMONID, TCAMVBV', xWhere, 'TMONID')) = 0 Then
   Begin
      ShowMessage('Fecha No tiene Tipo de Cambio, regularice y luego reintente nuevamente');
      exit;
   End;

   xSQL := 'select * from FAC311 '
      + ' where PROFUSER=' + quotedstr(DMFAC.wUsuario)
      + '   and PROFID=(select substr(max(TO_CHAR(PROFFECHA,''YYYYMMDD'')||PROFID),9,10) PROFID '
      + '                 from FAC311 '
      + '                where PROFUSER=' + quotedstr(DMFAC.wUsuario)
      + '               ) '
      + ' order by PROFFECHA';
   DMFAC.cdsProforma.Close;
   DMFAC.cdsProforma.DataRequest(xSQL);
   DMFAC.cdsProforma.Open;

// Inicio HPC_201503_FAC
// Se valida en caso el usuario sea nuevo y no tenga proformas creadas
   If DMFAC.cdsProforma.recordcount = 0 Then
   Begin
      xSQL := ' Select A.CIAID '
         + '   From FAC206 A '
         + '  Where A.USERID=' + quotedstr(DMFAC.wUsuario);
      DMFAC.cdsQry.Close;
      DMFAC.cdsQry.IndexFieldNames := '';
      DMFAC.cdsQry.DataRequest(xSQL);
      DMFAC.cdsQry.Open;
      xSQL := 'select * from FAC311 '
         + ' where CIAID=' + quotedstr(DMFAC.cdsQry.FieldByName('CIAID').AsString)
         + '   and PROFID=(select substr(max(TO_CHAR(PROFFECHA,''YYYYMMDD'')||PROFID),9,10) PROFID '
         + '                 from FAC311 '
         + '                where CIAID=' + quotedstr(DMFAC.cdsQry.FieldByName('CIAID').AsString)
         + '               ) ';
      DMFAC.cdsProforma.Close;
      DMFAC.cdsProforma.DataRequest(xSQL);
      DMFAC.cdsProforma.Open;
   End;
// Fin HPC_201503_FAC

   DMFAC.wModo := 'A';
   FProforma := TFProforma.Create(Application);
   FProforma.ActiveMDIChild;
End;

Procedure TFRegistros.ToolAsociaCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolAportes.pnlBot;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFRegistros.ToolCreateFactSG(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolFactSG.pnlFact;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 2;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFRegistros.ToolCreateProf(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolProf.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure VEVerificaVersion;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   FRegistros := TFRegistros.Create(Application);
   If DMFAC.fg_VerificaVersion(FRegistros.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

// Inicio HPC_201801_FAC
// Retiro del Maestro de Cliente de Ventas
Procedure VEDataModuloClie; Stdcall;
Begin
{
   Application.Initialize;
   Try
      If (DMMClientes = Nil) Then
      Begin
         DMMClientes := TDMMClientes.Create(Application);
         DMMClientes.DCOM1 := DMFAC.DCOM1;
         DMMClientes.wUsuario := DMFAC.wUsuario;
         DMMClientes.wAdmin := DMFAC.wAdmin;
         DMMClientes.wGrupo := DMFAC.wGrupo;
         DMMClientes.wModulo := DMFAC.wModulo;
      End;
   Finally

   End;
}
End;
// Fin HPC_201801_FAC

End.

