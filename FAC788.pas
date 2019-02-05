unit Fac788;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, Buttons, ComCtrls, ExtCtrls, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppCache, ppDB, ppDBPipe, ppBands, ppCtrls, ppPrnabl, ppViewr,
  ppEndUsr, ppTypes, MsgDlgs;

type
  TFToolResVtaNeta = class(TForm)
    pnlTool: TPanel;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtpDesde: TDateTimePicker;
    dtpHasta: TDateTimePicker;
    Z1sbKardex: TBitBtn;
    Z2bbtnInvVal: TBitBtn;
    ppDBPipeline1: TppDBPipeline;
    ppReporte: TppReport;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLine5: TppLine;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
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
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel20: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    Timer1: TTimer;
    procedure Z2bbtnInvValClick(Sender: TObject);
    procedure Z1sbKardexClick(Sender: TObject);
    procedure ppReportePreviewFormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
	public
		{ Public declarations }
	end;

var
	FToolResVtaNeta: TFToolResVtaNeta;
   xAccesoBotones : Boolean;

implementation

uses FacDM, oaVE3000;

{$R *.DFM}

procedure TFToolResVtaNeta.Z2bbtnInvValClick(Sender: TObject);
var
	sSQL, xBetw, xEnd, sDesde, sHasta : String;
	xSec01, xSec02, xVtSub, xSec03, xVtTot : Double;
	xPaso : Integer;
  xBetw2, xEnd2, sSQL2, sVeCorp : string;
  xBetw3, xEnd3, sSQL3, xBetw4, xEnd4, sSQL4 : string;
begin
	Screen.Cursor:=crHourGlass;
	xPaso := 0;
	sDesde  :=quotedStr(formatdatetime(DMFAC.wFormatFecha,dtpDesde.DateTime));
	sHasta  :=quotedStr(formatdatetime(DMFAC.wFormatFecha,dtpHasta.DateTime));
  sVeCorp := DMFAC.BuscaQry('dspUltTGE','CXC203','VEID','VEFCORP='+quotedstr('S'),'VEID');
  //CIM 03/07/2002
	if (DMFAC.SRV_D = 'DB2NT') or (DMFAC.SRV_D = 'DB2400') then
	begin
    ////////////////////////////////////////////////
    ///      VENTAS SIN COMPAÑIAS CORPORATIVAS   ///
    ////////////////////////////////////////////////

    /// sql para Facturas C/E,15,30
		xBetw2:=''; xEnd2:='';
		DMFAC.BuscaQry('dspUltTGE','FAC120','*','','DIASVCMTO');
		DMFAC.cdsQry.First;
		while not DMFAC.cdsQry.Eof do
		begin
			xBetw2:=xBetw2+'CASE WHEN DIAS BETWEEN '+
									DMFAC.cdsQry.FieldByName('RANGMIN').AsString+' AND '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' THEN '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' ELSE ';
			xEnd2 :=xEnd2 +'END ';
			DMFAC.cdsQry.Next;
		end;
		sSQL2:= ' SELECT DIAS, '+
					  ' SUM(SEC01) SEC01, 0.00 PORLIM, '+
					  ' SUM(SEC02) SEC02, 0.00 PORPRO, '+
					  ' 0.00 VTASUB, 0.00 PORSUB, '+
					  ' SUM(SEC03) SEC03,  0.00 PORCOR, '+
					  ' 0.00 VTATOT, 0.00 PORTOT '+
					  ' FROM '+
					  ' (SELECT  SECTOR, ';

		sSQL2:=sSQL2+xBetw2+' 100 '+xEnd2+' DIAS, ';

    {sSQL2:=sSQL2+'CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaLocal)+ ' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC01, '+
					'CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaProv)+' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC02, '+}
		sSQL2:=sSQL2+' CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaLocal)+ ' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC01, '+
					' CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaProv)+' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC02, '+
    //					'CASE WHEN SECTOR='+Quotedstr(xVtaCorp)+' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC03 '+
					' 0.00 SEC03 '+
					' FROM '+
					' (SELECT C.TVTAID SECTOR, A.CCGRAVAD, A.CCFLETE,A.CCMTOLOC,A.CCMTOEXT, days(A.CCFVCMTO)-days(A.CCFEMIS) DIAS,A.CCOMERID '+
					' FROM CXC301 A '+
					' INNER JOIN TGE110 B ON (A.DOCID=B.DOCID AND B.DOCTIPREG IN (''F'',''B'') AND B.DOCMOD=''CXC'') '+
					' INNER JOIN TGE204 C ON (A.CIAID=C.CIAID AND A.CLAUXID=C.CLAUXID AND A.CLIEID=C.CLIEID) '+
					' LEFT OUTER JOIN TGE180 D ON (A.CIAID=D.CIAID AND coalesce(A.CCOMERID,''nnn'')=D.CCOMERID AND A.TVTAID=D.SCOMERID) '+
					' WHERE CCFEMIS>='+sDesde+' '+
					' AND CCFEMIS<='+sHasta+' '+
					' AND (COALESCE(CCFLAGVTA,''NULO'') = ''S'') '+
					' AND ((CCESTADO in (''P'') AND D.DCCOMMOD<>''L'') )'+
          ' AND COALESCE(A.VEID,'''')<>'+Quotedstr(sVeCorp)+
          ' ) Z '+
					' GROUP BY SECTOR,DIAS) YY '+
					' GROUP BY DIAS';
    DMFAC.cdsQry2.IndexFieldNames :='';
    DMFAC.cdsQry2.Close;
    DMFAC.cdsQry2.DataRequest(sSQL2);
    DMFAC.cdsQry2.Open;
    ///////////////////////////////////////

    /// Sql para letras
		xBetw:=''; xEnd:='';
		DMFAC.BuscaQry('dspUltTGE','FAC120','*','','DIASVCMTO');
		DMFAC.cdsQry.First;
		while not DMFAC.cdsQry.Eof do
		begin
			xBetw:=xBetw+' CASE WHEN DIAS BETWEEN '+
									DMFAC.cdsQry.FieldByName('RANGMIN').AsString+' AND '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' THEN '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' ELSE ';
			xEnd :=xEnd +'END ';
			DMFAC.cdsQry.Next;
		end;
		sSQL:=' SELECT DIAS, '+
					' SUM(SEC01) SEC01, 0.00 PORLIM, '+
					' SUM(SEC02) SEC02, 0.00 PORPRO, '+
					' 0.00 VTASUB, 0.00 PORSUB, '+
					' SUM(SEC03) SEC03,  0.00 PORCOR, '+
					' 0.00 VTATOT, 0.00 PORTOT '+
					' FROM '+
					' (SELECT  SECTOR, ';

		sSQL:=sSQL+xBetw+' 100 '+xEnd+' DIAS, ';
    {sSQL:=sSQL+'CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaLocal)+' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC01, '+
					'CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaProv)+' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC02, '+}
		sSQL:=sSQL+'CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaLocal)+' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC01, '+
					' CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaProv)+' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC02, '+

    //		'CASE WHEN SECTOR='+Quotedstr(xVtaCorp)+' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC03 '+
					' 0.00 SEC03 '+
					' FROM '+
					' (SELECT C.TVTAID SECTOR, A.CCGRAVAD, A.CCFLETE,A.CCMTOLOC,A.CCMTOEXT, days(A.CCFVCMTO)-days(A.CCFEMIS) DIAS,A.CCOMERID '+
					' FROM CXC301 A '+
					' INNER JOIN TGE110 B ON (A.DOCID=B.DOCID AND B.DOCTIPREG IN (''L'') AND B.DOCMOD=''CXC'') '+
					' INNER JOIN TGE204 C ON (A.CIAID=C.CIAID AND A.CLAUXID=C.CLAUXID AND A.CLIEID=C.CLIEID) '+
					' WHERE CCFEMIS>='+sDesde+' '+
					' AND CCFEMIS<='+sHasta+' '+
					' AND (COALESCE(CCFLAGVTA,''NULO'') = ''S'') '+
					' AND ((CCESTADO in (''P'',''C'' )  and TCANJEID=''LC''))'+
          ' AND COALESCE(A.VEID,'''')<>'+Quotedstr(sVeCorp)+
          ' ) Z '+
					' GROUP BY SECTOR,DIAS) YY '+
					' GROUP BY DIAS';

    ////////////////////////////////////////////////
    ///      VENTAS CON COMPAÑIAS CORPORATIVAS   ///
    ////////////////////////////////////////////////

    //sql para Facturas C/E,15,30

		xBetw3:=''; xEnd3:='';
		DMFAC.BuscaQry('dspUltTGE','FAC120','*','','DIASVCMTO');
		DMFAC.cdsQry.First;
		while not DMFAC.cdsQry.Eof do
		begin
			xBetw3:=xBetw3+'CASE WHEN DIAS BETWEEN '+
									DMFAC.cdsQry.FieldByName('RANGMIN').AsString+' AND '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' THEN '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' ELSE ';
			xEnd3 :=xEnd3 +'END ';
			DMFAC.cdsQry.Next;
		end;
		sSQL3:= ' SELECT DIAS, '+
					  ' SUM(SEC01) SEC01, 0.00 PORLIM, '+
					  ' SUM(SEC02) SEC02, 0.00 PORPRO, '+
					  ' 0.00 VTASUB, 0.00 PORSUB, '+
					  ' SUM(SEC03) SEC03,  0.00 PORCOR, '+
					  ' 0.00 VTATOT, 0.00 PORTOT '+
					  ' FROM '+
					  ' (SELECT  SECTOR, ';

		sSQL3:=sSQL3+xBetw3+' 100 '+xEnd3+' DIAS, ';

    {sSQL2:=sSQL2+'CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaLocal)+ ' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC01, '+
					'CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaProv)+' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC02, '+}
		sSQL3:=sSQL3+' 0.00 SEC01, '+
					' 0.00 SEC02, '+
          ' SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) SEC03 '+
    //'CASE WHEN SECTOR='+Quotedstr(xVtaCorp)+' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC03 '+
					' FROM '+
					' (SELECT C.TVTAID SECTOR, A.CCGRAVAD, A.CCFLETE,A.CCMTOLOC,A.CCMTOEXT, days(A.CCFVCMTO)-days(A.CCFEMIS) DIAS,A.CCOMERID '+
					' FROM CXC301 A '+
					' INNER JOIN TGE110 B ON (A.DOCID=B.DOCID AND B.DOCTIPREG IN (''F'',''B'') AND B.DOCMOD=''CXC'') '+
					' INNER JOIN TGE204 C ON (A.CIAID=C.CIAID AND A.CLAUXID=C.CLAUXID AND A.CLIEID=C.CLIEID) '+
					' LEFT OUTER JOIN TGE180 D ON (A.CIAID=D.CIAID AND coalesce(A.CCOMERID,''nnn'')=D.CCOMERID AND A.TVTAID=D.SCOMERID) '+
					' WHERE CCFEMIS>='+sDesde+' '+
					' AND CCFEMIS<='+sHasta+' '+
					' AND (COALESCE(CCFLAGVTA,''NULO'') = ''S'') '+
					' AND ((CCESTADO in (''P'') AND D.DCCOMMOD<>''L'') )'+
          ' AND COALESCE(A.VEID,'''')='+Quotedstr(sVeCorp)+
          ' ) Z '+
					' GROUP BY SECTOR,DIAS) YY '+
					' GROUP BY DIAS';
    DMFAC.cdsQry3.IndexFieldNames :='';
    DMFAC.cdsQry3.Close;
    DMFAC.cdsQry3.DataRequest(sSQL3);
    DMFAC.cdsQry3.Open;

    /// Sql para letras
		xBetw4:=''; xEnd4:='';
		DMFAC.BuscaQry('dspUltTGE','FAC120','*','','DIASVCMTO');
		DMFAC.cdsQry.First;
		while not DMFAC.cdsQry.Eof do
		begin
			xBetw4:=xBetw4+' CASE WHEN DIAS BETWEEN '+
									DMFAC.cdsQry.FieldByName('RANGMIN').AsString+' AND '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' THEN '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' ELSE ';
			xEnd4 :=xEnd4 +'END ';
			DMFAC.cdsQry.Next;
		end;
		sSQL4:=' SELECT DIAS, '+
					' SUM(SEC01) SEC01, 0.00 PORLIM, '+
					' SUM(SEC02) SEC02, 0.00 PORPRO, '+
					' 0.00 VTASUB, 0.00 PORSUB, '+
					' SUM(SEC03) SEC03,  0.00 PORCOR, '+
					' 0.00 VTATOT, 0.00 PORTOT '+
					' FROM '+
					' (SELECT  SECTOR, ';

		sSQL4:=sSQL4+xBetw4+' 100 '+xEnd4+' DIAS, ';
		sSQL4:=sSQL4+'0.00 SEC01, '+
					' 0.00 SEC02, '+
          ' SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) SEC03 '+
    //					'CASE WHEN SECTOR='+Quotedstr(xVtaCorp)+' THEN SUM(coalesce(Z.CCGRAVAD,0)+coalesce(Z.CCFLETE,0)) ELSE 0 END SEC03 '+
					' FROM '+
					' (SELECT C.TVTAID SECTOR, A.CCGRAVAD, A.CCFLETE,A.CCMTOLOC,A.CCMTOEXT, days(A.CCFVCMTO)-days(A.CCFEMIS) DIAS,A.CCOMERID '+
					' FROM CXC301 A '+
					' INNER JOIN TGE110 B ON (A.DOCID=B.DOCID AND B.DOCTIPREG IN (''L'') AND B.DOCMOD=''CXC'') '+
					' INNER JOIN TGE204 C ON (A.CIAID=C.CIAID AND A.CLAUXID=C.CLAUXID AND A.CLIEID=C.CLIEID) '+
					' WHERE CCFEMIS>='+sDesde+' '+
					' AND CCFEMIS<='+sHasta+' '+
					' AND (COALESCE(CCFLAGVTA,''NULO'') = ''S'') '+
					' AND ((CCESTADO in (''P'',''C'' )  and TCANJEID=''LC''))'+
          ' AND COALESCE(A.VEID,'''')='+Quotedstr(sVeCorp)+
          ' ) Z '+
					' GROUP BY SECTOR,DIAS) YY '+
					' GROUP BY DIAS';
    DMFAC.cdsQry4.IndexFieldNames :='';
    DMFAC.cdsQry4.Close;
    DMFAC.cdsQry4.DataRequest(sSQL4);
    DMFAC.cdsQry4.Open;
	end
	else
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	if DMFAC.SRV_D = 'ORACLE' then
	begin
		xBetw2:=''; xEnd2:='';
		DMFAC.BuscaQry('dspUltTGE','FAC120','*','','DIASVCMTO');
		DMFAC.cdsQry.First;
		while not DMFAC.cdsQry.Eof do
		begin
			xBetw2:=xBetw2+'CASE WHEN DIAS BETWEEN '+
									DMFAC.cdsQry.FieldByName('RANGMIN').AsString+' AND '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' THEN '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' ELSE ';
			xEnd2 :=xEnd2 +'END ';
			DMFAC.cdsQry.Next;
		end;
		sSQL2:= 'SELECT DIAS, '+
					  'SUM(SEC01) SEC01, 0.00 PORLIM, '+
					  'SUM(SEC02) SEC02, 0.00 PORPRO, '+
					  '0.00 VTASUB, 0.00 PORSUB, '+
					  'SUM(SEC03) SEC03,  0.00 PORCOR, '+
					  '0.00 VTATOT, 0.00 PORTOT '+
					  'FROM '+
					  '(SELECT  SECTOR, ';
		sSQL2:=sSQL2+xBetw2+' 100 '+xEnd2+' DIAS, ';
		sSQL2:=sSQL2+' CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaLocal)+ ' THEN SUM(NVL(Z.CCGRAVAD,0)+NVL(Z.CCFLETE,0)) ELSE 0 END SEC01, '+
					'CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaProv)+' THEN SUM(NVL(Z.CCGRAVAD,0)+NVL(Z.CCFLETE,0)) ELSE 0 END SEC02, '+
					'0.00 SEC03 '+
					'FROM '+
					'(SELECT C.TVTAID SECTOR, A.CCGRAVAD, A.CCFLETE, A.CCMTOLOC, A.CCMTOEXT, TO_NUMBER(TO_CHAR(A.CCFVCMTO))-TO_NUMBER(TO_CHAR(A.CCFEMIS)) DIAS, A.CCOMERID '+
					'FROM CXC301 A, TGE110 B, TGE204 C, TGE180 D '+
					'WHERE CCFEMIS>='+sDesde+' '+
					'AND CCFEMIS<='+sHasta+' '+
					'AND (NVL(CCFLAGVTA,''NULO'')=''S'') '+
					'AND ((CCESTADO IN (''P'') AND D.DCCOMMOD<>''L'')) '+
          'AND NVL(A.VEID,'''')<>'+Quotedstr(sVeCorp)+' '+
          'AND A.DOCID=B.DOCID AND B.DOCTIPREG IN (''F'',''B'') AND B.DOCMOD=''CXC'' '+
          'AND A.CIAID=C.CIAID AND A.CLAUXID=C.CLAUXID AND A.CLIEID=C.CLIEID '+
          'AND A.CIAID=D.CIAID AND NVL(A.CCOMERID,''NNN'')=D.CCOMERID AND A.TVTAID=D.SCOMERID '+
          ') Z '+
					'GROUP BY SECTOR, DIAS) YY '+
					'GROUP BY DIAS';
    DMFAC.cdsQry2.IndexFieldNames :='';
    DMFAC.cdsQry2.Close;
    DMFAC.cdsQry2.DataRequest(sSQL2);
    DMFAC.cdsQry2.Open;

    /// Sql para letras
		xBetw:=''; xEnd:='';
		DMFAC.BuscaQry('dspUltTGE','FAC120','*','','DIASVCMTO');
		DMFAC.cdsQry.First;
		while not DMFAC.cdsQry.Eof do
		begin
			xBetw:=xBetw+' CASE WHEN DIAS BETWEEN '+
									DMFAC.cdsQry.FieldByName('RANGMIN').AsString+' AND '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' THEN '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' ELSE ';
			xEnd :=xEnd +'END ';
			DMFAC.cdsQry.Next;
		end;
		sSQL:='SELECT DIAS, '+
					'SUM(SEC01) SEC01, 0.00 PORLIM, '+
					'SUM(SEC02) SEC02, 0.00 PORPRO, '+
					'0.00 VTASUB, 0.00 PORSUB, '+
					'SUM(SEC03) SEC03,  0.00 PORCOR, '+
					'0.00 VTATOT, 0.00 PORTOT '+
					'FROM '+
					'(SELECT  SECTOR, ';

		sSQL:=sSQL+xBetw+' 100 '+xEnd+' DIAS, ';
		sSQL:=sSQL+'CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaLocal)+' THEN SUM(NVL(Z.CCGRAVAD,0)+NVL(Z.CCFLETE,0)) ELSE 0 END SEC01, '+
					'CASE WHEN SECTOR='+Quotedstr(DMFAC.wVtaProv)+' THEN SUM(NVL(Z.CCGRAVAD,0)+NVL(Z.CCFLETE,0)) ELSE 0 END SEC02, '+
				  '0.00 SEC03 '+
					'FROM '+
					'(SELECT C.TVTAID SECTOR, A.CCGRAVAD, A.CCFLETE,A.CCMTOLOC,A.CCMTOEXT, '+
          'TO_NUMBER(TO_CHAR(A.CCFVCMTO))-TO_NUMBER(TO_CHAR(A.CCFEMIS)) DIAS, A.CCOMERID '+
					'FROM CXC301 A, TGE110 B, TGE204 C '+
					'WHERE CCFEMIS>='+sDesde+' '+
					'AND CCFEMIS<='+sHasta+' '+
					'AND (NVL(CCFLAGVTA,''NULO'') = ''S'') '+
					'AND ((CCESTADO IN (''P'',''C'' )  AND TCANJEID=''LC''))'+
          'AND NVL(A.VEID,'''')<>'+Quotedstr(sVeCorp)+
          'AND A.DOCID=B.DOCID AND B.DOCTIPREG IN (''L'') AND B.DOCMOD=''CXC'' '+
          'AND A.CIAID=C.CIAID AND A.CLAUXID=C.CLAUXID AND A.CLIEID=C.CLIEID '+
          ') Z '+
					'GROUP BY SECTOR, DIAS) YY '+
					'GROUP BY DIAS';

    //sql para Facturas C/E,15,30
		xBetw3:=''; xEnd3:='';
		DMFAC.BuscaQry('dspUltTGE','FAC120','*','','DIASVCMTO');
		DMFAC.cdsQry.First;
		while not DMFAC.cdsQry.Eof do
		begin
			xBetw3:=xBetw3+'CASE WHEN DIAS BETWEEN '+
									DMFAC.cdsQry.FieldByName('RANGMIN').AsString+' AND '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' THEN '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' ELSE ';
			xEnd3 :=xEnd3 +'END ';
			DMFAC.cdsQry.Next;
		end;
		sSQL3:='SELECT DIAS, '+
					 'SUM(SEC01) SEC01, 0.00 PORLIM, '+
					 'SUM(SEC02) SEC02, 0.00 PORPRO, '+
					 '0.00 VTASUB, 0.00 PORSUB, '+
					 'SUM(SEC03) SEC03,  0.00 PORCOR, '+
					 '0.00 VTATOT, 0.00 PORTOT '+
					 'FROM '+
					 '(SELECT  SECTOR, ';

		sSQL3:=sSQL3+xBetw3+' 100 '+xEnd3+' DIAS, ';
		sSQL3:=sSQL3+' 0.00 SEC01, '+
					'0.00 SEC02, '+
          'SUM(NVL(Z.CCGRAVAD,0)+NVL(Z.CCFLETE,0)) SEC03 '+
					'FROM '+
					'(SELECT C.TVTAID SECTOR, A.CCGRAVAD, A.CCFLETE, A.CCMTOLOC, A.CCMTOEXT, '+
          'TO_NUMBER(TO_CHAR(A.CCFVCMTO))-TO_NUMBER(TO_CHAR(A.CCFEMIS)) DIAS, A.CCOMERID '+
					'FROM CXC301 A, TGE110 B, TGE204 C, TGE180 D '+
					'WHERE CCFEMIS>='+sDesde+' '+
					'AND CCFEMIS<='+sHasta+' '+
					'AND (NVL(CCFLAGVTA,''NULO'')=''S'') '+
					'AND ((CCESTADO in (''P'') AND D.DCCOMMOD<>''L'') )'+
          'AND NVL(A.VEID,'''')='+Quotedstr(sVeCorp)+' '+
          'AND A.DOCID=B.DOCID AND B.DOCTIPREG IN (''F'',''B'') AND B.DOCMOD=''CXC'' '+
          'AND A.CIAID=C.CIAID AND A.CLAUXID=C.CLAUXID AND A.CLIEID=C.CLIEID '+
          'AND A.CIAID=D.CIAID AND NVL(A.CCOMERID,''NNN'')=D.CCOMERID AND A.TVTAID=D.SCOMERID '+
          ') Z '+
					'GROUP BY SECTOR, DIAS) YY '+
					'GROUP BY DIAS';
    DMFAC.cdsQry3.IndexFieldNames :='';
    DMFAC.cdsQry3.Close;
    DMFAC.cdsQry3.DataRequest(sSQL3);
    DMFAC.cdsQry3.Open;

    /// Sql para letras
		xBetw4:=''; xEnd4:='';
		DMFAC.BuscaQry('dspUltTGE','FAC120','*','','DIASVCMTO');
		DMFAC.cdsQry.First;
		while not DMFAC.cdsQry.Eof do
		begin
			xBetw4:=xBetw4+' CASE WHEN DIAS BETWEEN '+
									DMFAC.cdsQry.FieldByName('RANGMIN').AsString+' AND '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' THEN '+
									DMFAC.cdsQry.FieldByName('RANGMAX').AsString+' ELSE ';
			xEnd4 :=xEnd4 +'END ';
			DMFAC.cdsQry.Next;
		end;
		sSQL4:='SELECT DIAS, '+
					 'SUM(SEC01) SEC01, 0.00 PORLIM, '+
					 'SUM(SEC02) SEC02, 0.00 PORPRO, '+
					 '0.00 VTASUB, 0.00 PORSUB, '+
					 'SUM(SEC03) SEC03,  0.00 PORCOR, '+
					 '0.00 VTATOT, 0.00 PORTOT '+
					 'FROM '+
					 '(SELECT  SECTOR, ';

		sSQL4:=sSQL4+xBetw4+' 100 '+xEnd4+' DIAS, ';
		sSQL4:=sSQL4+'0.00 SEC01, '+
					'0.00 SEC02, '+
          'SUM(NVL(Z.CCGRAVAD,0)+NVL(Z.CCFLETE,0)) SEC03 '+
					'FROM '+
					'(SELECT C.TVTAID SECTOR, A.CCGRAVAD, A.CCFLETE, A.CCMTOLOC, A.CCMTOEXT, '+
          'TO_NUMBER(TO_CHAR(A.CCFVCMTO))-TO_NUMBER(TO_CHAR(A.CCFEMIS)) DIAS, A.CCOMERID '+
					'FROM CXC301 A, TGE110 B, TGE204 C '+
					'WHERE CCFEMIS>='+sDesde+' '+
					'AND CCFEMIS<='+sHasta+' '+
					'AND (NVL(CCFLAGVTA,''NULO'')=''S'') '+
					'AND ((CCESTADO in (''P'',''C'' )  and TCANJEID=''LC''))'+
          'AND NVL(A.VEID,'''')='+Quotedstr(sVeCorp)+
          'AND A.DOCID=B.DOCID AND B.DOCTIPREG IN (''L'') AND B.DOCMOD=''CXC'' '+
          'AND A.CIAID=C.CIAID AND A.CLAUXID=C.CLAUXID AND A.CLIEID=C.CLIEID '+
          ') Z '+
					'GROUP BY SECTOR,DIAS) YY '+
					'GROUP BY DIAS';
    DMFAC.cdsQry4.IndexFieldNames :='';
    DMFAC.cdsQry4.Close;
    DMFAC.cdsQry4.DataRequest(sSQL4);
    DMFAC.cdsQry4.Open;
	end;          // Fin de Oracle

	Mtx.UsuarioSQL.Clear;
	Mtx.UsuarioSQL.Add(sSQL);
	Screen.Cursor:=crDefault;
	Mtx.NewQuery;
  if DMFAC.cdsQry2.RecordCount>0 then
  begin
    DMFAC.cdsQry2.IndexFieldNames :='DIAS';
    DMFAC.cdsQry3.IndexFieldNames :='DIAS';
    DMFAC.cdsQry4.IndexFieldNames :='DIAS';
    Mtx.FMant.cds2.DisableControls;
    Mtx.FMant.cds2.First;
    while not Mtx.FMant.cds2.Eof do
    begin
       DMFAC.cdsQry2.SetKey;
       DMFAC.cdsQry2.FieldByName('DIAS').AsString :=Mtx.FMant.cds2.FieldByName('DIAS').AsString;
       if DMFAC.cdsQry2.gotokey then
       begin
          Mtx.FMant.cds2.Edit;
          Mtx.FMant.cds2.fieldbyname('SEC01').AsFloat := Mtx.FMant.cds2.fieldbyname('SEC01').AsFloat+DMFAC.cdsQry2.fieldbyname('SEC01').AsFloat;
          Mtx.FMant.cds2.fieldbyname('SEC02').AsFloat := Mtx.FMant.cds2.fieldbyname('SEC02').AsFloat+DMFAC.cdsQry2.fieldbyname('SEC02').AsFloat;
          Mtx.FMant.cds2.fieldbyname('SEC03').AsFloat := Mtx.FMant.cds2.fieldbyname('SEC03').AsFloat+DMFAC.cdsQry2.fieldbyname('SEC03').AsFloat;
          Mtx.FMant.cds2.Post;
       end
       else
       begin
          Mtx.FMant.cds2.Insert;
          Mtx.FMant.cds2.FieldByName('DIAS').AsString  := DMFAC.cdsQry2.FieldByName('DIAS').AsString ;
          Mtx.FMant.cds2.fieldbyname('SEC01').AsFloat  := DMFAC.cdsQry2.fieldbyname('SEC01').AsFloat;
          Mtx.FMant.cds2.fieldbyname('PORLIM').AsFloat := DMFAC.cdsQry2.fieldbyname('PORLIM').AsFloat;
          Mtx.FMant.cds2.fieldbyname('SEC02').AsFloat  := DMFAC.cdsQry2.fieldbyname('SEC02').AsFloat;
          Mtx.FMant.cds2.fieldbyname('PORPRO').AsFloat := DMFAC.cdsQry2.fieldbyname('PORPRO').AsFloat;
          Mtx.FMant.cds2.fieldbyname('SEC03').AsFloat  := DMFAC.cdsQry2.fieldbyname('SEC03').AsFloat;
          Mtx.FMant.cds2.fieldbyname('PORCOR').AsFloat := DMFAC.cdsQry2.fieldbyname('PORCOR').AsFloat;
          Mtx.FMant.cds2.fieldbyname('VTASUB').AsFloat  := DMFAC.cdsQry2.fieldbyname('VTASUB').AsFloat;
          Mtx.FMant.cds2.fieldbyname('PORSUB').AsFloat := DMFAC.cdsQry2.fieldbyname('PORSUB').AsFloat;
          Mtx.FMant.cds2.fieldbyname('VTATOT').AsFloat  := DMFAC.cdsQry2.fieldbyname('VTATOT').AsFloat;
          Mtx.FMant.cds2.fieldbyname('PORTOT').AsFloat := DMFAC.cdsQry2.fieldbyname('PORTOT').AsFloat;
          Mtx.FMant.cds2.Post;
          DMFAC.cdsQry2.Delete;
          //DMFAC.cdsQry2.Post;
       end;

       Mtx.FMant.cds2.Next;
    end;
    if DMFAC.cdsQry2.RecordCount> 0 then
    begin
        DMFAC.cdsQry2.First;
        while not DMFAC.cdsQry2.Eof do
        begin
           Mtx.FMant.cds2.Insert;
           Mtx.FMant.cds2.FieldByName('DIAS').AsString  := DMFAC.cdsQry2.FieldByName('DIAS').AsString ;
           Mtx.FMant.cds2.fieldbyname('SEC01').AsFloat  := DMFAC.cdsQry2.fieldbyname('SEC01').AsFloat;
           Mtx.FMant.cds2.fieldbyname('PORLIM').AsFloat := DMFAC.cdsQry2.fieldbyname('PORLIM').AsFloat;
           Mtx.FMant.cds2.fieldbyname('SEC02').AsFloat  := DMFAC.cdsQry2.fieldbyname('SEC02').AsFloat;
           Mtx.FMant.cds2.fieldbyname('PORPRO').AsFloat := DMFAC.cdsQry2.fieldbyname('PORPRO').AsFloat;
           Mtx.FMant.cds2.fieldbyname('SEC03').AsFloat  := DMFAC.cdsQry2.fieldbyname('SEC03').AsFloat;
           Mtx.FMant.cds2.fieldbyname('PORCOR').AsFloat := DMFAC.cdsQry2.fieldbyname('PORCOR').AsFloat;
           Mtx.FMant.cds2.fieldbyname('VTASUB').AsFloat  := DMFAC.cdsQry2.fieldbyname('VTASUB').AsFloat;
           Mtx.FMant.cds2.fieldbyname('PORSUB').AsFloat := DMFAC.cdsQry2.fieldbyname('PORSUB').AsFloat;
           Mtx.FMant.cds2.fieldbyname('VTATOT').AsFloat  := DMFAC.cdsQry2.fieldbyname('VTATOT').AsFloat;
           Mtx.FMant.cds2.fieldbyname('PORTOT').AsFloat := DMFAC.cdsQry2.fieldbyname('PORTOT').AsFloat;
           Mtx.FMant.cds2.Post;
           DMFAC.cdsQry2.Next;
        end;
    end;
  end;
  DMFAC.cdsQry3.IndexFieldNames :='DIAS';
  DMFAC.cdsQry4.IndexFieldNames :='DIAS';
  Mtx.FMant.cds2.First;
  while not Mtx.FMant.cds2.Eof do
  begin
     DMFAC.cdsQry3.SetKey;
     DMFAC.cdsQry3.FieldByName('DIAS').AsString :=Mtx.FMant.cds2.FieldByName('DIAS').AsString;
     if DMFAC.cdsQry3.gotokey then
     begin
        Mtx.FMant.cds2.Edit;
        Mtx.FMant.cds2.fieldbyname('SEC01').AsFloat := Mtx.FMant.cds2.fieldbyname('SEC01').AsFloat+DMFAC.cdsQry3.fieldbyname('SEC01').AsFloat;
        Mtx.FMant.cds2.fieldbyname('SEC02').AsFloat := Mtx.FMant.cds2.fieldbyname('SEC02').AsFloat+DMFAC.cdsQry3.fieldbyname('SEC02').AsFloat;
        Mtx.FMant.cds2.fieldbyname('SEC03').AsFloat := Mtx.FMant.cds2.fieldbyname('SEC03').AsFloat+DMFAC.cdsQry3.fieldbyname('SEC03').AsFloat;
        Mtx.FMant.cds2.Post;
        DMFAC.cdsQry3.Delete;
     end;
     DMFAC.cdsQry4.SetKey;
     DMFAC.cdsQry4.FieldByName('DIAS').AsString :=Mtx.FMant.cds2.FieldByName('DIAS').AsString;
     if DMFAC.cdsQry4.gotokey then
     begin
        Mtx.FMant.cds2.Edit;
        Mtx.FMant.cds2.fieldbyname('SEC01').AsFloat := Mtx.FMant.cds2.fieldbyname('SEC01').AsFloat+DMFAC.cdsQry4.fieldbyname('SEC01').AsFloat;
        Mtx.FMant.cds2.fieldbyname('SEC02').AsFloat := Mtx.FMant.cds2.fieldbyname('SEC02').AsFloat+DMFAC.cdsQry4.fieldbyname('SEC02').AsFloat;
        Mtx.FMant.cds2.fieldbyname('SEC03').AsFloat := Mtx.FMant.cds2.fieldbyname('SEC03').AsFloat+DMFAC.cdsQry4.fieldbyname('SEC03').AsFloat;
        Mtx.FMant.cds2.Post;
     end;
     Mtx.FMant.cds2.Next;
  end;

	Screen.Cursor:=crHourGlass;

	xSec01 := DMFAC.OperClientDataSet( Mtx.FMant.cds2, 'SUM(SEC01)', '');  	//StringReplace(Mtx.FMant.dbgFiltro.ColumnByName('SEC01').FooterValue, ',', '',[rfReplaceAll]);
	xSec02 := DMFAC.OperClientDataSet( Mtx.FMant.cds2, 'SUM(SEC02)', '');  	//StringReplace(Mtx.FMant.dbgFiltro.ColumnByName('SEC02').FooterValue, ',', '',[rfReplaceAll]);
																																		//StringReplace(Mtx.FMant.dbgFiltro.ColumnByName('VTASUB').FooterValue,',', '',[rfReplaceAll]);
	xSec03 := DMFAC.OperClientDataSet( Mtx.FMant.cds2, 'SUM(SEC03)', '');  	//StringReplace(Mtx.FMant.dbgFiltro.ColumnByName('SEC03').FooterValue, ',', '',[rfReplaceAll]);

																																		//StringReplace(Mtx.FMant.dbgFiltro.ColumnByName('VTATOT').FooterValue,',', '',[rfReplaceAll]);
	Mtx.FMant.cds2.DisableControls;
	Mtx.FMant.cds2.First;
	while not Mtx.FMant.cds2.Eof do
	begin
		Mtx.FMant.cds2.Edit;
		Mtx.FMant.cds2.FieldByName('VTASUB').AsFloat:=Mtx.FMant.cds2.FieldByName('SEC01').AsFloat  + Mtx.FMant.cds2.FieldByName('SEC02').AsFloat;
		Mtx.FMant.cds2.FieldByName('VTATOT').AsFloat:=Mtx.FMant.cds2.FieldByName('VTASUB').AsFloat + Mtx.FMant.cds2.FieldByName('SEC03').AsFloat;
		Mtx.FMant.cds2.Post;
		Mtx.FMant.cds2.Next;
	end;
	xVtSub:=0; xVtTot:=0;
	Mtx.FMant.cds2.First;
	Mtx.FMant.cds2.EnableControls;
	while not Mtx.FMant.cds2.Eof do
	begin
		if xPaso = 0 then
		begin
			xVtSub := DMFAC.OperClientDataSet( Mtx.FMant.cds2 , 'SUM(VTASUB)', '');
			xVtTot := DMFAC.OperClientDataSet( Mtx.FMant.cds2 , 'SUM(VTATOT)', '');
			xPaso:=1;
		end;
		Mtx.FMant.cds2.Edit;
		if xSec01 > 0 then
			Mtx.FMant.cds2.FieldByName('PORLIM').AsFloat:=(Mtx.FMant.cds2.FieldByName('SEC01').AsFloat / xSec01)*100;
		if xSec02 > 0 then
			Mtx.FMant.cds2.FieldByName('PORPRO').AsFloat:=(Mtx.FMant.cds2.FieldByName('SEC02').AsFloat / xSec02)*100;
		if xVtSub > 0 then
			Mtx.FMant.cds2.FieldByName('PORSUB').AsFloat:=(Mtx.FMant.cds2.FieldByName('VTASUB').AsFloat/ xVtSub)*100;
		if xSec03 > 0 then
			Mtx.FMant.cds2.FieldByName('PORCOR').AsFloat:=(Mtx.FMant.cds2.FieldByName('SEC03').AsFloat / xSec03)*100;
		if xVtTot > 0 then
			Mtx.FMant.cds2.FieldByName('PORTOT').AsFloat:=(Mtx.FMant.cds2.FieldByName('VTATOT').AsFloat/ xVtTot)*100;

		Mtx.FMant.cds2.Post;
		Mtx.FMant.cds2.Next;
	end;
  Mtx.FMant.cds2.IndexFieldNames :='DIAS';
  Mtx.FMant.cds2.DisableControls;
  Mtx.RefreshDisplay;
	Screen.Cursor:=crDefault;
end;

procedure TFToolResVtaNeta.Z1sbKardexClick(Sender: TObject);
var
	Y, M, D : Word;
begin
	DecodeDate(dtpHasta.Date, Y, M, D);
	ppReporte.Template.FileName := ExtractFilePath( application.ExeName ) + DMFAC.wRutaRpt+'\ResVtaNeta.rtm' ;
	ppReporte.Template.LoadFromFile;
	ppLabel22.Caption:=DMFAC.NombreMes(M);
	//ppDesigner1.Report:=ppReporte;
	//ppDesigner1.Show;

  if Mtx.FMant.cds2.RecordCount = 0 then
  begin
    Information('Resumén de Venta Neta Según Vencimiento', 'No Existe Información a Mostrar');
    Exit;
  end;
	ppReporte.Print;
	ppReporte.Stop;
end;

procedure TFToolResVtaNeta.ppReportePreviewFormCreate(Sender: TObject);
begin
	ppReporte.PreviewForm.ClientHeight := 500;
	ppReporte.PreviewForm.ClientWidth  := 650;
	TppViewer(ppReporte.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
end;

procedure TFToolResVtaNeta.Timer1Timer(Sender: TObject);
begin
  { FVariables.w_NombreForma := 'FToolResVtaNeta';}
// Inicio HPC_201311_FAC
// incluye al usuario de tipo administrador en el destroy del timer
{
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolResVtaNeta);
      xAccesoBotones := True;
   end;
}
   if (DMFAC.wAdmin='G') or (DMFAC.wAdmin='P') then
   else
   begin
      if not xAccesoBotones then
      begin
         DMFAC.AccesosUsuariosR( DMFAC.wModulo,DMFAC.wUsuario,'2',FToolResVtaNeta);
         xAccesoBotones := True;
      end;
   end;
// Fin HPC_201311_FAC
   Timer1.Destroy;
end;

procedure TFToolResVtaNeta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMFAC.cdsQry4.Close;
end;

end.
