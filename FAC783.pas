unit Fac783;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, wwdbdatetimepicker;

type
  TFToolConsClie = class(TForm)
    pnGLT: TPanel;
    rgSeleccion: TRadioGroup;
    gbFechas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpFIni: TwwDBDateTimePicker;
    dtpFFin: TwwDBDateTimePicker;
    Z1sbMenuReglas2: TSpeedButton;
    rdgTipo: TRadioGroup;
    Timer1: TTimer;
    procedure Z1sbMenuReglas2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   FToolConsClie: TFToolConsClie;
   xFiltro : String;
   xAccesoBotones : Boolean;

implementation

uses FacDM, oaVE3000;

{$R *.DFM}

procedure TFToolConsClie.Z1sbMenuReglas2Click(Sender: TObject);
begin
  if rdgTipo.ItemIndex = 0 then
  begin
	  if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	  begin
      xFiltro :=  'SELECT C.CLIEID, C.CLIEDES, C.CLIERUC, A.MTOPEDSOLES, A.MTOPEDDOL, B.MTOATESOLES, B.MTOATEDOL, '
                 +'(COALESCE(A.MTOPEDSOLES,0) - COALESCE(B.MTOATESOLES,0)) MTOPENDSOLES, '
                 +'(COALESCE(A.MTOPEDDOL,0) - COALESCE(B.MTOATEDOL,0)) MTOPENDDOL '
                 +'FROM TGE204 C LEFT JOIN (SELECT A.CLIEID, SUM(COALESCE(PEDTOTMN,0)) MTOPEDSOLES, '
                 +'SUM(COALESCE(PEDTOTME,0)) MTOPEDDOL '
                 +'FROM FAC301 A GROUP BY A.CLIEID) A ON C.CLIEID=A.CLIEID '
                 +'LEFT JOIN (SELECT A.CLIEID, SUM(COALESCE(GREMTOTMN,0)) MTOATESOLES, '
                 +'SUM(COALESCE(GREMTOTME,0)) MTOATEDOL '
                 +'FROM FAC303 A GROUP BY A.CLIEID) B ON C.CLIEID=B.CLIEID '
                 +'WHERE (COALESCE(A.MTOPEDSOLES,0)<>0 OR COALESCE(A.MTOPEDDOL,0)<>0 OR COALESCE(B.MTOATESOLES,0)<>0 '
                 +'OR COALESCE(B.MTOATEDOL,0)<>0)';
    end
    else
    if DMFAC.SRV_D = 'ORACLE' then
    begin
      xFiltro :='SELECT C.CLIEID, C.CLIEDES, C.CLIERUC, A.MTOPEDSOLES, A.MTOPEDDOL, B.MTOATESOLES, B.MTOATEDOL, (NVL(A.MTOPEDSOLES,0)-NVL(B.MTOATESOLES,0)) MTOPENDSOLES, '+
                '(NVL(A.MTOPEDDOL,0)  -NVL(B.MTOATEDOL,0))   MTOPENDDOL '+
                'FROM TGE204 C, '+
                '(SELECT A.CLIEID, SUM(NVL(PEDTOTMN,0)) MTOPEDSOLES, SUM(NVL(PEDTOTME,0)) MTOPEDDOL '+
                'FROM FAC301 A GROUP BY A.CLIEID) A, '+
                '(SELECT A.CLIEID, SUM(NVL(GREMTOTMN,0)) MTOATESOLES, SUM(NVL(GREMTOTME,0)) MTOATEDOL '+
                'FROM FAC303 A GROUP  BY A.CLIEID) B '+
                'WHERE ( '+
                'NVL(A.MTOPEDSOLES,0)<>0 OR '+
                'NVL(A.MTOPEDDOL,0)<>0 OR '+
                'NVL(B.MTOATESOLES,0)<>0 OR '+
                'NVL(B.MTOATEDOL,0)<>0 ) '+
                'AND C.CLIEID=A.CLIEID '+
                'AND C.CLIEID=B.CLIEID';
    end;
  end
  else
  if rdgTipo.ItemIndex = 1 then
  begin
	  if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	  begin
      xFiltro :=  'SELECT C.ASOID CLIEID, C.ASOAPENOM CLIEDES, C.ASORUC CLIERUC, A.MTOPEDSOLES, A.MTOPEDDOL, B.MTOATESOLES, B.MTOATEDOL, '
                 +'(COALESCE(A.MTOPEDSOLES,0) - COALESCE(B.MTOATESOLES,0)) MTOPENDSOLES, '
                 +'(COALESCE(A.MTOPEDDOL,0) - COALESCE(B.MTOATEDOL,0)) MTOPENDDOL '
                 +'FROM APO201 C LEFT JOIN (SELECT A.CLIEID, SUM(COALESCE(PEDTOTMN,0)) MTOPEDSOLES, '
                 +'SUM(COALESCE(PEDTOTME,0)) MTOPEDDOL '
                 +'FROM FAC301 A GROUP BY A.CLIEID) A ON C.CLIEID=A.CLIEID '
                 +'LEFT JOIN (SELECT A.CLIEID, SUM(COALESCE(GREMTOTMN,0)) MTOATESOLES, '
                 +'SUM(COALESCE(GREMTOTME,0)) MTOATEDOL '
                 +'FROM FAC303 A GROUP BY A.CLIEID) B ON C.CLIEID=B.CLIEID '
                 +'WHERE (COALESCE(A.MTOPEDSOLES,0)<>0 OR COALESCE(A.MTOPEDDOL,0)<>0 OR COALESCE(B.MTOATESOLES,0)<>0 '
                 +'OR COALESCE(B.MTOATEDOL,0)<>0)';
    end
    else
    if DMFAC.SRV_D = 'ORACLE' then
    begin
      xFiltro :='SELECT C.ASOID CLIEID, C.ASOAPENOM CLIEDES, C.ASORUC CLIERUC, A.MTOPEDSOLES, A.MTOPEDDOL, B.MTOATESOLES, B.MTOATEDOL, (NVL(A.MTOPEDSOLES,0)-NVL(B.MTOATESOLES,0)) MTOPENDSOLES, '+
                '(NVL(A.MTOPEDDOL,0)  -NVL(B.MTOATEDOL,0))   MTOPENDDOL '+
                'FROM APO201 C, '+
                '(SELECT A.CLIEID, SUM(NVL(PEDTOTMN,0)) MTOPEDSOLES, SUM(NVL(PEDTOTME,0)) MTOPEDDOL '+
                'FROM FAC301 A GROUP BY A.CLIEID) A, '+
                '(SELECT A.CLIEID, SUM(NVL(GREMTOTMN,0)) MTOATESOLES, SUM(NVL(GREMTOTME,0)) MTOATEDOL '+
                'FROM FAC303 A GROUP  BY A.CLIEID) B '+
                'WHERE ( '+
                'NVL(A.MTOPEDSOLES,0)<>0 OR '+
                'NVL(A.MTOPEDDOL,0)<>0 OR '+
                'NVL(B.MTOATESOLES,0)<>0 OR '+
                'NVL(B.MTOATEDOL,0)<>0 ) '+
                'AND C.ASOID=A.CLIEID '+
                'AND C.ASOID=B.CLIEID';
    end;
  end;

  Screen.Cursor:=crHourGlass;
  GReporte.UsuarioSQL.Clear;
  GReporte.FMant.wTabla:='VWFACREPCLIE';
  GReporte.UsuarioSQL.Add(xFiltro);
  GReporte.NewQuery;
  Screen.Cursor:=crDefault;
end;

procedure TFToolConsClie.Timer1Timer(Sender: TObject);
begin
{   FVariables.w_NombreForma := 'FToolConsClie';}
// Inicio HPC_201311_FAC
// incluye al usuario de tipo administrador en el destroy del timer
{
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolConsClie);
      xAccesoBotones := True;
   end;
}
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then
   else
   begin
      if not xAccesoBotones then
      begin
         DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolConsClie);
         xAccesoBotones := True;
      end;
   end;
// Fin HPC_201311_FAC
   Timer1.Destroy;
end;

end.
