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
    Funcionário: TLabel;
    Label3: TLabel;
    cbFuncionario: TComboBox;
    Image1: TImage;
    pnBotoes: TPanel;
    Image2: TImage;
    Image3: TImage;
    btnSalvar: TButton;
    btnCancelar: TButton;
    edtValorHora: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    cbEmpresa: TComboBox;
    edtHora: TEdit;
    edtLiquido: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure pPopulaComboBoxFuncionario(prEmpresa : integer);
    procedure pPopulaComboBoxEmpresa;
    procedure FormActivate(Sender: TObject);
    procedure cbEmpresaChange(Sender: TObject);
    procedure cbFuncionarioChange(Sender: TObject);
    procedure edtHoraChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancamentosMensais: TfrmLancamentosMensais;

implementation
uses
   uControler, DAO, uFuncionario, uEmpresa;

{$R *.dfm}

procedure TfrmLancamentosMensais.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmLancamentosMensais.btnSalvarClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

procedure TfrmLancamentosMensais.cbEmpresaChange(Sender: TObject);
begin
   pPopulaComboBoxFuncionario(frmLancamentosMensais.cbEmpresa.ItemIndex +1);
end;


procedure TfrmLancamentosMensais.cbFuncionarioChange(Sender: TObject);
begin
   frmLancamentosMensais.edtValorHora.Text :=
   FormatFloat('R$ #,###,#00.00' , TFuncionario(frmLancamentosMensais.cbFuncionario.Items.Objects[frmLancamentosMensais.cbFuncionario.ItemIndex]).getValorHora);
end;

procedure TfrmLancamentosMensais.edtHoraChange(Sender: TObject);
begin
  frmLancamentosMensais.edtLiquido.Text := FormatFloat('R$ #,###,#00.00', StrToFloat(frmLancamentosMensais.edtHora.Text) * StrToFloat(Copy(frmLancamentosMensais.edtValorHora.Text, 3, 5)));
end;

procedure TfrmLancamentosMensais.FormActivate(Sender: TObject);
begin
   pPopulaComboBoxEmpresa;
end;

procedure TfrmLancamentosMensais.pPopulaComboBoxEmpresa;
var
   lista : Tlist;
   i : integer;
begin
   lista := DAO.DataModule1.fSelecaoEmpresa;
   cbEmpresa.Clear;
   for i := 0 to lista.Count-1 do
     begin
       cbEmpresa.AddItem(intToStr(TEmpresa(lista[i]).getCodEmp)+' - '+TEmpresa(lista[i]).getDescEmp, lista[i]);
     end;

   lista.Clear;
end;

procedure TfrmLancamentosMensais.pPopulaComboBoxFuncionario(prEmpresa : integer);
var
   lista : Tlist;
   i : integer;
begin
  lista := DAO.DataModule1.fSelecaoFuncionario(prEmpresa);
  cbFuncionario.Clear;
  for i := 0 to lista.Count -1 do
     begin
       cbFuncionario.AddItem(intToStr(TFuncionario(lista[i]).getCodFunc)+' - '+TFuncionario(lista[i]).getNomeFunc, lista[i]);
     end;

  lista.Clear;

end;

end.
