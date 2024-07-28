unit frmSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormSettings = class(TForm)
    edtDbName: TEdit;
    lblDbName: TLabel;
    lblDbServer: TLabel;
    lblDbUser: TLabel;
    lblDbPassword: TLabel;
    edtDbServer: TEdit;
    edtDbUser: TEdit;
    edtDbPassword: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSettings: TFormSettings;

implementation

{$R *.dfm}


procedure TFormSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormSettings.FormDestroy(Sender: TObject);
begin
  FormSettings := nil;
end;


end.
