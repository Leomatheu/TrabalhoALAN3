program Project1;

uses
  Vcl.Forms,
  Menu in '..\Forms\Menu.pas' {frmMenu},
  CadFuncionarios in '..\Forms\CadFuncionarios.pas' {frmCadFuncionario},
  uEmpresa in '..\Units\uEmpresa.pas',
  uFuncionario in '..\Units\uFuncionario.pas',
  LancamentosMensais in '..\Forms\LancamentosMensais.pas' {frmLancamentosMensais},
  uLancamentosMensais in '..\Units\uLancamentosMensais.pas',
  controle in '..\Units\controle.pas',
  CadEmpresa in '..\Forms\CadEmpresa.pas' {frmEmpresa},
  uControler in '..\Units\uControler.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
