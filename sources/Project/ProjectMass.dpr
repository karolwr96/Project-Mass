program ProjectMass;

uses
  Vcl.Forms,
  frmProjectMass in '..\View\frmProjectMass.pas' {FormProjectMass},
  frmSettings in '..\View\frmSettings.pas' {FormSettings},
  cManagerSettings in '..\Controller\cManagerSettings.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormProjectMass, FormProjectMass);
  Application.Run;
end.
