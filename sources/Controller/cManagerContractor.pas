unit cManagerContractor;

interface

uses
  Classes, cItemSettings;

type
TManagerContractor = class
  private

  public

    constructor Create(); overload;
    destructor Destroy(); override;

end;


implementation

uses
  SysUtils, uIniXml;

{ TManagerSettings }

constructor TManagerContractor.Create;
begin
  inherited Create;
  //raise Exception.CreateFmt('Access class %s through Instance only', [ClassName]);
end;


destructor TManagerContractor.Destroy;
begin
  //Zniszcz tutaj prywatne zmienne
 // FItemSettings.Free;
 // FItemSettingsTmp.Free;

  inherited;
end;

end.
