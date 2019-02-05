// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : FAC810
// FORMULARIO               : FRepTiendas
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Informe de Ventas
//
// HPC_201305_FAC 10/04/2013: Se modifica para que el vendedor se tome del FAC305 (Tabla de Facturas)
// HPC_201505_FAC 14/09/2015: Se agrega botón para reporte definido en DAF 2015001096
// HPC_201801_FAC 26/03/2018: ajustes por cambio en maestro de Clientes
//

Unit FAC810;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, wwdblook, db, ppBands,
   ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppRelatv,
   ppDB, ppDBPipe, ppComm, ppEndUsr, ppViewr, ppTypes, Mask, wwdbedit,
   Wwdbdlg, ExtCtrls, ppParameter, Grids, DBGrids;

Type
   TFRepTiendas = Class(TForm)
      Label2: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      Rango: TGroupBox;
      Label1: TLabel;
      Label3: TLabel;
      dtpDesde: TwwDBDateTimePicker;
      dtpHasta: TwwDBDateTimePicker;
      gbOpciones: TGroupBox;
      Label34: TLabel;
      bbtnRepVtasDet: TBitBtn;
      dblcTienda: TwwDBLookupCombo;
      edtTienda: TEdit;
      Diseno: TppDesigner;
      Data: TppDBPipeline;
      ppTVenta: TppReport;
      bbtnRepVtasRes: TBitBtn;
      ppdRes: TppDesigner;
      ppdbRes: TppDBPipeline;
      Label4: TLabel;
      dblcdVendedor: TwwDBLookupComboDlg;
      dbeVendedores: TwwDBEdit;
      bbtnRepVendedor: TBitBtn;
      Bevel1: TBevel;
      cbDiseno: TCheckBox;
      ppDB2: TppDBPipeline;
      ppr2: TppReport;
      ppd2: TppDesigner;
      pprRes: TppReport;
      ppParameterList1: TppParameterList;
      ppHeaderBand2: TppHeaderBand;
      ppLabel17: TppLabel;
      ppLabel19: TppLabel;
      ppLabel22: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppSystemVariable6: TppSystemVariable;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppDBText12: TppDBText;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppDBText13: TppDBText;
      ppDetailBand2: TppDetailBand;
      ppDBText15: TppDBText;
      ppDBText18: TppDBText;
      ppDBText21: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand2: TppSummaryBand;
      ppDBCalc8: TppDBCalc;
      ppLabel18: TppLabel;
      ppDBCalc7: TppDBCalc;
      ppLabel20: TppLabel;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppDBText14: TppDBText;
      ppDBText16: TppDBText;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppDBCalc11: TppDBCalc;
      ppLabel21: TppLabel;
      ppDBCalc12: TppDBCalc;
      ppDBText17: TppDBText;
      ppLabel27: TppLabel;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppParameterList3: TppParameterList;
      bbtnExlVtasDet: TBitBtn;
      bbtnExlVtasRes: TBitBtn;
      bbtnExlVendedor: TBitBtn;
      dtgData: TDBGrid;
      btnGrafVtasDet: TBitBtn;
      bbtnGrafVtasRes: TBitBtn;
      bbtnRepUtilidadDet: TBitBtn;
      bbtnExlUtilidadDet: TBitBtn;
      bbtnRepUtilidadRes: TBitBtn;
      bbtnRepDscto: TBitBtn;
      bbtnExlUtilidadRes: TBitBtn;
      bbtnExlDscto: TBitBtn;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppDBText1: TppDBText;
      ppLabel2: TppLabel;
      ppLabel15: TppLabel;
      ppLabel14: TppLabel;
      ppLabel8: TppLabel;
      ppDBText40: TppDBText;
      ppLabel43: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppDetailBand1: TppDetailBand;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText8: TppDBText;
      ppDBText11: TppDBText;
      ppDBText9: TppDBText;
      ppDBText7: TppDBText;
      ppDBText32: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc2: TppDBCalc;
      ppLabel9: TppLabel;
      ppDBCalc4: TppDBCalc;
      ppLabel16: TppLabel;
      ppDBCalc9: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText10: TppDBText;
      ppDBText19: TppDBText;
      ppLabel32: TppLabel;
      ppDBText20: TppDBText;
      ppDBText22: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc5: TppDBCalc;
      ppLabel33: TppLabel;
      ppDBCalc6: TppDBCalc;
      ppLabel62: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBCalc1: TppDBCalc;
      ppLabel63: TppLabel;
      ppDBCalc10: TppDBCalc;
      ppLabel64: TppLabel;
      ppDBCalc23: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      bbtnEstGGPP: TBitBtn;
    bbtnEstGGPPxls: TBitBtn;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    sbDisenoRep: TSpeedButton;
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcTiendaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcTiendaExit(Sender: TObject);
      Procedure bbtnRepVtasDetClick(Sender: TObject);
      Procedure ppTVentaPreviewFormCreate(Sender: TObject);
      Procedure bbtnRepVtasResClick(Sender: TObject);
      Procedure bbtnRepVendedorClick(Sender: TObject);
      Procedure dblcdVendedorChange(Sender: TObject);
      Procedure dblcdVendedorEnter(Sender: TObject);
      Procedure pprResPreviewFormCreate(Sender: TObject);
      Procedure ppr2PreviewFormCreate(Sender: TObject);
      Procedure bbtnExlVtasResClick(Sender: TObject);
      Procedure bbtnExlVtasDetClick(Sender: TObject);
      Procedure bbtnExlVendedorClick(Sender: TObject);
      Procedure btnGrafVtasDetClick(Sender: TObject);
      Procedure bbtnRepUtilidadDetClick(Sender: TObject);
      Procedure bbtnExlUtilidadDetClick(Sender: TObject);
      Procedure bbtnRepUtilidadResClick(Sender: TObject);
      Procedure bbtnRepDsctoClick(Sender: TObject);
      Procedure bbtnExlUtilidadResClick(Sender: TObject);
      Procedure bbtnExlDsctoClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcdVendedorExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   // Inicio HPC_201505_FAC
      Procedure bbtnEstGGPPClick(Sender: TObject);
      Procedure bbtnEstGGPPData;
      Procedure UtilidadDeVenta;
      Procedure ResumenUtilVenta;
      procedure bbtnEstGGPPxlsClick(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
   // Fin HPC_201505_FAC
   Private
    { Private declarations }
      Function isDxsValidos(ITipo: String): boolean;
      Procedure cargarVendedores(ICiaID: String);
   Public
    { Public declarations }
   End;

Var
   FRepTiendas: TFRepTiendas;

Implementation

Uses FacDM, FAC812;

{$R *.dfm}

Procedure TFRepTiendas.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMFAC.cdsQry12.IndexFieldNames := '';
   DMFAC.cdsRepo2.Close;
   DMFAC.cdsRepo3.Close;
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.Filtered := False;
   DMFAC.cdsQry3.Filter := '';
   DMFAC.cdsQry3.IndexFieldNames := '';

// Inicio HPC_201505_FAC
   DMFAC.cdsQry4.Close;
   DMFAC.cdsQry4.Filtered := False;
   DMFAC.cdsQry4.Filter := '';
   DMFAC.cdsQry4.IndexFieldNames := '';

   DMFAC.cdsQry5.Close;
   DMFAC.cdsQry5.Filtered := False;
   DMFAC.cdsQry5.Filter := '';
   DMFAC.cdsQry5.IndexFieldNames := '';
// Fin HPC_201505_FAC

   DMFAC.cdsQry17.Close;
End;

Procedure TFRepTiendas.FormCreate(Sender: TObject);
Var
   xSQL: String;
Begin
   dblcCia.LookupTable := DMFAC.cdsCia;
   dblcTienda.LookupTable := DMFAC.cdsTienda;

   dblcCia.Enabled := True;
   If DMFAC.cdsCia.RecordCount = 1 Then
   Begin
      dblcCia.Enabled := False;
      cargarVendedores(DMFAC.cdsCia.FieldByName('CIAID').AsString);
   End;
   dtpDesde.Date := Date;
   dtpHasta.Date := Date;
   dblcCia.Text := DMFAC.cdsCia.FieldByName('CIAID').AsString;
   edtCia.Text := DMFAC.cdsCia.FieldByName('CIADES').AsString;
End;

Procedure TFRepTiendas.cargarVendedores(ICiaID: String);
Var
   xSQL: String;
Begin
   xSQL := '  SELECT B.VEID, B.VENOMBRES '
      + '    FROM ( SELECT VEID  '
      + '             FROM FAC305 '
      + '            WHERE CIAID=''' + ICiaID + ''' '
      + '            GROUP BY VEID ) A, CXC203 B'
      + '   WHERE A.VEID  = B.VEID '
      + '     AND B.CIAID = ''' + ICiaID + '''  AND NVL(VESTATUS,''N'')=''S'' '
      + '   ORDER BY B.VEID ';
   DMFAC.cdsRepo3.Close;
   DMFAC.cdsRepo3.DataRequest(xSQL);
   DMFAC.cdsRepo3.Open;
   dblcdVendedor.LookupTable := DMFAC.cdsRepo3;
   dblcdVendedor.LookUpField := 'VEID';
End;

Procedure TFRepTiendas.dblcCiaExit(Sender: TObject);
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
   cargarVendedores(dblcCia.Text);

// Inicio HPC_201505_FAC
   if dblcCia.Text='04' then
      bbtnEstGGPP.Visible := True
   else
      bbtnEstGGPP.Visible := False;
// Fin HPC_201505_FAC
End;

Procedure TFRepTiendas.dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;

End;

Procedure TFRepTiendas.dblcTiendaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRepTiendas.dblcTiendaExit(Sender: TObject);
Begin
   edtTienda.Text := DMFAC.BuscaQry('dspUltTGE', 'FAC_TIENDA', 'TIE_DES', 'CIAID=' + QuotedStr(dblcCia.text) + ' AND TIE_ID=' + QuotedStr(dblcTienda.Text), 'TIE_DES');
End;

Procedure TFRepTiendas.bbtnRepVtasDetClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere, sSQL: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;

   Screen.Cursor := crHourGlass;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   Begin
      sSQL := 'Select A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + '       CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + '       CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + '       CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACIGVMN END FACIGVMN, '
         + '       A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
         + '       A.ALMID, D.ALMDES, '
         + '       ''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + '       NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + '  from FAC305 A, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T '
         + ' where A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + '   and A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + '   and A.ALMID like ''' + '' + '%'' '
         + '   and A.FACESTADO in (''ACEPTADO'') '
         + '   and A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + '   and A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + '   and A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + '   and D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + '   and T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '

      + ' Union all '

      + 'Select A.CIAID, CCSERIE, CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 FACTOTMN, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 FACMTOMN, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCIGV,0) ELSE 0 END*-1 FACIGVMN, '
         + '       A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, '
         + '       ''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + '       NVL(T.TIE_ID,S.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + '  from CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T, FAC_FOR_PAG F, FAC305 V '
         + ' where A.CIAID=' + QuotedStr(dblcCia.Text) + ' AND A.DOCID=''27'' '
         + '   and A.CCFCMPRB >= ' + sDesde + '   AND A.CCFCMPRB <= ' + sHasta + ' '
         + '   and A.DOCID = C.DOCID   AND C.DOCMOD = ''CXC'' '
         + '   and A.CIAID=S.CIAID AND A.CCPEDIDO=NISAID(+) AND NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) '
         + '   and TRIID=''15'' AND NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
         + '   and NISSIT=''ACEPTADO'' '
         + '   and S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
         + '   and D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + '   and T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + '   and A.CIAID=F.CIAID(+) AND A.DOCID=F.DOCPAG(+) AND A.CCSERIE=F.SERDOCPAG(+) AND A.CCNODOC=F.NUMDOCPAG(+) '
         + '       and nvl(F.BORRADO,''N'')=''N'' '
         + '   and F.CIAID=V.CIAID AND F.DOCID=V.DOCID AND F.FACSERIE=V.FACSERIE AND F.NFAC=V.NFAC '
         + '   and V.FACFECHA>=' + sDesde + ' AND V.FACFECHA<=' + sHasta + ' '

      + ' order by TIE_ID, FACFECHA, DOCID, FACSERIE, NFAC';
   End;

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   Begin
      Data.DataSource := DMFAC.dsReporte;
      ppTVenta.DataPipeline := Data;
      Diseno.Report := ppTVenta;

      ppTVenta.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\VentaPorTienda.rtm';

      ppTVenta.Template.LoadFromFile;
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

Procedure TFRepTiendas.bbtnRepVtasResClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere, sSQL: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   Begin
      sSQL := 'select CIAID, CIADES, TIE_ID, TIE_DES, FACFECHA, '
         + '       ''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + '       sum( FACTOTMN ) FACTOTMN, sum( FACMTOMN ) FACMTOMN '
         + '  from ( '
         + '        SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + '               CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + '               CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + '               A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
         + '               A.ALMID, D.ALMDES, '
         + '               NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + '          FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T '
         + '         WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + '           AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + '           and A.ALMID like ''' + '' + '%'' '
         + '           and A.FACESTADO in (''ACEPTADO'') '
         + '           AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + '           AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + '           AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + '           AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + '           AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '

      + '        UNION ALL '

      + '        SELECT A.CIAID, CCSERIE, CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
         + '               CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
         + '               CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 FACTOTMN, '
         + '               CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 FACMTOMN, '
         + '               A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, '
         + '               NVL(T.TIE_ID,S.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + '          FROM CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T, FAC_FOR_PAG F, FAC305 V '
         + '         WHERE A.CIAID=' + QuotedStr(dblcCia.Text) + ' AND A.DOCID=''27'' '
         + '           AND A.CCFCMPRB >= ' + sDesde + '   AND A.CCFCMPRB <= ' + sHasta + ' '
         + '           AND A.DOCID = C.DOCID   AND C.DOCMOD = ''CXC'' '
         + '           AND A.CIAID=S.CIAID AND A.CCPEDIDO=NISAID(+) AND NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) '
         + '           AND TRIID=''15'' AND NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
         + '           AND NISSIT=''ACEPTADO'' '
         + '           AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
         + '           AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + '           AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + '           AND A.CIAID=F.CIAID(+) AND A.DOCID=F.DOCPAG(+) AND A.CCSERIE=F.SERDOCPAG(+) AND A.CCNODOC=F.NUMDOCPAG(+) '
         + '           AND nvl(F.BORRADO,''N'')=''N'' '
         + '           AND F.CIAID=V.CIAID AND F.DOCID=V.DOCID AND F.FACSERIE=V.FACSERIE AND F.NFAC=V.NFAC '
         + '           AND V.FACFECHA>=' + sDesde + ' AND V.FACFECHA<=' + sHasta + ' '
         + ' ) VISTA '
         + ' GROUP BY CIAID, CIADES, TIE_ID, TIE_DES, FACFECHA '
         + ' ORDER BY CIAID, TIE_ID, FACFECHA';
   End;

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   Begin
      ppdbRes.DataSource := DMFAC.dsReporte;
      pprRes.DataPipeline := ppdbRes;
      ppdRes.Report := pprRes;
      pprRes.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\VentaResumen.rtm';
      pprRes.Template.LoadFromFile;
      Screen.Cursor := crDefault;

      If cbDiseno.Checked Then
         ppdRes.ShowModal
      Else
         pprRes.Print;

      pprRes.Stop;
      pprRes.DataPipeline := Nil;
   End;

   ppdbRes.DataSource := Nil;
   ppdRes.Report := Nil;

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

Procedure TFRepTiendas.bbtnRepVendedorClick(Sender: TObject);
Var
   x10: integer;
   xSQL: String;
   sDesde, sHasta: String;
Begin
// En las Ventas por Vendedor, si se consideran todas las Notas de Crédito
// de acuerdo a la Fecha de Emisión.

   If Not isDxsValidos('VENDEDORES') Then exit;

   Screen.Cursor := crHourGlass;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   xSQL := 'SELECT A.CIAID, A.DOCID, C.DOCDES, C.DOCABR, A.FACSERIE, A.NFAC, A.FACFECHA, A.FACESTADO, '
      + '       CASE WHEN A.FACESTADO = ''ACEPTADO'' THEN A.FACTOTMN   ELSE  0 END FACTOTMN, '
      + '       CASE WHEN A.FACESTADO = ''ACEPTADO'' THEN A.FACMTOMN   ELSE  0 END FACMTOMN, '
      + '       CASE WHEN A.FACESTADO = ''ACEPTADO'' THEN A.FACIGVMN   ELSE  0 END FACIGVMN, '
      + '       ''BAZAR Y REPRESENTACIONES'' CIADES, A.ALMID, D.ALMDES, ';

// Rango de fechas
   If dtpDesde.Text = dtpHasta.Text Then
      xSQL := xSQL
         + '''FECHA ' + dtpDesde.Text + ''' RANGOF, '
   Else
      xSQL := xSQL
         + '''DESDE ' + dtpDesde.Text + ' HASTA ' + dtpHasta.Text + ''' RANGOF, ';

   If dblcdVendedor.Text <> '' Then
      xSQL := xSQL
         + '''VENTAS POR VENDEDOR'' TITULO_REP, '
   Else
      If dblcTienda.Text <> '' Then
         xSQL := xSQL
            + '''VENTAS POR VENDEDOR - CONSOLIDADO POR TIENDA'' TITULO_REP, '
      Else
         xSQL := xSQL
            + '''VENTAS POR VENDEDOR - CONSOLIDADO GENERAL'' TITULO_REP, ';

   xSQL := xSQL
{ ???
        //+'  CASE WHEN A.VEID<>H.VEID THEN A.VEID ELSE H.VEID END VEID, '
   + '  A.VEID, '
}
//INICIO HPC_201305_FAC
//       + '  CASE WHEN A.VEID<>H.VEID THEN H.VEID ELSE A.VEID END VEID, '
   + ' A.VEID, '
//FINAL HPC_201305_FAC
   + '  G.VENOMBRES, H.PROFUSER, '
      + '  NVL(T.TIE_ID,A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
      + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, APO110 F, '
      + '      FAC311 H, CXC203 G, FAC_TIENDA T '
      + 'WHERE A.CIAID = ' + QuotedStr(dblcCia.text) + ' '
      + '  AND A.FACFECHA>=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpdesde.date) + ''',''DD/MM/YYYY'') '
      + '  AND A.FACFECHA<=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtphasta.date) + ''',''DD/MM/YYYY'') ';

   If dblcdVendedor.Text <> '' Then
      xSQL := xSQL
//INICIO HPC_201305_FAC
//      + '  AND (CASE WHEN A.VEID<>H.VEID THEN H.VEID ELSE A.VEID END)='+quotedstr(dblcdVendedor.Text);
      + '  AND A.VEID =' + quotedstr(dblcdVendedor.Text);
//FINAL HPC_201305_FAC

// Inicio HPC_201801_FAC
// 05/04/2018 ajustes por cambio en maestro de Clientes
   xSQL := xSQL
      + '  AND A.ALMID LIKE ''%'' '
      + '  AND A.FACESTADO IN (''ACEPTADO'',''ANULADO'') '
      + '  AND A.TINID NOT IN (''00'') '
      + '  AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
      + '  AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
      + '  AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
      + '  AND F.OFDESID(+) = (CASE WHEN A.OFDESID IS NULL THEN ''01'' ELSE A.OFDESID END) '
      + '  AND A.CIAID=H.CIAID(+) AND A.PROFID=H.PROFID(+) '
// Fin HPC_201801_FAC
{ ???
        //+'  AND (CASE WHEN A.VEID<>H.VEID THEN A.VEID ELSE H.VEID END) = G.VEID '
   + '  AND A.CIAID=G.CIAID(+) AND A.VEID = G.VEID(+) '
}
//INICIO HPC_201305_FAC
//       + '  AND (CASE WHEN A.VEID<>H.VEID THEN H.VEID ELSE A.VEID END) = G.VEID '
   + '  AND (A.CIAID=G.CIAID(+) AND A.VEID=G.VEID(+)) '
//FINAL HPC_201305_FAC

   + '  and D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
      + '  and T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
//         + '  and A.VEID=G.VEID(+) '

   + 'UNION ALL '

   + 'SELECT A.CIAID, A.DOCID, C.DOCDES, C.DOCABR, CCSERIE,  CCNODOC,  CCFCMPRB FACFECHA, '
      + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
      + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 FACTOTMN, '
      + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 FACMTOMN, '
      + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCIGV,0) ELSE 0 END*-1 FACIGVMN, '      
      + '       ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, ';

// Rango de fechas
   If dtpDesde.Text = dtpHasta.Text Then
      xSQL := xSQL + '''FECHA ' + dtpDesde.Text + ''' RANGOF, '
   Else
      xSQL := xSQL + '''DESDE ' + dtpDesde.Text + ' HASTA ' + dtpHasta.Text + ''' RANGOF, ';

   If dblcdVendedor.Text <> '' Then
      xSQL := xSQL + '''VENTAS POR VENDEDOR'' TITULO_REP, '
   Else
      If dblcTienda.Text <> '' Then
         xSQL := xSQL + '''VENTAS POR VENDEDOR - CONSOLIDADO POR TIENDA'' TITULO_REP, '
      Else
         xSQL := xSQL + '''VENTAS POR VENDEDOR - CONSOLIDADO GENERAL'' TITULO_REP, ';

   xSQL := xSQL
      + '       A.VEID, G.VENOMBRES, '''' PROFUSER, '
      + '       nvl(T.TIE_ID,S.ALMID) TIE_ID, nvl(T.TIE_DES,D.ALMDES) TIE_DES '
      + '  from CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T, CXC203 G '
      + ' where A.CIAID=' + QuotedStr(dblcCia.Text)
      + '   and A.DOCID=''27'' '
      + '   and A.CCFCMPRB >= ' + sDesde + ' and A.CCFCMPRB <= ' + sHasta + ' ';
   If dblcdVendedor.Text <> '' Then
      xSQL := xSQL
         + '   and A.VEID LIKE ''' + dblcdVendedor.Text + '%'' ';
   xSQL := xSQL
      + '   and A.DOCID = C.DOCID and C.DOCMOD = ''CXC'' '
      + '   and A.CIAID=S.CIAID and A.CCPEDIDO=NISAID(+) and NISATIP=''INGRESO'' and A.CLIEID=S.CLIEID(+) '
      + '   and TRIID=''15'' and NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
      + '   and NISSIT=''ACEPTADO'' '
      + '   and S.CIAID = D.CIAID(+) and S.LOCID = D.LOCID(+) and S.TINID = D.TINID(+) and S.ALMID = D.ALMID(+) '
      + '   and D.CIAID=T.CIAID(+) and D.TIE_ID=T.TIE_ID(+) '
      + '   and T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
//INICIO HPC_201305_FAC
//       + '   and A.VEID=G.VEID(+) '
   + '   and (A.CIAID=G.CIAID(+) AND A.VEID=G.VEID(+)) '
//FINAL HPC_201305_FAC
   + ' order BY TIE_ID, VEID, FACFECHA, DOCID, FACSERIE, NFAC ';
   DMFAC.cdsQry17.Close;
   DMFAC.cdsQry17.IndexFieldNames := '';
   DMFAC.cdsQry17.Filter := '';
   DMFAC.cdsQry17.Filtered := False;
   DMFAC.cdsQry17.DataRequest(xSQL);
   DMFAC.cdsQry17.Open;

   If DMFAC.cdsQry17.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      showmessage('No existen Registros a mostrar');
      exit;
   End;

   ppdb2.DataSource := DMFAC.dsQry17;
   ppR2.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\VentaVendedoresCom.rtm';
   ppR2.template.LoadFromFile;

   Screen.Cursor := crDefault;

   If cbDiseno.Checked Then
      ppd2.showmodal
   Else
      ppR2.Print;

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

Function TFRepTiendas.isDxsValidos(ITipo: String): boolean;
Label
   GSalir;
Begin
   If dblcCia.text = '' Then
   Begin
      dblcCia.enabled := True;
      dblcCia.SetFocus;
      showmessage('Ingrese Compañía');
      Goto GSalir;
   End;

   If dtpDesde.date = 0 Then
   Begin
      dtpDesde.SetFocus;
      showmessage('Ingrese Fecha de Inicio');
      Goto GSalir;
   End;

   If dtpHasta.date = 0 Then
   Begin
      dtpHasta.SetFocus;
      showmessage('Ingrese Fecha Final');
      Goto GSalir;
   End;

   If dtpHasta.date < dtpDesde.date Then
   Begin
      dtpHasta.SetFocus;
      showmessage('La Fecha Final no puede ser menor que la Fecha de Inicio');
      Goto GSalir;
   End;
   (*  se comenta esto para q  muestre todo
   if ITipo = 'VENDEDORES' then
     begin
        if dblcdVendedor.text='' then
          begin
            dblcdVendedor.SetFocus;
            showmessage('Ingrese Código del Vendedor');
            goto GSalir;
          end;
     end
   else
     begin
        if dblcdServicio.text='' then
          begin
            dblcdServicio.SetFocus;
            showmessage('Ingrese Código del Usuario');
            goto GSalir;
          end;
     end;
     *)
   result := true;
   exit;
   GSalir:
   result := false;
   exit;
End;

Procedure TFRepTiendas.dblcdVendedorChange(Sender: TObject);
Begin
   dbeVendedores.Text := DMFAC.cdsRepo3.FieldByName('VENOMBRES').AsString
End;

Procedure TFRepTiendas.dblcdVendedorEnter(Sender: TObject);
Begin
   If dblcCia.Text = '' Then
   Begin
      ShowMessage('Debe Elegir la Compañía');
      dblcCia.SetFocus;
      Exit;
   End;
End;

Procedure TFRepTiendas.ppTVentaPreviewFormCreate(Sender: TObject);
Begin
   ppTVenta.PreviewForm.ClientHeight := 590;
   ppTVenta.PreviewForm.ClientWidth := 790;
   TppViewer(ppTVenta.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFRepTiendas.pprResPreviewFormCreate(Sender: TObject);
Begin
   pprRes.PreviewForm.ClientHeight := 590;
   pprRes.PreviewForm.ClientWidth := 790;
   TppViewer(pprRes.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFRepTiendas.ppr2PreviewFormCreate(Sender: TObject);
Begin
   ppr2.PreviewForm.ClientHeight := 590;
   ppr2.PreviewForm.ClientWidth := 790;
   TppViewer(ppr2.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
End;

Procedure TFRepTiendas.bbtnExlVtasResClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere, sSQL: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   Begin
      sSQL := 'select CIAID, CIADES, TIE_ID, TIE_DES, FACFECHA, '
         + '''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + 'sum( FACTOTMN ) FACTOTMN, sum( FACMTOMN ) FACMTOMN '
         + 'from ( '
         + 'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + 'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
         + 'A.ALMID, D.ALMDES, '
         + 'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'and A.ALMID like ''' + '' + '%'' '
         + 'and A.FACESTADO in (''ACEPTADO'') '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + 'AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + 'AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '

      + 'UNION ALL '

      + 'SELECT A.CIAID, CCSERIE, CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 FACTOTMN, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 FACMTOMN, '
         + '       A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, '
         + ' NVL(T.TIE_ID,S.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + 'FROM CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T, FAC_FOR_PAG F, FAC305 V '
         + 'WHERE A.CIAID=' + QuotedStr(dblcCia.Text) + ' AND A.DOCID=''27'' '
         + '   AND A.CCFCMPRB >= ' + sDesde + '   AND A.CCFCMPRB <= ' + sHasta + ' '
         + '   AND A.DOCID = C.DOCID   AND C.DOCMOD = ''CXC'' '
         + '   AND A.CIAID=S.CIAID AND A.CCPEDIDO=NISAID(+) AND NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) '
         + '   AND TRIID=''15'' AND NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
         + '   AND NISSIT=''ACEPTADO'' '
         + '   AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
         + '   AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + '   AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + '   AND A.CIAID=F.CIAID(+) AND A.DOCID=F.DOCPAG(+) AND A.CCSERIE=F.SERDOCPAG(+) AND A.CCNODOC=F.NUMDOCPAG(+) '
         + '   AND F.CIAID=V.CIAID AND F.DOCID=V.DOCID AND F.FACSERIE=V.FACSERIE AND F.NFAC=V.NFAC '
         + '   AND V.FACFECHA>=' + sDesde + ' AND V.FACFECHA<=' + sHasta + ' '
         + ' ) VISTA '
         + 'GROUP BY CIAID, CIADES, TIE_ID, TIE_DES, FACFECHA '
         + 'ORDER BY CIAID, TIE_ID, FACFECHA';
   End;

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   dtgData.DataSource := DMFAC.dsReporte;

   Try
      DMFAC.HojaExcel('DETALLE VENTAS', DMFAC.dsReporte, dtgData);
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
End;

Procedure TFRepTiendas.bbtnExlVtasDetClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere, sSQL: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;

   Screen.Cursor := crHourGlass;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   Begin
      sSQL := 'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + 'A.CLIEDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
         + 'A.ALMID, D.ALMDES, '
         + '''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + 'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'and A.ALMID like ''' + '' + '%'' '
         + 'and A.FACESTADO in (''ACEPTADO'') '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + 'AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + 'AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '

      + 'UNION ALL '

      + 'SELECT A.CIAID, CCSERIE, CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 FACTOTMN, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 FACMTOMN, '
         + '       A.CLIEDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, '
         + '''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + ' NVL(T.TIE_ID,S.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + 'FROM CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T, FAC_FOR_PAG F, FAC305 V '
         + 'WHERE A.CIAID=' + QuotedStr(dblcCia.Text) + ' AND A.DOCID=''27'' '
         + '   AND A.CCFCMPRB >= ' + sDesde + '   AND A.CCFCMPRB <= ' + sHasta + ' '
         + '   AND A.DOCID = C.DOCID   AND C.DOCMOD = ''CXC'' '
         + '   AND A.CIAID=S.CIAID AND A.CCPEDIDO=NISAID(+) AND NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) '
         + '   AND TRIID=''15'' AND NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
         + '   AND NISSIT=''ACEPTADO'' '
         + '   AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
         + '   AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + '   AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + '   AND A.CIAID=F.CIAID(+) AND A.DOCID=F.DOCPAG(+) AND A.CCSERIE=F.SERDOCPAG(+) AND A.CCNODOC=F.NUMDOCPAG(+) '
         + '   AND F.CIAID=V.CIAID AND F.DOCID=V.DOCID AND F.FACSERIE=V.FACSERIE AND F.NFAC=V.NFAC '
         + '   AND V.FACFECHA>=' + sDesde + ' AND V.FACFECHA<=' + sHasta + ' '
         + 'ORDER BY TIE_ID, FACFECHA, DOCID, FACSERIE, NFAC';
   End;

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   dtgData.DataSource := DMFAC.dsReporte;

   Try
      DMFAC.HojaExcel('DETALLE VENTAS', DMFAC.dsReporte, dtgData);
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;

End;

Procedure TFRepTiendas.bbtnExlVendedorClick(Sender: TObject);
Var
   x10: integer;
   xSQL: String;
   sDesde, sHasta: String;
Begin
// En las Ventas por Vendedor, si se consideran todas las Notas de Crédito
// de acuerdo a la Fecha de Emisión.

   If Not isDxsValidos('VENDEDORES') Then exit;

   Screen.Cursor := crHourGlass;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   xSQL := 'SELECT A.CIAID, A.DOCID, C.DOCDES, C.DOCABR, A.FACSERIE, A.NFAC, A.FACFECHA, A.FACESTADO, '
      + '  CASE WHEN A.FACESTADO = ''ACEPTADO'' THEN A.FACTOTMN   ELSE  0 END FACTOTMN, '
      + '  CASE WHEN A.FACESTADO = ''ACEPTADO'' THEN A.FACMTOMN   ELSE  0 END FACMTOMN, '
      + '  ''BAZAR Y REPRESENTACIONES'' CIADES, A.ALMID, D.ALMDES, '
      + '  ''DESDE ' + dtpdesde.Text + ' HASTA ' + dtphasta.Text + ''' RANGOF, '
//INICIO HPC_201305_FAC
//       + '  CASE WHEN A.VEID<>H.VEID THEN H.VEID ELSE A.VEID END VEID, '
   + '  A.VEID, '
//FINAL HPC_201305_FAC
   + '  G.VENOMBRES, H.PROFUSER, '
      + '  NVL(T.TIE_ID,A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
      + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, APO110 F, '
      + '      FAC311 H, CXC203 G, FAC_TIENDA T '
      + 'WHERE A.CIAID = ' + QuotedStr(dblcCia.text) + ' '
      + '  AND A.FACFECHA>=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtpdesde.date) + ''',''DD/MM/YYYY'') '
      + '  AND A.FACFECHA<=' + DMFAC.wRepFuncDate + '''' + FORMATDATETIME(DMFAC.wFormatFecha, dtphasta.date) + ''',''DD/MM/YYYY'') '
      + '  AND A.VEID LIKE ''' + dblcdVendedor.Text + '%'' '
      + '  AND A.ALMID LIKE ''%'' '
      + '  AND A.FACESTADO IN (''ACEPTADO'',''ANULADO'') '
      + '  AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
      + '  AND A.DOCID = C.DOCID AND C.DOCMOD = ''CXC'' '
      + '  AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
      + '  AND F.OFDESID(+) = (CASE WHEN A.OFDESID IS NULL THEN ''01'' ELSE A.OFDESID END) '
      + '  AND A.CIAID=H.CIAID(+) AND A.PROFID=H.PROFID(+) '
//INICIO HPC_201305_FAC
//       + '  AND (CASE WHEN A.VEID<>H.VEID THEN H.VEID ELSE A.VEID END) = G.VEID '
   + '  AND (A.CIAID=G.CIAID(+) AND A.VEID=G.VEID(+)) '
//FINAL HPC_201305_FAC
   + '  and D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
      + '  and T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
//         + '  and A.VEID=G.VEID(+) '

   + 'UNION ALL '

   + 'SELECT A.CIAID, A.DOCID, C.DOCDES, C.DOCABR, CCSERIE,  CCNODOC,  CCFCMPRB FACFECHA, '
      + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
      + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 FACTOTMN, '
      + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 FACMTOMN, '
      + '       ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, '
      + '''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
      + '  A.VEID, G.VENOMBRES, '''' PROFUSER, '
      + '  NVL(T.TIE_ID,S.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
      + 'FROM CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T, CXC203 G '
      + 'WHERE A.CIAID=' + QuotedStr(dblcCia.Text) + ' AND A.DOCID=''27'' '
      + '   AND A.CCFCMPRB >= ' + sDesde + '   AND A.CCFCMPRB <= ' + sHasta + ' '
      + '   AND A.DOCID = C.DOCID   AND C.DOCMOD = ''CXC'' '
      + '   AND A.CIAID=S.CIAID AND A.CCPEDIDO=NISAID(+) AND NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) '
      + '   AND TRIID=''15'' AND NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
      + '   AND NISSIT=''ACEPTADO'' '
      + '   AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
      + '   AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
      + '   AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
//INICIO HPC_201305_FAC
//       + '   AND A.VEID=G.VEID(+) '
   + '   AND (A.CIAID=G.CIAID(+) AND A.VEID=G.VEID(+)) '
//FINAL HPC_201305_FAC

   + 'ORDER BY TIE_ID, VEID, FACFECHA, DOCID, FACSERIE, NFAC ';

   DMFAC.cdsQry17.Close;
   DMFAC.cdsQry17.IndexFieldNames := '';
   DMFAC.cdsQry17.Filter := '';
   DMFAC.cdsQry17.Filtered := False;
   DMFAC.cdsQry17.DataRequest(xSQL);
   DMFAC.cdsQry17.Open;

   If DMFAC.cdsQry17.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      showmessage('No existen Registros a mostrar');
      exit;
   End;

   dtgData.DataSource := DMFAC.dsQry17;

   Try
      DMFAC.HojaExcel('DETALLE VENTAS', DMFAC.dsQry17, dtgData);
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
End;

Procedure TFRepTiendas.btnGrafVtasDetClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere, sSQL: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;
   Screen.Cursor := crHourGlass;
   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   Begin
      sSQL := 'select CIAID, CIADES, TIE_ID, TIE_DES, FACFECHA, '
         + '''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + 'sum( FACTOTMN ) FACTOTMN, sum( FACMTOMN ) FACMTOMN '
         + 'from ( '
         + 'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + 'A.CLIEDES, B.DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, '
         + 'A.ALMID, D.ALMDES, '
         + 'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'and A.ALMID like ''' + '' + '%'' '
         + 'and A.FACESTADO in (''ACEPTADO'') '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + 'AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + 'AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '

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
         + '   AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + '   AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + ' ) VISTA '
         + 'GROUP BY CIAID, CIADES, TIE_ID, TIE_DES, FACFECHA '
         + 'ORDER BY CIAID, TIE_ID, FACFECHA';
   End;

//   FGrafico_V1.cdsGraf.Close;
//   FGrafico_V1.cdsGraf.DataRequest(sSQL);
//   FGrafico_V1.cdsGraf.Open;
   Try
      FGrafico_V1 := TFGrafico_V1.Create(Application);
      FGrafico_V1.ShowModal;
   Finally
      FGrafico_V1.Free;
   End;

End;

Procedure TFRepTiendas.bbtnRepUtilidadDetClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere, sSQL, sSQLC: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;

// Inicio HPC_201505_FAC
   UtilidadDeVenta;
{
   Screen.Cursor := crHourGlass;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   Begin

      sSQL := 'SELECT * FROM (  '
         + ' SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + 'A.CLIEDES, B.DCCOMDES, C.DOCDES, C.DOCABR, ''' + edtCia.Text + ''' CIADES, '
         + 'A.ALMID, D.ALMDES, E.DFACITEM, '
         + ''' DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + 'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES, '
         + 'E.ARTID, E.ARTDES, E.DFACCANTG, E.DFACVTOTMN, E.DFACMTOMN, '
         + '0.000 COSTO_SIN_IGV, 0.000 COSTO_INC_IGV, 0.000 UTIL_SIN_IGV, 0.000 UTIL_INC_IGV '
         + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, FAC306 E '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'and A.ALMID like ''' + '' + '%'' '
         + 'and A.FACESTADO in (''ACEPTADO'') '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + 'AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + 'AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + 'AND A.CIAID=E.CIAID(+) AND A.DOCID=E.DOCID(+) AND A.FACSERIE=E.FACSERIE(+) AND A.NFAC=E.NFAC(+) ) Y '
         + ' WHERE '
         + ' NOT EXISTS (SELECT * '
         + '             FROM (SELECT A.CIAID,A.CCFCMPRB,A.CCSERIE NCSER,C.CCNODOC NCDOC,A.CCGRAVAD NCGRAV,'
         + '                          B.CCSERIE FACSER,B.CCNODOC FACDOC, B.TCANJEID,B.CCCANJE,B.CCFCANJE, C.CCPEDIDO,'
         + '                          E.LOCID,E.TINID,E.ALMID,E.TDAID,E.NISAID,E.ARTID '
         + '                    FROM   CXC301 A,CXC304 B ,CXC301 C,LOG314 D,LOG315 E '
         + '                    WHERE  A.CIAID = ' + QuotedStr(dblcCia.Text) + '  AND  (A.CCFCMPRB >= ' + sDesde + ' AND  A.CCFCMPRB <= ' + sHasta + ') AND A.DOCID IN (''24'',''25'') '
         + '                           AND B.CIAID = A.CIAID AND B.DOCID    = A.DOCID    AND B.CCSERIE = A.CCSERIE AND B.CCNODOC  = A.CCNODOC '
         + '                           AND C.CIAID = B.CIAID AND C.TCANJEID = B.TCANJEID AND C.CCCANJE = B.CCCANJE AND C.CCFCANJE = B.CCFCANJE AND NVL(C.CCESTADO,''X'')=''P'' '
         + '                           AND D.CIAID = B.CIAID AND D.NISAID   = C.CCPEDIDO AND D.NISATIP = ''INGRESO'' AND D.CLIEID  = C.CLIEID '
         + '                           AND E.CIAID = D.CIAID AND E.TRIID    = D.TRIID    AND E.NISATIP = D.NISATIP AND E.NISAID   = D.NISAID AND E.ALMID=D.ALMID ) X '
         + '              WHERE Y.CIAID = X.CIAID AND Y.FACFECHA=X.CCFCMPRB AND Y.FACSERIE=X.FACSER AND Y.NFAC=X.FACDOC AND Y.ARTID=X.ARTID )'
         + ' ORDER BY TIE_ID, FACFECHA, DOCID, FACSERIE, NFAC, DFACITEM ';
   End;

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   sSQLC := 'Select A.ARTID, B.NISAFREG, A.NISAID, KDXCNTG, A.ARTPCG COSTO_SIN_IGV, ROUND(A.ARTPCG * (1 + 0.18), 2) COSTO_INC_IGV '
      + 'From LOG315 A, LOG314 B '
      + 'Where A.CIAID=' + QuotedStr(dblcCia.Text) + '  AND A.TINID=''20'' AND A.NISATIP=''INGRESO'' '
      + 'and A.TRIID IN (''01'', ''02'', ''09'', ''11'', ''16'') '
      + 'and A.NISAFREG >= ''01/01/2005'' '
      + 'and A.CIAID=B.CIAID(+) and A.TINID=B.TINID(+) and A.TDAID=B.TDAID(+) and A.ALMID=B.ALMID(+) '
      + 'and A.NISATIP=B.NISATIP(+) and A.NISAID=B.NISAID(+) and B.NISSIT(+)=''ACEPTADO'' '
      + 'ORDER BY B.NISAFREG DESC';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(sSQLC);
   DMFAC.cdsQry3.Open;

   DMFAC.cdsQry3.IndexFieldNames := 'ARTID; NISAFREG';

   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      DMFAC.cdsQry3.Filtered := False;
      DMFAC.cdsQry3.Filter := '';
      DMFAC.cdsQry3.Filter := 'ARTID=''' + DMFAC.cdsReporte.FieldByName('ARTID').AsString + '''';
      DMFAC.cdsQry3.Filtered := True;
      DMFAC.cdsQry3.Last;

      DMFAC.cdsReporte.Edit;
      DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := 0;
      DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := 0;

      If DMFAC.cdsReporte.FieldByname('DOCID').AsString = '27' Then
      Begin
         DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACMTOMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACVTOTMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat;
      End
      Else
      Begin
         DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACCANTG').AsFloat * DMFAC.cdsQry3.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACCANTG').AsFloat * DMFAC.cdsQry3.FieldByname('COSTO_INC_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACMTOMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACVTOTMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat;
      End;

      DMFAC.cdsReporte.Post;
      DMFAC.cdsReporte.Next;
   End;
   Screen.Cursor := crDefault;
}

//   Begin
   Data.DataSource := DMFAC.dsReporte;
   ppTVenta.DataPipeline := Data;
   Diseno.Report := ppTVenta;

   ppTVenta.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\VentaPorTienda_Uti.rtm';

   ppTVenta.Template.LoadFromFile;
   Screen.Cursor := crDefault;

   If cbDiseno.Checked Then
      Diseno.ShowModal
   Else
   Begin
      ppTVenta.Print;

      ppTVenta.Stop;
      ppTVenta.DataPipeline := Nil;
//   End;

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
// Fin HPC_201505_FAC
End;

Procedure TFRepTiendas.bbtnExlUtilidadDetClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere, sSQL, sSQLC: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;

// Inicio HPC_201505_FAC
   UtilidadDeVenta;
{
   Screen.Cursor := crHourGlass;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   Begin
      sSQL := 'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + 'A.CLIEDES, B.DCCOMDES, C.DOCDES, C.DOCABR, ''' + edtCia.Text + ''' CIADES, '
         + 'A.ALMID, D.ALMDES, '
         + '''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + 'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES, '
         + 'E.ARTID, E.ARTDES, E.DFACCANTG, E.DFACVTOTMN, E.DFACMTOMN, '
         + '0.000 COSTO_SIN_IGV, 0.000 COSTO_INC_IGV, 0.000 UTIL_SIN_IGV, 0.000 UTIL_INC_IGV, '
         + 'L.GRARDES, FF.FAMDES, SS.SFAMDES, L.GRARID, FF.FAMID, SS.SFAMID '
         + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, FAC306 E, TGE131 L, TGE169 FF, TGE170 SS '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'and A.ALMID like ''' + '' + '%'' '
         + 'and A.FACESTADO in (''ACEPTADO'') '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + 'AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + 'AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + 'AND A.CIAID=E.CIAID(+) AND A.DOCID=E.DOCID(+) AND A.FACSERIE=E.FACSERIE(+) AND A.NFAC=E.NFAC(+) '
         + 'AND E.CIAID=L.CIAID(+) AND E.TINID=L.TINID(+) AND E.GRARID=L.GRARID(+) '
         + 'AND E.CIAID=FF.CIAID(+) AND E.TINID=FF.TINID(+) AND E.GRARID=FF.GRARID(+) AND E.FAMID=FF.FAMID(+) '
         + 'AND E.CIAID=SS.CIAID(+) AND E.TINID=SS.TINID(+) AND E.GRARID=SS.GRARID(+) AND E.FAMID=SS.FAMID(+) AND E.SFAMID=SS.SFAMID(+) '

      + 'UNION ALL '

      + 'SELECT A.CIAID, CCSERIE, CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
         + 'CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
         + 'max( CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 ) FACTOTMN, '
         + 'max( CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 ) FACMTOMN, '
         + 'A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, C.DOCABR, ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, '
         + '''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + 'NVL(T.TIE_ID,S.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES, '
         + '''00000000'' ARTID, ''N/C'' ARTDES, 1 KDXCNTG, '
         + 'max(CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 ) DFACVTOTMN, '
         + 'max(CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 ) DFACVMONMN, '
         + 'ROUND(SUM(E.ARTTOTALG) * -1, 2) COSTO_SIN_IGV, ROUND(SUM(E.ARTTOTALG) * 1.18, 2) * -1 COSTO_INC_IGV, '
         + '0.000 UTIL_SIN_IGV, 0.000 UTIL_INC_IGV, '
         + 'L.GRARDES, FF.FAMDES, SS.SFAMDES, L.GRARID, FF.FAMID, SS.SFAMID '
         + 'FROM CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T, FAC_FOR_PAG F, FAC305 V, LOG315 E, TGE131 L, TGE169 FF, TGE170 SS '
         + 'WHERE A.CIAID=' + QuotedStr(dblcCia.Text) + ' AND A.DOCID=''27'' '
         + ' AND A.CCFCMPRB >= ' + sDesde + '   AND A.CCFCMPRB <= ' + sHasta + ' '
         + ' AND A.DOCID = C.DOCID   AND C.DOCMOD = ''CXC'' '
         + ' AND A.CIAID=S.CIAID AND A.CCPEDIDO=S.NISAID(+) AND S.NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) '
         + ' AND S.TRIID=''15'' AND S.NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
         + ' AND S.NISSIT=''ACEPTADO'' '
         + ' AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
         + ' AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + ' AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + ' AND A.CIAID=F.CIAID(+) AND A.DOCID=F.DOCPAG(+) AND A.CCSERIE=F.SERDOCPAG(+) AND A.CCNODOC=F.NUMDOCPAG(+) '
         + ' AND F.CIAID=V.CIAID AND F.DOCID=V.DOCID AND F.FACSERIE=V.FACSERIE AND F.NFAC=V.NFAC '
         + ' AND V.FACFECHA>=' + sDesde + ' AND V.FACFECHA<=' + sHasta + ' '
         + ' AND S.CIAID = E.CIAID(+) AND S.TRIID=E.TRIID AND S.NISATIP = E.NISATIP(+) AND S.NISAID = E.NISAID(+) AND S.ALMID=E.ALMID(+) '
         + ' AND E.CIAID=L.CIAID(+) AND E.TINID=L.TINID(+) AND E.GRARID=L.GRARID(+) '
         + ' AND E.CIAID=FF.CIAID(+) AND E.TINID=FF.TINID(+) AND E.GRARID=FF.GRARID(+) AND E.FAMID=FF.FAMID(+) '
         + ' AND E.CIAID=SS.CIAID(+) AND E.TINID=SS.TINID(+) AND E.GRARID=SS.GRARID(+) AND E.FAMID=SS.FAMID(+) AND E.SFAMID=SS.SFAMID(+) '
         + 'GROUP BY A.CIAID, CCSERIE, CCNODOC, CCFCMPRB, A.DOCID, CCESTADO, A.CLIEDES, C.DOCDES, C.DOCABR, '
         + 'S.ALMID, D.ALMDES, T.TIE_ID, NVL(T.TIE_DES, D.ALMDES), L.GRARDES, FF.FAMDES, SS.SFAMDES, L.GRARID, FF.FAMID, SS.SFAMID '

      + 'ORDER BY TIE_ID, FACFECHA, DOCID, FACSERIE, NFAC';
   End;

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   sSQLC := 'Select A.ARTID, B.NISAFREG, A.NISAID, KDXCNTG, A.ARTPCG COSTO_SIN_IGV, ROUND(A.ARTPCG * (1 + 0.18), 2) COSTO_INC_IGV '
      + 'From LOG315 A, LOG314 B '
      + 'Where A.CIAID=' + QuotedStr(dblcCia.Text) + '  AND A.TINID=''20'' AND A.NISATIP=''INGRESO'' '
      + 'and A.TRIID IN (''01'', ''02'', ''09'', ''11'', ''16'') '
      + 'and A.NISAFREG >= ''01/01/2005'' '
      + 'and A.CIAID=B.CIAID(+) and A.TINID=B.TINID(+) and A.TDAID=B.TDAID(+) and A.ALMID=B.ALMID(+) '
      + 'and A.NISATIP=B.NISATIP(+) and A.NISAID=B.NISAID(+) and B.NISSIT(+)=''ACEPTADO'' '
      + 'ORDER BY B.NISAFREG DESC';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(sSQLC);
   DMFAC.cdsQry3.Open;

   DMFAC.cdsQry3.IndexFieldNames := 'ARTID; NISAFREG';

   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      DMFAC.cdsQry3.Filtered := False;
      DMFAC.cdsQry3.Filter := '';
      DMFAC.cdsQry3.Filter := 'ARTID=''' + DMFAC.cdsReporte.FieldByName('ARTID').AsString + '''';
      DMFAC.cdsQry3.Filtered := True;
      DMFAC.cdsQry3.Last;

      DMFAC.cdsReporte.Edit;
      DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := 0;
      DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := 0;

      If DMFAC.cdsReporte.FieldByname('DOCID').AsString = '27' Then
      Begin
         DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACMTOMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACVTOTMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat;
      End
      Else
      Begin
         DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACCANTG').AsFloat * DMFAC.cdsQry3.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACCANTG').AsFloat * DMFAC.cdsQry3.FieldByname('COSTO_INC_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACMTOMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACVTOTMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat;
      End;

      DMFAC.cdsReporte.Post;
      DMFAC.cdsReporte.Next;
   End;
   Screen.Cursor := crDefault;
}
// Fin HPC_201505_FAC

   dtgData.DataSource := DMFAC.dsReporte;

   Try
      DMFAC.HojaExcel('UTILIDAD DE VENTAS', DMFAC.dsReporte, dtgData);
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
End;

Procedure TFRepTiendas.bbtnRepUtilidadResClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere, sSQL, sSQLC: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;

// Inicio HPC_201505_FAC
   UtilidadDeVenta;
{
   Screen.Cursor := crHourGlass;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   Begin


      sSQL := 'SELECT * FROM (  '
         + ' SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + 'A.CLIEDES, B.DCCOMDES, C.DOCDES, C.DOCABR, ''' + edtCia.Text + ''' CIADES, '
         + 'A.ALMID, D.ALMDES, E.DFACITEM, '
         + ''' DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + 'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES, '
         + 'E.ARTID, E.ARTDES, E.DFACCANTG, E.DFACVTOTMN, E.DFACMTOMN, '
         + '0.000 COSTO_SIN_IGV, 0.000 COSTO_INC_IGV, 0.000 UTIL_SIN_IGV, 0.000 UTIL_INC_IGV '
         + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, FAC306 E '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'and A.ALMID like ''' + '' + '%'' '
         + 'and A.FACESTADO in (''ACEPTADO'') '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + 'AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + 'AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + 'AND A.CIAID=E.CIAID(+) AND A.DOCID=E.DOCID(+) AND A.FACSERIE=E.FACSERIE(+) AND A.NFAC=E.NFAC(+) ) Y '
         + ' WHERE '
         + ' NOT EXISTS (SELECT * '
         + '             FROM (SELECT A.CIAID,A.CCFCMPRB,A.CCSERIE NCSER,C.CCNODOC NCDOC,A.CCGRAVAD NCGRAV,'
         + '                          B.CCSERIE FACSER,B.CCNODOC FACDOC, B.TCANJEID,B.CCCANJE,B.CCFCANJE, C.CCPEDIDO,'
         + '                          E.LOCID,E.TINID,E.ALMID,E.TDAID,E.NISAID,E.ARTID '
         + '                    FROM   CXC301 A,CXC304 B ,CXC301 C,LOG314 D,LOG315 E '
         + '                    WHERE  A.CIAID = ' + QuotedStr(dblcCia.Text) + '  AND  (A.CCFCMPRB >= ' + sDesde + ' AND  A.CCFCMPRB <= ' + sHasta + ') AND A.DOCID IN (''24'',''25'') '
         + '                           AND B.CIAID = A.CIAID AND B.DOCID    = A.DOCID    AND B.CCSERIE = A.CCSERIE AND B.CCNODOC  = A.CCNODOC '
         + '                           AND C.CIAID = B.CIAID AND C.TCANJEID = B.TCANJEID AND C.CCCANJE = B.CCCANJE AND C.CCFCANJE = B.CCFCANJE AND NVL(C.CCESTADO,''X'')=''P'' '
         + '                           AND D.CIAID = B.CIAID AND D.NISAID   = C.CCPEDIDO AND D.NISATIP = ''INGRESO'' AND D.CLIEID  = C.CLIEID '
         + '                           AND E.CIAID = D.CIAID AND E.TRIID    = D.TRIID    AND E.NISATIP = D.NISATIP AND E.NISAID   = D.NISAID AND E.ALMID=D.ALMID ) X '
         + '              WHERE Y.CIAID = X.CIAID AND Y.FACFECHA=X.CCFCMPRB AND Y.FACSERIE=X.FACSER AND Y.NFAC=X.FACDOC AND Y.ARTID=X.ARTID )'
         + ' ORDER BY TIE_ID, FACFECHA, DOCID, FACSERIE, NFAC ';
// FINAL HPC_201305_FAC
   End;

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   sSQLC := 'Select A.ARTID, B.NISAFREG, A.NISAID, KDXCNTG, A.ARTPCG COSTO_SIN_IGV, ROUND(A.ARTPCG * (1 + 0.18), 2) COSTO_INC_IGV '
      + 'From LOG315 A, LOG314 B '
      + 'Where A.CIAID=' + QuotedStr(dblcCia.Text) + '  AND A.TINID=''20'' AND A.NISATIP=''INGRESO'' '
      + 'and A.TRIID IN (''01'', ''02'', ''09'', ''11'', ''16'') '
      + 'and A.NISAFREG >= ''01/01/2005'' '
      + 'and A.CIAID=B.CIAID(+) and A.TINID=B.TINID(+) and A.TDAID=B.TDAID(+) and A.ALMID=B.ALMID(+) '
      + 'and A.NISATIP=B.NISATIP(+) and A.NISAID=B.NISAID(+) and B.NISSIT(+)=''ACEPTADO'' '
      + 'ORDER BY B.NISAFREG DESC';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(sSQLC);
   DMFAC.cdsQry3.Open;

   DMFAC.cdsQry3.IndexFieldNames := 'ARTID; NISAFREG';

   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      DMFAC.cdsQry3.Filtered := False;
      DMFAC.cdsQry3.Filter := '';
      DMFAC.cdsQry3.Filter := 'ARTID=''' + DMFAC.cdsReporte.FieldByName('ARTID').AsString + '''';
      DMFAC.cdsQry3.Filtered := True;
      DMFAC.cdsQry3.Last;

      DMFAC.cdsReporte.Edit;
      DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := 0;
      DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := 0;

      If DMFAC.cdsReporte.FieldByname('DOCID').AsString = '27' Then
      Begin
         DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACMTOMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACVTOTMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat;
      End
      Else
      Begin
         DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACCANTG').AsFloat * DMFAC.cdsQry3.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACCANTG').AsFloat * DMFAC.cdsQry3.FieldByname('COSTO_INC_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACMTOMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACVTOTMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat;
      End;

      DMFAC.cdsReporte.Post;
      DMFAC.cdsReporte.Next;
   End;
   Screen.Cursor := crDefault;
}
//   Begin
   Data.DataSource := DMFAC.dsReporte;
   ppTVenta.DataPipeline := Data;
   Diseno.Report := ppTVenta;

   ppTVenta.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\VentaPorTienda_Uti_Res.rtm';

   ppTVenta.Template.LoadFromFile;
   Screen.Cursor := crDefault;

   If cbDiseno.Checked Then
      Diseno.ShowModal
   Else
   Begin
      ppTVenta.Print;

      ppTVenta.Stop;
      ppTVenta.DataPipeline := Nil;
//   End;

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
// Fin HPC_201505_FAC
End;

Procedure TFRepTiendas.bbtnRepDsctoClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere, sSQL: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;

   Screen.Cursor := crHourGlass;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   Begin
      sSQL := 'Select A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + '       CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + '       CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + '       A.CLIEDES, B.DCCOMDES, C.DOCDES, C.DOCABR, ''' + edtCia.Text + ''' CIADES, '
         + '       A.ALMID, D.ALMDES, A.DOCID||A.FACSERIE||A.NFAC DOCUMENTO, '
         + '       ''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + '       NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES, '
         + '       Z.ARTID, Z.ARTDES, Z.DFACCANTG, DFACPREUMN, DFACDTOMN2, DFACMTOMN, DFACIMPMTN1, '
         + '       DFACVTOTMN, USUSUPDCT, FECSUPDCT, A.VEID, V.VENOMBRES, ROUND(Z.DFACCANTG * Z.DFACPREUMN,2) SUBTOT '
         + '  from FAC305 A, FAC306 Z, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, CXC203 V '
         + ' where A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + '   and A.FACFECHA>=' + sDesde + ' and A.FACFECHA<=' + sHasta + ' '
         + '   and A.ALMID like ''' + '' + '%'' '
         + '   and A.FACESTADO in (''ACEPTADO'') '
         + '   and nvl(A.FACDCTOMN,0)>0 '
         + '   and A.CIAID=Z.CIAID(+) and A.DOCID=Z.DOCID(+) and A.FACSERIE=Z.FACSERIE(+) and A.NFAC=Z.NFAC(+) '
         + '   and A.CIAID=B.CIAID and A.FPAGOID=B.CCOMERID '
         + '   and A.DOCID=C.DOCID and C.DOCMOD=''CXC'' '
         + '   and A.CIAID=D.CIAID(+) and A.LOCID=D.LOCID(+) and A.TINID=D.TINID(+) and A.ALMID=D.ALMID(+) '
         + '   and D.CIAID=T.CIAID(+) and D.TIE_ID=T.TIE_ID(+) '
         + '   and T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + '   and A.CIAID=V.CIAID(+) and A.VEID=V.VEID(+) '
         {
         + 'UNION ALL '

         + 'SELECT A.CIAID, CCSERIE, CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 FACTOTMN, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 FACMTOMN, '
         + '       A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, '
         + '''DEL '+datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date)+ ''' RANGOF, '
         + ' NVL(T.TIE_ID,S.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + 'FROM CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T, FAC_FOR_PAG F, FAC305 V '
         + 'WHERE A.CIAID='+ QuotedStr(dblcCia.Text) +' AND A.DOCID=''27'' '
         + '   AND A.CCFCMPRB >= ' + sDesde + '   AND A.CCFCMPRB <= ' + sHasta + ' '
         + '   AND A.DOCID = C.DOCID   AND C.DOCMOD = ''CXC'' '
         + '   AND A.CIAID=S.CIAID AND A.CCPEDIDO=NISAID(+) AND NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) '
         + '   AND TRIID=''15'' AND NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
         + '   AND NISSIT=''ACEPTADO'' '
         + '   AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
         + '   AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + '   AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
         + '   AND A.CIAID=F.CIAID(+) AND A.DOCID=F.DOCPAG(+) AND A.CCSERIE=F.SERDOCPAG(+) AND A.CCNODOC=F.NUMDOCPAG(+) '
         + '   AND F.CIAID=V.CIAID AND F.DOCID=V.DOCID AND F.FACSERIE=V.FACSERIE AND F.NFAC=V.NFAC '
         + '   AND V.FACFECHA>=' + sDesde + ' AND V.FACFECHA<=' + sHasta + ' '
         }
      + 'ORDER BY TIE_ID, FACFECHA, DOCID, FACSERIE, NFAC';
   End;

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   Begin
      Data.DataSource := DMFAC.dsReporte;
      ppTVenta.DataPipeline := Data;
      Diseno.Report := ppTVenta;

      ppTVenta.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\VentaPorTiendaDscto.rtm';

      ppTVenta.Template.LoadFromFile;
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

Procedure TFRepTiendas.bbtnExlUtilidadResClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere, sSQL, sSQLC: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;

// Inicio HPC_201505_FAC
   UtilidadDeVenta;
   ResumenUtilVenta;
{
   Screen.Cursor := crHourGlass;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   Begin
      sSQL := 'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + 'A.CLIEDES, B.DCCOMDES, C.DOCDES, C.DOCABR, ''' + edtCia.Text + ''' CIADES, '
         + 'A.ALMID, D.ALMDES, '
         + '''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + 'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES, '
         + 'E.ARTID, E.ARTDES, E.DFACCANTG, E.DFACVTOTMN, E.DFACMTOMN, '
         + '0.000 COSTO_SIN_IGV, 0.000 COSTO_INC_IGV, 0.000 UTIL_SIN_IGV, 0.000 UTIL_INC_IGV '
         + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, FAC306 E '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'and A.ALMID like ''' + '' + '%'' '
         + 'and A.FACESTADO in (''ACEPTADO'') '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + 'AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + 'AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + 'AND A.CIAID=E.CIAID(+) AND A.DOCID=E.DOCID(+) AND A.FACSERIE=E.FACSERIE(+) AND A.NFAC=E.NFAC(+) '

      + 'UNION ALL '

      + 'SELECT A.CIAID, CCSERIE, CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
         + '       max( CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 ) FACTOTMN, '
         + '       max( CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 ) FACMTOMN, '
         + '       A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, C.DOCABR, ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, '
         + '''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + ' NVL(T.TIE_ID,S.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES, '
         + '''00000000'' ARTID, ''N/C'' ARTDES, 1 KDXCNTG, '
         + ' max(CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 ) DFACVTOTMN, '
         + ' max(CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 ) DFACVMONMN, '
         + ' ROUND(SUM(E.ARTTOTALG) * -1, 2) COSTO_SIN_IGV, ROUND(SUM(E.ARTTOTALG) * 1.18, 2) * -1 COSTO_INC_IGV, '
         + ' 0.000 UTIL_SIN_IGV, 0.000 UTIL_INC_IGV '
         + 'FROM CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T, FAC_FOR_PAG F, FAC305 V, LOG315 E '
         + 'WHERE A.CIAID=' + QuotedStr(dblcCia.Text) + ' AND A.DOCID=''27'' '
         + '   AND A.CCFCMPRB >= ' + sDesde + '   AND A.CCFCMPRB <= ' + sHasta + ' '
         + '   AND A.DOCID = C.DOCID   AND C.DOCMOD = ''CXC'' '
         + '   AND A.CIAID=S.CIAID AND A.CCPEDIDO=S.NISAID(+) AND S.NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) '
         + '   AND S.TRIID=''15'' AND S.NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
         + '   AND S.NISSIT=''ACEPTADO'' '
         + '   AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
         + '   AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + '   AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + '   AND A.CIAID=F.CIAID(+) AND A.DOCID=F.DOCPAG(+) AND A.CCSERIE=F.SERDOCPAG(+) AND A.CCNODOC=F.NUMDOCPAG(+) '
         + '   AND F.CIAID=V.CIAID AND F.DOCID=V.DOCID AND F.FACSERIE=V.FACSERIE AND F.NFAC=V.NFAC '
         + '   AND V.FACFECHA>=' + sDesde + ' AND V.FACFECHA<=' + sHasta + ' '
         + '   AND S.CIAID = E.CIAID(+) AND S.TRIID=E.TRIID AND S.NISATIP = E.NISATIP(+) AND S.NISAID = E.NISAID(+) AND S.ALMID=E.ALMID(+) '
         + 'GROUP BY A.CIAID, CCSERIE, CCNODOC, CCFCMPRB, A.DOCID, CCESTADO, A.CLIEDES, C.DOCDES, C.DOCABR, '
         + 'S.ALMID, D.ALMDES, T.TIE_ID, NVL(T.TIE_DES, D.ALMDES) '

      + 'ORDER BY TIE_ID, FACFECHA, DOCID, FACSERIE, NFAC';
   End;

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   sSQLC := 'Select A.ARTID, B.NISAFREG, A.NISAID, KDXCNTG, A.ARTPCG COSTO_SIN_IGV, ROUND(A.ARTPCG * (1 + 0.18), 2) COSTO_INC_IGV '
      + 'From LOG315 A, LOG314 B '
      + 'Where A.CIAID=' + QuotedStr(dblcCia.Text) + '  AND A.TINID=''20'' AND A.NISATIP=''INGRESO'' '
      + 'and A.TRIID IN (''01'', ''02'', ''09'', ''11'', ''16'') '
      + 'and A.NISAFREG >= ''01/01/2005'' '
      + 'and A.CIAID=B.CIAID(+) and A.TINID=B.TINID(+) and A.TDAID=B.TDAID(+) and A.ALMID=B.ALMID(+) '
      + 'and A.NISATIP=B.NISATIP(+) and A.NISAID=B.NISAID(+) and B.NISSIT(+)=''ACEPTADO'' '
      + 'ORDER BY B.NISAFREG DESC';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(sSQLC);
   DMFAC.cdsQry3.Open;

   DMFAC.cdsQry3.IndexFieldNames := 'ARTID; NISAFREG';

   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      DMFAC.cdsQry3.Filtered := False;
      DMFAC.cdsQry3.Filter := '';
      DMFAC.cdsQry3.Filter := 'ARTID=''' + DMFAC.cdsReporte.FieldByName('ARTID').AsString + '''';
      DMFAC.cdsQry3.Filtered := True;
      DMFAC.cdsQry3.Last;

      DMFAC.cdsReporte.Edit;
      DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := 0;
      DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := 0;

      If DMFAC.cdsReporte.FieldByname('DOCID').AsString = '27' Then
      Begin
         DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACMTOMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACVTOTMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat;
      End
      Else
      Begin
         DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACCANTG').AsFloat * DMFAC.cdsQry3.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACCANTG').AsFloat * DMFAC.cdsQry3.FieldByname('COSTO_INC_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACMTOMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACVTOTMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat;
      End;

      DMFAC.cdsReporte.Post;
      DMFAC.cdsReporte.Next;
   End;
   Screen.Cursor := crDefault;
}

   dtgData.DataSource := DMFAC.dsQry4;

   Try
      DMFAC.HojaExcel('RESUMEN UTILIDAD VENTAS', DMFAC.dsQry4, dtgData);
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
// Fin HPC_201505_FAC

End;

Procedure TFRepTiendas.bbtnExlDsctoClick(Sender: TObject);
Var
   sDesde, sHasta, xWhere, sSQL: String;
   x10: Integer;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      ShowMessage('Código de Compañia no Válido');
      Exit;
   End;

   Screen.Cursor := crHourGlass;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

   Begin
      sSQL := 'SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END Total_Venta, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END Total_SIN_IGV, '
         + 'A.CLIEDES cliente, B.DCCOMDES, C.DOCDES, C.DOCABR, ''' + edtCia.Text + ''' CIADES, '
         + 'A.ALMID, D.ALMDES, A.DOCID||A.FACSERIE||A.NFAC DOCUMENTO, '
         + '''DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + 'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES, '
         + 'z.artid, z.artdes, z.dfaccantg Cantidad, dfacpreumn Precio_uni, round(z.dfaccantg * z.dfacpreumn,2) Sub_Total, '
         + 'dfacdtomn2 Descuento, dfacmtomn Total_Neto, dfacimpmtn1 Importe_IGV, '
         + 'dfacvtotmn Precio_Venta, ususupdct Usuario_Superv, fecsupdct Fecha_Superv, a.veid Cod_vend, v.venombres vendedor  '
         + 'FROM FAC305 A, FAC306 Z, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, CXC203 V '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'and A.ALMID like ''' + '' + '%'' '
         + 'and A.FACESTADO in (''ACEPTADO'') '
         + 'and nvl(a.facdctomn,0)>0 '
         + 'and a.ciaid=z.ciaid(+) and a.docid=z.docid(+) and a.facserie=z.facserie(+) and a.nfac=z.nfac(+) '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + 'AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + 'AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + 'and a.ciaid=v.ciaid(+) and a.veid=v.veid(+) '
         {
         + 'UNION ALL '

         + 'SELECT A.CIAID, CCSERIE, CCNODOC, CCFCMPRB FACFECHA, ''30'' FPAGOID, A.DOCID, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN ''ACEPTADO'' WHEN CCESTADO=''A'' THEN ''ANULADO'' ELSE '''' END FACESTADO, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCMTOLOC,0) ELSE 0 END*-1 FACTOTMN, '
         + '       CASE WHEN CCESTADO IN (''P'',''C'') THEN NVL(CCGRAVAD,0)+NVL(CCNOGRAV,0) ELSE 0 END*-1 FACMTOMN, '
         + '       A.CLIEDES, ''Vendedor - Cajero'' DCCOMDES, C.DOCDES, ''' + edtCia.Text + ''' CIADES, S.ALMID, D.ALMDES, '
         + '''DEL '+datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date)+ ''' RANGOF, '
         + ' NVL(T.TIE_ID,S.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES '
         + 'FROM CXC301 A, TGE110 C, LOG314 S, TGE151 D, FAC_TIENDA T, FAC_FOR_PAG F, FAC305 V '
         + 'WHERE A.CIAID='+ QuotedStr(dblcCia.Text) +' AND A.DOCID=''27'' '
         + '   AND A.CCFCMPRB >= ' + sDesde + '   AND A.CCFCMPRB <= ' + sHasta + ' '
         + '   AND A.DOCID = C.DOCID   AND C.DOCMOD = ''CXC'' '
         + '   AND A.CIAID=S.CIAID AND A.CCPEDIDO=NISAID(+) AND NISATIP=''INGRESO'' AND A.CLIEID=S.CLIEID(+) '
         + '   AND TRIID=''15'' AND NISAFREG BETWEEN CCFCMPRB-15 AND CCFCMPRB+1 '
         + '   AND NISSIT=''ACEPTADO'' '
         + '   AND S.CIAID = D.CIAID(+) AND S.LOCID = D.LOCID(+) AND S.TINID = D.TINID(+) AND S.ALMID = D.ALMID(+) '
         + '   AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + '   AND T.TIE_ID LIKE '''+dblcTienda.Text+'%'' '
         + '   AND A.CIAID=F.CIAID(+) AND A.DOCID=F.DOCPAG(+) AND A.CCSERIE=F.SERDOCPAG(+) AND A.CCNODOC=F.NUMDOCPAG(+) '
         + '   AND F.CIAID=V.CIAID AND F.DOCID=V.DOCID AND F.FACSERIE=V.FACSERIE AND F.NFAC=V.NFAC '
         + '   AND V.FACFECHA>=' + sDesde + ' AND V.FACFECHA<=' + sHasta + ' '
         }
      + 'ORDER BY TIE_ID, FACFECHA, DOCID, FACSERIE, NFAC';
   End;

   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   dtgData.DataSource := DMFAC.dsReporte;

   Try
      DMFAC.HojaExcel('VENTAS CON DESCUENTO', DMFAC.dsReporte, dtgData);
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;

End;

Procedure TFRepTiendas.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFRepTiendas.dblcdVendedorExit(Sender: TObject);
Begin
   If DMFAC.cdsRepo3.Locate(dblcdVendedor.LookupField, dblcdVendedor.Text, []) Then
      dbeVendedores.Text := DMFAC.cdsRepo3.FieldByName('VENOMBRES').AsString;
End;

Procedure TFRepTiendas.FormShow(Sender: TObject);
Begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));

// Inicio HPC_201505_FAC
   bbtnEstGGPP.Visible := False;
// Fin HPC_201505_FAC

End;

// Inicio HPC_201505_FAC
Procedure TFRepTiendas.bbtnEstGGPPClick(Sender: TObject);
Var
   x10: integer;
Begin
   bbtnEstGGPPData;
   ppdb2.DataSource := DMFAC.dsQry5;
   ppR2.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\FacEstadoGyPporLocal.rtm';
   ppR2.template.LoadFromFile;

   Screen.Cursor := crDefault;
   If cbDiseno.Checked Then
      ppd2.showmodal
   Else
   Begin
      ppR2.Print;
      ppR2.Stop;
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
   DMFAC.cdsQry5.IndexFieldNames := '';
End;
// Fin HPC_201505_FAC

// Inicio HPC_201505_FAC
procedure TFRepTiendas.UtilidadDeVenta;
Var
   sDesde, sHasta, xWhere, sSQL, sSQLC: String;
   x10: Integer;
begin
   Screen.Cursor := crHourGlass;

   sDesde := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpDesde.DateTime));
   sHasta := quotedStr(formatdatetime(DMFAC.wFormatFecha, dtpHasta.DateTime));

// HPC_201801_FAC
// 05/04/2018 ajustes por cambio en maestro de Clientes
   {
   Begin
      sSQL := 'SELECT * FROM (  '
         + ' SELECT A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACTOTMN END FACTOTMN, '
         + 'CASE WHEN A.FACESTADO<>''ACEPTADO'' THEN 0 ELSE A.FACMTOMN END FACMTOMN, '
         + 'A.CLIEDES, B.DCCOMDES, C.DOCDES, C.DOCABR, ''' + edtCia.Text + ''' CIADES, '
         + 'A.ALMID, D.ALMDES, E.DFACITEM, '
         + ''' DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
         + 'NVL(T.TIE_ID, A.ALMID) TIE_ID, NVL(T.TIE_DES,D.ALMDES) TIE_DES, '
         + 'E.ARTID, E.ARTDES, E.DFACCANTG, E.DFACVTOTMN, E.DFACMTOMN, '
         + '0.000 COSTO_SIN_IGV, 0.000 COSTO_INC_IGV, 0.000 UTIL_SIN_IGV, 0.000 UTIL_INC_IGV '
         + 'FROM FAC305 A, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, FAC306 E '
         + 'WHERE A.CIAID =' + QuotedStr(dblcCia.Text) + ' '
         + 'AND A.FACFECHA>=' + sDesde + ' AND A.FACFECHA<=' + sHasta + ' '
         + 'and A.ALMID like ''' + '' + '%'' '
         + 'and A.FACESTADO in (''ACEPTADO'') '
         + 'AND A.CIAID=B.CIAID AND A.FPAGOID=B.CCOMERID '
         + 'AND A.DOCID=C.DOCID AND C.DOCMOD=''CXC'' '
         + 'AND A.CIAID=D.CIAID(+) AND A.LOCID=D.LOCID(+) AND A.TINID=D.TINID(+) AND A.ALMID=D.ALMID(+) '
         + 'AND D.CIAID=T.CIAID(+) AND D.TIE_ID=T.TIE_ID(+) '
         + 'AND T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
         + 'AND A.CIAID=E.CIAID(+) AND A.DOCID=E.DOCID(+) AND A.FACSERIE=E.FACSERIE(+) AND A.NFAC=E.NFAC(+) ) Y '
         + ' WHERE '
         + ' NOT EXISTS (SELECT * '
         + '             FROM (SELECT A.CIAID,A.CCFCMPRB,A.CCSERIE NCSER,C.CCNODOC NCDOC,A.CCGRAVAD NCGRAV,'
         + '                          B.CCSERIE FACSER,B.CCNODOC FACDOC, B.TCANJEID,B.CCCANJE,B.CCFCANJE, C.CCPEDIDO,'
         + '                          E.LOCID,E.TINID,E.ALMID,E.TDAID,E.NISAID,E.ARTID '
         + '                    FROM   CXC301 A,CXC304 B ,CXC301 C,LOG314 D,LOG315 E '
         + '                    WHERE  A.CIAID = ' + QuotedStr(dblcCia.Text) + '  AND  (A.CCFCMPRB >= ' + sDesde + ' AND  A.CCFCMPRB <= ' + sHasta + ') AND A.DOCID IN (''24'',''25'') '
         + '                           AND B.CIAID = A.CIAID AND B.DOCID    = A.DOCID    AND B.CCSERIE = A.CCSERIE AND B.CCNODOC  = A.CCNODOC '
         + '                           AND C.CIAID = B.CIAID AND C.TCANJEID = B.TCANJEID AND C.CCCANJE = B.CCCANJE AND C.CCFCANJE = B.CCFCANJE AND NVL(C.CCESTADO,''X'')=''P'' '
         + '                           AND D.CIAID = B.CIAID AND D.NISAID   = C.CCPEDIDO AND D.NISATIP = ''INGRESO'' AND D.CLIEID  = C.CLIEID '
         + '                           AND E.CIAID = D.CIAID AND E.TRIID    = D.TRIID    AND E.NISATIP = D.NISATIP AND E.NISAID   = D.NISAID AND E.ALMID=D.ALMID ) X '
         + '              WHERE Y.CIAID = X.CIAID AND Y.FACFECHA=X.CCFCMPRB AND Y.FACSERIE=X.FACSER AND Y.NFAC=X.FACDOC AND Y.ARTID=X.ARTID )'
         + ' ORDER BY TIE_ID, FACFECHA, DOCID, FACSERIE, NFAC, DFACITEM ';
   End;
   }
   sSQL := 'Select * '
      + '     from (Select A.CIAID, A.FACSERIE, A.NFAC, A.FACFECHA, A.FPAGOID, A.DOCID, A.FACESTADO, '
      + '                  case when A.FACESTADO<>''ACEPTADO'' then 0 else A.FACTOTMN end FACTOTMN, '
      + '                  case when A.FACESTADO<>''ACEPTADO'' then 0 else A.FACMTOMN END FACMTOMN, '
      + '                  A.CLIEDES, B.DCCOMDES, C.DOCDES, C.DOCABR, ''' + edtCia.Text + ''' CIADES, '
      + '                  A.ALMID, D.ALMDES, E.DFACITEM, '
      + '                  '' DEL ' + datetoStr(dtpDesde.Date) + ' AL ' + datetoStr(dtpHasta.Date) + ''' RANGOF, '
      + '                  nvl(T.TIE_ID, A.ALMID) TIE_ID, nvl(T.TIE_DES,D.ALMDES) TIE_DES, '
      + '                  E.ARTID, E.ARTDES, E.DFACCANTG, E.DFACVTOTMN, E.DFACMTOMN, '
      + '                  0.000 COSTO_SIN_IGV, 0.000 COSTO_INC_IGV, 0.000 UTIL_SIN_IGV, 0.000 UTIL_INC_IGV '
      + '             from FAC305 A, TGE180 B, TGE110 C, TGE151 D, FAC_TIENDA T, FAC306 E '
      + '            where A.CIAID =' + QuotedStr(dblcCia.Text)+' and A.FACFECHA >=' + sDesde+ ' and A.FACFECHA<=' + sHasta
      + '              and A.ALMID like ''' + '' + '%'' ' + ' and A.FACESTADO in (''ACEPTADO'') '
      + '              and A.TINID NOT IN (''00'') '
      + '              and B.CIAID=A.CIAID and B.CCOMERID=A.FPAGOID '
      + '              and C.DOCID=A.DOCID and C.DOCMOD=''CXC'' '
      + '              and D.CIAID(+)=A.CIAID and D.LOCID(+)=A.LOCID and D.TINID(+)=A.TINID and D.ALMID(+)=A.ALMID '
      + '              and T.CIAID(+)=D.CIAID and T.TIE_ID(+)=D.TIE_ID and T.TIE_ID LIKE ''' + dblcTienda.Text + '%'' '
      + '              and E.CIAID(+)=A.CIAID and E.DOCID(+)=A.DOCID and E.FACSERIE(+)=A.FACSERIE and E.NFAC(+)=A.NFAC ) Y '
      + '    where not exists (Select * '
      + '                        from (Select A.CIAID, A.CCFCMPRB, A.CCSERIE NCSER, C.CCNODOC NCDOC, A.CCGRAVAD NCGRAV,'
      + '                                     B.CCSERIE FACSER, B.CCNODOC FACDOC, B.TCANJEID, B.CCCANJE, B.CCFCANJE, C.CCPEDIDO,'
      + '                                     E.LOCID, E.TINID, E.ALMID, E.TDAID, E.NISAID, E.ARTID '
      + '                                from CXC301 A, CXC304 B, CXC301 C, LOG314 D, LOG315 E '
      + '                               where A.CIAID = ' + QuotedStr(dblcCia.Text)
      + '                                 and (A.CCFCMPRB >= ' + sDesde + ' and A.CCFCMPRB <= ' + sHasta + ') '
      + '                                 and A.DOCID IN (''24'',''25'') '
      + '                                 and B.CIAID = A.CIAID and B.DOCID = A.DOCID and B.CCSERIE = A.CCSERIE and B.CCNODOC = A.CCNODOC '
      + '                                 and C.CIAID = B.CIAID and C.TCANJEID = B.TCANJEID and C.CCCANJE = B.CCCANJE '
      + '                                     and C.CCFCANJE = B.CCFCANJE and NVL(C.CCESTADO,''X'')=''P'' '
      + '                                 and D.CIAID = B.CIAID and D.NISAID   = C.CCPEDIDO and D.NISATIP = ''INGRESO'' '
      + '                                     and D.CLIEID  = C.CLIEID '
      + '                                 and E.CIAID = D.CIAID AND E.TRIID = D.TRIID and E.NISATIP = D.NISATIP and E.NISAID = D.NISAID '
      + '                                     and E.ALMID=D.ALMID ) X '
      + '                       where Y.CIAID = X.CIAID and Y.FACFECHA=X.CCFCMPRB and Y.FACSERIE=X.FACSER and Y.NFAC=X.FACDOC '
      + '                         and Y.ARTID=X.ARTID )'
      + '    order by TIE_ID, FACFECHA, DOCID, FACSERIE, NFAC, DFACITEM ';
   DMFAC.cdsReporte.Close;
   DMFAC.cdsReporte.DataRequest(sSQL);
   DMFAC.cdsReporte.Open;

   If DMFAC.cdsReporte.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   {
   sSQLC := 'Select A.ARTID, B.NISAFREG, A.NISAID, KDXCNTG, A.ARTPCG COSTO_SIN_IGV, ROUND(A.ARTPCG * (1 + 0.18), 2) COSTO_INC_IGV '
      + 'From LOG315 A, LOG314 B '
      + 'Where A.CIAID=' + QuotedStr(dblcCia.Text) + '  AND A.TINID=''20'' AND A.NISATIP=''INGRESO'' '
      + 'and A.TRIID IN (''01'', ''02'', ''09'', ''11'', ''16'') '
      + 'and A.NISAFREG >= ''01/01/2005'' '
      + 'and A.CIAID=B.CIAID(+) and A.TINID=B.TINID(+) and A.TDAID=B.TDAID(+) and A.ALMID=B.ALMID(+) '
      + 'and A.NISATIP=B.NISATIP(+) and A.NISAID=B.NISAID(+) and B.NISSIT(+)=''ACEPTADO'' '
      + 'ORDER BY B.NISAFREG DESC';
   }
   sSQLC := 'Select A.ARTID, B.NISAFREG, A.NISAID, KDXCNTG, '
      + '           case when A.TMONID=''N'' then A.ARTPCG else round(A.ARTPCG*A.TCAMB,3) end COSTO_SIN_IGV, '
      + '           round((case when A.TMONID=''N'' then A.ARTPCG else round(A.ARTPCG*A.TCAMB,3) end) * (1 + 0.18), 2) COSTO_INC_IGV '
      + '      From LOG315 A, LOG314 B '
      + '     Where A.CIAID=' + QuotedStr(dblcCia.Text) + '  AND A.TINID=''20'' AND A.NISATIP=''INGRESO'' '
      + '       and A.TRIID IN (''01'', ''02'', ''09'', ''11'', ''16'') '
      + '       and A.NISAFREG >= ''01/01/2005'' '
      + '       and B.CIAID(+)=A.CIAID and B.TINID(+)=A.TINID and B.TDAID(+)=A.TDAID and B.ALMID(+)=A.ALMID '
      + '       and B.NISATIP(+)=A.NISATIP and B.NISAID(+)=A.NISAID and B.NISSIT(+)=''ACEPTADO'' '
      + '     order by B.NISAFREG DESC';
// Fin HPC_201801_FAC
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(sSQLC);
   DMFAC.cdsQry3.Open;

   DMFAC.cdsQry3.IndexFieldNames := 'ARTID; NISAFREG';

   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      DMFAC.cdsQry3.Filtered := False;
      DMFAC.cdsQry3.Filter := '';
      DMFAC.cdsQry3.Filter := 'ARTID=''' + DMFAC.cdsReporte.FieldByName('ARTID').AsString + '''';
      DMFAC.cdsQry3.Filtered := True;
      DMFAC.cdsQry3.Last;

      DMFAC.cdsReporte.Edit;
      DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := 0;
      DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := 0;

      If DMFAC.cdsReporte.FieldByname('DOCID').AsString = '27' Then
      Begin
         DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACMTOMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACVTOTMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat;
      End
      Else
      Begin
         DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACCANTG').AsFloat * DMFAC.cdsQry3.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACCANTG').AsFloat * DMFAC.cdsQry3.FieldByname('COSTO_INC_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACMTOMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.FieldByname('UTIL_INC_IGV').AsFloat := DMFAC.cdsReporte.FieldByname('DFACVTOTMN').AsFloat
            - DMFAC.cdsReporte.FieldByname('COSTO_INC_IGV').AsFloat;
      End;

      DMFAC.cdsReporte.Post;
      DMFAC.cdsReporte.Next;
   End;
   Screen.Cursor := crDefault;
end;
// Fin HPC_201505_FAC

// Inicio HPC_201505_FAC
procedure TFRepTiendas.ResumenUtilVenta;
var
   xSQL, xAlmacen : String;
   xCosto, xVenta, xUtilidad : Currency;
begin
   xSQL := 'Select ALMID, ALMDES, 0.00 COSTO, 0.00 VENTA, 0.00 UTILIDAD '
      +    '  from TGE151 '
      +    ' where 1<>1';
   DMFAC.cdsQry4.Close;
   DMFAC.cdsQry4.DataRequest(xSQL);
   DMFAC.cdsQry4.Open;
   DMFAC.cdsReporte.IndexFieldNames := 'ALMID';
   DMFAC.cdsReporte.First;
   While Not DMFAC.cdsReporte.Eof Do
   Begin
      xAlmacen := DMFAC.cdsReporte.FieldByName('ALMID').AsString;
      xCosto := 0.00;
      xVenta := 0.00;
      xUtilidad := 0.00;
      While (Not DMFAC.cdsReporte.Eof)
          and (DMFAC.cdsReporte.FieldByName('ALMID').AsString=xAlmacen) Do
      Begin
         xCosto := xCosto + DMFAC.cdsReporte.FieldByname('COSTO_SIN_IGV').AsFloat;
         xVenta := xVenta + DMFAC.cdsReporte.FieldByname('DFACMTOMN').AsFloat;
         xUtilidad := xUtilidad + DMFAC.cdsReporte.FieldByname('UTIL_SIN_IGV').AsFloat;
         DMFAC.cdsReporte.Next;
      End;
      DMFAC.cdsQry4.Append;
      DMFAC.cdsQry4.FieldByName('ALMID').AsString   := xAlmacen;
      DMFAC.cdsQry4.FieldByName('ALMDES').AsString  := DMFAC.cdsReporte.FieldByName('ALMDES').AsString;
      DMFAC.cdsQry4.FieldByName('COSTO').AsFloat    := xCosto;
      DMFAC.cdsQry4.FieldByName('VENTA').AsFloat    := xVenta;
      DMFAC.cdsQry4.FieldByName('UTILIDAD').AsFloat := xUtilidad;
      DMFAC.cdsQry4.Post;
   End;
   DMFAC.cdsReporte.IndexFieldNames := '';

end;
// Fin HPC_201505_FAC

// Inicio HPC_201505_FAC
procedure TFRepTiendas.bbtnEstGGPPData;
Var
   xSQL: String;
   wAno, wMes, wDia: word;
   xAnoMes, xCuenta, xConstante, xDBalId: String;
   xCaracterFormula, xNumOrden, xPosicTotales, xNumOrdGasAdm : Integer;
   xTotBazar, xTotMinka : Currency;
   xTotBazarAdm, xTotMinkaAdm : Currency;
   xTieneConstante : Boolean;
Begin
   decodedate(dtpHasta.Date, wAno, wMes, wDia);
   xAnoMes := inttostr(wAno) + DMFAC.strzero(inttostr(wMes), 2);

// -- Ventas
   xSQL := 'Select '+quotedstr(dblcCia.Text+' '+edtCia.Text)+' CIA, '
      +            quotedstr(datetostr(dtpHasta.Date))+' FECHA_FIN, '
      + '          1 ORDENLINEA, ''          '' CUENTAID, ''VENTAS                             '' TIPO, ''+'' SIGNO, '
      + '          ''1         '' DBALID, '
      + '          round(sum(case when nvl(B.TIE_ID,''01'')<>''02'' '
      + '                         then A.FACMTOMN else 0.00 end),0) PRINCIPAL, '
      + '          round(sum(case when nvl(B.TIE_ID,''01'')=''02'' '
      + '                         then A.FACMTOMN else 0.00 end),0) MINKA, '
      + '          0.00 MONTO_TOTAL '
      + '     from FAC305 A, TGE151 B '
      + '    where A.CIAID=' + quotedstr(dblcCia.Text)
      + '      and A.FACFECHA>=' + quotedstr(datetostr(dtpDesde.Date))
      + '      and A.FACFECHA<=' + quotedstr(datetostr(dtpHasta.Date))
      + '      and A.FACESTADO=''ACEPTADO'' '
      + '      and B.CIAID=A.CIAID and B.ALMID=A.ALMID and ACTIVO=''S'' '
// -- Notas de Crédito
      + '   Union all '
      + '   Select '+quotedstr(dblcCia.Text+' '+edtCia.Text)+' CIA, '
      +            quotedstr(datetostr(dtpHasta.Date))+' FECHA_FIN, '
      + '          2 ORDENLINEA,  ''          '' CUENTAID,''N/C                                '' TIPO, ''-'' SIGNO, '
      + '          ''2         '' DBALID, '
      + '          sum(CCMTOORI-CCIGV * (case when TMONID=''N'' then 1 else CCTCAMPR end) ) PRINCIPAL, '
      + '          0.00 MINKA, '
      + '          0.00 MONTO_TOTAL '
      + '     from CXC301 '
      + '    where CIAID=' + quotedstr(dblcCia.Text)
      + '      and CCANOMES=' + quotedstr(xAnoMes)
      + '      and DOCID=''27'' '
      + '      and CCESTADO=''P'' ';
   DMFAC.cdsQry5.Close;
   DMFAC.cdsQry5.DataRequest(xSQL);
   DMFAC.cdsQry5.Open;
   DMFAC.cdsQry5.First;
   xTotBazar := 0;
   xTotMinka := 0;
   while not DMFAC.cdsQry5.EOF do
   Begin
      If DMFAC.cdsQry5.FieldByName('SIGNO').AsString='+' then
      Begin
         xTotBazar := xTotBazar + DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat;
         xTotMinka := xTotMinka + DMFAC.cdsQry5.FieldByName('MINKA').AsFloat;
      End
      Else
      Begin
         xTotBazar := xTotBazar - DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat;
         xTotMinka := xTotMinka - DMFAC.cdsQry5.FieldByName('MINKA').AsFloat;
      End;
      DMFAC.cdsQry5.Edit;
      DMFAC.cdsQry5.FieldByName('MONTO_TOTAL').AsFloat :=
          DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat
         +DMFAC.cdsQry5.FieldByName('MINKA').AsFloat;
      DMFAC.cdsQry5.Post;
      DMFAC.cdsQry5.Next;
   End;

   xNumOrden := 3;

// -- Ingresos Financieros
   xSQL := 'Select round(sum(case when CNTDH=''H'' then CNTHABEMN else -CNTDEBEMN end),0) PRINCIPAL, '
      +    '       0.00 MINKA '
      +    '  from CNT301 '
      +    ' where CIAID='+quotedstr(dblcCia.Text)
      +    '   and CUENTAID like '+quotedstr('77%')
      +    '   and CNTANOMM='+quotedstr(xAnoMes);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;

   If DMFAC.cdsQry.RecordCount>0 then
   Begin
      DMFAC.cdsQry5.Append;
      DMFAC.cdsQry5.FieldByName('CIA').AsString := dblcCia.Text+' '+edtCia.Text;
      DMFAC.cdsQry5.FieldByName('FECHA_FIN').AsString := datetostr(dtpHasta.Date);
      DMFAC.cdsQry5.FieldByName('ORDENLINEA').AsInteger := xNumOrden;
      xNumOrden := xNumOrden + 1;
      DMFAC.cdsQry5.FieldByName('CUENTAID').AsString := '77';
      DMFAC.cdsQry5.FieldByName('TIPO').AsString := 'INGRESOS FINANCIEROS';
      DMFAC.cdsQry5.FieldByName('DBALID').AsString := '3';
      DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat := DMFAC.cdsQry.FieldByName('PRINCIPAL').AsFloat;
      DMFAC.cdsQry5.FieldByName('MINKA').AsFloat := DMFAC.cdsQry.FieldByName('MINKA').AsFloat;
      DMFAC.cdsQry5.FieldByName('MONTO_TOTAL').AsFloat := DMFAC.cdsQry.FieldByName('PRINCIPAL').AsFloat
                                                         +DMFAC.cdsQry.FieldByName('MINKA').AsFloat;
      DMFAC.cdsQry5.FieldByName('SIGNO').AsString := '+';
      DMFAC.cdsQry5.Post;
      xTotBazar := xTotBazar + DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat;
      xTotMinka := xTotMinka + DMFAC.cdsQry5.FieldByName('MINKA').AsFloat;
   End;

// Total Ingresos
   DMFAC.cdsQry5.Append;
   DMFAC.cdsQry5.FieldByName('CIA').AsString := dblcCia.Text+' '+edtCia.Text;
   DMFAC.cdsQry5.FieldByName('FECHA_FIN').AsString := datetostr(dtpHasta.Date);
   DMFAC.cdsQry5.FieldByName('ORDENLINEA').AsInteger := xNumOrden;
   xNumOrden := xNumOrden + 1;
   DMFAC.cdsQry5.FieldByName('CUENTAID').AsString := '';
   DMFAC.cdsQry5.FieldByName('TIPO').AsString := 'TOTAL INGRESOS';
   DMFAC.cdsQry5.FieldByName('DBALID').AsString := '3';
   DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat := xTotBazar;
   DMFAC.cdsQry5.FieldByName('MINKA').AsFloat := xTotMinka;
   DMFAC.cdsQry5.FieldByName('MONTO_TOTAL').AsFloat := xTotBazar + xTotMinka;
   DMFAC.cdsQry5.FieldByName('SIGNO').AsString := '+';
   DMFAC.cdsQry5.Post;

// Costo de Ventas
   UtilidadDeVenta;
   ResumenUtilVenta;

   DMFAC.cdsQry5.Append;
   DMFAC.cdsQry5.FieldByName('CIA').AsString := dblcCia.Text+' '+edtCia.Text;
   DMFAC.cdsQry5.FieldByName('FECHA_FIN').AsString := datetostr(dtpHasta.Date);
   DMFAC.cdsQry5.FieldByName('ORDENLINEA').AsInteger := xNumOrden;
   xNumOrden := xNumOrden + 1;
   DMFAC.cdsQry5.FieldByName('TIPO').AsString := 'COSTO DE VENTA';
   DMFAC.cdsQry5.FieldByName('DBALID').AsString := '4';
   DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat := 0.00;
   DMFAC.cdsQry5.FieldByName('MINKA').AsFloat := 0.00;
   DMFAC.cdsQry5.FieldByName('MONTO_TOTAL').AsFloat := 0.00;
   DMFAC.cdsQry5.FieldByName('SIGNO').AsString := '-';

   DMFAC.cdsQry4.First;
   while not DMFAC.cdsQry4.EOF do
   Begin
      If DMFAC.cdsQry4.FieldByName('ALMID').AsString='28' then
         DMFAC.cdsQry5.FieldByName('MINKA').AsFloat :=
              DMFAC.cdsQry5.FieldByName('MINKA').AsFloat + DMFAC.cdsQry4.FieldByName('COSTO').AsFloat
      else
         DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat :=
              DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat + DMFAC.cdsQry4.FieldByName('COSTO').AsFloat;
      DMFAC.cdsQry4.Next;
   End;

   DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat := fround(DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat,15,0);
   DMFAC.cdsQry5.FieldByName('MINKA').AsFloat := fround(DMFAC.cdsQry5.FieldByName('MINKA').AsFloat,15,0);
   DMFAC.cdsQry5.FieldByName('MONTO_TOTAL').AsFloat :=
          DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat
         +DMFAC.cdsQry5.FieldByName('MINKA').AsFloat;
   DMFAC.cdsQry5.Post;

// Gastos de Administración
   xSQL := 'Select DBALID, nvl(DBALTITULO,''N'') DBALTITULO, DBALDES, '
      +    '       nvl(DBALSUBTOT,''N'') DBALSUBTOT, DBALFORM '
      +    '  from TGE779 '
      +    ' where CIAID='+quotedstr(dblcCia.Text)
      +    '   and BALID=''09'' '
      +    '   and length(DBALDES)>0 '
      +    ' order by DBALID ';
   DMFAC.cdsQry4.Close;
   DMFAC.cdsQry4.DataRequest(xSQL);
   DMFAC.cdsQry4.Open;
   xTotBazarAdm := 0;
   xTotMinkaAdm := 0;
   xTotBazar := 0;
   xTotMinka := 0;

   xNumOrdGasAdm := xNumOrden;
   xNumOrden := xNumOrden + 1;

   DMFAC.cdsQry4.First;
   while not DMFAC.cdsQry4.EOF do
   Begin
   /////////////////////////////////////////////////////
   /////////////// Títulos y Subtítulos  ///////////////
   /////////////////////////////////////////////////////
      if DMFAC.cdsQry4.FieldByName('DBALTITULO').AsString = 'S' then
      Begin
         DMFAC.cdsQry5.Append;
         DMFAC.cdsQry5.FieldByName('CIA').AsString := dblcCia.Text+' '+edtCia.Text;
         DMFAC.cdsQry5.FieldByName('FECHA_FIN').AsString := datetostr(dtpHasta.Date);
         DMFAC.cdsQry5.FieldByName('ORDENLINEA').AsInteger := xNumOrden;
         DMFAC.cdsQry5.FieldByName('TIPO').AsString := uppercase(DMFAC.cdsQry4.FieldByName('DBALDES').AsString);
         DMFAC.cdsQry5.FieldByName('DBALID').AsString := DMFAC.cdsQry4.FieldByName('DBALID').AsString;
         DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat := 0.00;
         DMFAC.cdsQry5.FieldByName('MINKA').AsFloat := 0.00;
         DMFAC.cdsQry5.FieldByName('MONTO_TOTAL').AsFloat := 0.00;
         DMFAC.cdsQry5.FieldByName('SIGNO').AsString := '+';
         DMFAC.cdsQry5.Post;
      End;

   ////////////////////////////////////////////////////////////
   /////////////// Fórmulas (Cuentas Contables) ///////////////
   ////////////////////////////////////////////////////////////
      if (DMFAC.cdsQry4.FieldByName('DBALTITULO').AsString = 'N')
         and (DMFAC.cdsQry4.FieldByName('DBALSUBTOT').AsString = 'N') then
      Begin
         xCuenta := DMFAC.cdsQry4.FieldByName('DBALFORM').AsString;
         xConstante := '';
         xCaracterFormula := 1;
         xTieneConstante := False;
         While (length(xCuenta)-xCaracterFormula)>0 do
         Begin
            if not xTieneConstante then
            Begin
               if (copy(xCuenta,xCaracterFormula,1)='+') or
                  (copy(xCuenta,xCaracterFormula,1)='-') then
               Begin
                  xTieneConstante := True;
               End;
            End;
            if xTieneConstante then
            Begin
               xConstante := trim(xConstante + copy(xCuenta,xCaracterFormula,1));
            End;
            xCaracterFormula := xCaracterFormula + 1;
         End;
         if xTieneConstante then
         Begin
            xCuenta := StringReplace(xCuenta, xConstante, '', [rfreplaceall]);
            xCuenta := StringReplace(xCuenta, '$', '', [rfreplaceall]);
            xCuenta := StringReplace(xCuenta, '+', '', [rfreplaceall]);
            xCuenta := StringReplace(xCuenta, '-', '', [rfreplaceall]);
         End;
         xCuenta := trim(xCuenta);

         xSQL := 'Select round(sum(case when CCOSID like ''11%'' '
            +    '            then case when CNTDH=''D'' then CNTDEBEMN else -CNTHABEMN end end),0) PRINCIPAL, '
            +    '       round(sum(case when CCOSID like ''64%'' '
            +    '            then case when CNTDH=''D'' then CNTDEBEMN else -CNTHABEMN end end),0) MINKA '
            +    '  from CNT301 '
            +    ' where CIAID='+quotedstr(dblcCia.Text)
            +    '   and CUENTAID like '+quotedstr(xCuenta+'%')
            +    '   and CNTANOMM='+quotedstr(xAnoMes);
         DMFAC.cdsQry.Close;
         DMFAC.cdsQry.DataRequest(xSQL);
         DMFAC.cdsQry.Open;

         If DMFAC.cdsQry.RecordCount>0 then
         Begin
            if xTieneConstante then
            begin
               xConstante := StringReplace(xConstante, '$', '', [rfreplaceall]);
               DMFAC.cdsQry.Edit;
               DMFAC.cdsQry.FieldByName('PRINCIPAL').AsFloat := DMFAC.cdsQry.FieldByName('PRINCIPAL').AsFloat
                                                               +strtofloat(xConstante);
               DMFAC.cdsQry.Post;
            end;
            if (copy(xCuenta,1,2)='92') or (copy(xCuenta,1,2)='93') or (copy(xCuenta,1,2)='94') or (copy(xCuenta,1,2)='95') then
            Begin
               xTotBazarAdm := xTotBazarAdm + DMFAC.cdsQry.FieldByName('PRINCIPAL').AsFloat;
               xTotMinkaAdm := xTotMinkaAdm + DMFAC.cdsQry.FieldByName('MINKA').AsFloat;
            End;

            xTotBazar := xTotBazar + DMFAC.cdsQry.FieldByName('PRINCIPAL').AsFloat;
            xTotMinka := xTotMinka + DMFAC.cdsQry.FieldByName('MINKA').AsFloat;
            DMFAC.cdsQry5.Append;
            DMFAC.cdsQry5.FieldByName('CIA').AsString := dblcCia.Text+' '+edtCia.Text;
            DMFAC.cdsQry5.FieldByName('FECHA_FIN').AsString := datetostr(dtpHasta.Date);
            DMFAC.cdsQry5.FieldByName('ORDENLINEA').AsInteger := xNumOrden;
            DMFAC.cdsQry5.FieldByName('CUENTAID').AsString := xCuenta;
            DMFAC.cdsQry5.FieldByName('TIPO').AsString := uppercase(DMFAC.cdsQry4.FieldByName('DBALDES').AsString);
            DMFAC.cdsQry5.FieldByName('DBALID').AsString := DMFAC.cdsQry4.FieldByName('DBALID').AsString;
            DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat := DMFAC.cdsQry.FieldByName('PRINCIPAL').AsFloat;
            DMFAC.cdsQry5.FieldByName('MINKA').AsFloat := DMFAC.cdsQry.FieldByName('MINKA').AsFloat;
            DMFAC.cdsQry5.FieldByName('MONTO_TOTAL').AsFloat := DMFAC.cdsQry.FieldByName('PRINCIPAL').AsFloat
                                                               +DMFAC.cdsQry.FieldByName('MINKA').AsFloat;
            DMFAC.cdsQry5.FieldByName('SIGNO').AsString := '-';
            DMFAC.cdsQry5.Post;
         End;
      End;

   ///////////////////////////////////////////
   /////////////// SubTotales  ///////////////
   ///////////////////////////////////////////
      if (DMFAC.cdsQry4.FieldByName('DBALTITULO').AsString = 'N')
         and (DMFAC.cdsQry4.FieldByName('DBALSUBTOT').AsString = 'S') then
      Begin
         xTotBazar := 0;
         xTotMinka := 0;
         xPosicTotales := 1;
         while xPosicTotales<length(DMFAC.cdsQry4.FieldByName('DBALFORM').AsString) do
         Begin
            xDBalId := copy(DMFAC.cdsQry4.FieldByName('DBALFORM').AsString,
                            xPosicTotales,10);
            if DMFAC.cdsQry5.Locate('DBALID',xDBalId,[loCaseInsensitive]) then
            Begin
               xTotBazar := xTotBazar + DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat;
               xTotMinka := xTotMinka + DMFAC.cdsQry5.FieldByName('MINKA').AsFloat;
            End;
            xPosicTotales := xPosicTotales+11;
         End;

         DMFAC.cdsQry5.Append;
         DMFAC.cdsQry5.FieldByName('CIA').AsString := dblcCia.Text+' '+edtCia.Text;
         DMFAC.cdsQry5.FieldByName('FECHA_FIN').AsString := datetostr(dtpHasta.Date);
         DMFAC.cdsQry5.FieldByName('ORDENLINEA').AsInteger := xNumOrden;
         DMFAC.cdsQry5.FieldByName('TIPO').AsString := uppercase(DMFAC.cdsQry4.FieldByName('DBALDES').AsString);
         DMFAC.cdsQry5.FieldByName('DBALID').AsString := DMFAC.cdsQry4.FieldByName('DBALID').AsString;
         DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat := xTotBazar;
         DMFAC.cdsQry5.FieldByName('MINKA').AsFloat := xTotMinka;
         DMFAC.cdsQry5.FieldByName('MONTO_TOTAL').AsFloat := xTotBazar + xTotMinka;
         DMFAC.cdsQry5.FieldByName('SIGNO').AsString := '-';
      End;

      xNumOrden := xNumOrden+1;

      DMFAC.cdsQry4.Next;
   End;

   DMFAC.cdsQry5.Append;
   DMFAC.cdsQry5.FieldByName('CIA').AsString := dblcCia.Text+' '+edtCia.Text;
   DMFAC.cdsQry5.FieldByName('FECHA_FIN').AsString := datetostr(dtpHasta.Date);
   DMFAC.cdsQry5.FieldByName('ORDENLINEA').AsInteger := xNumOrdGasAdm;
   DMFAC.cdsQry5.FieldByName('TIPO').AsString := 'GASTOS DE ADMINISTRACIÓN';
   DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat := xTotBazarAdm;
   DMFAC.cdsQry5.FieldByName('MINKA').AsFloat := xTotMinkaAdm;
   DMFAC.cdsQry5.FieldByName('MONTO_TOTAL').AsFloat := xTotBazarAdm+xTotMinkaAdm;
   DMFAC.cdsQry5.FieldByName('SIGNO').AsString := '-';
   DMFAC.cdsQry5.Post;

   DMFAC.cdsQry5.First;
   while not DMFAC.cdsQry5.EOF do
   begin
      if (DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat
         +DMFAC.cdsQry5.FieldByName('MINKA').AsFloat
         +DMFAC.cdsQry5.FieldByName('MONTO_TOTAL').AsFloat)=0 then
         DMFAC.cdsQry5.Delete
      else
      Begin
         if DMFAC.cdsQry5.FieldByName('SIGNO').AsString='-' then
         begin
            DMFAC.cdsQry5.Edit;
            DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat := -1*DMFAC.cdsQry5.FieldByName('PRINCIPAL').AsFloat;
            DMFAC.cdsQry5.FieldByName('MINKA').AsFloat := -1*DMFAC.cdsQry5.FieldByName('MINKA').AsFloat;
            DMFAC.cdsQry5.FieldByName('MONTO_TOTAL').AsFloat := -1*DMFAC.cdsQry5.FieldByName('MONTO_TOTAL').AsFloat;
            DMFAC.cdsQry5.Post;
         end;
         DMFAC.cdsQry5.Next;
      End;
   end;

   DMFAC.cdsQry5.IndexFieldNames := 'ORDENLINEA';
   DMFAC.cdsQry5.First;
end;
// Fin HPC_201505_FAC

// Inicio HPC_201505_FAC
procedure TFRepTiendas.bbtnEstGGPPxlsClick(Sender: TObject);
begin
   bbtnEstGGPPData;
//
// Lleva a Excel
   dtgData.DataSource := DMFAC.dsQry5;
   Try
      DMFAC.HojaExcel('ESTADO GYP POR CCOSTO', DMFAC.dsQry5, dtgData);
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
   DMFAC.cdsQry5.IndexFieldNames := '';
end;
// Fin HPC_201505_FAC

procedure TFRepTiendas.sbDisenoRepClick(Sender: TObject);
begin
   cbDiseno.checked := Not cbDiseno.checked;
end;

End.


