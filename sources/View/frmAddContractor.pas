unit frmAddContractor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls;

type
  TFormAddContractor = class(TForm)
    actAddContractor: TActionList;
    lblContractorName: TLabel;
    lblPostCode: TLabel;
    lblTown: TLabel;
    lblStreet: TLabel;
    lblHouseNumber: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAddContractor: TFormAddContractor;

implementation

{$R *.dfm}

procedure TFormAddContractor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormAddContractor.FormDestroy(Sender: TObject);
begin
  FormAddContractor := nil;
end;

end.
