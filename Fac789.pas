unit Fac789;

// Actualizaciones
// HPC_201603_FAC 06/05/2016 Añade 2 formularios nuevos
//                           FAC363 Exportación de Tablas hacia DM-WEB
//                           FAC364 Importación de Tablas desde DM-WEB


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, wwdblook, Buttons;

type
  TFToolProf = class(TForm)
    pnlTool: TPanel;
    SpeedButton1: TSpeedButton;
    sbtnOrdenDespacho: TSpeedButton;
    BitBtn1: TBitBtn;
    Timer1: TTimer;
    bbtnActVendedor: TBitBtn;
    bbtnExporta: TBitBtn;
    bbtnImporta: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure bbtnActVendedorClick(Sender: TObject);
    procedure bbtnExportaClick(Sender: TObject);
    procedure bbtnImportaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   FToolProf: TFToolProf;
   xAccesoBotones : Boolean;

implementation

// Inicio HPC_201603_FAC
// Añade 2 formularios nuevos
// FAC363 Exportación de Tablas hacia DM-WEB
// FAC364 Importación de Tablas desde DM-WEB
uses Fac701, FACDM, FAC361, oaVe2000, FAC363, FAC364;
// Fin HPC_201603_FAC

{$R *.DFM}

procedure TFToolProf.BitBtn1Click(Sender: TObject);
begin
  try
    FFacMaesClie := TFFacMaesClie.Create(Self);
    FFacMaesClie.ShowModal;
  finally
    FFacMaesClie.Free;
  end;
end;

procedure TFToolProf.Timer1Timer(Sender: TObject);
begin
   //FVariables.w_NombreForma := 'FToolProf';
   if (sSupervisor = 'S') or (DMFAC.wUsuario='ATENORIO') Then
      bbtnActVendedor.Visible := True
   else
      bbtnActVendedor.Visible := False;

// Inicio HPC_201311_FAC
// incluye al usuario de tipo administrador en el destroy del timer
{
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolProf);
      xAccesoBotones := True;
   end;
}
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then
   else
   begin
      if not xAccesoBotones then
      begin
         DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolProf);
         xAccesoBotones := True;
      end;
   end;
// Fin HPC_201311_FAC

   Timer1.Destroy;
end;

procedure TFToolProf.bbtnActVendedorClick(Sender: TObject);
begin
   try
      FActVendProforma := TFActVendProforma.Create(Self);
      FActVendProforma.ShowModal;
   finally
      FActVendProforma.Free;
   end;
end;

// Inicio HPC_201603_FAC
// FAC363 Exportación de Tablas hacia DM-WEB
procedure TFToolProf.bbtnExportaClick(Sender: TObject);
begin
   try
      FExportaTdaVirtual := TFExportaTdaVirtual.Create(Self);
      FExportaTdaVirtual.ShowModal;
   finally
      FExportaTdaVirtual.Free;
   end;
end;
// Fin HPC_201603_FAC

// Inicio HPC_201603_FAC
// FAC364 Importación de Tablas desde DM-WEB
procedure TFToolProf.bbtnImportaClick(Sender: TObject);
begin
   try
      FImportaTdaVirtual := TFImportaTdaVirtual.Create(Self);
      FImportaTdaVirtual.ShowModal;
   finally
      FImportaTdaVirtual.Free;
   end;
end;
// Fin HPC_201603_FAC

end.

