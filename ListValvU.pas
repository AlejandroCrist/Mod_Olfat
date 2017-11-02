unit ListValvU;

interface

uses
  Classes, ComCtrls, Vcl.Samples.Gauges, ExtCtrls, System.SysUtils,Vcl.Dialogs,//System.DateUtils, Vcl.StdCtrls,Vcl.Dialogs,
  //Windows, ComCtrls;
  QProgBar;
type
  TEstimulo = class(TObject)
  private
    FName: string;
    FID: string;
    FTime: integer;
    FInic: integer;
    FVal : array[0..8] of boolean;
    FRepos : Boolean;
    FIndex: integer;
    FNumVal: integer;
    FPgb: TQProgressBar;
    function GetVal(Index: Integer): boolean;
  public
    Constructor Create(aName, aId: string; aTime, aInic, index, numVal: integer);
    property Name: string read FName;
    property Time: integer read FTime;
    property Inic: integer read FInic;
    property ID: string read FID;
    property Repos: boolean read FRepos;
    property Ind: integer read FIndex;
    property Val[Index: Integer]: boolean read GetVal;
    property NumVal: integer read FNumVal;
    procedure habValvula(index: integer);
    procedure deshabValvula(index: integer);
    procedure SetProgressBar(aPgb: TQProgressBar);
    procedure SetNumVal(aNumVal: integer);
    function GetProgressBar: TQProgressBar;
  end;

type
  TParadigma = class(TObject)
  private
    Lista: TStringList;
    FLong: integer;
    FTotal: integer;
  public
    Constructor Create();
    procedure AddValCarga(aId: string; aList: TStringlist; numVal: integer);
    procedure AddItem(aName, aId: string; aTime, aInic, index, numVal: integer);
    procedure DeleteItem(aId: string);
    procedure Inicializar;
    procedure Borrar;
    procedure Guardar(ruta: string; nomFich: string);
    procedure Cargar(ruta: string; nomFich: string);
    procedure AddVal(aId: string; aIndex: integer);
    procedure DelVal(aId: string; aIndex: integer);
    procedure SetProgressBar(aId: string; aPgb: TQProgressBar);
    function SacarItem(Indice: integer): TEstimulo;
    function TiempoValvula(aID: string): integer;
    function Maximo: integer;
    property Long: integer read FLong;
    property Total: integer read FTotal;
  private
    procedure split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
  end;

implementation

{TEstimulo}
Constructor TEstimulo.Create(aName,aId: string;  aTime, aInic, index, numVal: integer);
var i: integer;
begin
   self.FName:= aName;
   self.FTime:= aTime;
   self.FInic:= aInic;
   self.FID := aId;
   self.FIndex := index;
   for i := 0 to 8 do
   if i = index then
     self.FVal[i] := true
   else
    self.FVal[i]:= false;

   if index = 8 then
     self.FRepos := True;

   self.FNumVal := numVal;
end;

procedure TEstimulo.habValvula(index: Integer);
begin
  self.FVal[index] := True;
  Inc(self.FNumVal);
end;

procedure TEstimulo.deshabValvula(index: Integer);
begin
  self.FVal[index] := False;
  Dec(self.FNumVal);
end;

function TEstimulo.GetVal(Index: Integer): boolean;
begin
  Result:= Fval[index];
end;

procedure TEstimulo.SetProgressBar(aPgb: TQProgressBar);
begin
  self.FPgb:= aPgb;
end;

procedure TEstimulo.SetNumVal(aNumVal: integer);
begin
  self.FNumVal := aNumVal;
end;

function TEstimulo.GetProgressBar;
begin
  Result := FPgb;
end;

{TParadigma}
procedure TParadigma.AddItem(aName, aId: string; aTime, aInic, index, numVal: integer);
var
  AuxEstimulo: TEstimulo;
  I: integer;
begin
  AuxEstimulo := TEstimulo.Create(aName,aId,aTime,aInic,index,numVal);
  if Lista.Count = 0 then
    begin
      Lista.InsertObject(0,aId,AuxEstimulo);
      Inc(FLong);
      FTotal := aInic + aTime;
      exit;
    end
  else
    for I := 0 to (Lista.Count-1) do
      if TEstimulo(Lista.Objects[I]).Inic > AuxEstimulo.Inic then
        begin
          Lista.InsertObject(I,aId,AuxEstimulo);
          Inc(FLong);
          exit;
        end;
  Lista.AddObject(aId,AuxEstimulo);
  Inc(FLong);
  FTotal := aInic + aTime;
end;

procedure TParadigma.AddValCarga(aId: string; aList: TStringlist; numVal: integer);
var
  auxEstimulo: TEstimulo;
  i: integer;
begin
  auxEstimulo := TEstimulo(Lista.Objects[Lista.IndexOf(aId)]);
  for i := 0 to aList.Count - 1 do
    if aList[i] = '-1' then
      auxEstimulo.habValvula(i)
    else
      auxEstimulo.deshabValvula(i);
  auxEstimulo.SetNumVal(numVal);
end;

procedure TParadigma.AddVal(aId: string; aIndex: Integer);
var
  auxEstimulo: TEstimulo;
begin
  auxEstimulo := TEstimulo(Lista.Objects[Lista.IndexOf(aId)]);
  auxEstimulo.habValvula(aIndex);
end;

procedure TParadigma.DelVal(aId: string; aIndex: Integer);
var
  auxEstimulo: TEstimulo;
begin
  auxEstimulo := TEstimulo(Lista.Objects[Lista.IndexOf(aId)]);
  if auxEstimulo.NumVal = 1 then
  begin
    raise Exception.Create('No es posible eliminar valvula, añada una antes de eliminar está');
    exit;
  end;
  auxEstimulo.deshabValvula(aIndex);
end;

procedure TParadigma.SetProgressBar(aId: string; aPgb: TQProgressBar);
var
  auxEstimulo: TEstimulo;
begin
  auxEstimulo := TEstimulo(Lista.Objects[Lista.IndexOf(aId)]);
  auxEstimulo.SetProgressBar(aPgb);
end;

procedure TParadigma.DeleteItem(aId: string);
var
  auxEstimulo: TEstimulo;
begin
  Lista.Delete(Lista.IndexOf(aId));
  Dec(FLong);
  auxEstimulo := TEstimulo(Lista.Objects[FLong]);
  FTotal := auxEstimulo.FInic + auxEstimulo.FTime;
end;

function TParadigma.SacarItem(Indice: integer): TEstimulo;
begin
  Result := TEstimulo(Lista.Objects[Indice]);
end;

function TParadigma.TiempoValvula(aID: string): integer;
begin
  Result := Trunc(SacarItem(Lista.IndexOf(aId)).FTime);
end;

function TParadigma.Maximo: integer;
var
  i, max, tiempo: integer;
begin
  max := 0;
  for i := 0 to Lista.Count -1 do
  begin
    tiempo := TEstimulo(Lista.Objects[i]).FInic + Trunc(TEstimulo(Lista.Objects[i]).FTime);
    if tiempo > Max then
      max := tiempo;
  end;
  Result := max;
end;

procedure TParadigma.Inicializar;
begin
  FLong := 0;
  FTotal := 0;
end;

procedure TParadigma.Borrar;
var
  i: integer;
begin
  for i := 0 to Lista.Count -1 do
  begin
    Lista.Objects[i].Free;
  end;
  Lista.Free;
  FLong := 0;
  FTotal := 0;
end;

procedure CalculaHash(rutaFich: string; var hash: string);
var
  Archivo : TextFile;
  ModifyDT: TDateTime;
  Size: extended;
begin
  ModifyDT := FileDateToDateTime(FileAge(rutaFich));
  AssignFile(Archivo, rutaFich);
  Reset(Archivo);
  Size := FileSize(Archivo);
  CloseFile(Archivo);
  hash := FloatToStr((ModifyDT + Size)* pi + exp(1));
end;

procedure TParadigma.Guardar(ruta: String; nomFich: string);
var
  i,j: integer;
  valvsSelec: string;
  linea: string;
  Archivo : TextFile;
  ArchivoHash: TextFile;
  Hash: string;
begin
  //ListaValvulas.SaveToFile(ruta+nombre);
  AssignFile(Archivo, nomFich);
  try
    Rewrite(Archivo);
    Except
    begin
      raise Exception.Create('Error al crear fichero.');
      exit
    end;
  end;
  for i := 0 to Lista.Count -1 do
  begin
    valvsSelec := boolTostr(TEstimulo(Lista.Objects[i]).FVal[0]);
    for j := 1 to 8 do
      valvsSelec := valvsSelec + ',' + boolTostr(TEstimulo(Lista.Objects[i]).FVal[j]);
    linea := TEstimulo(Lista.Objects[i]).Name
              +'/'+ TEstimulo(Lista.Objects[i]).ID
              +'/'+ IntToStr(TEstimulo(Lista.Objects[i]).Inic)
              +'/'+ IntToStr(TEstimulo(Lista.Objects[i]).Time)
              +'/'+ valvsSelec
              +'/'+ booltostr(TEstimulo(Lista.Objects[i]).Repos)
              +'/'+ inttostr(TEstimulo(Lista.Objects[i]).Ind)
              +'/'+ IntToStr(TEstimulo(Lista.Objects[i]).NumVal);
    WriteLn(Archivo, linea);
    valvsSelec := '';
  end;
  CloseFile(Archivo);

  CalculaHash(nomFich, hash);

  AssignFile(ArchivoHash, ruta + '\ficheroHash.txt');
  try
    if FileExists(ruta + '\ficheroHash.txt') then
      Append(ArchivoHash)
    else
      Rewrite(ArchivoHash);
  Except
    raise Exception.Create('Error al crear fichero Hash.');
    exit
  end;

  WriteLn(ArchivoHash, hash);
  CloseFile(ArchivoHash);
  FileSetAttr(ruta + '\ficheroHash.txt', faHidden, True);
end;

procedure TParadigma.Cargar(ruta: string; nomFich: string);
var
  linea: string;
  Archivo: TextFile;
  ArchivoHash: TextFile;
  OutPutList: TStringList;
  listaVal: TStringList;
  Hash, HashC: string;
  Valido: boolean;
begin
  Valido := False;
  OutPutList := TStringList.Create;
  listaVal := TStringList.Create;
  AssignFile(Archivo, ruta + nomFich);
  try
    Reset(Archivo);
  Except
    begin
      raise Exception.Create('Error al leer el archivo: '+ ruta );
      exit
    end;
  end;
  while not Eof(Archivo) do begin
    Readln(Archivo, linea);
    try
      Split('/', linea, OutPutList) ;
      Split(',',OutPutList[4],listaVal);
      AddItem(OutPutList[0],OutPutList[1],StrtoInt(OutPutList[3])
              ,StrtoInt(OutPutList[2]),StrtoInt(OutPutList[6]),0);
      AddValCarga(OutPutList[1], listaVal, StrToInt(OutPutList[7]));
    except  begin
      raise Exception.Create('Error al leer la linea');
      exit
    end;

    end;
  end;
  OutPutList.Free;
  CloseFile(Archivo);

  AssignFile(ArchivoHash, ruta + '\ficheroHash.txt');
  try
    Reset(ArchivoHash);
  Except
    raise Exception.Create('Error al crear fichero Hash.');
    exit
  end;

  CalculaHash(ruta + nomFich, HashC);
  while not Eof(ArchivoHash) do begin
    Readln(ArchivoHash, Hash);
    if HashC = Hash then
      Valido := True;
  end;

  CloseFile(ArchivoHash);
  if not Valido then
  begin
    Borrar;
    raise Exception.Create('Error al leer el archivo. Integridad comprometida.');
      exit
  end;
end;

procedure TParadigma.Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
begin
   ListOfStrings.Clear;
   ListOfStrings.Delimiter       := Delimiter;
   ListOfStrings.StrictDelimiter := True; // Requires D2006 or newer.
   ListOfStrings.DelimitedText   := Str;
end;

Constructor TParadigma.Create;
begin
  self.Lista := TStringList.Create;
  self.FLong := 0;
  self.FTotal := 0;
end;

end.
