program Project1;

uses
  Vcl.Forms,
  Menu in '..\Forms\Menu.pas' {frmMenu},
  CadEmpresa in '..\Forms\CadEmpresa.pas' {frmEmpresa},
  CadFuncionarios in '..\Forms\CadFuncionarios.pas' {frmCadFuncionario},
  uEmpresa in '..\Units\uEmpresa.pas',
  uFuncionario in '..\Units\uFuncionario.pas',
  LancamentosMensais in '..\Forms\LancamentosMensais.pas' {frmLancamentosMensais},
  uLancamentosMensais in '..\Units\uLancamentosMensais.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmEmpresa, frmEmpresa);
  Application.CreateForm(TfrmCadFuncionario, frmCadFuncionario);
  Application.CreateForm(TfrmLancamentosMensais, frmLancamentosMensais);
  Application.CreateForm(TfrmLancamentosMensais, frmLancamentosMensais);
  Application.CreateForm(TfrmLancamentosMensais, frmLancamentosMensais);
  Application.Run;
end.
