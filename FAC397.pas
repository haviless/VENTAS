unit FAC397;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, wwdbedit, wwdblook, Buttons, ppEndUsr,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands,
  ppCache;

type
  TFObsequioMov = class(TForm)
    bbtnAcepta: TBitBtn;
    BitBtn2: TBitBtn;
    dblcObsequio: TwwDBLookupCombo;
    dbeObsequio: TwwDBEdit;
    bbtnImp: TBitBtn;
    Label1: TLabel;
    Panel1: TPanel;
    cbImp: TCheckBox;
    cbOk: TCheckBox;
    ppdb1: TppDBPipeline;
    ppr1: TppReport;
    ppd1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    Label2: TLabel;
    dbeAso: TwwDBEdit;
    dbeNumero: TwwDBEdit;
    Label3: TLabel;
    cbDiseno: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure bbtnImpClick(Sender: TObject);
    procedure bbtnAceptaClick(Sender: TObject);
    procedure dblcObsequioExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dblcObsequioChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    cLink : String;
    procedure ReciboCompleto(Sender: TObject);

  public
    { Public declarations }
  end;

var
  FObsequioMov: TFObsequioMov;

implementation

{$R *.dfm}

USES FACDM;

procedure TFObsequioMov.FormActivate(Sender: TObject);
var
  xSQL : String;
begin
  cLink:='@dbprodlee ';
  cLink:='';
  dblcObsequio.Enabled:=True;
  cbOk.Checked :=False;
  cbImp.Checked:=False;
  bbtnAcepta.Enabled:=True;
  bbtnImp.Enabled   :=False;
  dbeAso.Text       :=DMFAC.cdsQry12.FieldByName('ASOAPENOMDNI').AsString;
  (*
  xSQL:='Select A.*, B.ARTDES from ASO_CRE_REG_TAB A, TGE205'+cLink+' B '
       +'Where ACTIVO=''S'' '
       +  'AND '+DMFAC.cdsQry12.FieldByName('CREMTOOTOR').AsString+' '
       +      'BETWEEN RANGO_INI AND RANGO_FIN '
       +  'AND B.CIAID(+)=''02'' AND A.ARTID=B.ARTID(+)';
       *)

  (* modificado 20080721
  xSQL:='Select A.*, B.ARTDES from ASO_CRE_REG_TAB A, TGE205'+cLink+' B '
       +'Where EMICARTA=''S'' '
       +'  AND ACTIVO=''S'' '
       +  'AND '+DMFAC.cdsQry12.FieldByName('CREMTOOTOR').AsString+' '
       +      'BETWEEN RANGO_INI AND RANGO_FIN '
       +  'AND B.CIAID(+)=''02'' AND A.ARTID=B.ARTID(+)';

   *)

  xSQL:='Select A.*, B.ARTDES from ASO_CRE_REG_TAB A, TGE205'+cLink+' B '
       +'Where ACTIVO=''S'' '
       +'  AND B.CIAID(+)=''02'' '
       +'  AND A.ARTID=B.ARTID(+)'
       +'  and ((EMICARTA=''S'' '
       +'           AND '+DMFAC.cdsQry12.FieldByName('CREMTOOTOR').AsString
       +'             BETWEEN RANGO_INI AND RANGO_FIN ) '
       +'         or (EMICARTA=''A'')) ';



  DMFAC.cdsQry10.Close;
  DMFAC.cdsQry10.DataRequest(xSQL);
  DMFAC.cdsQry10.Open;

  dblcObsequio.LookupTable:=DMFAC.cdsQry10;

  xSQL:='Select * from ASO_CRE_REG_MOV '
       +'Where ASODNI='''+DMFAC.cdsQry12.FieldByName('ASODNI').AsString+''' '
       +  'AND CREDID='''+DMFAC.cdsQry12.FieldByName('CREDID').AsString+'''';
  DMFAC.cdsQry11.Close;
  DMFAC.cdsQry11.DataRequest(xSQL);
  DMFAC.cdsQry11.Open;

  if DMFAC.cdsQry11.RecordCount>0 then
  begin
     dblcObsequio.Enabled:=False;
     bbtnAcepta.Enabled:=False;
     dbeNumero.Text   :=DMFAC.cdsQry11.FieldByName('NUMERO').AsString;
     dblcObsequio.Text:=DMFAC.cdsQry11.FieldByName('ARTID').AsString;
     dblcObsequioExit(self);
     cbOk.Checked:=True;
     bbtnImp.Enabled   :=True;
     if DMFAC.cdsQry11.FieldByName('IMPRESO').AsString='S' then
     begin
        cbImp.Checked:=True;
        bbtnAcepta.Enabled:=False;
        bbtnImp.Enabled   :=False;
     end;
  end;

end;

procedure TFObsequioMov.bbtnImpClick(Sender: TObject);
var
  xSQL : String;
begin
  Screen.Cursor := crHourGlass;
  xSQL:='SELECT IMPRESO FROM ASO_CRE_REG_MOV '
       +'WHERE ASODNI='''+DMFAC.cdsQry12.FieldByName('ASODNI').AsString+''' '
       +  'AND CREDID='''+DMFAC.cdsQry12.FieldByName('CREDID').AsString+'''';
  DMFAC.cdsQry.Close;
  DMFAC.cdsQry.DataRequest(xSQL);
  DMFAC.cdsQry.Open;
  if DMFAC.cdsQry.RecordCount<=0 then
  begin
     ShowMessage('Falta Aceptar Obsequio');
     Exit;
  end;

  if DMFAC.cdsQry.FieldByName('IMPRESO').AsString='S' then
  begin
     ShowMessage('Recibo ya fue Impreso. Verificar');
     Exit;
  end;

  xSQL:='Select A.NUMERO, A.ASODNI, B.ASOAPENOMDNI, A.CREDID, A.ARTID, C.ARTDES, A.USUARIO, D.CREFOTORG '
       +'From ASO_CRE_REG_MOV A, APO201'+cLink+' B, TGE205'+cLink+' C, CRE301'+cLink+' D '
       +'Where A.ASODNI='''+DMFAC.cdsQry12.FieldByName('ASODNI').AsString+''' '
       +  'AND A.CREDID='''+DMFAC.cdsQry12.FieldByName('CREDID').AsString+''' '
       +  'AND A.ASODNI=B.ASODNI(+) '
       +  'AND C.CIAID(+)=''02'' AND C.TINID IN (''20'',''26'') AND A.ARTID=C.ARTID(+) '
       +  'AND A.ASODNI=D.ASODNI(+) AND A.CREDID=D.CREDID(+) '
       +  'AND NOT D.CREESTID IN (''13'',''04'') ';
  DMFAC.cdsQry13.Close;
  DMFAC.cdsQry13.DataRequest(xSQL);
  DMFAC.cdsQry13.Open;

  ppdb1.DataSource:=DMFAC.dsQry13;
  ppr1.Template.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\ReciboObsequio.Rtm' ;
  ppr1.Template.LoadFromFile;

  Screen.Cursor := crDefault;

  If cbDiseno.Checked Then
     ppd1.ShowModal
  else
  begin
    ppr1.OnPrintingComplete := ReciboCompleto;
    ppr1.Print;
  end;

  cbImp.Checked:=True;
  bbtnImp.Enabled   :=False;
end;

procedure TFObsequioMov.ReciboCompleto;
var
  xSQL : String;
begin
  xSQL:='Update ASO_CRE_REG_MOV '
       +   'SET IMPRESO=''S'', FREG=SYSDATE, USUARIO='''+DMFAC.wUsuario+''' '
       +'WHERE ASODNI='''+DMFAC.cdsQry12.FieldByName('ASODNI').AsString+''' '
       +  'AND CREDID='''+DMFAC.cdsQry12.FieldByName('CREDID').AsString+''' ';
  DMFAC.cdsQry.Close;
  DMFAC.cdsQry.DataRequest(xSQL);
  DMFAC.cdsQry.Execute;
  ppr1.PreviewForm.Close;
end;


procedure TFObsequioMov.bbtnAceptaClick(Sender: TObject);
var
  xSQL, cNumero : String;
begin

  if dblcObsequio.Text='' then
  begin
     ShowMessage('Debe Elegir un Obsequio');
     Exit;
  end;

  xSQL:='SELECT IMPRESO FROM ASO_CRE_REG_MOV '
       +'WHERE ASODNI='''+DMFAC.cdsQry12.FieldByName('ASODNI').AsString+''' '
       +  'AND CREDID='''+DMFAC.cdsQry12.FieldByName('CREDID').AsString+'''';
  DMFAC.cdsQry.Close;
  DMFAC.cdsQry.DataRequest(xSQL);
  DMFAC.cdsQry.Open;
  if DMFAC.cdsQry.RecordCount>=1 then
  begin
     ShowMessage('Registro ya Fue Grabado');
     Exit;
  end;

  xSQL:='SELECT MAX(NUMERO) NUMERO FROM ASO_CRE_REG_MOV';
  DMFAC.cdsQry.Close;
  DMFAC.cdsQry.DataRequest(xSQL);
  DMFAC.cdsQry.Open;
  if DMFAC.cdsQry.FieldByname('NUMERO').AsString='' then
     cNumero:='000001'
  else
     cNumero:=DMFAC.StrZero( IntToStr(StrToInt(DMFAC.cdsQry.FieldByname('NUMERO').AsString)+1), 6 );

  xSQL:='Insert into ASO_CRE_REG_MOV '
       +'values( '''+cNumero+''', '''+DMFAC.cdsQry12.FieldByName('ASODNI').AsString+''', '
       +        ''''+DMFAC.cdsQry12.FieldByName('CREDID').AsString+''', '
       +        ''''+dblcObsequio.Text +''', ''N'', '
       +        'SYSDATE, '''+DMFAC.wUsuario+''',1 )';
  DMFAC.cdsQry.Close;
  DMFAC.cdsQry.DataRequest(xSQL);
  try
     DMFAC.cdsQry.Execute;
  except
     ShowMessage('Intente Grabar Nuevamente...');
     Exit;
  end;

  dblcObsequio.Enabled:=False;
  dbeNumero.Text:=cNumero;
  bbtnAcepta.Enabled:=False;
  bbtnImp.Enabled   :=True;
  cbOk.Checked:=True;
  ShowMessage('Grabado');
end;

procedure TFObsequioMov.dblcObsequioExit(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='SELECT ARTDES FROM TGE205 C '
       +'Where C.CIAID(+)=''02'' AND C.TINID IN (''20'',''26'') '
       +  'AND C.ARTID='''+dblcObsequio.Text+'''';
  DMFAC.cdsQry.Close;
  DMFAC.cdsQry.DataRequest(xSQL);
  DMFAC.cdsQry.Open;
  dbeObsequio.Text:=DMFAC.cdsQry.FieldByname('ARTDES').AsString;
end;

procedure TFObsequioMov.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure TFObsequioMov.dblcObsequioChange(Sender: TObject);
begin
   dblcObsequioExit(Sender);
end;

procedure TFObsequioMov.FormShow(Sender: TObject);
begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));
end;

end.
