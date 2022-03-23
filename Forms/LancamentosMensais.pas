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
    procedure btnSalvarClick(Sender: TObject);
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
  ModalResult := mrCancel;
end;



procedure TfrmLancamentosMensais.btnSalvarClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

end.
