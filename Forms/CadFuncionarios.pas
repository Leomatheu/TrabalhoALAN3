unit CadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, uFuncionario, Vcl.DBCtrls, uEndereco;

type
  TfrmCadFuncionario = class(TForm)
    pnBotoes: TPanel;
    btnSalvar: TButton;
    Image2: TImage;
    Image3: TImage;
    btnCancelar: TButton;
    pnAtributosFuncionarios: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image1: TImage;
    edtNome: TEdit;
    edtDataNasc: TMaskEdit;
    pnCheckBox: TPanel;
    ckInativo: TCheckBox;
    ckAtivo: TCheckBox;
    pnGenero: TPanel;
    ckFeminino: TCheckBox;
    ckMasculino: TCheckBox;
    Label9: TLabel;
    cbEmpresa: TComboBox;
    edtRegistroGeral: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    edtValor: TMaskEdit;
    edtPF: TMaskEdit;
    Label7: TLabel;
    cbEndereco: TComboBox;
    function fValidaCampo(Key : char; Text : String; Tag : integer) : Boolean;
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure pPopulaComboBox;
    procedure pPopulaComboEndereco;
    procedure cbEmpresaChange(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure edtRegistroGeralKeyPress(Sender: TObject; var Key: Char);
    procedure edtPFKeyPress(Sender: TObject; var Key: Char);
    procedure edtDataNascChange(Sender: TObject);
    procedure edtDataNascKeyPress(Sender: TObject; var Key: Char);
    procedure edtPFChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   frmCadFuncionario: TfrmCadFuncionario;

implementation
uses
   uControler, DAO, uEmpresa;
{$R *.dfm}

procedure TfrmCadFuncionario.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCadFuncionario.btnSalvarClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

procedure TfrmCadFuncionario.cbEmpresaChange(Sender: TObject);
begin
  self.edtNome.SetFocus;
  self.pnCheckBox.Visible := true;
  self.pnCheckBox.Enabled := true;
  self.ckInativo.Enabled := true;
  self.ckAtivo.Enabled := true;
end;


procedure TfrmCadFuncionario.edtDataNascChange(Sender: TObject);
begin
  self.edtDataNasc.Tag := 1;
   self.pPopulaComboEndereco;
end;

procedure TfrmCadFuncionario.edtDataNascKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(self.fValidaCampo(Key, self.edtDataNasc.Text, self.edtDataNasc.Tag))then
     self.edtDataNasc.SetFocus;
end;

procedure TfrmCadFuncionario.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if not(self.fValidaCampo(Key, self.edtNome.Text, self.edtNome.Tag))then
     self.edtNome.SetFocus;
end;

procedure TfrmCadFuncionario.edtPFChange(Sender: TObject);
begin
   self.edtPF.Tag := 1;
end;

procedure TfrmCadFuncionario.edtPFKeyPress(Sender: TObject; var Key: Char);
begin
   if not(self.fValidaCampo(Key, self.edtPF.Text, self.edtPF.Tag))then
     self.edtPF.SetFocus;
end;

procedure TfrmCadFuncionario.edtRegistroGeralKeyPress(Sender: TObject; var Key: Char);
begin
  if not(self.fValidaCampo(Key, self.edtRegistroGeral.Text, self.edtRegistroGeral.Tag))then
     self.edtRegistroGeral.SetFocus;
end;

procedure TfrmCadFuncionario.edtValorChange(Sender: TObject);
begin
   self.edtValor.Tag := 1;
end;

procedure TfrmCadFuncionario.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
   if not(self.fValidaCampo(key, self.edtValor.Text, self.edtValor.Tag))then
      self.edtValor.SetFocus;
end;

procedure TfrmCadFuncionario.FormActivate(Sender: TObject);
begin
   self.pnCheckBox.Enabled := false;
   self.pnCheckBox.Visible := false;
   self.pPopulaComboBox;
end;

function TfrmCadFuncionario.fValidaCampo(Key : char; Text : String; Tag : Integer): Boolean;
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
           ShowMessage('Campo obrigat?rio n?o pode ser vazio !!');
           result := false;
         end;
   end;
end;

procedure TfrmCadFuncionario.pPopulaComboBox;
var
  i : integer;
  lista : TList;
begin
   lista := DAO.DataModule1.fSelecaoEmpresa;
   cbEmpresa.Clear;
    for i := 0 to lista.Count -1 do
       begin
         cbEmpresa.AddItem(IntToStr(TEmpresa(lista[i]).getCodEmp)+'-'+TEmpresa(lista[i]).getDescEmp, lista[i]);
       end;

    FreeAndNil(lista);

end;

procedure TfrmCadFuncionario.pPopulaComboEndereco;
var
  i : integer;
  listaEnd : TList;
begin
  listaEnd := DataModule1.fSelecaoEndereco;
  cbEndereco.Clear;
    for I := 0 to listaEnd.count -1 do
      begin
          cbEndereco.AddItem(IntToSTR(TEndereco(listaEnd[i]).getIdEndereco) +' - '+ TEndereco(listaEnd[i]).getRua + ' - ' + TEndereco(listaEnd[i]).getNumero, listaEnd[i]);
      end;


    FreeAndNil(listaEnd);
end;

end.
