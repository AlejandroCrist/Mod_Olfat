program Mod_Olfat;

uses
  Vcl.Forms,
  ConfigU in 'ConfigU.pas' {frmConfigurar},
  Global_Unit1 in 'Global_Unit1.pas',
  GridU in 'GridU.pas',
  ListValvU in 'ListValvU.pas',
  MostrarU in 'MostrarU.pas' {frmMostrar},
  QProgBar in 'QProgBar.pas',
  AddValvU in 'AddValvU.pas' {frmAddValvulas},
  ACCES32 in 'ACCES32.pas',
  AIOUSB in 'AIOUSB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAddValvulas, frmAddValvulas);
  Application.CreateForm(TfrmConfigurar, frmConfigurar);
  Application.CreateForm(TfrmMostrar, frmMostrar);
  Application.Run;
end.
