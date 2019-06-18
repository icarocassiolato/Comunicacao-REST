unit uMetodosServidor2;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, 
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter;

type
  TMetodosServidor2 = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString2(Value: string): string;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

function TMetodosServidor2.EchoString2(Value: string): string;
begin
  Result := 'Estou na 2ª classe dizendo: ' + Value;
end;

end.

