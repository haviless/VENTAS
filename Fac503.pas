Unit Fac503;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook, StrContainer,
   Grids, Wwdbigrd, Wwdbgrid, ppCache, ppDB, ppDBPipe, ppComm, ppRelatv,
   ppProd, ppClass, ppReport, ppCtrls, ppBands, ppVar, ppPrnabl, dbclient,
   db, wwClient, variants, ppEndUsr, ppParameter;

Type
   TFImpresionConcurso = Class(TForm)
      Bevel1: TBevel;
      dbgRecibos4ta: TwwDBGrid;
      bbtnImprime: TBitBtn;
      ppReportePDT: TppReport;
      ppDBReportePDT: TppDBPipeline;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppDetailBand1: TppDetailBand;
      ppSummaryBand1: TppSummaryBand;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      edtNomArch2: TEdit;
      ppd4: TppDesigner;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      Label5: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      Label6: TLabel;
      dblcArea: TwwDBLookupCombo;
      edtArea: TEdit;
      Label7: TLabel;
      dblcPremio: TwwDBLookupCombo;
      edtPremio: TEdit;
      bbtnBusca: TBitBtn;
      bbtnImprimeCert: TBitBtn;
      ppd1: TppDesigner;
      ppr1: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand2: TppSummaryBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppParameterList1: TppParameterList;
      pnlDatosxLinea: TPanel;
      lblNroInscripcion: TLabel;
      lblNombreAutor: TLabel;
      lblpseudonimo: TLabel;
      lblTituloObra: TLabel;
      lblLocalidad: TLabel;
      lblTelefono: TLabel;
      lblEMail: TLabel;
      dbeNroInscripcion: TwwDBEdit;
      dbeNombreAutor: TwwDBEdit;
      dbeSeudonimo: TwwDBEdit;
      dbeTituloObra: TwwDBEdit;
      dbeLocalidad: TwwDBEdit;
      dbeTelefono: TwwDBEdit;
      dbeEMail: TwwDBEdit;
      bbtnGrabar: TBitBtn;
      bbtnCancelar: TBitBtn;
      dbgRecibos4taIButton: TwwIButton;

      Procedure bbtnOkClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnImprimeClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Function FRound(xReal: DOUBLE; xEnteros, xDecimal: Integer): DOUBLE;
      Procedure FormShow(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnBuscaClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcAreaExit(Sender: TObject);
      Procedure dblcPremioExit(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
      Procedure bbtnImprimeCertClick(Sender: TObject);
      Procedure dbgRecibos4taDblClick(Sender: TObject);
    procedure bbtnGrabarClick(Sender: TObject);
    procedure dbgRecibos4taIButtonClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgRecibos4taKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   Private
    { Private declarations }
      xTipoProv: String;
      xSelDoc: String;
      xsArchivoPs4: Boolean;
      xsArchivo4ta: Boolean;
      xsArchivoAFPnet: Boolean;
      Procedure CargaDataSource;

   Public
    { Public declarations }
      Function OperClientDataSet(cdsOrigen: TwwClientDataSet; wExpresion, wCondicion: String): Double;

   End;

Procedure OPTransferenciaPDT; stdcall;

Exports
   OPTransferenciaPDT;

Var
   FImpresionConcurso: TFImpresionConcurso;
   wRUCCIA: String;
   wbNuevo : Boolean;

Implementation

Uses FacDM;

{$R *.DFM}

Procedure OPTransferenciaPDT;
Var
   xSQL: String;
Begin

   FImpresionConcurso := TFImpresionConcurso.Create(Application);

   DMFAC.cdsCia.Close;
   xSQL := 'SELECT CIAID, CIARUC, CIADES FROM TGE101 GROUP BY CIAID, CIARUC, CIADES';
   DMFAC.cdsCia.ProviderName := 'dspTGE';
   DMFAC.cdsCia.DataRequest(xSQL);
   DMFAC.cdsCia.Open;

   FImpresionConcurso.ShowModal;

End;

Procedure TFImpresionConcurso.bbtnOkClick(Sender: TObject);
Var
   xLinea: String;
Begin
// verificacion de datos
   DMFAC.cdsQry3.DisableControls;
   DMFAC.cdsQry3.First;
   While Not DMFAC.cdsQry3.EOF Do
   Begin
      If length(trim(DMFAC.cdsQry3.fieldbyname('PROVRUC').AsString)) = 0 Then
      Begin
         ShowMessage('Falta RUC para proveedor ' + DMFAC.cdsQry3.fieldbyname('PROV').AsString
            + chr(13) + ' Registro:' + DMFAC.cdsQry3.fieldbyname('CPNOREG').AsString);
         DMFAC.cdsQry3.EnableControls;
         exit;
      End;
      If length(trim(DMFAC.cdsQry3.fieldbyname('PROVAPEPAT').AsString)) = 0 Then
      Begin
         ShowMessage('Falta APELLIDO PATERNO para proveedor ' + DMFAC.cdsQry3.fieldbyname('PROV').AsString
            + chr(13) + ' Registro:' + DMFAC.cdsQry3.fieldbyname('CPNOREG').AsString);
         DMFAC.cdsQry3.EnableControls;
         exit;
      End;
      If length(trim(DMFAC.cdsQry3.fieldbyname('PROVAPEMAT').AsString)) = 0 Then
      Begin
         ShowMessage('Falta APELLIDO MATERNO para proveedor ' + DMFAC.cdsQry3.fieldbyname('PROV').AsString
            + chr(13) + ' Registro:' + DMFAC.cdsQry3.fieldbyname('CPNOREG').AsString);
         DMFAC.cdsQry3.EnableControls;
         exit;
      End;
      If length(trim(DMFAC.cdsQry3.fieldbyname('PROVNOMBRE').AsString)) = 0 Then
      Begin
         ShowMessage('Falta NOMBRE para proveedor ' + DMFAC.cdsQry3.fieldbyname('PROV').AsString
            + chr(13) + ' Registro:' + DMFAC.cdsQry3.fieldbyname('CPNOREG').AsString);
         DMFAC.cdsQry3.EnableControls;
         exit;
      End;
      DMFAC.cdsQry3.Next;
   End;

   Screen.Cursor := crHourGlass;

//   scFILES.Lines.Clear;

   DMFAC.cdsQry3.First;
   While Not DMFAC.cdsQry3.EOF Do
   Begin
      xLinea := '';
      xLinea := DMFAC.cdsQry3.fieldbyname('PROVRUC').AsString; //1
      xLinea := xLinea + '|' + DMFAC.cdsQry3.fieldbyname('PROVAPEPAT').AsString; // 2
      xLinea := xLinea + '|' + DMFAC.cdsQry3.fieldbyname('PROVAPEMAT').AsString; // 3
      xLinea := xLinea + '|' + DMFAC.cdsQry3.fieldbyname('PROVNOMBRE').AsString; // 4
      xLinea := xLinea + '|' + copy(DMFAC.cdsQry3.fieldbyname('CPSERIE').AsString, 1, 3); // 5
      xLinea := xLinea + '|' + copy(DMFAC.cdsQry3.fieldbyname('CPNODOC').AsString, 1, 8); // 6
      xLinea := xLinea + '|' + datetostr(DMFAC.cdsQry3.fieldbyname('CPFEMIS').AsDateTime); // 7
      xLinea := xLinea + '|' + FormatFloat('###########0.00', DMFAC.cdsQry3.fieldbyname('MTOTOT').AsFloat); // 8

      If DMFAC.cdsQry3.fieldbyname('RTA4TA').AsFloat > 0 Then
         xLinea := xLinea + '|' + '1'
      Else
         xLinea := xLinea + '|' + '0'; // 9

      xLinea := xLinea + '|' + '10'; // 10

      If DMFAC.cdsQry3.fieldbyname('RTAIES').AsFloat > 0 Then
         xLinea := xLinea + '|' + '1'
      Else
         xLinea := xLinea + '|' + ''; // 11

// aqui agregar número de exoneración
      xLinea := xLinea + '|' + copy(DMFAC.cdsQry3.fieldbyname('PROVEXONER').AsString, 1, 8); //
      xLinea := xLinea + '|'; // 12
//      scFILES.Lines.Add(xLinea);
      DMFAC.cdsQry3.Next;
   End;
   Screen.Cursor := crDefault;

   DMFAC.cdsQry3.EnableControls;
   ShowMessage('Transferencia Realizada');
End;

Procedure TFImpresionConcurso.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFImpresionConcurso.bbtnImprimeClick(Sender: TObject);
Var
   x10: Integer;
Begin
   DMFAC.cdsQry3.DisableControls;
   If DMFAC.cdsQry3.RecordCount = 0 Then
   Begin
      ShowMessage('No existe Detalle a Imprimir');
      exit;
   End;
   ppDBReportePDT.DataSource := DMFAC.dsQry3;

   ppReportePDT.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\ReporteCertificadoPremio.rtm';

   ppReportePDT.Template.LoadFromFile;

   If cbDisenoRep.Checked Then
      ppd4.ShowModal
   Else
   Begin
      ppReportePDT.Print;

      ppReportePDT.Stop;

      x10 := Self.ComponentCount - 1;
      While x10 >= 0 Do
      Begin
         If Self.Components[x10].ClassName = 'TppGroup' Then
         Begin
            Self.Components[x10].Free;
         End;
         x10 := x10 - 1;
      End;
      DMFAC.cdsQry3.EnableControls;
      ppDBReportePDT.DataSource := Nil;
   End;
End;

Procedure TFImpresionConcurso.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMFAC.cdsTDoc.Filtered := False;
   DMFAC.cdsTDoc.Filter := '';
   DMFAC.cdsQry3.close;
   Action := caFree;
End;

Function TFImpresionConcurso.FRound(xReal: DOUBLE; xEnteros, xDecimal: Integer): DOUBLE;
Var
   xNum: String;
   code: Integer;
   xNReal: DOUBLE;
Begin
   xNum := Floattostrf(xReal, ffFixed, xEnteros, xDecimal);
   Val(xNum, xNReal, code);
   Result := xNReal;
End;

Function TFImpresionConcurso.OperClientDataSet(cdsOrigen: TwwClientDataSet; wExpresion, wCondicion: String): Double;
Var
   cdsClone: TwwClientDataSet;
   bmk: TBookmark;
   Agg: TAggregate;
Begin
   result := 0;

   If trim(wExpresion) = '' Then Exit;

   bmk := cdsOrigen.GetBookmark;
   cdsClone := TwwClientDataSet.Create(Nil);
   Try

      With cdsClone Do
      Begin
         CloneCursor(cdsOrigen, True);

         Agg := Aggregates.Add;
         Agg.AggregateName := 'OPER';
         Agg.Expression := wExpresion;
         Agg.Active := True;

         If Trim(wCondicion) <> '' Then
         Begin
            Filtered := False;
            Filter := wCondicion;
            Filtered := True;
         End;

         If Aggregates.Items[Aggregates.IndexOf('OPER')].Value <> NULL Then
            result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;

         Aggregates.Clear;

      End;

      cdsOrigen.GotoBookmark(bmk);
      cdsOrigen.FreeBookmark(bmk);

   Finally
      cdsClone.Free;
   End;
End;

Procedure TFImpresionConcurso.FormShow(Sender: TObject);
Var
   xSQL: String;
Begin

   DMFAC.cdsQry16.Close;
   xSQL := 'SELECT CIAID,ARECONCURID,ARECONCURDES FROM CCUL_CONCUR_AREA GROUP BY CIAID,ARECONCURID,ARECONCURDES';
   DMFAC.cdsQry16.ProviderName := 'dspTGE';
   DMFAC.cdsQry16.DataRequest(xSQL);
   DMFAC.cdsQry16.Open;

   DMFAC.cdsQry15.Close;
   xSQL := 'SELECT CIAID, PREMIOID, PREMIODES FROM CCUL_CONCUR_PREM GROUP BY CIAID, PREMIOID, PREMIODES';
   DMFAC.cdsQry15.ProviderName := 'dspTGE';
   DMFAC.cdsQry15.DataRequest(xSQL);
   DMFAC.cdsQry15.Open;

//   edtNomArch2.TEXT := ExtractFilePath(application.ExeName);
   xSQL := 'SELECT * FROM CCUL_CONCUR_PREM WHERE 1<>1';
   DMFAC.cdsFact2.Close;
   DMFAC.cdsFact2.DataRequest(xSQL);
   DMFAC.cdsFact2.Open;

End;

Procedure TFImpresionConcurso.FormCreate(Sender: TObject);
Begin
   pnlDatosxLinea.Visible := False;

   dblcCia.LookupTable := Nil;
   dblcCia.LookupField := '';
   dblcCia.DataSource := Nil;
   dblcCia.DataField := '';

   dblcPremio.LookupTable := Nil;
   dblcPremio.LookupField := '';
   dblcPremio.DataSource := Nil;
   dblcPremio.DataField := '';

   dblcArea.LookupTable := Nil;
   dblcArea.LookupField := '';
   dblcArea.DataSource := Nil;
   dblcArea.DataField := '';

   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');
   DMFAC.FiltraTabla(DMFAC.cdsQry15, 'CCUL_CONCUR_PREM', 'PREMIOID');
   DMFAC.FiltraTabla(DMFAC.cdsQry16, 'CCUL_CONCUR_AREA', 'ARECONCURID');
   CargaDataSource;
End;

Procedure TFImpresionConcurso.CargaDataSource;
Begin
   dblcCia.LookupTable := DMFAC.cdsCia;
   dblcPremio.LookupTable := DMFAC.cdsQry15;
   dblcArea.LookupTable := DMFAC.cdsQry16;

// Cabecera
   dblcCia.LookupTable := DMFAC.cdsCia;
   dblcCia.LookupField := 'CIAID';
   dblcCia.Selected.clear;
   dblcCia.Selected.Add('CIAID'#9'4'#9'Cía');
   dblcCia.Selected.Add('CIADES'#9'20'#9'Nombre');

// Premio
   dblcPremio.LookupTable := DMFAC.cdsQry15;
   dblcPremio.LookupField := 'PREMIOID';
   dblcPremio.Selected.clear;
   dblcPremio.Selected.Add('PREMIOID'#9'4'#9'Premio');
   dblcPremio.Selected.Add('PREMIODES'#9'20'#9'Nombre del Premio');

// Área del Concurso
   dblcArea.LookupTable := DMFAC.cdsQry16;
   dblcArea.LookupField := 'ARECONCURID';
   dblcArea.Selected.clear;
   dblcArea.Selected.Add('ARECONCURID'#9'4'#9'Área');
   dblcArea.Selected.Add('ARECONCURDES'#9'20'#9'Nombre del Área');

// Datos por Línea de Registro
   dbeNroInscripcion.DataSource := DMFAC.dsQry3;
   dbeNroInscripcion.DataField := 'NROINSCRIP';
   dbeNroInscripcion.Enabled := False;

   dbeNombreAutor.DataSource := DMFAC.dsQry3;
   dbeNombreAutor.DataField := 'NOMBREAUTOR';

   dbeSeudonimo.DataSource := DMFAC.dsQry3;
   dbeSeudonimo.DataField := 'SEUDONIMO';

   dbeTituloObra.DataSource := DMFAC.dsQry3;
   dbeTituloObra.DataField := 'TITULO_OBRA';

   dbeLocalidad.DataSource := DMFAC.dsQry3;
   dbeLocalidad.DataField := 'LOCALIDAD';

   dbeTelefono.DataSource := DMFAC.dsQry3;
   dbeTelefono.DataField := 'TELEFONO';

   dbeEMail.DataSource := DMFAC.dsQry3;
   dbeEMail.DataField := 'EMAIL';
End;

Procedure TFImpresionConcurso.bbtnBuscaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   Screen.Cursor := crHourGlass;

   xSQL := ' Select A.CIAID, B.CIADES,   '
      + '           A.PREMIOID, C.PREMIODES, '
      + '           A.ARECONCURID, D.ARECONCURDES, '
      + '           A.NROINSCRIP, A.NOMBREAUTOR, A.SEUDONIMO, A.TITULO_OBRA, A.LOCALIDAD, A.TELEFONO, A.EMAIL, A.USERID, A.FREG '
      + '      from CCUL_CONCUR_PARTIC A, TGE101 B, CCUL_CONCUR_PREM C, CCUL_CONCUR_AREA D '
      + '     where A.CIAID= ' + Quotedstr(dblcCia.Text);
   If length(trim(dblcArea.Text)) > 0 Then
   Begin
      xSQL := xSQL + ' AND A.ARECONCURID= ' + Quotedstr(dblcArea.Text);
   End;

   If length(trim(dblcPremio.Text)) > 0 Then
   Begin
      xSQL := xSQL + ' AND A.PREMIOID= ' + Quotedstr(dblcPremio.Text);
   End;

   xSQL := xSQL + ' and B.CIAID=A.CIAID '
      + ' and C.CIAID=A.CIAID and C.PREMIOID=A.PREMIOID '
      + ' and D.CIAID=A.CIAID and D.ARECONCURID=A.ARECONCURID '
      + ' order by A.CIAID, A.PREMIOID, A.ARECONCURID, A.NROINSCRIP ';

   DMFAC.cdsQry3.filtered := false;
   DMFAC.cdsQry3.filter := '';
   DMFAC.cdsQry3.indexfieldnames := '';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.ProviderName := 'dspTGE';
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;

   DMFAC.cdsQry3.First;

   dbgRecibos4ta.Selected.clear;
   dbgRecibos4ta.Selected.Add('NROINSCRIP'#9'4'#9'Nro.');
   dbgRecibos4ta.Selected.Add('CIAID'#9'4'#9'Cía');
   dbgRecibos4ta.Selected.Add('CIADES'#9'6'#9'Descripción Compañía');
   dbgRecibos4ta.Selected.Add('PREMIOID'#9'6'#9'Cod.Premio');
   dbgRecibos4ta.Selected.Add('PREMIODES'#9'12'#9'Descripción Premio');
   dbgRecibos4ta.Selected.Add('ARECONCURID'#9'5'#9'Cod.Area');
   dbgRecibos4ta.Selected.Add('ARECONCURDES'#9'20'#9'Descripción Área');
   dbgRecibos4ta.Selected.Add('NOMBREAUTOR'#9'20'#9'Nombre Autor');
   dbgRecibos4ta.Selected.Add('SEUDONIMO'#9'15'#9'Seudónimo');
   dbgRecibos4ta.Selected.Add('TITULO_OBRA'#9'20'#9'Título Obra');
   dbgRecibos4ta.Selected.Add('LOCALIDAD'#9'15'#9'Localidad.');
   dbgRecibos4ta.Selected.Add('TELEFONO'#9'15'#9'Teléfono');
   dbgRecibos4ta.Selected.Add('EMAIL'#9'15'#9'Email');

   dbgRecibos4ta.DataSource := DMFAC.dsQry3;

   DMFAC.cdsQry3.EnableControls;

   Screen.Cursor := crDefault;

End;

Procedure TFImpresionConcurso.dblcCiaExit(Sender: TObject);
Begin

   edtCia.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE101', 'CIADES, FLAG', 'CIAID=' + QuotedStr(dblcCia.Text), 'CIADES');
   Filtracds(DMFAC.cdsQry15, 'SELECT * FROM CCUL_CONCUR_PREM WHERE CIAID=' + QuotedStr(dblcCia.Text) + '');
   Filtracds(DMFAC.cdsQry16, 'SELECT * FROM CCUL_CONCUR_AREA WHERE CIAID=' + QuotedStr(dblcCia.Text) + '');

End;

Procedure TFImpresionConcurso.dblcAreaExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CIAID=' + Quotedstr(dblcCia.Text) + ' AND ARECONCURID=' + QuotedStr(dblcArea.Text);
   edtArea.Text := DMFAC.BuscaQry('dspUltTGE', 'CCUL_CONCUR_AREA', 'ARECONCURDES', xWhere, 'ARECONCURDES');
End;

Procedure TFImpresionConcurso.dblcPremioExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CIAID=' + Quotedstr(dblcCia.Text) + ' AND PREMIOID=' + QuotedStr(dblcPremio.Text);
   edtPremio.Text := DMFAC.BuscaQry('dspUltTGE', 'CCUL_CONCUR_PREM', 'PREMIODES', xWhere, 'PREMIODES');

End;

Procedure TFImpresionConcurso.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenorep.Checked := Not cbDisenorep.Checked;
End;

Procedure TFImpresionConcurso.bbtnImprimeCertClick(Sender: TObject);
Var
   x10: Integer;
Begin
   DMFAC.cdsQry3.DisableControls;
   If DMFAC.cdsQry3.RecordCount = 0 Then
   Begin
      ShowMessage('No existe Detalle a Imprimir');
      exit;
   End;

   ppDBReportePDT.DataSource := DMFAC.dsQry3;

   ppR1.Template.FileName := ExtractFilePath(application.ExeName) + DMFAC.wRutaRpt + '\CertificadoPremio2015.rtm';

   ppR1.Template.LoadFromFile;

   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      ppR1.Print;

      ppR1.Stop;

      x10 := Self.ComponentCount - 1;
      While x10 >= 0 Do
      Begin
         If Self.Components[x10].ClassName = 'TppGroup' Then
         Begin
            Self.Components[x10].Free;
         End;
         x10 := x10 - 1;
      End;
      DMFAC.cdsQry3.EnableControls;
      ppDBReportePDT.DataSource := Nil;
   End;
End;

Procedure TFImpresionConcurso.dbgRecibos4taDblClick(Sender: TObject);
Begin
   wbNuevo := False;
   pnlDatosxLinea.Visible := True;
   DMFAC.cdsQry3.EnableControls;
End;

procedure TFImpresionConcurso.bbtnGrabarClick(Sender: TObject);
Var
   xSQL: String;
begin
   If wbNuevo then
      xSQL := 'Insert into CCUL_CONCUR_PARTIC(CIAID, PREMIOID, ARECONCURID, NROINSCRIP, '
         + '                                  NOMBREAUTOR, SEUDONIMO, TITULO_OBRA, '
         + '                                  LOCALIDAD, TELEFONO, EMAIL, USERID, FREG) '
         + '   Values ('+quotedstr(DMFAC.cdsQry3.FieldByName('CIAID').AsString)+','
         +               quotedstr(DMFAC.cdsQry3.FieldByName('PREMIOID').AsString)+','
         +               quotedstr(DMFAC.cdsQry3.FieldByName('ARECONCURID').AsString)+','
         +               inttostr(DMFAC.cdsQry3.FieldByName('NROINSCRIP').AsInteger)+','
         +               quotedstr(DMFAC.cdsQry3.FieldByName('NOMBREAUTOR').AsString)+','
         +               quotedstr(DMFAC.cdsQry3.FieldByName('SEUDONIMO').AsString)+','
         +               quotedstr(DMFAC.cdsQry3.FieldByName('TITULO_OBRA').AsString)+','
         +               quotedstr(DMFAC.cdsQry3.FieldByName('LOCALIDAD').AsString)+','
         +               quotedstr(DMFAC.cdsQry3.FieldByName('TELEFONO').AsString)+','
         +               quotedstr(DMFAC.cdsQry3.FieldByName('EMAIL').AsString)+','
         +               quotedstr(DMFAC.wUsuario)+','
         + '             sysdate) '
   Else
      xSQL := 'Update CCUL_CONCUR_PARTIC '
         + '      Set NOMBREAUTOR='+quotedstr(DMFAC.cdsQry3.FieldByName('NOMBREAUTOR').AsString)+','
         + '          SEUDONIMO='+quotedstr(DMFAC.cdsQry3.FieldByName('SEUDONIMO').AsString)+','
         + '          TITULO_OBRA='+quotedstr(DMFAC.cdsQry3.FieldByName('TITULO_OBRA').AsString)+','
         + '          LOCALIDAD='+quotedstr(DMFAC.cdsQry3.FieldByName('LOCALIDAD').AsString)+','
         + '          TELEFONO='+quotedstr(DMFAC.cdsQry3.FieldByName('TELEFONO').AsString)+','
         + '          EMAIL='+quotedstr(DMFAC.cdsQry3.FieldByName('EMAIL').AsString)+','
         + '          USERID='+quotedstr(DMFAC.wUsuario)+','
         + '          FREG=sysdate '
         + '    where CIAID='+quotedstr(DMFAC.cdsQry3.FieldByName('CIAID').AsString)
         + '      and PREMIOID='+quotedstr(DMFAC.cdsQry3.FieldByName('PREMIOID').AsString)
         + '      and ARECONCURID='+quotedstr(DMFAC.cdsQry3.FieldByName('ARECONCURID').AsString)
         + '      and NROINSCRIP='+inttostr(DMFAC.cdsQry3.FieldByName('NROINSCRIP').AsInteger);
   try
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
      ShowMessage('No se pudo actualizar los datos del Registro en el Concurso');
      exit;
   end;
   ShowMessage('Grabado correctamente');
end;

procedure TFImpresionConcurso.dbgRecibos4taIButtonClick(Sender: TObject);
var
   xSQL : String;
   xNroInscrip : Integer;
begin
   wbNuevo := True;
   pnlDatosxLinea.Visible := True;
   xSQL := 'Select max(NROINSCRIP) NROINSCRIP '
      + '     from CCUL_CONCUR_PARTIC '
      + '    where CIAID= ' + Quotedstr(dblcCia.Text)
      + '      and PREMIOID= ' + Quotedstr(dblcPremio.Text)
      + '      and ARECONCURID= ' + Quotedstr(dblcArea.Text);
   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;
   If DMFAC.cdsQry.RecordCount=0 then
      xNroInscrip := 1
   Else
      xNroInscrip := DMFAC.cdsQry.FieldByName('NROINSCRIP').AsInteger + 1;
   DMFAC.cdsQry3.Append;
   DMFAC.cdsQry3.FieldByName('CIAID').AsString       := dblcCia.Text;
   DMFAC.cdsQry3.FieldByName('CIADES').AsString      := edtCia.Text;
   DMFAC.cdsQry3.FieldByName('PREMIOID').AsString    := dblcPremio.Text;
   DMFAC.cdsQry3.FieldByName('PREMIODES').AsString   := edtPremio.Text;
   DMFAC.cdsQry3.FieldByName('ARECONCURID').AsString := dblcArea.Text;
   DMFAC.cdsQry3.FieldByName('ARECONCURDES').AsString:= edtArea.Text;
   DMFAC.cdsQry3.FieldByName('NROINSCRIP').AsInteger := xNroInscrip;
   DMFAC.cdsQry3.Post;
end;

procedure TFImpresionConcurso.bbtnCancelarClick(Sender: TObject);
begin
   pnlDatosxLinea.Visible := False;
end;

procedure TFImpresionConcurso.dbgRecibos4taKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
   xSQL : String;
begin
   if (key=VK_Delete) and (ssCtrl in Shift) then
   begin
      if MessageDlg('¿Esta Seguro de Eliminar Registro?',mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
         xSQL := 'Delete from CCUL_CONCUR_PARTIC '
            + '    where CIAID='+quotedstr(DMFAC.cdsQry3.FieldByName('CIAID').AsString)
            + '      and PREMIOID='+quotedstr(DMFAC.cdsQry3.FieldByName('PREMIOID').AsString)
            + '      and ARECONCURID='+quotedstr(DMFAC.cdsQry3.FieldByName('ARECONCURID').AsString)
            + '      and NROINSCRIP='+inttostr(DMFAC.cdsQry3.FieldByName('NROINSCRIP').AsInteger);
         try
            DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            ShowMessage('No se pudo Eliminar el Registro del Concurso');
            exit;
         end;
         DMFAC.cdsQry3.Delete;
         ShowMessage('Ok');
      end;
   end;
end;

End.

