program Project1;

uses
  Vcl.Forms,
  Menu in '..\Forms\Menu.pas' {frmMenu},
  CadFuncionarios in '..\Forms\CadFuncionarios.pas' {frmCadFuncionario},
  uEmpresa in '..\Units\uEmpresa.pas',
  uFuncionario in '..\Units\uFuncionario.pas',
  LancamentosMensais in '..\Forms\LancamentosMensais.pas' {frmLancamentosMensais},
  uLancamentosMensais in '..\Units\uLancamentosMensais.pas' {$R *.res},
  CadEmpresa in '..\Forms\CadEmpresa.pas' {frmEmpresa},
  uControler in '..\Units\uControler.pas' {$R *.res},
  DAO in '..\DAO\DAO.pas' {DataModule1: TDataModule},
  ConsultaFolhas in '..\Forms\ConsultaFolhas.pas' {Form1},
  FormLucroAtual in '..\Forms\FormLucroAtual.pas' {frmLucroAtual},
  FormRelComparativo in '..\Forms\FormRelComparativo.pas' {RelComparativo},
  FormGrafico in '..\Forms\FormGrafico.pas' {FormApresentacaoGrafico},
  FormFiltroGrafico in '..\Forms\FormFiltroGrafico.pas' {frmFiltoGrafico},
  frmCadEndereco in '..\Forms\frmCadEndereco.pas' {formCadEndereco},
  uEndereco in '..\Units\uEndereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
