unit frmProjectMass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFormProjectMass = class(TForm)
    barMain: TToolBar;
    btnClose: TToolButton;
    separatorBarMain1: TToolButton;
    btnOpenSettings: TToolButton;
    separatorBarMain2: TToolButton;
    btnAddContractor: TToolButton;
    separatorBarMain3: TToolButton;
    btnAddProduct: TToolButton;
    actionListMainMenu: TActionList;
    actClose: TAction;
    actSettings: TAction;
    actContractor: TAction;
    procedure actCloseExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actContractorExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProjectMass: TFormProjectMass;

implementation

{$R *.dfm}

uses
  frmSettings, cManagerSettings, frmAddContractor;

procedure TFormProjectMass.actCloseExecute(Sender: TObject);
begin
  Application.MainForm.Close();
end;

procedure TFormProjectMass.actContractorExecute(Sender: TObject);
begin
if FormAddContractor = nil then
  begin
  FormAddContractor := TFormAddContractor.Create(Application);
  FormAddContractor.ShowModal();
  end;
end;

procedure TFormProjectMass.actSettingsExecute(Sender: TObject);
begin
 if FormSettings = nil then
    FormSettings := TFormSettings.Create(Application);
    if FormSettings.ShowModal = mrOk then begin
    ShowMessage('Poprawnie zapisano ustawienia!');
  end;
end;

procedure TFormProjectMass.FormCreate(Sender: TObject);
begin
  TManagerSettings.Instance.ReadFromFile;
end;

end.
