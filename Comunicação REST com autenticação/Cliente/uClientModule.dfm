object ClientModule1: TClientModule1
  OldCreateOrder = False
  Height = 271
  Width = 415
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=22.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Port=80'
      'HostName=localhost'
      'CommunicationProtocol=http'
      'URLPath=ServidorGenericoComAutenticacao.dll'
      'DatasnapContext=datasnap/'
      'Filters={}'
      'DSAuthenticationPassword=SenhaUsuario'
      'DSAuthenticationUser=NomeUsuario')
    Left = 48
    Top = 40
    UniqueId = '{073F3421-5B7F-46A2-BDEE-3069E6FAC3F1}'
  end
end
