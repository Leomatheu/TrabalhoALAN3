unit FormGrafico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, Vcl.ExtCtrls;

type
  TFormApresentacaoGrafico = class(TForm)
    pnGrafico: TPanel;
    Grafico: TChart;
    Series1: TBarSeries;
    Series2: THorizBarSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormApresentacaoGrafico: TFormApresentacaoGrafico;

implementation
uses
  FormFiltroGrafico;

{$R *.dfm}

procedure TFormApresentacaoGrafico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmFiltoGrafico.edtData01.Clear;
  frmFiltoGrafico.edtData02.Clear;
  frmFiltoGrafico.cbFuncionario.Clear;
  frmFiltoGrafico.cbEmpresa.Clear;
  frmFiltoGrafico.ckTodosFuncs.Checked := false;
  frmFiltoGrafico.pPopulaComboxEmpresa;

  //frmFiltoGrafico.FormActivate;
end;

end.
