unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses uClientModule;

procedure TForm2.Button1Click(Sender: TObject);
begin
  ShowMessage(ClientModule1.MetodosServidor1Client.EchoString1('Texto1'));
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  ShowMessage(ClientModule1.MetodosServidor2Client.EchoString2('Texto2'));
end;

end.
