unit Fac791;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, StdCtrls, Buttons, wwdblook, ExtCtrls, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppVar,
  ppPrnabl, ppCtrls, ppBands;

type
  TFToolResNac = class(TForm)
    pnl: TPanel;
    bvFechas: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    bbtnFiltrar: TBitBtn;
    dbdtpFecIni: TwwDBDateTimePicker;
    dbdtpFecFin: TwwDBDateTimePicker;
    ppdbResumen: TppDBPipeline;
    ppRResumen: TppReport;
    rdgTipo: TRadioGroup;
    bbtnPrint: TBitBtn;
    Bevel1: TBevel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    Label2: TLabel;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    pplblPeriodo: TppLabel;
    ppLabel2: TppLabel;
    pplblUser: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine1: TppLine;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel23: TppLabel;
    ppDBTotCuota: TppDBCalc;
    ppDBTotAvance: TppDBCalc;
    ppDBTotInd: TppDBCalc;
    ppDBTotNac: TppDBCalc;
    ppDBTotStanley: TppDBCalc;
    ppDBTotOtrosImp: TppDBCalc;
    ppDBTotImp: TppDBCalc;
    ppLine3: TppLine;
    ppVTotPorAvance: TppVariable;
    ppDBTotOtrosNac: TppDBCalc;
    ppDBTotPorInd: TppVariable;
    ppDBTotPorOtrosNac: TppVariable;
    ppDBTotPorcNac: TppVariable;
    ppDBTotPorStanley: TppVariable;
    ppDBTotPorOtrosImp: TppVariable;
    ppDBTotPorImp: TppVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppDBSTotCuota: TppDBCalc;
    ppDBSTotAvance: TppDBCalc;
    ppDBSTotInd: TppDBCalc;
    ppDBSTotNac: TppDBCalc;
    ppDBSTotStanley: TppDBCalc;
    ppDBSTotOtrosImp: TppDBCalc;
    ppDBSTotImp: TppDBCalc;
    ppLine2: TppLine;
    ppDBText19: TppDBText;
    ppVSTotPorAvance: TppVariable;
    ppDBSTotOtrosNac: TppDBCalc;
    ppDBSTotPorInd: TppVariable;
    ppDBSTotPorOtrosNac: TppVariable;
    ppDBSTotPorcNac: TppVariable;
    ppDBSTotPorStanley: TppVariable;
    ppDBSTotPorOtrosImp: TppVariable;
    ppDBSTotPorImp: TppVariable;
    Timer1: TTimer;
    procedure bbtnFiltrarClick(Sender: TObject);
    procedure dbdtpFecFinExit(Sender: TObject);
    procedure bbtnPrintClick(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure ppVSTotPorAvanceCalc(Sender: TObject; var Value: Variant);
    procedure ppVTotPorAvanceCalc(Sender: TObject; var Value: Variant);
    procedure ppDBSTotPorIndCalc(Sender: TObject; var Value: Variant);
    procedure ppDBTotPorIndCalc(Sender: TObject; var Value: Variant);
    procedure ppDBSTotPorOtrosNacCalc(Sender: TObject; var Value: Variant);
    procedure ppDBTotPorOtrosNacCalc(Sender: TObject; var Value: Variant);
    procedure ppDBSTotPorcNacCalc(Sender: TObject; var Value: Variant);
    procedure ppDBTotPorcNacCalc(Sender: TObject; var Value: Variant);
    procedure ppDBSTotPorStanleyCalc(Sender: TObject; var Value: Variant);
    procedure ppDBTotPorStanleyCalc(Sender: TObject; var Value: Variant);
    procedure ppDBSTotPorOtrosImpCalc(Sender: TObject; var Value: Variant);
    procedure ppDBSTotPorImpCalc(Sender: TObject; var Value: Variant);
    procedure ppDBTotPorOtrosImpCalc(Sender: TObject; var Value: Variant);
    procedure ppDBTotPorImpCalc(Sender: TObject; var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
     //procedure RecuperaVariables;
  public
    { Public declarations }
  end;

var
  FToolResNac: TFToolResNac;
  xAccesoBotones : Boolean;

implementation

uses FacDM, oaVE3000;

{$R *.DFM}

procedure TFToolResNac.bbtnFiltrarClick(Sender: TObject);
var
   sDesde, sHasta, xAnomm, xMes, sVeid : string;
   xSQL, xSQL1, xSQL2, xSQL3, xSQL4, xSQL5 : wideString;
   Y, M, D : word;
begin
  if dbdtpFecIni.Date=0 then
     raise exception.Create('Falta Fecha de Inicio!!!');
  if dbdtpFecfin.Date=0 then
     raise exception.Create('Falta Fecha Final!!!');

	if (dbdtpFecIni.Date>dbdtpFecFin.Date) then
	begin
		 dbdtpFecFin.Date := dbdtpFecIni.Date;
		 dbdtpFecFin.setfocus;
		 raise exception.Create('Error: Fecha Final debe ser mayor/igual'+#13+' a la Fecha de Inicio');
	end;

  if length(dblcTMon.text)=0 then
     raise exception.Create('Ingrese Moneda');
  xSQL5:=''; xSQL4:=''; xSQL3:=''; xSQL2:=''; xSQL1:=''; xSQL:='';
	sDesde := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dbdtpFecIni.Date) );
	sHasta := Quotedstr(Formatdatetime(DMFAC.wFormatFecha,dbdtpFecFin.Date) );
  sVeid := DMFAC.BuscaQry('dspUltTGE','CXC203','VEID','VEFCORP='+quotedstr('S'),'VEID');

   Decodedate(dbdtpFecFin.Date,Y,M,D);
   if M < 10 then
       xMes:='0'+inttostr(M)
   else
        xMes:=inttostr(M);

   xAnoMM:= IntToStr(Y)+xMes;
	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
	xSQL :=  ' SELECT S.TVTADES,CFAC.VEID,V.VENOMBRES,C.VECUOTA,'
					+' SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
					+' +(SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE   '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
					+' -  SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )) + '
					+' SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
					+' +  DEC(SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
          +' -SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END ) ,15,2) AVANCE,'

					+' DEC((CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
					+'           DEC( (SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
					+' +(SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE   '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
					+' -  SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )) + '
					+' SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
					+' +  DEC(SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
          +' -SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END ) ,15,2)) ,15,2) /'
					+'            C.VECUOTA   END)*100,15,2) PORCENAVANCE,'

					+' SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
          +' MONTOMEIND,'  //Linea 2 - Pinceles

					+'  DEC((CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
					+'             DEC((SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )),15,2) /'
					+'              C.VECUOTA END)*100,15,2) PORCENIND,'

					+'  SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE   '
          +'  CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +'  CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +'  END END )'
					+' -  SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
          +'  CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +'  CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +'  END END )'
          +'  MONTOMEOTROS  ,'

					+'  DEC((CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
					+'             DEC( SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
          +'  CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +'  CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +'  END END )'
					+' -  SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
          +'  CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +'  CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +'  END END ),15,2) /C.VECUOTA  END)*100,15,2) PORCENOTROS,'

					+' SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
					+' +(SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE   '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
					+' -  SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )) TOTNAC,'

					+' DEC((CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
					+'             DEC( SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
					+' +(SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE   '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
					+' -  SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )) ,15,2) /'
					+'               C.VECUOTA  END)*100,15,2) PORCENTOTNAC,'

					+' SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
          +' MONTOSTANLEY,'

					+' DEC((CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
					+'             DEC( SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
          +' END END ),15,2) / C.VECUOTA END)*100,15,2)'
          +' PORCENSTANLEY,'

					+'  DEC(SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
          +' -SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END ) ,15,2)'
          +' MONTOIMPOTROS,'

					+'  DEC( (CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
					+'             DEC( SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
          +' -SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END ),15,2) /  '
					+'             C.VECUOTA  END)*100,15,2) PORCENIMPOTROS,'

					+' SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
					+' +  DEC(SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
          +' -SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END ) ,15,2) TOTIMP,'


					+'  DEC((CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
					+'             DEC( SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
					+' +  DEC(SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END )'
          +' -SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE'
          +' CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END'
          +' END END ) ,15,2) ,15,2) /'
					+'             C.VECUOTA  END)*100,15,2) PORCENTOTIMP'

					+'  FROM FAC306 FAC  LEFT JOIN FAC305 CFAC ON FAC.CIAID=CFAC.CIAID AND FAC.CLIEID=CFAC.CLIEID AND FAC.FACSERIE=CFAC.FACSERIE AND FAC.NFAC=CFAC.NFAC  '
					+'                                      LEFT JOIN CXC203 V ON V.CIAID=CFAC.CIAID AND V.VEID=CFAC.VEID '
					+'                                      LEFT JOIN FAC105 S ON S.TVTAID=V.VETIPO'
					+'                                      LEFT JOIN FAC204 C ON C.VEID=CFAC.VEID  '
					+'                                      LEFT JOIN TGE205 ART ON FAC.CIAID=ART.CIAID AND FAC.ARTID=ART.ARTID'
					+'  WHERE  CFAC.FACFECHA>=' +sDesde +  'AND CFAC.FACFECHA<= '+sHasta
          +'  AND CFAC.FACESTADO=''ACEPTADO'' ';
	end
	else
	if DMFAC.SRV_D = 'ORACLE' then
	begin
	xSQL5:= 'SELECT S.TVTADES, CFAC.VEID, V.VENOMBRES, FAC.TMONID, C.VECUOTA, '
				 +'SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
				 +'+(SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
				 +'- SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END)) + '
				 +'SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
				 +'+ TRUNC(SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
         +'-SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END ),2) AVANCE, '
	       +'TRUNC((CASE WHEN NVL(C.VECUOTA,0)=0 THEN 0 ELSE '
				 +'TRUNC((SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END ) ';
	xSQL4:= '+(SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END ) '
				 +'- SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END)) + '
				 +'SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END ) '
				 +'+ TRUNC(SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END ) '
         +'-SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END ),2)),2) / '
				 +'C.VECUOTA   END)*100,2) PORCENAVANCE, '
         +'SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END ) '
         +'MONTOMEIND, '  //Linea 2 - Pinceles
				 +'TRUNC((CASE WHEN NVL(C.VECUOTA,0)=0 THEN 0 ELSE '
				 +'TRUNC((SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE ';

	xSQL3:= 'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END)),2) / '
				 +'C.VECUOTA END)*100,2) PORCENIND, '
				 +'SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
				 +'- SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END ) '
         +'MONTOMEOTROS, '
	       +'TRUNC((CASE WHEN NVL(C.VECUOTA,0)=0 THEN 0 ELSE '
				 +'TRUNC( SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+
         ' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
				 +'- SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END ),2) /C.VECUOTA  END)*100,2) PORCENOTROS, '
				 +'SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
				 +'+(SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END ) ';
	xSQL2:= '- SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END )) TOTNAC, '
				 +'TRUNC((CASE WHEN NVL(C.VECUOTA,0)=0 THEN 0 ELSE '
				 +'TRUNC(SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
				 +'+ (SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
				 +'- SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaInd)+' AND ART.ARTSPRO=''NACIONAL'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END)),2) / '
				 +'C.VECUOTA END)*100,2) PORCENTOTNAC, '
				 +'SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
         +'MONTOSTANLEY, '
				 +'TRUNC((CASE WHEN NVL(C.VECUOTA,0)=0 THEN 0 ELSE '
				 +'TRUNC(SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END),2) / C.VECUOTA END)*100,2)'
         +'PORCENSTANLEY, ';
	xSQL1:= 'TRUNC(SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
         +'-SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END),2) '
         +'MONTOIMPOTROS, '
				 +'TRUNC((CASE WHEN NVL(C.VECUOTA,0)=0 THEN 0 ELSE '
				 +'TRUNC(SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
         +'-SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END ),2) / '
				 +'C.VECUOTA  END)*100,2) PORCENIMPOTROS, '
				 +'SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
				 +'+ TRUNC(SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END ) '
         +'-SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE ';
	xSQL := 'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END),2) TOTIMP, '
				 +'TRUNC((CASE WHEN NVL(C.VECUOTA,0)=0 THEN 0 ELSE '
				 +'TRUNC( SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
				 +'+ TRUNC(SUM(CASE WHEN CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END) '
         +'-SUM(CASE WHEN  CFAC.TMONID='+Quotedstr(dblcTMon.text)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN  FAC.DFACMTOMO ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonLoc)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)/CFAC.FACTCAM ELSE '
         +'CASE WHEN CFAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' AND FAC.GRARID='+Quotedstr(DMFAC.wLineaStanley)+' AND ART.ARTSPRO=''IMPORTADO'' THEN (FAC.DFACMTOMO)*CFAC.FACTCAM ELSE 0 END '
         +'END END),2),2) / '
				 +'C.VECUOTA  END)*100,2) PORCENTOTIMP '
				 +'FROM FAC306 FAC, FAC305 CFAC, CXC203 V, FAC105 S, FAC204 C, TGE205 ART '
				 +'WHERE CFAC.FACFECHA>=' +sDesde + 'AND CFAC.FACFECHA<= '+sHasta+' '
         +'AND CFAC.FACESTADO=''ACEPTADO'' '
         +'AND FAC.CIAID=CFAC.CIAID AND FAC.CLIEID=CFAC.CLIEID AND FAC.FACSERIE=CFAC.FACSERIE AND FAC.NFAC=CFAC.NFAC '
         +'AND V.CIAID=CFAC.CIAID AND V.VEID=CFAC.VEID '
         +'AND S.TVTAID=V.VETIPO '
         +'AND FAC.CIAID=ART.CIAID AND FAC.ARTID=ART.ARTID';
  end;

  if rdgTipo.ItemIndex=1 then
    xSQL := xSQL+' AND CFAC.VEID<>'+Quotedstr(sVeid);
  xSQL := xSQL +' AND C.VEANOMES='+Quotedstr(xAnoMM);
  //xSQL := xSQL+'  GROUP BY S.TVTADES,CFAC.VEID,V.VENOMBRES, FAC.TMONID,C.VECUOTA '
  xSQL := xSQL +' GROUP BY S.TVTADES, CFAC.VEID, V.VENOMBRES, FAC.TMONID, C.VECUOTA '
        		   +'ORDER BY S.TVTADES,CFAC.VEID';

  xSQL5:=xSQL5+xSQL4+xSQL3+xSQL2+xSQL1+xSQL;
  GReporte.UsuarioSQL.Clear;
  GReporte.UsuarioSQL.Add(xSQL5);
  GReporte.NewQuery;
end;

{procedure TFToolResNac.RecuperaVariables;
var
   Y,M,D : word;
   xMes, xFechaIni : string;
begin
  DecodeDate(Date,Y,M,D);
  if M<10 then
     xMes:='0'+inttostr(M)
  else
     xMes:=inttostr(M);

  xFechaIni := '01/'+xMes+'/'+inttostr(Y);

  dbdtpFecIni.date := strtodate(xFechaIni);
  dbdtpFecFin.date := Date;
end;}

procedure TFToolResNac.dbdtpFecFinExit(Sender: TObject);
begin
  if (dbdtpFecIni.Date>dbdtpFecFin.Date) then
  begin
    dbdtpFecFin.Date := dbdtpFecIni.Date;
    dbdtpFecFin.setfocus;
    raise exception.Create('Error: Fecha Final debe ser mayor/igual'+#13+' a la Fecha de Inicio');
  end;
end;

procedure TFToolResNac.bbtnPrintClick(Sender: TObject);
var
  Y, M, D : word;
  xMes : string;
begin
   if Mtx.FMant.cds2.RecordCount=0 then exit;
   Decodedate(dbdtpFecFin.Date,Y,M,D);
   xMes := DMFAC.NombreMes(M);
   ppRResumen.template.fileName := ExtractFilePath( application.ExeName ) +DMFAC.wRutaRpt+ '\ResVentasNacional.rtm';
	 ppRResumen.template.LoadFromFile;
   pplblPeriodo.Caption:= xMes+' de '+floattostr(Y);
   pplblUser.Caption := DMFAC.wUsuario;
   ppDBResumen.DataSource := Mtx.FMant.ds2;

	 Screen.Cursor:=crDefault;
	 pprResumen.Print;
	 pprResumen.Stop;
end;
  {xSQL:= ' SELECT   S.TVTADES,FAC.VEID,V.VENOMBRES,FAC.TMONID,C.VECUOTA,'
          +' (SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+ 'AND FAC.GRARID=''02'''
          +' AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +' FAC.DFACMTOMO ELSE 0 END) +'
          +' SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+ '  AND FAC.GRARID=''02'' AND ART.ARTSPRO=''NACIONAL''THEN '
          +' FAC.DFACMTOMO ELSE 0 END)   +'
          +' SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''25'''
          +' AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +' FAC.DFACMTOME ELSE 0 END) +'
          +' DEC(SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +' FAC.DFACMTOME ELSE 0 END) -SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''25'' AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +' FAC.DFACMTOME ELSE 0 END),15,2))  AVANCE,'
          +' DEC((CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
          +'           DEC((SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''02'''
          +'  AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END) +'
          +'  SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''02'' AND ART.ARTSPRO=''NACIONAL'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END)   +'
          +'  SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''25'''
          +'  AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END) +'
          +'  DEC(SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END) -SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''25'' AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END),15,2)),15,2) /'
          +'            CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' THEN DEC(COALESCE(C.VECUOTA,0),15,2) ELSE 0 END END)*100,15,2) PORCENAVANCE,'
          +'  SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''02'''
          +'  AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END) MONTOMEIND  ,'
          +'  DEC((CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
          +'             DEC((SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''02'''
          +'  AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOME ELSE 0 END)'
          +'             ),15,2) /'
          +'             CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' THEN DEC(COALESCE(C.VECUOTA,0),15,2) ELSE 0 END END)*100,15,2) PORCENIND,'
          +'  SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''02'' AND ART.ARTSPRO=''NACIONAL''THEN'
          +'  FAC.DFACMTOME ELSE 0 END) MONTOMEOTROS  ,'
          +'  DEC((CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
          +'             DEC((SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''02'''
          +'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOME ELSE 0 END)'
          +'             ),15,2) /'
          +'             CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' THEN DEC(COALESCE(C.VECUOTA,0),15,2) ELSE 0 END END)*100,15,2) PORCENOTROS,'
          +'  SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''02'''
          +'  AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END) +'
          +'  SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''02'' AND ART.ARTSPRO=''NACIONAL''THEN'
          +'  FAC.DFACMTOME ELSE 0 END)   TOTNAC,'
          +'  DEC((CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
          +'             DEC((SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''02'''
          +'  AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOME ELSE 0 END)'
          +'             )+(SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''02'''
          +'  AND ART.ARTSPRO=''NACIONAL'' THEN FAC.DFACMTOME ELSE 0 END)) ,15,2) /'
          +'             CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' THEN DEC(COALESCE(C.VECUOTA,0),15,2) ELSE 0 END END)*100,15,2) PORCENTOTNAC,'
          +'  SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''25'''
          +'  AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END) MONTOSTANLEY,'
          +'  DEC((CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
          +'             DEC((SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''25'''
          +'  AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOME ELSE 0 END)'
          +'             ),15,2) /'
          +'             CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' THEN DEC(COALESCE(C.VECUOTA,0),15,2) ELSE 0 END END)*100,15,2) PORCENSTANLEY,'
          +'  DEC(SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END) -SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''25'' AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END),15,2) MONTOIMPOTROS,'
          +'  DEC( (CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
          +'             DEC((SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND  ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOME ELSE 0 END)'
          +'             )-(SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND  FAC.GRARID=''25'' AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOME ELSE 0 END)'
          +'             ),15,2) /  '
          +'                CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' THEN DEC(COALESCE(C.VECUOTA,0),15,2)'
          +'                ELSE 0'
          +'                END    '
          +'            END)*100   '
          +'  ,15,2) PORCENIMPOTROS,'
          +'  SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''25'''
          +'  AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END) +'
          +'  DEC(SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END) -SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''25'' AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END),15,2)  TOTIMP,'
          +'  DEC((CASE WHEN COALESCE(C.VECUOTA,0)=0 THEN 0 ELSE'
          +'             DEC((SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''25'''
          +'  AND ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOME ELSE 0 END)'
          +'             )+'
          +'  ((SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND  ART.ARTSPRO=''IMPORTADO'' THEN FAC.DFACMTOME ELSE 0 END)'
          +'             )-SUM(CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+'  AND FAC.GRARID=''25'' AND ART.ARTSPRO=''IMPORTADO'' THEN'
          +'  FAC.DFACMTOME ELSE 0 END)),15,2) /'
          +'             CASE WHEN FAC.TMONID='+Quotedstr(DMFAC.wTMonExt)+' THEN DEC(COALESCE(C.VECUOTA,0),15,2) ELSE 0 END END)*100,15,2) PORCENTOTIMP'
          +'  FROM FAC306 FAC  LEFT JOIN FAC305 CFAC ON FAC.FACSERIE=CFAC.FACSERIE AND FAC.NFAC=CFAC.NFAC  AND CFAC.VEID=FAC.VEID AND CFAC.FACESTADO=''ACEPTADO'' '
          +'                                      LEFT JOIN CXC203 V ON V.VEID=FAC.VEID '
          +'                                      LEFT JOIN FAC105 S ON S.TVTAID=CFAC.TIPVTAID'
          +'                                      LEFT JOIN FAC204 C ON C.VEID=FAC.VEID  AND C.VEID=CFAC.VEID '
          +'                                      LEFT JOIN TGE205 ART ON FAC.CIAID=ART.CIAID AND FAC.ARTID=ART.ARTID'
          +'  WHERE  CFAC.FACFECHA>=' +sDesde +  'AND CFAC.FACFECHA<= '+sHasta
          +'  GROUP BY S.TVTADES,FAC.VEID,V.VENOMBRES, FAC.TMONID,C.VECUOTA '
          +'  ORDER BY S.TVTADES,FAC.VEID ';}

procedure TFToolResNac.dblcTMonExit(Sender: TObject);
var
  xWhere : string;
begin
  xWhere:= 'TMONID='+''''+dblcTMon.Text+''' '+
           'AND (TMON_LOC='+''''+'L'+''''+' OR TMON_LOC='+''''+'E'+''''+')';
   edtTMon.Text:=DMFAC.BuscaQry('dspUltTGE','TGE103','TMONDES',xWhere,'TMONDES');
end;

procedure TFToolResNac.ppVSTotPorAvanceCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppdbSTotAvance.Value/ppdbSTotCuota.Value)*100
end;

procedure TFToolResNac.ppVTotPorAvanceCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppdbTotAvance.Value/ppdbTotCuota.Value)*100
end;

procedure TFToolResNac.ppDBSTotPorIndCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppDBSTotInd.Value/ppdbSTotCuota.Value)*100
end;

procedure TFToolResNac.ppDBTotPorIndCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppDBTotInd.Value/ppdbTotCuota.Value)*100
end;

procedure TFToolResNac.ppDBSTotPorOtrosNacCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppDBSTotOtrosNac.Value/ppdbSTotCuota.Value)*100
end;

procedure TFToolResNac.ppDBTotPorOtrosNacCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppDBTotOtrosNac.Value/ppdbTotCuota.Value)*100
end;

procedure TFToolResNac.ppDBSTotPorcNacCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppDBSTotNac.Value/ppdbSTotCuota.Value)*100
end;

procedure TFToolResNac.ppDBTotPorcNacCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppDBTotNac.Value/ppdbTotCuota.Value)*100
end;

procedure TFToolResNac.ppDBSTotPorStanleyCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppDBSTotStanley.Value/ppdbSTotCuota.Value)*100
end;

procedure TFToolResNac.ppDBTotPorStanleyCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppDBTotStanley.Value/ppdbTotCuota.Value)*100
end;

procedure TFToolResNac.ppDBSTotPorOtrosImpCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppDBSTotOtrosImp.Value/ppdbSTotCuota.Value)*100
end;

procedure TFToolResNac.ppDBSTotPorImpCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppDBSTotImp.Value/ppdbSTotCuota.Value)*100
end;

procedure TFToolResNac.ppDBTotPorOtrosImpCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppDBTotOtrosImp.Value/ppdbTotCuota.Value)*100
end;

procedure TFToolResNac.ppDBTotPorImpCalc(Sender: TObject; var Value: Variant);
begin
  value := (ppDBTotImp.Value/ppdbTotCuota.Value)*100
end;

procedure TFToolResNac.FormCreate(Sender: TObject);
var
  Y,M,D : word;
  xMes,xFechaIni : string;
begin
  DecodeDate(Date,Y,M,D);
  if M<10 then
     xMes:='0'+inttostr(M)
  else
     xMes:=inttostr(M);

  xFechaIni := '01/'+xMes+'/'+inttostr(Y);

  dbdtpFecIni.date := strtodate(xFechaIni);
  dbdtpFecFin.date := Date;
end;

procedure TFToolResNac.Timer1Timer(Sender: TObject);
begin
 {  FVariables.w_NombreForma := 'FToolResNac';}
// Inicio HPC_201311_FAC
// incluye al usuario de tipo administrador en el destroy del timer
{
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolResNac);
      xAccesoBotones := True;
   end;
}
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then
   else
   begin
      if not xAccesoBotones then
      begin
         DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolResNac);
         xAccesoBotones := True;
      end;
   end;
// Fin HPC_201311_FAC
   Timer1.Destroy;
end;

end.

