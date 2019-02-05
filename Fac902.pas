unit Fac902;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TParticipante = record
      ciaid : string;
      clauxid : string;
      clieid : string;
      rucdni : string;
      nombre : string;
      cptoid : string;
      tmonid : string;
      importe : double;
      forpag : string;
      fecpag : string;
      tipcam : double;
      usureg : string;
      fecreg : string;
      docpag : string;
      numdocpag : string;
  end;

  TFIngParticipantesEncinas = class(TForm)
    Panel1: TPanel;
    btnAgregar: TButton;
    btnCancelar: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edDNI: TEdit;
    edNombre: TEdit;
    GroupBox1: TGroupBox;
    cboFormaPago: TComboBox;
    Label3: TLabel;
    edNumDocPago: TEdit;
    Label4: TLabel;
    edImporte: TEdit;
    procedure btnAgregarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cboFormaPagoClick(Sender: TObject);
    procedure edDNIKeyPress(Sender: TObject; var Key: Char);
  private
    rParticipante : TParticipante;
    function isAgrego():boolean;
    procedure limpiarPantalla();
    procedure getDxsInsert();
    function isDxsValidos():boolean;
  public
    { Public declarations }
  end;
(*  var FIngParticipantesEncinas: TFIngParticipantesEncinas; *)
implementation

{$R *.dfm}
uses FacDM, FAC390;

(******************************************************************************)
function TFIngParticipantesEncinas.isAgrego():boolean;
var xSQL:string;
begin
   try
      getDxsInsert();

      xSQL:=' INSERT INTO CXC_ING_VAR_SER '
           +'              (ciaid, clauxid, clieid, '
           +'               rucdni, nombre, cptoid, '
           +'       			  tmonid, importe, forpag, '
           +'         			fecpag, tipcam, usureg, '
           +'        			  fecreg, docpag, numdocpag ) '
           +'       VALUES('''+rParticipante.ciaid +''','''+rParticipante.clauxid+''','''+rParticipante.clieid+''', '
           +'              '''+rParticipante.rucdni+''','''+rParticipante.nombre+''','''+rParticipante.cptoid+''', '
           +'              '''+rParticipante.tmonid+''','+floattostr(rParticipante.importe)+','''+rParticipante.forpag+''', '
           +'          	   '+rParticipante.fecpag+','+floattostr(rParticipante.tipcam)+','''+rParticipante.usureg+''', '
           +'          	   '+rParticipante.fecreg+','''+rParticipante.docpag+''','''+rParticipante.numdocpag+''' )';


      DMFAC.cdsQry5.Close;
      DMFAC.cdsQry5.DataRequest(xSql);
      DMFAC.cdsQry5.Execute;

      isAgrego:= true;
   except
      isAgrego:= false;
   end;

end;

(******************************************************************************)
function TFIngParticipantesEncinas.isDxsValidos():boolean;
label GSalir, GError;
begin
    self.eddni.Text:=trim(self.eddni.Text);
    if trim(self.eddni.Text) = '' then
        begin
            showmessage('Por favor ingrese el RUC o DNI!');
            self.eddni.SetFocus;
            goto GError;
        end;

    self.edNombre.Text:=uppercase(self.edNombre.Text);
    if trim(self.edNombre.Text) = '' then
        begin
            showmessage('Por favor ingrese el Nombre!');
            self.edNombre.SetFocus;
            goto GError;
        end;


    self.edNumDocPago.Text:=trim(self.edNumDocPago.Text);
    if ((self.edNumDocPago.Enabled) and (self.edNumDocPago.Text = '')) then
        begin
            showmessage('Por favor ingrese el Numero de Documento de Pago!');
            self.edNumDocPago.SetFocus;
            goto GError;
        end;


    if (strtofloat(self.edImporte.text)< 0.00) then
        begin
            showmessage('Por favor ingrese un Monto mayor o igual que cero!');
            self.edImporte.SetFocus;
            goto GError;
        end;


  isDxsValidos:= true;
  goto GSalir;
GError:
  isDxsValidos:= false;
GSalir:
end;

(******************************************************************************)
procedure TFIngParticipantesEncinas.getDxsInsert();
var existeAsociado:boolean;
     function isExisteAsociado(IDNI:string):boolean;
     var xSQL : String;
     begin
        xSQL:='Select count(*) cant '
              +'From apo201 '
              +'Where asodni =  '''+self.edDNI.Text+''' ';

       DMFAC.cdsQry17.Close;
       DMFAC.cdsQry17.DataRequest(xSql);
       DMFAC.cdsQry17.Open;
       isExisteAsociado:=(DMFAC.cdsQry17.fieldbyname('cant').value>0);
     end;


     function get_clauxid(IDNI:string):string;
     begin
       if existeAsociado then
          get_clauxid :='AS'
       else
          get_clauxid :='C';
     end;


     function get_clieid(IDNI:string):string;
     var xSQL : String;
     begin
        xSQL:='Select asoid '
              +'From apo201 '
              +'Where asodni =  '''+self.edDNI.Text+'''   '
              +'  and rownum = 1 ';

       DMFAC.cdsQry16.Close;
       DMFAC.cdsQry16.DataRequest(xSql);
       DMFAC.cdsQry16.Open;

       if (DMFAC.cdsQry16.recordcount>0) and (DMFAC.cdsQry16.fieldbyname('asoid').value <> '') then
           get_clieid:=DMFAC.cdsQry16.fieldbyname('asoid').value
       else
           get_clieid:= 'C999';
      end;


     function get_cptoid(IDNI:string):string;
     begin
//        if FActualizaDatos.rgEvento.ItemIndex=0 then get_cptoid:='IN0151';
//        if FActualizaDatos.rgEvento.ItemIndex=1 then get_cptoid:='IN0152';
      { if existeAsociado then
          get_cptoid :='IN0136'
       else
          get_cptoid :='IN0137';}
          get_cptoid :='IN0136'
     end;


     function get_docpag(IDNI:string):string;
     begin
        case self.cboFormaPago.ItemIndex of
          0 : //  BECAS
              begin
                 get_docpag :='69';
              end;
          1 : //  CAJA
              begin
                 get_docpag :='37';
              end;
          2 : //  CHEQUE
              begin
                 get_docpag :='68';
              end;
          3 : //  BANCO_OCTA
              begin
                 get_docpag :='70';
              end;

        end;
     end;

     
     function get_numdocpag():string;
     begin
        case self.cboFormaPago.ItemIndex of
          0 : //  BECAS
              begin
                 get_numdocpag :='009';
              end;
          1 : //  CAJA
              begin
                 get_numdocpag :='001';
              end;
          2,3 : //  CHEQUE
              begin
                 get_numdocpag :=trim(self.edNumDocPago.Text);
              end;
        end;
     end;

begin
    existeAsociado:= isExisteAsociado(self.edDNI.Text);

      rParticipante.ciaid := '02';
      rParticipante.clauxid := get_clauxid(self.edDNI.Text);
      rParticipante.clieid := get_clieid(self.edDNI.Text);
      rParticipante.rucdni := self.edDNI.Text;
      rParticipante.nombre := self.edNombre.Text;
      rParticipante.cptoid := get_cptoid(self.edDNI.Text);
      rParticipante.tmonid := 'N';
      rParticipante.importe := strtofloat(self.edImporte.text);
      rParticipante.forpag := self.cboFormaPago.Text;
      rParticipante.fecpag := 'to_char(sysdate,''DD/MM/YYYY'')';
      rParticipante.tipcam := 2.905;
      rParticipante.usureg := DMFAC.wUsuario;
      rParticipante.fecreg := 'sysdate';
      rParticipante.docpag := get_docpag(self.edDNI.Text);
      rParticipante.numdocpag := get_numdocpag();
end;

(******************************************************************************)
procedure TFIngParticipantesEncinas.limpiarPantalla();
begin
    self.edDNI.Text:='';
    self.edNombre.Text:='';
    self.edNumDocPago.Text:='';
    self.cboFormaPago.ItemIndex:=0;
    self.cboFormaPagoClick(self.cboFormaPago);
end;
(******************************************************************************)
procedure TFIngParticipantesEncinas.btnAgregarClick(Sender: TObject);
begin
   if isDxsValidos() then
      begin
         if isAgrego() then
            begin
              limpiarPantalla();
              showmessage('Se Agrego al Participante');
            end
         else
            showmessage('Ocurrio algun error!!');
       end;
end;

(******************************************************************************)
procedure TFIngParticipantesEncinas.btnCancelarClick(Sender: TObject);
begin
  self.ModalResult:= mrCancel;
end;

(******************************************************************************)
procedure TFIngParticipantesEncinas.edDNIKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ( Key = #13 ) then
      begin
        Key := #0; // Para anular el pitido...
        Perform(WM_NEXTDLGCTL, 0, 0); // Pasar al siguiente control en el dialogo...
      end;
end;

(******************************************************************************)
procedure TFIngParticipantesEncinas.cboFormaPagoClick(Sender: TObject);
begin
   if (self.cboFormaPago.Text = 'CHEQUE') or (self.cboFormaPago.Text = 'BANCO_OCTA')then
      edNumDocPago.Color:= clWindow
   else
      edNumDocPago.Color:= clScrollBar;

   edNumDocPago.enabled  := (edNumDocPago.Color = clWindow);
   if edNumDocPago.enabled then
      edNumDocPago.SetFocus()
   else
      edNumDocPago.Text:= '';

   case self.cboFormaPago.ItemIndex of
      0 : //  BECAS
          begin
              self.edImporte.Text:= '0.00';
          end;
      1 : //  CAJA
          begin
              self.edImporte.Text:= '100.00';
          end;
      2 : //  CHEQUE
          begin
              self.edImporte.Text:= '100.00';
          end;
      3 : //  BANCO_OCTA
          begin
              self.edImporte.Text:= '100.00';
          end;

   end;
end;

end.
