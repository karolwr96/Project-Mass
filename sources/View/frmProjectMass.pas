unit frmProjectMass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  Vcl.StdCtrls, Vcl.ComCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxNavBar, cxClasses, dxBar,
  System.ImageList, Vcl.ImgList, cxImageList, dxGDIPlusClasses;

type
  TbarMain = class(TForm)
    actionListMainMenu: TActionList;
    actClose: TAction;
    actSettings: TAction;
    actContractor: TAction;
    barManagerMainMenu: TdxBarManager;
    pnlTopMainMenu: TdxBar;
    imageListMainMenu: TcxImageList;
    btnClose: TdxBarLargeButton;
    btnSettings: TdxBarLargeButton;
    btnContractor: TdxBarLargeButton;
    btnProduct: TdxBarLargeButton;
    pnlBottomMainMenu: TPanel;
    dxBarLargeButton1: TdxBarLargeButton;
    imgLogo: TImage;
    actProducts: TAction;
    procedure actCloseExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actContractorExecute(Sender: TObject);
    procedure actProductsExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  barMain: TbarMain;

implementation

{$R *.dfm}

uses
  frmSettings, cManagerSettings, frmAddContractor, frmAddProduct;

procedure TbarMain.actCloseExecute(Sender: TObject);
begin
  Application.MainForm.Close();
end;

procedure TbarMain.actContractorExecute(Sender: TObject);
begin
 if FormAddContractor = nil then
    FormAddContractor := TFormAddContractor.Create(Application);
    FormAddContractor.ShowModal;
    //if FormAddContractor.ShowModal = mrOk then begin
   // ShowMessage('Poprawnie dodano kontrahenta!');
   // end;

    //pokazanie wiadomoœci o dodaniu kontrahenta przeniesione do frmAddContractor
    //ponowne otwarcia okna dodaj kontrahenta gdy dane zostan¹ dodane do pliku xml ???
end;

procedure TbarMain.actProductsExecute(Sender: TObject);
begin
  if FormProducts = nil then
     FormProducts := TFormProducts.Create(Application);
     FormProducts.ShowModal;
end;


procedure TbarMain.actSettingsExecute(Sender: TObject);
begin
 if FormSettings = nil then
    FormSettings := TFormSettings.Create(Application);
    if FormSettings.ShowModal = mrOk then begin
    ShowMessage('Poprawnie zapisano ustawienia!');
    end;
end;


procedure TbarMain.FormCreate(Sender: TObject);
begin
  TManagerSettings.Instance.ReadFromFile;
end;

end.
