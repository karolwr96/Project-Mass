program ProjectMass;

uses
  Vcl.Forms,
  frmProjectMass in '..\View\frmProjectMass.pas' {FormProjectMass},
  frmSettings in '..\View\frmSettings.pas' {FormSettings},
  cManagerSettings in '..\Controller\cManagerSettings.pas',
  uIniXml in '..\Helper\uIniXml.pas',
  uEncryptStr in '..\Helper\uEncryptStr.pas',
  cItemSettings in '..\Model\cItemSettings.pas',
  frmAddContractor in '..\View\frmAddContractor.pas' {FormAddContractor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormProjectMass, FormProjectMass);
  Application.Run;
end.
