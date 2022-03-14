program Project1;

uses
  Vcl.Forms,
  Menu in '..\Forms\Menu.pas' {frmMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
