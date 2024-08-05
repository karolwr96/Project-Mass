unit frmAddContractor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls;

type
  TFormAddContractor = class(TForm)
    actContractor: TActionList;
    lblContractorName: TLabel;
    lblPostCode: TLabel;
    lblTown: TLabel;
    lblStreet: TLabel;
    lblHouseNumber: TLabel;
    edtContractorName: TEdit;
    edtPostCode: TEdit;
    edtTown: TEdit;
    edtStreet: TEdit;
    edtHouseNumer: TEdit;
    btnClose: TButton;
    btnAddContractor: TButton;
    actClose: TAction;
    actAddContractor: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAddContractor: TFormAddContractor;

implementation

{$R *.dfm}


procedure TFormAddContractor.actCloseExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormAddContractor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormAddContractor.FormDestroy(Sender: TObject);
begin
  FormAddContractor := nil;
end;

procedure TFormAddContractor.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

end.
