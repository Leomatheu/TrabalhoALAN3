unit CadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage;

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
    Edit1: TEdit;
    Label6: TLabel;
    pnGenero: TPanel;
    ckFeminino: TCheckBox;
    ckMasculino: TCheckBox;
    Label7: TLabel;
    edtCPF: TMaskEdit;
    Label8: TLabel;
    edtRG: TEdit;
    Image1: TImage;
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

end.
