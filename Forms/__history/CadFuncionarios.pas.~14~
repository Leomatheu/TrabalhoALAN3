unit CadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, uFuncionario;

type
  TfrmCadFuncionario = class(TForm)
    pnBotoes: TPanel;
    pnAtributosFuncionarios: TPanel;
    btnSalvar: TButton;
    Image2: TImage;
    Image3: TImage;
    btnCancelar: TButton;
    Label1: TLabel;
    edtCodFunc: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtDataNasc: TMaskEdit;
    Label4: TLabel;
    pnCheckBox: TPanel;
    ckInativo: TCheckBox;
    ckAtivo: TCheckBox;
    Label5: TLabel;
    edtValor: TEdit;
    Label6: TLabel;
    pnGenero: TPanel;
    ckFeminino: TCheckBox;
    ckMasculino: TCheckBox;
    Label7: TLabel;
    edtCPF: TMaskEdit;
    Label8: TLabel;
    edtRG: TEdit;
    Image1: TImage;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure FormActivate(Sender: TObject);
    procedure edtDataNascChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   frmCadFuncionario: TfrmCadFuncionario;

implementation

{$R *.dfm}

procedure TfrmCadFuncionario.btnCancelarClick(Sender: TObject);
begin
  close;
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
end;

procedure  pCriaObjetoFuncionario;
var
   objFuncionario : TFuncionario;
begin

   objFuncionario.Create;

   objFuncionario.setCodFunc(StrToInt(frmCadFuncionario.edtCodFunc.text));
   objFuncionario.setNomeFunc(frmCadFuncionario.edtNome.Text);
   objFuncionario.setDataNasc(frmCadFuncionario.edtDataNasc.text);
   objFuncionario.setValorHora(StrToFloat(frmCadFuncionario.edtValor.text));
   objFuncionario.setCPF(frmCadFuncionario.edtCPF.text);
   objFuncionario.setRG(frmCadFuncionario.edtRG.text);

   if (frmCadFuncionario.ckAtivo.Checked) then
      objFuncionario.setStatusFunc('Ativo')
   else
      objFuncionario.setStatusFunc('Inativo');


   if (frmCadFuncionario.ckMasculino.Checked) then
      objFuncionario.setGeneroFunc('Masculino')
   else
      objFuncionario.setGeneroFunc('Feminino');

end;


end.
