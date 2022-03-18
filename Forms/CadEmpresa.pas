unit CadEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, uEmpresa;

type
  TfrmEmpresa = class(TForm)
    pnBotoes: TPanel;
    pnAtributosEmpresa: TPanel;
    Label1: TLabel;
    edtCodEmpresa: TEdit;
    edtDescricao: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtEndereco: TEdit;
    edtContato: TMaskEdit;
    Label5: TLabel;
    edtInscricao: TMaskEdit;
    Image1: TImage;
    btnSalvar: TButton;
    btnCancelar: TButton;
    Image2: TImage;
    Image3: TImage;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

{$R *.dfm}

procedure TfrmEmpresa.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure pCriaObjetoEmpresa;
var
    objEmpresa : TEmpresa;
begin
      objEmpresa.Create;

      objEmpresa.setCodEmp(StrToInt(frmEmpresa.edtCodEmpresa.text));
      objEmpresa.setDescEmp(frmEmpresa.edtDescricao.Text);
      objEmpresa.setContatoEmp(frmEmpresa.edtContato.text);
      objEmpresa.setEndEmp(frmEmpresa.edtEndereco.text);
      objEmpresa.setInscEmp(frmEmpresa.edtInscricao.text);
end;

end.
