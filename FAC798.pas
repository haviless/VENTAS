Unit Fac798;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaVe3000
// FORMULARIO               : FToolConsultaxArticulo
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Barra de Tareas de Consulta y Reportes de Artículos Vendidos
//

// Actualizaciones:
// HPC_201208_FAC 21/10/2014: Implementación del control de versiones

// HPC_201501_FAC             Se repotenció el Reporte de Artículos Vendidos:
//                            se muestra la información necesaria para que el usuario
//                            pueda analizar sus ventas por parámetro de fecha y otros filtros,
//                            se muestra la siguiente información:
//                            1. N° de Comprobante de Pago
//                            2. Fecha de Venta
//                            3.Nombre de Cliente
//                            4.Descripción de Artículo
//                            5.Cantidad Vendida
//                            6.Monto Pagado
//                            7.Vendedor
//                            En el reporte de artículos vendidos, se incluyó
//                            en el filtro (SQL) el descuento de los artículos
//                            que ingresan por devoluciones, cambios y anulaciones
//                            de una venta.
//                            Reordenamiento de sangrías.

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, wwdblook, ExtCtrls, wwdbdatetimepicker, DB, ppCache,
   ppDB, ppDBPipe, ppEndUsr, ppComm, ppRelatv, ppProd, ppClass, ppReport,
   ppBands, ppCtrls, ppPrnabl, ppVar, Wwdbdlg, Grids, DBGrids, ppParameter;

Type
   TFToolConsultaxArticulo = Class(TForm)
      pnlArticulo: TPanel;
      Label2: TLabel;
      edtCia: TEdit;
      dblcCia: TwwDBLookupCombo;
      dtpInicio: TwwDBDateTimePicker;
      dtpFin: TwwDBDateTimePicker;
      Label1: TLabel;
      Label3: TLabel;
      bbtnImprimir: TBitBtn;
      ppReporte: TppReport;
      ppd1: TppDesigner;
      ppdbReporte: TppDBPipeline;
      bbtnFiltrar: TBitBtn;
      ppHeaderBand1: TppHeaderBand;
      ppLblCia: TppLabel;
      ppLabel2: TppLabel;
      pplblFecha: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppLabel6: TppLabel;
      ppLabel12: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel10: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppLabel11: TppLabel;
      ppDBCalc2: TppDBCalc;
      Label4: TLabel;
      dblcAlmacen: TwwDBLookupCombo;
      edtAlmacen: TEdit;
      Label5: TLabel;
      dblcTInv: TwwDBLookupCombo;
      edtTinv: TEdit;
      Timer1: TTimer;
      bbtnFiltrar2: TBitBtn;
      bbtnRep2: TBitBtn;
      gbOpcional: TGroupBox;
      lblProv: TLabel;
      dblcdProv: TwwDBLookupComboDlg;
      dbeProv: TEdit;
      Label12: TLabel;
      dblcdMarca: TwwDBLookupComboDlg;
      edtMarca: TEdit;
      Label13: TLabel;
      dblcdArtTipo: TwwDBLookupComboDlg;
      edtTipArt: TEdit;
      ppdb1: TppDBPipeline;
      ppr1: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppFooterBand2: TppFooterBand;
      bbtnConsignacion: TBitBtn;
      bbtnExcel1: TBitBtn;
      dtgData: TDBGrid;
      cbDiseno: TCheckBox;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLabel1: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppLabel3: TppLabel;
      ppParameterList1: TppParameterList;
      sbDisenoRep: TSpeedButton;
      Procedure dblcCiaExit(Sender: TObject);
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure bbtnFiltrarClick(Sender: TObject);
      Procedure bbtnImprimirClick(Sender: TObject);
      Procedure dblcAlmacenExit(Sender: TObject);
      Procedure dblcTInvExit(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure bbtnFiltrar2Click(Sender: TObject);
      Procedure bbtnRep2Click(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcdMarcaExit(Sender: TObject);
      Procedure dblcdProvExit(Sender: TObject);
      Procedure dblcdArtTipoExit(Sender: TObject);
      Procedure bbtnConsignacionClick(Sender: TObject);
      Procedure bbtnExcel1Click(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure sbDisenoRepClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolConsultaxArticulo: TFToolConsultaxArticulo;
   xAccesoBotones: Boolean;

Implementation

Uses FacDM, oaVE3000;

{$R *.DFM}

Procedure TFToolConsultaxArticulo.dblcCiaExit(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMFAC.cdsCia.IndexFieldNames <> 'CIAID' Then
      DMFAC.cdsCia.IndexFieldNames := 'CIAID';
   DMFAC.cdsCia.SetKey;
   DMFAC.cdsCia.FieldByName('CIAID').AsString := dblcCia.Text;
   If Not DMFAC.cdsCia.GotoKey Then
   Begin
      ShowMessage('Compañía No encontrada en Relación, Reintente!');
      dblcCia.SetFocus;
      exit;
   End;
   edtCia.Text := DMFAC.cdsCia.FieldByName('CIADES').AsString;
   DMFAC.FiltraTabla(DMFAC.cdsTInven, 'TGE152', 'TINID', 'CIAID=' + quotedstr(dblcCia.Text));
End;

Procedure TFToolConsultaxArticulo.NotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFToolConsultaxArticulo.bbtnFiltrarClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If dblcCia.text = '' Then
   Begin
      dblcCia.enabled := True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   End;

   If dblcAlmacen.text = '' Then
   Begin
      dblcAlmacen.enabled := True;
      dblcAlmacen.SetFocus;
      Raise Exception.Create('Ingrese Almacén');
   End;

   If dtpInicio.date = 0 Then
   Begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   End;

   If dtpFin.date = 0 Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   End;

   If dtpFin.date < dtpInicio.date Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   End;

   xSQL := ' Select B.CIAID, B.LOCID, B.TINID, B.ALMID, A.GRARID, A.FAMID, A.SFAMID, '
         + '        A.ARTID, A.ARTDES, A.DFACCANTG, A.TMONID, A.DFACMTOMO, A.UNMIDG, '
         + '        B.FACSERIE, B.NFAC, B.FACFECHA, B.FACUSER, B.CLIEID, B.CLIEDES, '
         + '        C.DOCABR DOCDES, D.CIADES, E.LOCDES, F.TINDES, G.ALMDES, H.GRARDES, '
         + '        I.FAMDES, J.SFAMDES, K.TMONABR, L.MARCA, L.MODELO,  '
         + '        ROUND(NVL(A.DFACPREVMO,0)*(1+NVL(A.DFACIMP1,0)/100),2) PU, '
         + '        ROUND(NVL(A.DFACVTOTMO,0),2) PT '
         + '   from FAC306 A, FAC305 B, TGE110 C, TGE101 D, TGE126 E, TGE152 F, TGE151 G, '
         + '        TGE131 H, TGE169 I, TGE170 J, TGE103 K, TGE205 L '
         + '  where A.CIAID=B.CIAID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
         + '    and A.TINID=' + quotedstr(dblcTInv.text)
         + '    and A.ALMID=' + quotedstr(dblcAlmacen.text)
         + '    and B.CIAID=' + QuotedStr(dblcCia.text)
         + '    and B.FACFECHA>=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpInicio.date) + '''' + ')'
         + '    and B.FACFECHA<=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpFin.date) + '''' + ')'
         + '    and B.FACESTADO=''ACEPTADO'' AND B.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + '    and (A.CIAID=D.CIAID(+)) ' // Compañía
         + '    and (A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+)) ' // Localidad
         + '    and (A.CIAID=F.CIAID(+) AND A.TINID=F.CIAID(+)) ' // Tipo de Inventario
         + '    and (A.CIAID=G.CIAID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+)) ' // Almacén
         + '    and (A.CIAID=H.CIAID(+) AND A.TINID=H.TINID(+) AND A.GRARID=H.GRARID(+)) ' // Línea
         + '    and (A.CIAID=I.CIAID(+) AND A.TINID=I.TINID(+) AND A.GRARID=I.GRARID(+) '
         + '                         AND A.FAMID=I.FAMID(+)) ' // Familia
         + '    and (A.CIAID=J.CIAID(+) AND A.TINID=J.TINID(+) AND A.GRARID=J.GRARID(+) '
         + '                         AND A.FAMID=J.FAMID(+) AND A.SFAMID=J.SFAMID(+)) ' // SubFamilia
         + '    and (A.TMONID=K.TMONID(+)) ' // Moneda
         + '    and (L.CIAID(+)=A.CIAID and L.ARTID(+)=A.ARTID) '
         + '  order BY A.ARTID,B.FACFECHA';
   xSQL := 'select * from (' + xSQL + ') SOLVISTA ';

   GReporte.TableName := 'VWFACREPXART';
   GReporte.UsuarioSQL.Clear;
   GReporte.UsuarioSQL.Add(xSQL);
   GReporte.NewQuery;
   bbtnImprimir.Enabled := True;
End;

Procedure TFToolConsultaxArticulo.bbtnImprimirClick(Sender: TObject);
Var
   x10, x: integer;
   xSQL, xWhere, xOrder: String;
   xOpciones: String;
Begin
   If dblcCia.text = '' Then
   Begin
      dblcCia.enabled := True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   End;

   If dtpInicio.date = 0 Then
   Begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   End;

   If dtpFin.date = 0 Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   End;

   If dtpFin.date < dtpInicio.date Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   End;

   xOpciones := '';
   If Length(Trim(dblcdMarca.Text)) <> 0 Then
      xOpciones := xOpciones + ' and L.MARCA LIKE ''' + dblcdMarca.Text + '%'' ';

   If Length(Trim(dblcdArtTipo.Text)) <> 0 Then
      xOpciones := xOpciones + ' and L.TIPART LIKE ''' + dblcdArtTipo.Text + '%'' ';

   If Length(Trim(dblcdProv.Text)) <> 0 Then
      xOpciones := xOpciones + ' and L.PROV LIKE ''' + dblcdProv.Text + '%'' ';

   xSQL := 'Select B.CIAID, B.LOCID, B.TINID, A.ALMID, A.GRARID, A.FAMID, A.SFAMID, '
         + '       A.ARTID, A.ARTDES, A.DFACCANTG, A.TMONID, A.DFACMTOMO, A.UNMIDG, '
         + '       B.FACSERIE, B.NFAC, B.FACFECHA, B.FACUSER, B.CLIEID, B.CLIEDES, '
         + '       C.DOCABR DOCDES, D.CIADES, E.LOCDES, F.TINDES, G.ALMDES, H.GRARDES, '
         + '       I.FAMDES, J.SFAMDES, K.TMONABR, L.MARCA,M.VENOMBRES,P.PROVDES,'
         + '       ROUND( ROUND(NVL(A.DFACVTOTMO,0)*CASE WHEN A.TMONID=''D'' THEN B.FACTCAM ELSE 1 END,2) / A.DFACCANTG,3) PU, '
         + '       ROUND(NVL(A.DFACVTOTMO,0)*CASE WHEN A.TMONID=''D'' THEN B.FACTCAM ELSE 1 END, 2 ) PT, '
         + '       ROUND(NVL(A.DFACMTOMO,0)*CASE WHEN A.TMONID=''D'' THEN B.FACTCAM ELSE 1 END, 2 ) PV '
         + '  from FAC306 A, FAC305 B, TGE110 C, TGE101 D, TGE126 E, TGE152 F, TGE151 G, '
         + '       TGE131 H, TGE169 I, TGE170 J, TGE103 K,TGE205 L,CXC203 M, TGE201 P  '
         + ' where A.CIAID=B.CIAID AND A.DOCID=B.DOCID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
         + '   and A.TINID=' + quotedstr(dblcTInv.text)
         + '   and A.ALMID like ''%' + dblcAlmacen.text + ''' '
         + '   and B.CIAID=' + QuotedStr(dblcCia.text)
         + '   and B.FACFECHA>=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpInicio.date) + '''' + ')'
         + '   and B.FACFECHA<=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpFin.date) + '''' + ')'
         + '   and B.FACESTADO=''ACEPTADO'' AND B.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + '   and (A.CIAID=D.CIAID(+)) ' // Compañía
         + '   and (A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+)) ' // Localidad
         + '   and (A.CIAID=F.CIAID(+) AND A.TINID=F.TINID(+)) ' // Tipo de Inventario
         + '   and (A.CIAID=G.CIAID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+)) ' // Almacén
         + '   and (A.CIAID=H.CIAID(+) AND A.TINID=H.TINID(+) AND A.GRARID=H.GRARID(+)) ' // Línea
         + '   and (A.CIAID=I.CIAID(+) AND A.TINID=I.TINID(+) AND A.GRARID=I.GRARID(+) '
         + '                          AND A.FAMID=I.FAMID(+)) ' // Familia
         + '   and (A.CIAID=J.CIAID(+) AND A.TINID=J.TINID(+) AND A.GRARID=J.GRARID(+) '
         + '                          AND A.FAMID=J.FAMID(+) AND A.SFAMID=J.SFAMID(+)) ' // SubFamilia
         + '   and (A.TMONID=K.TMONID(+)) ' // Moneda
         + '   and (L.CIAID(+)=A.CIAID and L.ARTID(+)=A.ARTID) ' //Maestro de Articulo
         + '   and (A.CIAID=M.CIAID(+) AND A.VEID=M.VEID(+) )  ' //vendedor
         + '   and (P.CLAUXID(+)=''P'' AND L.PROV=P.PROV(+) )  ' //proveedor
         + xOpciones
         + 'ORDER BY A.ALMID, A.ARTID, B.FACFECHA, B.DOCID, B.FACSERIE, B.NFAC ';
   xSQL := 'select * from (' + xSQL + ') SOLVISTA ';

   xWhere := '';
   For x := 0 To GReporte.FMant.lbFiltroReal.Items.Count - 1 Do
   Begin
      If length(xWhere) > 0 Then
         If Copy(GReporte.FMant.lbFiltroReal.Items.Strings[x], 1, 4) = ' or ' Then
            xWhere := xWhere + GReporte.FMant.lbFiltroReal.Items.Strings[x]
         Else
            xWhere := xWhere + ' and ' + GReporte.FMant.lbFiltroReal.Items.Strings[x]
      Else
      Begin
         xWhere := GReporte.FMant.lbFiltroReal.Items.Strings[x];
      End;
   End;

   xOrder := '';
   For x := 0 To GReporte.FMant.lbOrdenReal.Items.Count - 1 Do
   Begin
      If length(xOrder) > 0 Then
         xOrder := xOrder + ', ' + GReporte.FMant.lbOrdenReal.Items.Strings[x]
      Else
      Begin
         xOrder := GReporte.FMant.lbOrdenReal.Items.Strings[x];
      End;
   End;

   If Length(xWhere) > 0 Then xSQL := xSQL + ' WHERE ' + xWhere;
   If Length(xOrder) > 0 Then xSQL := xSQL + ' ORDER BY ' + xOrder;

   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;

   If DMFAC.cdsQry3.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros a mostrar');
   End;

   ppdbReporte.DataSource := DMFAC.dsQry3;
   ppReporte.DataPipeline := ppdbReporte;
   ppReporte.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\VentadeArticulos.rtm';
   ppReporte.template.LoadFromFile;

   ppLblCia.caption := edtCia.text;
   ppLblFecha.caption := ' Del ' + DateToStr(dtpInicio.date) + ' al ' + DateToStr(dtpFin.date);

   ppd1.Report := ppReporte;
   If cbDiseno.Checked Then
      ppd1.showmodal
   Else
      ppReporte.Print;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
   ppd1.Report := Nil;
   ppdbReporte.DataSource := Nil;
End;

Procedure TFToolConsultaxArticulo.dblcAlmacenExit(Sender: TObject);
Begin
   If DMFAC.cdsAlmacen.IndexFieldNames <> 'ALMID' Then
      DMFAC.cdsAlmacen.IndexFieldNames := 'ALMID';

   If dblcAlmacen.Text = '' Then
   Begin
      edtAlmacen.Text := '';
      Exit;
   End;

   DMFAC.cdsAlmacen.SetKey;
   DMFAC.cdsAlmacen.FieldByName('ALMID').AsString := dblcAlmacen.Text;
   If Not DMFAC.cdsAlmacen.GotoKey Then
   Begin
      ShowMessage('Almacén NO encontrado, reintente');
      dblcAlmacen.SetFocus;
      exit;
   End;
   edtAlmacen.Text := DMFAC.cdsAlmacen.FieldByName('ALMDES').AsString;
End;

Procedure TFToolConsultaxArticulo.dblcTInvExit(Sender: TObject);
Begin
   If DMFAC.cdsTInven.IndexFieldNames <> 'TINID' Then
      DMFAC.cdsTInven.IndexFieldNames := 'TINID';
   DMFAC.cdsTInven.SetKey;
   DMFAC.cdsTInven.FieldByName('TINID').AsString := dblcTInv.Text;
   If Not DMFAC.cdsTInven.GotoKey Then
   Begin
      ShowMessage('Tipo de Inventario NO encontrado en relación, reintente');
      dblcTInv.SetFocus;
      exit;
   End;
   edtTinv.Text := DMFAC.cdsTInven.FieldByName('TINDES').AsString;
   DMFAC.FiltraTabla(DMFAC.cdsAlmacen, 'TGE151', 'ALMID',
      'CIAID=' + quotedstr(dblcCia.Text) + ' and TINID=' + quotedstr(dblcTInv.Text) + ' and ALMVTA=''S'' ');
End;

Procedure TFToolConsultaxArticulo.Timer1Timer(Sender: TObject);
Begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));
   If (DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P') Then
   Else
   Begin
      If Not xAccesoBotones Then
      Begin
         DMFAC.AccesosUsuariosR(DMFAC.wModulo, DMFAC.wUsuario, '2', FToolConsultaxArticulo);
         xAccesoBotones := True;
      End;
   End;
   Timer1.Destroy;
End;

Procedure TFToolConsultaxArticulo.bbtnFiltrar2Click(Sender: TObject);
Var
   xSQL, xSQL2, xSQL3: String;
Begin
   If dblcCia.text = '' Then
   Begin
      dblcCia.enabled := True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   End;

   If dtpInicio.date = 0 Then
   Begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   End;

   If dtpFin.date = 0 Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   End;

   If dtpFin.date < dtpInicio.date Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   End;

   xSQL := ' Select B.CIAID, B.LOCID, B.TINID, A.ALMID, A.GRARID, A.FAMID, A.SFAMID, A.ARTID, A.ARTDES, '
         + '        L.UNMIDG, D.CIADES, E.LOCDES, F.TINDES, G.ALMDES, H.GRARDES, I.FAMDES, J.SFAMDES, '
         + '        L.MARCA, M.MARDES, L.TIPART, (CASE WHEN T.TIPARTDES IS NULL THEN A.ARTDES ELSE T.TIPARTDES END) TIPARTDES, L.MODELO, L.PROV, P.PROVDES, CARART, '
         + '        SUM(NVL(A.DFACCANTG,0)) VENTA, SUM(NVL(A.DFACMTOMN,0)) IMPMN, SUM(NVL(A.DFACMTOME,0)) IMPME, '
         + '        ''' + dtpInicio.Text + ''' FECINI, ''' + dtpFin.Text + ''' FECFIN, '
         + '        ''DESDE ' + dtpInicio.Text + ' HASTA ' + dtpFin.Text + ''' RANGO '
         + '   from FAC306 A, FAC305 B, TGE101 D, TGE126 E, TGE152 F, TGE151 G, TGE131 H, TGE169 I, TGE170 J, '
         + '        TGE205 L, ALM_MAR_ART M, ALM_TIP_ART T, TGE201 P '
         + '  where A.CIAID=B.CIAID AND A.DOCID=B.DOCID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
         + '    and A.TINID=' + quotedstr(dblcTInv.text)
         + '    and A.ALMID like ''%' + dblcAlmacen.text + ''' '
         + '    and B.CIAID=' + QuotedStr(dblcCia.text)
         + '    and B.FACFECHA>=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpInicio.date) + '''' + ') '
         + '    and B.FACFECHA<=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpFin.date) + '''' + ') '
         + '    and B.FACESTADO=''ACEPTADO'' '
         + '    and (A.CIAID=D.CIAID(+)) '
         + '    and (A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+)) '
         + '    and (A.CIAID=F.CIAID(+) AND A.TINID=F.TINID(+)) '
         + '    and (A.CIAID=G.CIAID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+)) '
         + '    and (A.CIAID=H.CIAID(+) AND A.TINID=H.TINID(+) AND A.GRARID=H.GRARID(+)) '
         + '    and (A.CIAID=I.CIAID(+) AND A.TINID=I.TINID(+) AND A.GRARID=I.GRARID(+) AND A.FAMID=I.FAMID(+)) '
         + '    and (A.CIAID=J.CIAID(+) AND A.TINID=J.TINID(+) AND A.GRARID=J.GRARID(+) AND A.FAMID=J.FAMID(+) AND A.SFAMID=J.SFAMID(+)) '
         + '    and (L.CIAID(+)=A.CIAID and L.ARTID(+)=A.ARTID) '
         + '    and (L.MARCA=M.MARCA(+)) ';

   If dblcdMarca.Text <> '' Then
      xSQL := xSQL
         + '    and L.MARCA(+) LIKE ''' + dblcdMarca.Text + '%'' ';

   xSQL := xSQL
         + '    and (L.TIPART=T.TIPART(+)) ';

   If dblcdArtTipo.Text <> '' Then
      xSQL := xSQL
         + '    and L.TIPART(+) LIKE ''' + dblcdArtTipo.Text + '%'' ';

   xSQL := xSQL
         + '    and (P.CLAUXID(+)=''P'' AND L.PROV=P.PROV(+)) ';

   If dblcdProv.Text = '' Then
      xSQL := xSQL
         + '    and P.PROV(+) LIKE ''' + dblcdProv.Text + '%'' '
   Else
      xSQL := xSQL
         + '    and P.PROV LIKE ''' + dblcdProv.Text + '%'' ';

   xSQL := xSQL
         + '  group by B.CIAID, B.LOCID, B.TINID, A.ALMID, A.GRARID, A.FAMID, A.SFAMID, A.ARTID, A.ARTDES, '
         + '           L.UNMIDG, D.CIADES, E.LOCDES, F.TINDES, G.ALMDES, H.GRARDES, I.FAMDES, J.SFAMDES, '
         + '           L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, L.PROV, P.PROVDES, L.CARART ';

// SE AÑADE PARA RESTAR LOS ARTICULOS DEVUELTOS POR NOTA DE CREDITO
   xSQL2 := xSQL2
         + ' union all ';

   xSQL2 := xSQL2
         + ' Select B.CIAID, B.LOCID, B.TINID, A.ALMID, A.GRARID, A.FAMID, A.SFAMID, A.ARTID, A.ARTDES, '
         + '        L.UNMIDG, D.CIADES, E.LOCDES, F.TINDES, G.ALMDES, H.GRARDES, I.FAMDES, J.SFAMDES, '
         + '        L.MARCA, M.MARDES, L.TIPART, (CASE WHEN T.TIPARTDES IS NULL THEN A.ARTDES ELSE T.TIPARTDES END) TIPARTDES, L.MODELO, L.PROV, P.PROVDES, CARART, '
        // + '        SUM(NVL(A.DFACCANTG,0))*(-1) VENTA, SUM(NVL(A.DFACMTOMN,0))*(-1) IMPMN, SUM(NVL(A.DFACMTOME,0))*(-1) IMPME, '
         + '        SUM(NVL(LG.KDXCNTG,0))*(-1) VENTA, '
         + '        SUM(NVL(A.DFACPREUMN,0)*NVL(LG.KDXCNTG,0))*(-1) IMPMN, '
         + '        SUM(NVL(A.DFACPREUME,0)*NVL(LG.KDXCNTG,0))*(-1) IMPME, '
         + '        ''' + dtpInicio.Text + ''' FECINI, ''' + dtpFin.Text + ''' FECFIN, '
         + '        ''DESDE ' + dtpInicio.Text + ' HASTA ' + dtpFin.Text + ''' RANGO '
         + '   from FAC306 A, FAC305 B, TGE101 D, TGE126 E, TGE152 F, TGE151 G, TGE131 H, TGE169 I, TGE170 J, '
         + '        TGE205 L, ALM_MAR_ART M, ALM_TIP_ART T, TGE201 P, '
         + '        CXC304 DNC, CXC301 NC, LOG315 LG '
         + '  where A.CIAID=B.CIAID AND A.DOCID=B.DOCID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
         + '    and A.TINID=' + quotedstr(dblcTInv.text)
         + '    and A.ALMID like ''%' + dblcAlmacen.text + ''' '
         + '    and B.CIAID=' + QuotedStr(dblcCia.text)
         + '    and B.FACFECHA>=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpInicio.date) + '''' + ') '
         + '    and B.FACFECHA<=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpFin.date) + '''' + ') '
         + '    and B.FACESTADO=''ACEPTADO'' '
         + '    and (A.CIAID=D.CIAID(+)) '
         + '    and (A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+)) '
         + '    and (A.CIAID=F.CIAID(+) AND A.TINID=F.TINID(+)) '
         + '    and (A.CIAID=G.CIAID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+)) '
         + '    and (A.CIAID=H.CIAID(+) AND A.TINID=H.TINID(+) AND A.GRARID=H.GRARID(+)) '
         + '    and (A.CIAID=I.CIAID(+) AND A.TINID=I.TINID(+) AND A.GRARID=I.GRARID(+) AND A.FAMID=I.FAMID(+)) '
         + '    and (A.CIAID=J.CIAID(+) AND A.TINID=J.TINID(+) AND A.GRARID=J.GRARID(+) AND A.FAMID=J.FAMID(+) AND A.SFAMID=J.SFAMID(+)) '
         + '    and (L.CIAID(+)=A.CIAID and L.ARTID(+)=A.ARTID) '
         + '    and (L.MARCA=M.MARCA(+)) ';
   If dblcdMarca.Text <> '' Then
      xSQL2 := xSQL2
         + '    and L.MARCA(+) LIKE ''' + dblcdMarca.Text + '%'' ';

   xSQL2 := xSQL2
         + '    and (L.TIPART=T.TIPART(+)) ';

   If dblcdArtTipo.Text <> '' Then
      xSQL2 := xSQL2
         + '    and L.TIPART(+) LIKE ''' + dblcdArtTipo.Text + '%'' ';

   xSQL2 := xSQL2
         + '    and (P.CLAUXID(+)=''P'' AND L.PROV=P.PROV(+)) ';

   If dblcdProv.Text = '' Then
      xSQL2 := xSQL2
         + '    and P.PROV(+) LIKE ''' + dblcdProv.Text + '%'' '
   Else
      xSQL2 := xSQL2
         + '    and P.PROV LIKE ''' + dblcdProv.Text + '%'' ';

   xSQL2 := xSQL2
         + '    and DNC.CIAID(+)=A.CIAID AND DNC.DOCID(+)=A.DOCID AND DNC.CCSERIE(+)=A.FACSERIE AND DNC.CCNODOC(+)=A.NFAC '
         + '    and DNC.CIAID=NC.CIAID(+) AND DNC.TCANJEID=NC.TCANJEID(+) AND DNC.CCCANJE=NC.CCCANJE(+) '
         + '    and NC.CIAID=LG.CIAID(+) AND NC.CCPEDIDO=LG.NISAID(+) '
         + '    and LG.nisatip(+)=''INGRESO'' AND LG.NISSIT(+)=''ACEPTADO'' AND LG.TRIID IN (''25'',''15'') '
         + '    and A.ALMID=LG.ALMID AND A.ARTID=LG.ARTID ';

   xSQL2 := xSQL2
         + '  group by B.CIAID, B.LOCID, B.TINID, A.ALMID, A.GRARID, A.FAMID, A.SFAMID, A.ARTID, A.ARTDES, '
         + '           L.UNMIDG, D.CIADES, E.LOCDES, F.TINDES, G.ALMDES, H.GRARDES, I.FAMDES, J.SFAMDES, '
         + '           L.MARCA, M.MARDES, L.TIPART, T.TIPARTDES, L.MODELO, L.PROV, P.PROVDES, L.CARART '
         + '  order by PROVDES, MARDES, TIPARTDES, ARTID, ALMID';

   xSQL3 :=' SELECT CIAID, LOCID, TINID, ALMID, GRARID, FAMID, SFAMID, ARTID, ARTDES, '
         + '        UNMIDG, CIADES, LOCDES, TINDES, ALMDES, GRARDES, FAMDES, SFAMDES, '
         + '        MARCA, MARDES, TIPART, TIPARTDES, MODELO, PROV, PROVDES, CARART, '
         + '        SUM(NVL(VENTA,0)) VENTA, SUM(NVL(IMPMN,0)) IMPMN, SUM(NVL(IMPME,0)) IMPME, '
         + '        FECINI, FECFIN, RANGO '
         + '   From (' + xSQL + xSQL2 + ') '
         + '  group by CIAID, LOCID, TINID, ALMID, GRARID, FAMID, SFAMID, ARTID, ARTDES, '
         + '           UNMIDG, CIADES, LOCDES, TINDES, ALMDES, GRARDES, FAMDES, SFAMDES, '
         + '           MARCA, MARDES, TIPART, TIPARTDES, MODELO, PROV, PROVDES, CARART, '
         + '           FECINI, FECFIN, RANGO';

   xSQL := 'select * from (' + xSQL3 + ') SOLVISTA ';

   GReporte.TableName := 'VWFACARTVEN';
   GReporte.UsuarioSQL.Clear;
   GReporte.UsuarioSQL.Add(xSQL);
   GReporte.NewQuery;
   bbtnImprimir.Enabled := True;
End;

Procedure TFToolConsultaxArticulo.bbtnRep2Click(Sender: TObject);
Var
   x10, x: integer;
   xSQL, xWhere, xOrder: String;
Begin
   If dblcCia.text = '' Then
   Begin
      dblcCia.enabled := True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   End;

   If dtpInicio.date = 0 Then
   Begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   End;

   If dtpFin.date = 0 Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   End;

   If dtpFin.date < dtpInicio.date Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   End;

   xSQL := GReporte.FMant.SQL;

   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;

   If DMFAC.cdsQry3.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros a mostrar');
   End;

   ppdb1.DataSource := DMFAC.dsQry3;
   ppR1.DataPipeline := ppdb1;
   ppR1.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\VentaArticuloGrupos.rtm';
   ppR1.template.LoadFromFile;

   ppd1.Report := ppR1;
   If cbDiseno.Checked Then
      ppd1.showmodal
   Else
      ppR1.Print;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
   ppdb1.DataSource := Nil;
   ppd1.Report := Nil;
End;

Procedure TFToolConsultaxArticulo.FormCreate(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := ' Select CLAUXID, A.PROV, PROVDES '
         + '   from TGE201 A, (SELECT PROV FROM TGE205 GROUP BY PROV ) B '
         + '  where CLAUXID=''P'' AND A.PROV=B.PROV '
         + '  order by PROVDES';
   DMFAC.cdsQry10.Close;
   DMFAC.cdsQry10.DataRequest(xSQL);
   DMFAC.cdsQry10.Open;
   DMFAC.cdsQry10.IndexFieldNames := 'PROVDES';

// MARCA DE ARTICULO
   xSQL := 'SELECT * FROM ALM_MAR_ART ORDER BY MARDES';
   DMFAC.cdsQry11.Close;
   DMFAC.cdsQry11.DataRequest(xSQL);
   DMFAC.cdsQry11.Open;
   DMFAC.cdsQry11.IndexFieldNames := 'MARDES';

// TIPO DE ARTICULO
   xSQL := 'SELECT * FROM ALM_TIP_ART ORDER BY TIPARTDES';
   DMFAC.cdsQry12.Close;
   DMFAC.cdsQry12.DataRequest(xSQL);
   DMFAC.cdsQry12.Open;
   DMFAC.cdsQry12.IndexFieldNames := 'TIPARTDES';

   dblcCia.LookupTable := DMFAC.cdsCia;
   dblcTInv.LookupTable := DMFAC.cdsTInven;
   dblcAlmacen.LookupTable := DMFAC.cdsAlmacen;
   dblcdProv.LookupTable := DMFAC.cdsQry10;
   dblcdMarca.LookupTable := DMFAC.cdsQry11;
   dblcdArtTipo.LookupTable := DMFAC.cdsQry12;
End;

Procedure TFToolConsultaxArticulo.dblcdMarcaExit(Sender: TObject);
Begin
   edtMarca.text := DMFAC.BuscaQry('dspUltTGE', 'ALM_MAR_ART', 'MARDES', 'MARCA=' + quotedstr(dblcdMarca.text), 'MARDES');
End;

Procedure TFToolConsultaxArticulo.dblcdProvExit(Sender: TObject);
Begin
   dbeProv.text := DMFAC.BuscaQry('dspUltTGE', 'TGE201', 'CLAUXID,PROVDES', 'PROV=' + quotedstr(dblcdProv.text), 'PROVDES');
End;

Procedure TFToolConsultaxArticulo.dblcdArtTipoExit(Sender: TObject);
Begin
   edtTipArt.text := DMFAC.BuscaQry('dspUltTGE', 'ALM_TIP_ART', 'TIPARTDES', 'TIPART=' + quotedstr(dblcdArtTipo.text), 'TIPARTDES');
End;

Procedure TFToolConsultaxArticulo.bbtnConsignacionClick(Sender: TObject);
Var
   x10, x: integer;
   xSQL, xWhere, xOrder: String;
Begin
   If dblcCia.text = '' Then
   Begin
      dblcCia.enabled := True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   End;

   If dtpInicio.date = 0 Then
   Begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   End;

   If dtpFin.date = 0 Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   End;

   If dtpFin.date < dtpInicio.date Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   End;

   xSQL := ' Select B.CIAID, B.LOCID, B.TINID, A.ALMID, A.GRARID, A.FAMID, A.SFAMID, '
         + '        A.ARTID, A.ARTDES, A.DFACCANTG, A.TMONID, A.DFACMTOMO, A.UNMIDG, '
         + '        B.FACSERIE, B.NFAC, B.FACFECHA, B.FACUSER, B.CLIEID, B.CLIEDES, '
         + '        C.DOCABR DOCDES, D.CIADES, E.LOCDES, F.TINDES, G.ALMDES, H.GRARDES, '
         + '        I.FAMDES, J.SFAMDES, K.TMONABR, '
         + '        ROUND( ROUND(NVL(A.DFACVTOTMO,0)*CASE WHEN A.TMONID=''D'' THEN B.FACTCAM ELSE 1 END,2) / A.DFACCANTG,3) PU, '
         + '        ROUND(NVL(A.DFACVTOTMO,0)*CASE WHEN A.TMONID=''D'' THEN B.FACTCAM ELSE 1 END, 2 ) PT '
         + '   from FAC306 A, FAC305 B, TGE110 C, TGE101 D, TGE126 E, TGE152 F, TGE151 G, '
         + '        TGE131 H, TGE169 I, TGE170 J, TGE103 K, TGE205 Z '
         + '  where A.CIAID=B.CIAID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
         + '    and A.TINID=' + quotedstr(dblcTInv.text)
         + '    and A.ALMID=' + quotedstr(dblcAlmacen.text)
         + '    and B.CIAID=' + QuotedStr(dblcCia.text)
         + '    and B.FACFECHA>=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpInicio.date) + '''' + ')'
         + '    and B.FACFECHA<=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpFin.date) + '''' + ')'
         + '    and B.FACESTADO=''ACEPTADO'' AND B.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + '    and (A.CIAID=D.CIAID(+)) ' // Compañía
         + '    and (A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+)) ' // Localidad
         + '    and (A.CIAID=F.CIAID(+) AND A.TINID=F.CIAID(+)) ' // Tipo de Inventario
         + '    and (A.CIAID=G.CIAID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+)) ' // Almacén
         + '    and (A.CIAID=H.CIAID(+) AND A.TINID=H.TINID(+) AND A.GRARID=H.GRARID(+)) ' // Línea
         + '    and (A.CIAID=I.CIAID(+) AND A.TINID=I.TINID(+) AND A.GRARID=I.GRARID(+) '
         + '                            AND A.FAMID=I.FAMID(+)) ' // Familia
         + '    and (A.CIAID=J.CIAID(+) AND A.TINID=J.TINID(+) AND A.GRARID=J.GRARID(+) '
         + '                            AND A.FAMID=J.FAMID(+) AND A.SFAMID=J.SFAMID(+)) ' // SubFamilia
         + '    and (A.TMONID=K.TMONID(+)) ' // Moneda
         + '    and A.CIAID=Z.CIAID AND A.TINID=Z.TINID AND A.ARTID=Z.ARTID AND NVL(Z.CONSIGNACION,''N'')=''S'' '
         + '  order by A.ARTID, B.FACFECHA, B.DOCID, B.FACSERIE, B.NFAC ';

   xSQL := 'select * from (' + xSQL + ') SOLVISTA ';

   xWhere := '';
   For x := 0 To GReporte.FMant.lbFiltroReal.Items.Count - 1 Do
   Begin
      If length(xWhere) > 0 Then
         If Copy(GReporte.FMant.lbFiltroReal.Items.Strings[x], 1, 4) = ' or ' Then
            xWhere := xWhere + GReporte.FMant.lbFiltroReal.Items.Strings[x]
         Else
            xWhere := xWhere + ' and ' + GReporte.FMant.lbFiltroReal.Items.Strings[x]
      Else
      Begin
         xWhere := GReporte.FMant.lbFiltroReal.Items.Strings[x];
      End;
   End;

   xOrder := '';
   For x := 0 To GReporte.FMant.lbOrdenReal.Items.Count - 1 Do
   Begin
      If length(xOrder) > 0 Then
         xOrder := xOrder + ', ' + GReporte.FMant.lbOrdenReal.Items.Strings[x]
      Else
      Begin
         xOrder := GReporte.FMant.lbOrdenReal.Items.Strings[x];
      End;
   End;

   If Length(xWhere) > 0 Then xSQL := xSQL + ' WHERE ' + xWhere;
   If Length(xOrder) > 0 Then xSQL := xSQL + ' ORDER BY ' + xOrder;

   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;

   If DMFAC.cdsQry3.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No existen Registros a mostrar');
   End;

   ppdbReporte.DataSource := DMFAC.dsQry3;
   ppReporte.DataPipeline := ppdbReporte;
   ppReporte.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\VentaDeArticulosConsig.rtm';
   ppReporte.template.LoadFromFile;

   ppLblCia.caption := edtCia.text;
   ppLblFecha.caption := ' Del ' + DateToStr(dtpInicio.date) + ' al ' + DateToStr(dtpFin.date);

   ppd1.Report := ppReporte;
   If cbDiseno.Checked Then
      ppd1.showmodal
   Else
      ppReporte.Print;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;
   ppd1.Report := Nil;
   ppdbReporte.DataSource := Nil;
End;

Procedure TFToolConsultaxArticulo.bbtnExcel1Click(Sender: TObject);
Var
   x10, x: integer;
   xSQL, xWhere, xOrder: String;
   xOpciones: String;
Begin
   If dblcCia.text = '' Then
   Begin
      dblcCia.enabled := True;
      dblcCia.SetFocus;
      Raise Exception.Create('Ingrese Compañía');
   End;

   If dtpInicio.date = 0 Then
   Begin
      dtpInicio.SetFocus;
      Raise Exception.Create('Ingrese Fecha de Inicio');
   End;

   If dtpFin.date = 0 Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('Ingrese Fecha Final');
   End;

   If dtpFin.date < dtpInicio.date Then
   Begin
      dtpFin.SetFocus;
      Raise Exception.Create('La Fecha Final no puede ser menor que la Fecha de Inicio');
   End;
   xOpciones := '';
   If Length(Trim(dblcdMarca.Text)) = 0 Then
      xOpciones := xOpciones + ' and L.MARCA(+) LIKE ''' + dblcdMarca.Text + '%'' '
   Else
      xOpciones := xOpciones + ' and L.MARCA LIKE ''' + dblcdMarca.Text + '%'' ';

   If Length(Trim(dblcdArtTipo.Text)) = 0 Then
      xOpciones := xOpciones + ' and L.TIPART(+) LIKE ''' + dblcdArtTipo.Text + '%'' '
   Else
      xOpciones := ' and L.TIPART LIKE ''' + dblcdArtTipo.Text + '%'' ';

   If Length(Trim(dblcdProv.Text)) = 0 Then
      xOpciones := xOpciones + ' and L.PROV(+) LIKE ''' + dblcdProv.Text + '%'' '
   Else
      xOpciones := xOpciones + ' and L.PROV    LIKE ''' + dblcdProv.Text + '%'' ';

   xSQL := ' Select B.CIAID, B.LOCID, B.TINID, A.ALMID, A.GRARID, A.FAMID, A.SFAMID, '
         + '        A.ARTID, A.ARTDES, A.DFACCANTG, A.TMONID, A.DFACMTOMO, A.UNMIDG, '
         + '        B.FACSERIE, B.NFAC, B.FACFECHA, B.FACUSER, B.CLIEID, B.CLIEDES, '
         + '        C.DOCABR DOCDES, D.CIADES, E.LOCDES, F.TINDES, G.ALMDES, H.GRARDES, '
         + '        I.FAMDES, J.SFAMDES, K.TMONABR, '
         + '        ROUND( ROUND(NVL(A.DFACVTOTMO,0)*CASE WHEN A.TMONID=''D'' THEN B.FACTCAM ELSE 1 END,2) / A.DFACCANTG,3) PU, '
         + '        ROUND(NVL(A.DFACVTOTMO,0)*CASE WHEN A.TMONID=''D'' THEN B.FACTCAM ELSE 1 END, 2 ) PT, '
         + '        ROUND(NVL(A.DFACMTOMO,0)*CASE WHEN A.TMONID=''D'' THEN B.FACTCAM ELSE 1 END, 2 ) PV '
         + '   from FAC306 A, FAC305 B, TGE110 C, TGE101 D, TGE126 E, TGE152 F, TGE151 G, '
         + '        TGE131 H, TGE169 I, TGE170 J, TGE103 K,TGE205 L '
         + '  where A.CIAID=B.CIAID AND A.DOCID=B.DOCID AND A.FACSERIE=B.FACSERIE AND A.NFAC=B.NFAC '
         + '    and A.TINID=' + quotedstr(dblcTInv.text)
         + '    and A.ALMID like ''%' + dblcAlmacen.text + ''' '
         + '    and B.CIAID=' + QuotedStr(dblcCia.text)
         + '    and B.FACFECHA>=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpInicio.date) + '''' + ')'
         + '    and B.FACFECHA<=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpFin.date) + '''' + ')'
         + '    and B.FACESTADO=''ACEPTADO'' AND B.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + '    and (A.CIAID=D.CIAID(+)) ' // Compañía
         + '    and (A.CIAID=E.CIAID(+) AND A.LOCID=E.LOCID(+)) ' // Localidad
         + '    and (A.CIAID=F.CIAID(+) AND A.TINID=F.TINID(+)) ' // Tipo de Inventario
         + '    and (A.CIAID=G.CIAID(+) AND A.TINID=G.TINID(+) AND A.ALMID=G.ALMID(+)) ' // Almacén
         + '    and (A.CIAID=H.CIAID(+) AND A.TINID=H.TINID(+) AND A.GRARID=H.GRARID(+)) ' // Línea
         + '    and (A.CIAID=I.CIAID(+) AND A.TINID=I.TINID(+) AND A.GRARID=I.GRARID(+) '
         + '                            AND A.FAMID=I.FAMID(+)) ' // Familia
         + '    and (A.CIAID=J.CIAID(+) AND A.TINID=J.TINID(+) AND A.GRARID=J.GRARID(+) '
         + '                            AND A.FAMID=J.FAMID(+) AND A.SFAMID=J.SFAMID(+)) ' // SubFamilia
         + '    and (A.TMONID=K.TMONID(+)) ' // Moneda
         + '    and (L.CIAID(+)=A.CIAID and L.ARTID(+)=A.ARTID) ' //Maestro de Articulo
         + xOpciones
         + '  order by A.ARTID, B.FACFECHA, B.DOCID, B.FACSERIE, B.NFAC ';

   xSQL := 'select * from (' + xSQL + ') SOLVISTA ';

   xWhere := '';
   For x := 0 To GReporte.FMant.lbFiltroReal.Items.Count - 1 Do
   Begin
      If length(xWhere) > 0 Then
         If Copy(GReporte.FMant.lbFiltroReal.Items.Strings[x], 1, 4) = ' or ' Then
            xWhere := xWhere + GReporte.FMant.lbFiltroReal.Items.Strings[x]
         Else
            xWhere := xWhere + ' and ' + GReporte.FMant.lbFiltroReal.Items.Strings[x]
      Else
      Begin
         xWhere := GReporte.FMant.lbFiltroReal.Items.Strings[x];
      End;
   End;

   xOrder := '';
   For x := 0 To GReporte.FMant.lbOrdenReal.Items.Count - 1 Do
   Begin
      If length(xOrder) > 0 Then
         xOrder := xOrder + ', ' + GReporte.FMant.lbOrdenReal.Items.Strings[x]
      Else
      Begin
         xOrder := GReporte.FMant.lbOrdenReal.Items.Strings[x];
      End;
   End;

   If Length(xWhere) > 0 Then xSQL := xSQL + ' WHERE ' + xWhere;
   If Length(xOrder) > 0 Then xSQL := xSQL + ' ORDER BY ' + xOrder;

   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;

   dtgData.DataSource := DMFAC.dsQry3;

   If DMFAC.cdsQry3.RecordCount > 0 Then
   Begin
      Try
         DMFAC.HojaExcel('VENTAS', DMFAC.dsQry3, dtgData);
      Except
         On Ex: Exception Do
            Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
      End;
   End
   Else
      MessageDlg('No existe información para esta Consulta ', mtInformation, [mbOk], 0);

End;

Procedure TFToolConsultaxArticulo.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMFAC.cdsTInven.Close;
End;

Procedure TFToolConsultaxArticulo.sbDisenoRepClick(Sender: TObject);
Begin
   cbDiseno.checked := Not cbDiseno.checked;
End;


End.

