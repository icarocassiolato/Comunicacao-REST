unit uQueryHelper;

interface

uses
  System.SysUtils, Data.FireDACJSONReflect, FireDAC.Comp.Client, Classes;

  function GetQuery(poQuery: TComponent): TFDJSONDataSets;
  procedure ApplyChanges(poQuery: TComponent; const ADeltaList: TFDJSONDeltas);

implementation

function QueryValida(poQuery: TComponent): boolean;
begin
  Result := Assigned(poQuery) and (poQuery is TFDQuery);
end;

procedure ApplyChanges(poQuery: TComponent; const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  if not QueryValida(poQuery) then
    Exit;

  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);
  LApply.ApplyUpdates(0, TFDQuery(poQuery).Command);

  if LApply.Errors.Count > 0 then
    raise Exception.Create(LApply.Errors.Strings.Text);
end;

function GetQuery(poQuery: TComponent): TFDJSONDataSets;
begin
  Result := TFDJSONDataSets.Create;

  if not QueryValida(poQuery) then
    Exit;

  TFDQuery(poQuery).Active := False;
  TFDJSONDataSetsWriter.ListAdd(Result, TFDQuery(poQuery));
end;

end.
