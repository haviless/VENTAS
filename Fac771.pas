Unit Fac771;
// Actualizaciones:
// HPC_201701_CLI 30/06/2017  Adecuaciones para facturación Electrónica
// HPC_201801_FAC 26/03/2018  Retiro de botón Reclamos
// HPC_201805_FAC 21/08/2018  Incluye la abreviatura dentro de la búsqueda
//

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, Buttons, Mant, Db, Wwdatsrc, DBClient, wwclient, ppDB,
   ppDBPipe, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
   ppProd, ppReport, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, fcButton,
   fcImgBtn, MsgDlgs, fcShapeBtn;

Type
   TFToolAportes = Class(TForm)
      pnlBot: TPanel;
   // Inicio HPC_201801_FAC
   // Retiro de botón Reclamos
   //   bbtnReclamos: TBitBtn;
   // Fin HPC_201801_FAC
      bbtnAceptar: TfcShapeBtn;
      edtAsociado: TEdit;
      lblApeMat: TLabel;
      Timer1: TTimer;
      Procedure bbtnAceptarClick(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
   Private
    { Private declarations }
      grid: TwwDBGrid;
   Public
    { Public declarations }
      mTX2, MTX1: TMant;
      Procedure OnNoDelete(Sender: TObject; MantFields: TFields);
   End;

Var
   FToolAportes: TFToolAportes;
   xAccesoBotones: Boolean;

Implementation

Uses oaVe2000, FACDM, FAC360VE, FAC370;

{$R *.DFM}

Procedure TFToolAportes.OnNoDelete(Sender: TObject; MantFields: TFields);
Begin
   Errormsg(Caption, ' No se Puede Eliminar este Registro ');
End;

// Inicio HPC_201701_FAC
//        Uso de variable Global xTipCli

Procedure TFToolAportes.bbtnAceptarClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If length(Trim(edtAsociado.Text)) > 0 Then
   Begin
      If DMFAC.xTipCli = 'S' Then
      Begin
      //   edtAsociado.Text:= FProforma.MtxAsocia.FMant.cds2.FieldbyName('CLIEDES').AsString;
      // Inicio HPC_201801_FAC
      // Para documentos donde el Código de Cliente es diferenciado, se debe buscar en el Maestro de Clientes
         {
         xSQL := 'Select * '
            + '  from TGE204 '
            + ' where CLIEDES like ' + QuotedStr(Trim(edtAsociado.Text + '%'));
         }
      // Inicio HPC_201805_FAC
      // 21/08/2018 Incluye la abreviatura dentro de la búsqueda
         xSQL := 'Select TDOC_ID_SUNAT, NUMDOCID, TIPPERID, CLAUXID, CLIEID, CLIEDNI, CLIERUC, CLIEAPEPAT, CLIEAPEMAT, CLIENOMBRE, '
            + '          CLIENOMBRE1, CLIEDES, CLIEABR, CLIEDIR, PAISID, DPTOID, CIUDID, CLIECZIP, CLIETELF, CLIEFAX, CLIEEMAI, '
            + '          CLIEDIRLEG, CIAID, CLIESALL, CLIEREPR, CLIESALE, CLIEGARAN, CLASIFID, CLIECONTAC, CLIEGIRA, VEID, GIROID, '
            + '          CLIECOND, CLIELISPRE, VINCID, CLIECAPSOC, CLIEDIREC, CLIEGGRAL, CLIEGADM, CLIECGRAL, CLIESECECO, SECECOID, '
            + '          CONDPID, CLIECANTAT, CLIECANTPE, CLIEMPEDME, CLIEMPEDMN, CLIEMATEMN, CLIEMATEME, CLIECANTFA, CLIEMFACMN, '
            + '          CLIEMFACME, TMONID, ZONVTAID, CLIEFLAGCR, SITCLIEID, DESCLIEID, CLIECREUTI, GRUPOID, CLIECONDFE, TVTAID, '
            + '          USERID, FREG, HREG, TLISTAID, CLIEINTER, AVALNOMB, AVALDIR, AVALTEL, AVALDOC, AVALTELF, CLIECREMIN, CLIECREMAX, '
            + '          CLIECREDISP, VEIDNW, ZONVTANW, FLAGMOV, CLIECODMOD, USEID, CLIECODAUX, CIUUID, FLAGVAR, ACTIVO, FECCREA, USUCREA '
            + '     from TGE204 '
            + '    where (CLIEDES like ' + QuotedStr('%' + Trim(edtAsociado.Text) + '%')
            + '       or CLIEABR like ' + QuotedStr('%' + Trim(edtAsociado.Text) + '%')
            + '       or CLIEDNI like ' + QuotedStr('%' + Trim(edtAsociado.Text) + '%')
            + '       or CLIERUC like ' + QuotedStr('%' + Trim(edtAsociado.Text) + '%')
            + '       or NUMDOCID like ' + QuotedStr('%' + Trim(edtAsociado.Text) + '%')+')'
            + '      and ACTIVO=''S'' ';
      // Fin HPC_201805_FAC
      // Fin HPC_201801_FAC
      End
      Else
      Begin
      //   edtAsociado.Text:= FProforma.MtxAsocia.FMant.cds2.FieldbyName('ASOAPENOMDNI').AsString;
         xSQL := 'Select * '
            + '  from APO201 '
            + ' where ASOAPENOMDNI like ' + QuotedStr(Trim(edtAsociado.Text + '%'));
      End;
   End;
   Screen.Cursor := crHourGlass;

// Inico HPC_201801_FAC
   If wFormaOrigen = 'FACTURA' Then
   Begin
      FFactSGuia.MtxAsocia.UsuarioSQL.Clear;
   // Inicio HPC_201805_FAC
   // 21/08/2018 retita cualquier prefiltro asignado por el usuario
      FFactSGuia.MtxAsocia.FMant.lbFiltro.Items.Clear;
      FFactSGuia.MtxAsocia.FMant.lbFiltroReal.Items.Clear;
   // Fin HPC_201805_FAC

      //If DMFAC.xTipCli = 'S' Then
         FFactSGuia.MtxAsocia.FMant.wTabla := 'TGE204';
      //Else
      //   FFactSGuia.MtxAsocia.FMant.wTabla := 'APO201';
      FFactSGuia.MtxAsocia.UsuarioSQL.Add(xSQL);
      FFactSGuia.MtxAsocia.NewQuery;
   End
   Else
   Begin
      If wFormaOrigen = 'PROFORMA' Then
      Begin
         FProforma.MtxAsocia.UsuarioSQL.Clear;
      // Inicio HPC_201805_FAC
      // 21/08/2018 retita cualquier prefiltro asignado por el usuario
         FProforma.MtxAsocia.FMant.lbFiltro.Items.Clear;
         FProforma.MtxAsocia.FMant.lbFiltroReal.Items.Clear;
      // Fin HPC_201805_FAC

         //If DMFAC.xTipCli = 'S' Then
            FProforma.MtxAsocia.FMant.wTabla := 'TGE204';
         //Else
         //   FProforma.MtxAsocia.FMant.wTabla := 'APO201';
         FProforma.MtxAsocia.UsuarioSQL.Add(xSQL);
         FProforma.MtxAsocia.NewQuery;
      End;
   End;
// Fin HPC_201801_FAC
   Screen.Cursor := crDefault;
End;
// Fin HPC_201701_FAC

Procedure TFToolAportes.Timer1Timer(Sender: TObject);
Begin
   //FVariables.w_NombreForma := 'FToolAportes';
// Inicio HPC_201311_FAC
// incluye al usuario de tipo administrador en el destroy del timer
{
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolAportes);
      xAccesoBotones := True;
   end;
}
   If (DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P') Then
   Else
   Begin
      If Not xAccesoBotones Then
      Begin
         DMFAC.AccesosUsuariosR(DMFAC.wModulo, DMFAC.wUsuario, '2', FToolAportes);
         xAccesoBotones := True;
      End;
   End;
// Fin HPC_201311_FAC
   Timer1.Destroy;
End;

End.

