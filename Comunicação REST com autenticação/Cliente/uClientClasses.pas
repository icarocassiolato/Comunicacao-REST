// 
// Created by the DataSnap proxy generator.
// 27/10/2016 13:25:19
// 

unit uClientClasses;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TMetodosServidor1Client = class(TDSAdminClient)
  private
    FEchoString1Command: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString1(Value: string): string;
  end;

  TMetodosServidor2Client = class(TDSAdminClient)
  private
    FEchoString2Command: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString2(Value: string): string;
  end;

implementation

function TMetodosServidor1Client.EchoString1(Value: string): string;
begin
  if FEchoString1Command = nil then
  begin
    FEchoString1Command := FDBXConnection.CreateCommand;
    FEchoString1Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoString1Command.Text := 'TMetodosServidor1.EchoString1';
    FEchoString1Command.Prepare;
  end;
  FEchoString1Command.Parameters[0].Value.SetWideString(Value);
  FEchoString1Command.ExecuteUpdate;
  Result := FEchoString1Command.Parameters[1].Value.GetWideString;
end;


constructor TMetodosServidor1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TMetodosServidor1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TMetodosServidor1Client.Destroy;
begin
  FEchoString1Command.DisposeOf;
  inherited;
end;

function TMetodosServidor2Client.EchoString2(Value: string): string;
begin
  if FEchoString2Command = nil then
  begin
    FEchoString2Command := FDBXConnection.CreateCommand;
    FEchoString2Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoString2Command.Text := 'TMetodosServidor2.EchoString2';
    FEchoString2Command.Prepare;
  end;
  FEchoString2Command.Parameters[0].Value.SetWideString(Value);
  FEchoString2Command.ExecuteUpdate;
  Result := FEchoString2Command.Parameters[1].Value.GetWideString;
end;


constructor TMetodosServidor2Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TMetodosServidor2Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TMetodosServidor2Client.Destroy;
begin
  FEchoString2Command.DisposeOf;
  inherited;
end;

end.
