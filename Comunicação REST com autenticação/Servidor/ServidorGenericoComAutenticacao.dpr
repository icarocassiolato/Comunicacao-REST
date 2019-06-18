library ServidorGenericoComAutenticacao;

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  Data.DBXCommon,
  Datasnap.DSSession,
  uMetodosServidor1 in 'uMetodosServidor1.pas' {MetodosServidor: TDataModule},
  uWebModule in 'uWebModule.pas' {WebModule1: TWebModule},
  uMetodosServidor2 in 'uMetodosServidor2.pas' {MetodosServidor2: TDSServerModule},
  uFuncoes in 'uFuncoes.pas',
  uIni in 'uIni.pas',
  uQueryHelper in 'uQueryHelper.pas';

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

procedure TerminateThreads;
begin
  TDSSessionManager.Instance.Free;
  Data.DBXCommon.TDBXScheduler.Instance.Free;
end;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  TISAPIApplication(Application).OnTerminate := TerminateThreads;
  Application.Run;
end.
