(* Ing. Juver De la Cruz --  29/01/2008 *)
unit FAC400;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls;


type
  TOnEditObsequio = procedure(Sender: TObject; IArtId:string;IEmicarta:string;
                              IRangoIni:double;IRangoFin:double) of object;
  TFEditarObsequio = class(TForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    chbxEmiCarta: TCheckBox;
    gbRango: TGroupBox;
    sedRangoMin: TSpinEdit;
    sedRangoMax: TSpinEdit;
    edArtId: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    rgEmitioCarta: TRadioGroup;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure rgEmitioCartaClick(Sender: TObject);
  private
    FOnEditObsequio : TOnEditObsequio;
  public
    function isDxsValidos():boolean;
    property OnEditObsequio: TOnEditObsequio read FOnEditObsequio write FOnEditObsequio;
  end;

(* var FEditarObsequio: TFEditarObsequio; *)
implementation

{$R *.dfm}
(***********************************************************)
procedure TFEditarObsequio.btnCancelarClick(Sender: TObject);
begin
  self.Close;
end;
(***********************************************************)
function TFEditarObsequio.isDxsValidos():boolean;
begin
  if (self.sedRangoMax.Value < self.sedRangoMin.Value)then
     begin
        showmessage('El Rango de Fin debe ser mayor o igual al Rango de Inicio');
        result:= false;
     end
  else
     result:= true;
end;
(***********************************************************)
procedure TFEditarObsequio.btnAceptarClick(Sender: TObject);
var vEmiCarta:string;
begin
  if isDxsValidos() then
    begin
       if Assigned(FOnEditObsequio) then
          begin
            (*
            if(chbxEmiCarta.Checked)then
              vEmiCarta:='S'
            else
              vEmiCarta:='N';
            *)
            if rgEmitioCarta.itemIndex= 0 then
               begin
                 vEmiCarta:='S'
               end;
            if rgEmitioCarta.itemIndex= 1 then
               begin
                  vEmiCarta:='N';
               end;
            if rgEmitioCarta.itemIndex= 2 then
               begin
                  vEmiCarta:='A';               
               end;

            FOnEditObsequio(Self, self.edArtId.Text,
                            vEmiCarta,self.sedRangoMin.Value,
                            self.sedRangoMax.Value );
          end;
       self.Close;
    end;
end;
(***********************************************************
procedure TFEditarObsequio.chbxEmiCartaClick(Sender: TObject);
begin
    if not chbxEmiCarta.Checked then
      begin
         self.sedRangoMin.Value := 0;
         self.sedRangoMax.Value := 0;
         self.sedRangoMin.Color:=clScrollBar;
         self.sedRangoMax.Color:=clScrollBar;
      end
    else
      begin
         self.sedRangoMin.Color:=clWindow;
         self.sedRangoMax.Color:=clWindow;
      end;
    self.gbRango.Enabled := chbxEmiCarta.Checked;
end;
***********************************************************)
procedure TFEditarObsequio.rgEmitioCartaClick(Sender: TObject);
begin
   if rgEmitioCarta.itemIndex= 0 then
      begin
         self.sedRangoMin.Color:=clWindow;
         self.sedRangoMax.Color:=clWindow;
      end;
   if rgEmitioCarta.itemIndex= 1 then
      begin
         self.sedRangoMin.Value := 0;
         self.sedRangoMax.Value := 0;
         self.sedRangoMin.Color:=clScrollBar;
         self.sedRangoMax.Color:=clScrollBar;
      end;
   if rgEmitioCarta.itemIndex= 2 then
      begin
         self.sedRangoMin.Value := 0;
         self.sedRangoMax.Value := 0;
         self.sedRangoMin.Color:=clScrollBar;
         self.sedRangoMax.Color:=clScrollBar;
      end;

    self.gbRango.Enabled := (rgEmitioCarta.itemIndex=0);
end;

end.
