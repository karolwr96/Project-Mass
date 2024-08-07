unit frmAddContractor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls;

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
    pnlBottomContractor: TPanel;
    pnlTopContractor: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actAddContractorExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAddContractor: TFormAddContractor;

implementation

{$R *.dfm}

uses cManagerContractor;


procedure TFormAddContractor.actAddContractorExecute(Sender: TObject);
begin
  with TManagerContractor.Instance do begin
    ItemContractor.Name := edtContractorName.Text;
    ItemContractor.PostCode := edtPostCode.Text;
    ItemContractor.Town := edtTown.Text;
    ItemContractor.Street := edtStreet.Text;
    ItemContractor.HouseNumber := edtHouseNumer.Text;
    if SaveToFile() then begin
     // ItemSettings.AssignValues(ItemSettingsTmp);
      ModalResult := mrOk;
    end else begin
      ShowMessage('B��d zapisu');
    end;
  end;
end;

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
