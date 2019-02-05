unit FAC372;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdblook;

type
  TFCondComercial = class(TForm)
    Label20: TLabel;
    dblcFPago: TwwDBLookupCombo;
    edtFPago: TEdit;
    bbtnRegOk: TBitBtn;
    bbtnRegCanc: TBitBtn;
    procedure bbtnRegCancClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnRegOkClick(Sender: TObject);
    procedure dblcFPagoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cCia : String;
  end;

var
  FCondComercial: TFCondComercial;

implementation

uses FacDM, oaVE2000, Fac370;

{$R *.dfm}


procedure TFCondComercial.bbtnRegCancClick(Sender: TObject);
begin
   Close;
end;

procedure TFCondComercial.FormShow(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'SELECT * FROM TGE180 WHERE '
            +'CIAID ='+QuotedStr(cCia);
   Filtracds( DMFAC.cdsQry9, xWhere );

   dblcFPago.LookupTable:=DMFAC.cdsQry9;

end;

procedure TFCondComercial.bbtnRegOkClick(Sender: TObject);
var
   xSQL, xWhere, xCtaTot, xCPtoTot, xxCcosId : String;
begin

// Inicio HPC_201601_FAC
   xSQL:='Select CC_CONTA FROM CXC301 '
        +'WHERE CIAID='''  +DMFAC.cdsFact2.FieldByName('CIAID').AsString   +''' '
        +  'AND CCSERIE='''+DMFAC.cdsFact2.FieldByName('FACSERIE').AsString+''' '
        +  'AND DOCID='''+DMFAC.cdsFact2.FieldByName('DOCID').AsString+''' '
        +  'AND CCNODOC='''+DMFAC.cdsFact2.FieldByName('NFAC').AsString    +''' ';
// Fin HPC_201601_FAC        
   FiltraCDS(DMFAC.cdsReporte,xSQL);

   if DMFAC.cdsReporte.FieldByName('CC_CONTA').AsString='S' then
   begin
      ShowMessage('NO se puede cambiar Condición Comercial, Factura ya fue transferida a Contabilidad');
      Exit;
   end;

   if MessageDlg('Cambiar la Condición Comercial del Documento'+chr(13)
                +'      ¿Esta Seguro?    ',mtConfirmation, [mbYes, mbNo], 0)=mrNo then
   begin
      Exit;
   end;



   if (trim(dblcFPago.text)<>'') and (dblcFPago.text<>DMFAC.cdsFact2.FieldByName('FPAGOID').AsString) then
   begin
      // busca Cuenta contable
      xSQL:=      'CIAID='     +Quotedstr( DMFAC.cdsFact2.FieldByName('CIAID').AsString )
           + ' AND DOCID='     +Quotedstr( DMFAC.cdsFact2.FieldByName('DOCID').AsString )
           + ' AND TMONID='    +Quotedstr( DMFAC.cdsFact2.FieldByName('TMONID').AsString)
           + ' AND CPTOCCOMER='+Quotedstr( dblcFPago.text)
           + ' AND CPTOCABVTA='+Quotedstr('S');
      DMFAC.BuscaQry('dspUltTGE', 'CXC208', '*', xSQL, 'CPTOCAB');

      xCtaTot  := DMFAC.cdsQry.FieldByName('CUENTAID').AsString ;
      xCPtoTot := DMFAC.cdsQry.FieldByName('CPTOCAB').AsString ;

      // hayar el CCosto si cuenta lleva
      xWhere:='SELECT CTA_CCOS FROM TGE202 '
             +'WHERE CIAID='   +QuotedStr( DMFAC.cdsFact2.FieldByName('CIAID').AsString )
             + ' AND CUENTAID='+QuotedStr( xCtaTot );
      FiltraCDS(DMFAC.cdsReporte,xWhere);
      if DMFAC.cdsReporte.FieldByName('CTA_CCOS').AsString = 'S' then
      begin
         xWhere:='SELECT UPROID, UPAGOID, USEID FROM APO201 '+
                 'WHERE ASOID='+QuotedStr(DMFAC.cdsFact2.FieldByName('CLIEID').AsString);
         FiltraCDS(DMFAC.cdsReporte,xWhere);

         xWhere:='SELECT CCOSID '+
                 'FROM APO101 '  +
                 'WHERE UPROID=' +QuotedStr(DMFAC.cdsReporte.FieldByName('UPROID').AsString)+' '+
                   'AND UPAGOID='+QuotedStr(DMFAC.cdsReporte.FieldByName('UPAGOID').AsString)+' '+
                   'AND USEID='  +QuotedStr(DMFAC.cdsReporte.FieldByName('USEID').AsString);
         FiltraCDS(DMFAC.cdsReporte,xWhere);

         xxCcosId:=DMFAC.cdsReporte.FieldByName('CCOSID').AsString;
      end
      else
         xxCcosId:='';
      // fin ccosto

      // Actualiza.
      Errorcount:=0;
      DMFAC.DCOM1.AppServer.IniciaTransaccion;

      // actualiza cxc301
      xSQL:='Update CXC301 set CCPTOTOT='''+xCPtoTot+''', '
           +                  'CTATOTAL='''+xCtaTot +''' '
           +'WHERE CIAID='''  +DMFAC.cdsFact2.FieldByName('CIAID').AsString   +''' '
           +  'AND CCSERIE='''+DMFAC.cdsFact2.FieldByName('FACSERIE').AsString+''' '
           +  'AND CCNODOC='''+DMFAC.cdsFact2.FieldByName('NFAC').AsString    +''' ';
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);

      // actualiza cxc302
      xSQL:='Update CXC302 set CPTOID='''  +xCPtoTot+''', '
           +                  'CUENTAID='''+xCtaTot +''', '
           +                  'CCOSID='''  +xxCcosId+''' '
           +'WHERE CIAID='''  +DMFAC.cdsFact2.FieldByName('CIAID').AsString   +''' '
           +  'AND CCSERIE='''+DMFAC.cdsFact2.FieldByName('FACSERIE').AsString+''' '
           +  'AND CCNODOC='''+DMFAC.cdsFact2.FieldByName('NFAC').AsString    +''' '
           +  'AND TIPDET=''TO''';
      DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);

      // actualiza fac305
      DMFAC.cdsFact2.Edit;
      DMFAC.cdsFact2.FieldByName('FPAGOID').AsString :=dblcFPago.text;

      DMFAC.cdsFact2.FieldByName('INICIAL').AsFloat:=0;
      if (DMFAC.cdsFact2.FieldByName('CIAID').AsString='04') and (DMFAC.cdsFact2.FieldByName('FPAGOID').AsString='01') then
         DMFAC.cdsFact2.FieldByName('INICIAL').AsFloat:=FRound(DMFAC.cdsFact2.FieldByName('FACTOTMN').AsFloat,15,2);

      DMFAC.cdsFact2.Post;
      DMFAC.ControlTran( 0, DMFAC.cdsFact2, 'FACSGUIA');

      DMFAC.ControlTran( 8, nil, '' );

      FFactSGuia.edtFPago.Text:=edtFPago.Text;

      ShowMessage('Ok, Condición Comercial Cambiada...');
   end;

   Close;
end;

procedure TFCondComercial.dblcFPagoExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere:='CIAID='+QuotedStr(DMFAC.cdsFact2.FieldByName('CIAID').AsString)
          + ' AND CCOMERID ='+QuotedStr(dblcFPago.Text);

   DMFAC.BuscaQry('dspUltTGE','TGE180','DCCOMDES, DCCOMPORC',xWhere,'DCCOMDES');
   edtFPago.Text := DMFAC.cdsQry.FieldByName('DCCOMDES').AsString;
end;

end.
