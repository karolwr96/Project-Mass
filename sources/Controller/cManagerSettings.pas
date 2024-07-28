unit cManagerSettings;

interface

uses
  Classes, cItemSettings;

type
TManagerSettings = class
  private
    FItemSettings : TItemSettings;
    FItemSettingsTmp : TItemSettings;
    FPathToFile : string;

    class var FInstance : TManagerSettings;
    constructor CreateInstance;
    destructor Destroy(); override;
  public
    property ItemSettings : TItemSettings read FItemSettings;
    property ItemSettingsTmp : TItemSettings read FItemSettingsTmp write FItemSettingsTmp;

    function SaveToFile : Boolean;
    procedure ReadFromFile;

    constructor Create(); overload;
    class function Instance : TManagerSettings; //Instance odpowiada za przydzielanie pamiêci do przechowywania nowej instancji klasy
    class procedure ReleaseInstance; //ReleaseInstance jest odpowiedzialne za zwalnianie pamiêci, gdy klasa zostanie zniszczona
end;


implementation

uses
  SysUtils, uIniXml;

{ TManagerSettings }

constructor TManagerSettings.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('Access class %s through Instance only', [ClassName]);
end;

constructor TManagerSettings.CreateInstance;
begin
  inherited Create;
  // Zainicjuj/stwórz tutaj prywatne zmienne
  FItemSettings := TItemSettings.Create;
  FItemSettingsTmp := TItemSettings.Create;
  FPathToFile := IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0))) + 'PMSettings.xml';
end;

destructor TManagerSettings.Destroy;
begin
  //Zniszcz tutaj prywatne zmienne
  FItemSettings.Free;
  FItemSettingsTmp.Free;

  inherited;
end;


class function TManagerSettings.Instance: TManagerSettings;
begin
  //Instance odpowiada za przydzielanie pamiêci do przechowywania nowej instancji klasy
  if FInstance = Nil then FInstance := TManagerSettings.CreateInstance;
  Result := FInstance;
end;

procedure TManagerSettings.ReadFromFile;
var iniTmp : TIniXml;
begin
  //zapis do pliku
  iniTmp := TIniXml.Create(FPathToFile);
  Try
    Try
      FItemSettings.DbServerName := iniTmp.ReadParamStr('BD/BD_SERVER');
      FItemSettings.DbLogin := iniTmp.ReadParamStr('BD/BD_LOGIN');
      FItemSettings.DbPass := iniTmp.ReadParamStr('BD/BD_PASS');
      FItemSettings.DbPath := iniTmp.ReadParamStr('BD/BD_PATH');




    Except
      //powinno byæ obs³u¿one
    End;
  Finally
    iniTmp.Free;
  End;
end;

class procedure TManagerSettings.ReleaseInstance;
begin
  //ReleaseInstance jest odpowiedzialne za zwalnianie pamiêci, gdy klasa zostanie zniszczona
  FInstance.Free;
end;

function TManagerSettings.SaveToFile: Boolean;
var iniTmp : TIniXml;
begin
  Result := False;

  //zapis do pliku
  iniTmp := TIniXml.Create(FPathToFile);
  Try
    Try
      iniTmp.WriteParam('BD/BD_SERVER', FItemSettingsTmp.DbServerName);
      iniTmp.WriteParam('BD/BD_LOGIN', FItemSettingsTmp.DbLogin);
      iniTmp.WriteParam('BD/BD_PASS', FItemSettingsTmp.DbPass);
      iniTmp.WriteParam('BD/BD_PATH', FItemSettingsTmp.DbPath);
      Result := True;
    Except
      //powinno byæ obs³u¿one
    End;
  Finally
    iniTmp.Free;
  End;
end;

end.

