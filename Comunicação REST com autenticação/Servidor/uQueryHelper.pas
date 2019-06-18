unit uQueryHelper;

interface

uses
  System.SysUtils, Data.FireDACJSONReflect, FireDAC.Comp.Client;

  function GetQuery(query: TFDQuery): TFDJSONDataSets;
  procedure ApplyChanges(query: TFDQuery; const ADeltaList: TFDJSONDeltas);

implementation

procedure ApplyChanges(query: TFDQuery; const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);
  LApply.ApplyUpdates(0, query.Command);

  if LApply.Errors.Count > 0 then
    raise Exception.Create(LApply.Errors.Strings.Text);
end;

function GetQuery(query: TFDQuery): TFDJSONDataSets;
begin
  query.Active := False;

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, query);
end;

end.
