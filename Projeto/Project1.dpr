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
  OKCANCL1 in 'c:\program files (x86)\embarcadero\studio\20.0\ObjRepos\EN\DelphiWin32\OKCANCL1.PAS' {OKBottomDlg},
  FormRelComparativo in '..\Forms\FormRelComparativo.pas' {RelComparativo},
  FormGrafico in '..\Forms\FormGrafico.pas' {Form2},
  FormFiltroGrafico in '..\Forms\FormFiltroGrafico.pas' {frmFiltoGrafico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmLucroAtual, frmLucroAtual);
  Application.CreateForm(TRelComparativo, RelComparativo);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TfrmFiltoGrafico, frmFiltoGrafico);
  Application.Run;
end.
