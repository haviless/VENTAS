unit FAC392;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, Mant, Db, Wwdatsrc, DBClient, wwclient, ppDB,
  ppDBPipe, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, fcButton,
  fcImgBtn, fcShapeBtn, MsgDlgs, Grids;

type
  TFBuscaAsociado = class(TForm)
    pnlBot: TPanel;
    bbtnAceptar: TfcShapeBtn;
    edtAsociado: TEdit;
    lblApeMat: TLabel;
    dbgAsociado: TwwDBGrid;
    procedure bbtnAceptarClick(Sender: TObject);
    procedure dbgAsociadoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBuscaAsociado: TFBuscaAsociado;
   xAccesoBotones : Boolean;

implementation

uses oaVe2000, FACDM, FAC388;

{$R *.DFM}


procedure TFBuscaAsociado.bbtnAceptarClick(Sender: TObject);
var
   xSQL: String;
begin
   xSQL:='SELECT * FROM APO201 '
        +'WHERE ASOAPENOMDNI LIKE '+QuotedStr(Trim(edtAsociado.Text+'%'));
   Screen.Cursor:=crHourGlass;
   DMFAC.cdsAsocia.Close;
   DMFAC.cdsAsocia.DataRequest( xSQL );
   DMFAC.cdsAsocia.Open;
   Screen.Cursor:=crDefault;
end;

procedure TFBuscaAsociado.dbgAsociadoDblClick(Sender: TObject);
begin
   FGenFactura.dblcdAso.Text := DMFAC.cdsAsocia.FieldByName('ASOID').AsString;
   FGenFactura.dblcdAsoExit(Self);
   FGenFactura.dblcdAso.SetFocus;
   Close;
end;

procedure TFBuscaAsociado.FormCreate(Sender: TObject);
begin
   dbgAsociado.DataSource:=DMFAC.dsAsocia;
end;

end.
