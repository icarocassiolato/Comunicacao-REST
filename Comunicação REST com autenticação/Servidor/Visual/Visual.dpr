program Visual;
{$APPTYPE GUI}



uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uQueryHelper in '..\uQueryHelper.pas',
  uIni in '..\uIni.pas',
  uFrmView in 'uFrmView.pas' {FrmView},
  uMetodosServidor1 in '..\uMetodosServidor1.pas' {TMetodosServidor1: TDataModule},
  uMetodosServidor2 in '..\uMetodosServidor2.pas' {TMetodosServidor2: TDataModule},
  uWebModule in '..\uWebModule.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TFrmView, FrmView);
  Application.Run;
end.
