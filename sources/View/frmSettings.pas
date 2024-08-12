unit frmSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxButtons, Data.DB, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys, FireDAC.Comp.Client,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait,
  FireDAC.Phys.SQLiteVDataSet, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Error, FireDAC.Comp.UI, FireDAC.VCLUI.Login,
  FireDAC.Phys.IBWrapper, FireDAC.Phys.IBBase, DBAccess, Uni, MemDS;

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
    btnSaveSettings: TButton;
    btnClose: TButton;
    actSettings: TActionList;
    actCloseSettings: TAction;
    actSaveSettings: TAction;
    pnlBottomSettings: TPanel;
    pnlTopSettings: TPanel;
    UniConnection1: TUniConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actCloseSettingsExecute(Sender: TObject);
    procedure actSaveSettingsExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    constructor Create(AOwner : TComponent); reintroduce; overload;
  end;

var
  FormSettings: TFormSettings;

implementation

{$R *.dfm}

uses cManagerSettings, MySQLUniProvider;

procedure TFormSettings.actSaveSettingsExecute(Sender: TObject);
begin
  with TManagerSettings.Instance do begin
    ItemSettingsTmp.DbPath := edtDbName.Text;
    ItemSettingsTmp.DbServerName := edtDbServer.Text;
    ItemSettingsTmp.DbLogin := edtDbUser.Text;
    ItemSettingsTmp.DbPass := edtDbPassword.Text;
    if SaveToFile() then begin
      ItemSettings.AssignValues(ItemSettingsTmp);
      ModalResult := mrOk;
    end else begin
      ShowMessage('B��d zapisu');
    end;
  end;
end;

constructor TFormSettings.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  TManagerSettings.Instance.ItemSettingsTmp.AssignValues(TManagerSettings.Instance.ItemSettings);
  edtDbName.Text := TManagerSettings.Instance.ItemSettingsTmp.DbPath;
  edtDbServer.Text := TManagerSettings.Instance.ItemSettingsTmp.DbServerName;
  edtDbUser.Text := TManagerSettings.Instance.ItemSettingsTmp.DbLogin;
  edtDbPassword.Text := TManagerSettings.Instance.ItemSettingsTmp.DbPass;
end;

procedure TFormSettings.actCloseSettingsExecute(Sender: TObject);
begin
  Self.Close;
end;


procedure TFormSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormSettings.FormDestroy(Sender: TObject);
begin
  FormSettings := nil;
end;

procedure TFormSettings.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

end.
