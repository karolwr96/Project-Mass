unit cItemContractor;

interface

type
TItemContractor = class
  private
    FName              : string;
    FPostCode          : string;
    FTown              : string;
    FStreet            : string;
    FHouseNumber       : string;

  public
    property Name          : string read FName          write FName         ;
    property PostCode      : string read FPostCode      write FPostCode     ;
    property Town          : string read FTown          write FTown         ;
    property Street        : string read FStreet        write FStreet       ;
    property HouseNumber   : string read FHouseNumber   write FHouseNumber  ;

  //  procedure AssignValues(pSource : TItemSettings);
    procedure SetDefault;

    constructor Create(); overload;
    destructor Destroy; override;
end;

implementation

{ TItemContractor }
      {
procedure TItemSettings.AssignValues(pSource: TItemSettings);
begin
  FDbServerName := pSource.DbServerName;
  FDbLogin      := pSource.DbLogin;
  FDbPass       := pSource.DbPass;
  FDbPath       := pSource.DbPath;
end;                         }

constructor TItemContractor.Create;
begin
  inherited Create;
  SetDefault;
end;

destructor TItemContractor.Destroy;
begin
  inherited;
end;

procedure TItemContractor.SetDefault;
begin
  FName := '';
  FPostCode      := '';
  FTown      := '';
  FStreet      := '';
  FHouseNumber      := '';
end;

end.
