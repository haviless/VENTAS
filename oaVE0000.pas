Unit oaVE0000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaVE0000
// FORMULARIO               : FVEIni
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Contiene los métodos generales del módulo
//

// Actualizaciones:
// HPC_201210_FAC 29/10/2012  Implementación del control de versiones
// HPC_201403_FAC 18/06/2014  Actualización de Version a 20140620083000
// HPC_201507_FAC 20/11/2014  Entrega al área de Calidad
// HPC_201603_FAC 08/08/2016  Cambio de Version a 20160808100000
// HPC_201604_FAC 21/10/2016  Cambio de Version a 20161024083000
// HPC_201801_FAC 19/03/2018  Retiro del Maestro de Clientes
// HPC_201805_FAC 03/09/2018  Cambio de Version a 20180903083000
// FAC-201806     31/10/2018  Cambio de Versión a FAC-201806
//

Interface

Uses
// Inicio HPC_201801_FAC
// 19/03/2018 Retiro del Maestro de Clientes
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
//   Dialogs, mant, DB, DBClient, wwclient, oaVariables, StdCtrls, CLIEDM;
   Dialogs, mant, DB, DBClient, wwclient, oaVariables, StdCtrls;
// Fin HPC_201801_FAC

Type
   TFVEIni = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }
      MantHelp: TMant;
   End;

Procedure VEDataModulo; stdcall;
Procedure VEMantenimientoAccesos; stdcall;
Procedure VEOpcionAccesos; stdcall;
Procedure VEOpcionAccesosShow; stdcall;
Procedure VEMantenimientoAyudaMant; stdcall;
Procedure VEVerificaVersion; stdcall;
Procedure VEDataModuloClie; stdcall; //

Exports
   VEDataModulo,
   VEMantenimientoAccesos,
   VEOpcionAccesos,
   VEOpcionAccesosShow,
   VEVerificaVersion,
   VEMantenimientoAyudaMant,
   VEDataModuloClie;

Var
   FVEIni: TFVEIni;

Implementation

{$R *.dfm}

Uses FacDM;

Procedure VEDataModulo;
Begin
   Application.Initialize;
   Try
      If (DMFAC = Nil) Or (DMFAC.sClose = '1') Then
      Begin
         FVariables := TFVariables.Create(Application);
         DMFAC := TDMFAC.Create(Application);
         If DMFAC.sClose = '1' Then
         Begin
            DMFAC.Free;
            DMFAC := Nil;
         End;
      End;
   Finally
   End;
End;

Procedure VEMantenimientoAccesos;
Begin
End;

Procedure VEOpcionAccesos;
Begin
End;

Procedure VEOpcionAccesosShow;
Begin
End;

Procedure VEMantenimientoAyudaMant;
Begin
End;

Procedure VEVerificaVersion;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   FVEIni := TFVEIni.Create(Application);
   If DMFAC.fg_VerificaVersion(FVEIni.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

// Inicio HPC_201801_FAC
// Retiro del Maestro de Cliente de Ventas
Procedure VEDataModuloClie; Stdcall;
Begin
{
   Application.Initialize;
   Try
      If (DMMClientes = Nil) Then
      Begin
         DMMClientes := TDMMClientes.Create(Application);
         DMMClientes.DCOM1 := DMFAC.DCOM1;
         DMMClientes.wUsuario := DMFAC.wUsuario;
         DMMClientes.wAdmin := DMFAC.wAdmin;
         DMMClientes.wGrupo := DMFAC.wGrupo;
         DMMClientes.wModulo := DMFAC.wModulo;
         DMMClientes.DataModuleCreate1;
      End;
   Finally
   //
   End;
}
End;
// Fin HPC_201801_FAC

End.

