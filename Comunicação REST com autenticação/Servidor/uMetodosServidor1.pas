unit uMetodosServidor1;

interface

uses
  System.SysUtils, System.Classes, System.Json, Datasnap.DSServer, Datasnap.DSAuth,
  DataSnap.DSProviderDataModuleAdapter, Data.FireDACJSONReflect, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet;

type
{$METHODINFO ON}
  TMetodosServidor1 = class(TDataModule)
    qUsuario: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApplyChanges(psNomeQuery: string; const ADeltaList: TFDJSONDeltas);
    function GetQuery(psNomeQuery: string; psCondicao: string): TFDJSONDataSets;
    function EchoString1(Value: string): string;
  end;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  System.StrUtils, uQueryHelper;

procedure TMetodosServidor1.ApplyChanges(psNomeQuery: string; const ADeltaList: TFDJSONDeltas);
begin
  uQueryHelper.ApplyChanges(FindComponent(TFDJSONDeltasReader.GetListValue(ADeltaList, 0).Table.Name), ADeltaList);
end;

function TMetodosServidor1.GetQuery(psNomeQuery: string; psCondicao: string): TFDJSONDataSets;
begin
  Result := uQueryHelper.GetQuery(FindComponent(psNomeQuery), psCondicao);
end;

function TMetodosServidor1.EchoString1(Value: string): string;
begin
  Result := 'Estou na 2ª classe dizendo: ' + Value;
end;

end.

