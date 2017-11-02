unit AddValvU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.StrUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.FileCtrl,
  Acces32, AIOUSB;//, DetectUnit;

type
  TfrmAddValvulas = class(TForm)
    gdpElementos: TGridPanel;
    rdgSelValvulas: TRadioGroup;
    btnComenzar: TButton;
    btnReset: TButton;
    btnSeleccionar: TButton;
    pnlTiempoCiclo: TPanel;
    lblTiempoCiclo: TLabel;
    edtTiempoCiclo: TEdit;
    pnlCicloInic: TPanel;
    lblCicloInicio: TLabel;
    edtCicloInic: TEdit;
    pnlInfo: TPanel;
    Label1: TLabel;
    memInsert: TMemo;
    pnlValvSelec: TPanel;
    lblTiempo: TLabel;
    lblTiempoReal: TLabel;
    btnConfigurar: TButton;
    Label2: TLabel;
    pnlFicheros: TPanel;
    Label19: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    flbFicheros: TFileListBox;
    RadioGroup2: TRadioGroup;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    btnSalir: TButton;
    procedure btnResetClick(Sender: TObject);
    procedure btnComenzarClick(Sender: TObject);
    procedure btnSeleccionarClick(Sender: TObject);
    procedure rdgSelValvulasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure Actualizar;
    procedure CargarParadigma(Tiempo: integer; FichNam: string);
    procedure btnConfigurarClick(Sender: TObject);
    procedure edtTiempoCicloKeyPress(Sender: TObject; var Key: Char);
    procedure Comprueba_Ficheros;
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
    _TotalTime: integer;
    procedure _readConfig;

  public
    { Public declarations }
  end;

var
  frmAddValvulas: TfrmAddValvulas;
  DeviceIndex: LONGWORD;

implementation

{$R *.dfm}

uses

  IniFiles, ConfigU, MostrarU, Global_Unit1;//, Principal_Unit1;

procedure TfrmAddValvulas.btnComenzarClick(Sender: TObject);
begin
  if edtCicloInic.Text = '0' then
  begin
    Showmessage('Introduzca válvulas antes de comenzar');
    exit;
  end;

  if Radiobutton10.Checked = True then
  begin
    Global_Unit1.Graba_Fichero:=1;
  end
  else
  begin
    Global_Unit1.Graba_Fichero:=0;
  end;
  Comprueba_Ficheros();

  frmMostrar.ShowModal;
end;

procedure TfrmAddValvulas.btnConfigurarClick(Sender: TObject);
begin
//  frmAddValvulas.Hide;
  frmAddValvulas.Enabled := False;
  frmConfigurar.ShowModal;
end;

procedure TfrmAddValvulas.btnResetClick(Sender: TObject);
begin
  frmMostrar.DelLista;
  frmMostrar.CrearLista;
  _TotalTime := 0;
  lblTiempo.Caption := 'Tiempo: 0';
  edtCicloInic.Text := '0';
  edtTiempoCiclo.Text := '0';
  frmMostrar.BorrarPanel;
  memInsert.Clear;
  Comprueba_Ficheros();
end;

procedure TfrmAddValvulas.btnSalirClick(Sender: TObject);
begin
  frmMostrar.BorrarPanel;
  frmMostrar.DelLista;
  _TotalTime := 0;
  lblTiempo.Caption := 'Tiempo: 0';
  edtCicloInic.Text := '0';
  edtTiempoCiclo.Text := '0';
  memInsert.Clear;
  //Form1.Enabled := True;
  Close;
end;

procedure TfrmAddValvulas.btnSeleccionarClick(Sender: TObject);
var
  Nombre, Id: string;
  TInic, TCiclo, IndValv: integer;
begin
  if rdgSelValvulas.ItemIndex <= -1 then
  begin
    ShowMessage('Seleccione una Válvula');
    exit;
  end;
  if (edtTiempoCiclo.Text = '') or (StrToInt(edtTiempoCiclo.Text) <= 0) then
  begin
    edtTiempoCiclo.Clear;
    ShowMessage('Introduzca un valor de Tiempo Valido');
    exit;
  end;

  IndValv:= rdgSelValvulas.ItemIndex;
  TInic := StrToInt(edtCicloInic.Text);
  TCiclo := StrToInt(edtTiempoCiclo.Text);
  Nombre := 'estimulo' + edtCicloInic.Text + edtTiempoCiclo.Text;
  Id := 'estimulo' + edtCicloInic.Text + edtTiempoCiclo.Text;

  try
    frmMostrar.AddItem(Nombre, Id, TCiclo, TInic,IndValv,1);
    if _TotalTime < (TInic + TCiclo)  then
    begin
      _TotalTime := TInic + TCiclo;
      lblTiempo.Caption := 'Tiempo: ' + FloatToStr(_TotalTime);
    end;
    memInsert.Lines.Add('Insertado Estímulo de '+ Nombre +' de duración: ' + edtTiempoCiclo.Text + 'ms.');
  except
    showmessage('Estímulo creado anteriormente');

  end;

  rdgSelValvulas.ItemIndex := -1;
  edtTiempoCiclo.Clear;
  edtCicloInic.Text := IntToStr(_TotalTime);
end;


procedure TfrmAddValvulas.edtTiempoCicloKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
  begin
    btnSeleccionar.SetFocus;
    btnSeleccionarClick(Sender);
  end;
end;

procedure TfrmAddValvulas.FormCreate(Sender: TObject);
var
  AIniFile : TIniFile; // Archivo de Inicio .INI   // USES IniFiles, // Manejo de Archivos .ini
  Ruta: string;
  i: integer;
  //DetectForm: TDetectForm;
  Status: DWord;
  outData: DWord;
begin
  frmMostrar.CrearLista;
  _TotalTime := 0;

  Ruta := ExtractFilePath(Application.ExeName); // CAMBIAR!!!
  //memInsert.Lines.Add(Ruta);
  if FileExists(Ruta + 'Inic.ini') then
    _readConfig
  else
  begin
    AIniFile := TIniFile.Create(Ruta + '\Inic.ini');
    for I := 0 to rdgSelValvulas.Items.Count - 1 do
      AIniFile.WriteString('VALVULA', 'v' + IntToStr(I+1), 'Válvula' + IntToStr(I+1));
    AIniFile.WriteString('FICHEROS PARADIGMAS','Fich','C:\Ficheros_Rutinas\');
    Pub_FicheroParadigmas := 'C:\Ficheros_Rutinas\';
    AIniFile.WriteString('FICHEROS STMP','Fich','C:\Ficheros_STMP\');
    Pub_FicheroParadigmas := 'C:\Ficheros_STMP\';
    AIniFile.Free;
  end;

  Comprueba_Ficheros();

//  DeviceIndex := diOnly;
//
//    Status := QueryDeviceInfo(DeviceIndex, nil, nil, nil, nil, nil);
//
//    if Status <> ERROR_SUCCESS then
//    begin
//
//        DetectForm := TDetectForm.Create(Self);
//        if DetectForm.ShowModal = mrOK then begin
//            DeviceIndex := DetectForm.DeviceIndex;
//            DetectForm.Free;
//        end
//        else begin
//            DetectForm.Free;
//            Application.Terminate;
//            Exit;
//        end;
//    end;
//
//  outData := $00000000;
//
//  DIO_WriteAll(DeviceIndex, @outData);

end;


procedure TfrmAddValvulas.rdgSelValvulasClick(Sender: TObject);
begin
  edtTiempoCiclo.SetFocus;
end;

procedure TfrmAddValvulas._readConfig;
var
  AIniFile : TIniFile; // Archivo de Inicio .INI   // USES IniFiles, // Manejo de Archivos .ini
  Ruta: string;
  ValvName : string;
  RutaFichParad: string;
  i: integer;
begin
  Ruta := ExtractFilePath(Application.ExeName); // CAMBIAR!!!
  //Ruta := 'C:\Users\alex\Documents\Embarcadero\Studio\Projects\valvulas_v8-0\valvulas_v8';
  AIniFile := TIniFile.Create(Ruta + 'Inic.ini');
  for i := 0 to rdgSelValvulas.Items.Count - 1 do
  begin
    ValvName := AIniFile.ReadString('VALVULA', 'v' + IntToStr(I+1), 'Válvula' + IntToStr(I+1));
    rdgSelValvulas.Items[i] := ValvName;
  end;
  RutaFichParad := AIniFile.ReadString('FICHEROS PARADIGMAS','Fich','C:\Ficheros_Rutinas\');
  Pub_FicheroParadigmas := RutaFichParad;
  Pub_FicheroSTMP := AIniFile.ReadString('FICHEROS STMP','Fich','C:\Ficheros_STMP\');
  AIniFile.Free; // Cierra el Archivo y libera el objeto.
end;

procedure TfrmAddValvulas.Actualizar;
begin
  _readConfig;
end;

procedure TfrmAddValvulas.CargarParadigma(Tiempo: Integer;FichNam: string);
begin
  lblTiempo.Caption := 'Tiempo: ' + IntToStr(Tiempo);
  edtCicloInic.Text := IntToStr(Tiempo);
  memInsert.Clear;
  memInsert.Lines.Add('Cargado Fichero Paradigma: ' + FichNam);
end;

procedure TfrmAddValvulas.Comprueba_Ficheros();
var
  NombreArchivo, FechaStr : String;
  Nom_Ult_Fich : String;
  Ficheros_en_DIR, Num_Ult_Fich, code : Integer;
begin
  FechaStr:=DateToStr(Date);
  NombreArchivo:='STMP'+LeftStr(FechaStr,2)+MidStr(FechaStr,4,2)+RightStr(FechaStr,2);
  flbFicheros.Mask:=Pub_FicheroSTMP+NombreArchivo+'*.*'; // Ojo al instalar,
  flbFicheros.Update;                                 //está contenido en el Label3
  Ficheros_en_DIR:=flbFicheros.Count-1;
  FechaStr:=DateToStr(Date);
  if Ficheros_en_DIR = -1 then
    begin
     NombreArchivo:='STMP'+LeftStr(FechaStr,2)+MidStr(FechaStr,4,2)+RightStr(FechaStr,2);
     frmAddValvulas.Label17.Caption:='No existen Ficheros';
     NombreArchivo:=NombreArchivo+'_000.txt';
     frmAddValvulas.Label18.Caption:=frmAddValvulas.Label19.Caption+'\'+NombreArchivo;
    end
   else
    begin
      flbFicheros.Selected[Ficheros_en_DIR]:=True;
      Nom_Ult_Fich:=RightStr(flbFicheros.FileName,18);
      Val(MidStr(Nom_Ult_Fich,12,3), Num_Ult_Fich, code);
      Num_Ult_Fich:=Num_Ult_Fich+1;
      NombreArchivo:=NombreArchivo+RightStr(flbFicheros.FileName,18);

       if (Num_Ult_Fich>0) and (Num_Ult_Fich<10) then
          begin
            NombreArchivo:=LeftStr(NombreArchivo,11)+'_00'+IntToStr(Num_Ult_Fich)+'.txt';
          end;

       if (Num_Ult_Fich>9) and (Num_Ult_Fich<100) then
          begin
            NombreArchivo:=LeftStr(NombreArchivo,11)+'_0'+IntToStr(Num_Ult_Fich)+'.txt';
          end;

       if (Num_Ult_Fich>99) then
          begin
            NombreArchivo:=LeftStr(NombreArchivo,11)+'_'+IntToStr(Num_Ult_Fich)+'.txt';
          end;
      frmAddValvulas.Label17.Caption:='Existen '+IntToStr(Ficheros_en_DIR+1)+' Ficheros en el directorio.';
      frmAddValvulas.Label18.Caption:=NombreArchivo;
    end;
  Global_Unit1.Pub_NombreArchivo:=NombreArchivo;
end;


end.
