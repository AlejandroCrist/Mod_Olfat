unit MostrarU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.SyncObjs, System.Math,
  System.Variants, System.Classes, System.DateUtils, System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.ComCtrls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Samples.Gauges, Vcl.Buttons,
  VaClasses, VaComm, Acces32,
  GridU, ListValvU, QProgBar;

type
 THiloControl = class(TThread)
  scrbDiagrama_Hilo: TScrollBox;
  pnlDiagrama_Hilo: TPanel;
  grdpDiagrama_Hilo: TGridPanel;
  lblEtiqVal_Hilo: TLabel;
  lblTiempoVal_Hilo: TLabel;
  memActividad_Hilo: TMemo;
  btnRespirar_Hilo: TButton;
  btnIniciar_Hilo: TButton;
  btnStop_Hilo:TButton;
  VaComm1_Hilo:TVaComm;
  private
    FEvento: TEvent;
    _Terminado: boolean;
    _Manual: Boolean;
  public
    procedure Execute; override;
    procedure ActualizarProgreso;
    procedure CrearEvento;
    procedure Terminar;
    procedure SeñalizarEvento;
    property Evento: TEvent read FEvento write FEvento;
    property Terminado: boolean read _Terminado;
end;

type
  TfrmMostrar = class(TForm)
    btnAbrirPuerto: TButton;
    btnCerrarPuerto: TButton;
    btnIniciar: TButton;
    btnSTOP: TButton;
    Label1: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    lblEtiqTiempo: TLabel;
    lblEtiqVal: TLabel;
    lblTiempo: TLabel;
    lblTiempoVal: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    medtNumPuerto: TMaskEdit;
    memActividad: TMemo;
    pnlInfoValv: TPanel;
    pnlInfoV1: TPanel;
    pnlInfoV2: TPanel;
    pnlInfoV3: TPanel;
    pnlInfoV4: TPanel;
    pnlInfoV5: TPanel;
    pnlInfoV6: TPanel;
    pnlInfoV7: TPanel;
    pnlInfoV8: TPanel;
    pnlInfoV9: TPanel;
    pnlProgreso: TPanel;
    scrbDiagrama: TScrollBox;
    pnlDiagrama: TPanel;
    grdpDiagrama: TGridPanel;
    VaComm1: TVaComm;
    TimerEjec: TTimer;
    btnGuardarRutina: TButton;
    sdlGuadarParadig: TSaveDialog;
    TimerDummy: TTimer;
    btnSalir: TButton;
    btnAutomatico: TButton;

    procedure FormShow(Sender: TObject);
    procedure btnSTOPClick(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure _Reset();

    procedure CrearLista;
    procedure DelLista;
    procedure AddItem(aName, aId: string; aTime, aInic, index, numVal: integer);
    procedure BorrarPanel;
    procedure CargarLista(ruta:string; archivo: string);
    procedure GuardarLista(ruta: string; nombre: string);

    procedure _AbreValvulas(AuxEstimulo: TEstimulo);
    procedure _Cierra_Todo();
    procedure _Cierra_Valvulas();
    Procedure _Alimenta_Bomba();

    procedure btnAbrirPuertoClick(Sender: TObject);
    procedure btnCerrarPuertoClick(Sender: TObject);
    procedure InicializaMaskEdit();
    procedure ImprimeBytes();
    procedure VaComm1RxChar(Sender: TObject; Count: Integer);
    procedure DrawData(Resp: Array of Integer; Der : Array of Integer);
    procedure TimerEjecTimer(Sender: TObject);
    procedure btnGuardarRutinaClick(Sender: TObject);
    procedure TimerDummyTimer(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnAutomaticoClick(Sender: TObject);
  private
    { Private declarations }
    //Respiración
    cont1, LongBuf : Integer;
    Buffer  : Array[1..15] of Integer;
    Buffer2 : Array[1..15] of Integer;
    ByteBit : Array [1..13] of TMaskEdit;
    sincronizado : Boolean;
    contador, cont_diezmado : Integer;
    proc : boolean;
    derivar : boolean;
    // Arrays de respiración.
    // El tamaño está dividido por el diezmado (son 10s)
    resp_aux : Array [0..(2500 div 5)-1]of Integer;
    resp_data : Array of Integer;
    der_aux : Array [0..(2500 div 5)-1] of Integer;
    derivada : Array [0..(2500 div 5)-1] of Integer;
    media : Integer;
    minimo : boolean;
    Control_Fich : Integer;

    //Dibujar Gauges
    function _Color():TColor;
    procedure _Inicializar();
    procedure _DibujarPanelTiempo();
    procedure _CrearPanel(aRow: Integer; aCol: Integer; tiempo: Integer);
    procedure _CrearBoton(ARow, aCol: integer; aID: string; aStat: boolean);
    procedure _btbClick(Sender: TObject);
    procedure _PanelResp(ARow, aCol: integer; dummy: boolean);
    function _CrearGauge(ARow, aCol, aDur: integer; aID: string; index: integer): TQProgressBar;
    procedure _Dibujar();
    procedure _DibujarDummy();

    procedure Inicio();

  public
    { Public declarations }
  end;

var
  frmMostrar: TfrmMostrar;

implementation

{$R *.dfm}

uses
  AddValvU, AIOUSB,Global_Unit1;

const
  NumRows = 13; // Filas en la tabla.
  //WidthCeld = 15; // Tamaño de la celda en tabla.
  ColValv : array[0..8] of integer = (1,2,3,5,6,7,9,10,11) ; //Array para Colocar las valvulas en la posición correcta de la tabla.
  cTiempoDummy = 20000;

var
  _ListValvulas: TParadigma;
  _TiempoInic: extended;
  _TiempoEjec: extended;
  _Lineas_Fichero : Array of String;
  _MiHilo: THiloControl;
  _Num_Val: integer;
  _ColorMaxAnt: integer;

  _TiempoDummy: cardinal;
  _StartTimeDummy: extended;
  _AuxTimeDummy : extended;
  _ElapsedTimeDummy : extended;
  _PGDummy: TQProgressBar;
  _StepDummy: integer;

procedure MostrarMensaje(Flag: integer; Titulo, Mensaje: string);
begin
  if flag = 0 then
    if Messagebox(Application.Handle,PChar(Mensaje),
                  PChar(Titulo),MB_YESNO or MB_ICONQUESTION)
                  = IDYES then
      begin
        //falta algo!!
      end
  else if flag = 1 then
    Messagebox(Application.Handle,PChar(Mensaje),PChar(Titulo),MB_YESNO or MB_ICONQUESTION)
end;

procedure TfrmMostrar.CrearLista;
begin
  _ListValvulas := TParadigma.Create;
end;

procedure TfrmMostrar.DelLista;
begin
  _ListValvulas.Borrar;
end;

procedure TfrmMostrar.GuardarLista(ruta: string; nombre: string);
begin
  _ListValvulas.Guardar( ruta ,nombre );
end;

procedure TfrmMostrar.CargarLista(ruta: string; archivo: string);
begin
  _ListValvulas.Cargar(ruta,archivo);
end;

procedure TfrmMostrar.AddItem(aName, aId: string; aTime, aInic, index, numVal: Integer);
begin
  _ListValvulas.AddItem(aName, aId, aTime, aInic, index, numVal);
end;

procedure TfrmMostrar.BorrarPanel;
var
  I,a: integer;
begin
  for I := 0 to (grdpDiagrama.ColumnCollection.Count - 1) do
    for a := 0 to (grdpDiagrama.RowCollection.Count - 1) do
      grdpDiagrama.ControlCollection.Controls[I,a].Free;
end;

procedure TfrmMostrar.FormShow(Sender: TObject);
var
  i : integer;
begin
  _ColorMaxAnt:= 4;

  _Inicializar;

  sdlGuadarParadig.InitialDir := Pub_FicheroParadigmas;

  sincronizado := false;
  cont1:=0;
  LongBuf:=0;
  ByteBit[1] := MaskEdit1;
  ByteBit[2] := MaskEdit2;
  ByteBit[3] := MaskEdit3;
  ByteBit[4] := MaskEdit4;
  ByteBit[5] := MaskEdit5;
  ByteBit[6] := MaskEdit6;
  ByteBit[7] := MaskEdit7;
  ByteBit[8] := MaskEdit8;
  ByteBit[9] := MaskEdit9;
  ByteBit[10] := MaskEdit10;
  ByteBit[11] := MaskEdit11;
  ByteBit[12] := MaskEdit12;
  ByteBit[13] := MaskEdit13;
  for i := 1 to 13 do
  begin
    Buffer[i]:=0;
    Buffer2[i]:=0;
  end;

  proc :=false;
  derivar := false;
  minimo := false;

  btnIniciar.Enabled:=True;
  btnAutomatico.Enabled := True;
  btnStop.Enabled:=False;
  btnGuardarRutina.Enabled := True;
  btnAbrirPuerto.Enabled:= True;
  btnCerrarPuerto.Enabled:= False;
end;

procedure TfrmMostrar._Inicializar;
var
  numColum: integer;
  col, row: integer;
begin
  pnlDiagrama.Width := Trunc(_ListValvulas.Long * 100) + 100 + 2;
  grdpDiagrama.Width := Trunc(_ListValvulas.Long * 100) + 100;
  scrbDiagrama.HorzScrollBar.Range := Trunc(_ListValvulas.Long * 100) + 100;

  numColum := _ListValvulas.Long;
  grdpDiagrama.RowCollection.BeginUpdate;
  for row := 0 to NumRows do
  begin
    grdpDiagrama.RowCollection.Add;
    if (row mod 4) = 0 then
    begin
      grdpDiagrama.RowCollection.Items[row].SizeStyle := ssAbsolute;
      grdpDiagrama.RowCollection.Items[row].Value := 15;
    end
    else
      if (row mod 3) = 0 then
      begin
        grdpDiagrama.RowCollection.Items[row].SizeStyle := ssAbsolute;
        grdpDiagrama.RowCollection.Items[row].Value := 30;
      end
      else
      begin
        grdpDiagrama.RowCollection.Items[row].SizeStyle := ssAbsolute;
        grdpDiagrama.RowCollection.Items[row].Value := 31;
      end;
  end;
  grdpDiagrama.RowCollection.EndUpdate;

  grdpDiagrama.ColumnCollection.BeginUpdate;
  for col := 0 to numColum do
  begin
    grdpDiagrama.ColumnCollection.Add;
    grdpDiagrama.ColumnCollection.Items[col].SizeStyle := ssAbsolute;
    grdpDiagrama.ColumnCollection.Items[col].Value := 100;

  end;
  grdpDiagrama.ColumnCollection.EndUpdate;

  _DibujarDummy;
  _DibujarPanelTiempo;
  _Dibujar;

  scrbDiagrama.HorzScrollBar.Position := 0;
end;

procedure TfrmMostrar._DibujarDummy;
var
  row, NVal: integer;
begin
  for row := 0 to 3 do
    _CrearPanel(row * 4, 0, 0);

  for Nval := 0 to 8 do
    _PanelResp(ColValv[Nval], 0, True);

  _PGDummy := _CrearGauge(13,0, cTiempoDummy,'TiempoDummy',0);
end;

procedure TfrmMostrar._DibujarPanelTiempo;
var
  col : integer;
  row: integer;
  auxEstimulo: TEstimulo;
begin
  for col := 0 to _ListValvulas.Long - 1 do
  begin
    auxEstimulo := _ListValvulas.SacarItem(col);
    for row := 0 to 3 do
      _CrearPanel(row * 4, col+1, auxEstimulo.Time)
  end;

end;

procedure TfrmMostrar._CrearPanel(aRow: Integer; aCol: Integer; tiempo: Integer);
var
  pnlAux: TPanel;
begin
  pnlAux := TPanel.Create(frmMostrar);
  with pnlAux do
  begin
    Align := alClient;
    Alignment := taCenter;
    BorderStyle := bsSingle;
    BorderWidth := 0;
    if tiempo = 0 then
      Caption := 'Tiempo Dummy'
    else
      Caption :=  Formatfloat('#,##0', tiempo) + ' ms';

    Name := 'lbl' + IntToStr(aRow) + IntToStr(aCol);
    ParentColor := False;
    ParentBackground := False;
  end;
  try
    grdpDiagrama.AddControlAtCell(pnlAux, aCol, aRow);
  except
    on E: Exception  do
      Application.MessageBox( PChar( E.ClassName + ': ' + E.Message ), 'Error', MB_ICONSTOP );
  end;
  pnlAux.Enabled := True;
  pnlAux.Parent := grdpDiagrama;
  pnlAux.Visible := True;
end;

procedure TfrmMostrar._btbClick(Sender: TObject);
var
  auxbutton: TBitBtn;
  id: string;
  numVal: integer;
begin
  auxbutton := Sender as TBitBtn;
  id := Copy(auxbutton.Name, 5, Length(auxbutton.Name));
  numVal := STrToInt(Copy(auxbutton.Name, 4, 1));
  if Assigned(auxbutton) then
    if auxbutton.tag = 0 then
    begin
      _ListValvulas.AddVal(id,numVal);
      auxbutton.Tag := 1;
      auxbutton.Glyph.LoadFromFile('.\Imagenes\hab.bmp');
    end
    else if auxbutton.Tag = 1 then
    begin
      try
        _ListValvulas.DelVal(id,numVal);
      except
        on E: Exception do
        begin
          Messagebox(Application.Handle,PChar( E.Message ),PChar('Error')
                      ,MB_OK or MB_ICONWARNING);
          exit;
        end;
      end;
      auxbutton.Tag := 0;
      auxbutton.Glyph.LoadFromFile('.\Imagenes\deshab.bmp');
    end;
    auxbutton.Caption := '';
end;

procedure TfrmMostrar._CrearBoton(ARow: Integer; aCol: Integer; aID: string; aStat: Boolean);
var
  auxbutton: TBitBtn;
begin
  auxbutton := TBitBtn.Create(frmMostrar);
  with auxbutton do
  begin
    Name := 'btb' + IntToStr(ARow) + aID;
    Align := alClient;
    if aStat then
    begin
      Tag := 1;
      Glyph.LoadFromFile('.\Imagenes\hab.bmp');
    end
    else
    begin
      Tag := 0;
      Glyph.LoadFromFile('.\Imagenes\deshab.bmp');
    end;
    kind := bkCustom;
    Caption := '';
    OnClick := _btbClick;
    Modalresult := mrNone;
  end;
  try
    grdpDiagrama.AddControlAtCell(auxbutton, aCol, ColValv[aRow]);
  except
    on E: Exception  do
    begin
      auxbutton.Free;
      Application.MessageBox( PChar( E.ClassName + ': ' + E.Message ), 'Error', MB_ICONSTOP );
    end;
  end;
  auxbutton.Parent := grdpDiagrama;
  auxbutton.Visible := True;
end;

procedure TfrmMostrar._PanelResp(ARow: Integer; aCol: Integer; dummy:boolean);
var
  pnlAux: TPanel;
begin
  pnlAux := TPanel.Create(frmMostrar);
  with pnlAux do
  begin
    Align := alClient;
    if dummy then
      Color := clMoneyGreen
    else
      Color := clSkyBlue;
    Name := 'pnl' + IntToStr(aRow) + IntToStr(aCol);
    Caption := '';
    ParentColor := False;
    ParentBackground := False;
  end;
  try
    grdpDiagrama.AddControlAtCell(pnlAux, aCol, aRow);
  except
    on E: Exception  do
      Application.MessageBox( PChar( E.ClassName + ': ' + E.Message ), 'Error', MB_ICONSTOP );
  end;
  pnlAux.Enabled := True;
  pnlAux.Parent := grdpDiagrama;
  pnlAux.Visible := True;
end;

function TfrmMostrar._Color : TColor;
var
  colores: array[0..2] of integer;
  maximo,minimo: integer;
  Imax, Imin: integer;
  IAux: integer;
  I:integer;
begin
  randomize();
  colores[0] := Random(178) + 66;
  colores[1] := Random(178) + 66;
  colores[2] := Random(178) + 66;
  maximo := colores[0];
  minimo := colores[0];
  Imax := 0;
  Imin := 0;
  for I := 0 to 2 do
  begin
    if colores[I] > maximo then
    begin
      maximo := colores[I];
      Imax := I;
    end
    else if colores[I] < minimo then
    begin
      minimo := colores[I];
      Imin := I;
    end;
  end;

  if Imax = _ColorMaxAnt then
  begin
    IAux := Imax;
    Imax := Imin;
    Imin := IAux;
  end;
  Colores[Imin] := 66;
  Colores[Imax] := 244;

  _ColorMaxAnt := Imax;

  result := TColor(RGB(Colores[0],Colores[1],Colores[2]));

end;

function TfrmMostrar._CrearGauge(ARow: Integer; aCol: Integer; aDur: Integer; aID: string; index: Integer): TQProgressBar;
var
  pgbVal: TQProgressBar;
begin
  pgbVal := TQProgressBar.Create(frmMostrar);
  with pgbVal do
  begin
      Name := 'pgb' + aID;
      maximum := aDur;
      Align := alClient;
      BarColor := _Color;
      roundCorner := False;
      shapeColor := clblack;
      ShowPosAsPct := True;
      AutoCaption := True;
      AutoHint := True;
      captionAlign := taCenter;
  end;
  try
    grdpDiagrama.AddControlAtCell(pgbVal, aCol, aRow);
  except
    on E: Exception  do
    begin
      pgbVal.Free;
      Application.MessageBox( PChar( E.ClassName + ': ' + E.Message ), 'Error', MB_ICONSTOP );
      result := nil;
      exit
    end;
  end;

  pgbVal.Enabled := True;
  pgbVal.Parent := grdpDiagrama;
  pgbVal.Visible := True;

  Result := pgbVal;
end;

Procedure TfrmMostrar._Dibujar;
var
  i, Nval: integer;
  auxEstimulo: TEstimulo;
  name: string;
begin
  for i := 0 to _ListValvulas.Long - 1 do
  begin
    auxEstimulo := _ListValvulas.SacarItem(i);
    name := auxEstimulo.ID;

    for Nval := 0 to 8 do
    begin
      if auxEstimulo.Repos = False then
        _CrearBoton(Nval,i+1, name, auxEstimulo.Val[Nval])
      else
        _PanelResp(ColValv[Nval], i+1, false);
    end;

    _ListValvulas.SetProgressBar(name,_CrearGauge(13,i+1, auxEstimulo.Time,name,i));

  end;

end;

procedure TfrmMostrar._Reset;
var
  i: integer;
  AuxEstimulo: TEstimulo;
  Auxpgb: TQProgressBar;
begin
  for I := 0 to (_ListValvulas.Long - 1) do
  begin
    AuxEstimulo := TEstimulo(_ListValvulas.SacarItem(i));
    auxpgb := TQProgressBar(AuxEstimulo.GetProgressBar);
    Auxpgb.position := 1 ;
    auxpgb.position := auxpgb.position - 1;
    AuxPgb.Repaint;
  end;
  grdpDiagrama.Refresh;
  memActividad.Clear;
  lblTiempo.Caption := FormatDateTime('nn:ss.zzz', 0);
  lblTiempoVal.Caption := FormatDateTime('nn:ss.zzz', 0);
  label22.Caption := 'Fichero:';
end;

procedure TfrmMostrar.btnSalirClick(Sender: TObject);
var
  i: integer;
begin
  if Assigned(_MiHilo) then
    if not _Mihilo.Terminado then
    begin
      if Messagebox(Application.Handle,PChar('¿Desea Cancelar la Ejecución y Cerrar la Ventana?'),
                    PChar('Mensaje de Confirmación'),MB_YESNO or MB_ICONQUESTION)
                    = IDNO then
        Abort
      else
      begin
        _MiHilo.SeñalizarEvento;
        _MiHilo.Terminar;
        _Reset;
        _MiHilo.Free;
      end;
  end;

  frmMostrar.Hide;

  frmAddValvulas.Enabled := True;
  scrbDiagrama.HorzScrollBar.Position := 0;
  lblTiempo.Caption := '0';
  lblTiempoVal.Caption := '0';
  memActividad.Clear;
  BorrarPanel;
  label22.Caption := 'Fichero:';
  for I := grdpDiagrama.ColumnCollection.Count - 1 downto 0 do
    grdpDiagrama.ColumnCollection[I].Destroy;

  VaComm1.Close;
  btnAbrirPuerto.Enabled:=True;
  btnCerrarPuerto.Enabled:=False;

  frmAddValvulas.Comprueba_Ficheros;

  frmAddValvulas.Enabled := True;
  frmMostrar.Close;
end;

procedure TfrmMostrar.btnSTOPClick(Sender: TObject);
begin
  if Messagebox(Application.Handle,PChar('¿Desea Cancelar la ejecución de la rutina?'),
                  PChar('Mensaje de Confirmación'),MB_YESNO or MB_ICONQUESTION)
                  = IDYES then
    begin
      _MiHilo.SeñalizarEvento;
      _MiHilo.Terminar;
      btnStop.Enabled := False;
      btnIniciar.Enabled := True;
      btnAutomatico.Enabled := True;
      btnSalir.Enabled := True;
      btnCerrarPuerto.Enabled := True;
      btnGuardarRutina.Enabled := True;
      TimerEjec.Enabled := False;
      TimerDummy.Enabled := False;
      memActividad.Lines.Add('Proceso Teminado por el usuario.');
      sleep(100);
      _Reset;
      _PGDummy.position := 1 ;
      _PGDummy.position := _PGDummy.position - 1;
      _MiHilo.Free;
      scrbDiagrama.HorzScrollBar.Position := 0;
    end;
end;

procedure TfrmMostrar.TimerDummyTimer(Sender: TObject);
var
  PortNumber: WORD;
  Value: BYTE;
begin

  _AuxTimeDummy := _ElapsedTimeDummy;
  _ElapsedTimeDummy := Now - _StartTimeDummy;
  _stepDummy := MillisecondsBetween(_ElapsedTimeDummy,_AuxTimeDummy);

  Value := 0;
//PortNumber := StrToInt('$' + '1085');   // collect user's port #
  PortNumber := StrToInt('$' + 'C085');   // collect user's port #
  Value := InPortB(PortNumber);

  if Value=0 then
  begin
    _PGDummy.position := _PGDummy.Position + _stepDummy;
   Label16.Font.Color:=32768;
   Label16.Caption:='Tarjeta en estado de ESPERA.';
   Label17.Font.Color:=32768;
   Label17.Caption:='TRIG : OFF';
  end
 else
  begin
   Value:=0;
//   disparo:=2;
//   C1_Seg:=0;
//   T1:=0;
//   Inicia_Cronometro();
    _PGDummy.position := _PGDummy.maximum;
    _MiHilo.Start;
    TimerDummy.Enabled := False;
   Label16.Font.Color:= 255;
   Label16.Caption:='Tarjeta PROCESANDO';
   Label17.Font.Color:=255;
   Label17.Caption:='TRIG : ON';
//   Timer2.Enabled:=False;
//   Timer1.Enabled:=True;
  end;
//
//    if _TiempoDummy < GetTickCount then
//    begin
//
//    end
//    else
//    begin
//
//    end;
end;

procedure TfrmMostrar.TimerEjecTimer(Sender: TObject);
var
  Nom_Archivo : String;
  Num_Lineas_Fich, i: integer;
  Archivo : TextFile;
begin
  _TiempoEjec := (Now - _TiempoInic);
  lblTiempo.Caption := FormatDateTime('nn:ss.zzz', _TiempoEjec);
  Control_Fich := 1;
  if _MiHilo.Terminado then
  begin
    _Alimenta_Bomba();
    timerEjec.Enabled := False;
    // Inicio de Grabación de Fichero
    Nom_Archivo:=Global_Unit1.Pub_NombreArchivo;//Global_Unit1.Pub_NombreArchivo;
    Num_Lineas_Fich:=(_ListValvulas.Long * 2)+2; //Global_Unit1.Pub_Num_Valv_estimadas*2)+2; // Sumo 2 para líneas de más.
    SetLength(_Lineas_Fichero, Num_Lineas_Fich);
    AssignFile(Archivo, 'C:\Ficheros_STMP\'+Nom_Archivo);
    _Lineas_Fichero[0]:='Fecha de la Prueba: '+DateToStr(Date())+
                        ', Hora de la Prueba: '+TimeToStr(Time())+
                        ', Número Válvulas estimadas: '+IntToStr(_ListValvulas.Long)+
                        ', Número Válvulas utilizadas: '+IntToStr(_Num_Val);
    if Global_Unit1.Graba_Fichero =1 then
        begin
         try
           Rewrite(Archivo);
          Except
           begin
            ShowMessage('No se ha creado el fichero.');
            Control_Fich:=0
           end;
         end;
         if Control_Fich=1 then
          begin
           WriteLn(Archivo, _Lineas_Fichero[0]);
           WriteLn(Archivo);
           for i := 1 to memActividad.Lines.Count + 1 do
            begin
              if (i mod 2) = 1  then
                Write(Archivo,memActividad.Lines.Strings[i-1])
              else
                WriteLn(Archivo,memActividad.Lines.Strings[i-1]);
            end;
           CloseFile(Archivo);
           Label22.Visible:=True;
           Label22.Caption:= 'Fichero: ' + Global_Unit1.Pub_NombreArchivo+' correctamente grabado.';
          end;
       end;
       _MiHilo.free;

       frmAddValvulas.Comprueba_Ficheros;

       grdpDiagrama.Enabled := True;
       btnIniciar.Enabled := True;
       btnAutomatico.Enabled := True;
       btnSalir.Enabled := True;
       btnStop.Enabled := False;
       btnCerrarPuerto.Enabled := True;
       btnGuardarRutina.Enabled := True;
  end;
end;

procedure TfrmMostrar.Inicio;
begin
  btnIniciar.Enabled := False;
  BtnAutomatico.Enabled := False;
  btnGuardarRutina.Enabled := False;
  btnStop.Enabled := True;

  btnSalir.Enabled := False;

  _MiHilo := THiloControl.Create(True);
  _MiHilo.grdpDiagrama_Hilo := grdpDiagrama;
  _MiHilo.scrbDiagrama_Hilo := scrbDiagrama;
  _MiHilo.memActividad_Hilo := memActividad;
  _MiHilo.lblTiempoVal_Hilo := lblTiempoVal;
  _MiHilo.btnIniciar_Hilo := btnIniciar;
  _MiHilo.btnStop_Hilo := btnStop;
  _MiHilo.VaComm1_Hilo := VaComm1;
  _MiHilo.CrearEvento;

  _Reset;
  grdpDiagrama.Enabled := False;
  scrbDiagrama.HorzScrollBar.Position := 0;
  btnIniciar.Enabled := False;
  btnAutomatico.Enabled := False;
  _PGDummy.position := 1 ;
  _PGDummy.position := _PGDummy.position - 1;
  _ElapsedTimeDummy := 0;
end;

procedure TfrmMostrar.btnAutomaticoClick(Sender: TObject);
begin
  Inicio();
  _MiHilo._Manual := False;

  TimerEjec.Interval := 1;
  TimerDummy.Interval := 1;
  memActividad.Lines.Append('Comenzando Rutina.');
  _TiempoInic := Now; //En Inicio guardas el valor que te devuelve GetTickCount cuando inicias el proceso
  _TiempoDummy := GetTickCount + DWord(cTiempoDummy + 1);
  TimerEjec.Enabled := TRUE;
  _StartTimeDummy := Now;
  TimerDummy.Enabled := True;
end;

procedure TfrmMostrar.btnIniciarClick(Sender: TObject);
begin
  Inicio();
  _MiHilo._Manual := True;

  TimerEjec.Interval := 1;
//  TimerDummy.Interval := 1;
  memActividad.Lines.Append('Comenzando Rutina.');
  _TiempoInic := Now; //En Inicio guardas el valor que te devuelve GetTickCount cuando inicias el proceso
//  _TiempoDummy := GetTickCount + DWord(cTiempoDummy + 1);
  TimerEjec.Enabled := TRUE;
  _PGDummy.position := _PGDummy.maximum;
  _MiHilo.Start;

end;

procedure TfrmMostrar.btnGuardarRutinaClick(Sender: TObject);
begin
  sdlGuadarParadig.Execute();
  if FileExists(sdlGuadarParadig.FileName) then
    { Si el archivo ya existe, lanza una excepción. }
    raise Exception.Create('Nombre de ficuero existente. No se puede sobreescribir.')
  else
      _ListValvulas.Guardar(pub_FicheroPAradigmas,sdlGuadarParadig.FileName);
end;

procedure THiloControl.Execute;
begin
  inherited;
  ActualizarProgreso;
end;

procedure THiloControl.Terminar;
begin
  _MiHilo._Terminado := True;
end;

procedure THiloControl.CrearEvento;
begin
  FEvento := TEvent.Create(nil,false,false,'');
end;

procedure THiloControl.SeñalizarEvento;
begin
  FEvento.SetEvent;
end;

procedure THiloControl.ActualizarProgreso;
var
  StartTimeVal, ElapsedTimeVal, AuxTimeVal: extended;
  dwTiempo: extended;
  step : integer;
  Index: integer;
  Sacar: boolean;
  AuxEstimulo: TEstimulo;
  AuxPgb: TQProgressBar;
  numVal: Integer;
  valSelec: string;
  linea: string;
begin
  frmMostrar._Reset;
  grdpDiagrama_Hilo.Enabled := False;
  scrbDiagrama_Hilo.HorzScrollBar.Position := 0;
  btnIniciar_Hilo.Enabled := False;

  frmMostrar._Alimenta_Bomba();

  _Num_Val := 0;
  Index := 0;
  Sacar := True;
  _Terminado := False;
  ElapsedTimeVal := 0;
  StartTimeVal := 0;
  dwTiempo := 0;

  repeat
    begin
      if (_ListValvulas.Long > Index) and (Sacar) then
      begin
        FEvento.ResetEvent;
        if _Manual then
          begin
          if VaComm1_Hilo.active  then
            FEvento.WaitFor(Infinite);
          end
        else
        begin
          FEvento.WaitFor(Infinite);

        end;

        AuxEstimulo := TEstimulo(_ListValvulas.SacarItem(index));
        AuxPgb := TQProgressBar(AuxEstimulo.GetProgressBar);
        Inc(Index);
        Sacar := False;

        valSelec := '';
        for numVal := 0 to 8 do
          if AuxEstimulo.Val[numVal] then
            begin
              valSelec := valSelec + (IntToStr(numVal+1)) + ' ';
              Inc(_Num_Val);
            end;

        Linea:='Nº Ciclo : '+IntToStr(Index)+', Apertura Válvula/s '+ValSelec+', Instante: '+FormatDateTime('nn:ss.zzz', _TiempoEjec);
        memActividad_Hilo.Lines.Add(linea);
        dwTiempo := GetTickCount + DWord(AuxEstimulo.Time);
        if Index > 3 then
          scrbDiagrama_Hilo.HorzScrollBar.Position := scrbDiagrama_Hilo.HorzScrollBar.Position + 100;

        frmMostrar._AbreValvulas(AuxEstimulo);
        StartTimeVal := Now;
        ElapsedTimeVal := 0;
      end;

      AuxTimeVal := ElapsedTimeVal;
      ElapsedTimeVal := Now - StartTimeVal;
      lblTiempoVal_Hilo.Caption := FormatDateTime('nn:ss.zzz', ElapsedTimeVal);
      step:= MillisecondsBetween(AuxTimeVal,ElapsedTimeVal);

      if (dwTiempo <= GetTickCount) then
      begin
        Auxpgb.Position := Auxpgb.maximum;
        Sacar := True;
        frmMostrar._Cierra_Valvulas();
        linea:= ', Cierre de Válvula/s '+ValSelec+', Instante: '+FormatDateTime('nn:ss.zzz', _TiempoEjec);
        memActividad_Hilo.Lines.Append(linea);
      end
      else
      begin
        Synchronize(
          procedure
          begin
            Auxpgb.Position := auxpgb.Position + step;
          end);
        Sleep(15);
      end;

      if (_ListValvulas.Long <= Index) and (Sacar) then
        _Terminado := True;

    end;
  until (_Terminado or Terminated);


  linea:= 'Finalizado con exito';
  memActividad_Hilo.Lines.Append(linea);
  grdpDiagrama_Hilo.Enabled := True;
  btnIniciar_Hilo.Enabled := True;
  btnStop_Hilo.Enabled := False;
  frmMostrar.btnCerrarPuerto.Enabled := True;
end;

//Respiración.


Procedure TfrmMostrar._Alimenta_Bomba(); // Alimentar Bomba abre V9 con aire limpio SIN led.
var
  outMask: Byte;
begin
  OutMask := StrToInt('$0001');         // Abre V1 y alimenta bomba.
  DIO_Write8(DeviceIndex, 0, OutMask);
  OutMask := StrToInt('$0002');         // Alimenta led de EEG - Pin nº3.
  DIO_Write8(DeviceIndex, 1, OutMask);
end;

procedure TfrmMostrar._Cierra_Valvulas();
begin
  _Alimenta_Bomba();  // Alimentar bomba ya abre V9 para aire limpio.
end;

procedure TfrmMostrar._AbreValvulas(AuxEstimulo: TEstimulo);
var
  outMask: Byte;
  outMask1: Byte;
  auxMask: Byte;
  auxMask1: Byte;
  I: integer;
begin
  OutMask := StrToInt('$0000');
  OutMask1 := StrToInt('$0000');
  AuxMask := StrToInt('$0000');
  AuxMask1 := StrToInt('$0000');

  for I := 0 to 8 do
    if AuxEstimulo.Val[I] = True then
    begin
      case I of
      0:begin
        AuxMask := StrToInt('$0003');         // Abre V1 y alimenta bomba.
        AuxMask1 := StrToInt('$0004');         // Alimenta led de EEG - Pin nº3.
      end;
      1: begin
        AuxMask := StrToInt('$0005');         // Abre V2 y alimenta bomba.
        AuxMask1 := StrToInt('$0004');         // Alimenta led de EEG - Pin nº3.
      end;
      2: begin
        AuxMask := StrToInt('$0009');         // Abre V3 y alimenta bomba.
        AuxMask1 := StrToInt('$0004');         // Alimenta led de EEG - Pin nº3.
      end;
      3: begin
        AuxMask := StrToInt('$0011');         // Abre V4 y alimenta bomba.
        AuxMask1 := StrToInt('$0004');         // Alimenta led de EEG - Pin nº3.
      end;
      4: begin
        AuxMask := StrToInt('$0021');         // Abre V5 y alimenta bomba.
        AuxMask1 := StrToInt('$0004');         // Alimenta led de EEG - Pin nº3.
      end;
      5: begin
        AuxMask := StrToInt('$0041');         // Abre V6 y alimenta bomba.
        AuxMask1 := StrToInt('$0004');         // Alimenta led de EEG - Pin nº3.
      end;
      6: begin
        AuxMask := StrToInt('$0081');         // Abre V6 y alimenta bomba.
        AuxMask1 := StrToInt('$0004');         // Alimenta led de EEG - Pin nº3.
      end;
      7: begin
        AuxMask := StrToInt('$0001');         // Abre V8 y alimenta bomba.
        AuxMask1 := StrToInt('$0005');         // Alimenta led de EEG - Pin nº3.
      end;
      8: begin
        AuxMask := StrToInt('$0001');         // Abre V9 y alimenta led de EEG.
        AuxMask1 := StrToInt('$0006');         // Alimenta solo la Bomba.
      end;
      end;

      OutMask := OutMask or AuxMask;
      OutMask1 := OutMask1 or AuxMask1;

    end;

  DIO_Write8(DeviceIndex, 0, OutMask);
  DIO_Write8(DeviceIndex, 1, OutMask1);
end;

procedure TfrmMostrar._Cierra_Todo(); // Realmente no cierra todo, deja aire limpio SIN led.
var
  outData : DWord;
begin
  outData := $00020001;
  DIO_WriteAll(DeviceIndex,@outData);
end;

procedure TfrmMostrar.btnAbrirPuertoClick(Sender: TObject);
var
 NumPuerto, i : Integer;
begin
  NumPuerto:=StrToInt(string(medtNumPuerto.Text));
  try
    VaComm1.PortNum:=NumPuerto;
    VaComm1.Baudrate:=br115200;   // Velocidad de transmision
    VaComm1.Open;
  Except
    on E: Exception  do
    begin
      Application.MessageBox( PChar( E.ClassName + ': ' + E.Message ), 'Error', MB_ICONSTOP );
      exit
    end;
  end;

  for i := 1 to 13 do
    Buffer[i]:=0;

  frmMostrar.InicializaMaskEdit();

  btnIniciar.Enabled := True;
  btnAutomatico.Enabled := True;
  medtNumPuerto.Enabled:=False;
  btnAbrirPuerto.Enabled:=False;
  btnGuardarRutina.Enabled:=False;
end;


procedure TfrmMostrar.btnCerrarPuertoClick(Sender: TObject);
begin

  medtNumPuerto.Enabled:=True;
  btnCerrarPuerto.Enabled:=False;
  btnSTOP.Enabled := False;
  btnAbrirPuerto.Enabled:=True;
  VaComm1.PurgeReadWrite;
  VaComm1.Close;

end;

procedure TfrmMostrar.InicializaMaskEdit;
var
 i : Integer;
begin
  for i := 1 to 13 do
   frmMostrar.ByteBit[i].Text:='000';
end;

procedure TfrmMostrar.ImprimeBytes;
var
   i : Integer;
begin
  for i := 1 to 13 do
   frmMostrar.ByteBit[14-i].Text:=IntToStr(frmMostrar.Buffer[i]);
end;

procedure TfrmMostrar.VaComm1RxChar(Sender: TObject; Count: Integer);
var
  //Bit_L : AnsiChar;
  linea   : AnsiString;
  linea2, Str_Respiracion, UltCar : String;
  LngCad, PosComa, Respiracion, code  : Integer;
  compr, seq_number, ecg2, ecg3, resp, ppg, checksum : Integer;
  {w, h,} l1, valor : Integer; // Width and Heigth of the Window
begin
  //w:=pnlRespiracion.ClientWidth;
  //h:=pnlRespiracion.ClientHeight;
  cont1:=cont1+1;
  linea:=VaComm1.ReadText;
  linea2:=string(linea);
  Str_Respiracion:=linea2;
  UltCar:=RightStr(linea2,2);
  PosComa:=LastDelimiter(',',linea2);
  Delete(Str_Respiracion,1,PosComa);
  Val(Str_Respiracion,Respiracion, code);
  Str_Respiracion:=IntToStr(Respiracion);
  LngCad := Length(linea2);
  if LngCad=10  then
   begin
    //Label13.Caption:=Str_Respiracion;
    //Label3.Caption:='Valor de Byte leído : '+IntToStr(Respiracion);
    ImprimeBytes();
    //Label2.Caption:='SINCRONIZANDO lectura - Nº de Bytes leídos : '+IntToStr(cont1);
    //Label2.Caption:='Lectura SINCRONIZADA - Nº de Bytes leídos : '+IntToStr(cont1);
        resp:= Respiracion;
        SetLength(resp_data,cont_diezmado+1);
        l1:=length(resp_data);
        valor:=(-resp)+1000;
       // resp_data[cont_diezmado] := -resp+1000;
         if (valor<>0) then
          begin
           resp_data[cont_diezmado] :=  valor;
          end
          else
          begin
           resp_data[cont_diezmado] :=  resp_data[cont_diezmado-1];
          end;
        Label3.Caption:='Valor de Byte leído : '+IntToStr(resp_data[cont_diezmado]);
        // Calculamos la media
        media := SumInt(resp_data);
        media := (media div l1);
        // Buscamos el mínimo local


        if l1 > 3 then
        begin
            der_aux[cont_diezmado] :=
              resp_data[cont_diezmado]
              - resp_data[(cont_diezmado-2)];
            if (der_aux[(cont_diezmado-3)] < 0) and
               (der_aux[(cont_diezmado-2)] >= 0) and
               (der_aux[(cont_diezmado-1)] >= 0) and
               (der_aux[cont_diezmado] >= 0) and
            // Y estoy por debajo del umbral
               (resp_data[cont_diezmado] <= media) then
              begin
                // Esto es un mínimo
                minimo := true;
               end;
          end;

        // Si ha habido un mínimo y supero el umbral
        if ((minimo = true) and (resp_data[cont_diezmado] > media)) then
         begin
            if Assigned(_MiHilo) then
              _MiHilo.Evento.SetEvent;

//          if (Global_Unit1.Disparo_ON=1) then
//            begin
//             Num_Valv_SELEC:=Num_Valv_SELEC+1;
//             Global_Unit1.Disparo_ON:=0;
//             Global_Unit1.Inspira:=1;
//             Label9.Caption:='1';
//             C3_Seg:=0;
//            end;
          derivada[cont_diezmado] := resp_data[cont_diezmado];
          minimo := false;
         end
        else
         begin
          derivada[cont_diezmado] := 0;
         end;

        DrawData(resp_data, derivada);

        // Pasamos al siguiente paquete de datos

        if cont_diezmado = (359) then
        begin
          cont_diezmado := 0;
          SetLength(resp_data,0);
        end
        else
        begin
          cont_diezmado := cont_diezmado + 1;
        end;
   end;
        Label4.Caption:='Tamaño del buffer : '+IntToStr(media);

    // Vaciamos los datos leídos del buffer
    VaComm1.PurgeRead;

end;

procedure TfrmMostrar.DrawData(Resp: array of Integer; Der: array of Integer);
var
   i : Integer;
   w, h, l : Integer; // Width and Heigth of the Window
begin
  w:=1000;
  h:=465;
  frmMostrar.Repaint;
  frmMostrar.Canvas.Pen.Color:=clBlack;
  frmMostrar.Canvas.MoveTo(630, 352);
  frmMostrar.Canvas.LineTo(w-10, 352);
  frmMostrar.Canvas.MoveTo(810, 240);
  frmMostrar.Canvas.LineTo(810, 465);
  media := SumInt(resp_data);
  media := media div (length(resp_data));
  frmMostrar.Canvas.Pen.Color:=clGreen;
  frmMostrar.Canvas.MoveTo(620,(-media)+ 7*h div 4);
  frmMostrar.Canvas.LineTo(w,(-media)+ 7*h div 4);
  l:= length(Resp);
  for i := 1 to l-1 do
    begin
      frmMostrar.Canvas.Pen.Color:=clRed;
      frmMostrar.Canvas.MoveTo(630+i, -Resp[i-1] + 7*h div 4);
      frmMostrar.Canvas.LineTo(630+i, -Resp[i] + 7*h div 4);
      if Der[i] <> 0 then
       begin
        frmMostrar.Canvas.Pen.Color:=clBlue;
        frmMostrar.Canvas.MoveTo(630+i, 352);
        frmMostrar.Canvas.LineTo(630+i, -Resp[i] + 7*h div 4);
        frmMostrar.Canvas.MoveTo(631+i, 352);
        frmMostrar.Canvas.LineTo(631+i, -Resp[i] + 7*h div 4);
        //RespForm1.Canvas.LineTo(i*w div(499), -Resp[i] + 3*h div 2);
       end;

    end;

  end;
end.
