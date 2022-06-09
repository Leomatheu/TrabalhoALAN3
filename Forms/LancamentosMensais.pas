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
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure pLimpaCampos;
    function fValidaCampos(key : Char; text : String; Tag : integer): boolean;
    procedure cbFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtCompetenciaChange(Sender: TObject);
    procedure edtCompetenciaKeyPress(Sender: TObject; var Key: Char);
    procedure edtHoraKeyPress(Sender: TObject; var Key: Char);
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
  self.Close;
end;

procedure TfrmLancamentosMensais.btnSalvarClick(Sender: TObject);
var
   controler : TControler;
begin
   controler := TControler.Create;
   controler.pCadastroLancamento;
   self.pLimpaCampos;
   pPopulaComboBoxEmpresa;
end;

procedure TfrmLancamentosMensais.cbEmpresaChange(Sender: TObject);
begin
   pPopulaComboBoxFuncionario(TEmpresa(self.cbEmpresa.Items.Objects[self.cbEmpresa.ItemIndex]).getCodEmp);
end;

procedure TfrmLancamentosMensais.cbEmpresaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(self.fValidaCampos(key, self.cbEmpresa.Text, self.cbEmpresa.Tag))then
     self.cbEmpresa.SetFocus;
end;

procedure TfrmLancamentosMensais.cbFuncionarioChange(Sender: TObject);
begin
   frmLancamentosMensais.edtValorHora.Text :=
   FormatFloat('R$ #,###,#00.00' , TFuncionario(frmLancamentosMensais.cbFuncionario.Items.Objects[frmLancamentosMensais.cbFuncionario.ItemIndex]).getValorHora);
end;

procedure TfrmLancamentosMensais.cbFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(self.fValidaCampos(key, self.cbFuncionario.Text, self.cbFuncionario.Tag)) then
     self.cbFuncionario.SetFocus;
end;

procedure TfrmLancamentosMensais.edtCompetenciaChange(Sender: TObject);
begin
   self.edtCompetencia.Tag := 1;
end;

procedure TfrmLancamentosMensais.edtCompetenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(self.fValidaCampos(key, self.edtCompetencia.Text, self.edtCompetencia.Tag)) then
     self.edtCompetencia.SetFocus;
end;

procedure TfrmLancamentosMensais.edtHoraChange(Sender: TObject);
begin
  if not(self.edtHora.Text = '')then
     frmLancamentosMensais.edtLiquido.Text := FormatFloat('R$ #,###,#00.00', StrToFloat(frmLancamentosMensais.edtHora.Text) * StrToFloat(Copy(frmLancamentosMensais.edtValorHora.Text, 3, 5)));
end;

procedure TfrmLancamentosMensais.edtHoraKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(self.fValidaCampos(key, self.edtHora.Text, self.edtHora.Tag))then
     self.edtHora.SetFocus;
end;

procedure TfrmLancamentosMensais.FormActivate(Sender: TObject);
begin
   self.pLimpaCampos;
   pPopulaComboBoxEmpresa;
   self.cbEmpresa.SetFocus;
end;

function TfrmLancamentosMensais.fValidaCampos(key: Char; text: String;
  Tag: integer): boolean;
begin
      If (key = #13) or (key = #9) then
   Begin
      Key:= #0;
      if not(Text = '') or (Tag = 1) then
         begin
           Perform(Wm_NextDlgCtl,0,0);
           result := true;
         end
      else
         begin
           ShowMessage('Campo obrigatório não pode ser vazio !!');
           result := false;
         end;
   end;
end;

procedure TfrmLancamentosMensais.pLimpaCampos;
begin
   frmLancamentosMensais.cbEmpresa.Clear;
   frmLancamentosMensais.cbFuncionario.Clear;
   frmLancamentosMensais.edtCompetencia.Clear;
   frmLancamentosMensais.edtValorHora.Clear;
   frmLancamentosMensais.edtCompetencia.Clear;
   frmLancamentosMensais.edtHora.Clear;
   frmLancamentosMensais.edtLiquido.Clear;
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
