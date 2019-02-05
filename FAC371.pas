unit FAC371;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, wwdbedit, Buttons, wwdblook, ExtCtrls;

type
  TFVentaDcto = class(TForm)
    bbtnDctoFact: TBitBtn;
    dbeImpDcto: TwwDBEdit;
    Label1: TLabel;
    bbtnCerrar: TBitBtn;
    Label7: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Panel1: TPanel;
    dbeTotVta: TwwDBEdit;
    Label3: TLabel;
    dbeNewTot: TwwDBEdit;
    Label5: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    Bevel3: TBevel;
    bbtnDctoProf: TBitBtn;
    procedure bbtnDctoFactClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnCerrarClick(Sender: TObject);
    procedure dbeImpDctoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnDctoProfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVentaDcto: TFVentaDcto;

implementation

{$R *.dfm}

uses FacDM, FAC370, FAC360VE;


procedure TFVentaDcto.bbtnDctoFactClick(Sender: TObject);
var
  dPorcentaje, dIGV, dImpIGV, dDif, dImpPub : Double;
begin

  if MessageDlg(' ¿ Esta seguro(a) de Generar Descuento ? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
     fDcto:=True;
     Close;
  end;
end;

procedure TFVentaDcto.FormActivate(Sender: TObject);
var
  xSQL, xWhere : String;
begin
  dbeImpDcto.DataSource:=DMFAC.dsQry13;
  dbeTotVta.DataSource :=DMFAC.dsQry13;
  dbeNewTot.DataSource :=DMFAC.dsQry13;
  dblcTMon.DataSource := DMFAC.dsFact2;

  xWhere:='TMONID='+Quotedstr(dblcTMon.Text);
  edtTMon.Text := DMFAC.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
end;

procedure TFVentaDcto.bbtnCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFVentaDcto.dbeImpDctoExit(Sender: TObject);
begin
   DMFAC.cdsQry13.Edit;
   DMFAC.cdsQry13.FieldByName('NEWTOT').AsFloat:=FRound(DMFAC.cdsQry13.FieldByName('TOTVTA').AsFloat-DMFAC.cdsQry13.FieldByName('IMPORTE').AsFloat,15,2);
   DMFAC.cdsQry13.Post;
end;

procedure TFVentaDcto.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
    begin
      Key := #0;
      Perform(CM_DialogKey,VK_TAB,0);
    end;
end;

procedure TFVentaDcto.bbtnDctoProfClick(Sender: TObject);
begin
  if MessageDlg(' ¿ Esta seguro(a) de Generar Descuento en Proforma? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
     fDctoP:=True;
     Close;
  end;
end;

end.
