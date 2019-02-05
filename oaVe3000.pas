Unit oaVe3000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaVe3000
// FORMULARIO               : FInformes
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Contiene los métodos de la opcion de Consultas
//

// Actualizaciones:
// HPC_201210_FAC 29/10/2012  Implementación del control de versiones
// HPC_201403_FAC 18/06/2014  Actualización de Version a 20140620083000
// HPC_201507_FAC 20/11/2014  Entrega al área de Calidad
// HPC_201603_FAC 08/08/2016  Cambio de Version a 20160808100000
// HPC_201604_FAC 21/10/2016  Cambio de Version a 20161024083000
// HPC_201805_FAC 03/09/2018  Cambio de Version a 20180903083000
// FAC-201806     31/10/2018  Cambio de Versión a FAC-201806
//

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, DB, ExtCtrls, StdCtrls, Buttons, Wwdbigrd, ComCtrls;

Type
   TFInformes = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }
      fl_sup, fl_adm: String;

      Procedure ConsClieArt(Sender: TObject; MantFields: TFields);
      Procedure PGridShow(Sender: TObject);
      Procedure ToolConsClieCreate(Sender: TObject); //Consulta por Cliente
      Procedure MueveMouse(xObjeto: TObject; Shift: TShiftState; X, Y: Integer);
      Procedure ConsPedEdita(Sender: TObject; MantFields: TFields);
      Procedure ConsArtEdita(Sender: TObject; MantFields: TFields);
      Procedure ConsArtPed(Sender: TObject; MantFields: TFields);
      Procedure ToolReportexArticulo(Sender: TObject);
      Procedure ToolConsRepDocsCreate(Sender: TObject);
      Procedure ToolResVtaNetaCreate(Sender: TObject); //Resumen de Ventas Netas
      Procedure ToolResVtaNacionalCreate(Sender: TObject); //Resumen de Ventas Nacional Importado
      Procedure ToolVentaNetaCreate(Sender: TObject); //Resumen de Ventas por Linea
      Procedure ToolCompraAcumCreate(Sender: TObject);
      Procedure ToolComisionCreate(Sender: TObject);
      Procedure ToolCostoVtaCreate(Sender: TObject);
      Procedure ToolVentaArticuloCreate(Sender: TObject);

   End;
// Inicio HPC_201507_FAC
//Procedure VEConsultaxCliente; stdcall;
// Fin HPC_201507_FAC
Procedure VEConsultaPorArticulos; stdcall;
Procedure VEConsultaPedidosPendientes; stdcall;
Procedure VEConsultaArticulosVendidos; stdcall;
Procedure VEDocumentosEmitidos; stdcall;
Procedure VEResumenVentaxVendedor; stdcall;
Procedure VEResumenVentaxVencimiento; stdcall;
Procedure VEResumenVentaNacionalImportado; stdcall;
Procedure VEResumenVentaNetaLinea; stdcall;
Procedure VEComprasAcumuladasCliente; stdcall;
Procedure VEComisiones; stdcall;
Procedure VECostoDeVentas; stdcall;
Procedure VEVentasLineaComercial; stdcall;
Procedure VEVentasConcesiones; stdcall;
Procedure VEVentaPorArticulos; stdcall;
Procedure VEVentaPorUsuario; stdcall;
Procedure VEVentaPorTienda; stdcall;
Procedure VEVentaAreaCompras; stdcall;
Procedure VEVentaUtilidad; stdcall;
Procedure VESeguimientoCompra; stdcall;
Procedure VEInscripcionIIForo; stdcall;
Procedure VEVerificaVersion; stdcall;

Exports
// Inicio HPC_201507_FAC
//   VEConsultaxCliente,
// Fin HPC_201507_FAC
   VEConsultaPorArticulos,
   VEConsultaPedidosPendientes,
   VEConsultaArticulosVendidos,
   VEDocumentosEmitidos,
   VEResumenVentaxVendedor,
   VEResumenVentaxVencimiento,
   VEResumenVentaNacionalImportado,
   VEResumenVentaNetaLinea,
   VEComprasAcumuladasCliente,
   VEComisiones,
   VECostoDeVentas,
   VEVentasLineaComercial,
   VEVentasConcesiones,
   VEVentaPorArticulos,
   VEVentaPorUsuario,
   VEVentaPorTienda,
   VEVentaUtilidad,
   VEVentaAreaCompras,
   VESeguimientoCompra,
   VEVerificaVersion,
   VEInscripcionIIForo;

Var
   FInformes: TFInformes;
   GReporte,
      GRepArt,
      GReporte2,
      Mtx: TMant;

Implementation

{$R *.dfm}

// Inicio HPC_201507_FAC - Se retira FAC784
//Uses FACDM, FAC783, FAC784, FAC798, FAC790, FAC788, FAC791, FAC792, FAC793, FAC796,
Uses FACDM, FAC783, FAC798, FAC790, FAC788, FAC791, FAC792, FAC793, FAC796,
// Fin HPC_201507_FAC
   FAC797, FAC702, FAC799, FAC800, FAC802, FAC804, FAC806, FAC807, FAC808, FAC810,
   FAC814;

// FAC783   FToolConsClie           Consulta por Cliente                   VEConsultaxCliente
// FAC702   FToolVentaArticulo      Congreso Encinas                       VEConsultaPorArticulos
// FAC798   FToolConsultaxArticulo  Consulta por Artículo                  VEConsultaArticulosVendidos
// FAC790   FToolRepDocs            Documentos Emitidos                    VEDocumentosEmitidos
//                                  Res. de Ventas por Vendedor            VEResumenVentaxVendedor
// FAC788   FToolResVtaNeta         Res. de Venta por Vencimiento          VEResumenVentaxVencimiento
// FAC791   FToolResNac             Res. Venta Nacional-Importado          VEResumenVentaNacionalImportado
// FAC792   FToolVtaNta             Res. de Venta Neta por Línea           VEResumenVentaNetaLinea

// .....

// FAC810   FRepTiendas             Ventas por Tienda                      VEVentaPorTienda

// FAC799   TFLineaComer            Venta por Linea Comercial de Bazar
// FAC800   FVentaConcesiones       Ventas por Concesiones
// FAC802   TFVentaPorArticulo      Ventas por Articulos
// FAC804   FVentaPorUsuario        Ventas por Usuario
// FAC806   FVentaUtilidad          Ventas por Utilidad
// FAC807   VESeguimientoCompra     Seguimiento por Compras
// FAC808   VEInscripcionIIForo     Listado de inscripciones al II Foro
// FAC810   FRepTiendas             Reporte por Tiendas
// FAC814   FCompras                Reporte para Compras

Procedure VEVentaAreaCompras;
Var
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   xSQL := 'Select nvl(VEFLAGGADM,''N'') ACEPTAR, '
      + '       nvl(VEFLAG,''N'') SUPERVISOR, '
      + '       nvl(VECUENTA,''N'') ESTADISTICA, '
      + '       nvl(VEFCORP,''N'') ADMTIENDA, '
      + '       nvl(VEFLCOM,''N'') ANULAR, '
      + '       nvl(FLAGDESC,''N'') DSCTO '
      + '  From FAC206 A, CXC203 B '
      + ' Where A.USERID=' + quotedstr(DMFAC.wUsuario)
      + '   and A.CIAID=B.CIAID(+) '
      + '   and A.VEID=B.VEID(+)';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(xSQL);
   Try
      DMFAC.cdsQry3.Open;
      If Not ((DMFAC.cdsQry3.FieldByname('ADMTIENDA').AsString = 'S')
         Or (DMFAC.cdsQry3.FieldByname('SUPERVISOR').AsString = 'S')
         Or (DMFAC.cdsQry3.FieldByname('ESTADISTICA').AsString = 'S')) Then
      Begin
         ShowMessage('No está Autorizado a esta Opción');
         Exit;
      End;
   Except
      ShowMessage('Error : Falta registrar a Usuario en Tabla de Usuario de Ventas (CXC203/FAC206)');
      Exit;
   End;

   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

   Try
      FCompras := TFCompras.Create(Application);
      FCompras.ShowModal;
   Finally
      FCompras.Free;
   End;
End;

Procedure VESeguimientoCompra;
Var
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   xSQL := 'Select nvl(VEFLAGGADM,''N'') ACEPTAR, '
      + '       nvl(VEFLAG,''N'') SUPERVISOR, '
      + '       nvl(VECUENTA,''N'') ESTADISTICA, '
      + '       nvl(VEFCORP,''N'') ADMTIENDA, '
      + '       nvl(VEFLCOM,''N'') ANULAR, '
      + '       nvl(FLAGDESC,''N'') DSCTO '
      + '  From FAC206 A, CXC203 B '
      + ' Where A.USERID=''' + DMFAC.wUsuario + ''' '
      + '   and A.CIAID=B.CIAID(+) '
      + '   and A.VEID=B.VEID(+)';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(xSQL);
   Try
      DMFAC.cdsQry3.Open;
      If Not ((DMFAC.cdsQry3.FieldByname('ADMTIENDA').AsString = 'S')
         Or (DMFAC.cdsQry3.FieldByname('SUPERVISOR').AsString = 'S')
         Or (DMFAC.cdsQry3.FieldByname('ESTADISTICA').AsString = 'S')) Then
      Begin
         ShowMessage('No está Autorizado a esta Opción');
         Exit;
      End;
   Except
      ShowMessage('Error : Falta registrar a Usuario en Tabla de Usuario de Ventas (CXC203/FAC206)');
      Exit;
   End;

   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

   Try
      FSeguimientoCompra := TFSeguimientoCompra.Create(Application);
      FSeguimientoCompra.ShowModal;
   Finally
      FSeguimientoCompra.Free;
   End;
End;

Procedure VEInscripcionIIForo;
Var
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   Try
      FInscripcionIIForo := TFInscripcionIIForo.Create(Application);
      FInscripcionIIForo.ShowModal;
   Finally
      FInscripcionIIForo.Free;
   End;
End;

{
Procedure VEConsultaxCliente;
Var
   xFiltro: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   Try
      DMFAC.cdsRepClie.Filter := '';
      DMFAC.cdsRepClie.IndexFieldNames := '';
      DMFAC.cdsRepClie.Close;

      xFiltro := ' Select C.CLIEID, C.CLIEDES, C.CLIERUC, A.MTOPEDSOLES, A.MTOPEDDOL, '
               + '        B.MTOATESOLES, B.MTOATEDOL, '
               + '        (nvl(A.MTOPEDSOLES,0)-nvl(B.MTOATESOLES,0)) MTOPENDSOLES, '
               + '        (nvl(A.MTOPEDDOL,0)  -nvl(B.MTOATEDOL,0))   MTOPENDDOL '
               + '   from TGE204 C, '
               + '       (Select A.CLIEID, SUM(NVL(PEDTOTMN,0)) MTOPEDSOLES, '
               + '               SUM(NVL(PEDTOTME,0)) MTOPEDDOL '
               + '          from FAC301 A GROUP BY A.CLIEID) A, '
               + '       (Select A.CLIEID, SUM(NVL(GREMTOTMN,0)) MTOATESOLES, '
               + '               SUM(NVL(GREMTOTME,0)) MTOATEDOL '
               + '          from FAC303 A group by A.CLIEID) B '
               + '  where (nvl(A.MTOPEDSOLES,0)<>0 OR '
               + '         nvl(A.MTOPEDDOL,0)<>0 OR '
               + '         nvl(B.MTOATESOLES,0)<>0 OR '
               + '         nvl(B.MTOATEDOL,0)<>0 ) '
               + '    and C.CLIEID=A.CLIEID '
               + '    and C.CLIEID=B.CLIEID';
      FToolConsClie := TFToolConsClie.Create(Application);

      GReporte := TMant.Create(Application);
      GReporte.Admin := DMFAC.wAdmin;
      GReporte.DComC := DMFAC.DCOM1;
      GReporte.Module := DMFAC.wModulo;
      GReporte.OnEdit := FInformes.ConsClieArt;
      GReporte.OnShow := FInformes.PGridShow;
      GReporte.UsuarioSQL.Add(xFiltro);
      GReporte.ClientDataSet := DMFAC.cdsQry1;
      GReporte.OnCreateMant := FInformes.ToolConsClieCreate;
      GReporte.TableName := 'VWFACREPCLIE';
      GReporte.Titulo := 'Consulta por Cliente';
      GReporte.User := DMFAC.wUsuario;
      GReporte.SectionName := 'FACRepClie';
      GReporte.FileNameIni := '\oaFAC.INI';
      GReporte.OnCierra := DMFAC.DisminuyeForma;
      GReporte.Execute;
   Finally
   End;
End;
}

Procedure VEConsultaPorArticulos;
Var
   sSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   If Not DMFAC.cdsCia.Active Then
      DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');
   Try
      Try
         FToolVentaArticulo := TFToolVentaArticulo.Create(Application);
         FToolVentaArticulo.ShowModal;
      Except
      End;
   Finally
      FToolVentaArticulo.Free;
   End;
End;

Procedure VEConsultaPedidosPendientes;
Var
   sSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   Try
      SSQL := ' Select SECT.TVTADES, C.VEID, C.VENOMBRES, '' '' CLIEID, '' '' CCOMERID, '
         + '        '' '' ARTID, '' '' CLIEDES, '' '' DCCOMDES, '
         + '        '' '' ARTDES, A.MTOPEDSOLES, A.MTOPEDDOL, B.MTOATESOLES, B.MTOATEDOL, '
         + '        (nvl(A.MTOPEDSOLES,0)-NVL(B.MTOATESOLES,0)) MTOPENDSOLES, '
         + '        (nvl(A.MTOPEDDOL,0) - NVL(B.MTOATEDOL,0)) MTOPENDDOL '
         + '   from CXC203 C, '
         + '        (Select A.VEID, sum(nvl(PEDTOTMN,0)) MTOPEDSOLES, '
         + '                sum(nvl(PEDTOTME,0)) MTOPEDDOL '
         + '           from FAC301 A GROUP BY A.VEID) A, '
         + '        (Select A.VEID, sum(nvl(GREMTOTMN,0)) MTOATESOLES, '
         + '                sum(nvl(GREMTOTME,0)) MTOATEDOL '
         + '           from FAC303 A GROUP BY A.VEID) B, '
         + '        FAC105 SECT '
         + '  where (nvl(A.MTOPEDSOLES,0)<>0 or '
         + '         nvl(A.MTOPEDDOL,0)<>0 or '
         + '         nvl(B.MTOATESOLES,0)<>0 or '
         + '         nvl(B.MTOATEDOL,0)<>0 ) '
         + '    and C.VEID=A.VEID '
         + '    and C.VEID=B.VEID '
         + '    and SECT.TVTAID=C.VETIPO';

      GReporte := TMant.Create(Application);
      GReporte.Admin := DMFAC.wAdmin;
      GReporte.DComC := DMFAC.DCOM1;
      GReporte.OnEdit := FInformes.ConsPedEdita;
      GReporte.OnShow := FInformes.PGridShow;
      GReporte.UsuarioSQL.Add(sSQL);
      GReporte.Module := DMFAC.wModulo;
      GReporte.ClientDataSet := DMFAC.cdsRepClie;
      GReporte.OnCreateMant := Nil;
      GReporte.TableName := 'VWFACREPPED';
      GReporte.Titulo := 'Consulta de Pedidos Pendientes';
      GReporte.User := DMFAC.wUsuario;
      GReporte.SectionName := 'FACRepPed';
      GReporte.FileNameIni := '\oaFAC.INI';
      GReporte.NoVisible.Add('ARTID');
      GReporte.NoVisible.Add('CLIEID');
      GReporte.NoVisible.Add('CCOMERID');
      GReporte.NoVisible.Add('ARTDES');
      GReporte.NoVisible.Add('CLIEDES');
      GReporte.NoVisible.Add('DCCOMDES');
      GReporte.OnCierra := DMFAC.DisminuyeForma;
      GReporte.Execute;
   Finally
   End;
End;

Procedure VEConsultaArticulosVendidos;
Var
   xSQL: String;
   a, m, d, a1, m1, d1: word;
   fecha, fecha1: TDateTime;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   Screen.Cursor := CrHourGlass;
   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');
   DMFAC.cdsCia.First;
   DecodeDate(date, a, m, d);
   fecha := StrToDate('01/' + IntToStr(m) + '/' + IntToStr(a));
   If m = 12 Then
      fecha1 := StrToDate('01/01/' + IntToStr(a + 1)) - 1
   Else
      fecha1 := StrToDate('01/' + IntToStr(m + 1) + '/' + IntToStr(a)) - 1;

   xSQL := ' Select B.CIAID, B.LOCID, B.TINID, B.ALMID, A.GRARID, A.FAMID, A.SFAMID, '
      + '        A.ARTID, A.ARTDES, '
      + '        A.UNMIDG, D.CIADES, E.LOCDES, F.TINDES, G.ALMDES, H.GRARDES, I.FAMDES, '
      + '        J.SFAMDES, L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, '
      + '        L.PROV, P.PROVDES, CARART, '
      + '        SUM(NVL(A.DFACCANTG,0)) VENTA, '
      + '        SUM(NVL(A.DFACMTOMN,0)) IMPMN, '
      + '        SUM(NVL(A.DFACMTOME,0)) IMPME '
      + '   from FAC306 A, FAC305 B, TGE101 D, TGE126 E, TGE152 F, TGE151 G, TGE131 H, TGE169 I, TGE170 J, '
      + '        TGE205 L, ALM_MAR_ART M, ALM_TIP_ART T, TGE201 P '
      + '  where A.CIAID=B.CIAID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
      + '    and B.CIAID=' + QuotedStr(DMFAC.cdsCia.FieldByName('CIAID').AsString)
      + '    and B.FACFECHA>=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, fecha) + '''' + ')'
      + '    and B.FACFECHA<=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, fecha1) + '''' + ')'
      + '    and B.FACESTADO=''ACEPTADO'' '
      + '    and (A.CIAID=D.CIAID(+)) '
      + '    and (A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+)) '
      + '    and (A.CIAID=F.CIAID(+) AND A.TINID=F.TINID(+)) '
      + '    and (A.CIAID=G.CIAID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+)) '
      + '    and (A.CIAID=H.CIAID(+) AND A.TINID=H.TINID(+) AND A.GRARID=H.GRARID(+)) '
      + '    and (A.CIAID=I.CIAID(+) AND A.TINID=I.TINID(+) AND A.GRARID=I.GRARID(+) AND A.FAMID=I.FAMID(+)) '
      + '    and (A.CIAID=J.CIAID(+) AND A.TINID=J.TINID(+) AND A.GRARID=J.GRARID(+) AND A.FAMID=J.FAMID(+) AND A.SFAMID=J.SFAMID(+)) '
      + '    and (L.CIAID(+)=A.CIAID and L.ARTID(+)=A.ARTID) '
      + '    and (L.MARCA=M.MARCA(+)) '
      + '    and (L.TIPART=T.TIPART(+)) '
      + '    and (P.CLAUXID(+)=''P'' AND L.PROV=P.PROV(+)) '
      + '  group by B.CIAID, B.LOCID, B.TINID, B.ALMID, A.GRARID, A.FAMID, A.SFAMID, A.ARTID, '
      + '           A.ARTDES, A.UNMIDG, D.CIADES, E.LOCDES, F.TINDES, G.ALMDES, H.GRARDES, '
      + '           I.FAMDES, J.SFAMDES, L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, '
      + '           L.PROV, P.PROVDES, L.CARART '
      + '  order by P.PROVDES, M.MARDES, T.TIPARTDES, A.ARTID';

   xSQL := 'select * from (' + xSQL + ') SOLVISTA ';

   Try
      FToolConsultaxArticulo := TFToolConsultaxArticulo.Create(Application);
      If DMFAC.cdsCia.RecordCount = 1 Then
         FToolConsultaxArticulo.edtCia.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(DMFAC.cdsCia.FieldByName('CIAID').AsString), 'CIADES');
      FToolConsultaxArticulo.dtpInicio.date := fecha;
      FToolConsultaxArticulo.dtpFin.date := fecha1;

      GReporte := TMant.Create(Application);
      GReporte.Admin := DMFAC.wAdmin;
      GReporte.Module := DMFAC.wModulo;
      GReporte.DComC := DMFAC.DCOM1;
      GReporte.OnEdit := Nil;
      GReporte.OnShow := FInformes.PGridShow;
      GReporte.UsuarioSQL.Add(xSQL);
      GReporte.ClientDataSet := DMFAC.cdsReporte;
      GReporte.OnCreateMant := FInformes.ToolReportexArticulo; // FAC798 - FToolConsultaxArticulo
      GReporte.TableName := 'VWFACARTVEN';
      GReporte.Titulo := 'Consulta de Artículos Vendidos';
      GReporte.User := DMFAC.wUsuario;
      GReporte.SectionName := 'FACRepxArt';
      GReporte.FileNameIni := '\oaFAC.INI';
      Screen.Cursor := CrDefault;
      GReporte.OnCierra := DMFAC.DisminuyeForma;
      GReporte.Execute;
   Finally
   End;
End;

Procedure VEDocumentosEmitidos;
Var
   sSQL, sDesde, sHasta: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
//   DMFAC.cdsTVta.Close;
//   DMFAC.cdsTVta.Open;
   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, Date));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, Date));

   sSQL := ' Select A.GREMFECHA FECHA, A.SERIE, A.NGUIA, A.SERIE||A.NGUIA NROGUIA, '
      + '        B.FACSERIE FACTURASERIE, B.NFAC FACTURANRO, '
      + '        A.TIPVTAID, A.CIAID, A.VEID, B.FACSERIE||B.NFAC NROFACTURA, A.PEDIDO, '
      + '        A.CLIEID, A.CLIEDES, C.DCCOMDES FPAGO, '
      + '        case when GREMESTADO=''ANULADO'' '
      + '             then ''GUIA ANULADA'' '
      + '             else case when A.TRIID<>' + Quotedstr(DMFAC.wTransVta)
      + '                       then D.TRIABR '
      + '                       else '''' '
      + '                   end '
      + '         end '
      + '        OBSERVACION, E.TVTADES '
      + '   from FAC303 A, FAC305 B, TGE180 C, TGE208 D, FAC105 E '
      + '  where A.GREMFECHA>=' + sDesde
      + '    and A.GREMFECHA<=' + sHasta
      + '    and A.SERIE=B.GUIASERIE(+) '
      + '    and A.NGUIA=B.GUIANUM(+) '
      + '    and A.CIAID=C.CIAID(+) '
      + '    and A.TIPVTAID=C.SCOMERID(+) '
      + '    and A.FPAGOID=C.CCOMERID(+) '
      + '    and A.TRIID=D.TRIID(+) '
      + '    and A.TIPVTAID=E.TVTAID(+) '
      + '  order BY A.GREMFECHA, A.NGUIA';

   Try
      FToolRepDocs := TFToolRepDocs.Create(Application);
      FToolRepDocs.Visible := False;
      FToolRepDocs.dbdtpGFecIni.Date := Date;
      FToolRepDocs.dbdtpGFecFin.Date := Date;

      FToolRepDocs.dbdtpFFecIni.Date := Date;
      FToolRepDocs.dbdtpFFecFin.Date := Date;

      FToolRepDocs.dbdtpBFecIni.Date := Date;
      FToolRepDocs.dbdtpBFecFin.Date := Date;

      GReporte := TMant.Create(Application);
      GReporte.Admin := DMFAC.wAdmin;
      GReporte.Module := DMFAC.wModulo;
      GReporte.DComC := DMFAC.DCOM1;
      GReporte.OnEdit := Nil;
      GReporte.OnShow := FInformes.PGridShow;
      GReporte.UsuarioSQL.Add(sSQL);
      GReporte.ClientDataSet := DMFAC.cdsRepClie;
      GReporte.OnCreateMant := FInformes.ToolConsRepDocsCreate;
      GReporte.TableName := 'VWFACREPDOCS';
      GReporte.Titulo := 'Consulta de Documentos Emitidos';
      GReporte.User := DMFAC.wUsuario;
      GReporte.SectionName := 'FACRepClie';
      GReporte.FileNameIni := '\oaFAC.INI';
      GReporte.OnCierra := DMFAC.DisminuyeForma;
      GReporte.Execute;
   Finally
   End
End;

Procedure VEResumenVentaxVendedor;
Var
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   xSQL := 'Select S.TVTADES, V.VENOMBRES, CXC.VEID, CXC.TMONID, '
      + '       sum(case when CXC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 and CXC.DOCID=' + Quotedstr('xx')
      + '                then CXC.CCGRAVAD ELSE 0 END) CCGRAVADNCR, '
      + '       sum(case when CXC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 and CXC.DOCID=' + Quotedstr('xx')
      + '                then CXC.CCGRAVAD ELSE 0 END) CCGRAVADNDE, '
      + '       sum(case when CXC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 and CXC.DOCID=' + Quotedstr('xx')
      + '                then CXC.CCGRAVAD ELSE 0 END) CCGRAVADFAC, '
      + '       sum(case when CXC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 and CXC.DOCID=' + Quotedstr('xx')
      + '                then CXC.CCGRAVAD ELSE 0 END) CCGRAVADBOL, '
      + '       sum(case when CXC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 and CXC.DOCID=' + Quotedstr('xx')
      + '                then CXC.CCGRAVAD ELSE 0 END) '
      + '     + sum(case when CXC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 and CXC.DOCID=' + Quotedstr('xx')
      + '                then CXC.CCGRAVAD ELSE 0 END) '
      + '     + sum(case when CXC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 and CXC.DOCID=' + Quotedstr('xx')
      + '                then CXC.CCGRAVAD ELSE 0 END) '
      + '     + sum(case when CXC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 and CXC.DOCID=' + Quotedstr('xx')
      + '                then CXC.CCGRAVAD ELSE 0 END) CCNETO, '
      + '       case when cxc.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '            then nvl(0.00,0) ELSE 0 END VECUOTA, '
      + '       case when nvl(0.00,0)=0 '
      + '            then 0 '
      + '            else (sum(case when CXC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                            and CXC.DOCID=' + Quotedstr('xx')
      + '                           then CXC.CCGRAVAD ELSE 0 END) '
      + '                + sum(case when CXC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                            and CXC.DOCID=' + Quotedstr('xx')
      + '                           then CXC.CCGRAVAD ELSE 0 END) '
      + '                + sum(case when CXC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                            and CXC.DOCID=' + Quotedstr('xx')
      + '                           then CXC.CCGRAVAD ELSE 0 END) '
      + '                + sum(case when CXC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                            and CXC.DOCID=' + Quotedstr('xx')
      + '                           then CXC.CCGRAVAD ELSE 0 END) '
      + '                  )*100 / '
      + '                  case when cxc.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                       then nvl(0.00,0) '
      + '                       else 0 '
      + '                   end '
      + '        end PORCEN, '
      + '       sum(case when cxc.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                then nvl(CXC.CCFLETE,0) ELSE 0 END) CCEMBA, '
      + '       sum(case when cxc.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                then nvl(CXC.CCIGV,0) ELSE 0 END) CCIGV, '
      + '       sum(case when cxc.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                then nvl(CXC.CCMTOORI,0) ELSE 0 END) CCMTOORI '
      + '  from CXC301 CXC, CXC203 V, FAC105 S ' //, FAC204 C '
      + ' where (DOCID=' + Quotedstr('xx')
      + '    or DOCID=' + Quotedstr('xx')
      + '    or DOCID=' + Quotedstr('xx')
      + '    or DOCID=' + Quotedstr('xx') + ') '
      + '   and V.CIAID=CXC.CIAID '
      + '   and V.VETIPO=CXC.TVTAID '
      + '   and V.VEID=CXC.VEID '
      + '   and S.TVTAID=CXC.TVTAID '
     //    + '   and C.VEID=CXC.VEID AND CXC.TMONID=C.TMONID '
   + ' group by S.TVTADES, V.VENOMBRES, CXC.VEID, CXC.TMONID'; //, C.VECUOTA';
   Try
      GReporte := TMant.Create(Application);
      GReporte.Admin := DMFAC.wAdmin;
      GReporte.Module := DMFAC.wModulo;
      GReporte.DComC := DMFAC.DCOM1;
      GReporte.OnEdit := Nil;
      GReporte.OnShow := FInformes.PGridShow;
      GReporte.UsuarioSQL.Add(xSQL);
      GReporte.ClientDataSet := DMFAC.cdsRepDPed;
      GReporte.OnCreateMant := Nil;
      GReporte.TableName := 'VWFACRESUMENVTA';
      GReporte.Titulo := 'Resúmen de Ventas por Vendedor';
      GReporte.User := DMFAC.wUsuario;
      GReporte.SectionName := 'FACResVta';
      GReporte.FileNameIni := '\oaFAC.INI';
      GReporte.OnCierra := DMFAC.DisminuyeForma;
      GReporte.Execute;
   Finally
   End;
End;

Procedure VEResumenVentaxVencimiento;
Var
   sSQL, xBetw, xEnd, sDesde, sHasta: String;
   Y, M, D: Word;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   Screen.Cursor := crHourGlass;
   DecodeDate(Date, Y, M, D);

   FToolResVtaNeta := TFToolResVtaNeta.Create(Application);
   sDesde := '01/' + IntToStr(M) + '/' + IntToStr(Y);
   FToolResVtaNeta.dtpDesde.Date := StrToDate(sDesde);
   FToolResVtaNeta.dtpHasta.Date := Date;

   FToolResVtaNeta.Visible := False;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, StrtoDate(sDesde)));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, Date));

   xBetw := '';
   xEnd := '';
   DMFAC.BuscaQry('dspUltTGE', 'FAC120', '*', '', 'DIASVCMTO');
   DMFAC.cdsQry.First;
   While Not DMFAC.cdsQry.Eof Do
   Begin
      xBetw := xBetw + 'case when DIAS BETWEEN ' +
         DMFAC.cdsQry.FieldByName('RANGMIN').AsString + ' AND ' +
         DMFAC.cdsQry.FieldByName('RANGMAX').AsString + ' THEN ' +
         DMFAC.cdsQry.FieldByName('RANGMAX').AsString + ' ELSE ';
      xEnd := xEnd + 'end ';
      DMFAC.cdsQry.Next;
   End;
   sSQL := ' Select DIAS, '
      + '        sum(sEC01) SEC01, 0.00 PORLIM, '
      + '        sum(sEC02) SEC02, 0.00 PORPRO, '
      + '        0.00 VTASUB, 0.00 PORSUB, '
      + '        sum(SEC03) SEC03,  0.00 PORCOR, '
      + '        0.00 VTATOT, 0.00 PORTOT '
      + '   from (Select SECTOR, ';
   sSQL := sSQL + xBetw + ' 100 ' + xEnd + ' DIAS, ';
   sSQL := sSQL
      + '                case when SECTOR=''01'' '
      + '                     then sum(Z.CCGRAVAD+Z.CCFLETE) ELSE 0 END SEC01, '
      + '                case when SECTOR=''02'' '
      + '                     then sum(Z.CCGRAVAD+Z.CCFLETE) ELSE 0 END SEC02, '
      + '                case when SECTOR=''03'' '
      + '                     then sum(Z.CCGRAVAD+Z.CCFLETE) ELSE 0 END SEC03 '
      + '           from (Select C.TVTAID SECTOR, A.CCGRAVAD, A.CCFLETE, '
      + '                        A.CCFVCMTO-A.CCFEMIS DIAS '
      + '                   from CXC301 A, TGE110 B, TGE204 C '
      + '                  where CCFEMIS>=' + sDesde + ' '
      + '                    and CCFEMIS<=' + sHasta + ' '
      + '                    and (NVL(CCFLAGVTA,''NULO'') = ''S'') '
      + '                    and CCESTADO=''P'' '
      + '                    and A.DOCID=B.DOCID '
      + '                    and B.DOCTIPREG IN (''L'', ''F'', ''CH'', ''B'') '
      + '                    and B.DOCMOD=''CXC'' '
      + '                    and A.CIAID=C.CIAID '
      + '                    and A.CLAUXID=C.CLAUXID '
      + '                    and A.CLIEID=C.CLIEID '
      + '                 ) Z '
      + '          group by SECTOR,DIAS) YY '
      + '  group by DIAS';
   Try
      Mtx := TMant.Create(Application);
      Mtx.DComC := DMFAC.DCOM1;
      Mtx.Admin := DMFAC.wAdmin;
      Mtx.User := DMFAC.wUsuario;
      Mtx.Module := DMFAC.wModulo;
      Mtx.Titulo := 'Resumén de Venta Neta Según Vencimiento';
      Mtx.TableName := 'VWFACRVTANETA';
      Mtx.OnCreateMant := FInformes.ToolResVtaNetaCreate;
      Mtx.ClientDataSet := DMFAC.cdsKdx;
      Mtx.OnInsert := Nil;
      Mtx.OnEdit := Nil;
      Mtx.OnDelete := Nil;
      Mtx.OnShow := FInformes.PGridShow;
      Mtx.Filter := '';
      Mtx.MultiSelect := True;
      Mtx.SectionName := 'FacRVtaNeta';
      Mtx.FileNameIni := '\oaFAC.INI';
      Mtx.UsuarioSQL.Add(sSQL);
      Mtx.Colors.Add('SUBVTA;clGray;clWhite;;;SUBVTA%>=%0%;');
      Mtx.Colors.Add('TOTVTA;clGray;clWhite;;;TOTVTA%>=%0%;');
      Screen.Cursor := crDefault;
      Mtx.OnCierra := DMFAC.DisminuyeForma;
      Mtx.Execute;
   Finally
   End;
End;

Procedure VEResumenVentaNacionalImportado;
Var
   xSQL, xSQL1: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   xSQL := 'SELECT S.TVTADES, V.VENOMBRES, FAC.VEID, FAC.TMONID, 0.00 VECUOTA, '
      + '       (SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                  AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaInd)
      + '                  AND ART.ARTSPRO=''IMPORTADO'' '
      + '            THEN FAC.DFACMTOME ELSE 0 END) '
      + '      + SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                  AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaInd)
      + '                  AND ART.ARTSPRO=''NACIONAL'' '
      + '                 THEN FAC.DFACMTOME ELSE 0 END) '
      + '      + SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                  AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaStanley)
      + '                  AND ART.ARTSPRO=''IMPORTADO'' '
      + '                 THEN FAC.DFACMTOME ELSE 0 END) '
      + '      + TRUNC(SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                  AND ART.ARTSPRO=''IMPORTADO'' '
      + '                 THEN FAC.DFACMTOME ELSE 0 END) '
      + '      - SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                  AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaStanley)
      + '                  AND ART.ARTSPRO=''IMPORTADO'' '
      + '                 THEN FAC.DFACMTOME ELSE 0 END),2)) AVANCE, '
      + '       TRUNC((CASE WHEN NVL(0.00,0)=0 '
      + '                   THEN 0 '
      + '                   ELSE TRUNC((SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                         AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaInd)
      + '                                         AND ART.ARTSPRO=''IMPORTADO'' '
      + '                                        THEN FAC.DFACMTOME ELSE 0 END) '
      + '                             + SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                         AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaInd)
      + '                                         AND ART.ARTSPRO=''NACIONAL'' '
      + '                                        THEN FAC.DFACMTOME ELSE 0 END) '
      + '                             + SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                         AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaStanley)
      + '                                         AND ART.ARTSPRO=''IMPORTADO'' '
      + '                                        THEN FAC.DFACMTOME ELSE 0 END) '
      + '                             + TRUNC(SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                               AND ART.ARTSPRO=''IMPORTADO'' '
      + '                                              THEN FAC.DFACMTOME ELSE 0 END) '
      + '                                    -SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                               AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaStanley)
      + '                                               AND ART.ARTSPRO=''IMPORTADO'' '
      + '                                              THEN FAC.DFACMTOME ELSE 0 END),2)),2) / '
      + '                                         CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                              THEN TRUNC(NVL(0.00,0),2) '
      + '                                              ELSE 0 END END)*100,2) PORCENAVANCE, '
      + '       SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaInd)
      + '                 AND ART.ARTSPRO=''IMPORTADO'' '
      + '                THEN FAC.DFACMTOME ELSE 0 END) MONTOMEIND, '
      + '       TRUNC((CASE WHEN NVL(0.00, 0)=0 '
      + '                   THEN 0 '
      + '                   ELSE TRUNC((SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                    AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaInd)
      + '                                    AND ART.ARTSPRO=''IMPORTADO'' '
      + '                                   THEN FAC.DFACMTOME ELSE 0 END)),2) / '
      + '              CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                   THEN TRUNC(NVL(0.00, 0),2) ELSE 0 END END)*100,2) PORCENIND, '
      + '       SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaInd)
      + '                 AND ART.ARTSPRO=''NACIONAL'' '
      + '                THEN FAC.DFACMTOME ELSE 0 END) MONTOMEOTROS, '
      + '       TRUNC((CASE WHEN NVL(0.00, 0)=0 '
      + '                   THEN 0 '
      + '                   ELSE TRUNC((SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                         AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaInd)
      + '                                         AND ART.ARTSPRO=''NACIONAL'' '
      + '                                        THEN FAC.DFACMTOME ELSE 0 END)),2) / '
      + '                                   CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                        THEN TRUNC(NVL(0.00, 0),2) '
      + '                                        ELSE 0 END END)*100,2) PORCENOTROS, '
      + '       SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaInd)
      + '                 AND ART.ARTSPRO=''IMPORTADO'' '
      + '                THEN FAC.DFACMTOME ELSE 0 END) '
      + '     + SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaInd)
      + '                 AND ART.ARTSPRO=''NACIONAL'' '
      + '                THEN FAC.DFACMTOME ELSE 0 END) TOTNAC, '
      + '       TRUNC((CASE WHEN NVL(0.00, 0)=0 '
      + '                   THEN 0 '
      + '                   ELSE TRUNC((SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                         AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaInd)
      + '                                         AND ART.ARTSPRO=''IMPORTADO'' '
      + '                                        THEN FAC.DFACMTOME '
      + '                                        ELSE 0 END)) '
      + '                             +(SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                         AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaInd)
      + '                                         AND ART.ARTSPRO=''NACIONAL'' '
      + '                                        THEN FAC.DFACMTOME '
      + '                                        ELSE 0 END)),2)  / '
      + '                              CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                   THEN TRUNC(NVL(0.00, 0),2) '
      + '                                   ELSE 0 END END)*100,2) PORCENTOTNAC, '
      + '       SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaStanley)
      + '                 AND ART.ARTSPRO=''IMPORTADO'' '
      + '                THEN FAC.DFACMTOME ELSE 0 END) MONTOSTANLEY, '
      + '       TRUNC((CASE WHEN NVL(0.00, 0)=0 '
      + '                   THEN 0 '
      + '                   ELSE TRUNC((SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                         AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaStanley)
      + '                                         AND ART.ARTSPRO=''IMPORTADO'' '
      + '                                        THEN FAC.DFACMTOME ELSE 0 END)),2) / ';
   xSQL1 := '      CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '            THEN TRUNC(NVL(0.00, 0),2) ELSE 0 END END)*100,2) PORCENSTANLEY, '
      + '       TRUNC(SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                       AND ART.ARTSPRO=''IMPORTADO'' '
      + '                      THEN FAC.DFACMTOME ELSE 0 END) '
      + '            -SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                       AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaStanley)
      + '                       AND ART.ARTSPRO=''IMPORTADO'' '
      + '                      THEN FAC.DFACMTOME ELSE 0 END),2) MONTOIMPOTROS, '
      + '       TRUNC((CASE WHEN NVL(0.00, 0)=0 '
      + '                   THEN 0 '
      + '                   ELSE TRUNC((SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                         AND ART.ARTSPRO=''IMPORTADO'' '
      + '                                        THEN FAC.DFACMTOME ELSE 0 END))'
      + '                             -(SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                         AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaStanley)
      + '                                         AND ART.ARTSPRO=''IMPORTADO'' '
      + '                                        THEN FAC.DFACMTOME ELSE 0 END)),2) '
      + '                             / CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                    THEN TRUNC(NVL(0.00,0),2) '
      + '                                    ELSE 0 END END)*100,2) PORCENIMPOTROS, '
      + '       SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                 AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaStanley)
      + '                 AND ART.ARTSPRO=''IMPORTADO'' '
      + '                THEN FAC.DFACMTOME ELSE 0 END) '
      + '     + TRUNC(SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                       AND ART.ARTSPRO=''IMPORTADO'' '
      + '                      THEN FAC.DFACMTOME ELSE 0 END) '
      + '            -SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                       AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaStanley)
      + '                       AND ART.ARTSPRO=''IMPORTADO'' '
      + '                      THEN FAC.DFACMTOME ELSE 0 END),2) TOTIMP, '
      + '       TRUNC((CASE WHEN NVL(0.00,0)=0 '
      + '                   THEN 0 '
      + '                   ELSE TRUNC((SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                         AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaStanley)
      + '                                         AND ART.ARTSPRO=''IMPORTADO'' '
      + '                                        THEN FAC.DFACMTOME ELSE 0 END) ) '
      + '                           + ((SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                         AND ART.ARTSPRO=''IMPORTADO'' '
      + '                                        THEN FAC.DFACMTOME ELSE 0 END) ) '
      + '                              -SUM(CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                         AND FAC.GRARID=' + Quotedstr(DMFAC.wLineaStanley)
      + '                                         AND ART.ARTSPRO=''IMPORTADO'' '
      + '                                        THEN FAC.DFACMTOME ELSE 0 END)),2) / '
      + '                                   CASE WHEN FAC.TMONID=' + Quotedstr(DMFAC.wTMonExt)
      + '                                        THEN TRUNC(NVL(0.00, 0),2) '
      + '                                        ELSE 0 END END)*100,2) PORCENTOTIMP '
       //  + '   FROM FAC306 FAC, FAC305 CFAC, CXC203 V, FAC105 S, FAC204 C, TGE205 ART '
   + '   FROM FAC306 FAC, FAC305 CFAC, CXC203 V, FAC105 S, TGE205 ART '
      + '  WHERE FAC.FACFECHA=''01/01/1900'' '
      + '    AND CFAC.FACESTADO=''ACEPTADO'' '
      + '    AND FAC.FACSERIE=CFAC.FACSERIE AND FAC.NFAC=CFAC.NFAC '
      + '    AND V.CIAID=FAC.CIAID AND V.VEID=FAC.VEID AND V.VEID=CFAC.VEID '
      + '    AND S.TVTAID=CFAC.TIPVTAID '
       //  + '    AND C.VEID=CFAC.VEID '
   + '    AND FAC.ARTID=ART.ARTID '
      + '  GROUP BY S.TVTADES, V.VENOMBRES, FAC.VEID, FAC.TMONID '
      + '  ORDER BY FAC.VEID';
   Try
      FToolResNac := TFToolResNac.Create(Application);
      FToolResNac.Visible := False;

      GReporte := TMant.Create(Application);
      GReporte.DComC := DMFAC.DCOM1;
      GReporte.Admin := DMFAC.wAdmin;
      GReporte.User := DMFAC.wUsuario;
      GReporte.Module := DMFAC.wModulo;
      GReporte.Titulo := 'Resumen de Venta Nacional Importado';
      GReporte.TableName := 'VWFACRVTANACIMP';
      GReporte.OnCreateMant := FInformes.ToolResVtaNacionalCreate;
      GReporte.ClientDataSet := DMFAC.cdsKdx;
      GReporte.OnInsert := Nil;
      GReporte.OnEdit := Nil;
      GReporte.OnDelete := Nil;
      GReporte.OnShow := FInformes.PGridShow;
      GReporte.Filter := '';
      GReporte.MultiSelect := True;
      GReporte.SectionName := 'FacRVtaNacImport';
      GReporte.FileNameIni := '\oaFAC.INI';
      GReporte.UsuarioSQL.Add(xSQL + xSQL1);
      Screen.Cursor := crDefault;
      GReporte.OnCierra := DMFAC.DisminuyeForma;
      GReporte.Execute;
   Finally
   End;
End;

Procedure VEResumenVentaNetaLinea;
Var
   xSQL: String;
   Y, M, D: word;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   DecodeDate(Date, Y, M, D);
   xSQL := 'SELECT FAC.GRARID, LIN.GRARDES, '
      + '       SUM(CASE WHEN  ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOME ELSE 0 END) MONTOIMP, '
      + '       SUM(CASE WHEN  ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOME ELSE 0 END) MONTONAC, '
      + '       SUM(CASE WHEN  ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOME ELSE 0 END)  '
      + '     + SUM(CASE WHEN  ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOME ELSE 0 END) TOTAL, '
      + '       0.00 PORC '
      + '  FROM FAC306 FAC, FAC305 CFAC, TGE205 ART, TGE131 LIN '
      + ' WHERE CFAC.FACAAAA=' + QuotedStr(InttoStr(Y)) + ' '
      + '   AND CFAC.FACMM=' + QuotedStr(InttoStr(M)) + ' '
      + '   AND FAC.FACSERIE=CFAC.FACSERIE '
      + '   AND FAC.NFAC=CFAC.NFAC '
      + '   AND CFAC.FACESTADO=''ACEPTADO'' '
      + '   AND FAC.CIAID=ART.CIAID AND FAC.ARTID=ART.ARTID '
      + '   AND LIN.CIAID=FAC.CIAID AND LIN.TINID=FAC.TINID '
      + '   AND LIN.GRARID=FAC.GRARID  AND LIN.GRARID=ART.GRARID '
      + ' GROUP BY FAC.GRARID, LIN.GRARDES';
   FToolVtaNta := TFToolVtaNta.Create(Application);
   FToolVtaNta.dtpHasta.Date := Date;
   FToolVtaNta.Height := 100;
   FToolVtaNta.Visible := False;

   Mtx := TMant.Create(Application);
   Try
      Mtx.Admin := DMFAC.wAdmin;
      Mtx.User := DMFAC.wUsuario;
      Mtx.Module := DMFAC.wModulo;
      Mtx.ClientDataSet := DMFAC.cdsKdx;
      Mtx.DComC := DMFAC.DCom1;
      Mtx.FileNameIni := '\oaFAC.INI';
      Mtx.Filter := '';
      Mtx.Module := DMFAC.wModulo;
      Mtx.SectionName := 'FACVTANTA';
      Mtx.TableName := 'VWFACVTANTA';
      Mtx.Titulo := 'Venta Neta por Linea';
      Mtx.OnCreateMant := FInformes.ToolVentaNetaCreate;
      Mtx.OnEdit := Nil;
      Mtx.OnInsert := Nil;
      Mtx.OnDelete := Nil;
      Mtx.OnShow := FInformes.PGridShow;
      Mtx.UsuarioSQL.Add(xSQL);
      Mtx.NoVisible.Clear;
      Screen.Cursor := crDefault;
      Mtx.OnCierra := DMFAC.DisminuyeForma;
      Mtx.Execute;
   Finally
   End
End;

Procedure VEComprasAcumuladasCliente;
Var
   xSQL, xSQL1: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   xSQL := ' SELECT DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES, SUM(DFACMTOME) MONTO, ''AAAA'' ORDEN, '
      + '        '' ''  ZVTADES '
      + '   FROM FAC306 DFAC, TGE204 CLIE, FAC305 CFAC, TGE205 ART '
      + '  WHERE CFAC.FACESTADO<>''ANULADO'' '
      + '    AND CFAC.FACFECHA=SYSDATE '
      + '    AND DFAC.GRARID=''XX'' '
      + '    AND ART.ARTSPRO=''NACIONAL'' '
      + '    AND DFAC.CLIEID=CLIE.CLIEID '
      + '    AND CFAC.CIAID=DFAC.CIAID AND CFAC.FACSERIE=DFAC.FACSERIE '
      + '    AND CFAC.NFAC=DFAC.NFAC '
      + '    AND DFAC.ARTID=ART.ARTID '
      + '  GROUP BY DFAC.VEID, DFAC.CLIERUC, CLIE.CLIEDES';
   Try
      FToolCompraAcum := TFToolCompraAcum.Create(Application);
      FToolCompraAcum.dtpDesde.Date := Date;
      FToolCompraAcum.dtpHasta.Date := Date;
      FToolCompraAcum.edtIni.Text := '100';
      FToolCompraAcum.edtFin.Text := '10000';
      FToolCompraAcum.dblcdLinea.enabled := false;
      FToolCompraAcum.Visible := False;

      GReporte := TMant.Create(Application);
      GReporte.DComC := DMFAC.DCOM1;
      GReporte.Admin := DMFAC.wAdmin;
      GReporte.User := DMFAC.wUsuario;
      GReporte.Module := DMFAC.wModulo;
      GReporte.Titulo := 'Compras Acumuladas de Cliente';
      GReporte.TableName := 'VWFACCOMPAC';
      GReporte.OnCreateMant := FInformes.ToolCompraAcumCreate;
      GReporte.ClientDataSet := DMFAC.cdsRepDPed;
      GReporte.OnInsert := Nil;
      GReporte.OnEdit := Nil;
      GReporte.OnDelete := Nil;
      GReporte.OnShow := FInformes.PGridShow;
      GReporte.Filter := '';
      GReporte.MultiSelect := True;
      GReporte.SectionName := 'FacCompraAcum';
      GReporte.FileNameIni := '\oaFAC.INI';
      GReporte.UsuarioSQL.Add(xSQL);
      Screen.Cursor := crDefault;
      GReporte.OnCierra := DMFAC.DisminuyeForma;
      GReporte.Execute;
   Finally
   End;
End;

Procedure VEComisiones;
Var
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   Try
      FToolComision := TFToolComision.Create(Application);
      FToolComision.Visible := False;

      xSQL := ' SELECT S.TVTADES, CFAC.VEID, V.VENOMBRES, '
         + '        SUM((NVL(ART.ARTCOMVTA,0) * NVL(DFACMTOMO,0) ))/100 COMIBRUTA, '
         + '        SUM(CASE WHEN CFAC.FACESTADO=''ANULADO'' THEN (NVL(ART.ARTCOMVTA,0) * NVL(DFAC.DFACMTOMO,0))/100 ELSE 0 END) COMIANU, '
         + '        SUM(CASE WHEN CFAC.FACESTADO=''ACEPTADO'' THEN (NVL(ART.ARTCOMVTA,0) * NVL(DFAC.DFACMTOMO,0) )/100 ELSE 0 END) COMINETA '
         + '   FROM FAC306 DFAC, FAC305 CFAC, TGE205 ART, CXC203 V, FAC105 S '
         + '  WHERE CFAC.FACFECHA > SYSDATE '
         + '    AND DFAC.CIAID=CFAC.CIAID AND DFAC.FACSERIE=CFAC.FACSERIE AND DFAC.NFAC=CFAC.NFAC '
         + '    AND DFAC.ARTID=ART.ARTID '
         + '    AND CFAC.CIAID=V.CIAID AND CFAC.VEID=V.VEID '
         + '    AND S.TVTAID=CFAC.TIPVTAID '
         + '  GROUP BY S.TVTADES,CFAC.VEID, V.VENOMBRES';
      GReporte := TMant.Create(Application);
      GReporte.Admin := DMFAC.wAdmin;
      GReporte.Module := DMFAC.wModulo;
      GReporte.DComC := DMFAC.DCOM1;
      GReporte.OnEdit := Nil;
      GReporte.OnShow := FInformes.PGridShow;
      GReporte.UsuarioSQL.Add(xSQL);
      GReporte.ClientDataSet := DMFAC.cdsRepDPed;
      GReporte.OnCreateMant := FInformes.ToolComisionCreate;
      GReporte.TableName := 'VWFACCOMISION';
      GReporte.Titulo := 'Resúmen de Comisiones por Vendedor';
      GReporte.User := DMFAC.wUsuario;
      GReporte.SectionName := 'FACComision';
      GReporte.FileNameIni := '\oaFAC.INI';
      GReporte.OnCierra := DMFAC.DisminuyeForma;
      GReporte.Execute;
   Finally
   End;
End;

Procedure VECostoDeVentas;
Var
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   Try
      FToolCostoVta := TFToolCostoVta.Create(Application);
      FToolCostoVta.Visible := False;
      xSQL := ' SELECT DET.TRIID, T.TRIDES, DET.GRARID, L.GRARDES, '
         + '        TRUNC(SUM(CASE WHEN ART.ARTSPRO=''NACIONAL'' THEN  DET.KDXCNTG*DET.ARTPCG ELSE 0 END),2) TOTNAC, '
         + '        TRUNC(SUM(CASE WHEN ART.ARTSPRO=''IMPORTADO'' THEN  DET.KDXCNTG*DET.ARTPCG  ELSE 0 END ),2) TOTIMP, '
         + '        TRUNC(SUM(CASE WHEN ART.ARTSPRO=''NACIONAL'' THEN  DET.KDXCNTG*DET.ARTPCG ELSE 0 END),2) + '
         + '        TRUNC(SUM(CASE WHEN ART.ARTSPRO=''IMPORTADO'' THEN  DET.KDXCNTG*DET.ARTPCG  ELSE 0 END ),2) TOTAL '
         + '   FROM LOG315 DET, TGE205 ART, TGE208 T, TGE131 L '
         + '  WHERE DET.NISAFREG=SYSDATE '
         + '    AND NVL(ART.FLAGVAR,'''')<>''A'' '
         + '    AND DET.CIAID=''XYZ'' '
         + '    AND DET.CIAID=ART.CIAID AND DET.ARTID=ART.ARTID '
         + '    AND T.TRIID=DET.TRIID '
         + '    AND L.GRARID=DET.GRARID '
         + '  GROUP BY DET.TRIID, T.TRIDES, DET.GRARID, L.GRARDES';
      GReporte := TMant.Create(Application);
      GReporte.Admin := DMFAC.wAdmin;
      GReporte.Module := DMFAC.wModulo;
      GReporte.DComC := DMFAC.DCOM1;
      GReporte.OnEdit := Nil;
      GReporte.OnShow := FInformes.PGridShow;
      GReporte.UsuarioSQL.Add(xSQL);
      GReporte.ClientDataSet := DMFAC.cdsRepDPed;
      GReporte.OnCreateMant := FInformes.ToolCostoVtaCreate;
      GReporte.TableName := 'VWFACCOSTOS';
      GReporte.Titulo := 'Costos de Ventas ';
      GReporte.User := DMFAC.wUsuario;
      GReporte.SectionName := 'FACcostos';
      GReporte.FileNameIni := '\oaFAC.INI';
      GReporte.OnCierra := DMFAC.DisminuyeForma;
      GReporte.Execute;
   Finally
   End;
End;

Procedure VEVentasConcesiones;
Var
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

   Try
      FVentaConcesiones := TFVentaConcesiones.Create(Application);
      FVentaConcesiones.ShowModal;
   Finally
      FVentaConcesiones.Free;
   End;
End;

Procedure VEVentasLineaComercial;
Var
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

   Try
      FLineaComer := TFLineaComer.Create(Application);
      FLineaComer.ShowModal;
   Finally
      FLineaComer.Free;
   End;
End;

Procedure VEVentaPorArticulos;
Var
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   xSQL := ' Select nvl(VEFLAGGADM,''N'') ACEPTAR, nvl(VEFLAG,''N'') SUPERVISOR, nvl(VECUENTA,''N'') ESTADISTICA, '
      + '        nvl(VEFCORP,''N'') ADMTIENDA, nvl(VEFLCOM,''N'') ANULAR, nvl(FLAGDESC,''N'') DSCTO '
      + '   From FAC206 A, CXC203 B '
      + '  Where A.USERID=''' + DMFAC.wUsuario + ''' AND A.CIAID=B.CIAID(+) AND A.VEID=B.VEID(+)';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(xSQL);
   Try
      DMFAC.cdsQry3.Open;
      If Not ((DMFAC.cdsQry3.FieldByname('ADMTIENDA').AsString = 'S') Or (DMFAC.cdsQry3.FieldByname('SUPERVISOR').AsString = 'S') Or (DMFAC.cdsQry3.FieldByname('ESTADISTICA').AsString = 'S')) Then
      Begin
         ShowMessage('No esta Autorizado a esta Opción');
         Exit;
      End;
   Except
      ShowMessage('Error : Falta registrar a Usuario en Tabla de Usuario de Ventas (CXC203/FAC206)');
      Exit;
   End;

   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

   Try
      FVentaPorArticulo := TFVentaPorArticulo.Create(Application);
      FVentaPorArticulo.ShowModal;
   Finally
      FVentaPorArticulo.Free;
   End;
End;

Procedure VEVentaPorUsuario;
Var
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

   Try
      FVentaPorUsuario := TFVentaPorUsuario.Create(Application);
      FVentaPorUsuario.ShowModal;
   Finally
      FVentaPorUsuario.Free;
   End;
End;

Procedure VEVentaPorTienda;
Var
   xSQL: String;
Begin
// FAC810   FRepTiendas             Ventas por Tienda                      VEVentaPorTienda
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;

   xSQL := ' Select nvl(VEFLAGGADM,''N'') ACEPTAR, nvl(VEFLAG,''N'') SUPERVISOR, nvl(VECUENTA,''N'') ESTADISTICA, '
      + '        nvl(VEFCORP,''N'') ADMTIENDA, nvl(VEFLCOM,''N'') ANULAR, nvl(FLAGDESC,''N'') DSCTO '
      + '   From FAC206 A, CXC203 B '
      + '  Where A.USERID=''' + DMFAC.wUsuario + ''' AND A.CIAID=B.CIAID(+) AND A.VEID=B.VEID(+)';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(xSQL);
   Try
      DMFAC.cdsQry3.Open;
      If Not ((DMFAC.cdsQry3.FieldByname('ADMTIENDA').AsString = 'S') Or (DMFAC.cdsQry3.FieldByname('SUPERVISOR').AsString = 'S') Or (DMFAC.cdsQry3.FieldByname('ESTADISTICA').AsString = 'S')) Then
      Begin
         ShowMessage('No esta Autorizado a esta Opción');
         Exit;
      End;
   Except
      ShowMessage('Error : Falta registrar a Usuario en Tabla de Usuario de Ventas (CXC203/FAC206)');
      Exit;
   End;

   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

   Try
      FRepTiendas := TFRepTiendas.Create(Application);
      FRepTiendas.ShowModal;
   Finally
      FRepTiendas.Free;
   End;
End;

Procedure VEVentaUtilidad;
Var
   xSQL: String;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   xSQL := ' Select nvl(VEFLAGGADM,''N'') ACEPTAR, nvl(VEFLAG,''N'') SUPERVISOR, nvl(VECUENTA,''N'') ESTADISTICA, '
      + '        nvl(VEFCORP,''N'') ADMTIENDA, nvl(VEFLCOM,''N'') ANULAR, nvl(FLAGDESC,''N'') DSCTO '
      + '   From FAC206 A, CXC203 B '
      + '  Where A.USERID=''' + DMFAC.wUsuario + ''' AND A.CIAID=B.CIAID(+) AND A.VEID=B.VEID(+)';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(xSQL);
   Try
      DMFAC.cdsQry3.Open;
      If Not ((DMFAC.cdsQry3.FieldByname('ADMTIENDA').AsString = 'S') Or (DMFAC.cdsQry3.FieldByname('SUPERVISOR').AsString = 'S') Or (DMFAC.cdsQry3.FieldByname('ESTADISTICA').AsString = 'S')) Then
      Begin
         ShowMessage('No está Autorizado a esta Opción');
         Exit;
      End;
   Except
      ShowMessage('Error : Falta registrar a Usuario en Tabla de Usuario de Ventas (CXC203/FAC206)');
      Exit;
   End;

   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

   Try
      FVentaUtilidad := TFVentaUtilidad.Create(Application);
      FVentaUtilidad.ShowModal;
   Finally
      FVentaUtilidad.Free;
   End;
End;

{ TFInformes }

Procedure TFInformes.ConsArtEdita(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
Begin
   If GReporte2.FMant.cds2.RecordCount = 0 Then exit;
   Try
      sSQL := ' Select ARTID,ARTDES,'
         + '        sum(' + DMFAC.wReplacCeros + '(DPEDCANTP,0)) CANTPED,'
         + '        sum(' + DMFAC.wReplacCeros + '(DPEDCANTAC,0)) CANTACEP,'
         + '        sum(' + DMFAC.wReplacCeros + '(DPEDCANTAT,0)) CANTATE,'
         + '        sum(' + DMFAC.wReplacCeros + '(DPEDCANTAC,0)-' + DMFAC.wReplacCeros + '(DPEDCANTAT,0)) CANTPEND '
         + '   from FAC302'
         + '  where FAC302.CLIEID=' + quotedstr(GReporte2.FMant.cds2.FieldByName('CLIEID').Asstring)
         + '  group BY ARTID,ARTDES';
      GRepArt := TMant.Create(Self);
      GRepArt.Admin := DMFAC.wAdmin;
      GRepArt.Module := DMFAC.wModulo;
      GRepArt.DComC := DMFAC.DCOM1;
      GRepArt.OnEdit := FInformes.ConsArtPed;
      GRepArt.OnShow := PGridShow;
      GRepArt.UsuarioSQL.Add(sSQL);
      GRepArt.ClientDataSet := DMFAC.cdsRepDPed;
      GRepArt.OnCreateMant := Nil;
      GRepArt.TableName := 'VWFACREPART';
      GRepArt.Titulo := 'Por Articulos';
      GRepArt.User := DMFAC.wUsuario;
      GRepArt.SectionName := 'FACRepPed';
      GRepArt.FileNameIni := '\oaFAC.INI';
      GRepArt.Execute;
   Finally

   End;
End;

Procedure TFInformes.ConsArtPed(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
Begin
   If GReporte2.FMant.cds2.RecordCount = 0 Then exit;

   Try
      sSQL := ' Select PEDIDO, DPEDFECHA '
         + '        sum(' + DMFAC.wReplacCeros + '(DPEDCANTP,0)) CANTPED,'
         + '        sum(' + DMFAC.wReplacCeros + '(DPEDCANTAC,0)) CANTACEP,'
         + '        sum(' + DMFAC.wReplacCeros + '(DPEDCANTAT,0)) CANTATE,'
         + '        sum(' + DMFAC.wReplacCeros + '(DPEDCANTAC,0)-' + DMFAC.wReplacCeros + '(DPEDCANTAT,0)) CANTPEND '
         + '  where FAC302.CLIEID=' + quotedstr(GReporte2.FMant.cds2.FieldByName('CLIEID').Asstring);

      GRepArt := TMant.Create(Self);
      GRepArt.Admin := DMFAC.wAdmin;
      GRepArt.Module := DMFAC.wModulo;
      GRepArt.DComC := DMFAC.DCOM1;
      GRepArt.OnEdit := Nil;
      GRepArt.OnShow := PGridShow;
      GRepArt.UsuarioSQL.Add(sSQL);
      GRepArt.ClientDataSet := DMFAC.cdsRepDPed;
      GRepArt.OnCreateMant := Nil;
      GRepArt.TableName := 'VWFACREPART';
      GRepArt.Titulo := 'Por Articulos';
      GRepArt.User := DMFAC.wUsuario;
      GRepArt.SectionName := 'FACReporte';
      GRepArt.FileNameIni := '\oaFAC.INI';
      GRepArt.Execute;
   Finally
   End;
End;

Procedure TFInformes.ConsClieArt(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
Begin
   If GReporte.FMant.cds2.RecordCount = 0 Then exit;
   Try
      sSQL := ' Select ARTID,ARTDES,'
         + '        SUM(' + DMFAC.wReplacCeros + '(DPEDCANTP,0)) CANTPED,'
         + '        SUM(' + DMFAC.wReplacCeros + '(DPEDCANTAC,0)) CANTACEP,'
         + '        SUM(' + DMFAC.wReplacCeros + '(DPEDCANTAT,0)) CANTATE,'
         + '        SUM(' + DMFAC.wReplacCeros + '(DPEDCANTAC,0)-' + DMFAC.wReplacCeros + '(DPEDCANTAT,0)) CANTPEND '
         + '   from FAC302'
         + '  where FAC302.CLIEID=' + quotedstr(GReporte.FMant.cds2.FieldByName('CLIEID').Asstring)
         + '  group by ARTID,ARTDES';
      GRepArt := TMant.Create(Self);
      GRepArt.Admin := DMFAC.wAdmin;
      GRepArt.Module := DMFAC.wModulo;
      GRepArt.DComC := DMFAC.DCOM1;
      GRepArt.OnEdit := Nil;
      GRepArt.OnShow := PGridShow;
      GRepArt.UsuarioSQL.Add(sSQL);
      GRepArt.ClientDataSet := DMFAC.cdsRepDPed;
      GRepArt.OnCreateMant := Nil;
      GRepArt.TableName := 'VWFACREPART';
      GRepArt.Titulo := 'Por Articulos';
      GRepArt.User := DMFAC.wUsuario;
      GRepArt.SectionName := 'FACRepClie';
      GRepArt.FileNameIni := '\oaFAC.INI';
      GRepArt.Execute;
   Finally
   End;
End;

Procedure TFInformes.ConsPedEdita(Sender: TObject; MantFields: TFields);
Var
   sSQL: String;
Begin
   If GReporte.FMant.cds2.RecordCount = 0 Then exit;

   Try
      sSQL := ' Select A.CLIEID,A.CLIEDES,'
         + '        sum(' + DMFAC.wReplacCeros + '(A.PEDTOTMN,0)) MTOPEDSOLES,'
         + '        sum(' + DMFAC.wReplacCeros + '(A.PEDTOTME,0)) MTOPEDDOL,'
         + '        sum(' + DMFAC.wReplacCeros + '(B.GREMTOTMN,0)) MTOATESOLES,'
         + '        sum(' + DMFAC.wReplacCeros + '(B.GREMTOTME,0)) MTOATEDOL,'
         + '        sum(' + DMFAC.wReplacCeros + '(A.PEDTOTMN,0)-' + DMFAC.wReplacCeros + '(B.GREMTOTMN,0)) MTOPENDSOLES,'
         + '        sum(' + DMFAC.wReplacCeros + '(A.PEDTOTME,0)-' + DMFAC.wReplacCeros + '(B.GREMTOTME,0)) MTOPENDDOL'
         + '   from FAC301 A LEFT JOIN FAC303 B ON(A.CLIEID=B.CLIEID ) '
         + '  where A.VEID=' + quotedstr(GReporte.FMant.cds2.FieldByName('VEID').Asstring)
         + '  group by A.CLIEID,A.CLIEDES';

      GReporte2 := TMant.Create(Self);
      GReporte2.Admin := DMFAC.wAdmin;
      GReporte2.DComC := DMFAC.DCOM1;
      GReporte2.Module := DMFAC.wModulo;
      GReporte2.OnEdit := ConsArtEdita;
      GReporte2.OnShow := PGridShow;
      GReporte2.UsuarioSQL.Add(sSQL);
      GReporte2.ClientDataSet := DMFAC.cdsRepPed;
      GReporte2.TableName := 'VWFACREPXCLIE';
      GReporte2.Titulo := 'Por Cliente';
      GReporte2.User := DMFAC.wUsuario;
      GReporte2.SectionName := 'FACRepPed';
      GReporte2.FileNameIni := '\oaFAC.INI';
      GReporte2.Execute;

   Finally
   End;
End;

Procedure TFInformes.MueveMouse(xObjeto: TObject; Shift: TShiftState; X,
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

Procedure TFInformes.PGridShow(Sender: TObject);
Var
   i: Integer;
   MGrid: TMant;
Begin
   MGrid := TMant(Sender);
   For i := 0 To MGrid.FMant.ComponentCount - 1 Do
   Begin
      If MGrid.FMant.Components[i].ClassName = 'TPanel' Then
         TPanel(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
    // para botones
      If MGrid.FMant.Components[i].ClassName = 'TButton' Then
         TButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
    // para bitbuttons
      If MGrid.FMant.Components[i].ClassName = 'TBitBtn' Then
         TBitBtn(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
    // para speedbuttons
      If MGrid.FMant.Components[i].ClassName = 'TSpeedButton' Then
         TSpeedButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
    // Boton de Grid
      If MGrid.FMant.Components[i].ClassName = 'TwwIButton' Then
         TwwIButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
    // para la forma
      MGrid.FMant.onMouseMove := MueveMouse;
   End;
End;

Procedure TFInformes.ToolComisionCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolComision.pnl;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFInformes.ToolCompraAcumCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolCompraAcum.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFInformes.ToolConsClieCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolConsClie.pnGLt;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFInformes.ToolConsRepDocsCreate(Sender: TObject);
Var
   pl: TPanel;
   pg: TPageControl;
Begin
   pg := FToolRepDocs.pcDocumento;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFInformes.ToolCostoVtaCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolCostoVta.pnl;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFInformes.ToolVentaArticuloCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolVentaArticulo.pnGLT;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFInformes.ToolReportexArticulo(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolConsultaxArticulo.pnlArticulo;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFInformes.ToolResVtaNacionalCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolResNac.pnl;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFInformes.ToolResVtaNetaCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolResVtaNeta.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFInformes.ToolVentaNetaCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolVtaNta.pnlTool;
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
   FInformes := TFInformes.Create(Application);
   If DMFAC.fg_VerificaVersion(FInformes.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.

