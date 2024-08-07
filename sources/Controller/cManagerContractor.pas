unit cManagerContractor;

interface

uses
  Classes, cItemContractor;

type
TManagerContractor = class
 private
    FPathToFile : string;
    FItemContractor : TItemContractor;
    //TItemContractor : TItemContractor;

    class var FInstance : TManagerContractor;
    constructor CreateInstance;

  public
    property ItemContractor : TItemContractor read FItemContractor write FItemContractor;

    function SaveToFile: Boolean;
    constructor Create(); overload;
    destructor Destroy(); override;

    class function Instance : TManagerContractor; //Instance odpowiada za przydzielanie pami�ci do przechowywania nowej instancji klasy
    class procedure ReleaseInstance; //ReleaseInstance jest odpowiedzialne za zwalnianie pami�ci, gdy klasa zostanie zniszczona
end;


implementation

uses
  SysUtils, uIniXml;

{ TManagerSettings }

constructor TManagerContractor.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('Access class %s through Instance only', [ClassName]);
end;

constructor TManagerContractor.CreateInstance;
begin
  inherited Create;
  // Zainicjuj/stw�rz tutaj prywatne zmienne
  FItemContractor := TItemContractor.Create;
  FPathToFile := IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0))) + 'Contractors.xml';
end;


destructor TManagerContractor.Destroy;
begin
  //Zniszcz tutaj prywatne zmienne
  FItemContractor.Free;

  inherited;
end;

class function TManagerContractor.Instance: TManagerContractor;
begin
  //Instance odpowiada za przydzielanie pami�ci do przechowywania nowej instancji klasy
  if FInstance = Nil then FInstance := TManagerContractor.CreateInstance;
  Result := FInstance;
end;


class procedure TManagerContractor.ReleaseInstance;
begin
  //ReleaseInstance jest odpowiedzialne za zwalnianie pami�ci, gdy klasa zostanie zniszczona
  FInstance.Free;
end;

function TManagerContractor.SaveToFile: Boolean;
var iniTmp : TIniXml;
begin
  Result := False;

  //zapis do pliku
  iniTmp := TIniXml.Create(FPathToFile);
  Try
    Try
      iniTmp.WriteParam('CONTRACTOR/C_NAME', FItemContractor.Name);
      iniTmp.WriteParam('CONTRACTOR/C_POST_CODE', FItemContractor.PostCode);
      iniTmp.WriteParam('CONTRACTOR/C_TOWN', FItemContractor.Town);
      iniTmp.WriteParam('CONTRACTOR/C_STREET', FItemContractor.Street);
      iniTmp.WriteParam('CONTRACTOR/C_HOUSE_NUMBER', FItemContractor.HouseNumber);
      Result := True;
    Except
      //powinno by� obs�u�one
    End;
  Finally
    iniTmp.Free;
    Result := True;
  End;
end;

end.
