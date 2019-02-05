// HPC_201603_FAC 06/05/2016 Añade formulario FAC364 Importación de Tablas desde DM-WEB

unit FAC364;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFImportaTdaVirtual = class(TForm)
    StaticText1: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    edtciaid: TMaskEdit;
    edtfecha: TMaskEdit;
    edtversion: TMaskEdit;
    bbtnImporta: TBitBtn;
    bbtnCancela: TBitBtn;

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnImportaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImportaTdaVirtual: TFImportaTdaVirtual;

implementation

uses FacDM;

{$R *.dfm}

procedure TFImportaTdaVirtual.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DialogKey, VK_TAB, 0);
   End;
end;

procedure TFImportaTdaVirtual.bbtnCancelaClick(Sender: TObject);
begin
   Screen.Cursor := crDefault;
   Close;
end;

procedure TFImportaTdaVirtual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;


procedure TFImportaTdaVirtual.bbtnImportaClick(Sender: TObject);
Var
   xSQL: String;
   v_ciaid, v_fecha, v_vers :  String;

Begin
   v_ciaid :=  edtciaid.text ;
   v_fecha :=  copy (edtfecha.text,1,2) + copy (edtfecha.text,4,2)+ copy (edtfecha.text,7,4);
   v_vers  :=  edtversion.text;

   Begin
      DMFAC.DCOM1.AppServer.IniciaTransaccion;
    xSQL :=  ' Declare v_err_num varchar2(2); v_err_msg varchar2(500);'
         + ' Begin db2admin.sp_facweb_recibe('
         + QuotedStr(v_fecha)   + ','
//         + QuotedStr(edtversion.text)  + ','
         + 'v_err_num, v_err_msg); End;' ;
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al Importar Interfases, Archivos para esta fecha NO existen');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         exit;
      End;
   End;
   ShowMessage('Archivos Importados');
   Close;


End;

end.


