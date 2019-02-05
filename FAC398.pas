(* Ing. Juver De la Cruz --  29/01/2008 *)
unit FAC398;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, wwdbedit, wwdblook, Buttons, ppEndUsr,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands,
  ppCache, Grids, ValEdit;

type
  TFObsequioMovNormal = class(TForm)
    bbtnAcepta: TBitBtn;
    BitBtn2: TBitBtn;
    bbtnImp: TBitBtn;
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
    GroupBox1: TGroupBox;
    btnAgregar: TButton;
    btnRetirar: TButton;
    VEdObsequios: TValueListEditor;
    Label1: TLabel;
    dblcObsequio: TwwDBLookupCombo;
    dbeObsequio: TwwDBEdit;
    cbDiseno: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure bbtnImpClick(Sender: TObject);
    procedure bbtnAceptaClick(Sender: TObject);
    procedure dblcObsequioExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dblcObsequioChange(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnRetirarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    cLink : String;
    procedure ReciboCompleto(Sender: TObject);
    function isSeleccionoObsequios():boolean;
    procedure AgregarItem(Ikey:string;IValue:string);
  public
    { Public declarations }
  end;

var
  FObsequioMovNormal: TFObsequioMovNormal;

implementation

{$R *.dfm}

USES FACDM;
(***********************  revisados *******************************)
procedure TFObsequioMovNormal.FormActivate(Sender: TObject);
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

  xSQL:='Select * from ASO_CRE_REG_MOV '
       +'Where ASODNI='''+DMFAC.cdsQry12.FieldByName('ASODNI').AsString+''' '
       +  'AND CREDID='''+DMFAC.cdsQry12.FieldByName('CREDID').AsString+'''';
  DMFAC.cdsQry11.Close;
  DMFAC.cdsQry11.DataRequest(xSQL);
  DMFAC.cdsQry11.Open;

  if DMFAC.cdsQry11.RecordCount>0 then
    begin
       (*
       dblcObsequio.Enabled:=False;
       dblcObsequio.Text:=DMFAC.cdsQry11.FieldByName('ARTID').AsString;
       dblcObsequioExit(self);
       *)
       dblcObsequio.Enabled:=False;
       dbeObsequio.Enabled:=False;
       VEdObsequios.Enabled:=False;

       bbtnAcepta.Enabled:=False;
       dbeNumero.Text   :=DMFAC.cdsQry11.FieldByName('NUMERO').AsString;
       cbOk.Checked:=True;
       bbtnImp.Enabled   :=True;
       if DMFAC.cdsQry11.FieldByName('IMPRESO').AsString='S' then
         begin
            cbImp.Checked:=True;
            bbtnAcepta.Enabled:=False;
            bbtnImp.Enabled   :=False;
         end;

       (* obsequios *)

         xSQL:='Select A.*, B.ARTDES '
               +' from ASO_CRE_REG_MOV A, TGE205'+cLink+' B '
               +' Where B.CIAID(+)=''02'' '
               +'  AND A.ARTID=B.ARTID(+) '
               +'  AND A.CREDID = '''+DMFAC.cdsQry12.FieldByName('CREDID').AsString+''' '
				       +'  AND A.ASODNI =  '''+DMFAC.cdsQry12.FieldByName('ASODNI').AsString+'''';


         DMFAC.cdsQry10.Close;
         DMFAC.cdsQry10.DataRequest(xSQL);
         DMFAC.cdsQry10.Open;
         DMFAC.cdsQry10.first;
         while not DMFAC.cdsQry10.eof do
            begin
                 AgregarItem(DMFAC.cdsQry10.FieldByName('ARTID').AsString,
                             DMFAC.cdsQry10.FieldByName('ARTDES').AsString);
                 DMFAC.cdsQry10.next;
            end;
         (* dblcObsequio.LookupTable:=DMFAC.cdsQry10; *)
    end
  else
    begin
        xSQL:='Select A.*, B.ARTDES from ASO_CRE_REG_TAB A, TGE205'+cLink+' B '
       +'Where (EMICARTA=''N'' OR EMICARTA=''A'') '
       +'  AND ACTIVO=''S'' '
       +  'AND B.CIAID(+)=''02'' AND A.ARTID=B.ARTID(+)';

       DMFAC.cdsQry10.Close;
       DMFAC.cdsQry10.DataRequest(xSQL);
       DMFAC.cdsQry10.Open;

       dblcObsequio.LookupTable:=DMFAC.cdsQry10;

    end;

end;
(******************************************************)
procedure TFObsequioMovNormal.dblcObsequioExit(Sender: TObject);
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
(******************************************************)
procedure TFObsequioMovNormal.BitBtn2Click(Sender: TObject);
begin
   Close;
end;
(******************************************************)
procedure TFObsequioMovNormal.dblcObsequioChange(Sender: TObject);
begin
   dblcObsequioExit(Sender);
end;
(******************************************************)
procedure TFObsequioMovNormal.AgregarItem(Ikey:string;IValue:string);
var Row: Integer;//Se utiliza para saber en que renglón fue localizada la clave con FindRow
begin
     if not VEdObsequios.FindRow(Ikey,Row) then
       VEdObsequios.InsertRow(Ikey,IValue,True)
     else
       ShowMessage('El obsequio ya esta en la lista');
end;
(******************************************************)
procedure TFObsequioMovNormal.btnAgregarClick(Sender: TObject);
begin
    IF VEdObsequios.enabled then
      begin
        if(dblcObsequio.Text<>'') then
          AgregarItem(dblcObsequio.Text,dbeObsequio.text)
        else
          ShowMessage('Seleccione un Obsequio');
      end;
end;
(******************************************************)
procedure TFObsequioMovNormal.btnRetirarClick(Sender: TObject);
begin
    IF VEdObsequios.enabled then
      begin
        if(isSeleccionoObsequios) then
           VEdObsequios.DeleteRow(VEdObsequios.Row)
        else
          ShowMessage('No hay obsequios en la lista');
     end;     
end;


(******************************************************)
(******************************************************)
(******************************************************)
(******************************************************)
function TFObsequioMovNormal.isSeleccionoObsequios():boolean;
begin
   (*isSeleccionoObsequios:=(dblcObsequio.Text<>'');                                  *)
   isSeleccionoObsequios:=((VEdObsequios.RowCount>1)AND(VEdObsequios.Keys[1]<>''));
end;
(******************************************************)
procedure TFObsequioMovNormal.bbtnAceptaClick(Sender: TObject);
var
  xSQL, cNumero : String;
  i:integer;
begin

  if (not isSeleccionoObsequios) then
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


  for i := 1 to VEdObsequios.RowCount-1 do
    begin
       xSQL:='Insert into ASO_CRE_REG_MOV '
            +'values( '''+cNumero+''', '''+DMFAC.cdsQry12.FieldByName('ASODNI').AsString+''', '
            +        ''''+DMFAC.cdsQry12.FieldByName('CREDID').AsString+''', '
            +        ''''+VEdObsequios.Keys[i]+''', ''N'', '
            +        'SYSDATE, '''+DMFAC.wUsuario+''','+IntToStr(i)+' )';
       DMFAC.cdsQry.Close;
       DMFAC.cdsQry.DataRequest(xSQL);
       try
          DMFAC.cdsQry.Execute;
       except
          ShowMessage('Intente Grabar Nuevamente...');
          Exit;
       end;
    end;

    (**********
       xSQL:='Insert into ASO_CRE_REG_MOV '
            +'values( '''+cNumero+''', '''+DMFAC.cdsQry12.FieldByName('ASODNI').AsString+''', '
            +        ''''+DMFAC.cdsQry12.FieldByName('CREDID').AsString+''', '
            +        ''''+dblcObsequio.Text+''', ''N'', '
            +        'SYSDATE, '''+DMFAC.wUsuario+''' )';
       DMFAC.cdsQry.Close;
       DMFAC.cdsQry.DataRequest(xSQL);
       try
          DMFAC.cdsQry.Execute;
       except
          ShowMessage('Intente Grabar Nuevamente...');
          Exit;
       end;

       *****)

  dblcObsequio.Enabled:=False;
  dbeNumero.Text:=cNumero;
  bbtnAcepta.Enabled:=False;
  bbtnImp.Enabled   :=True;
  cbOk.Checked:=True;
  ShowMessage('Grabado');
end;
(******************************************************)
procedure TFObsequioMovNormal.bbtnImpClick(Sender: TObject);
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
  ppr1.Template.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\ReciboObsequioMultiple.Rtm' ;
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
(******************************************************)
procedure TFObsequioMovNormal.ReciboCompleto;
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
(******************************************************)

procedure TFObsequioMovNormal.FormShow(Sender: TObject);
begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));
end;

end.
