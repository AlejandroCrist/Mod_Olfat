unit ConfigU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.FileCtrl,
  GridU;
type
  TfrmConfigurar = class(TForm)
    pnlBotones: TPanel;
    btnConfNomVal: TButton;
    btnFicheros: TButton;
    pnlFicheros: TPanel;
    lblTituloCambFich: TLabel;
    pnlVisParadig: TPanel;
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
    scrbDiagrama: TScrollBox;
    pnlDiagrama: TPanel;
    grdpDiagrama: TGridPanel;
    btnParadigmas: TButton;
    pnlNombreValv: TPanel;
    lblTitulo: TLabel;
    lblv1: TLabel;
    lblv2: TLabel;
    lblv3: TLabel;
    lblv4: TLabel;
    lblv5: TLabel;
    lblv6: TLabel;
    lblv7: TLabel;
    lblv8: TLabel;
    lblv9: TLabel;
    btnGuardar: TButton;
    gpbEdts: TGroupBox;
    edtv1: TEdit;
    edtv2: TEdit;
    edtv3: TEdit;
    edtv4: TEdit;
    edtv5: TEdit;
    edtv6: TEdit;
    edtv7: TEdit;
    edtv8: TEdit;
    edtv9: TEdit;
    btnCancelar: TButton;
    pnlPrevParad: TPanel;
    lblParadigmas: TLabel;
    flbFicherosParad: TFileListBox;
    btnPrevisualizar: TButton;
    btnCancelParad: TButton;
    lblCarpeta: TLabel;
    btnCargarParad: TButton;
    btnCambiarFichSTMP: TButton;
    lblFichSTMP: TLabel;
    lblUbSTMP: TLabel;
    lblFichParadig: TLabel;
    lblUbParadig: TLabel;
    btnCambiarFichParad: TButton;
    btnCerrar: TButton;
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure btnConfNomValClick(Sender: TObject);
    procedure btnFicherosClick(Sender: TObject);
    procedure btnParadigmasClick(Sender: TObject);
    procedure btnPrevisualizarClick(Sender: TObject);
    procedure btnCancelParadClick(Sender: TObject);
    procedure btnCambiarFichSTMPClick(Sender: TObject);

    procedure _Previsualizar;
    procedure _DibujarPanelTiempo;
    procedure _BorrarPaneles;
    procedure _CrearPanel(aRow: Integer; aCol: Integer; tiempo: Integer);
    procedure _Dibujar;
    procedure _CrearBoton(ARow: Integer; aCol: Integer; aID: string; aStat: Boolean);
    procedure _PanelResp(ARow: Integer; aCol: Integer);
    procedure btnCargarParadClick(Sender: TObject);
    procedure btnCambiarFichParadClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigurar: TfrmConfigurar;

implementation

{$R *.dfm}

USES IniFiles, AddValvU, ListValvU, MostrarU, Global_Unit1;

const
  SELDIRHELP = 1000;
  NumRows = 11; // Filas en la tabla.
  ColValv : array[0..8] of integer = (1,2,3,5,6,7,9,10,11) ;

var
 _ListValvulas: TParadigma;
 NombreArch: string;

procedure MostrarMensaje(Flag: integer; Titulo, Mensaje: string);
begin
  if flag = 0 then
    Messagebox(Application.Handle,PChar(Mensaje),PChar(Titulo),MB_OK or MB_ICONERROR)
  else if flag = 1 then
    Messagebox(Application.Handle,PChar(Mensaje),PChar(Titulo),MB_OK or MB_ICONINFORMATION)
end;

procedure TfrmConfigurar._BorrarPaneles;
var
  I,a: integer;
begin
  for I := 0 to (grdpDiagrama.ColumnCollection.Count - 1) do
    for a := 0 to (grdpDiagrama.RowCollection.Count - 1) do
      grdpDiagrama.ControlCollection.Controls[I,a].Free;
end;

procedure TfrmConfigurar.btnCancelParadClick(Sender: TObject);
begin
  _BorrarPaneles;
  pnlVisParadig.Visible := False;
  pnlPrevParad.Visible := False;
  frmConfigurar.Width := 220;
end;

procedure TfrmConfigurar.btnCancelarClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to gpbEdts.ControlCount - 1 do
    if (Components[I] is TEdit) then
      TEdit(Components[I]).Clear;
  pnlNombreValv.Visible := False;
  frmConfigurar.Width := 220;
//  frmAddValvulas.Enabled := True;
//  frmConfigurar.Close;
end;

procedure TfrmConfigurar.btnCargarParadClick(Sender: TObject);
var
  incCiclo: integer;
begin
  frmMostrar.DelLista;
  frmMostrar.CrearLista;
  frmMostrar.CargarLista(Pub_FicheroParadigmas,NombreArch);

  frmAddValvulas.CargarParadigma(_ListValvulas.Total,NombreArch);

  _BorrarPaneles;
  pnlVisParadig.Visible := False;
  pnlPrevParad.Visible := False;
  frmConfigurar.Width := 220;

  frmConfigurar.Close;
  frmMostrar.ShowModal;
end;

procedure TfrmConfigurar.btnCerrarClick(Sender: TObject);
begin
  pnlVisParadig.Visible := False;
  pnlPrevParad.Visible := False;
  pnlFicheros.Visible := False;
  pnlNombreValv.Visible := False;
  frmConfigurar.Width := 220;

  Close;
end;

procedure TfrmConfigurar.btnConfNomValClick(Sender: TObject);
begin
  pnlVisParadig.Visible := False;
  pnlPrevParad.Visible := False;
  pnlFicheros.Visible := False;
  pnlNombreValv.Visible := True;
  frmConfigurar.Width := 487;
end;

procedure TfrmConfigurar.btnFicherosClick(Sender: TObject);
begin
  pnlVisParadig.Visible := False;
  pnlPrevParad.Visible := False;
  pnlFicheros.Visible := True;
  pnlNombreValv.Visible := False;
  frmConfigurar.Width := 487;
  lblUbParadig.Caption := Pub_FicheroParadigmas;
  lblUbSTMP.Caption := Pub_FicheroSTMP;
end;

procedure TfrmConfigurar.btnParadigmasClick(Sender: TObject);
begin
  flbFicherosParad.Mask:= Pub_FicheroParadigmas + '\*.*';
  flbFicherosParad.Update;

  pnlVisParadig.Visible := False;
  pnlPrevParad.Visible := True;
  pnlFicheros.Visible := False;
  pnlNombreValv.Visible := False;
  frmConfigurar.Width := 487;
end;


procedure TfrmConfigurar.btnPrevisualizarClick(Sender: TObject);
var
  rutaArch: string;
  I: integer;
begin
  //Limpiar prev
  rutaArch := flbFicherosParad.FileName;
  NombreArch := ExtractFileName(rutaArch);
  if NombreArch <> '' then
  begin
    _ListValvulas := TParadigma.Create;

    _BorrarPaneles;
    for I := grdpDiagrama.ColumnCollection.Count - 1 downto 0 do
      grdpDiagrama.ColumnCollection[I].Destroy;

    rutaArch := flbFicherosParad.FileName;
    NombreArch := ExtractFileName(rutaArch);
    _ListValvulas.Cargar(Pub_FicheroParadigmas+'\',NombreArch);
    _Previsualizar;

    pnlVisParadig.Visible := True;
    frmConfigurar.Width := 1022;
  end
  else
    MostrarMensaje(0,'Mensaje de error','Seleccione Archivo');
end;

procedure TfrmConfigurar._Previsualizar;
var
  numColum: integer;
  col, row: integer;
begin
  pnlDiagrama.Width := Trunc(_ListValvulas.Long * 100) + 2;
  grdpDiagrama.Width := Trunc(_ListValvulas.Long * 100);
  scrbDiagrama.HorzScrollBar.Range := Trunc(_ListValvulas.Long * 100);

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
  for col := 0 to numColum - 1 do
  begin
    grdpDiagrama.ColumnCollection.Add;
    grdpDiagrama.ColumnCollection.Items[col].SizeStyle := ssAbsolute;
    grdpDiagrama.ColumnCollection.Items[col].Value := 100;

  end;
  grdpDiagrama.ColumnCollection.EndUpdate;

  _DibujarPanelTiempo;
  _Dibujar;

  scrbDiagrama.HorzScrollBar.Position := 0;
end;

procedure TfrmConfigurar._DibujarPanelTiempo;
var
  col : integer;
  row: integer;
  auxEstimulo: TEstimulo;
begin
  for col := 0 to _ListValvulas.Long - 1 do
  begin
    auxEstimulo := _ListValvulas.SacarItem(col);
    for row := 0 to 3 do
      _CrearPanel(row * 4, col, auxEstimulo.Time)
  end;

end;

procedure TfrmConfigurar._CrearPanel(aRow: Integer; aCol: Integer; tiempo: Integer);
var
  pnlAux: TPanel;
begin
  pnlAux := TPanel.Create(frmConfigurar);
  with pnlAux do
  begin
    Align := alClient;
    Alignment := taCenter;
    BorderStyle := bsSingle;
    BorderWidth := 0;
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

procedure TfrmConfigurar._CrearBoton(ARow: Integer; aCol: Integer; aID: string; aStat: Boolean);
var
  button: TBitBtn;
begin
  button := TBitBtn.Create(frmConfigurar);
  with button do
  begin
    Name := 'btb' + IntToStr(ARow) + aID;
    Align := alClient;
    if aStat then
      kind := bkYes
    else
      kind := bkNo;
    Caption := '';
    //OnClick := _btbClick;
  end;
  try
    grdpDiagrama.AddControlAtCell(button, aCol, ColValv[aRow]);
  except
    on E: Exception  do
    begin
      button.Free;
      Application.MessageBox( PChar( E.ClassName + ': ' + E.Message ), 'Error', MB_ICONSTOP );
    end;
  end;
  //button.Enabled := not aStat;
  button.Parent := grdpDiagrama;
  button.Visible := True;
end;

procedure TfrmConfigurar._PanelResp(ARow: Integer; aCol: Integer);
var
  pnlAux: TPanel;
begin
  pnlAux := TPanel.Create(frmConfigurar);
  with pnlAux do
  begin
    Align := alClient;
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

Procedure TfrmConfigurar._Dibujar;
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
        _CrearBoton(Nval,i, name, auxEstimulo.Val[Nval])
      else
        _PanelResp(ColValv[Nval], i);
    end;
  end;
end;

procedure TfrmConfigurar.btnCambiarFichSTMPClick(Sender: TObject);
var
  FDir: string;
  AIniFile : TIniFile;
  Ruta: string;
begin
  FDir := 'C:\';
  if SelectDirectory('Selecciona Directorio', ExtractFileDrive(FDir), FDir,
             [sdNewUI, sdNewFolder]) then
  begin
    MostrarMensaje(1,'Mensaje Confirmación',FDir);
    Pub_FicheroSTMP := FDir;
    Ruta := ExtractFilePath(Application.ExeName);
    AIniFile := TIniFile.Create(Ruta + 'Inic.ini');
    AIniFile.WriteString('FICHEROS PARADIGMAS','Fich',FDir);

  end;
end;

procedure TfrmConfigurar.btnCambiarFichParadClick(Sender: TObject);
var
  FDir: string;
  AIniFile : TIniFile;
  Ruta: string;
begin
  FDir := 'C:\';
  if SelectDirectory('Selecciona Directorio', ExtractFileDrive(FDir), FDir,
             [sdNewUI, sdNewFolder]) then
  begin
    MostrarMensaje(1,'Mensaje Confirmación',FDir);
    Pub_FicheroParadigmas := FDir;
    Ruta := ExtractFilePath(Application.ExeName);
    AIniFile := TIniFile.Create(Ruta + 'Inic.ini');
    AIniFile.WriteString('FICHEROS STMP','Fich',FDir);
  end;
  lblUbSTMP.Caption := Pub_FicheroSTMP;
end;


procedure TfrmConfigurar.btnGuardarClick(Sender: TObject);
var
  I: integer;
  edtAux: TEdit;
  save: Boolean;
  Ruta: string;
  ValvName : string;
  AIniFile : TIniFile;
begin
  save := true;
  for I := 0 to gpbEdts.ControlCount - 1 do
  begin
    edtAux := TEdit(gpbEdts.Controls[i]);
    if edtAux.Text = '' then
    begin
      MostrarMensaje(0,'Mensaje de error','Introduzca nombres válidos en todos los campos');
      save := False;
    end;
  end;
  if save = true then
  begin
    Ruta := ExtractFilePath(Application.ExeName);
    AIniFile := TIniFile.Create(Ruta + 'Inic.ini');   // se abre o se crea el archivo de inicio del sistema
    for I := 0 to gpbEdts.ControlCount -1 do
    begin
      //ValvName := AIniFile.ReadString('VALVULA', 'v' + IntToStr(I+1), 'Valvulas ' + IntToStr(I+1));
      edtAux := TEdit(gpbEdts.Controls[i]);
      AIniFile.WriteString('VALVULA', 'v' + IntToStr(I+1), edtAux.Text);
    end;
    AIniFile.Free;
    MostrarMensaje(1,'Mensaje de confirmación','Campos cambiados correctamente');
  end;


  frmAddValvulas.Actualizar;
//  frmAddValvulas.Enabled := True;
//  frmConfigurar.Close;

end;

procedure TfrmConfigurar.KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['a'..'z','A'..'Z','0'..'9', #7, #8, #13]) then
    begin
      Key := #0;
      MostrarMensaje(0,'Mensaje de error','Introduzca solo números y letras');
    end;
end;

procedure TfrmConfigurar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmAddValvulas.Enabled := True;
  frmAddValvulas.BringToFront;
end;

procedure TfrmConfigurar.FormShow(Sender: TObject);
var
  AIniFile : TIniFile; // Archivo de Inicio .INI   // USES IniFiles, // Manejo de Archivos .ini
  Ruta: string;
  ValvName: string;
  StrLst : TStringList;
  i: integer;
  edtAux : TEdit;
begin

  pnlFicheros.Visible := False;
  pnlNombreValv.Visible := False;
  frmConfigurar.Width := 220;
  //Ruta := 'C:\Users\alex\Documents\Embarcadero\Studio\Projects\valvulas_v8-0\valvulas_v8';
  Ruta := ExtractFilePath(Application.ExeName);
  AIniFile := TIniFile.Create(Ruta + 'Inic.ini');


  for i := 0 to 8 do // recorre todos los ítems de StrLst
  begin
    ValvName := AIniFile.ReadString('VALVULA', 'v' + IntToStr(I+1), 'Valvulas' + IntToStr(I+1));
    edtAux := TEdit(gpbEdts.Controls[i]);
    EdtAux.Text := ValvName;
  end;
  AIniFile.Free; // Cierra el Archivo y libera el objeto.

end;


end.
