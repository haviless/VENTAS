unit FAC702;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, wwdblook, StdCtrls, wwdbdatetimepicker, Buttons,
  Mask, wwdbedit, Wwdbdlg, ppEndUsr, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppBands, ppCache, Spin, StrContainer, Grids,
  Wwdbigrd, Wwdbgrid, ppCtrls, ppVar, ppPrnabl, ppParameter;

type
  TFToolVentaArticulo = class(TForm)
    pnGLT: TPanel;
    gbFechas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpFecIni: TwwDBDateTimePicker;
    dtpFecFin: TwwDBDateTimePicker;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Producto: TGroupBox;
    dblcdArticulo: TwwDBLookupComboDlg;
    dbeArticulo: TwwDBEdit;
    ppdb1: TppDBPipeline;
    ppr1: TppReport;
    ppd1: TppDesigner;
    bbtnFecha: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    cbEfe: TCheckBox;
    cbCre: TCheckBox;
    cbCta: TCheckBox;
    GroupBox3: TGroupBox;
    dbeNomIni: TwwDBEdit;
    dbeNomFin: TwwDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    gbNDiv: TGroupBox;
    seNum: TSpinEdit;
    Label5: TLabel;
    cbChe: TCheckBox;
    BitBtn1: TBitBtn;
    cbBec: TCheckBox;
    BitBtn3: TBitBtn;
    BitBtn12: TBitBtn;
    //scFile: TStrContainer;
    sdGraba: TSaveDialog;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    bbtnAlfabeticoFir: TBitBtn;
    bbtnFPago: TBitBtn;
    rgAno: TRadioGroup;
    ppParameterList1: TppParameterList;
    cbBon: TCheckBox;
    cbOCta: TCheckBox;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    scFile: TMemo;
    cbDiseno: TCheckBox;
    bbtnCertificado: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure dblcdArticuloEnter(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnAlfabeticoFirClick(Sender: TObject);
    procedure bbtnFechaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure bbtnFPagoClick(Sender: TObject);
    procedure rgAnoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCertificadoClick(Sender: TObject);
  private
    { Private declarations }
    cForpag, cNombre, cWhereCptoIgual, cWhereCptoDif, cWhereCpto : String;
    procedure CondicionesReporte;
    procedure CondicionesReporte2;
  public
    { Public declarations }
  end;

var
   FToolVentaArticulo: TFToolVentaArticulo;
   xAccesoBotones : Boolean;

implementation

Uses FacDM, DB, Fac503;

{$R *.DFM}

(******************************************************************************)
procedure TFToolVentaArticulo.Timer1Timer(Sender: TObject);
begin
   {
   FVariables.w_NombreForma := 'FToolConsPed';
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolConsPed);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
   }
end;

(******************************************************************************)
procedure TFToolVentaArticulo.dblcdArticuloEnter(Sender: TObject);
begin
   if dblcCia.text='' then
   begin
      ShowMessage('Debe Ingresar la Compañía');
      dblcCia.SetFocus;
      Exit;
   end;
end;

(******************************************************************************)
procedure TFToolVentaArticulo.dblcCiaExit(Sender: TObject);
var
   xSQL : String;
begin
  {
   xSQL:='SELECT CPTOID, CPTODES FROM CAJA201 WHERE CPTOIS=''I'' AND ACTIVO=''S'' order by CPTOID';
   DMFAC.cdsArticulo.Close;
   DMFAC.cdsArticulo.DataRequest( xSQL );
   DMFAC.cdsArticulo.Open;

   dblcdArticulo.DataSource:=DMFAC.dsArticulo;
   }
end;

(******************************************************************************)
procedure TFToolVentaArticulo.FormCreate(Sender: TObject);
begin
   dtpFecFin.Date:=Date;
   rgAnoClick(self);
end;

(******************************************************************************)
(******************************************************************************)
(******************************************************************************)
procedure TFToolVentaArticulo.CondicionesReporte2;
var
  cEfe, cCre, cBon, cCta, cOCta, cChe, cBec, cNom : String;
  iLen, iDiv, iCon, iFin : Integer;
begin
   (* para la publicacion de inscritos para su correccion *)
   if cbEfe.Checked then  cEfe:='''CAJA''';
   if cbCre.Checked then  cCre:='''CREDITOS''';
   if cbBon.Checked then  cBon:='''BONO''';
   if cbCta.Checked then  cCta:='''BANCO''';
   if cbOCta.Checked then  cOCta:='''BANCO_OCTA''';
   if cbChe.Checked then  cChe:='''CHEQUE''';
   if cbChe.Checked then  cChe:='''CHEQUE''';
   if cbBec.Checked then  cBec:='''BECAS''';

   cForPag:='';
   if (cEfe<>'') or (cCre<>'') or (cBon<>'') or (cCta<>'') or (cOCta<>'') or (cChe<>'') or (cBec<>'') then
   begin
      if cbEfe.Checked then cForpag:=cForpag+cEfe;
      if cbCre.Checked then
         if cForpag<>'' then cForpag:=cForpag+', '+cCre else cForpag:=cForpag+cCre;
      if cbBon.Checked then
         if cForpag<>'' then cForpag:=cForpag+', '+cBon else cForpag:=cForpag+cBon;
      if cbCta.Checked then
         if cForpag<>'' then cForpag:=cForpag+', '+cCta else cForpag:=cForpag+cCta;
      if cbOCta.Checked then
         if cForpag<>'' then cForpag:=cForpag+', '+cOCta else cForpag:=cForpag+cOCta;
      if cbChe.Checked then
         if cForpag<>'' then cForpag:=cForpag+', '+cChe else cForpag:=cForpag+cChe;
      if cbBec.Checked then
         if cForpag<>'' then cForpag:=cForpag+', '+cBec else cForpag:=cForpag+cBec;
      cForpag:=' and FORPAG IN ( '+cForPag+' ) ';
   end;

   cNombre:='';
   if (dbeNomIni.Text<>'') or (dbeNomFin.Text<>'') then
   begin
      if (dbeNomIni.Text<>'') then
      begin
         iLen:=Length(trim(dbeNomIni.Text));
         cNombre:=' SUBSTR(NOMCOR ,1,'+IntToStr(iLen)+')>='''+trim(dbeNomIni.Text)+''' ';

      end;
      if (dbeNomFin.Text<>'') then
      begin
         iLen:=Length(trim(dbeNomFin.Text));
         cNombre:=cNombre+' AND SUBSTR(NOMCOR ,1,'+IntToStr(iLen)+')<='''+trim(dbeNomFin.Text)+''' ';
      end;
   end
   else
      cNombre:='NOMCOR LIKE ''%'' ';

   (*
   cNombre:='';
   if (dbeNomIni.Text<>'') or (dbeNomFin.Text<>'') then
   begin
      if (dbeNomIni.Text<>'') then
      begin
         iLen:=Length(trim(dbeNomIni.Text));
         cNombre:=' SUBSTR(CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END,1,'+IntToStr(iLen)+')>='''+trim(dbeNomIni.Text)+''' ';

      end;
      if (dbeNomFin.Text<>'') then
      begin
         iLen:=Length(trim(dbeNomFin.Text));
         cNombre:=cNombre+' AND SUBSTR(CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END,1,'+IntToStr(iLen)+')<='''+trim(dbeNomFin.Text)+''' ';
      end;
   end
   else
      cNombre:='CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END LIKE ''%'' ';
   *)
end;

(******************************************************************************)
procedure TFToolVentaArticulo.CondicionesReporte;
var
  cEfe, cCre,cBon, cCta, cOCta, cChe, cBec, cNom : String;
  iLen, iDiv, iCon, iFin : Integer;
begin
   if cbEfe.Checked then  cEfe:='''CAJA''';
   if cbCre.Checked then  cCre:='''CREDITOS''';
   if cbBon.Checked then  cBon:='''BONO''';
   if cbCta.Checked then  cCta:='''BANCO''';
   if cbOCta.Checked then  cOCta:='''BANCO_OCTA''';
   if cbChe.Checked then  cChe:='''CHEQUE''';
   if cbChe.Checked then  cChe:='''CHEQUE''';
   if cbBec.Checked then  cBec:='''BECAS''';

   cForPag:='';
   if (cEfe<>'') or (cCre<>'')or (cBon<>'') or (cCta<>'')or (cOCta<>'') or (cChe<>'') or (cBec<>'') then
   begin
      if cbEfe.Checked then cForpag:=cForpag+cEfe;
      if cbCre.Checked then
         if cForpag<>'' then cForpag:=cForpag+', '+cCre else cForpag:=cForpag+cCre;
      if cbBon.Checked then
         if cForpag<>'' then cForpag:=cForpag+', '+cBon else cForpag:=cForpag+cBon;
      if cbCta.Checked then
         if cForpag<>'' then cForpag:=cForpag+', '+cCta else cForpag:=cForpag+cCta;
      if cbOCta.Checked then
         if cForpag<>'' then cForpag:=cForpag+', '+cOCta else cForpag:=cForpag+cOCta;
      if cbChe.Checked then
         if cForpag<>'' then cForpag:=cForpag+', '+cChe else cForpag:=cForpag+cChe;
      if cbBec.Checked then
         if cForpag<>'' then cForpag:=cForpag+', '+cBec else cForpag:=cForpag+cBec;
      cForpag:=' and FORPAG IN ( '+cForPag+' ) ';
   end;

   cNombre:='';
   if (dbeNomIni.Text<>'') or (dbeNomFin.Text<>'') then
   begin
      if (dbeNomIni.Text<>'') then
      begin
         iLen:=Length(trim(dbeNomIni.Text));
         cNombre:=' AND SUBSTR(CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END,1,'+IntToStr(iLen)+')>='''+trim(dbeNomIni.Text)+''' ';

      end;
      if (dbeNomFin.Text<>'') then
      begin
         iLen:=Length(trim(dbeNomFin.Text));
         cNombre:=cNombre+' AND SUBSTR(CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END,1,'+IntToStr(iLen)+')<='''+trim(dbeNomFin.Text)+''' ';
      end;
   end
   else
      cNombre:=' AND CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END like ''%'' ';


   {
   cNombre:='';
   if (dbeNomIni.Text<>'') then
   begin
      iLen:=Length(trim(dbeNomIni.Text));
      cNombre:=' AND NOMBRE  LIKE '''+trim(dbeNomIni.Text)+'%'' ';

   end;}
end;

(******************************************************************************)
procedure TFToolVentaArticulo.rgAnoClick(Sender: TObject);
begin
   if rgAno.ItemIndex=5 then
   begin
      dtpFecIni.Enabled:=false;
      dtpFecFin.Enabled:=True;
      dtpFecIni.MinDate:=StrToDate('01/01/2012');
      dtpFecIni.Date   :=StrToDate('01/01/2012');
      dtpFecFin.Date   :=Date;
      cWhereCptoIgual  :='AND A.CPTOID in (''IN0050'',''IN0137'') and IMPORTE=140  ';
      cWhereCptoDif    :='AND A.CPTOID in (''IN0050'',''IN0137'') and IMPORTE<>140  ';
      cWhereCpto       :='AND CPTOID in (''IN0050'',''IN0137'')  '
   end;
   if rgAno.ItemIndex=4 then
   begin
      dtpFecIni.Enabled:=false;
      dtpFecFin.Enabled:=True;
      dtpFecIni.MinDate:=StrToDate('01/01/2010');
      dtpFecIni.Date   :=StrToDate('01/01/2010');
      dtpFecFin.Date   :=Date;
      cWhereCptoIgual  :='AND A.CPTOID in (''IN0136'',''IN0137'') and IMPORTE=100  ';
      cWhereCptoDif    :='AND A.CPTOID in (''IN0136'',''IN0137'') and IMPORTE<>100  ';
      cWhereCpto       :='AND CPTOID in (''IN0136'',''IN0137'')  '
   end;
   if rgAno.ItemIndex=3 then
   begin
      dtpFecIni.Enabled:=false;
      dtpFecFin.Enabled:=True;
      dtpFecIni.MinDate:=StrToDate('16/11/2009');
      dtpFecIni.Date   :=StrToDate('16/11/2009');
      dtpFecFin.Date   :=Date;
      cWhereCptoIgual  :='AND A.CPTOID in (''IN0152'') and IMPORTE=80 ';
      cWhereCptoDif    :='AND A.CPTOID in (''IN0152'') and IMPORTE<>80 ';
      cWhereCpto       :='AND CPTOID in (''IN0152'') '
   end;
   if rgAno.ItemIndex=2 then
   begin
      dtpFecIni.Enabled:=false;
      dtpFecFin.Enabled:=True;
      dtpFecIni.MinDate:=StrToDate('25/10/2009');
      dtpFecIni.Date   :=StrToDate('25/10/2009');
      dtpFecFin.Date   :=Date;
      cWhereCptoIgual  :='AND A.CPTOID in (''IN0151'') and IMPORTE=70 ';
      cWhereCptoDif    :='AND A.CPTOID in (''IN0151'') and IMPORTE<>70 ';
      cWhereCpto       :='AND CPTOID in (''IN0151'') '
   end;
   if rgAno.ItemIndex=1 then
   begin
      dtpFecIni.Enabled:=false;
      dtpFecFin.Enabled:=True;
      dtpFecIni.MinDate:=StrToDate('01/12/2007');
      dtpFecIni.Date   :=StrToDate('01/12/2007');
      dtpFecFin.Date   :=Date;
      cWhereCptoIgual  :='AND A.CPTOID in (''IN0136'',''IN0137'') and IMPORTE=100 ';
      cWhereCptoDif    :='AND A.CPTOID in (''IN0136'',''IN0137'') and IMPORTE<>100 ';
      cWhereCpto       :='AND CPTOID in (''IN0136'',''IN0137'') '
   end;
   if rgAno.ItemIndex=0 then
   begin
      dtpFecIni.Enabled:=False;
      dtpFecFin.Enabled:=False;
      dtpFecIni.MinDate:=StrToDate('01/12/2005');
      dtpFecIni.Date   :=StrToDate('01/12/2005');
      dtpFecFin.Date   :=StrToDate('30/06/2006');
      cWhereCptoIgual  :='AND A.CPTOID LIKE '''+'IN0050'+'%'' and IMPORTE=170 ';
      cWhereCptoDif    :='AND A.CPTOID LIKE '''+'IN0050'+'%'' and IMPORTE<>170 ';
      cWhereCpto       :='AND CPTOID in (''IN0050'') '
   end;
end;

(************************** POR FECHA DE INSCRIPCION **************************)
procedure TFToolVentaArticulo.bbtnFechaClick(Sender: TObject);
var
  sSQL : String;
begin
   CondicionesReporte;
{
   sSQL:='SELECT NOMBRE, D.DPTODES, RUCDNI, B.ASOCODMOD, NVL(ASOTIPID,''TE'') ASOTIPID, '
        +  '''COBRANZAS'' ORIGEN, FORPAG, TMONID, IMPORTE FACTOTMN, FECPAG, '
        +  'DOCPAG, NUMDOCPAG, CIAFAC, DOCID, SERIE, NODOC, FECFAC, USUDOC, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN IMPORTE ELSE 0 END TOTCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN IMPORTE ELSE 0 END TOTCRE, '
        +  'CASE WHEN FORPAG=''BONO'' THEN IMPORTE ELSE 0 END TOTBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN IMPORTE ELSE 0 END TOTBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN IMPORTE ELSE 0 END TOTBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN IMPORTE ELSE 0 END TOTCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN IMPORTE ELSE 0 END TOTBEC, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN 1 ELSE 0 END REGCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN 1 ELSE 0 END REGCRE, '
        +  'CASE WHEN FORPAG=''BONO'' THEN 1 ELSE 0 END REGBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN 1 ELSE 0 END REGBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN 1 ELSE 0 END REGBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN 1 ELSE 0 END REGCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 1 ELSE 0 END REGBEC '
        +'FROM CXC_ING_VAR_SER A, APO201 B, APO101 C, APO158 D '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  ' AND A.CPTOID IN (''IN0136'',''IN0137'')'
        +   cForpag
        +   cNombre
        +  ' AND A.CLIEID=B.ASOID(+) '
        +  ' AND B.USEID=C.USEID(+) '
        +  ' AND B.UPROID=C.UPROID(+) '
        +  ' AND B.UPAGOID=C.UPAGOID(+) '
        +  ' AND C.DPTOID=D.DPTOID(+) '
        +  ' and IMPORTE >= CASE WHEN FORPAG = ''BECAS'' THEN 0 ELSE 0 END '
        +  ' ORDER BY FECPAG, NOMBRE ';
             }

   sSQL:='SELECT NOMFIN NOMBRE, D.DPTODES, RUCDNI, B.ASOCODMOD, NVL(ASOTIPID,''TE'') ASOTIPID, '
        +  '''COBRANZAS'' ORIGEN, FORPAG, IMPORTE FACTOTMN, FECPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN IMPORTE ELSE 0 END TOTCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN IMPORTE ELSE 0 END TOTCRE, '
        +  'CASE WHEN FORPAG=''BONO'' THEN IMPORTE ELSE 0 END TOTBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN IMPORTE ELSE 0 END TOTBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN IMPORTE ELSE 0 END TOTBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN IMPORTE ELSE 0 END TOTCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN IMPORTE ELSE 0 END TOTBEC, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN 1 ELSE 0 END REGCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN 1 ELSE 0 END REGCRE, '
        +  'CASE WHEN FORPAG=''BONO'' THEN 1 ELSE 0 END REGBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN 1 ELSE 0 END REGBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN 1 ELSE 0 END REGBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN 1 ELSE 0 END REGCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 1 ELSE 0 END REGBEC '
        +'FROM ( '
        +'SELECT RUCDNI, MAX(FECPAG) FECPAG, CLIEID, SUM(IMPORTE) IMPORTE, FORPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  '     NOMFIN '
        +'FROM( '
        +'      SELECT CASE WHEN DNICON IS NOT NULL THEN DNICON ELSE RUCDNI END RUCDNI, '
        +'             clieid, importe, fecpag, forpag, '
        +'             CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'        FROM CXC_ING_VAR_SER '
        +'       WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +          cWhereCpto
        +          cForpag + cNombre
        +'    )  '
        +'Group by CLIEID, NOMFIN, RUCDNI, FORPAG '
        +' ) A, APO201 B, APO101 C, APO158 D '
        +'WHERE  A.CLIEID=B.ASOID(+) '
        +  ' AND B.USEID=C.USEID(+) '
        +  ' AND B.UPROID=C.UPROID(+) '
        +  ' AND B.UPAGOID=C.UPAGOID(+) '
        +  ' AND C.DPTOID=D.DPTOID(+) '
        +  ' ORDER BY FECPAG, NOMBRE ';

 	 DMFAC.cdsReporte.Close;
 	 DMFAC.cdsReporte.DataRequest( sSQL );
	 DMFAC.cdsReporte.Open;

   ppdb1.DataSource:=DMFAC.dsReporte;
   ppr1.DataPipeline:=ppdb1;
   ppr1.Template.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\VentasEncinasFecha2008.rtm' ;
   (*ppr1.Template.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\VentasEncinasFecha.rtm' ; *)
   ppr1.Template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
   begin
      ppd1.Report:=ppr1;
      ppd1.ShowModal;
   end
   else
      ppr1.Print;

  ppr1.Stop;
  ppr1.DataPipeline:=nil;
  ppdb1.DataSource:= nil;
  ppd1.Report     := nil;
end;

(******************** TRANSFERIR A ARCHIVO ************************************)
procedure TFToolVentaArticulo.BitBtn12Click(Sender: TObject);
VAR
   xSpace, xBlanco, xRetorno, xLinea, cImp : String;
   i : Integer;
  sSQL : String;
begin
   CondicionesReporte;
         {
   sSQL:='SELECT NOMBRE, RUCDNI, FORPAG, TMONID, IMPORTE FACTOTMN, FECPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN, '
        +  'CASE WHEN DNICON IS NOT NULL THEN DNICON ELSE RUCDNI END DNIFIN '
        +'FROM CXC_ING_VAR_SER A '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  'AND A.CPTOID IN (''IN0136'',''IN0137'') '
        +  cForpag + cNombre
        +'ORDER BY NOMFIN ';

        }


   sSQL:='SELECT NOMFIN '
        +'FROM ( '
        +'SELECT RUCDNI, MAX(FECPAG) FECPAG, CLIEID, SUM(IMPORTE) IMPORTE, FORPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  '     NOMFIN '
        +'FROM( '
        +'      SELECT CASE WHEN DNICON IS NOT NULL THEN DNICON ELSE RUCDNI END RUCDNI, '
        +'             clieid, importe, fecpag, forpag, '
        +'             CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'        FROM CXC_ING_VAR_SER '
        +'       WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +          cWhereCpto
        +  cForpag + cNombre
        +'    )  '
        +'Group by CLIEID, NOMFIN, RUCDNI, FORPAG '
        + ') A '
        +'ORDER BY NOMFIN ';


       

 	 DMFAC.cdsReporte.Close;
 	 DMFAC.cdsReporte.DataRequest( sSQL );
	 DMFAC.cdsReporte.Open;

   if not sdGraba.Execute then Exit;

   DMFAC.cdsReporte.First;

   scFile.Lines.Clear;

   while not DMFAC.cdsReporte.Eof do begin

      xLinea:='';
      xLinea:=xLinea+DMFAC.cdsReporte.FieldByName( 'NOMFIN' ).AsString+#13;
      scFile.Lines.Add( xLinea );

      DMFAC.cdsReporte.Next;
   end;

   scFile.Lines.SaveToFile( sdGraba.FileName );

   ShowMessage('Archivo Grabado');
end;

(*************************** REVISAR CASOS ************************************)
procedure TFToolVentaArticulo.BitBtn6Click(Sender: TObject);
var
   xSQL : String;
begin
   if (dtpFecIni.Date=0) OR (dtpFecFin.Date=0) then
   begin
      Raise Exception.Create('Ingrese Rango de Fechas');
   end;

   CondicionesReporte;

   xSQL:='SELECT ''1'' ORDEN, NOMFIN, TIPPAG, SUM(FACTOTMN) IMPORTE, ''MONTO MENOR A S/.100.00'' OBSER '
        +'FROM ( '
        +'SELECT CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN, '
        +  'CASE WHEN DNICON IS NOT NULL THEN DNICON ELSE RUCDNI END DNIFIN, '
        +  'IMPORTE FACTOTMN, FECPAG, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG '
        +'FROM CXC_ING_VAR_SER '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        //+  'AND A.CPTOID IN (''IN0136'',''IN0137'') '
        +          cWhereCpto
        +  cForpag + cNombre
        +  ' AND IMPORTE < 100 '
        +') a '
        +'group by NOMFIN, TIPPAG '
        +'having SUM(FACTOTMN)<100 '

        +'Union all '
        +'Select ''2'' ORDEN, CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'' '
        +       'WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''CHE''   THEN ''CHEQUE'' ELSE ''BEC'' END TIPPAG, '
        +  'IMPORTE, ''REVISAR SI PAGARON EN CREDITOS O POR BANCOS'' OBSER '
        +'FROM CXC_ING_VAR_SER '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        //+  ' AND A.CPTOID IN (''IN0136'',''IN0137'') '
        +          cWhereCpto
        +  ' and NUMDOCPAG=''REV'' '
        +  cForpag + cNombre
        +' ORDER BY ORDEN, NOMFIN ';



 	 DMFAC.cdsReporte.Close;
 	 DMFAC.cdsReporte.DataRequest( xSQL );
	 DMFAC.cdsReporte.Open;

   ppdb1.DataSource:=DMFAC.dsReporte;
   ppr1.DataPipeline:=ppdb1;
   ppr1.Template.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\RevisarEncinas.rtm' ;
   ppr1.Template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
   begin
      ppd1.Report:=ppr1;
      ppd1.ShowModal;
   end
   else
      ppr1.Print;

   ppr1.Stop;
   ppr1.DataPipeline:=nil;
   ppdb1.DataSource := nil;
   ppd1.Report      := nil;
end;

(************************* x ver ************ alfabetico para firma del profe ********************)
procedure TFToolVentaArticulo.bbtnAlfabeticoFirClick(Sender: TObject);
var
  sSQL : String;
  iLen, iDiv, iCon, iFin : Integer;
  cGru, cNom : String;
begin

   CondicionesReporte;
{     CondicionesReporte2;
   sSQL:='SELECT * FROM ( '
        +'SELECT IMPORTE FACTOTMN, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'substr( CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END,1,1) LETRAS, '
        +  'CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMCOR, '
        +  '''                    '' NOMINI, '
        +  '''                    '' NOMFIN, ''001'' GRUPO '
        +'FROM CXC_ING_VAR_SER A '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  ' AND A.CPTOID IN (''IN0136'',''IN0137'')'
        +  ' and IMPORTE >= CASE WHEN FORPAG = ''BECAS'' THEN 0 ELSE 0 END '
        +  cForpag + ' '
              (*
        +'UNION ALL '

        +'SELECT SUM(FACTOTMN) FACTOTMN, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'SUBSTR(NOMCOR,1,1) LETRAS, '
        +  'NOMCOR, '
        +  '''                    '' NOMINI, '
        +  '''                    '' NOMFIN, ''001'' GRUPO '
        +' FROM ( '
        +'SELECT  CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMCOR, '
        +  'IMPORTE FACTOTMN, FECPAG '
        +'FROM CXC_ING_VAR_SER A '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  ' AND A.CPTOID IN (''IN0136'',''IN0137'')'
        +  ' and IMPORTE<>100 '
        +  cForpag
        +' ) a '
        +'Group by NOMCOR '
             *)
        +' ) X '
        +'WHERE '+ cNombre+' '
        +'ORDER BY NOMCOR';
 }

   sSQL:='SELECT * FROM ( '
        +'SELECT IMPORTE FACTOTMN, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'substr(nomfin,1,1) LETRAS, '
        +  ' nomfin NOMCOR, '
        +  '''                    '' NOMINI, '
        +  '''                    '' NOMFIN, ''001'' GRUPO '
        +'FROM ('
        +'SELECT RUCDNI, MAX(FECPAG) FECPAG, CLIEID, SUM(IMPORTE) IMPORTE, FORPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  '     NOMFIN '
        +'FROM( '
        +'      SELECT CASE WHEN DNICON IS NOT NULL THEN DNICON ELSE RUCDNI END RUCDNI, '
        +'             clieid, importe, fecpag, forpag, '
        +'             CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'        FROM CXC_ING_VAR_SER '
        +'       WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +          cWhereCpto
        //+'         AND CPTOID IN (''IN0136'',''IN0137'') '
        +          cForpag + cNombre
        +'    )  '
        +'Group by CLIEID, NOMFIN, RUCDNI, FORPAG '
        +') A '
        +' ) X '
        +'ORDER BY NOMCOR';



   DMFAC.cdsReporte.Close;
 	 DMFAC.cdsReporte.DataRequest( sSQL );
	 DMFAC.cdsReporte.Open;

   iDiv:= Trunc( DMFAC.cdsReporte.RecordCount/seNum.Value );
   if (DMFAC.cdsReporte.RecordCount/seNum.Value)-iDiv>0 then
      iDiv:=iDiv+1;

   iCon:=0;
   cGru:='001';
	 DMFAC.cdsReporte.First;
	 while not DMFAC.cdsReporte.Eof do
   begin
      iCon:=iCon+1;
	    DMFAC.cdsReporte.Edit;
	    DMFAC.cdsReporte.FieldByname('GRUPO').AsString:=cGru;
	    DMFAC.cdsReporte.Next;

      if iCon>=iDiv then
      begin
         iCon:=0;
         cGru:= DMFAC.StrZero(IntToStr(StrToInt(cGru)+1),3);
      end;
   end;

	 DMFAC.cdsReporte.First;
   iFin:=Pos( ' ', DMFAC.cdsReporte.FieldByname('NOMCOR').AsString );
   cNom:=Copy( DMFAC.cdsReporte.FieldByname('NOMCOR').AsString,1,iFin-1);
   cGru:=DMFAC.cdsReporte.FieldByname('GRUPO').AsString;
	 while not DMFAC.cdsReporte.Eof do
   begin
	    DMFAC.cdsReporte.Edit;
	    DMFAC.cdsReporte.FieldByname('NOMINI').AsString:=cNom;
	    DMFAC.cdsReporte.Next;
      if cGru<>DMFAC.cdsReporte.FieldByname('GRUPO').AsString then
      begin
         iCon:=0;
         iFin:=Pos( ' ', DMFAC.cdsReporte.FieldByname('NOMCOR').AsString );
         cNom:=Copy( DMFAC.cdsReporte.FieldByname('NOMCOR').AsString,1,iFin-1);
         cGru:=DMFAC.cdsReporte.FieldByname('GRUPO').AsString;
      end;
   end;

	 DMFAC.cdsReporte.Last;
   iFin:=Pos( ' ', DMFAC.cdsReporte.FieldByname('NOMCOR').AsString );
   cNom:=Copy( DMFAC.cdsReporte.FieldByname('NOMCOR').AsString,1,iFin-1);
   cGru:=DMFAC.cdsReporte.FieldByname('GRUPO').AsString;
	 while not DMFAC.cdsReporte.Bof do
   begin
	    DMFAC.cdsReporte.Edit;
	    DMFAC.cdsReporte.FieldByname('NOMFIN').AsString:=cNom;
	    DMFAC.cdsReporte.Prior;
      if cGru<>DMFAC.cdsReporte.FieldByname('GRUPO').AsString then
      begin
         iCon:=0;
         iFin:=Pos( ' ', DMFAC.cdsReporte.FieldByname('NOMCOR').AsString );
         cNom:=Copy( DMFAC.cdsReporte.FieldByname('NOMCOR').AsString,1,iFin-1);
         cGru:=DMFAC.cdsReporte.FieldByname('GRUPO').AsString;
      end;
   end;

	 DMFAC.cdsReporte.First;

   ppdb1.DataSource:=DMFAC.dsReporte;
   ppr1.DataPipeline:=ppdb1;
   ppr1.Template.FileName := ExtractFilePath( application.ExeName )+ DMFAC.wRutaRpt+ '\VentasEncinasAlfab2008.rtm' ;
   (*ppr1.Template.FileName := ExtractFilePath( application.ExeName )+ DMFAC.wRutaRpt+ '\VentasEncinasAlfab.rtm' ;*)
   ppr1.Template.LoadFromFile;

   Screen.Cursor:=crDefault;
  (**************************)
   If cbDiseno.Checked Then
      begin
         ppd1.Report:=ppr1;
         ppd1.ShowModal;
      end
   else
      ppr1.Print;
  (**************************)
  ppr1.Stop;
  ppr1.DataPipeline:=nil;
  ppdb1.DataSource:= nil;
  ppd1.Report     := nil;
end;

(********************* ALFABETICO CON NOMBRE ORIGINAL *************************)
procedure TFToolVentaArticulo.BitBtn3Click(Sender: TObject);
var
  sSQL : String;
begin
   CondicionesReporte;
{
   sSQL:='SELECT NOMBRE, D.DPTODES, RUCDNI, B.ASOCODMOD, NVL(ASOTIPID,''TE'') ASOTIPID, '
        +  '''COBRANZAS'' ORIGEN, FORPAG, TMONID, IMPORTE FACTOTMN, FECPAG, '
        +  'DOCPAG, NUMDOCPAG, CIAFAC, DOCID, SERIE, NODOC, FECFAC, USUDOC, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'' '
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN IMPORTE ELSE 0 END TOTCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN IMPORTE ELSE 0 END TOTCRE, '
        +  'CASE WHEN FORPAG=''BONO'' THEN IMPORTE ELSE 0 END TOTBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN IMPORTE ELSE 0 END TOTBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN IMPORTE ELSE 0 END TOTBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN IMPORTE ELSE 0 END TOTCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN IMPORTE ELSE 0 END TOTBEC, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN 1 ELSE 0 END REGCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN 1 ELSE 0 END REGCRE, '
        +  'CASE WHEN FORPAG=''BONO'' THEN 1 ELSE 0 END REGBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN 1 ELSE 0 END REGBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN 1 ELSE 0 END REGBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN 1 ELSE 0 END REGCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 1 ELSE 0 END REGBEC, '
        +  'substr( NOMBRE,1,1) LETRA, '
        +  'CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN, '
        +  'CASE WHEN DNICON IS NOT NULL THEN DNICON ELSE RUCDNI END DNIFIN '
        +'FROM CXC_ING_VAR_SER A, APO201 B, APO101 C, APO158 D '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  'AND A.CPTOID IN (''IN0136'',''IN0137'') '
        +  cForpag + cNombre
        +  'AND A.CLIEID=B.ASOID(+) '
        +  'AND B.USEID=C.USEID(+) '
        +  'AND B.UPROID=C.UPROID(+) '
        +  'AND B.UPAGOID=C.UPAGOID(+) '
        +  'AND C.DPTOID=D.DPTOID(+) '
        +  'and IMPORTE >= CASE WHEN FORPAG = ''BECAS'' THEN 0 ELSE 0 END '
        +'ORDER BY NOMFIN ';
 }


    sSQL:='SELECT nomfin NOMBRE, D.DPTODES, RUCDNI, B.ASOCODMOD, NVL(ASOTIPID,''TE'') ASOTIPID, '
        +  '''COBRANZAS'' ORIGEN, FORPAG,  IMPORTE FACTOTMN, FECPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'' '
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN IMPORTE ELSE 0 END TOTCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN IMPORTE ELSE 0 END TOTCRE, '
        +  'CASE WHEN FORPAG=''BONO'' THEN IMPORTE ELSE 0 END TOTBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN IMPORTE ELSE 0 END TOTBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN IMPORTE ELSE 0 END TOTBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN IMPORTE ELSE 0 END TOTCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN IMPORTE ELSE 0 END TOTBEC, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN 1 ELSE 0 END REGCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN 1 ELSE 0 END REGCRE, '
        +  'CASE WHEN FORPAG=''BONO'' THEN 1 ELSE 0 END REGBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN 1 ELSE 0 END REGBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN 1 ELSE 0 END REGBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN 1 ELSE 0 END REGCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 1 ELSE 0 END REGBEC, '
        +  'substr( NOMFIN,1,1) LETRA, '
        +  ' NOMFIN, '
        +  ' RUCDNI DNIFIN '
        +'FROM ( '
        +'SELECT RUCDNI, MAX(FECPAG) FECPAG, CLIEID, SUM(IMPORTE) IMPORTE, FORPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  '     NOMFIN '
        +'FROM( '
        +'      SELECT CASE WHEN DNICON IS NOT NULL THEN DNICON ELSE RUCDNI END RUCDNI, '
        +'             clieid, importe, fecpag, forpag, '
        +'             CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'        FROM CXC_ING_VAR_SER '
        +'       WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        //+'         AND CPTOID IN (''IN0136'',''IN0137'') '
        +          cWhereCpto
        +          cForpag + cNombre
        +'    )  '
        +'Group by CLIEID, NOMFIN, RUCDNI, FORPAG '
        +' ) A, APO201 B, APO101 C, APO158 D '
        +'WHERE A.CLIEID=B.ASOID(+) '
        +  'AND B.USEID=C.USEID(+) '
        +  'AND B.UPROID=C.UPROID(+) '
        +  'AND B.UPAGOID=C.UPAGOID(+) '
        +  'AND C.DPTOID=D.DPTOID(+) '
        +'ORDER BY NOMFIN ';



 	 DMFAC.cdsReporte.Close;
 	 DMFAC.cdsReporte.DataRequest( sSQL );
	 DMFAC.cdsReporte.Open;

   ppdb1.DataSource:=DMFAC.dsReporte;
   ppr1.DataPipeline:=ppdb1;
   ppr1.Template.FileName := ExtractFilePath( application.ExeName )+ DMFAC.wRutaRpt+'\VentasEncinasAlfabRev2008.rtm' ;
   (* ppr1.Template.FileName := ExtractFilePath( application.ExeName )+ DMFAC.wRutaRpt+'\VentasEncinasAlfabRev.rtm' ; *)
   ppr1.Template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
   begin
      ppd1.Report:=ppr1;
      ppd1.ShowModal;
   end
   else
      ppr1.Print;

  ppr1.Stop;
  ppr1.DataPipeline:=nil;
  ppdb1.DataSource:= nil;
  ppd1.Report     := nil;
end;

(************** listado final con correcciones de nombres y dni ***************)
procedure TFToolVentaArticulo.BitBtn1Click(Sender: TObject);
var
  sSQL : String;
begin
   CondicionesReporte;
{
   sSQL:='SELECT IMPORTE FACTOTMN, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'FROM CXC_ING_VAR_SER A, APO201 B '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  'AND A.CPTOID IN (''IN0136'',''IN0137'') '
        +  'and IMPORTE >= CASE WHEN FORPAG = ''BECAS'' THEN 0 ELSE 0 END '
        +  cForpag + cNombre
        +  'AND A.CLIEID=B.ASOID(+) '
          (*
        +'UNION ALL '
        +'SELECT SUM(FACTOTMN) FACTOTMN, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  '''VARIOS'' TIPPAG, NOMFIN '
        +' FROM ( '
        +'SELECT  CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN, '
        +  'IMPORTE FACTOTMN, FECPAG '
        +'FROM CXC_ING_VAR_SER A '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  ' AND A.CPTOID IN (''IN0136'',''IN0137'') '
        + ' and IMPORTE<>100 '
        +  cForpag + cNombre
        +' ) a '
        +'Group by NOMFIN '
        *)
        +'ORDER BY NOMFIN ';
}

   sSQL:='SELECT IMPORTE FACTOTMN, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  ' NOMFIN '
        +'FROM ('
        +'SELECT RUCDNI, MAX(FECPAG) FECPAG, CLIEID, SUM(IMPORTE) IMPORTE, FORPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  '     NOMFIN '
        +'FROM( '
        +'      SELECT CASE WHEN DNICON IS NOT NULL THEN DNICON ELSE RUCDNI END RUCDNI, '
        +'             clieid, importe, fecpag, forpag, '
        +'             CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'        FROM CXC_ING_VAR_SER '
        +'       WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        //+'         AND CPTOID IN (''IN0136'',''IN0137'') '
        +          cWhereCpto
        +          cForpag + cNombre
        +'    )  '
        +'Group by CLIEID, NOMFIN, RUCDNI, FORPAG '
        +' ) A, APO201 B '
        +'WHERE A.CLIEID=B.ASOID(+) '
        +'ORDER BY NOMFIN ';



 	 DMFAC.cdsReporte.Close;
 	 DMFAC.cdsReporte.DataRequest( sSQL );
	 DMFAC.cdsReporte.Open;

   ppdb1.DataSource:=DMFAC.dsReporte;
   ppr1.DataPipeline:=ppdb1;
   ppr1.Template.FileName := ExtractFilePath( application.ExeName )+ DMFAC.wRutaRpt+'\VentasEncinasAlfabFin2008.rtm' ;
   (*ppr1.Template.FileName := ExtractFilePath( application.ExeName )+ DMFAC.wRutaRpt+'\VentasEncinasAlfabFin.rtm' ;*)
   ppr1.Template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
   begin
      ppd1.Report:=ppr1;
      ppd1.ShowModal;
   end
   else
      ppr1.Print;

  ppr1.Stop;
  ppr1.DataPipeline:=nil;
  ppdb1.DataSource:= nil;
  ppd1.Report     := nil;
end;

(******* ALFABETICO PARA REVISAR Y QUE LO REVISEN LOS PROFESORES **************)
procedure TFToolVentaArticulo.BitBtn2Click(Sender: TObject);
var
  sSQL : String;
begin
   CondicionesReporte;

   {
   sSQL:='SELECT IMPORTE FACTOTMN, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'' '
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'CASE WHEN NOMCON IS NOT NULL THEN substr( NOMCON,1,1) ELSE substr( NOMBRE,1,1) END LETRA, '
        +  'CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'FROM CXC_ING_VAR_SER A '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  'AND A.CPTOID IN (''IN0136'',''IN0137'') '
        +  'and IMPORTE >= CASE WHEN FORPAG = ''BECAS'' THEN 0 ELSE 0 END '
        +  cForpag
        +  cNombre

        (*
        +'UNION ALL '
        +'SELECT SUM(FACTOTMN) FACTOTMN, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  '''VARIOS'' TIPPAG, '
        +  'substr( NOMFIN,1,1) LETRA, '
        +  'NOMFIN '
        +' FROM ( '
        +'SELECT  CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN, '
        +  'IMPORTE FACTOTMN, FECPAG '
        +'FROM CXC_ING_VAR_SER A '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  'AND A.CPTOID IN (''IN0136'',''IN0137'') '
        +  'and IMPORTE<>10 '
        +  cForpag + cNombre
        +' ) a '
        +'Group by NOMFIN '
           *)
        +'ORDER BY NOMFIN';
        }


   sSQL:='SELECT IMPORTE FACTOTMN, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'' '
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  ' substr( nomfin,1,1) LETRA, '
        +  ' NOMFIN '
        +'FROM ( '
        +'SELECT RUCDNI, MAX(FECPAG) FECPAG, CLIEID, SUM(IMPORTE) IMPORTE, FORPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  '     NOMFIN '
        +'FROM( '
        +'      SELECT CASE WHEN DNICON IS NOT NULL THEN DNICON ELSE RUCDNI END RUCDNI, '
        +'             clieid, importe, fecpag, forpag, '
        +'             CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'        FROM CXC_ING_VAR_SER '
        +'       WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +          cWhereCpto
        //+'         AND CPTOID IN (''IN0136'',''IN0137'') '
        +          cForpag + cNombre
        +'    )  '
        +'Group by CLIEID, NOMFIN, RUCDNI, FORPAG '

        +' ) A '
        +'ORDER BY NOMFIN';


 	 DMFAC.cdsReporte.Close;
 	 DMFAC.cdsReporte.DataRequest( sSQL );
	 DMFAC.cdsReporte.Open;

   ppdb1.DataSource:=DMFAC.dsReporte;
   ppr1.DataPipeline:=ppdb1;
   ppr1.Template.FileName := ExtractFilePath( application.ExeName )+ DMFAC.wRutaRpt+'\VentasEncinasAlfabVer2008.rtm' ;
   (* ppr1.Template.FileName := ExtractFilePath( application.ExeName )+ DMFAC.wRutaRpt+'\VentasEncinasAlfabVer.rtm' ; *)
   ppr1.Template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
   begin
      ppd1.Report:=ppr1;
      ppd1.ShowModal;
   end
   else
      ppr1.Print;

  ppr1.Stop;
  ppr1.DataPipeline:=nil;
  ppdb1.DataSource:= nil;
  ppd1.Report     := nil;
end;

(****************************** imprime certificados  *************************)
procedure TFToolVentaArticulo.BitBtn4Click(Sender: TObject);
var
  sSQL : String;
begin
   CondicionesReporte;
{
   sSQL:='SELECT IMPORTE FACTOTMN, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'' '
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'FROM CXC_ING_VAR_SER A, APO201 B '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  ' AND A.CPTOID IN (''IN0136'',''IN0137'') '
        + '  and IMPORTE >= CASE WHEN FORPAG = ''BECAS'' THEN 0 ELSE 0 END '
        +  cForpag + cNombre
        +  'AND A.CLIEID=B.ASOID(+) '
        (*
        +'UNION ALL '
        +'SELECT SUM(FACTOTMN) FACTOTMN, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  '''VARIOS'' TIPPAG, NOMFIN '
        +' FROM ( '
        +'SELECT  CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN, '
        +  'IMPORTE FACTOTMN, FECPAG '
        +'FROM CXC_ING_VAR_SER A '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  ' AND A.CPTOID IN (''IN0136'',''IN0137'') '
        + ' and IMPORTE<>100 '
        +  cForpag + cNombre
        +' ) a '
        +'Group by NOMFIN '
        *)
        +'ORDER BY NOMFIN ';

 }


   sSQL:='SELECT IMPORTE FACTOTMN, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'' '
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  ' NOMFIN '
        +'FROM ('

        +'SELECT RUCDNI, MAX(FECPAG) FECPAG, CLIEID, SUM(IMPORTE) IMPORTE, FORPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  '     NOMFIN '
        +'FROM( '
        +'      SELECT CASE WHEN DNICON IS NOT NULL THEN DNICON ELSE RUCDNI END RUCDNI, '
        +'             clieid, importe, fecpag, forpag, '
        +'             CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'        FROM CXC_ING_VAR_SER '
        +'       WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        //+'         AND CPTOID IN (''IN0136'',''IN0137'') '
        +          cWhereCpto
        +          cForpag + cNombre
        +'    )  '
        +'Group by CLIEID, NOMFIN, RUCDNI, FORPAG '


        +' ) A, APO201 B '
        +'WHERE A.CLIEID=B.ASOID(+) '
        +'ORDER BY NOMFIN ';


 	 DMFAC.cdsReporte.Close;
 	 DMFAC.cdsReporte.DataRequest( sSQL );
	 DMFAC.cdsReporte.Open;

   ppdb1.DataSource:=DMFAC.dsReporte;
   ppr1.DataPipeline:=ppdb1;
   ppr1.Template.FileName := ExtractFilePath( application.ExeName )+ DMFAC.wRutaRpt+'\EncinasCertificado2010.rtm' ;
   (* ppr1.Template.FileName := ExtractFilePath( application.ExeName )+ DMFAC.wRutaRpt+'\EncinasCertificado.rtm' ; *)
   ppr1.Template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
   begin
      ppd1.Report:=ppr1;
      ppd1.ShowModal;
   end
   else
      ppr1.Print;

  ppr1.Stop;
  ppr1.DataPipeline:=nil;
  ppdb1.DataSource:= nil;
  ppd1.Report     := nil;
end;

(******************************** por departamento ****************************)
procedure TFToolVentaArticulo.BitBtn5Click(Sender: TObject);
var
  sSQL : string;
begin
   if (dtpFecIni.Date=0) OR (dtpFecFin.Date=0) then
   begin
      Raise Exception.Create('Ingrese Rango de Fechas');
   end;

   CondicionesReporte;

   (*******************************
   sSQL:='SELECT A.*, CASE WHEN D.DPTODES IS NOT NULL THEN D.DPTODES ELSE ''Z - NO UBICADO'' END DPTODES, '
        +  'B.ASOCODMOD, NVL(ASOTIPID,''TE'') ASOTIPID, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN IMPORTE ELSE 0 END TOTCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN IMPORTE ELSE 0 END TOTCRE, '
        +  'CASE WHEN FORPAG=''BONO''     THEN IMPORTE ELSE 0 END TOTBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN IMPORTE ELSE 0 END TOTBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN IMPORTE ELSE 0 END TOTBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN IMPORTE ELSE 0 END TOTCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 0       ELSE 0 END TOTBEC, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN 1 ELSE 0 END REGCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN 1 ELSE 0 END REGCRE, '
        +  'CASE WHEN FORPAG=''BONO''     THEN 1 ELSE 0 END REGBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN 1 ELSE 0 END REGBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN 1 ELSE 0 END REGBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN 1 ELSE 0 END REGCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 1 ELSE 0 END REGBEC, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 0 ELSE IMPORTE END FACTOTMN '
        +'FROM ( '
        +'SELECT A.RUCDNI, FECPAG, A.CLIEID, IMPORTE, FORPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'' '
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'FROM CXC_ING_VAR_SER A '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  ' AND A.CPTOID IN (''IN0136'',''IN0137'') '
        +  ' and IMPORTE >= CASE WHEN FORPAG = ''BECAS'' THEN 0 ELSE 0 END '
        +  cForpag + cNombre
        +'UNION '

        +'SELECT RUCDNI, MAX(FECPAG) FECPAG, CLIEID, SUM(IMPORTE) IMPORTE, FORPAG,  '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'' '
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'NOMFIN '
        +' FROM ( '
        +'SELECT A.RUCDNI, A.CLIEID, IMPORTE, FECPAG, FORPAG, '
        +  'CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'FROM CXC_ING_VAR_SER A '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  cWhereCptoDif
        +  cForpag + cNombre
        +' ) a '
        +'Group by CLIEID, NOMFIN, RUCDNI, FORPAG '

        +' ) A, APO201 B, APO101 C, APO158 D '
        +'WHERE A.CLIEID=B.ASOID(+) '
        +  'AND B.USEID=C.USEID(+) AND B.UPROID=C.UPROID(+) AND B.UPAGOID=C.UPAGOID(+) '
        +  'AND C.DPTOID=D.DPTOID(+) '

        +'ORDER BY DPTODES, NOMFIN ';

        **************************)

           sSQL:='SELECT A.*, CASE WHEN D.DPTODES IS NOT NULL THEN D.DPTODES ELSE ''Z - NO UBICADO'' END DPTODES, '
        +  'B.ASOCODMOD, NVL(ASOTIPID,''TE'') ASOTIPID, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN IMPORTE ELSE 0 END TOTCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN IMPORTE ELSE 0 END TOTCRE, '
        +  'CASE WHEN FORPAG=''BONO''     THEN IMPORTE ELSE 0 END TOTBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN IMPORTE ELSE 0 END TOTBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN IMPORTE ELSE 0 END TOTBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN IMPORTE ELSE 0 END TOTCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 0       ELSE 0 END TOTBEC, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN 1 ELSE 0 END REGCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN 1 ELSE 0 END REGCRE, '
        +  'CASE WHEN FORPAG=''BONO''     THEN 1 ELSE 0 END REGBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN 1 ELSE 0 END REGBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN 1 ELSE 0 END REGBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN 1 ELSE 0 END REGCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 1 ELSE 0 END REGBEC, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 0 ELSE IMPORTE END FACTOTMN '
        +'FROM ( '
        (*
        +'SELECT RUCDNI, FECPAG, CLIEID, IMPORTE, FORPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'' '
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'FROM CXC_ING_VAR_SER '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  ' AND CPTOID IN (''IN0136'',''IN0137'') '
        +  ' and IMPORTE >= CASE WHEN FORPAG = ''BECAS'' THEN 0 ELSE 100 END '
        +  cForpag + cNombre
        +'UNION '
                     *)
        +'SELECT rucdni, MAX ( fecpag ) fecpag, clieid, SUM ( importe ) importe, FORPAG,'
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'' '
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  '     NOMFIN '
        +'FROM( '
        +'      SELECT CASE WHEN DNICON IS NOT NULL THEN DNICON ELSE RUCDNI END RUCDNI, '
        +'             clieid, importe, fecpag, forpag, '
        +'             CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'        FROM CXC_ING_VAR_SER '
        +'       WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        //+'         AND CPTOID IN (''IN0136'',''IN0137'') '
        +          cWhereCpto
        +          cForpag + cNombre
        +'    )  '
        +'Group by CLIEID, NOMFIN, RUCDNI, FORPAG '

        +' ) A, APO201 B, APO101 C, APO158 D '
        +'WHERE A.CLIEID=B.ASOID(+) '
        +  'AND B.USEID=C.USEID(+) AND B.UPROID=C.UPROID(+) AND B.UPAGOID=C.UPAGOID(+) '
        +  'AND C.DPTOID=D.DPTOID(+) '

        +'ORDER BY DPTODES, NOMFIN ';



 	 DMFAC.cdsReporte.Close;
 	 DMFAC.cdsReporte.DataRequest( sSQL );
	 DMFAC.cdsReporte.Open;

   ppdb1.DataSource:=DMFAC.dsReporte;
   ppr1.DataPipeline:=ppdb1;
   ppr1.Template.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\VentasEncinas2008.rtm' ;
   (*ppr1.Template.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\VentasEncinas.rtm' ;*)
   ppr1.Template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
   begin
      ppd1.Report:=ppr1;
      ppd1.ShowModal;
   end
   else
      ppr1.Print;

   ppr1.Stop;
   ppr1.DataPipeline:=nil;
   ppdb1.DataSource := nil;
   ppd1.Report      := nil;
end;

(*************************  resumen forma de pago  ****************************)
procedure TFToolVentaArticulo.bbtnFPagoClick(Sender: TObject);
var
  sSQL : String;
begin
      CondicionesReporte;
   {
      CondicionesReporte;
   sSQL:='Select FORPAG, TIPPAG, '
        +  'SUM(TOTCAJ) TOTCAJ, SUM(TOTCRE) TOTCRE,  SUM(TOTBON) TOTBON, SUM(TOTBAN) TOTBAN, SUM(TOTBOC) TOTBOC, '
        +  'SUM(TOTCHE) TOTCHE, SUM(TOTBEC) TOTBEC, '
        +  'SUM(REGCAJ) REGCAJ, SUM(REGCRE) REGCRE, SUM(REGBON) REGBON, SUM(REGBAN) REGBAN, SUM(REGBOC) REGBOC,'
        +  'SUM(REGCHE) REGCHE, SUM(REGBEC) REGBEC, '
        +  'SUM(FACTOTMN) IMPORTE, SUM( INSCRITOS ) INSCRITOS,  '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO '
        +'FROM ( '
        +'SELECT A.*, CASE WHEN D.DPTODES IS NOT NULL THEN D.DPTODES ELSE ''Z - NO UBICADO'' END DPTODES, '
        +  'B.ASOCODMOD, NVL(ASOTIPID,''TE'') ASOTIPID, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN IMPORTE ELSE 0 END TOTCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN IMPORTE ELSE 0 END TOTCRE, '
        +  'CASE WHEN FORPAG=''BONO''     THEN IMPORTE ELSE 0 END TOTBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN IMPORTE ELSE 0 END TOTBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN IMPORTE ELSE 0 END TOTBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN IMPORTE ELSE 0 END TOTCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 0       ELSE 0 END TOTBEC, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN 1 ELSE 0 END REGCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN 1 ELSE 0 END REGCRE, '
        +  'CASE WHEN FORPAG=''BONO''     THEN 1 ELSE 0 END REGBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN 1 ELSE 0 END REGBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN 1 ELSE 0 END REGBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN 1 ELSE 0 END REGCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 1 ELSE 0 END REGBEC, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 0 ELSE IMPORTE END FACTOTMN, 1 INSCRITOS '
        +'FROM ( '
        +'SELECT A.RUCDNI, FECPAG, A.CLIEID, IMPORTE, FORPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'FROM CXC_ING_VAR_SER A '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  ' AND A.CPTOID IN (''IN0136'',''IN0137'') '
        +  ' and IMPORTE >= CASE WHEN FORPAG = ''BECAS'' THEN 0 ELSE 0 END '
        +  cForpag + cNombre
                         (*
        +'UNION ALL '

        +'SELECT RUCDNI, MAX(FECPAG) FECPAG, CLIEID, SUM(IMPORTE) IMPORTE, FORPAG,  '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' '
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  'NOMFIN '
        +' FROM ( '
        +'SELECT A.RUCDNI, A.CLIEID, IMPORTE, FECPAG, FORPAG, '
        +  'CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'FROM CXC_ING_VAR_SER A '
        +'WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +  cWhereCptoDif
        //+  'AND A.CPTOID LIKE '''+'IN0050'+'%'' and IMPORTE<>170 '
        +  cForpag + cNombre
        +' ) a '
        +'Group by CLIEID, NOMFIN, RUCDNI, FORPAG '
                           *)
        +' ) A, APO201 B, APO101 C, APO158 D '
        +'WHERE A.CLIEID=B.ASOID(+) '
        +  'AND B.USEID=C.USEID(+) AND B.UPROID=C.UPROID(+) AND B.UPAGOID=C.UPAGOID(+) '
        +  'AND C.DPTOID=D.DPTOID(+) '
        +' ) A '
        +'GROUP BY FORPAG, TIPPAG '
        +'ORDER BY FORPAG ';
    }


   sSQL:='Select FORPAG, TIPPAG, '
        +  'SUM(TOTCAJ) TOTCAJ, SUM(TOTCRE) TOTCRE,  SUM(TOTBON) TOTBON, SUM(TOTBAN) TOTBAN, SUM(TOTBOC) TOTBOC, '
        +  'SUM(TOTCHE) TOTCHE, SUM(TOTBEC) TOTBEC, '
        +  'SUM(REGCAJ) REGCAJ, SUM(REGCRE) REGCRE, SUM(REGBON) REGBON, SUM(REGBAN) REGBAN, SUM(REGBOC) REGBOC,'
        +  'SUM(REGCHE) REGCHE, SUM(REGBEC) REGBEC, '
        +  'SUM(FACTOTMN) IMPORTE, SUM( INSCRITOS ) INSCRITOS,  '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO '
        +'FROM ( '
        +'SELECT A.*, CASE WHEN D.DPTODES IS NOT NULL THEN D.DPTODES ELSE ''Z - NO UBICADO'' END DPTODES, '
        +  'B.ASOCODMOD, NVL(ASOTIPID,''TE'') ASOTIPID, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN IMPORTE ELSE 0 END TOTCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN IMPORTE ELSE 0 END TOTCRE, '
        +  'CASE WHEN FORPAG=''BONO''     THEN IMPORTE ELSE 0 END TOTBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN IMPORTE ELSE 0 END TOTBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN IMPORTE ELSE 0 END TOTBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN IMPORTE ELSE 0 END TOTCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 0       ELSE 0 END TOTBEC, '
        +  'CASE WHEN FORPAG=''CAJA''     THEN 1 ELSE 0 END REGCAJ, '
        +  'CASE WHEN FORPAG=''CREDITOS'' THEN 1 ELSE 0 END REGCRE, '
        +  'CASE WHEN FORPAG=''BONO''     THEN 1 ELSE 0 END REGBON, '
        +  'CASE WHEN FORPAG=''BANCO''    THEN 1 ELSE 0 END REGBAN, '
        +  'CASE WHEN FORPAG=''BANCO_OCTA''    THEN 1 ELSE 0 END REGBOC, '
        +  'CASE WHEN FORPAG=''CHEQUE''   THEN 1 ELSE 0 END REGCHE, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 1 ELSE 0 END REGBEC, '
        +  'CASE WHEN FORPAG=''BECAS''    THEN 0 ELSE IMPORTE END FACTOTMN, 1 INSCRITOS '
        +'FROM ( '
        +'SELECT RUCDNI, MAX(FECPAG) FECPAG, CLIEID, SUM(IMPORTE) IMPORTE, FORPAG, '
        +  '''Desde '+DateToStr(dtpFecIni.Date)+' hasta '+DateToStr(dtpFecFin.Date)+''' RANGO, '
        +  'CASE WHEN FORPAG=''CAJA''  THEN ''EFE'' WHEN FORPAG=''CREDITOS'' THEN ''CRE'' WHEN FORPAG=''BONO'' THEN ''BON'''
        +       ' WHEN FORPAG=''BANCO'' THEN ''CTA'' WHEN FORPAG=''BANCO_OCTA'' THEN ''OCT'' WHEN FORPAG=''CHEQUE''   THEN ''CHE'' ELSE ''BEC'' END TIPPAG, '
        +  '     NOMFIN '
        +'FROM( '
        +'      SELECT CASE WHEN DNICON IS NOT NULL THEN DNICON ELSE RUCDNI END RUCDNI, '
        +'             clieid, importe, fecpag, forpag, '
        +'             CASE WHEN NOMCON IS NOT NULL THEN NOMCON ELSE NOMBRE END NOMFIN '
        +'        FROM CXC_ING_VAR_SER '
        +'       WHERE FECPAG>='''+DateToStr(dtpFecIni.Date)+''' AND FECPAG<='''+DateToStr(dtpFecFin.Date)+''' '
        +        cWhereCpto
        +        cForpag + cNombre
        +'    )  '
        +'Group by CLIEID, NOMFIN, RUCDNI, FORPAG '
        +' ) A, APO201 B, APO101 C, APO158 D '
        +'WHERE A.CLIEID=B.ASOID(+) '
        +  'AND B.USEID=C.USEID(+) AND B.UPROID=C.UPROID(+) AND B.UPAGOID=C.UPAGOID(+) '
        +  'AND C.DPTOID=D.DPTOID(+) '
        +' ) A '
        +'GROUP BY FORPAG, TIPPAG '
        +'ORDER BY FORPAG ';

 	 DMFAC.cdsReporte.Close;
 	 DMFAC.cdsReporte.DataRequest( sSQL );
	 DMFAC.cdsReporte.Open;

   ppdb1.DataSource:=DMFAC.dsReporte;
   ppr1.DataPipeline:=ppdb1;
   ppr1.Template.FileName := ExtractFilePath( application.ExeName )+ DMFAC.wRutaRpt+'\VentasEncinasFPago2008.rtm' ;
   (*ppr1.Template.FileName := ExtractFilePath( application.ExeName )+ DMFAC.wRutaRpt+'\VentasEncinasFPago.rtm' ; *)
   ppr1.Template.LoadFromFile;

   Screen.Cursor:=crDefault;

   If cbDiseno.Checked Then
   begin
      ppd1.Report:=ppr1;
      ppd1.ShowModal;
   end
   else
      ppr1.Print;

  ppr1.Stop;
  ppr1.DataPipeline:=nil;
  ppdb1.DataSource:= nil;
  ppd1.Report     := nil;
end;
(******************************************************************************)

procedure TFToolVentaArticulo.FormShow(Sender: TObject);
begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));
end;

procedure TFToolVentaArticulo.bbtnCertificadoClick(Sender: TObject);
begin
   Try
      FImpresionConcurso := TFImpresionConcurso.Create(Application);
      FImpresionConcurso.ShowModal;
   Finally
      FImpresionConcurso.Free;
   End;
end;

end.
