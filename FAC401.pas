unit FAC401;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls;     

type
  TOnAddObsequio = procedure(Sender: TObject; IArtId:string) of object;

  TFAgregarObsequio = class(TForm)
    Panel2: TPanel;
    Label3: TLabel;
    bbtnFiltra: TBitBtn;
    edFiltro: TEdit;
    Panel1: TPanel;
    btnCancelar: TButton;
    btnAgregar: TButton;
    dbgData: TwwDBGrid;
    procedure dbgDataDblClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure bbtnFiltraClick(Sender: TObject);
    procedure edFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    cLink : String;
    FOnAddObsequio : TOnAddObsequio;
    procedure cargarDxs(ITextFiltro:string='%');
  public
    property OnAddObsequio: TOnAddObsequio read FOnAddObsequio write FOnAddObsequio;
  end;

(* var FAgregarObsequio: TFAgregarObsequio; *)

implementation

{$R *.dfm}

USES FACDM;
 
(******************************************************************************)
procedure TFAgregarObsequio.cargarDxs(ITextFiltro:string);
var
   xSQL : String;
begin
   xSQL:= '  SELECT C.ARTID, C.ARTDES '
         +'    FROM TGE205 C '
         +'   WHERE C.CIAID = ''02'' '
         +'     AND C.TINID IN (''20'',''26'') '
         +'     AND C.ARTDES LIKE ''%''||UPPER('''+ITextFiltro+''')||''%'' '
         +'   ORDER BY C.ARTDES ';

   DMFAC.cdsQry15.Close;
   DMFAC.cdsQry15.DataRequest(xSQL);
   DMFAC.cdsQry15.Open;
   dbgData.DataSource:=DMFAC.dsQry15;
end;
(******************************************************************************)
procedure TFAgregarObsequio.bbtnFiltraClick(Sender: TObject);
begin
    self.cargarDxs(self.edFiltro.text);
end;

(******************************************************************************)
procedure TFAgregarObsequio.btnCancelarClick(Sender: TObject);
begin
   self.Close();
end;

(******************************************************************************)
procedure TFAgregarObsequio.dbgDataDblClick(Sender: TObject);
begin
   self.btnAgregarClick(self.btnAgregar);
end;

(******************************************************************************)
procedure TFAgregarObsequio.btnAgregarClick(Sender: TObject);
begin
    if(DMFAC.cdsQry15.recordcount>0)then
       FOnAddObsequio(Self, DMFAC.cdsQry15.FieldByName('ARTID').AsString)
    else
       showmessage('No hay registros en la busqueda');
end;

(******************************************************************************)
procedure TFAgregarObsequio.edFiltroKeyPress(Sender: TObject;
  var Key: Char);
begin
   IF (KEY = #13) THEN bbtnFiltraClick(bbtnFiltra);
end;

(******************************************************************************)
procedure TFAgregarObsequio.FormActivate(Sender: TObject);
begin
   cLink:='';{'@dbprodlee '; }(*para cuando se quiere hacer pruebas desde produccion -- solo lectura*)
   self.cargarDxs();
end;
(******************************************************************************)
end.
