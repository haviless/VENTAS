(* Ing. Juver De la Cruz --  29/01/2008 *)
unit FAC399;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,DB, StdCtrls, Buttons;

type
  TFObsequiosMantenimiento = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    dbgData: TwwDBGrid;
    Panel1: TPanel;
    bbtnFiltra: TBitBtn;
    edFiltro: TEdit;
    Label3: TLabel;
    btnActDes: TButton;
    btnEditar: TButton;
    btnNuevo: TButton;
    procedure FormActivate(Sender: TObject);
    procedure bbtnFiltraClick(Sender: TObject);
    procedure edFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnActDesClick(Sender: TObject);
    procedure dbgDataDblClick(Sender: TObject);
  private
    cLink : String;
    procedure cargarDxs(ITextFiltro:string='%');
    procedure cargarDxsLocate(ITextFiltro:string='%';IId:string='');
    function execSQL(ISQL:string;IMsgError:string='Ocurrio un error, por favor vuelva a intentarlo...'):boolean;
    procedure OnAddObsequio(Sender: TObject;IArtId:string); overload;
    procedure OnAddObsequio(Sender: TObject;IArtId:string;IEmicarta:string; IRangoIni:double;IRangoFin:double);overload;
    procedure OnEditObsequio(Sender: TObject;IArtId:string;IEmicarta:string; IRangoIni:double;IRangoFin:double);
    function isExistenRegBusqueda(): boolean;    
  public
    { Public declarations }
  end;

(*var
  FObsequiosMantenimiento: TFObsequiosMantenimiento;
*)
implementation

{$R *.dfm}

USES FACDM,FAC400,FAC401;

(******************************************************************************)
procedure TFObsequiosMantenimiento.cargarDxsLocate(ITextFiltro:string;IId:string);
begin
     self.cargarDxs(ITextFiltro);
     DMFAC.cdsQry14.locate('ARTID', IId, []);
end;
(******************************************************************************)
procedure TFObsequiosMantenimiento.cargarDxs(ITextFiltro:string);
var
   xSQL : String;
begin
   xSQL:= '  SELECT PRODUCTOS.ARTID ARTID, PRODUCTOS.ARTDES ARTDES, '
         +'         OBSEQUIOS.RANGO_INI RANGO_INI, OBSEQUIOS.RANGO_FIN RANGO_FIN, '
         +'         OBSEQUIOS.EMICARTA EMICARTA, OBSEQUIOS.ACTIVO ACTIVO '
         +'    FROM ASO_CRE_REG_TAB OBSEQUIOS,TGE205 PRODUCTOS '
         +'   WHERE PRODUCTOS.CIAID(+) = ''02'' '
         +'     AND PRODUCTOS.TINID IN (''20'',''26'') '
         +'     AND OBSEQUIOS.ARTID = PRODUCTOS.ARTID(+) '
         +'     AND PRODUCTOS.ARTDES LIKE ''%''||UPPER('''+ITextFiltro+''')||''%'' '
         +'   ORDER BY PRODUCTOS.ARTDES ';

   DMFAC.cdsQry14.Close;
   DMFAC.cdsQry14.DataRequest(xSQL);
   DMFAC.cdsQry14.Open;
   dbgData.DataSource:=DMFAC.dsQry14;
   TNumericField(DMFAC.cdsQry14.FieldByName('RANGO_INI')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMFAC.cdsQry14.FieldByName('RANGO_FIN')).DisplayFormat := '###,###,##0.00';
end;

(******************************************************************************)
procedure TFObsequiosMantenimiento.bbtnFiltraClick(Sender: TObject);
begin
  self.cargarDxs(self.edFiltro.text);
end;

(******************************************************************************)
procedure TFObsequiosMantenimiento.FormActivate(Sender: TObject);
begin
   cLink:='';{'@dbprodlee '; }(*para cuando se quiere hacer pruebas desde produccion -- solo lectura*)
   self.cargarDxs();
end;

(******************************************************************************)
procedure TFObsequiosMantenimiento.edFiltroKeyPress(Sender: TObject;
  var Key: Char);
begin
   IF (KEY = #13) THEN bbtnFiltraClick(bbtnFiltra);
end;

(******************************************************************************)
function TFObsequiosMantenimiento.execSQL(ISQL:string;IMsgError:string):boolean;
begin
    DMFAC.cdsQry.Close;
    DMFAC.cdsQry.DataRequest(ISQL);
    try
        DMFAC.cdsQry.Execute;
        result:=true;
    except
        ShowMessage(IMsgError);
        result:=false;
    end;
end;

(******************************************************************************)
function TFObsequiosMantenimiento.isExistenRegBusqueda(): boolean;
begin
     if DMFAC.cdsQry14.recordcount<=0 then
        begin
           showmessage('No hay registros en la busqueda');
           result:= false;
        end
     else
        result:= true;
end;

(******************************************************************************)
procedure TFObsequiosMantenimiento.btnActDesClick(Sender: TObject);
var vCad:string;
    vSQL:string;
    vStado:string;
begin
  if not isExistenRegBusqueda() then exit;
  with DMFAC.cdsQry14 do
    begin
        if (FieldByName('ACTIVO').AsString='S') then
           vCad:= 'Desactivar'
        else
           vCad:= 'Activar';

        if MessageDlg('¿Confirma que desea '+vCad+' el Articulo?',
                      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
             if (FieldByName('ACTIVO').AsString='S') then vStado:='N' else vStado:='S';
             vSQL:=  '   UPDATE ASO_CRE_REG_TAB '
                   + '      SET ACTIVO = '''+vStado+''', '
                   + '            FREG = SYSDATE, '
                   + '         USUARIO = '''+DMFAC.wUsuario+''' '
                   + '    WHERE ARTID  = '''+FieldByName('ARTID').AsString+''' ';
             execSQL(vSQL);
             self.cargarDxsLocate(self.edFiltro.text,FieldByName('ARTID').AsString);
          end;
    end;
end;

(******************************************************************************)
procedure TFObsequiosMantenimiento.dbgDataDblClick(Sender: TObject);
begin
   self.btnEditarClick(btnEditar);
end;

(******************************************************************************)
procedure TFObsequiosMantenimiento.OnAddObsequio(Sender: TObject;IArtId:string);
var vSQL : String;
   VFrm:TFEditarObsequio;
begin
   vSQL:= 'SELECT COUNT(*) cant'
         +'  FROM ASO_CRE_REG_TAB '
         +' WHERE ARTID='''+IArtId+'''';
   DMFAC.cdsQry16.Close;
   DMFAC.cdsQry16.DataRequest(vSQL);
   DMFAC.cdsQry16.Open;
   if (DMFAC.cdsQry16.fieldbyname('cant').value>0) then
     begin
        showmessage('El Articulo "' +IArtId+ '" ya existe en la base de datos');
        exit;
     end
   else
     begin
         Try
           VFrm := TFEditarObsequio.create(Application);
           VFrm.OnEditObsequio := self.OnAddObsequio;
           VFrm.edArtId.text:=IArtId;
           //VFrm.chbxEmiCarta.onClick(VFrm.chbxEmiCarta);
           VFrm.ShowModal;
         Finally
           VFrm.Free;
         End
     end;
end;
(******************************************************************************)
procedure TFObsequiosMantenimiento.OnAddObsequio(Sender: TObject;
                                          IArtId:string;IEmicarta:string;
                                          IRangoIni:double;IRangoFin:double);
var vSQL:string;
begin
    vSQL:=  'INSERT INTO ASO_CRE_REG_TAB '
          + '  VALUES ('''+IArtId+''','+inttostr(round(IRangoIni)) +','+inttostr(round(IRangoFin))+','
          + '          ''S'',SYSDATE,''' + DMFAC.wUsuario + ''','''+IEmicarta+''')';
    execSQL(vSQL);
    self.cargarDxsLocate(self.edFiltro.text,IArtId); (* POR SI EXISTE EN LA BUSQUEDA*)
end;

(******************************************************************************)
procedure TFObsequiosMantenimiento.OnEditObsequio(Sender: TObject;
                                          IArtId:string;IEmicarta:string;
                                          IRangoIni:double;IRangoFin:double);
var vSQL:string;
begin
     vSQL:=  '   UPDATE ASO_CRE_REG_TAB '
           + '      SET  EMICARTA = ''' + IEmicarta + ''', '
           + '          RANGO_INI = ' + inttostr(round(IRangoIni)) + ', '
           + '          RANGO_FIN = ' + inttostr(round(IRangoFin)) + ', '
           + '               FREG =  SYSDATE, '
           + '            USUARIO = ''' + DMFAC.wUsuario + ''' '
           + '    WHERE ARTID  = ''' + IArtId + ''' ';
     execSQL(vSQL);
     self.cargarDxsLocate(self.edFiltro.text,IArtId);
end;

(******************************************************************************)
procedure TFObsequiosMantenimiento.btnEditarClick(Sender: TObject);
var VFrm:TFEditarObsequio;
begin
    if not isExistenRegBusqueda() then exit;
    Try
       VFrm := TFEditarObsequio.create(Application);
       VFrm.OnEditObsequio := self.OnEditObsequio;
       with DMFAC.cdsQry14 do
         begin
             VFrm.edArtId.text:=FieldByName('ARTID').AsString;
             (* no cambiar el orden de estas lineas

             VFrm.chbxEmiCarta.checked := (FieldByName('EMICARTA').value='S');
             VFrm.chbxEmiCarta.onClick(VFrm.chbxEmiCarta);
             *)

             if(FieldByName('EMICARTA').value='S') then
               begin
                   VFrm.rgEmitioCarta.itemindex:=0;
               end;
             if(FieldByName('EMICARTA').value='N') then
               begin
                   VFrm.rgEmitioCarta.itemindex:=1;
               end;
             if(FieldByName('EMICARTA').value='A') then
               begin
                   VFrm.rgEmitioCarta.itemindex:=2;               
               end;



             VFrm.rgEmitioCarta.onClick(VFrm.rgEmitioCarta);

             VFrm.sedRangoMin.value:=FieldByName('RANGO_INI').value;
             VFrm.sedRangoMax.value:=FieldByName('RANGO_FIN').value;
         end;
       VFrm.ShowModal;
    Finally
       VFrm.Free;
    End
end;

(******************************************************************************)
procedure TFObsequiosMantenimiento.btnNuevoClick(Sender: TObject);
var VFrm:TFAgregarObsequio;
begin
    Try
       VFrm := TFAgregarObsequio.create(Application);
       VFrm.OnAddObsequio := self.OnAddObsequio;
       VFrm.ShowModal;
    Finally
       VFrm.Free;
    End
end;
(******************************************************************************)
end.
