unit FAC812;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, DbChart, Series, DB,
  DBClient, wwclient, DBXpress, FMTBcd, Grids, DBGrids, Provider, SqlExpr;

type
  TFGrafico_V1 = class(TForm)
    DBChart1: TDBChart;
    Series1: TBarSeries;
    SQLC1: TSQLConnection;
    qryGraf: TSQLDataSet;
    dspGraf: TDataSetProvider;
    cdsRep: TClientDataSet;
    DBGrid1: TDBGrid;
    dsRep: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrafico_V1: TFGrafico_V1;

implementation

{$R *.dfm}

uses FacDM;

procedure TFGrafico_V1.FormShow(Sender: TObject);
begin
//   DBChartV1.Series[0].DataSource:=DMFAC.dsReporte;
end;

end.
