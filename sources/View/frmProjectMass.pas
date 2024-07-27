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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProjectMass: TFormProjectMass;

implementation

{$R *.dfm}

end.
