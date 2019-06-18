unit uIni;

interface

  function LerIni(Secao, Chave: String): String;

implementation

uses IniFiles, IOUtils, uFuncoes;

function LerIni(Secao, Chave: String): String;
begin
  with TIniFile.Create(TPath.Combine(GetDiretorio, 'Config.ini')) do
  begin
    Result := ReadString(Secao, Chave, '');
    Free;
  end;
end;

end.
