unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, uControler;
  //Vcl.Imaging.jpeg;

type
  TfrmMenu = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Empresas1: TMenuItem;
    Funcionrios1: TMenuItem;
    Consultas1: TMenuItem;
    Sair1: TMenuItem;
    Image1: TImage;
    Clculos1: TMenuItem;
    FolhaMensal1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Empresas1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

procedure TfrmMenu.Empresas1Click(Sender: TObject);
var
   controler : TControler;
begin
   controler := TControler.Create;
   controler.pCadastroDeEmpresa;
end;

procedure TfrmMenu.Funcionrios1Click(Sender: TObject);
begin
   //CadFuncionarios.frmCadFuncionario.ShowModal;
end;

procedure TfrmMenu.Sair1Click(Sender: TObject);
begin
  close;
end;

end.
