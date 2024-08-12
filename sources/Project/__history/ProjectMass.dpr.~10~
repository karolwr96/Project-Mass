program ProjectMass;

uses
  Vcl.Forms,
  frmProjectMass in '..\View\frmProjectMass.pas' {barMain},
  frmSettings in '..\View\frmSettings.pas' {FormSettings},
  cManagerSettings in '..\Controller\cManagerSettings.pas',
  uIniXml in '..\Helper\uIniXml.pas',
  uEncryptStr in '..\Helper\uEncryptStr.pas',
  cItemSettings in '..\Model\cItemSettings.pas',
  frmAddContractor in '..\View\frmAddContractor.pas' {FormAddContractor},
  cManagerContractor in '..\Controller\cManagerContractor.pas',
  cItemContractor in '..\Model\cItemContractor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TbarMain, barMain);
  Application.Run;
end.
