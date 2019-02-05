unit FAC704;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdblook, wwdbdatetimepicker, ExtCtrls, Buttons, db,
  ComCtrls;

type
  TFContabBaz = class(TForm)
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Bevel2: TBevel;
    dtpDesde: TwwDBDateTimePicker;
    dtpHasta: TwwDBDateTimePicker;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Bevel1: TBevel;
    bbtnProc: TBitBtn;
    bbtnSalir: TBitBtn;
    bbtnRango: TBitBtn;
    pnlPB: TPanel;
    pbReg: TProgressBar;
    Label2: TLabel;
    lblMax: TLabel;
    lblCon: TLabel;
    lblMensaje: TLabel;
    cbConta: TCheckBox;
    procedure bbtnProcClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure bbtnRangoClick(Sender: TObject);
    procedure bbtnSalirClick(Sender: TObject);
    procedure dtpDesdeChange(Sender: TObject);
    procedure dtpHastaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContabBaz: TFContabBaz;

implementation

{$R *.dfm}

uses FacDM, Fac370, oaVE2000, FAC700;

procedure TFContabBaz.bbtnProcClick(Sender: TObject);
var
   xSQL : String;
begin
  if dtpHasta.Date<dtpDesde.Date then
  begin
     ShowMessage('Error : Fecha Hasta NO puede ser menor a Fecha Desde ');
     Exit;
  end;


  if GFactura.FMant.cds2.RecordCount<=0 then
  begin
     ShowMessage('Error : No existe información para generar proceso de contabilización...');
     Exit;
  end;

  lblMensaje.Visible:=False;
  FToolFactSG.sbtnGenCxCClick(self);
  lblMensaje.Visible:=True;
  lblMensaje.Refresh;
  pnlPB.Visible   :=False;
  bbtnProc.Enabled:=false;
end;

procedure TFContabBaz.FormCreate(Sender: TObject);
begin
   dblcCia.LookupTable := DMFAC.cdsCia;
   dblcCia.Text:='04';
   dblcCiaExit(self);
   dtpDesde.Date:=date;
   dtpHasta.Date:=date;
end;

procedure TFContabBaz.FormShow(Sender: TObject);
begin
   dtpDesde.SetFocus;
end;

procedure TFContabBaz.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text := DMFAC.BuscaQry('dspUltTGE','TGE101','CIADES','CIAID='+QuotedStr(dblcCia.Text),'CIADES');
end;

procedure TFContabBaz.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFContabBaz.bbtnRangoClick(Sender: TObject);
Var
   xSql: String;
begin
  if Copy(datetostr(dtpHasta.Date),4,2)<>Copy(datetostr(dtpDesde.Date),4,2) then
  begin
     ShowMessage('Error : Rango de Fechas debe ser del mismo Mes');
     Exit;
  end;

  if dtpHasta.Date<dtpDesde.Date then
  begin
     ShowMessage('Error : Fecha Hasta NO puede ser menor a Fecha Desde ');
     Exit;
  end;

  xSql := 'SELECT * FROM TGE154 WHERE CIAID='+quotedstr(dblcCia.text)+
          ' AND ANO='+quotedstr(Copy(DateToStr(dtpDesde.Date),7,4));
  DMFAC.cdsQry.close;
  DMFAC.cdsQry.datarequest(xSql);
  DMFAC.cdsQry.open;
  if DMFAC.cdsQry.FieldByName('PER'+Copy(DateToStr(dtpDesde.Date),4,2)).AsString = 'S' then
  begin
  	  Showmessage('El Periodo Contable se encuentra Cerrado... Verificar el rango de Fechas');
     dtpHasta.setfocus;
     exit;
  end;

  xSQL:='Select * from FAC305 '
       +'where ciaid='''+dblcCia.Text+''' '
       + ' and facfecha>='''+dtpDesde.Text+''' '
       + ' and facfecha<='''+dtpHasta.Text+'''';
  GFactura.FMant.cds2.Close;
  GFactura.FMant.cds2.DataRequest( xSQL );
  GFactura.FMant.cds2.Open;
  GFactura.FMant.cds2.Last;

  lblMax.Caption:=inttostr(GFactura.FMant.cds2.RecordCount);
  lblCon.Caption:='0';
  pbReg.Max:=GFactura.FMant.cds2.RecordCount;
  pbReg.Position:=0;
  pnlPB.Visible:=True;
  bbtnProc.Enabled:=True;
  
end;

procedure TFContabBaz.bbtnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFContabBaz.dtpDesdeChange(Sender: TObject);
begin
  bbtnProc.Enabled:=False;
end;

procedure TFContabBaz.dtpHastaChange(Sender: TObject);
begin
  bbtnProc.Enabled:=False;
end;

end.
