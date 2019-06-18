unit uMetodosServidor1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
    Data.FireDACJSONReflect, FireDAC.Comp.Client;

type
{$METHODINFO ON}
  TMetodosServidor1 = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApplyChanges(nomeQuery: string; const ADeltaList: TFDJSONDeltas);
    function GetQuery(nomeQuery: String): TFDJSONDataSets;
    function EchoString1(Value: string): string;
  end;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses System.StrUtils, uQueryHelper;

procedure TMetodosServidor1.ApplyChanges(nomeQuery: string; const ADeltaList: TFDJSONDeltas);
begin
  uQueryHelper.ApplyChanges(TFDQuery(FindComponent(TFDJSONDeltasReader.GetListValue(ADeltaList, 0).Table.Name)),
                            ADeltaList);
end;

function TMetodosServidor1.GetQuery(nomeQuery: String): TFDJSONDataSets;
begin
  Result := uQueryHelper.GetQuery(TFDQuery(FindComponent(nomeQuery)));
end;

function TMetodosServidor1.EchoString1(Value: string): string;
begin
  Result := 'Estou na 2ª classe dizendo: ' + Value;
end;

end.

