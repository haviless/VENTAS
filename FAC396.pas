unit FAC396;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, Grids, Wwdbigrd, Wwdbgrid,
  ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppBands, ppCache, ExtCtrls, DBGrids, DB;

type
  TFObsequios = class(TForm)
    dbgData: TwwDBGrid;
    bbtnFiltra: TBitBtn;
    Label3: TLabel;
    dtpFecha: TwwDBDateTimePicker;
    ppdb2: TppDBPipeline;
    ppr2: TppReport;
    ppd2: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    Panel1: TPanel;
    Label1: TLabel;
    dtpIni: TwwDBDateTimePicker;
    dtpFin: TwwDBDateTimePicker;
    Label2: TLabel;
    bbtnCredCarta: TBitBtn;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    bbtnExcel1: TBitBtn;
    bbtnExcel2: TBitBtn;
    ppdb3: TppDBPipeline;
    ppr3: TppReport;
    ppd3: TppDesigner;
    dtgData: TDBGrid;
    bbtnDia: TBitBtn;
    Label5: TLabel;
    dtpDia: TwwDBDateTimePicker;
    Bevel1: TBevel;
    ppdb4: TppDBPipeline;
    ppr4: TppReport;
    ppd4: TppDesigner;
    bbtnObsequiosMantenimiento: TBitBtn;
    cbDiseno: TCheckBox;
    procedure bbtnFiltraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDataDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtnDiaClick(Sender: TObject);
    procedure bbtnCredCartaClick(Sender: TObject);
    procedure dtpIniExit(Sender: TObject);
    procedure dtpFinExit(Sender: TObject);
    procedure bbtnExcel1Click(Sender: TObject);
    procedure bbtnExcel2Click(Sender: TObject);
    procedure bbtnObsequiosMantenimientoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    cLink : String;
    function isFechasValidasRPT():boolean;

  public
    { Public declarations }
  end;

var
  FObsequios: TFObsequios;


implementation

{$R *.dfm}

USES FACDM, FAC397,FAC398,FAC399;

procedure TFObsequios.bbtnFiltraClick(Sender: TObject);
var
   xSQL : String;
begin

   if dtpFecha.Date<StrToDate('01/12/2007') then
   begin
      ShowMessage('Fecha debe ser mayor o igual al 01/12/2007');
      Exit;
   end;

   Screen.Cursor := crHourGlass;
   (*
   xSQL:='select CREFOTORG, A.ASODNI, CREDID, B.ASOAPENOMDNI, CREMTOOTOR, '
        +' NVL(EMICARTA,''N'') EMICARTA '
        +'From CRE301'+cLink+' A, APO201'+cLink+' B '
        +'WHERE A.CREFOTORG='''+dtpFecha.Text+''' '
        +  'AND NOT A.CREESTID IN (''13'',''04'') '
        +  'AND A.ASOID=B.ASOID(+) AND NVL(EMICARTA,''N'')=''S''';
        *)

   xSQL:='select CREFOTORG, A.ASODNI, CREDID, B.ASOAPENOMDNI, CREMTOOTOR, '
        +' NVL(EMICARTA,''N'') EMICARTA '
        +'From CRE301'+cLink+' A, APO201'+cLink+' B '
        +'WHERE A.CREFOTORG='''+dtpFecha.Text+''' '
        + ' AND NOT A.CREESTID IN (''13'',''04'') '
        + ' AND A.ASOID=B.ASOID(+)'
        +'  ORDER BY B.ASOAPENOMDNI';

   DMFAC.cdsQry12.Close;
   DMFAC.cdsQry12.DataRequest(xSQL);
   DMFAC.cdsQry12.Open;
   dbgData.DataSource:=DMFAC.dsQry12;
   TNumericField(DMFAC.cdsQry12.FieldByName('CREMTOOTOR')).DisplayFormat := '###,###,##0.00';

   dbgData.ColumnByName('ASODNI').FooterValue    :='Reg: '+IntToStr(DMFAC.cdsQry12.Recordcount);
   dbgData.ColumnByName('CREDID').FooterValue    :='Monto Total:';
   dbgData.ColumnByName('CREMTOOTOR').FooterValue:=FloatToStrF( DMFAC.OperClientDataSet( DMFAC.cdsQry12, 'SUM(CREMTOOTOR)', ''), ffNumber, 10, 2 );
   Screen.Cursor := crDefault;
end;

procedure TFObsequios.FormActivate(Sender: TObject);
begin
   cLink:='@dbprodlee ';
   cLink:='';
   dtpFecha.Date:=Date;
   dtpIni.Date:=Date;
   dtpFin.Date:=Date;
   dtpDia.Date:=Date;
   bbtnFiltra.OnClick( self );
end;

procedure TFObsequios.dbgDataDblClick(Sender: TObject);
begin
   IF(DMFAC.cdsQry12.FieldByName('EMICARTA').AsString='S') THEN
     BEGIN
       Try
          FObsequioMov := TFObsequioMov.create(Application);
          FObsequioMov.ShowModal;
       Finally
          FObsequioMov.Free;
       end
     END
   ELSE
     BEGIN
       Try
          FObsequioMovNormal := TFObsequioMovNormal.create(Application);
          FObsequioMovNormal.ShowModal;
       Finally
          FObsequioMovNormal.Free;
       end
     END;
end;

procedure TFObsequios.BitBtn1Click(Sender: TObject);
var
  xSQL : String;
begin
   if not isFechasValidasRPT() then  exit;
   
  (* TENER EN CUENTA EL CASO DE QEU SE LE ENTREGUE UN CREDITO Y
     SE LE ENTREGUE EL OBSEQUIO Y LUEGO SE ANULE EL CREDITO..
     CREESTID='13'*)
  {
  xSQL:='Select A.ARTID, C.ARTDES, COUNT(*) REGISTROS, '
       +   '''Desde '+dtpIni.Text+' Hasta '+dtpFin.Text+''' RANGO '
       +'From ASO_CRE_REG_MOV A, APO201'+cLink+' B, TGE205'+cLink+' C, CRE301'+cLink+' D '
       +'Where to_date(A.FREG)>='''+dtpIni.Text+''' and to_date(A.FREG)<='''+dtpFin.Text+''' '
       +  'AND A.ASODNI=B.ASODNI(+) '
       +  'AND C.CIAID(+)=''02'' AND C.TINID IN (''20'',''26'') AND A.ARTID=C.ARTID(+) '
       +  'AND A.ASODNI=D.ASODNI(+) AND A.CREDID=D.CREDID(+) '
       +  'AND NOT D.CREESTID IN (''13'',''04'') '
       +'Group by A.ARTID, C.ARTDES '
       +'Order by C.ARTDES';
   }

  xSQL:='Select A.ARTID, C.ARTDES, COUNT(*) REGISTROS, '
       +   '''Desde '+dtpIni.Text+' Hasta '+dtpFin.Text+''' RANGO '
       +'From ASO_CRE_REG_MOV A, APO201'+cLink+' B, TGE205'+cLink+' C, CRE301'+cLink+' D '
       +'Where to_date(A.FREG)>='''+dtpIni.Text+''' and to_date(A.FREG)<='''+dtpFin.Text+''' '
       +  'AND A.ASODNI=B.ASODNI(+) '
       +  'AND C.CIAID(+)=''02'' AND C.TINID IN (''20'',''26'') AND A.ARTID=C.ARTID(+) '
       +  'AND A.ASODNI=D.ASODNI(+) AND A.CREDID=D.CREDID(+) '
       +  'AND NOT D.CREESTID IN (''04'') '
       +'Group by A.ARTID, C.ARTDES '
       +'Order by C.ARTDES';

  DMFAC.cdsQry8.Close;
  DMFAC.cdsQry8.DataRequest(xSQL);
  DMFAC.cdsQry8.Open;

  if DMFAC.cdsQry8.RecordCount<=0 then
  begin
     Screen.Cursor := crDefault;
     ShowMessage('No Existe Información para esa Fecha');
     Exit;
  end;

  ppdb4.DataSource:=DMFAC.dsQry8;
  ppr4.Template.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\ReciboObsequioRango.Rtm' ;
  ppr4.Template.LoadFromFile;
  Screen.Cursor := crDefault;

  If cbDiseno.Checked Then
     ppd4.ShowModal
  else
    ppr4.Print;

  ppdb4.DataSource:=nil;
end;

procedure TFObsequios.bbtnDiaClick(Sender: TObject);
var
  xSQL : String;
begin
  Screen.Cursor := crHourGlass;
  (*
    xSQL:='Select A.NUMERO, A.ASODNI, B.ASOAPENOMDNI, A.CREDID, A.ARTID, C.ARTDES, A.USUARIO, D.CREFOTORG, '
       +   ''''+dtpDia.Text+''' FECHA '
       +'From ASO_CRE_REG_MOV A, APO201'+cLink+' B, TGE205'+cLink+' C, CRE301'+cLink+' D '
       +'Where to_date(A.FREG)='''+dtpDia.Text+''' '
       +  'AND A.ASODNI=B.ASODNI(+) '
       +  'AND C.CIAID(+)=''02'' AND C.TINID(+)=''20'' AND A.ARTID=C.ARTID(+) '
       +  'AND A.ASODNI=D.ASODNI(+) AND A.CREDID=D.CREDID(+) '
       +  'AND NOT D.CREESTID IN (''13'',''04'') '
       +'ORDER BY C.ARTDES, B.ASOAPENOMDNI';
  *)

  xSQL:='Select A.NUMERO, A.ASODNI, B.ASOAPENOMDNI, A.CREDID, A.ARTID, C.ARTDES, A.USUARIO, D.CREFOTORG, '
       +   ''''+dtpDia.Text+''' FECHA '
       +'From ASO_CRE_REG_MOV A, APO201'+cLink+' B, TGE205'+cLink+' C, CRE301'+cLink+' D '
       +'Where to_date(A.FREG)='''+dtpDia.Text+''' '
       +  'AND A.ASODNI=B.ASODNI(+) '
       +  'AND C.CIAID(+)=''02'' AND C.TINID IN (''20'',''26'') AND A.ARTID=C.ARTID(+) '
       +  'AND A.ASODNI=D.ASODNI(+) AND A.CREDID=D.CREDID(+) '
       +  'AND NOT D.CREESTID IN (''04'') '
       +'ORDER BY C.ARTDES, B.ASOAPENOMDNI';

  DMFAC.cdsQry9.Close;
  DMFAC.cdsQry9.DataRequest(xSQL);
  DMFAC.cdsQry9.Open;

  if DMFAC.cdsQry9.RecordCount<=0 then
  begin
     Screen.Cursor := crDefault;
     ShowMessage('No Existe Información para esa Fecha');
     Exit;
  end;

  ppdb2.DataSource:=DMFAC.dsQry9;
  ppr2.Template.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\ReciboObsequioDia.Rtm' ;
  ppr2.Template.LoadFromFile;

  Screen.Cursor := crDefault;
  If cbDiseno.Checked Then
     ppd2.ShowModal
  else
    ppr2.Print;

  ppdb2.DataSource:=nil;
end;

procedure TFObsequios.bbtnCredCartaClick(Sender: TObject);
var
   xSQL : String;
begin
    (*
   if dtpIni.Date>dtpFin.Date then
   begin
      ShowMessage('Fecha de Inicio no puede se mayor a Fecha Final');
      Exit;
   end;
   *)
   if not isFechasValidasRPT() then  exit;
      (*DEJARLO ASI*)
   xSQL:='select CREFOTORG, A.ASODNI, CREDID, B.ASOAPENOMDNI, CREMTOOTOR, EMICARTA,'
        +   '''Desde '+dtpIni.Text+' Hasta '+dtpFin.Text+''' RANGO '
        +'From CRE301'+cLink+' A, APO201'+cLink+' B '
        +'WHERE A.CREFOTORG>='''+dtpIni.Text+''' and CREFOTORG<='''+dtpFin.Text+''' '
        +  'AND NOT A.CREESTID IN (''13'',''04'') '
        +  'AND A.ASOID=B.ASOID(+) AND NVL(EMICARTA,''N'')=''S'' '
        +'ORDER BY CREFOTORG, ASOAPENOMDNI';                      

   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;

   if DMFAC.cdsQry.RecordCount<=0 then
   begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existe Información para esa Fecha');
      Exit;
   end;

   ppdb3.DataSource:=DMFAC.dsQry;
   ppr3.Template.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\ReciboObsequioCarta.Rtm' ;
   ppr3.Template.LoadFromFile;

   Screen.Cursor := crDefault;
   If cbDiseno.Checked Then
      ppd3.ShowModal
   else
      ppr3.Print;

   ppdb3.DataSource:=nil;
end;

procedure TFObsequios.dtpIniExit(Sender: TObject);
begin
   if dtpIni.Date<StrToDate('01/12/2007') then
   begin
      ShowMessage('Fecha debe ser mayor o igual al 01/12/2007');
      dtpIni.Date:=Date;
      Exit;
   end;
end;

procedure TFObsequios.dtpFinExit(Sender: TObject);
begin
   if dtpFin.Date<StrToDate('01/12/2007') then
   begin
      ShowMessage('Fecha debe ser mayor o igual al 01/12/2007');
      dtpFin.Date:=Date;
      Exit;
   end;
end;

procedure TFObsequios.bbtnExcel1Click(Sender: TObject);
var
   xSQL : String;
begin

   if not isFechasValidasRPT() then  exit;
   
   (*DEJARLO ASI*)
   xSQL:='select CREFOTORG FECHA, A.ASODNI DNI, CREDID CREDITO, '
        +   'B.ASOAPENOMDNI NOMBRE, CREMTOOTOR MONTO, EMICARTA '
        +'From CRE301'+cLink+' A, APO201'+cLink+' B '
        +'WHERE A.CREFOTORG>='''+dtpIni.Text+''' and CREFOTORG<='''+dtpFin.Text+''' '
        +  'AND NOT A.CREESTID IN (''13'',''04'') '
        +  'AND A.ASOID=B.ASOID(+) AND NVL(EMICARTA,''N'')=''S'' '
        +'ORDER BY CREFOTORG, ASOAPENOMDNI';

   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;

   dtgData.DataSource:=DMFAC.dsQry;

   (*Screen.Cursor := crDefault;*)

   If DMFAC.cdsQry.RecordCount > 0 Then
   begin
      try
         DMFAC.HojaExcel('CREDITOS',DMFAC.dsQry, dtgData);
      except
         		on Ex: Exception do
          			Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
      end;
   end
   else
      MessageDlg('No Existe Infromación Para Esta Consulta ', mtInformation,[mbOk],0);


end;

function TFObsequios.isFechasValidasRPT():boolean;
begin
   if dtpIni.Date>dtpFin.Date then
     begin
        ShowMessage('Fecha de Inicio no puede se mayor a Fecha Final');
        isFechasValidasRPT:=false;
     end
   else
     isFechasValidasRPT:=true;
end;

procedure TFObsequios.bbtnExcel2Click(Sender: TObject);
var
   xSQL : String;
begin

   if not isFechasValidasRPT() then  exit;

  xSQL:='Select A.ARTID CODIGO, C.ARTDES ARTICULO, COUNT(*) REGISTROS '
       +'From ASO_CRE_REG_MOV A, APO201'+cLink+' B, TGE205'+cLink+' C, CRE301'+cLink+' D '
       +'Where to_date(A.FREG)>='''+dtpIni.Text+''' and to_date(A.FREG)<='''+dtpFin.Text+''' '
       +  'AND A.ASODNI=B.ASODNI(+) '
       +  'AND C.CIAID(+)=''02'' AND C.TINID IN (''20'',''26'') AND A.ARTID=C.ARTID(+) '
       +  'AND A.ASODNI=D.ASODNI(+) AND A.CREDID=D.CREDID(+) '
       +  'AND NOT D.CREESTID IN (''04'') '
       +'Group by A.ARTID, C.ARTDES '
       +'Order by C.ARTDES';

   DMFAC.cdsQry.Close;
   DMFAC.cdsQry.DataRequest(xSQL);
   DMFAC.cdsQry.Open;

   dtgData.DataSource:=DMFAC.dsQry;

   If DMFAC.cdsQry.RecordCount > 0 Then
   begin
      try
         DMFAC.HojaExcel('PREMIOS',DMFAC.dsQry, dtgData);
      except
         		on Ex: Exception do
          			Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
      end;
   end
   else
      MessageDlg('No Existe Infromación Para Esta Consulta ', mtInformation,[mbOk],0);
end;
(********************************************************************)
procedure TFObsequios.bbtnObsequiosMantenimientoClick(Sender: TObject);
var VFrm:TFObsequiosMantenimiento;
begin
    Try
       VFrm := TFObsequiosMantenimiento.create(Application);
       VFrm.ShowModal;
    Finally
       VFrm.Free;
    End
end;
(********************************************************************)
procedure TFObsequios.FormShow(Sender: TObject);
begin
   cbDiseno.Visible := ((DMFAC.wAdmin = 'G') Or (DMFAC.wAdmin = 'P'));
end;

end.
