unit uFuncoes;

interface

  function GetDiretorio: String;

implementation

uses Windows, SysUtils;

function GetDiretorio: String;
var
  fullPath: array[0..MAX_PATH] of Char;
begin
  SetString(Result,fullPath, GetModuleFileName(HInstance,fullPath,SizeOf(fullPath)));
  Result := ExtractFilePath(fullpath);
end;

end.
