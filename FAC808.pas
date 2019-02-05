unit FAC808;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Wwdbigrd, Grids, Wwdbgrid, ExtCtrls, StdCtrls, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands, ppCache,
  ppEndUsr, ppCtrls, ppPrnabl, ppParameter, IniFiles;

type
  TFInscripcionIIForo = class(TForm)
    dbgInscripciones: TwwDBGrid;
    Panel1: TPanel;
    Z2bbtnImprime: TBitBtn;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppLabel9: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand1: TppFooterBand;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Z2bbtnImprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      procedure Filtrar;
  end;

var
  FInscripcionIIForo: TFInscripcionIIForo;

implementation

{$R *.dfm}

Uses FACDM;

procedure TFInscripcionIIForo.FormCreate(Sender: TObject);
begin
  Filtrar;
end;

procedure TFInscripcionIIForo.Filtrar;
var
  xSQL : String;
  IniFile : TIniFile;
  linkbd : String;
begin
    IniFile:=TIniFile.Create('C:\DemaExes\oaCFG.ini');
    
    linkbd := IniFile.ReadString('PORTALWEB', 'LINKBD', '');
    if linkbd <> '' then
      linkbd := '@' + linkbd;
        
    xSQL := 'SELECT C.CODFORM,'
        + ' C.CODTIPINS,'
        + ' C.ASODNI,'
        + ' C.ASOAPENOMDNI,'
        + ' C.ASOAPEPATDNI,'
        + ' C.ASOAPEMATDNI,'
        + ' C.ASONOMBRES,'
        + ' C.DESEMP,'
        + ' C.TELEF,'
        + ' C.EMAIL,'
        + ' C.NUMOPEBAN,'
        + ' C.FECOPEBAN,'
        + ' C.FECREG,'
        + ' C.ASOID,'
        + ' T.DESTIPINS'
        + ' FROM WEB_FORM_CAB' + linkbd + ' C'
        + '     INNER JOIN'
        + ' WEB_TIP_INSC_MAE' + linkbd + ' T ON'
        + ' C.CODTIPINS = T.CODTIPINS'
        + ' ORDER BY C.ASOAPENOMDNI';
//        + ' AND TRUNC(A.RECL_FEC_EXP) BETWEEN ' + QuotedStr(dtFechaDesde.Text) + ' AND ' + QuotedStr(dtFechaHasta.Text);

    DMFAC.cdsQry.Close;
    DMFAC.cdsQry.DataRequest(xSQL);
    DMFAC.cdsQry.Open;

    dbgInscripciones.DataSource := DMFAC.dsQry;
    dbgInscripciones.Selected.Clear;
    dbgInscripciones.Selected.Add('DESTIPINS' + #9 + '10' + #9 + 'Tipo Inscripcion');
    dbgInscripciones.Selected.Add('ASODNI' + #9 + '8' + #9 + 'DNI');
    dbgInscripciones.Selected.Add('ASOAPENOMDNI' + #9 + '30' + #9 + 'Nombre Completo');
    dbgInscripciones.Selected.Add('DESEMP' + #9 + '30' + #9 + 'Empresa');
    dbgInscripciones.Selected.Add('TELEF' + #9 + '10' + #9 + 'Teléfono');
    dbgInscripciones.Selected.Add('EMAIL' + #9 + '20' + #9 + 'Email');
    dbgInscripciones.Selected.Add('FECOPEBAN' + #9 + '10' + #9 + 'Fec. Ope Ban');
    dbgInscripciones.Selected.Add('NUMOPEBAN' + #9 + '10' + #9 + 'Nº Ope Ban');
    dbgInscripciones.ApplySelected;
end;

procedure TFInscripcionIIForo.Z2bbtnImprimeClick(Sender: TObject);
begin
  ppReport1.Print;
  ppReport1.Stop;
  //ppDesigner1.ShowModal;
end;

end.
