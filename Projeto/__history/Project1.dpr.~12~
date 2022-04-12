program Project1;

uses
  Vcl.Forms,
  Menu in '..\Forms\Menu.pas' {frmMenu},
  CadFuncionarios in '..\Forms\CadFuncionarios.pas' {frmCadFuncionario},
  uEmpresa in '..\Units\uEmpresa.pas',
  uFuncionario in '..\Units\uFuncionario.pas',
  LancamentosMensais in '..\Forms\LancamentosMensais.pas' {frmLancamentosMensais},
  uLancamentosMensais in '..\Units\uLancamentosMensais.pas' {$R *.res},
  controle in '..\Units\controle.pas',
  CadEmpresa in '..\Forms\CadEmpresa.pas' {frmEmpresa},
  uControler in '..\Units\uControler.pas',
  DAO in '..\DAO.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
