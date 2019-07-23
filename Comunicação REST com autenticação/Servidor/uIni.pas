unit uIni;

interface

  function LerIni(Secao, Chave: String): String;
  function CaminhoIni: String;

implementation

uses IniFiles, IOUtils, Windows, SysUtils;

function CaminhoIni: String;
var
  fullPath: array[0..MAX_PATH] of Char;
begin
  SetString(Result,fullPath, GetModuleFileName(HInstance,fullPath,SizeOf(fullPath)));

  Result := TPath.Combine(ExtractFilePath(fullpath), 'Config.ini');
end;

function LerIni(Secao, Chave: String): String;
begin
  with TIniFile.Create(CaminhoIni) do
  begin
    Result := ReadString(Secao, Chave, '');
    Free;
  end;
end;

end.
