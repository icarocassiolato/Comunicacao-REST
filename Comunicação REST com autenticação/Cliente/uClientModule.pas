unit uClientModule;

interface

uses
  System.SysUtils, System.Classes, uClientClasses, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Data.DbxHTTPLayer, Data.DB, Data.SqlExpr;

type
  TClientModule1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
  private
    FInstanceOwner: Boolean;
    FMetodosServidor1Client: TMetodosServidor1Client;
    FMetodosServidor2Client: TMetodosServidor2Client;
    function GetMetodosServidor1Client: TMetodosServidor1Client;
    function GetMetodosServidor2Client: TMetodosServidor2Client;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property MetodosServidor1Client: TMetodosServidor1Client read GetMetodosServidor1Client write FMetodosServidor1Client;
    property MetodosServidor2Client: TMetodosServidor2Client read GetMetodosServidor2Client write FMetodosServidor2Client;

end;

var
  ClientModule1: TClientModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

constructor TClientModule1.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule1.Destroy;
begin
  FMetodosServidor1Client.Free;
  FMetodosServidor2Client.Free;
  inherited;
end;

function TClientModule1.GetMetodosServidor1Client: TMetodosServidor1Client;
begin
  if FMetodosServidor1Client = nil then
  begin
    SQLConnection1.Open;
    FMetodosServidor1Client:= TMetodosServidor1Client.Create(SQLConnection1.DBXConnection, FInstanceOwner);
  end;
  Result := FMetodosServidor1Client;
end;
function TClientModule1.GetMetodosServidor2Client: TMetodosServidor2Client;
begin
  if FMetodosServidor2Client = nil then
  begin
    SQLConnection1.Open;
    FMetodosServidor2Client:= TMetodosServidor2Client.Create(SQLConnection1.DBXConnection, FInstanceOwner);
  end;
  Result := FMetodosServidor2Client;
end;

end.
