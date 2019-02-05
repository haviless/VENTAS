unit Fac701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, wwdbedit, Buttons, ExtCtrls, wwdblook;

type
  TFFacMaesClie = class(TForm)
    Label27: TLabel;
    dbeRuc: TwwDBEdit;
    Label52: TLabel;
    dbeDNI: TwwDBEdit;
    Label10: TLabel;
    dbeRazSoc: TwwDBEdit;
    Label11: TLabel;
    dbeDirCom: TwwDBEdit;
    Label13: TLabel;
    dbeTelef: TwwDBEdit;
    Label25: TLabel;
    dbeClie: TwwDBEdit;
    bbtnOK: TBitBtn;
    bbtnCancel: TBitBtn;
    rgTipo: TRadioGroup;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dbeClieEnter(Sender: TObject);
    procedure dbeClieExit(Sender: TObject);
  private
    { Private declarations }
    procedure LimpiaControles;
    procedure ValidaDatos;
  public
    { Public declarations }
  end;

var
  FFacMaesClie: TFFacMaesClie;

implementation

uses FacDM;

{$R *.DFM}

procedure TFFacMaesClie.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key := #0;
      perform(CM_Dialogkey, VK_TAB, 0);
   end;
end;

procedure TFFacMaesClie.FormShow(Sender: TObject);
begin
   DMFAC.AccesosUsuarios( DMFAC.wModulo,DMFAC.wUsuario,'2',Screen.ActiveForm.Name );
   LimpiaControles;
end;

procedure TFFacMaesClie.LimpiaControles;
begin
  dbeClie.text:='';
  dbeRazSoc.text:='';
  dbeRuc.text:='';
  dbeDNI.text:='';
  dbeDirCom.text:='';
  dbeTelef.text:='';
end;

procedure TFFacMaesClie.bbtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFFacMaesClie.bbtnOKClick(Sender: TObject);
var
   sZonVtaid,sTvtaid,sClauxId,sTipperId,sSQL:string;
begin
   ValidaDatos;

   FiltraCds(DMFAC.cdsQry,'SELECT * FROM FAC105');
   sTvtaId:=DMFAC.cdsQry.FieldByName('TVTAID').AsString;

   FiltraCds(DMFAC.cdsQry,'SELECT * FROM FAC106');
   sZonVtaId:=DMFAC.cdsQry.FieldByName('ZVTAID').AsString;

   FiltraCds(DMFAC.cdsQry,'SELECT * FROM TGE102 WHERE MODULO LIKE ''%FAC%'' AND CLAUXCP=''A''');
   sClauxId:=DMFAC.cdsQry.FieldByName('CLAUXID').AsString;

   if rgTipo.Itemindex=0 then
   begin
      FiltraCds(DMFAC.cdsQry,'SELECT * FROM TGE109 WHERE TIPPERS=''S'' ');
   end
   else
   begin
      FiltraCds(DMFAC.cdsQry,'SELECT * FROM TGE109 WHERE TIPPERS=''N'' ');
   end;
   sTipperId:=DMFAC.cdsQry.FieldByName('TIPPERID').AsString;

   sSQL:='';
   sSQL:='SELECT * FROM TGE204 WHERE 1<>1 ';

   DMFAC.cdsClie.Close;
   DMFAC.cdsClie.DataRequest(sSQL);
   DMFAC.cdsClie.Open;

   DMFAC.cdsClie.Insert;
   DMFAC.cdsClie.FieldByName('CIAID').AsString:=dblcCia.Text;
   DMFAC.cdsClie.FieldByName('CLIEID').AsString:=dbeClie.Text;
   DMFAC.cdsClie.FieldByName('CLIEABR').AsString:=Copy(dbeRazSoc.text,1,15);
   DMFAC.cdsClie.FieldByName('CLIERUC').AsString:=dbeRuc.text;
   DMFAC.cdsClie.FieldByName('CLIEGIRA').AsString:=Copy(dbeRazSoc.text,1,40);
   DMFAC.cdsClie.FieldByName('CLIEDIR').AsString:=Copy(dbeDirCom.text,1,50);
   DMFAC.cdsClie.FieldByName('CLIETELF').AsString:=Copy(dbeTelef.text,1,20);
   DMFAC.cdsClie.FieldByName('CLAUXID').AsString:=sClauxID;
   DMFAC.cdsClie.FieldByName('TIPPERID').AsString:=sTipperId;
   DMFAC.cdsClie.FieldByName('ZONVTAID').AsString:=sZonVtaid;
   DMFAC.cdsClie.FieldByName('TVTAID').AsString:=sTvtaId;
   DMFAC.cdsClie.FieldByName('CLIEDES').AsString:=Copy(dbeRazSoc.text,1,90);
   DMFAC.cdsClie.FieldByName('CLIEDNI').AsString:=dbeDNI.text;
   DMFAC.cdsClie.FieldByName('USERID').AsString:=DMFAC.wUsuario;
   DMFAC.cdsClie.FieldByName('FREG').AsDateTime:=DMFAC.DateS;
   DMFAC.cdsClie.FieldByName('HREG').AsDateTime:=Time;
   DMFAC.cdsPost(DMFAC.cdsClie);
   DMFAC.ControlTran(9,DMFAC.cdsClie,'CLIENTE');

   DMFAC.DCOM1.AppServer.IniciaTransaccion;
   DMFAC.GrabaAuxConta( DMFAC.cdsClie );
   DMFAC.DCOM1.AppServer.GrabaTransaccion;
   ShowMessage('Datos Ingresados Correctamente.'+#13+'Código de Cliente: '+dbeClie.text);
   Close;
end;

procedure TFFacMaesClie.ValidaDatos;
var
   xSQL : String;
begin
   xSQL := 'select CLIEID from TGE204 '
          +'where CIAID='+quotedstr(dblcCia.Text)
          +'  and CLIEID='+quotedstr(dbeClie.Text);
   FiltraCds(DMFAC.cdsQry,xSQL);
   if DMFAC.cdsQry.RecordCount>0 then
   begin
      ShowMessage('Cliente ya fue registrado anteriormente!!');
      dbeClie.SetFocus;
      exit;
   end;

   if dbeRazSoc.text='' then
   begin
      dbeRazSoc.SetFocus;
      Raise Exception.Create('Ingrese Razón Social');
   end;

   if rgTipo.ItemIndex=1 then
   begin
      if dbeRuc.text='' then
      begin
         dbeRuc.SetFocus;
         Raise Exception.Create('Ingrese RUC');
      end;
   end;

   if dbeDirCom.text='' then
   begin
      dbeDirCom.SetFocus;
      Raise Exception.create('Ingrese Dirección');
   end;
end;

procedure TFFacMaesClie.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:= DMFAC.BuscaQry('dspUltTGE','TGE101','CIADES','CIAID='+QuotedStr(dblcCia.Text),'CIADES');
   if length(trim(edtCia.Text))=0 then
   begin
      ShowMessage('Falta registrar la Compañía');
      dblcCia.SetFocus;
      exit;
   end;
end;

procedure TFFacMaesClie.dbeClieEnter(Sender: TObject);
begin
   if length(trim(dbeClie.Text))=0 then
   begin
      FiltraCds(DMFAC.cdsQry,'SELECT MAX(SUBSTR(AUXID,2,4)) ID FROM CNT201 WHERE CLAUXID=''C'' AND LENGTH(AUXID)=5  '+
            ' AND AUXID<>''C9999'' AND SUBSTR(AUXID,2,1)  IN (''0'',''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'') ');
      dbeClie.Text:='C'+DMFAC.StrZero(IntToStr(StrToInt(DMFAC.cdsQry.FieldByName('ID').AsString)+1),4);
   end;
end;

procedure TFFacMaesClie.dbeClieExit(Sender: TObject);
var
   xSQL : String;
begin
   xSQL := 'select CLIEID from TGE204 where CIAID='+quotedstr(dblcCia.Text)
          +' and CLIEID='+quotedstr(dbeClie.Text);
   FiltraCds(DMFAC.cdsQry,xSQL);
   if DMFAC.cdsQry.RecordCount>0 then
   begin
      ShowMessage('Cliente ya fue registrado anteriormente!!');
      dbeClie.SetFocus;
      exit;
   end;
end;

end.
