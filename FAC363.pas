// HPC_201603_FAC 06/05/2016 Añade formulario FAC363 Exportación de Tablas hacia DM-WEB

unit FAC363;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, DB, DBTables;

type
  TFExportaTdaVirtual = class(TForm)
    bbtnExporta: TBitBtn;
    bbtnCancela: TBitBtn;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    edtciaid   : TMaskEdit;
    edtalmid   : TMaskEdit;
    edtlprecios: TMaskEdit;
    edtfecha   : TMaskEdit;
    edtversion : TMaskEdit;

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnExportaClick(Sender: TObject);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExportaTdaVirtual: TFExportaTdaVirtual;

implementation

uses FacDM;

{$R *.dfm}

procedure TFExportaTdaVirtual.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DialogKey, VK_TAB, 0);
   End;
end;


procedure TFExportaTdaVirtual.bbtnExportaClick(Sender: TObject);

Var
   xSQL: String;
   v_ciaid, v_almid, v_lprec, v_fecha, v_vers :  String;

Begin
   v_ciaid :=  edtciaid.text ;
   v_almid :=  edtalmid.text;
   v_lprec :=  edtlprecios.text;
   v_fecha :=  copy (edtfecha.text,1,2) + copy (edtfecha.text,4,2)+ copy (edtfecha.text,7,4);
   v_vers  :=  edtversion.text;

   Begin
      DMFAC.DCOM1.AppServer.IniciaTransaccion;
    xSQL :=  ' Declare v_err_num varchar2(2); v_err_msg varchar2(500);'
         + ' Begin db2admin.sp_facweb_envia('
         + QuotedStr(edtciaid.text) + ','
         + QuotedStr(edtalmid.text)  + ','
         + QuotedStr(edtlprecios.text) + ','
         + QuotedStr(v_fecha)   + ','
         + QuotedStr(edtversion.text)  + ','
         + 'v_err_num, v_err_msg); End;' ;
      Try
         DMFAC.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al Exportar Interfases');
         DMFAC.DCOM1.AppServer.RetornaTransaccion;
         Screen.Cursor := crDefault;
         exit;
      End;
   End;
   ShowMessage('Archivos Exportados');
   Close;

end;

procedure TFExportaTdaVirtual.bbtnCancelaClick(Sender: TObject);
begin
   Screen.Cursor := crDefault;
   Close;
end;

procedure TFExportaTdaVirtual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

end.
