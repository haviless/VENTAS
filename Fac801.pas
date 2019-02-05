unit Fac801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, Buttons, wwdblook,
  Wwdbdlg, ExtCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    pnlRegistro: TPanel;
    Bevel1: TBevel;
    bvCantAceptada: TBevel;
    lblCnpEgr: TLabel;
    lblCuenta: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    Label20: TLabel;
    lblUMPG: TLabel;
    lblUMPU: TLabel;
    Label21: TLabel;
    Label27: TLabel;
    lblUMAG: TLabel;
    Label29: TLabel;
    lblUMAU: TLabel;
    Label28: TLabel;
    dblcdArticulo: TwwDBLookupComboDlg;
    bbtnRegOk: TBitBtn;
    bbtnRegCanc: TBitBtn;
    stTitulo: TStaticText;
    dbePrecioG: TwwDBEdit;
    dbeCtdadG: TwwDBEdit;
    dbeImporte: TwwDBEdit;
    dbeArticulo: TwwDBEdit;
    dbeUmg: TwwDBEdit;
    dbeDGarantia: TwwDBEdit;
    cbTipoum: TComboBox;
    dbgStock: TwwDBGrid;
    edtDsto3: TEdit;
    edtProv: TEdit;
    dbeCtdadU: TwwDBEdit;
    dblcProv: TwwDBLookupComboDlg;
    dbeCantGA: TwwDBEdit;
    dbeCantUA: TwwDBEdit;
    edtDsto2: TwwDBEdit;
    bbtnBuscaArt: TBitBtn;
    pnlBusqueda: TPanel;
    lblBusca: TLabel;
    dbgBusca: TwwDBGrid;
    bbtnOkBusca: TBitBtn;
    bbtnCancBusca: TBitBtn;
    dbeBusca: TwwDBEdit;
    dblcTmon: TwwDBLookupCombo;
    Label1: TLabel;
    wwDBEdit1: TwwDBEdit;
    procedure bbtnBuscaArtClick(Sender: TObject);
    procedure bbtnRegCancClick(Sender: TObject);
    procedure cbTipoumExit(Sender: TObject);
    procedure dbeCantGAExit(Sender: TObject);
    procedure dbeCantUAExit(Sender: TObject);
    procedure dbeCtdadGExit(Sender: TObject);
    procedure dbeCtdadUEnter(Sender: TObject);
    procedure dbeCtdadUExit(Sender: TObject);
    procedure dbePrecioGExit(Sender: TObject);
    procedure dblcdArticuloDropDown(Sender: TObject);
    procedure dblcdArticuloExit(Sender: TObject);
    procedure dblcProvExit(Sender: TObject);
    procedure edtDsto2Exit(Sender: TObject);
    procedure bbtnCancBuscaClick(Sender: TObject);
    procedure bbtnOkBuscaClick(Sender: TObject);
    procedure dbeBuscaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xxxUMG,xxxUMU : string;
    xxxPVG,xxxPVU : double;
    xCIgv,xCISC : string;
    wStockG     : double; //Campo para grabar stock;
    procedure AperturaConsultaSaldos(xxFlagE : string);
    procedure Muestrastock(xxArticulo,xxEstado : string);

  end;

var
  Form2: TForm2;

implementation

uses FacDM;

{$R *.DFM}

procedure TForm2.bbtnBuscaArtClick(Sender: TObject);
begin
   pnlBusqueda.BringToFront;
   pnlBusqueda.Visible := True;
   dbeBusca.Clear;
   dbeBusca.SetFocus;
end;

procedure TForm2.bbtnRegCancClick(Sender: TObject);
begin
   DM1.cdsDetFac.cancelUpdates;
   pnlRegistro.Width := 373;
   pnlRegistro.Visible:= False;

   DM1.cdsQry4.close;
end;

procedure TForm2.cbTipoumExit(Sender: TObject);
begin
   if bbtnRegCanc.Focused then exit;

   if cbTipoUM.Enabled then
   begin
       if (cbtipoUm.Text = '') then begin
          Showmessage('Error: Seleccione Tipo de U. Medida');
          cbtipoUm.setfocus;
          Exit ;
       end
       else if (cbTipoUm.text <> 'General') then
          if (cbTipoUm.text <> 'Unitario') then begin
             Showmessage('Error: Tipo de U.Medida errado');
             cbtipoUm.setfocus;
             Exit;
          end;

     Case cbtipoUm.ItemIndex of
     0: begin//U.M General
             lblUMPG.caption := xxxUMG;
             dbeUmG.text     := xxxUMG;
             dbePrecioG.text := floattostr(xxxPVG);
             xCIgv           := 'S';
             xcIsc           := 'N';
        end;//0

      1: begin//U.M Unitaria
             lblUMPU.Caption := xxxUMU;
             dbeUmG.text     := xxxUMU;
             dbePrecioG.text := floattostr(xxxPVU);
             xCIgv           := 'S';
             xcIsc           := 'N';
         end;//Um unitaria
      end; //Case
      AperturaConsultaSaldos('S');  //Flag para mostrar consulta del stock segun la unidad escogida en el combo
   end;
end;

procedure TForm2.dbeCantGAExit(Sender: TObject);
var
   xValor: double;
   xCtPedida,xCtAceptada : double;
begin
   if not bbtnRegCanc.Focused then
   begin
     if length(dbeCantGA.Text)=0 then
     begin
       ShowMessage('Ingrese Cantidad');
       dbeCantGA.SetFocus;
       Exit;
     end;

     if ((strtofloat(dbeCantGA.text)<=0) and (dbeCantUA.Enabled=false)) then
     begin
       Showmessage('Ingrese una Cantidad mayor a cero');
       dbeCantGA.text := '';
       dbeCantGA.setfocus;
       Exit;
     end;

     xCtPedida := strtofloat(dbeCtdadG.text);
     if length(dbeCtdadU.Text)>0 then begin//Cantidad Pedida
        xValor    := strtofloat(DM1.BuscaQry('dspUltTGE','TGE156','EUNMEQ','EUNMID1='+quotedstr(dbeUmg.Text),'EUNMEQ'));
        xCtPedida := xCtPedida+FRound(strtofloat(dbeCtdadU.Text)/xValor,15,2);//Cantidad Pedida
     end;

     if (strtofloat(dbeCantGA.text)>xCtPedida) then
     begin
       Showmessage('La Cantidad Aceptada no puede ser mayor a la Cantidad Pedida');
       dbeCantGA.Text:='';
       dbeCantGA.SetFocus;
       exit;
     end;

     if dbeCtdadU.Enabled= true then
        dbeCantUA.SetFocus
     else
        edtDsto2.SetFocus;

   end;//  cancel

end;

procedure TForm2.dbeCantUAExit(Sender: TObject);
var
  xCont : double;
  xCtPedida,xCtAceptada,xvalor :double;
begin
  if not bbtnRegCanc.Focused then
  begin
    xCont:= strtofloat(DM1.BuscaQry('dspUltTGE','TGE156','EUNMEQ','EUNMID1='+quotedstr(dbeUmg.Text),'EUNMEQ'));

    if strtofloat(dbeCantUA.Text)<0 then
    begin
      showmessage('Ingrese Cantidad Fraccionaria mayor/igual a cero');
      exit;
    end
    else
    begin
      if strtofloat(dbeCantUA.Text)>=xCont then
      begin
        showmessage('Ingrese una Cantidad Fraccionaria menor');
        dbeCantUA.Text:='';
        dbeCantUA.SetFocus;
        exit;
      end
      else
            edtDsto2.SetFocus;
    end;

    if length(dbeCtdadU.Text)>0 then begin//Cantidad Pedida
       xCtPedida := strtofloat(dbeCtdadG.text);
       xValor    := strtofloat(DM1.BuscaQry('dspUltTGE','TGE156','EUNMEQ','EUNMID1='+quotedstr(dbeUmg.Text),'EUNMEQ'));
       xCtPedida := xCtPedida+FRound(strtofloat(dbeCtdadU.Text)/xValor,15,2);//Cantidad Pedida
    end;

    if length(dbeCantUA.Text)>0 then begin//Cantidad Aceptada
       xCtAceptada := strtofloat(dbeCantGA.text);
       xValor      := strtofloat(DM1.BuscaQry('dspUltTGE','TGE156','EUNMEQ','EUNMID1='+quotedstr(dbeUmg.Text),'EUNMEQ'));
       xCtAceptada := xCtAceptada+FRound(strtofloat(dbeCantUA.Text)/xValor,15,2);
    end;

    if (xCtAceptada>xCtPedida) then
    begin
      Showmessage('La Cantidad Aceptada no puede ser mayor a la Cantidad Pedida');
      dbeCantUA.Text:='';
      dbeCantUA.SetFocus;
      exit;
    end;

  end;

end;

procedure TForm2.dbeCtdadGExit(Sender: TObject);
var
  xValor : double;
begin
     if not bbtnRegCanc.Focused then
     begin
       DM1.BuscaQry('dspUltTGE','TGE156','EUNMEQ','EUNMID1='+quotedstr(dbeUmG.text),'EUNMEQ');
       if length(DM1.cdsQry.fieldbyname('EUNMEQ').AsString)=0 then
            raise exception.Create('Esta unidad no tiene Equivalencia!!!')
       else
          xValor := strtofloat(DM1.cdsQry.fieldbyname('EUNMEQ').AsString );

       dbeCtdadU.Enabled := (xValor>1);

       if length(dbeCtdadG.Text)=0 then
       begin
          ShowMessage('Ingrese Cantidad');
          dbeCtdadG.SetFocus;
          Exit;
       end;

       if ((strtofloat(dbeCtdadG.text)<=0) and (dbeCtdadU.Enabled=false)) then
       begin
         Showmessage('Ingrese una Cantidad mayor a cero');
         dbeCtdadG.text := '';
         dbeCtdadG.setfocus;
         Exit;
       end;

       if (xValor=1) then
       begin
         if wStockG>= strtofloat(dbeCtdadG.Text) then
         begin
           bvCantAceptada.Enabled := false;
           dbeCantGa.Text    := dbeCtdadG.Text;
           lblUMAG.Caption   := lblUMPG.Caption;
           dbeCantGa.Enabled := false;
           dbeCantUa.Enabled := false;
           edtDsto2.Setfocus
         end
         else
         begin
           bvCantAceptada.Enabled := true;
           dbeCantGa.Text := dbeCtdadG.Text;
           lblUMAG.Caption   := lblUMPG.Caption;
           dbeCantGa.Enabled := true;
           if pnlRegistro.Visible= true then
           dbeCantGA.SetFocus;
         end;
       end
       else
          if dbeCtdadU.Enabled=true then
          begin
             dbeCtdadU.Text:= '0';
             dbeCtdadU.SetFocus;
          end;
     end;//  cancel

end;

procedure TForm2.dbeCtdadUEnter(Sender: TObject);
begin
   if length(dbeCtdadU.text)=0 then
      dbeCtdadU.Text := '0';
   dbeCtdadU.SetFocus;
end;

procedure TForm2.dbeCtdadUExit(Sender: TObject);
var
 xCont,xCantTot,xCtPedida,xValor : double;
begin
  if not bbtnRegCanc.Focused then
  begin
    if length(dbeCtdadU.Text)=0 then
    begin
      ShowMessage('Ingrese Cantidad Fraccionaria');
      dbeCtdadU.SetFocus;
      Exit;
    end;

    xCont:= strtofloat(DM1.BuscaQry('dspUltTGE','TGE156','EUNMEQ','EUNMID1='+quotedstr(dbeUmg.Text),'EUNMEQ'));
    if strtofloat(dbeCtdadU.Text)<0 then
    begin
      showmessage('Ingrese Cantidad Fraccionaria mayor/igual a cero');
      exit;
    end
    else
    begin
      if length(dbeCtdadG.text)>0 then
      begin
         if strtofloat(dbeCtdadG.text)=0 then
         begin
            xCtPedida := strtofloat(dbeCtdadG.text);
            if length(dbeCtdadU.Text)>0 then //Cantidad Pedida
            begin
               xValor   := strtofloat(DM1.BuscaQry('dspUltTGE','TGE156','EUNMEQ','EUNMID1='+quotedstr(dbeUmg.Text),'EUNMEQ'));
               xCtPedida := xCtPedida+FRound(strtofloat(dbeCtdadU.Text)/xValor,15,2);//Cantidad Pedida
               if xCtPedida=0 then
               begin
                  Showmessage('Ingrese Cantidad mayor a cero');
                  dbeCtdadU.Text:= '0';
                  dbeCtdadU.SetFocus;
                  exit;
               end;
            end;
         end;
      end;
    end;

    if strtofloat(dbeCtdadU.Text)>=xCont then
    begin
       showmessage('Ingrese una Cantidad Fraccionaria menor');
       dbeCtdadU.Text:='';
       dbeCtdadU.SetFocus;
       exit;
    end
    else
    begin
      xCantTot := strtofloat(dbeCtdadG.text)+FRound(strtofloat(dbeCtdadU.Text)/xCont,15,2);
      if wStockG>= xCantTot then
      begin
          bvCantAceptada.Enabled := false;
          dbeCantGa.Text  := dbeCtdadG.Text;
          lblUMAG.Caption := lblUMPG.Caption;
          dbeCantUa.Text  := dbeCtdadU.Text;
          dbeCantGa.Enabled := false;
          dbeCantUa.Enabled := false;
      end
      else
      begin
          bvCantAceptada.Enabled := true;
          dbeCantGa.Text  := dbeCtdadG.Text;
          lblUMAG.Caption := lblUMPG.Caption;
          dbeCantUa.Text  := dbeCtdadU.Text;
          dbeCantGa.Enabled := true;
          dbeCantUa.Enabled := true;
          dbeCantGa.SetFocus;
      end;
    end;

  end;

end;

procedure TForm2.dbePrecioGExit(Sender: TObject);
var
   bInicio,bFinal  : boolean;
   xRLinea         : string; //Para el resto de la linea
   xFiltro, xFIgv  : string;
   xImp, xAntDesc  : double;
   i               : integer;
begin
   if not bbtnRegCanc.Focused then   begin
      if length(dbePrecioG.Text)=0 then
      begin
         ShowMessage('Ingrese Precio');
         dbePrecioG.SetFocus;
         Exit;
      end;
      if strtofloat(dbePrecioG.text)<=0 then begin
         Showmessage('Ingrese un Precio mayor a cero');
         dbePrecioG.text :='';
         dbePrecioG.setfocus;
      end;

      //Calculo de IGV
      xFiltro := 'TIPDET='+quotedstr('I1');
      Filtracds( DM1.cdsTReg,  'Select * from TGE128 Where '+xFiltro );
      xImp := 1+(FRound( (DM1.cdsTReg.FieldByName('TASA').AsFloat/100) ,7,2));

{      xWhere := 'ARTID='+quotedstr(dblcdArticulo.Text);
      DM1.BuscaQry('dspUltTGE','TGE205','ARTID,ARTDES,GRARID',xWhere,'ARTDES');
      xWhere := 'TListaId = '+quotedstr(dblcLPrecio.Text);
      xWhere := xWhere +' and GRARID = '+quotedstr(DM1.cdsQry.fieldbyname('GRARID').AsString);
      xWhere := xWhere +' and LPREVERFID = '+''''+'0'+'''';  //solo politicas vigentes
      xArt   := dblcdArticulo.text;
      bEncuentra := false;
      if wPolitica2 then begin     //Si esta activo el 2do descuento
         Filtracds(DM1.cdsPPrecio, 'Select * from FAC203 Where '+xWhere);
         if DM1.cdsPPrecio.recordcount>0 then begin
            DM1.cdsPPrecio.DisableControls;
            DM1.cdsPPrecio.First;
            i:=1;
               //Ubica descuentos a nivel de linea, familia, o articulo
               while not DM1.cdsPPrecio.Eof do begin
                     xPArti  := DM1.cdsPPrecio.fieldbyname('ARTID').AsString;
                     xRLinea := DM1.cdsPPrecio.fieldbyname('LPRERESTO').AsString;  //Para el resto de linea
                     xFIgv   := DM1.cdsPPrecio.fieldbyname('LPREFIGV').AsString;  //Para el Igv
                     if ((xPArti = xArt) and not bEncuentra)then begin  // A nivel de Articulo
                        if (DM1.cdsPPrecio.fieldbyname('LPREDVOLV').AsFloat>0) then begin //Para montos
                           if (xFIgv='S') then begin
                               if ((strtofloat(dbeCtdadG.Text)*strtofloat(dbePrecioG.Text))*xImp>DM1.cdsPPrecio.fieldbyname('LPREDVOLV').AsFloat) then begin//Para montos
                                   bInicio    := true ;
                                   bFinal     := false;
                                   xAntDesc   := DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat;
                               end
                               else begin
                                     bInicio    := false;
                                     bFinal     := true;
                                    end;

                               if (bInicio = false and bfinal= true) then begin
                                  edtdsto2.Text := floattostr(xAntDesc);
                                  bEncuentra := true;
                               end
                               else if (i= DM1.cdsPPrecio.recordcount) then
                                        if (bInicio = true and bfinal= false and not bEncuentra) then begin
                                            edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat);
                                            bEncuentra := true;
                                        end;

                           end//xflagIgv
                           else begin
                                   if ((strtofloat(dbeCtdadG.Text)*strtofloat(dbePrecioG.Text))*xImp>DM1.cdsPPrecio.fieldbyname('LPREDVOLV').AsFloat) then begin//Para montos
                                       bInicio  := true  ;
                                       bFinal   := false;
                                       xAntDesc := DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat;
                                   end
                                   else begin
                                         bInicio := false;
                                         bFinal  := true;
                                        end;
                                   if (bInicio= false and bfinal= true) then begin
                                      bEncuentra := true;
                                      edtdsto2.Text := floattostr(xAntDesc);
                                   end
                                   else if (i= DM1.cdsPPrecio.recordcount) then
                                            if (bInicio = true and bfinal= false and not bEncuentra) then begin
                                                edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat);
                                                bEncuentra := true;
                                            end;

                                end; //else xflagIgv
                        end;// de montos
                        if (DM1.cdsPPrecio.fieldbyname('LPREDVOLF').AsFloat>0) then begin // de cantidades
                           if (DM1.cdsPPrecio.fieldbyname('LPREDVOLF').AsFloat <=strtofloat(dbeCtdadG.Text)) then begin  //Para cantidades
                               edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat);
                               bEncuentra := true;
                           end;  //de cantidades
                        end;
                     end//xPArti   a nivel de Articulo
                     else begin
                            if ((xRLinea = 'S')and not bEncuentra) then begin
                               edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat);
                               bEncuentra := true;
                            end;

                            if ((DM1.cdsPPrecio.fieldbyname('LPREDVOLV').AsFloat>0)and not bEncuentra) then begin //Para montos
                               if (xFIgv='S') then begin
                                   if ((strtofloat(dbeCtdadG.Text)*strtofloat(dbePrecioG.Text))*xImp>DM1.cdsPPrecio.fieldbyname('LPREDVOLV').AsFloat) then begin//Para montos
                                       bInicio  := true  ;
                                       bFinal   := false;
                                       xAntDesc := DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat;
                                   end
                                   else begin
                                         bInicio := false;
                                         bFinal  := true;
                                        end;

                                   if (bInicio= false and bfinal= true) then begin
                                      edtdsto2.Text := floattostr(xAntDesc);
                                      bEncuentra := true;
                                   end
                                   else if (i= DM1.cdsPPrecio.recordcount) then
                                            if (bInicio = true and bfinal= false and not bEncuentra) then begin
                                                edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat);
                                                bEncuentra := true;
                                            end;

                               end//xflagIgv
                               else begin
                                       if ((strtofloat(dbeCtdadG.Text)*strtofloat(dbePrecioG.Text))*xImp>DM1.cdsPPrecio.fieldbyname('LPREDVOLV').AsFloat) then begin//Para montos
                                           bInicio    := true  ;
                                           bFinal     := false;
                                           xAntDesc   := DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat;
                                       end
                                       else begin
                                             binicio    := false;
                                             bFinal     := true;
                                            end;
                                       if (bInicio = false and bfinal= true) then begin
                                          bEncuentra := true;
                                          edtdsto2.Text := floattostr(xAntDesc);
                                       end
                                       else if (i= DM1.cdsPPrecio.recordcount) then
                                                if (bInicio = true and bfinal= false and not bEncuentra) then begin
                                                    edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat);
                                                    bEncuentra := true;
                                                end;

                                    end; //else xflagIgv
                            end;// de montos
                            if ((DM1.cdsPPrecio.fieldbyname('LPREDVOLF').AsFloat>0)and not bEncuentra) then begin // de cantidades
                               if (DM1.cdsPPrecio.fieldbyname('LPREDVOLF').AsFloat <=strtofloat(dbeCtdadG.Text)) then begin  //Para cantidades
                                   edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat);
                                   bEncuentra := true;
                               end;  //de cantidades
                            end;

                            if (xPArti = '') and not bEncuentra then
                                edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat)
                            else if (xPArti<>xArt) and not bEncuentra then
                                     edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPREDVOLVP').AsFloat);
                          end;//else
                     DM1.cdsPPrecio.Next;
                     i:= i+1;
               end;//while
            DM1.cdsPPrecio.EnableControls;
         end//recordcount
         else begin
                edtdsto2.Text := '0';

              end;
      end  //wPolitica2
      else edtdsto2.Text := '0';}
   end;  //Si ni hizo click en el boton cancelar
end;


procedure TForm2.dblcdArticuloDropDown(Sender: TObject);
begin
//   DM1.cdsArticulo.indexfieldnames:='ARTDES';
   DM1.cdsTLPrecio.indexfieldnames:='ARTDES';
end;

procedure TForm2.dblcdArticuloExit(Sender: TObject);
var
   xWhere,xSQL : string;
Begin
   cbTipoUm.ItemIndex := 0;
   dbePrecioG.Enabled:= false;

   if bbtnBuscaArt.Focused then exit;

   if not bbtnRegCanc.Focused then   begin
      if dm1.wAnchoArt > 0 then
      begin
        if Length(dblcdArticulo.Text) < dm1.wAnchoArt then
        begin
          dblcdArticulo.Text:=DM1.StrZero(dblcdArticulo.Text,dm1.wAnchoArt);
        end;
      end;


      DM1.cdsTLPrecio.IndexFieldNames := 'ARTID';
      DM1.cdsTLPrecio.Setkey;
      DM1.cdsTLPrecio.FieldByName('ARTID').AsString:= dblcdArticulo.Text;
      if DM1.cdsTLPrecio.GotoKey then
      begin
        dbeArticulo.Text:= DM1.cdsTLPrecio.FieldByName('ARTDES').AsString;
        xxxUMU := DM1.cdsTLPrecio.fieldbyname('UNMIDU').AsString;
        xxxUMG := DM1.cdsTLPrecio.fieldbyname('UNMIDG').AsString;
        if DM1.cdsTLPrecio.fieldbyname('LPRETMONID').asString=dblcTMon.text then
        begin
          xxxPVG := DM1.cdsTLPrecio.fieldbyname('LPREPREGMO' ).AsFloat;
          xxxPVU := DM1.cdsTLPrecio.fieldbyname('LPREPREUMO' ).AsFloat;
        end
        else
          if DM1.cdsTLPrecio.fieldbyname('LPRETMONID').asString = DM1.wTMonLoc then
          begin
             xxxPVG := FRound(DM1.cdsTLPrecio.fieldbyname('LPREPREGMO' ).asFloat/strtofloat(dbeTCambio.Text),15,2);
             xxxPVU := FRound(DM1.cdsTLPrecio.fieldbyname('LPREPREUMO' ).asFloat/strtofloat(dbeTCambio.Text),15,2);
          end
          else
          begin
            xxxPVG := FRound(DM1.cdsTLPrecio.fieldbyname('LPREPREGMO' ).asFloat*strtofloat(dbeTCambio.Text),15,2);
            xxxPVU := FRound(DM1.cdsTLPrecio.fieldbyname('LPREPREUMO' ).asFloat*strtofloat(dbeTCambio.Text),15,2);
          end;
        wContenido   := (DM1.cdsTLPrecio.fieldbyname('ARTCONT' ).AsInteger > 1);
        cbTipoUm.enabled   := wContenido;
        lblUMPG.caption      := xxxUMG;
        dbeUmG.text          := xxxUMG;
        dbePrecioG.text      := floattostr(xxxPVG);
        AperturaConsultaSaldos('N');//Flag para mostrar consulta del stock segun la unidad sin escoger en el combo

        if dblcLPrecio.text='ESP' then begin
           dbePrecioG.Enabled:= true;
        end;
        xCIgv  := 'S';
        xcIsc  := 'N';
        if DM1.cdsTLPrecio.fieldbyname('LPREPDCTOG' ).AsFloat = 0 then
           edtDsto2.Text :='0'
        else
           edtDsto2.Text := floattostr(DM1.cdsTLPrecio.fieldbyname('LPREPDCTOG' ).AsFloat);
      end
      else
      begin
        Showmessage('Codigo errado');
        dblcdArticulo.text := '';
        dblcdArticulo.SetFocus;
        exit;
      end;


{      xWhere := 'TLISTAID = '+quotedstr(dblcLPrecio.Text);
      xWhere := xWhere +' AND GRARID ='+quotedstr(DM1.cdsArticulo.fieldbyname('GrarId').AsString);
      xWhere := xWhere +' AND LPREVERFID = '+''''+'0'+'''';  //solo politicas vigentes
      xWhere := xWhere +'  ';
      xArt   := dblcdArticulo.text;
      bEncuentra := false;
//      if wPolitica2 then begin    //Si esta activo el 2do descuento
      Filtracds(DM1.cdsPPrecio, 'Select * from FAC203 Where '+xWhere);
      if DM1.cdsPPrecio.recordcount = 0 then begin}
      xSQL:= xSQL+ ' ARTID = '+quotedstr(dblcdArticulo.text);
      xSQL:= xSQL+' AND DPROFFREG=(SELECT MAX(DPROFFREG) FROM LOG313 WHERE ARTID='+''''+dblcdArticulo.text+''''+')';
      Filtracds(DM1.cdsDRcomp, 'Select * from LOG313 Where '+xSQL);
      if DM1.cdsDRcomp.RecordCount>0 then
      begin
          xWhere := '';
          DM1.cdsDRcomp.First;
          while not DM1.cdsDRcomp.EOF do
          begin
             if length(xWhere)=0 then
                xWhere := 'PROV='+quotedstr(DM1.cdsDRcomp.fieldbyname('DPROFPROV').AsString)
             else
             begin
                xWhere := xWhere+' or PROV='+quotedstr(DM1.cdsDRcomp.fieldbyname('DPROFPROV').AsString);
             end;
             DM1.cdsDRcomp.Next;
          end;
          DM1.cdsProv.Filtered := False;
          DM1.cdsProv.Filter   := xWhere;
          DM1.cdsProv.Filtered := True;
      end
      else
         dblcProv.SetFocus;
//      end;

      cbTipoum.OnExit(cbTipoum);

      if DM1.cdsProv.RecordCount=1 then
      begin
         dblcProv.Text:=DM1.cdsProv.fieldbyname('PROV').AsString;
         dblcProvExit(Sender);
         dbeCtdadG.SetFocus;
      end
      else
      begin
         DM1.cdsProv.First;
         dblcProv.SetFocus;
      end;

{      xFiltro := 'TASAID='+''''+'01'            +'''';
      Filtracds( DM1.cdsTReg,  'Select * from TGE108 Where '+xFiltro );
      xImp := FRound( (DM1.cdsTReg.FieldByName('TasaCan').AsFloat/100) ,7,2);


      xWhere := 'TListaId = '+''''+dblcLPrecio.Text+'''';
      xWhere := xWhere +' and GrarId = '+''''+DM1.cdsArticulo.fieldbyname('GrarId').AsString+'''';
      xWhere := xWhere +' and LpreVerfId = '+''''+'0'+'''';  //solo politicas vigentes
      xArt   := dblcdArticulo.text;
      bEncuentra := false;
      if wPolitica2 then begin     //Si esta activo el 2do descuento
         Filtracds(DM1.cdsPPrecio, 'Select * from FAC203 Where '+xWhere);
         if DM1.cdsPPrecio.recordcount>0 then begin
            DM1.cdsPPrecio.DisableControls;
            DM1.cdsPPrecio.First;
               //Ubica descuentos a nivel de linea, familia, o articulo
               while not DM1.cdsPPrecio.Eof do begin
                     xPArti  := DM1.cdsPPrecio.fieldbyname('ArtId').AsString;
                     xRLinea := DM1.cdsPPrecio.fieldbyname('LPreResto').AsString;  //Para el resto de linea
                     xFIgv   := DM1.cdsPPrecio.fieldbyname('LPreFIgv').AsString;  //Para el Igv
                     if (xPArti = xArt) then begin
                        edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPreDVolVP').AsFloat);
                        bEncuentra := true;
                     end
                     else begin
                            if xRLinea = 'S' then begin

                               edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPreDVolVP').AsFloat);
                            end;

                            if (xPArti = '') and not bEncuentra then
                                edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPreDVolVP').AsFloat)
                            else if (xPArti<>xArt) and not bEncuentra then
                                     edtdsto2.Text := floattostr(DM1.cdsPPrecio.fieldbyname('LPreDVolVP').AsFloat);
                          end;
                     DM1.cdsPPrecio.Next;
               end;
            DM1.cdsPPrecio.EnableControls;
         end
         else edtdsto2.Text := '0';
      end
      else edtdsto2.Text := '0';}

   end; // si no se apretó botón de cancelar
end;

procedure TForm2.dblcProvExit(Sender: TObject);
var
  xWhere : string;
begin
   if not bbtnRegCanc.Focused then   begin
     xWhere := 'PROV='+''''+dblcProv.Text+'''';
     edtProv.text := DM1.BuscaQry('dspUltTGE','TGE201','PROVDES',xWhere,'PROVDES');

     if length(edtProv.text)=0 then
     begin
        ShowMessage('Código de Proveedor No Existe!!!');
        dblcProv.SetFocus;
        exit;
     end;
     dbeCtdadG.Text:= '0'; 
   end;
end;

procedure TForm2.edtDsto2Exit(Sender: TObject);
var
   xDscto1,xDscto2, xImporte1,
   xSubTot1,xTot,
   xTotD1,xTotD2,
   xFrac           : double;
   xWhere          : string;
   xValor          : double;
begin
   if not bbtnRegCanc.Focused then
   begin
     if dbePorcentaje.text ='' then
         xDscto1 := 0
     else
        xDscto1:= strtofloat(dbePorcentaje.text);

     if edtDsto2.text ='' then
         xDscto2 := 0
     else
     begin
       if strtofloat(edtDsto2.text)<0 then
       begin
         Showmessage('Ingrese un Descuento mayor/igual a cero');
         edtDsto2.text :='';
         edtDsto2.setfocus;
         Exit;
       end
       else
         xDscto2:= strtofloat(edtDsto2.text);
     end;

     if length(dbeCantUA.Text)>0 then
     begin
       xWhere    := 'EUNMID1='+quotedstr(dbeUmg.Text);
       DM1.BuscaQry('dspUltTGE','TGE156','EUNMEQ','EUNMID1='+quotedstr(dbeUmG.text),'EUNMEQ');
       if length(DM1.cdsQry.fieldbyname('EUNMEQ').AsString)=0 then
          raise exception.Create('Esta unidad no tiene Equivalencia!!!')
       else
          xValor := strtofloat(DM1.cdsQry.fieldbyname('EUNMEQ').AsString );

       xFrac     := strtofloat(dbeCantUA.Text)/xValor;
       xImporte1 := FRound(strtofloat(dbePrecioG.Text)*(strtofloat(dbeCantGA.text)+xFrac),15,2);
     end
     else
       xImporte1:= FRound(strtofloat(dbePrecioG.Text)*strtofloat(dbeCantGA.text),15,2);

     xTotD1   := FRound(xImporte1*(xDscto1/100),15,2);
     xSubtot1 := FRound(xImporte1 - xTotD1,15,2);
     xTotD2   := FRound(xSubtot1*(xDscto2/100),15,2);
     xTot     := FRound(xSubtot1- xTotD2,15,2);

     dbeImporte.text := floattostr(xTot);
     if length(dbeGarantia.text)>0 then
        dbeDGarantia.text := dbeGarantia.text
     else
          bbtnRegOk.SetFocus;
   end;
end;

procedure TForm2.bbtnCancBuscaClick(Sender: TObject);
begin
   dblcdArticulo.Text  := DM1.cdsQry5.FieldByName('ARTID').AsString;
   dblcdArticulo.SetFocus;
   pnlBusqueda.Visible := False;
end;

procedure TForm2.bbtnOkBuscaClick(Sender: TObject);
begin
   dblcdArticulo.Text  := DM1.cdsQry5.FieldByName('ARTID').AsString;
   dblcdArticulo.SetFocus;
   pnlBusqueda.Visible := False;
end;

procedure TForm2.dbeBuscaExit(Sender: TObject);
var
   xSQL, xVarBusca : String;
begin
   xVarBusca := '%'+trim(dbeBusca.Text)+'%';
   xSQL := 'Select ARTDES,ARTID from TGE205 where ARTDES like('+quotedstr(xVarBusca)+')';
   DM1.cdsQry5.DisableControls;
   DM1.cdsQry5.Close;
   DM1.cdsQry5.IndexFieldNames:='ARTDES';
   DM1.cdsQry5.Filter := '';
   DM1.cdsQry5.DataRequest(xSQL);
   DM1.cdsQry5.Open;
   dbgBusca.Selected.Clear;
	dbgBusca.Selected.Add('ARTDES'#9'50'#9'Artículo');
	dbgBusca.Selected.Add('ARTID'#9'10'#9'Id');
   DM1.cdsQry5.EnableControls;
   dbgBusca.SetFocus;
end;

procedure TForm2.AperturaConsultaSaldos(xxFlagE: string);
begin
   MuestraStock(dblcdArticulo.text,xxFlagE);
   pnlRegistro.Width :=674;
end;

procedure TForm2.Muestrastock(xxArticulo, xxEstado: string);
var
   xFiltro          : string;
   xUnidad          : boolean;  //True  UMG , False UMU
   xSaldoG,xSaldoU  : double;
begin
   DM1.cdsQry4.ProviderName := 'prvEjecuta';
   DM1.cdsQry4.close;
   if (xxEstado = 'S') then begin
      Case cbtipoUm.ItemIndex of
      0: begin//U.M General
           if (dblcAlmacen.text <>'')     then begin
               xFiltro := ' SELECT A.ALMID,B.ALMDES,A.ARTCONT,A.ARTID,  ';
               xFiltro := xFiltro+  DM1.wReplacCeros+'(A.STKSACTG,0)-'+DM1.wReplacCeros+'(A.STKRACTG,0) AS STKSACTG FROM LOG316 A ';
               if (DM1.SRV_D = 'DB2NT') or
                      (DM1.SRV_D = 'DB2400') then
               begin
                 xFiltro := xFiltro+ ' INNER JOIN TGE151 B ON(A.ALMID = B.ALMID)';
                 xFiltro :=  xFiltro + 'WHERE A.ARTID='+quotedstr(xxArticulo);
                 xFiltro :=  xFiltro + 'AND A.ALMID='+quotedstr(dblcAlmacen.text);
                 xUnidad := true;
               end
               else
                  if DM1.SRV_D = 'ORACLE' then
                  begin
                     xFiltro := xFiltro+ ' ,TGE151 B ';
                     xFiltro :=  xFiltro + 'WHERE A.ARTID='+quotedstr(xxArticulo);
                     xFiltro :=  xFiltro + 'AND A.ALMID='+quotedstr(dblcAlmacen.text);
                     xFiltro := xFiltro+ ' AND A.ALMID = B.ALMID';
                     xUnidad := true;
                  end;
           end
           else begin
                 xFiltro := ' SELECT A.ALMID,A.ARTCONT,B.ALMDES,A.ARTID,';
                 xFiltro :=  xFiltro + DM1.wReplacCeros+'(A.STKSACTG,0)-'+DM1.wReplacCeros+'(A.STKRACTG,0) AS STKSACTG FROM LOG316 A ';
                 if (DM1.SRV_D = 'DB2NT') or
                        (DM1.SRV_D = 'DB2400') then
                 begin
                    xFiltro :=  xFiltro + ' INNER JOIN TGE151 B ON(A.ALMID = B.ALMID)';
                    xFiltro :=  xFiltro + ' WHERE A.ARTID='+quotedstr(xxArticulo);
                    xUnidad :=  True;
                 end
                 else
                     if (DM1.SRV_D = 'ORACLE') then begin
                        xFiltro :=  xFiltro + ' ,TGE151 B ';
                        xFiltro :=  xFiltro + ' WHERE A.ARTID='+quotedstr(xxArticulo);
                        xFiltro :=  xFiltro + ' AND A.ALMID = B.ALMID';
                        xUnidad :=  True;
                     end;
                end;
         end;
      1: begin//U.M Unitario
           if (dblcAlmacen.text <>'') and (xxEstado = 'S') then begin
               xFiltro:= ' SELECT A.ALMID,A.ARTCONT,B.ALMDES,A.ARTID,';
               xFiltro := xFiltro + DM1.wReplacCeros+ '(A.STKSACTU,0)-'+DM1.wReplacCeros+'(A.STKRACTU,0) AS STKSACTU FROM LOG316 A ';
               if (DM1.SRV_D = 'DB2NT') or
                      (DM1.SRV_D = 'DB2400') then
               begin
                  xFiltro := xFiltro + ' INNER JOIN TGE151 B ON(A.ALMID = B.ALMID)';
                  xFiltro := xFiltro + ' WHERE A.ARTID='+quotedstr(xxArticulo);
                  xFiltro := xFiltro + ' AND A.ALMID='+quotedstr(dblcAlmacen.text);
                  xUnidad := False;
               end
               else
                   if (DM1.SRV_D = 'ORACLE') then begin
                      xFiltro := xFiltro + ' ,TGE151 B ';
                      xFiltro := xFiltro + ' WHERE A.ARTID='+quotedstr(xxArticulo);
                      xFiltro := xFiltro + ' AND A.ALMID='+quotedstr(dblcAlmacen.text);
                      xFiltro := xFiltro + ' AND A.ALMID = B.ALMID';
                      xUnidad := False;
                   end;
           end
           else begin
                 xFiltro := ' SELECT A.ALMID,A.ARTCONT,B.ALMDES,A.ARTID,';
                 xFiltro :=  xFiltro + DM1.wReplacCeros+' (A.STKSACTU,0)-'+DM1.wReplacCeros+'(A.STKRACTU,0) AS STKSACTU FROM LOG316 A ';
                 if (DM1.SRV_D = 'DB2NT') or
                        (DM1.SRV_D = 'DB2400') then
                 begin
                    xFiltro :=  xFiltro + ' INNER JOIN TGE151 B ON(A.ALMID = B.ALMID)';
                    xFiltro :=  xFiltro + ' WHERE A.ARTID='+quotedstr(xxArticulo);
                    xUnidad :=  False;
                 end
                 else
                     if (DM1.SRV_D = 'ORACLE') then
                     begin
                        xFiltro :=  xFiltro + ' ,TGE151 B ';
                        xFiltro :=  xFiltro + ' WHERE A.ARTID='+quotedstr(xxArticulo);
                        xFiltro :=  xFiltro + ' AND A.ALMID = B.ALMID';
                        xUnidad :=  False;
                     end;
                end;
         end;
      end;//Case;
   end
   else
       if (dblcAlmacen.text <>'')     then begin
          xFiltro := ' SELECT A.ALMID,A.ARTCONT,B.ALMDES,A.ARTID,';
          xFiltro :=  xFiltro + DM1.wReplacCeros+ ' (A.STKSACTG,0)-'+DM1.wReplacCeros+'(A.STKRACTG,0) AS STKSACTG FROM LOG316 A ';
          if (DM1.SRV_D = 'DB2NT') or
                 (DM1.SRV_D = 'DB2400') then
          begin
             xFiltro :=  xFiltro + ' INNER JOIN TGE151 B ON(A.ALMID = B.ALMID)';
             xFiltro :=  xFiltro + ' WHERE A.ARTID='+quotedstr(xxArticulo);
             xFiltro :=  xFiltro + ' AND A.ALMID='+quotedstr(dblcAlmacen.text);
             xUnidad :=  True;
          end
          else
              if (DM1.SRV_D = 'ORACLE') then
              begin
                 xFiltro :=  xFiltro + ' ,TGE151 B ';
                 xFiltro :=  xFiltro + ' WHERE A.ARTID='+quotedstr(xxArticulo);
                 xFiltro :=  xFiltro + ' AND A.ALMID='+quotedstr(dblcAlmacen.text);
                 xFiltro :=  xFiltro + ' AND A.ALMID = B.ALMID';
                 xUnidad :=  True;
              end;
       end
       else begin
            xFiltro := ' SELECT A.ALMID,A.ARTCONT,B.ALMDES,A.ARTID,';
            xFiltro :=  xFiltro + DM1.wReplacCeros+'(A.STKSACTG,0)-'+DM1.wReplacCeros+'(A.STKRACTG,0) AS STKSACTG FROM LOG316 A ';
            if (DM1.SRV_D = 'DB2NT') or
                   (DM1.SRV_D = 'DB2400') then
            begin
               xFiltro :=  xFiltro + ' INNER JOIN TGE151 B ON(A.ALMID = B.ALMID)';
               xFiltro :=  xFiltro + ' WHERE A.ARTID='+quotedstr(xxArticulo);
               xUnidad := True;
            end
            else
                 if (DM1.SRV_D = 'ORACLE') then
                 begin
                   xFiltro :=  xFiltro + ' ,TGE151 B ';
                   xFiltro :=  xFiltro + ' WHERE A.ARTID='+quotedstr(xxArticulo);
                   xFiltro :=  xFiltro + ' AND A.ALMID = B.ALMID';
                   xUnidad := True;
                 end;
            cbtipoUM.ItemIndex:= 0;
            end;
   DM1.cdsQry4.DataRequest(xFiltro);
   DM1.cdsQry4.Open;
   if DM1.cdsQry4.recordcount = 0 then begin
      bbtnRegCanc.OnClick( Self );
      raise exception.create('Error: No se encuentra el Articulo '+xxArticulo);
   end;

   if xUnidad then begin  //General
      xSaldog := DM1.OperClientDataSet( DM1.cdsQry4 , 'SUM(STKSACTG)', '');
      dbgStock.ColumnByName('STKSACTG').FooterValue  :=floattostrf(xSaldoG, ffNumber, 12,2);
      wStockG := xSaldog;
   end
   else begin
          xSaldoU := DM1.OperClientDataSet( DM1.cdsQry4 , 'SUM(STKSACTU)', '');
          dbgStock.ColumnByName('STKSACTU').FooterValue  :=floattostrf(xSaldoU, ffNumber, 12,2);
          wStockG := xSaldoU;
        end;

end;

end.

