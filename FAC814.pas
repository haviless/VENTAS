Unit FAC814;
{
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Fac370
// FORMULARIO               : FFactSGuia
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Ventana de Facturación
//

// Actualizaciones:
// HPC_201305_FAC    09/4/2013
// HPC_201306_FAC    Se cambia de orden de índice de movimientos de almacén 
}
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, wwdblook, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Buttons, db,
   Wwdbdlg, DBGrids,
   DBClient, wwclient, wwexport, shellapi, ppEndUsr, ppProd, ppClass,
   ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands, ppCtrls, ppVar,
   ppPrnabl, ppCache, ppParameter;

Type
   TFCompras = Class(TForm)
      dbgData: TwwDBGrid;
      Panel1: TPanel;
      Label2: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      Label18: TLabel;
      dblcTienda: TwwDBLookupCombo;
      edtTienda: TEdit;
      Z2bbtnAcepta: TBitBtn;
      bbtnExcel: TBitBtn;
      Bevel1: TBevel;
      rgStock: TRadioGroup;
      Label17: TLabel;
      dblcLinea: TwwDBLookupCombo;
      edtLinea: TEdit;
      Label3: TLabel;
      dblcFam: TwwDBLookupCombo;
      edtFamilia: TEdit;
      Label1: TLabel;
      dblcSFamilia: TwwDBLookupCombo;
      edtSFamilia: TEdit;
      Label4: TLabel;
      dblcdMarca: TwwDBLookupComboDlg;
      edtMarca: TEdit;
      Panel2: TPanel;
      Panel3: TPanel;
      Panel4: TPanel;
      dbgExp: TwwDBGrid;
      dblcArticulo: TwwDBLookupComboDlg;
      edtArticulo: TEdit;
      Label5: TLabel;
      BtnImprime: TBitBtn;
      ppDBPCompras: TppDBPipeline;
      RepComprasXPVentas: TppReport;
      Diseno: TppDesigner;
      cbDiseno: TCheckBox;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppShape1: TppShape;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
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
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLabel20: TppLabel;
      ppLine8: TppLine;
      ppLine9: TppLine;
      ppLabel21: TppLabel;
      ppLine10: TppLine;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppLine13: TppLine;
      ppLine14: TppLine;
      ppLine15: TppLine;
      ppLine16: TppLine;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLine17: TppLine;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText17: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText23: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText16: TppDBText;
      ppDBText13: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppLine18: TppLine;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppGroupFooterBand4: TppGroupFooterBand;
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnExcelClick(Sender: TObject);
      Procedure dblcTiendaExit(Sender: TObject);
      Procedure dblcTiendaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcLineaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcFamNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcSFamiliaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcLineaExit(Sender: TObject);
      Procedure dblcFamExit(Sender: TObject);
      Procedure dblcSFamiliaExit(Sender: TObject);
      Procedure dblcFamEnter(Sender: TObject);
      Procedure dblcdMarcaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcTiendaEnter(Sender: TObject);
      Procedure dbgDataCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure dblcArticuloExit(Sender: TObject);
      Procedure dblcArticuloChange(Sender: TObject);
      Procedure BtnImprimeClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
      Procedure PorArticulo();
   End;

Var
   FCompras: TFCompras;
   xSQL: String;

Implementation

{$R *.dfm}

Uses FacDM;

Procedure TFCompras.Z2bbtnAceptaClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere, sSQL, sSQLC, sAno: String;
   x10: Integer;
   vPrecioVenta: Double;
   vWhere: String;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;

   vWhere := ' ';
   If rgStock.ItemIndex = 0 Then
   Begin
      vWhere := ' and NVL(C.STKSACTG,0)>0 '
   End;

   If rgStock.ItemIndex = 1 Then
   Begin
      If Length(Trim(dblcdMarca.Text)) = 0 Then
      Begin
         ShowMessage('Cuando es con stock 0 debe ingresar la Marca...');
         Exit;
      End;
      vWhere := ' and NVL(C.STKSACTG,0)= 0 '
   End;

   Screen.Cursor := crHourGlass;

   xSQL := 'select max(STKANO) STKANO '
         + '  from LOG316 '
         + ' where CIAID=' + QuotedStr(dblcCia.Text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   sAno := DMFAC.cdsQry.FieldByname('STKANO').asstring;

   sSQL := ' Select A.GRARID, F.GRARDES, A.FAMID, G.FAMDES, A.SFAMID, H.SFAMDES, E.MARCA, NVL(E.MARDES,''SIN MARCA'') MARDES, A.ARTID, D.ARTDES,'
         + '        K.TCAMVBV TCAMBIO, A.LPRETMONID, J.TMONABR, ''          '' NISAID, sysdate NISAFREG, 0.00 KDXCNTG, 0.00 COSTOIGVS, '
         + '        ''          '' NISAIDANT, sysdate NISAFREGANT, 0.00 KDXCNTGANT, 0.00 COSTOIGVSANT, B.ALMID, '
         + '        round(nvl(A.PREVEN, 0), 2) + round(nvl(A.PREVEN, 0) * ((I.TASACAN / 100)), 2) PRECIO_CAL, '
         + '        round(nvl(A.PREVENPRO, 0), 2) + round(nvl(A.PREVENPRO, 0) * ((I.TASACAN / 100)), 2) PRECIO_PRO, '
         + '        0.00 PORC_UTILIDAD, 0.00 IMPORTE_UTILIDAD, nvl(C.STKSACTG, 0) STKALM, nvl(D.ARTCNTG, 0) STKTOT '
         + '   From FAC201 A, TGE151 B, LOG316 C, TGE205 D, ALM_MAR_ART E, TGE131 F, TGE169 G, TGE170 H, TGE108 I, TGE103 J, '
         + '        (select TGE107.* '
         + '           from TGE107 '
         + '          where FECHA=(select max(FECHA) FECHA '
         + '                         from TGE107 '
         + '                        where trunc(FECHA)<=trunc(sysdate)) '
         + '                       ) K '
         + '  Where A.CIAID=''' + Trim(dblcCia.Text) + ''' and A.TLISTAID=''2DE'' and NVL(TRIM(A.ACTIVO),''S'')=''S'' '
         + '    and A.GRARID like ''' + Trim(dblcLinea.Text) + '%''  and A.FAMID  like ''' + Trim(dblcFam.Text) + '%''  '
         + '             and A.SFAMID like ''' + Trim(dblcSFamilia.Text) + '%'' '
         + '             and A.ARTID like ''' + Trim(dblcArticulo.Text) + '%''  ' // --- LISTA DE PRECIOS
         + '    and A.CIAID=B.CIAID and A.TINID=B.TINID and B.TIE_ID Like ''' + Trim(dblcTienda.Text) + '%'' '
         + '             and NVL(B.ACTIVO,''N'')=''S'' ' //       --- ALMACENES
         + '    and A.CIAID=C.CIAID and A.TINID=C.TINID and B.ALMID=C.ALMID and C.STKANO=''' + sAno + '''  '
         + '             and  A.ARTID=C.ARTID ' + vWhere + ' ' //--- SALDO POR ALMACEN
         + '    and A.CIAID=D.CIAID and A.TINID=D.TINID and A.ARTID=D.ARTID and D.MARCA like ''' + Trim(dblcdMarca.Text) + '%'' ' //         --- MAESTRO DE ARTICULOS
         + '    and D.MARCA=E.MARCA(+) ' // --- DESCRIPCION DE MARCA
         + '    and A.CIAID=F.CIAID(+) and A.TINID=F.TINID(+) and A.GRARID=F.GRARID(+) ' // --- DESCRIPCION LINEA
         + '    and A.CIAID=G.CIAID(+) and A.TINID=G.TINID(+) and A.GRARID=G.GRARID(+) and A.FAMID=G.FAMID(+) ' // --- DESCRIPCION FAMILIA
         + '    and A.CIAID=H.CIAID(+) and A.TINID=H.TINID(+) and A.GRARID=H.GRARID(+) and A.FAMID=H.FAMID(+) '
         + '             and A.SFAMID=H.SFAMID(+) ' //  --- DESCRIPCION SUB FAMILIA
         + '    and I.TASAFLG=''I'' ' // TASA DE IGV
         + '    and J.TMONID=''N'' '; // TIPO DE MONEDA

   DMFAC.cdsReporte.Close;

   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.IndexFieldNames := 'GRARID; FAMID; SFAMID; MARCA; MARDES; ARTID; ALMID ';
   DMFAC.cdsReporte.Open;

   If rgStock.ItemIndex = 0 Then // Stock General Mayor a Cero (>0)
   Begin
      DMFAC.cdsReporte.Filter := 'STKTOT>0';
      DMFAC.cdsReporte.Filtered := True;
   End;

   If rgStock.ItemIndex = 1 Then // Stock General Igual a Cero (=0)
   Begin
      DMFAC.cdsReporte.Filter := 'STKTOT=0';
      DMFAC.cdsReporte.Filtered := True;
   End;

   If rgStock.ItemIndex = 2 Then // Stock General  - Todos
   Begin
      DMFAC.cdsReporte.Filter := '';
      DMFAC.cdsReporte.Filtered := False;
   End;

   dbgData.Selected.Clear;
   dbgData.Selected.Add('GRARID'#9'03'#9'Linea');
   dbgData.Selected.Add('FAMID'#9'03'#9'Fam.');
   dbgData.Selected.Add('SFAMID'#9'03'#9'SFam');
   dbgData.Selected.Add('MARDES'#9'10'#9'Marca');
   dbgData.Selected.Add('ARTID'#9'09'#9'Articulo~Id.');
   dbgData.Selected.Add('ARTDES'#9'50'#9'Articulo~Descrip.');

   dbgData.Selected.Add('ALMID'#9'5'#9'Alm');

   dbgData.Selected.Add('NISAID'#9'10'#9'Nota Ingreso'#9'F'#9'Última Compra');
   dbgData.Selected.Add('NISAFREG'#9'10'#9'Fecha'#9'F'#9'Última Compra');
   dbgData.Selected.Add('KDXCNTG'#9'8'#9'Cantidad'#9'F'#9'Última Compra');
   dbgData.Selected.Add('COSTOIGVS'#9'10'#9'Precio'#9'F'#9'Última Compra');

   dbgData.Selected.Add('NISAIDANT'#9'10'#9'Nota Ingreso'#9'F'#9'Penúltima Compra');
   dbgData.Selected.Add('NISAFREGANT'#9'10'#9'Fecha'#9'F'#9'Penúltima Compra');
   dbgData.Selected.Add('KDXCNTGANT'#9'8'#9'Cantidad'#9'F'#9'Penúltima Compra');
   dbgData.Selected.Add('COSTOIGVSANT'#9'10'#9'Precio'#9'F'#9'Penúltima Compra');

   dbgData.Selected.Add('PRECIO_CAL'#9'10'#9'Precio~Calculado'); // Precio calculado
   dbgData.Selected.Add('PRECIO_PRO'#9'10'#9'Precio~Promoción'); // Precio Promoción
   dbgData.Selected.Add('PORC_UTILIDAD'#9'5'#9'(%)'#9'F'#9'Utilidad'); // % de Utilidad
   dbgData.Selected.Add('IMPORTE_UTILIDAD'#9'10'#9'Importe'#9'F'#9'Utilidad'); // Importe de Utilidad
   dbgData.Selected.Add('STKALM'#9'8'#9'Stock~Almacén'); // Stock de Almacén
   dbgData.Selected.Add('STKTOT'#9'8'#9'Stock~Gral'); // Stock Actual

   dbgData.Selected.Add('GRARDES'#9'20'#9'Linea'); // Linea
   dbgData.Selected.Add('FAMDES'#9'20'#9'Familia'); // Familia
   dbgData.Selected.Add('SFAMDES'#9'20'#9'SubFamilia'); // SubFamilia

   TNumericField(DMFAC.cdsReporte.FieldByName('PRECIO_CAL')).DisplayFormat := '###,##0.00';
   TNumericField(DMFAC.cdsReporte.FieldByName('PRECIO_PRO')).DisplayFormat := '###,##0.00';
   TNumericField(DMFAC.cdsReporte.FieldByName('COSTOIGVS')).DisplayFormat := '###,##0.00';
   TNumericField(DMFAC.cdsReporte.FieldByName('COSTOIGVSANT')).DisplayFormat := '###,##0.00';
   TNumericField(DMFAC.cdsReporte.FieldByName('IMPORTE_UTILIDAD')).DisplayFormat := '###,##0.00';
   dbgData.RedrawGrid;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   sSQLC := 'Select A.ALMID, A.ARTID, B.NISAFREG, A.NISAID, KDXCNTG, ROUND(A.ARTPCG * (1 + C.TASACAN/100), 2) COSTOIGVS '
         + '  from LOG315 A, LOG314 B, TGE108 C '
         + ' where A.CIAID=' + QuotedStr(dblcCia.Text) + '  AND A.TINID=''20'' AND A.NISATIP=''INGRESO'' '
         + '   and A.TRIID IN (''01'', ''02'', ''09'', ''11'', ''16'') ' // Tabla: TGE208 (Tipos de Notas de Almacén)
         + '   and A.NISAFREG >= ''01/01/2005'' '
         + '   and A.CIAID=B.CIAID(+) and A.TINID=B.TINID(+) and A.TDAID=B.TDAID(+) and A.ALMID=B.ALMID(+) '
         + '   and A.NISATIP=B.NISATIP(+) and A.NISAID=B.NISAID(+) and B.NISSIT(+)=''ACEPTADO'' '
         + '   and C.TASAFLG=''I'' '
         + ' order by A.ALMID, A.ARTID, B.NISAID DESC';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(sSQLC);
   DMFAC.cdsQry3.Open;

// Inicio HPC_201306_FAC
   DMFAC.cdsQry3.IndexFieldNames := 'ALMID; ARTID';
//   DMFAC.cdsQry3.IndexFieldNames := 'ARTID; NISAFREG';
// Fin HPC_201306_FAC

   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
// Inicio HPC_201306_FAC
      DMFAC.cdsQry3.Filtered := False;
      DMFAC.cdsQry3.Filter := '';
      DMFAC.cdsQry3.Filter := 'ALMID=' + quotedstr(DMFAC.cdsReporte.FieldByName('ALMID').AsString)
         + ' and ARTID=' + quotedstr(DMFAC.cdsReporte.FieldByName('ARTID').AsString);
      DMFAC.cdsQry3.Filtered := True;
      DMFAC.cdsQry3.First;
{
      DMFAC.cdsQry3.SetKey;
      DMFAC.cdsQry3.FieldByName('ALMID').AsString := DMFAC.cdsReporte.FieldByName('ALMID').AsString
      DMFAC.cdsQry3.FieldByName('ARTID').AsString := DMFAC.cdsReporte.FieldByName('ARTID').AsString;
}
// Fin HPC_201306_FAC

      DMFAC.cdsReporte.Edit;
      DMFAC.cdsReporte.FieldByname('NISAID').AsString := ''; // Nota de Ingreso últ.Compra
      DMFAC.cdsReporte.FieldByname('NISAFREG').AsDateTime := 0; // Fecha de últ.compra
      DMFAC.cdsReporte.FieldByname('KDXCNTG').AsFloat := 0; // Cantidad de últ.compra
      DMFAC.cdsReporte.FieldByname('COSTOIGVS').AsFloat := 0; // Precio de últ.compra

      DMFAC.cdsReporte.FieldByname('NISAIDANT').AsString := ''; // Nota de Ingreso penúlt.Compra
      DMFAC.cdsReporte.FieldByname('NISAFREGANT').AsDateTime := 0; // Fecha de penúlt.compra
      DMFAC.cdsReporte.FieldByname('KDXCNTGANT').AsFloat := 0; // Cantidad de penúlt.compra
      DMFAC.cdsReporte.FieldByname('COSTOIGVSANT').AsFloat := 0; // Precio de penúlt.compra

      If DMFAC.cdsQry3.FieldByname('COSTOIGVS').AsFloat > 0 Then
      Begin
         DMFAC.cdsReporte.FieldByname('NISAFREG').AsDateTime := DMFAC.cdsQry3.FieldByname('NISAFREG').AsDateTime;
         DMFAC.cdsReporte.FieldByname('NISAID').AsString := DMFAC.cdsQry3.FieldByname('NISAID').AsString;
         DMFAC.cdsReporte.FieldByname('KDXCNTG').AsFloat := DMFAC.cdsQry3.FieldByname('KDXCNTG').AsFloat;
         DMFAC.cdsReporte.FieldByname('COSTOIGVS').AsFloat := DMFAC.cdsQry3.FieldByname('COSTOIGVS').AsFloat;
      End;
   // Compra Anterior
      DMFAC.cdsQry3.Next;
      If (Not DMFAC.cdsQry3.EOF) And
         (DMFAC.cdsQry3.FieldByname('ARTID').AsString = DMFAC.cdsReporte.FieldByname('ARTID').AsString) Then
      Begin
         DMFAC.cdsReporte.FieldByname('NISAFREGANT').AsDateTime := DMFAC.cdsQry3.FieldByname('NISAFREG').AsDateTime;
         DMFAC.cdsReporte.FieldByname('NISAIDANT').AsString := DMFAC.cdsQry3.FieldByname('NISAID').AsString;
         DMFAC.cdsReporte.FieldByname('KDXCNTGANT').AsFloat := DMFAC.cdsQry3.FieldByname('KDXCNTG').AsFloat;
         DMFAC.cdsReporte.FieldByname('COSTOIGVSANT').AsFloat := DMFAC.cdsQry3.FieldByname('COSTOIGVS').AsFloat;
      End;

     // Importe de Ultilidad, Porcentaje de Utilidad
      If DMFAC.cdsReporte.FieldByname('PRECIO_PRO').AsFloat > 0 Then
         vPrecioVenta := DMFAC.cdsReporte.FieldByname('PRECIO_PRO').AsFloat
      Else
         vPrecioVenta := DMFAC.cdsReporte.FieldByname('PRECIO_CAL').AsFloat;

      If DMFAC.cdsReporte.FieldByname('COSTOIGVS').AsFloat > 0 Then
      Begin
         DMFAC.cdsReporte.FieldByname('IMPORTE_UTILIDAD').AsFloat := vPrecioVenta - DMFAC.cdsReporte.FieldByname('COSTOIGVS').AsFloat;
         DMFAC.cdsReporte.FieldByname('PORC_UTILIDAD').AsFloat := FRound((vPrecioVenta * 100 / DMFAC.cdsReporte.FieldByname('COSTOIGVS').AsFloat) - 100, 13, 2)
      End;

      DMFAC.cdsReporte.Next;
   End;
   Screen.Cursor := crDefault;

   bbtnExcel.Enabled := True;
   BtnImprime.Enabled := True;
End;

Procedure TFCompras.FormShow(Sender: TObject);
Begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));

   If dblcCia.Text <> '' Then
   Begin
   // Artículos
      xSQL := 'SELECT A.CIAID, A.TINID, A.GRARID, A.FAMID, A.ARTID, A.ARTDES  '
            + '  FROM TGE205 A '
            + ' WHERE CIAID=' + QuotedStr(dblcCia.Text);
      DMFAC.cdsArticulo.Close;
      DMFAC.cdsArticulo.DataRequest(xSQL);
      DMFAC.cdsArticulo.Open;

   // Líneas
      xSQL := 'select * from TGE131 '
            + ' WHERE CIAID=' + QuotedStr(dblcCia.Text);
      DMFAC.cdsLinea.close;
      DMFAC.cdsLinea.DataRequest(xSQL);
      DMFAC.cdsLinea.open;

   // Familias
      xSQL := 'select * from TGE169 '
            + ' WHERE CIAID=' + QuotedStr(dblcCia.Text);
      DMFAC.cdsFam.close;
      DMFAC.cdsFam.DataRequest(xSQL);
      DMFAC.cdsFam.open;
   End;

   bbtnExcel.Enabled := False;
   BtnImprime.Enabled := False;

   If DMFAC.cdsCia.RecordCount > 1 Then
      dblcCia.SetFocus
   Else
      dblcCiaExit(Self);
End;

Procedure TFCompras.FormCreate(Sender: TObject);
Var
   sSQL: String;
Begin
   dblcCia.LookupTable := DMFAC.cdsCia;
   dblcCia.Enabled := True;
   If DMFAC.cdsCia.RecordCount = 1 Then
   Begin
      dblcCia.Enabled := False;
      dblcCia.Text := DMFAC.cdsCia.FieldByName('CIAID').AsString;
      edtCia.Text := DMFAC.cdsCia.FieldByName('CIADES').AsString;
   End;

   xSQL := 'select MARCA,MARDES from ALM_MAR_ART order by MARDES';
   DMFAC.cdsMarca.close;
   DMFAC.cdsMarca.DataRequest(xSQL);
   DMFAC.cdsMarca.open;
   DMFAC.cdsMarca.IndexFieldNames := 'MARDES';
   dblcdMarca.LookupTable := DMFAC.cdsMarca;
   dblcdMarca.LookupField := 'MARCA';

   dbgData.DataSource := DMFAC.dsReporte;
   dblcTienda.LookupTable := DMFAC.cdsTienda;
   dblcLinea.LookupTable := DMFAC.cdsLinea;
   dblcFam.LookupTable := DMFAC.cdsFam;
   dblcSFamilia.LookupTable := DMFAC.cdsSFam;
   dblcArticulo.LookupTable := DMFAC.cdsArticulo;

   sSQL := ' Select ''   '' GRARID, ''   '' GRARDES, ''   '' FAMID, ''   '' FAMDES, ''   '' SFAMID, ''   '' SFAMDES, '
         + '        ''   '' MARCA, ''   '' MARDES, ''   '' ARTID, ''   '' ARTDES, 0 TCAMBIO, '' '' LPRETMONID, '' '' TMONABR, '
         + '        ''          '' NISAID, ''        '' NISAFREG, 0.00 KDXCNTG, 0.00 COSTOIGVS, '
         + '        ''          '' NISAIDANT, ''     '' NISAFREGANT, 0.00 KDXCNTGANT, 0.00 COSTOIGVSANT, '' '' ALMID, '
         + '        0.00 PREVEN, 0.00 PRECIO_CAL, 0.00 PRECIO_PRO, 0.00 PORC_UTILIDAD, 0.00 IMPORTE_UTILIDAD, 0 STKALM, '
         + '        0 STKTOT '
         + '  from DUAL';
   DMFAC.cdsReporte.close;
   DMFAC.cdsReporte.DataRequest(sSql);
   DMFAC.cdsReporte.Open;
   dbgData.DataSource := DMFAC.dsReporte;
End;

Procedure TFCompras.dblcCiaExit(Sender: TObject);
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
   If dblcCia.Text <> '' Then
   Begin
   // Puntos de Venta (Almacenes)
      xSQL := ' Select CIAID, TINID, ALMID, ALMDES, ALMABR '
            + '   from TGE151 '
            + '  where CIAID=' + QuotedStr(dblcCia.Text)
            + '    and ALMVTA=''S'' '
            + '    and ACTIVO=''S'' ';
      DMFAC.cdsAlmacen.Close;
      DMFAC.cdsAlmacen.DataRequest(xSQL);
      DMFAC.cdsAlmacen.Open;
      DMFAC.cdsAlmacen.IndexFieldNames := 'CIAID;ALMID';

   // Línea de Artículo
      xSQL := 'Select CIAID, TINID, GRARID, GRARDES, GRARABR from TGE131 '
            + ' where CIAID=' + QuotedStr(dblcCia.Text);
      DMFAC.cdsLinea.close;
      DMFAC.cdsLinea.DataRequest(xSQL);
      DMFAC.cdsLinea.open;

   // Familia de Artículo
      xSQL := 'select CIAID, TINID, GRARID, FAMID, FAMDES, FAMABR '
            + '  from TGE169 '
            + ' where CIAID=' + QuotedStr(dblcCia.Text);
      DMFAC.cdsFam.close;
      DMFAC.cdsFam.DataRequest(xSQL);
      DMFAC.cdsFam.open;

   // Sub Familia de Artículos
      xSQL := 'select * from TGE170 '
            + ' where CIAID=' + QuotedStr(dblcCia.Text);
      DMFAC.cdsSFam.close;
      DMFAC.cdsSFam.DataRequest(xSQL);
      DMFAC.cdsSFam.open;
      dblcSFamilia.Selected.Clear;
      dblcSFamilia.Selected.Add('SFAMID'#9'06'#9'Id');
      dblcSFamilia.Selected.Add('SFAMDES'#9'30'#9'SubFamilia');
      dblcSFamilia.Selected.Add('GRARID'#9'03'#9'Linea');
      dblcSFamilia.Selected.Add('FAMID'#9'03'#9'Familia');

   // Maestro de Artículos
      xSQL := 'Select A.CIAID, A.TINID, A.GRARID, A.FAMID, A.ARTID, A.ARTDES  '
            + '  from TGE205 A '
            + ' where CIAID=' + QuotedStr(dblcCia.Text);
      DMFAC.cdsArticulo.Close;
      DMFAC.cdsArticulo.DataRequest(xSQL);
      DMFAC.cdsArticulo.Open;
   End;
End;

Procedure TFCompras.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFCompras.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMFAC.cdsReporte.close;
   DMFAC.cdsReporte.Filter := '';
   DMFAC.cdsReporte.Filtered := False;
   DMFAC.cdsReporte.IndexFieldNames := '';

   DMFAC.cdsQry3.close;
   DMFAC.cdsQry3.IndexFieldNames := '';
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.Filter := '';
End;

Procedure TFCompras.bbtnExcelClick(Sender: TObject);

Var
   sDesde, sHasta, xWhere, sSQL, sSQLC, sAno: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;

   Screen.Cursor := crHourGlass;

   If DMFAC.cdsReporte.RecordCount > 0 Then
   Begin
      Try
         DMFAC.ExportaGridExcel(dbgData, 'Consulta de Stock');
      Except
         On Ex: Exception Do
            Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
      End;
   End;
   Screen.Cursor := crDefault;
End;

Procedure TFCompras.dblcTiendaExit(Sender: TObject);
Begin
   edtTienda.Text := DMFAC.cdsTienda.FieldByName('TIE_DES').AsString;
End;

Procedure TFCompras.dblcTiendaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFCompras.dblcLineaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFCompras.dblcFamNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFCompras.dblcSFamiliaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFCompras.dblcLineaExit(Sender: TObject);

Begin
   If dblcLinea.Text <> '' Then
   Begin
      edtLinea.Text := DMFAC.cdsLinea.FieldByName('GRARDES').AsString;
      PorArticulo();
   End;
End;

Procedure TFCompras.dblcFamExit(Sender: TObject);
Begin
   If dblcFam.Text <> '' Then
   Begin
      edtFamilia.Text := DMFAC.cdsFam.FieldByName('FAMDES').AsString;
      dblcLinea.Text  := DMFAC.cdsFam.FieldByName('GRARID').AsString;
      DMFAC.cdsLinea.Locate('GRARID', VarArrayof([dblcLinea.Text]), []);
      edtLinea.Text := DMFAC.cdsLinea.FieldByName('GRARDES').AsString;

      xSQL := 'select CIAID,TINID,GRARID,FAMID,SFAMID,SFAMDES,SFAMABR '
            + '  from TGE170 '
            + ' where CIAID=' + QuotedStr(dblcCia.Text)
            + '   and GRARID=' + Quotedstr(dblcLinea.Text)
            + '   and FAMID=' + quotedstr(dblcFam.Text);
      DMFAC.cdsSFam.close;
      DMFAC.cdsSFam.DataRequest(xSQL);
      DMFAC.cdsSFam.open;
      dblcSFamilia.LookupTable := DMFAC.cdsSFam;
      dblcSFamilia.LookupField := 'SFAMID';
      PorArticulo();
   End;
End;

Procedure TFCompras.dblcSFamiliaExit(Sender: TObject);
Begin
   If dblcSFamilia.Text <> '' Then
   Begin
      edtSFamilia.Text := DMFAC.cdsSFam.FieldByName('SFAMDES').AsString;

      dblcLinea.Text  := DMFAC.cdsSFam.FieldByName('GRARID').AsString;
      DMFAC.cdsLinea.Locate('GRARID', VarArrayof([dblcLinea.Text]), []);
      edtLinea.Text   := DMFAC.cdsLinea.FieldByName('GRARDES').AsString;
      dblcFam.Text    := DMFAC.cdsSFam.FieldByName('FAMID').AsString;
      DMFAC.cdsFam.Locate('FAMID', VarArrayof([dblcFam.Text]), []);
      edtFamilia.Text := DMFAC.cdsFam.FieldByName('FAMDES').AsString;

      PorArticulo();
   End;
End;

Procedure TFCompras.dblcFamEnter(Sender: TObject);
Begin
   If dblcLinea.Text <> '' Then
   Begin
      DMFAC.cdsFam.Filtered := False;
      DMFAC.cdsFam.Filter := '';
      DMFAC.cdsFam.Filter := 'GRARID=''' + dblcLinea.Text + '''';
      DMFAC.cdsFam.Filtered := True;
   End;
End;

Procedure TFCompras.dblcdMarcaExit(Sender: TObject);
Begin
   If dblcdMarca.Text = '' Then
   Begin
      edtMarca.Text := '';
      PorArticulo();
   End
   Else
   Begin
      If DMFAC.cdsMarca.Locate('MARCA', VarArrayof([dblcdMarca.Text]), []) Then
         edtMarca.Text := DMFAC.cdsMarca.FieldByName('MARDES').AsString
      Else
         edtMarca.Text := '';
      PorArticulo();
   End;
End;

Procedure TFCompras.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFCompras.dblcTiendaEnter(Sender: TObject);
Begin
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Debe indicar la Compañía en primer lugar');
      dblcCia.SetFocus;
      exit;
   End;
End;

Procedure TFCompras.dbgDataCalcCellColors(Sender: TObject; Field: TField;
   State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   If (Field.FieldName = 'NISAID')
      Or (Field.FieldName = 'NISAFREG')
      Or (Field.FieldName = 'KDXCNTG')
      Or (Field.FieldName = 'COSTOIGVS') Then
   Begin
      ABrush.Color := $00CEFFCE;
      If Highlight Then
         ABrush.Color := clBlue;
   End;

   If (Field.FieldName = 'NISAIDANT')
      Or (Field.FieldName = 'NISAFREGANT')
      Or (Field.FieldName = 'KDXCNTGANT')
      Or (Field.FieldName = 'COSTOIGVSANT') Then
   Begin
      ABrush.Color := clAqua;
      If Highlight Then
         ABrush.Color := clBlue;
   End;
End;

Procedure TFCompras.PorArticulo();
Begin
   xsql := 'Select ARTID,ARTDES From Tge205  '
         + ' Where CIAID=''' + dblcCia.Text + ''' '
         + '   and GRARID like ''' + dblcLinea.Text + '%'''
         + '   and FAMID  like ''' + dblcFam.Text + '%'''
         + '   and SFAMID like ''' + dblcSFamilia.Text + '%'''
         + '   and MARCA  like ''' + dblcdMarca.Text + '%''';
   DMFAC.cdsArticulo.Close;
   DMFAC.cdsArticulo.IndexFieldNames := 'ARTDES';
   DMFAC.cdsArticulo.DataRequest(xsql);
   DMFAC.cdsArticulo.Open;
End;

Procedure TFCompras.dblcArticuloExit(Sender: TObject);
Begin
   If DMFAC.cdsArticulo.Locate('ARTID', VarArrayof([dblcArticulo.Text]), []) Then
      edtArticulo.Text := DMFAC.cdsArticulo.FieldByname('ARTDES').asstring
   Else
      edtArticulo.Text := '';
   If Length(Trim(dblcArticulo.Text)) = 0 Then edtArticulo.Text := '';
End;

Procedure TFCompras.dblcArticuloChange(Sender: TObject);
Begin
   If Length(Trim(dblcArticulo.Text)) = 0 Then edtArticulo.Text := '';
End;

Procedure TFCompras.BtnImprimeClick(Sender: TObject);
Begin
   DMFAC.cdsReporte.DisableControls;
   ppDBPCompras.DataSource := DMFAC.dsReporte;
   If cbDiseno.Checked Then
      Diseno.ShowModal
   Else
   Begin
      RepComprasXPVentas.Print;
      RepComprasXPVentas.Stop;
   End;
   DMFAC.cdsReporte.EnableControls;
End;

End.

