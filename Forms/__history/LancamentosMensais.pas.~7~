unit LancamentosMensais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, uLancamentosMensais;

type
  TfrmLancamentosMensais = class(TForm)
    pnCalculos: TPanel;
    Label1: TLabel;
    edtCompetencia: TMaskEdit;
    Label2: TLabel;
    edtHora: TMaskEdit;
    Funcionário: TLabel;
    Label3: TLabel;
    edtLiquido: TMaskEdit;
    cbFuncionario: TComboBox;
    Image1: TImage;
    pnBotoes: TPanel;
    Image2: TImage;
    Image3: TImage;
    btnSalvar: TButton;
    btnCancelar: TButton;
    edtValorHora: TEdit;
    Label4: TLabel;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancamentosMensais: TfrmLancamentosMensais;

implementation

{$R *.dfm}

procedure TfrmLancamentosMensais.btnCancelarClick(Sender: TObject);
begin
    close;
end;

procedure pCriaLancamentos;
var
    objLancamentos : TLancamento;

begin
      objLancamentos.Create;

      objLancamentos.setFuncionario(frmLancamentosMensais.cbFuncionario.ItemIndex);
      objLancamentos.setComp(frmLancamentosMensais.edtCompetencia.text);
      objLancamentos.setHorasTrab(StrToFloat(frmLancamentosMensais.edtHora.Text));
      objLancamentos.setLiquido(StrToFloat(frmLancamentosMensais.edtLiquido.text));
end;



end.
