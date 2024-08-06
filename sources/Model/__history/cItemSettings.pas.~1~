unit cItemSettings;

interface

type
TItemSettings = class
  private
    FDbServerName : string;
    FDbLogin      : string;
    FDbPass       : string;
    FDbPath       : string;
  public
    property DbServerName : string read FDbServerName write FDbServerName  ;
    property DbLogin      : string read FDbLogin      write FDbLogin       ;
    property DbPass       : string read FDbPass       write FDbPass        ;
    property DbPath       : string read FDbPath       write FDbPath        ;

    procedure AssignValues(pSource : TItemSettings);
    procedure SetDefault;

    constructor Create(); overload;
    destructor Destroy; override;
end;

implementation

{ TItemSettings }

procedure TItemSettings.AssignValues(pSource: TItemSettings);
begin
  FDbServerName := pSource.DbServerName;
  FDbLogin      := pSource.DbLogin;
  FDbPass       := pSource.DbPass;
  FDbPath       := pSource.DbPath;
end;

constructor TItemSettings.Create;
begin
  inherited Create;

  SetDefault;
end;

destructor TItemSettings.Destroy;
begin
  //
  inherited;
end;

procedure TItemSettings.SetDefault;
begin
  FDbServerName := '';
  FDbLogin      := '';
  FDbPass       := '';
  FDbPath       := '';
end;

end.
