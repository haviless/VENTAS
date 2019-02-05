Unit Fac765;

// Actualizaciones
// HPC_201604_FAC 19/10/2016 Copia función de módulo Adquisiciones que permite imprimir Etiquetas de Precios

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Wwkeycb, ExtCtrls, Buttons, wwExport, ppEndUsr,
   ppParameter, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppBarCod,
   ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe;

Type
   TFToolLPrecios = Class(TForm)
      pnlTool: TPanel;
      bbtnTransfExl: TBitBtn;
      sdGraba: TSaveDialog;
      Timer1: TTimer;
      bbtnCie: TBitBtn;
      ppdb4: TppDBPipeline;
      ppr4: TppReport;
      ppHeaderBand3: TppHeaderBand;
      ppDetailBand3: TppDetailBand;
      ppDBBarCode1: TppDBBarCode;
      ppDBText12: TppDBText;
      ppLabel18: TppLabel;
      ppDBText13: TppDBText;
      ppLabel19: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppImage1: TppImage;
      ppImage2: TppImage;
      ppFooterBand3: TppFooterBand;
      ppParameterList2: TppParameterList;
      ppd4: TppDesigner;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      Procedure bbtnTransfExlClick(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure bbtnCieClick(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolLPrecios: TFToolLPrecios;
   xAccesoBotones: Boolean;

Implementation

Uses FAcDM, oaVE2000;

{$R *.dfm}

Procedure TFToolLPrecios.bbtnTransfExlClick(Sender: TObject);
Begin
   If Not sdGraba.Execute Then Exit;

   GLPrecio.FMant.dbgFiltro.ExportOptions.Options := [esoDblQuoteFields, esoShowFooter];
   GLPrecio.FMant.dbgFiltro.ExportOptions.Options := GLPrecio.FMant.dbgFiltro.ExportOptions.Options + [esoShowTitle];
   GLPrecio.FMant.dbgFiltro.ExportOptions.Options := GLPrecio.FMant.dbgFiltro.ExportOptions.Options + [esoShowHeader];
   GLPrecio.FMant.dbgFiltro.ExportOptions.Options := GLPrecio.FMant.dbgFiltro.ExportOptions.Options + [esoShowRecordNo];
   GLPrecio.FMant.dbgFiltro.ExportOptions.ExportType := wwgetSYLK;
   GLPrecio.FMant.dbgFiltro.ExportOptions.FileName := sdGraba.FileName;
   GLPrecio.FMant.dbgFiltro.ExportOptions.Save;
End;

Procedure TFToolLPrecios.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolLPrecios';
// Inicio HPC_201311_FAC
// incluye al usuario de tipo administrador en el destroy del timer
{
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolLPrecios);
      xAccesoBotones := True;
   end;
}
   If (DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P') Then
   Else
   Begin
      If Not xAccesoBotones Then
      Begin
         DMFAC.AccesosUsuariosR(DMFAC.wModulo, DMFAC.wUsuario, '2', FToolLPrecios);
         xAccesoBotones := True;
      End;
   End;
   Timer1.Destroy;
End;

Procedure TFToolLPrecios.bbtnCieClick(Sender: TObject);
Var
   cOk, xSQL, cArtMod: String;
   wlAno, wlMes, wlDia: word;
Begin

   DecodeDate(strtodate(datetostr(Date)), wlAno, wlMes, wlDia);

   If GLPrecio.FMant.cds2.fieldbyname('TLISTAID').AsString = '' Then
   Begin
      ShowMessage('Error : elegir Lista de precios');
      Exit;
   End;

   xSQL := 'Select * from FAC201 '
      + 'where CIAID=' + quotedstr(GLPrecio.FMant.cds2.fieldbyname('CIAID').AsString)
      + '  and TLISTAID=''' + GLPrecio.FMant.cds2.fieldbyname('TLISTAID').AsString + ''' '
      + '  and ARTID=' + quotedstr(GLPrecio.FMant.cds2.fieldbyname('ARTID').AsString);
   DMFAC.cdsQry2.Close;
   DMFAC.cdsQry2.IndexFieldNames := '';
   DMFAC.cdsQry2.Filter := '';
   DMFAC.cdsQry2.Filtered := False;
   DMFAC.cdsQry2.DataRequest(xSQL);
   DMFAC.cdsQry2.Open;

   xSQL := 'SELECT A.ARTID, P.ARTDES, R.UTILIDAD, A.STKFIN STKSACTG, A.ALMID, '
      + '          ROUND(C.PREVEN,2) PREVEN, '
      + '          ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_IGV, '
      + '          ROUND( NVL(C.PREVEN,0),2) + ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_CAL, '
      + '          ROUND(C.PREVENPRO,2) PREVENPRO, '
      + '          ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_IGVP, '
      + '          ROUND( NVL(C.PREVENPRO,0), 2) + ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_PRO, '
      + '          CASE WHEN PREVENPRO>0 '
      + '               THEN ROUND( NVL(C.PREVENPRO,0), 2) + ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) '
      + '               ELSE ROUND( NVL(C.PREVEN,0),2) + ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) '
      + '           END PRECIO, '
      + '          C.TLISTAID '
      + '     FROM LOG319 A, NUMEROS B, FAC201 C, TGE108 D, TGE103 M, TGE205 P, ALM_TIP_ART Q, ALM_LIN_COM R '
      + '    WHERE A.CIAID=' + quotedstr(DMFAC.cdsQry2.FieldByName('CIAID').AsString)
      + '      and A.LOGANOMM=' + quotedstr(inttostr(wlAno) + DMFAC.StrZero(inttostr(wlMes), 2))
      + '      and A.ARTID in (' + quotedstr(DMFAC.cdsQry2.FieldByName('ARTID').AsString) + ') '
      + '      and NUMERO<= A.STKFIN '
      + '      and C.CIAID=A.CIAID and C.TLISTAID=' + quotedstr(DMFAC.cdsQry2.FieldByName('TLISTAID').AsString)
      + '      and C.TINID=A.TINID and C.ARTID=A.ARTID '
      + '      and D.TASAFLG=''I'' '
      + '      and M.TMONID(+)=C.LPRETMONID '
      + '      and P.CIAID(+)=A.CIAID and P.TINID(+)=A.TINID and P.ARTID(+)=A.ARTID '
      + '      and Q.TIPART(+)=P.TIPART '
      + '      AND R.LINCOM(+)=Q.LINCOM '
      + '    order by A.ALMID, A.ARTID, B.NUMERO';
   DMFAC.cdsQry3.Close;
   DMFAC.cdsQry3.DataRequest(xSQL);
   DMFAC.cdsQry3.Open;

   cArtMod := '';
   cOk := 'S';
   DMFAC.cdsQry3.First;

   If cOk = 'N' Then
   Begin
      xSQL := 'SELECT A.ARTID, A.ARTDES, R.UTILIDAD, A.STKSACTG, ROUND(C.PREVEN,2) PREVEN, A.ALMID, '
         + 'ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_IGV, '
         + 'ROUND( NVL(C.PREVEN,0),2) + ROUND( NVL(C.PREVEN,0)*((D.TASACAN/100)), 2 ) PRECIO_CAL, '
         + 'ROUND(C.PREVENPRO,2) PREVENPRO, '
         + 'ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_IGVP, '
         + 'ROUND( NVL(C.PREVENPRO,0), 2) + ROUND( NVL(C.PREVENPRO,0)*((D.TASACAN/100)), 2) PRECIO_PRO, C.TLISTAID '
         + 'FROM LOG316 A, NUMEROS B, FAC201 C, TGE108 D, TGE103 M, TGE205 P, ALM_TIP_ART Q, ALM_LIN_COM R '
         + 'WHERE A.CIAID=''' + DMFAC.cdsQry2.FieldByName('CIAID').AsString + ''' '
         + 'and A.STKANO=''2007'' and A.ARTID IN (''' + DMFAC.cdsQry2.FieldByName('CIAID').AsString + ''') '
         + 'and NUMERO<= A.STKSACTG '
         + 'and A.CIAID=C.CIAID AND C.TLISTAID=''' + DMFAC.cdsQry2.FieldByName('TLISTAID').AsString + ''' and A.ARTID=C.ARTID AND A.TINID=C.TINID '
         + 'and D.TASAFLG=''I'' and C.LPRETMONID=M.TMONID(+) and A.CIAID=P.CIAID(+) AND A.TINID=P.TINID(+) AND A.ARTID=P.ARTID(+) '
         + 'and P.TIPART=Q.TIPART(+) AND Q.LINCOM=R.LINCOM(+) '
         + 'order by A.ARTID, NUMERO';
      DMFAC.cdsQry3.Close;
      DMFAC.cdsQry3.DataRequest(xSQL);
      DMFAC.cdsQry3.Open;
   End;

   ppdb4.DataSource := DMFAC.dsQry3;

   ppr4.Template.FileName := 'C:\DemaExes\RTMS\LOGSG\Dema\CodigoBarra04.rtm';
   ppr4.Template.LoadFromFile;
   Screen.Cursor := crDefault;

   If cbDisenoRep.Checked Then
   Begin
      ppd4.Report := ppr4;
      ppd4.ShowModal;
   End
   Else
   Begin
      ppr4.Print;
      ppdb4.DataSource := Nil;
      ppr4.Stop;
   End;
End;

Procedure TFToolLPrecios.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

End.

