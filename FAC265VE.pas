Unit FAC265VE;

// Actualizaciones
// HPC_201604_FAC 19/10/2016 Cambio de Tabla de Saldos de Stock de LOG316 a LOG337 y LOG319

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, ExtCtrls, Buttons, Mant, MsgDlgs, db;

Type
   TFLisPre = Class(TForm)
      pnl1: TPanel;
      Label14: TLabel;
      Label1: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      dblcLPrecio: TwwDBLookupCombo;
      edtLPrecio: TEdit;
      Z2bbtnAcepta: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      bbtnCombo: TBitBtn;
      Procedure Z2bbtnAceptaClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcLPrecioExit(Sender: TObject);
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure FormShow(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnComboClick(Sender: TObject);
   Private
  { Private declarations }
   Public
  { Public declarations }
      Procedure ToolCreateLPrecios(Sender: TObject);
      Procedure LPrecioInsert(Sender: TObject);
      Procedure LPrecioEdita(Sender: TObject; MantFields: TFields);
   End;

Var
   FLisPre: TFLisPre;
   wCia, wLPe, exCia: String;

Implementation

Uses FACDM, oaVe2000, Fac270, FAC765, FAC394;

{$R *.DFM}

Procedure TFLisPre.Z2bbtnAceptaClick(Sender: TObject);
Var
   xSQL: String;
   wlAno, wlMes, wlDia: word;
Begin
   If Length(Trim(edtCia.Text)) = 0 Then
   Begin
      Information('Ventas', 'Compañía no Válida');
      Exit;
   End;

   If Length(Trim(edtLPrecio.Text)) = 0 Then
   Begin
      Information('Ventas', 'Lista de Precios no Válida');
      Exit;
   End;

   Screen.Cursor := CrHourGlass;

   DecodeDate(DMFAC.DateS, wlAno, wlMes, wlDia);

   DMFAC.cdsCia.First;

{
   xSQL:='SELECT * FROM ( '
        +'SELECT CIAID, TLISTAID, TINID, GRARID, FAMID, SFAMID, ARTID, ARTDES, ARTCONT, UNMIDG, UNMIDU, '
        +   'LPRETMONID, TMONABR, LPREPREGMO, LPREPREUMO, LPREPREGIGV, LPREPDCTOG, '
        +   'sum(STKALM) STKALM, 0.00 STKEXHIB, 0.00 STKOTROS, 0.00 STKTOTAL, '
        +   'CASE WHEN LPRETMONID=''N'' THEN 0 ELSE ROUND(LPREPREGIGV*TCAMBIO,2) END PRECIOMN, '
        +   'CASE WHEN LPRETMONID=''D'' THEN 0 ELSE ROUND(LPREPREGIGV/TCAMBIO,2) END PRECIOME, '
        +   '0.00 COSTOMN, 0.00 COSTOME, '
        +   'MAX(NVL(STKSMAX,0)) STKSMAX, MAX(NVL(STKSMIN,0)) STKSMIN,  '
        +   'MAX(PRECIO_CAL) PRECIO_CAL, MAX(PRECIO_PRO) PRECIO_PRO, '
        +   'CASE WHEN MAX(NVL(STKSMIN,0))>0 AND sum(STKALM)<=MAX(NVL(STKSMIN,0)) THEN ''S'' ELSE ''N'' END FCOLOR, MARCA, MARDES '
        +'FROM ( '
        +  'SELECT A.TLISTAID, A.CIAID, A.LOCID, A.TINID, A.ALMID, A.GRARID, '
        +    'A.FAMID, A.SFAMID, A.ARTID, A.ARTDES, NVL(M.ARTCONT,0) ARTCONT, A.UNMIDG, A.UNMIDU, '
        +    'A.LPRETMONID, D.TMONABR, A.LPREPDCTOG, NVL(A.LPREPREGMO,0)LPREPREGMO, '
        +    'NVL(A.LPREPREUMO,0) LPREPREUMO, TCAMVBV TCAMBIO, '
        +    'round(NVL(A.LPREPREGMO,0)*((C.TASACAN/100)+1),2) LPREPREGIGV, '
        +    'ROUND( NVL(A.PREVEN,0),2) + ROUND( NVL(A.PREVEN,0)*((C.TASACAN/100)), 2 ) PRECIO_CAL, '
        +    'ROUND( NVL(A.PREVENPRO,0), 2) + ROUND( NVL(A.PREVENPRO,0)*((C.TASACAN/100)), 2) PRECIO_PRO, '
        +    '(NVL(B.STKSACTG,0)-NVL(B.STKRACTG,0)) STKALM, M.STKSMAX, M.STKSMIN, M.MARCA, X.MARDES ' //, S.ARTPCG '
        +  'FROM FAC201 A, '
        +    ' ( SELECT B.CIAID, B.LOCID, B.TINID, B.ALMID, B.GRARID, B.FAMID, B.SFAMID, B.ARTID, '
        +       'SUM(NVL(B.STKSACTG,0)) STKSACTG, SUM(NVL(B.STKRACTG,0)) STKRACTG '
        +     'FROM LOG316 B, TGE151 C '
        +     'WHERE B.CIAID='+QuotedStr(dblcCia.text)+' AND B.STKANO='+quotedstr(inttostr(wlAno))+' '
        +       'and B.CIAID=C.CIAID AND B.TINID=C.TINID AND B.ALMID=C.ALMID and NVL(ACTIVO,''N'')=''S'' '
        +     'GROUP BY B.CIAID, B.LOCID, B.TINID, B.ALMID, B.GRARID, B.FAMID, B.SFAMID, B.ARTID '
        +     'ORDER BY B.ARTID '
        +   ') B, TGE108 C, TGE103 D, TGE107 T, TGE205 M, ALM_MAR_ART X '
        +  'WHERE A.CIAID='+QuotedStr(dblcCia.text)+' '
        +    'AND A.TLISTAID='+QuotedStr(dblcLPrecio.text)+' '
        +    'AND (A.ACTIVO=''S'' OR A.ACTIVO IS NULL OR A.ACTIVO='' '') '
        +    'AND A.CIAID=B.CIAID(+) AND A.TINID=B.TINID(+) AND A.ARTID=B.ARTID(+) '
        +    'AND C.TASAFLG=''I'' AND A.LPRETMONID=D.TMONID '
        +    'AND T.FECHA(+)=to_Date(SYSDATE) '
        +    'AND A.CIAID=M.CIAID(+) AND A.TINID=M.TINID(+) AND A.ARTID=M.ARTID(+) '
        +    'AND M.MARCA=X.MARCA(+) '
        +  'ORDER BY ARTID '
        +  ') XX '
        +'group by CIAID, TLISTAID, TINID, GRARID, FAMID, SFAMID, ARTID, ARTDES, ARTCONT, UNMIDG, UNMIDU, '
        +         'LPRETMONID,TMONABR, LPREPREGMO, LPREPREUMO, LPREPREGIGV, LPREPDCTOG, TCAMBIO, MARCA, MARDES ' //ARTPCG '
        +'order by ARTID '
        +') SOLVISTA ';
}

   xSQL := 'SELECT * '
      + 'FROM  '
      + '(SELECT CIAID,TLISTAID,TINID,GRARID,FAMID,SFAMID,ARTID,'
      + '        ARTDES,ARTCONT,UNMIDG,UNMIDU,LPRETMONID,TMONABR,LPREPREGMO,'
      // + '        LPREPREUMO,LPREPREGIGV,LPREPDCTOG,sum(STKALM) STKALM,0.00 STKEXHIB,'
   + '        nvl(LPREPREUMO,0)LPREPREUMO,nvl(LPREPDCTOG,0)LPREPDCTOG,nvl(sum(STKALM),0) STKALM,0.00 STKEXHIB,'
      + '        0.00 STKOTROS,0.00 STKTOTAL,'
      + '        CASE  WHEN LPRETMONID = ''N'' THEN 0 ELSE ROUND(LPREPREGIGV * TCAMBIO, 2)  END PRECIOMN,'
      + '        CASE  WHEN LPRETMONID = ''D'' THEN 0 ELSE ROUND(LPREPREGIGV / TCAMBIO, 2)  END PRECIOME,'
      + '        0.00 COSTOMN,0.00 COSTOME,MAX(NVL(STKSMAX, 0)) STKSMAX,MAX(NVL(STKSMIN, 0)) STKSMIN,'
      + '        MAX(PRECIO_CAL) PRECIO_CAL, MAX(PRECIO_PRO) PRECIO_PRO,'
      + '        CASE  WHEN MAX(NVL(STKSMIN, 0)) > 0 AND sum(STKALM) <= MAX(NVL(STKSMIN, 0)) THEN ''S'' ELSE ''N'' END FCOLOR,'
      + '        MARCA, MARDES,MAX(FULTPRECOMP)FULTPRECOMP,MAX(PREPROMFIN)PREPROMFIN,'
      + '        MAX(ULTPRECOMP)ULTPRECOMP,'
      + '        MAX(TASIGV)TASIGV,MAX(TASSERV)TASSERV,' //TASAS DE INTERES
      + '        ROUND(LPREPREGMO*(MAX(TASIGV)/100),2) TOTIGV,' //TOTAL IGV
      + '        ROUND(LPREPREGMO*(MAX(TASSERV)/100),2) TOTSERV,' // TOTAL SERVICIOS
      + '        ROUND(LPREPREGMO + (LPREPREGMO * (MAX(TASIGV) / 100)) + (LPREPREGMO * (MAX(TASSERV) / 100)),2) LPREPREGIGV ' //PRECIO LISTA
      + ' FROM (SELECT A.TLISTAID, A.CIAID,A.LOCID, A.TINID,A.ALMID,A.GRARID,A.FAMID,A.SFAMID,A.ARTID, A.ARTDES,'
      + '              NVL(M.ARTCONT, 0) ARTCONT,A.UNMIDG,A.UNMIDU,A.LPRETMONID,D.TMONABR,A.LPREPDCTOG,NVL(A.LPREPREGMO, 0) LPREPREGMO,'
      + '              NVL(A.LPREPREUMO, 0) LPREPREUMO,TCAMVBV TCAMBIO,'
      + '              ROUND(NVL(A.LPREPREGMO, 0) * ((C.TASACAN / 100) + 1),2) LPREPREGIGV,'
      + '              ROUND(NVL(A.PREVEN, 0), 2) + ROUND(NVL(A.PREVEN, 0) * ((C.TASACAN / 100)), 2) PRECIO_CAL,'
      + '              ROUND(NVL(A.PREVENPRO, 0), 2) + ROUND(NVL(A.PREVENPRO, 0) * ((C.TASACAN / 100)), 2) PRECIO_PRO,'
      + '              NVL(STKFIN,0) STKALM, M.STKSMAX,M.STKSMIN,M.MARCA,X.MARDES,FULTPRECOMP,PREPROMFIN,ULTPRECOMP, '
      + '              C.TASACAN TASIGV, '
      + '              NVL((SELECT G.TASA  From TGE101 E,TGE205 F,TGE128 G '
      + '              WHERE E.CIAID=A.CIAID AND E.FLGSERV=''S'' AND '
      + '              E.CIAID=F.CIAID AND F.ARTID=A.ARTID AND F.FLGSERV=''S'' AND  '
      + '              G.TREGID=''07''),0) TASSERV '
      + '        FROM FAC201 A,LOG337 B,TGE108 C,TGE103 D,TGE107 T,TGE205 M,ALM_MAR_ART X '
      + ' WHERE A.CIAID         = ' + QuotedStr(dblcCia.text)
      + '     AND A.TLISTAID    = ' + QuotedStr(dblcLPrecio.text)
      + '     AND (A.ACTIVO     = ''S'' OR A.ACTIVO IS NULL OR A.ACTIVO = '' '') '
      + '     AND B.CIAID(+)    = A.CIAID '
      + '     AND B.LOGANOMM(+) = TO_CHAR(SYSDATE,''YYYY'')||TO_CHAR(SYSDATE,''MM'') '
      + '     AND B.ARTID(+)    = A.ARTID '
      + '     AND A.LPRETMONID  = D.TMONID '
      + '     AND T.FECHA(+)    = to_Date(SYSDATE) '
      + '     AND A.CIAID       = M.CIAID(+) '
      + '     AND A.TINID       = M.TINID(+) '
      + '     AND A.ARTID       = M.ARTID(+) '
      + '     AND M.MARCA       = X.MARCA(+) '
      + '     AND C.TASAFLG     = ''I'' '
      + '   ORDER BY ARTID) XX '
      + '   group by CIAID,TLISTAID,TINID,GRARID,FAMID,SFAMID,ARTID,ARTDES,ARTCONT,'
      + '            UNMIDG,UNMIDU,LPRETMONID,TMONABR,LPREPREGMO,LPREPREUMO,LPREPREGIGV,'
      + '            LPREPDCTOG,TCAMBIO,MARCA,MARDES '
      + '   order by ARTID) SOLVISTA ';
   Try

      FLPrecio := TFLPrecio.Create(Application);
      FToolLPrecios := TFToolLPrecios.Create(Application);

      GLPrecio := TMant.Create(Application);
      GLPrecio.Admin := DMFAC.wAdmin;
      GLPrecio.Module := DMFAC.wModulo;
      GLPrecio.DComC := DMFAC.DCOM1;
      GLPrecio.OnEdit := LPrecioEdita;
      GLPrecio.OnShow := FRegistros.PGridShow;
      GLPrecio.UsuarioSQL.Add(xSQL);
      GLPrecio.ClientDataSet := DMFAC.cdsLPrecio;
      GLPrecio.OnCreateMant := FLisPre.ToolCreateLPrecios;
      GLPrecio.TableName := 'VWFACLISTPRE';
      GLPrecio.Titulo := 'Lista de Precios - ' + edtLPrecio.Text;
      GLPrecio.User := DMFAC.wUsuario;
      GLPrecio.SectionName := 'FACRepArt';
      GLPrecio.FileNameIni := '\oaFAC.INI';

      GLPrecio.Colors.Add('STKALM;clRed;clWhite;;;' + 'FCOLOR%=%S%;');
      GLPrecio.Colors.Add('ARTID;clRed;clWhite;;;' + 'FCOLOR%=%S%;');
      GLPrecio.Colors.Add('ARTDES;clRed;clWhite;;;' + 'FCOLOR%=%S%;');
      GLPrecio.Colors.Add('UNMIDG;clRed;clWhite;;;' + 'FCOLOR%=%S%;');
//    GLPrecio.Colors.Add('ARTID;clYellow;;;;'+'DPREVPMN'+vnum+'%>=%+91%and%'+'DPREVPMN'+vnum+'%<=%+99%;');

      Screen.cursor := CrDefault;
      GLPrecio.Execute;
   Finally
    //GLPrecio.Free;
    //FLPrecio.Free;
   End;
End;

Procedure TFLisPre.dblcCiaExit(Sender: TObject);
Begin
   If Z2bbtnCanc2.Focused Then Exit;
   If exCia = dblcCia.Text Then Exit;
   edtCia.Text := DMFAC.DisplayDescrip('TGE101', 'CIADES', 'CIAID', dblcCia.Text);
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Compañía no Existe');
      dblcCia.Text := '';
   End;
   DMFAC.FiltraTabla(DMFAC.cdsTLista, 'FAC101', 'TLISTAID');
   DMFAC.cdsTLista.Filter := 'CIAID=' + quotedStr(dblcCia.Text);
   DMFAC.cdsTLista.Filtered := True;
   edtLPrecio.text := '';
   exCia := dblcCia.Text;
End;

Procedure TFLisPre.dblcLPrecioExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If (Z2bbtnCanc2.Focused) Or (bbtnCombo.Focused) Then Exit;
   If DMFAC.cdsTLista.RecordCount = 0 Then Exit;
   If length(dblcLPrecio.text) = 0 Then
      Raise exception.create('Seleccione una Lista de Precios');

   xWhere := 'TLISTAID=' + quotedstr(dblcLPrecio.Text) + ' AND CIAID=' + QuotedStr(dblcCia.Text);
   edtLPrecio.Text := DMFAC.Buscaqry('dspUltTGE', 'FAC101', 'TLISTADES', xWhere, 'TLISTADES');
End;

Procedure TFLisPre.LPrecioEdita(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
{
select '04' CIAID, B.CIADES, '2DE' TLISTAID, C.TLISTADES, '20' TINID, D.TINDES,
       '05' GRARID, E.GRARDES, '01' FAMID, F.FAMDES, '05010090' ARTID,
       'NINTENDO MARIO TEN, DONKEY K. GBC' ARTDES, 'UND' UNMIDG,
       'N' LPRETMONID, G.TMONDES, 33.61 LPREPREGMO, round(39.9959,2) LPREPREIGV,
       0.0000 LPREDCTOG, 1.0000 ARTCONT, '' UNMIDU, 0.0000 LPREPREUMO
from TGE101 B, FAC101 C, TGE152 D, TGE131 E, TGE169 F, TGE103 G
where B.CIAID='04'
  and C.TLISTAID='2DE'
  and D.CIAID='04' and D.TINID='20'
  and E.CIAID='04' and E.TINID='20' and E.GRARID='05'
  and F.CIAID='04' and F.TINID='20' and F.GRARID='05' and F.FAMID='01'
  and G.TMONID='N'
}
   xSQL := 'select ' + quotedstr(dblcCia.Text) + ' CIAID, B.CIADES, '
      + quotedstr(dblcLPrecio.Text) + ' TLISTAID, C.TLISTADES, '
      + quotedstr(GLPrecio.FMant.cds2.FieldByName('TINID').AsString) + ' TINID, D.TINDES, '
      + quotedstr(GLPrecio.FMant.cds2.FieldByName('GRARID').AsString) + ' GRARID, E.GRARDES, '
      + quotedstr(GLPrecio.FMant.cds2.FieldByName('FAMID').AsString) + ' FAMID, F.FAMDES, '
      + quotedstr(GLPrecio.FMant.cds2.FieldByName('ARTID').AsString) + ' ARTID, '
      + quotedstr(GLPrecio.FMant.cds2.FieldByName('ARTDES').AsString) + ' ARTDES, '
      + quotedstr(GLPrecio.FMant.cds2.FieldByName('UNMIDG').AsString) + ' UNMIDG, '
      + quotedstr(GLPrecio.FMant.cds2.FieldByName('LPRETMONID').AsString) + ' LPRETMONID, '
      + 'G.TMONDES, '
      + GLPrecio.FMant.cds2.FieldByName('LPREPREGMO').AsString + ' LPREPREGMO, '
      + GLPrecio.FMant.cds2.FieldByName('LPREPREGIGV').AsString + ' LPREPREGIGV, '
      + GLPrecio.FMant.cds2.FieldByName('LPREPDCTOG').AsString + ' LPREPDCTOG, '
      + GLPrecio.FMant.cds2.FieldByName('ARTCONT').AsString + ' ARTCONT, ';
   If length(GLPrecio.FMant.cds2.FieldByName('UNMIDU').AsString) > 0 Then
      xSQL := xSQL + quotedstr(GLPrecio.FMant.cds2.FieldByName('UNMIDU').AsString) + ' UNMIDU, '
   Else
      xSQL := xSQL + ' '' '' UNMIDU, ';
   If GLPrecio.FMant.cds2.FieldByName('LPREPREUMO').AsFloat > 0 Then
      xSQL := xSQL + GLPrecio.FMant.cds2.FieldByName('LPREPREUMO').AsString + ' LPREPREUMO '
   Else
      xSQL := xSQL + ' 0.00 LPREPREUMO ';

   xSQL := xSQL + 'from TGE101 B, FAC101 C, TGE152 D, TGE131 E, TGE169 F, TGE103 G '
      + 'where B.CIAID=' + quotedstr(dblcCia.Text)
      + '  and C.TLISTAID=' + quotedstr(dblcLPrecio.Text)
      + '  and D.CIAID=' + quotedstr(dblcCia.Text)
      + ' and D.TINID=' + quotedstr(GLPrecio.FMant.cds2.FieldByName('TINID').AsString)
      + '  and E.CIAID=' + quotedstr(dblcCia.Text)
      + ' and E.TINID=' + quotedstr(GLPrecio.FMant.cds2.FieldByName('TINID').AsString)
      + ' and E.GRARID=' + quotedstr(GLPrecio.FMant.cds2.FieldByName('GRARID').AsString)
      + '  and F.CIAID=' + quotedstr(dblcCia.Text)
      + ' and F.TINID=' + quotedstr(GLPrecio.FMant.cds2.FieldByName('TINID').AsString)
      + ' and F.GRARID=' + quotedstr(GLPrecio.FMant.cds2.FieldByName('GRARID').AsString)
      + ' and F.FAMID=' + quotedstr(GLPrecio.FMant.cds2.FieldByName('FAMID').AsString)
      + '  and G.TMONID=' + quotedstr(GLPrecio.FMant.cds2.FieldByName('LPRETMONID').AsString);
//   DMFAC.cdsLPrecio.Data:=GLPrecio.FMant.cds2.Data;
//   DMFAC.cdsLPrecio.GotoCurrent(GLPrecio.FMant.cds2);
   DMFAC.cdsLPrecio.Close;
   DMFAC.cdsLPrecio.DataRequest(xSQL);
   DMFAC.cdsLPrecio.Open;

   FLPrecio.ShowModal;
End;

Procedure TFLisPre.LPrecioInsert(Sender: TObject);
Begin
   DMFAC.wModo := 'A';
   FLPrecio.ShowModal;
End;

Procedure TFLisPre.Z2bbtnCanc2Click(Sender: TObject);
Begin
   Close;
End;

Procedure TFLisPre.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFLisPre.NotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFLisPre.FormShow(Sender: TObject);
Begin
   //DMFAC.AccesosUsuarios( DMFAC.wModulo,DMFAC.wUsuario,'2',Screen.ActiveForm.name);
   DMFAC.AccesosUsuarios(DMFAC.wModulo, DMFAC.wUsuario, '2', 'FLisPre');
   edtCia.Text := '';
   edtLPrecio.Text := '';
   exCia := '';
End;

Procedure TFLisPre.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   action := caFree;
End;

Procedure TFLisPre.FormCreate(Sender: TObject);
Begin
   DMFAC.FiltraTabla(DMFAC.cdsCia, 'TGE101', 'CIAID');

   bbtnCombo.Visible := False;
   DMFAC.cdsCIA.First;
   While Not DMFAC.cdsCIA.Eof Do
   Begin
      If DMFAC.cdsCIA.FieldByName('CIAID').AsString = '04' Then
      Begin
         bbtnCombo.Visible := true;
         Break;
      End;
      DMFAC.cdsCIA.Next;
   End;
End;

Procedure TFLisPre.ToolCreateLPrecios(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolLPrecios.pnlTool;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFLisPre.bbtnComboClick(Sender: TObject);
Begin
   Try
      cFlgComb := 'C';
      FCombos := TFCombos.Create(application);
      FCombos.ShowModal;
   Finally
      FCombos.Free;
   End;
End;

End.

