Unit oaVe1000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaVe1000
// FORMULARIO               : FReferencias
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE DESARROLLO
// OBJETIVO                 : Contiene los métodos de las opciones de Parámetros generales
//

// Actualizaciones:
// HPC_201210_FAC 29/10/2012  Implementación del control de versiones
// HPC_201403_FAC 18/06/2014  Actualización de Version a 20140620083000
// HPC_201507_FAC 20/11/2014  Entrega al área de Calidad
// HPC_201603_FAC 08/08/2016 Cambio de Version a 20160808100000
// HPC_201604_FAC 21/10/2016 Cambio de Version a 20161024083000
// HPC_201805_FAC 03/09/2018  Cambio de Version a 20180903083000
// FAC-201806     31/10/2018  Cambio de Versión a FAC-201806
//

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mant, StdCtrls;

Type
   TFReferencias = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Procedure VEReferencias; stdcall;
Procedure VETCambio; stdcall;
Procedure VEVerificaVersion; stdcall;
Exports
   VEReferencias,

   VEVerificaVersion,

   VETCambio;

Var
   FReferencias: TFReferencias;

Implementation

{$R *.dfm}
Uses FACDM, FAC110;

Procedure VEReferencias;
Var
   MRefe: TMant;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   Application.Initialize;
   Try
      MRefe := TMant.Create(Application);
      MRefe.Module := DMFAC.wModulo;
      MRefe.Admin := DMFAC.wAdmin;
      MRefe.DComC := DMFAC.DCOM1;
      MRefe.User := DMFAC.wUsuario;
      MRefe.OnCierra := DMFAC.DisminuyeForma;
      MRefe.Execute;
   Except
   End;
End;

Procedure VETCambio;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
// FAC110   FTCambio          Consulta al Tipo de Cambio del Día
   FTCambio := TFTCambio.Create(Application);
   FTCambio.ActiveMDIChild;
End;

Procedure VEVerificaVersion;
Begin
   If DMFAC = Nil Then exit;
   If Not DMFAC.DCOM1.Connected Then Exit;
   FReferencias := TFReferencias.Create(Application);
   If DMFAC.fg_VerificaVersion(FReferencias.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.

