unit CadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, uFuncionario, Vcl.DBCtrls;

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
    Label7: TLabel;
    Label8: TLabel;
    Image1: TImage;
    edtNome: TEdit;
    edtDataNasc: TMaskEdit;
    pnCheckBox: TPanel;
    ckInativo: TCheckBox;
    ckAtivo: TCheckBox;
    edtValor: TEdit;
    pnGenero: TPanel;
    ckFeminino: TCheckBox;
    ckMasculino: TCheckBox;
    edtCPF: TMaskEdit;
    edtRG: TEdit;
    Label9: TLabel;
    cbEmpresa: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure edtDataNascChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure pPopulaComboBox;
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

procedure TfrmCadFuncionario.edtDataNascChange(Sender: TObject);
begin
  if not(self.edtDataNasc.Text = '')then
     begin
       self.pnCheckBox.Visible := true;
       self.pnCheckBox.Enabled := true;
     end;
end;

procedure TfrmCadFuncionario.FormActivate(Sender: TObject);
begin
   self.pnCheckBox.Enabled := false;
   self.pnCheckBox.Visible := false;
   self.pPopulaComboBox;
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

end;

end.
