unit FormFiltroGrafico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrmFiltoGrafico = class(TForm)
    pnAtributosEmpresa: TPanel;
    Label2: TLabel;
    Image1: TImage;
    pnBotoes: TPanel;
    Image2: TImage;
    Image3: TImage;
    btnSalvar: TButton;
    btnCancelar: TButton;
    cbFuncionario: TComboBox;
    Label1: TLabel;
    cbEmpresa: TComboBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbEmpresaChange(Sender: TObject);
    procedure pPopulaComBoxFuncionario(prEmpresa : integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltoGrafico: TfrmFiltoGrafico;

implementation
uses
   DAO, uEmpresa, uFuncionario;

{$R *.dfm}

procedure TfrmFiltoGrafico.btnCancelarClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmFiltoGrafico.cbEmpresaChange(Sender: TObject);
begin
   pPopulaComBoxFuncionario(TEmpresa(self.cbEmpresa.Items.Objects[cbEmpresa.ItemIndex]).getCodEmp);
end;

procedure TfrmFiltoGrafico.FormActivate(Sender: TObject);
var
   i : integer;
   listaEmpresa : Tlist;
begin
  listaEmpresa := DAO.DataModule1.fSelecaoEmpresa;
  self.cbEmpresa.Clear;

  for i := 0 to listaEmpresa.Count -1 do
     begin
        self.cbEmpresa.AddItem(IntToStr(TEmpresa(listaEmpresa[i]).getCodEmp)+'-'+TEmpresa(listaEmpresa[i]).getDescEmp, listaEmpresa[i]);
     end;

  FreeAndNil(listaEmpresa);
end;

procedure TfrmFiltoGrafico.pPopulaComBoxFuncionario(prEmpresa : integer);
var
   listaFuncionario : Tlist;
   i : integer;
begin
  listaFuncionario := DAO.DataModule1.fSelecaoFuncionario(prEmpresa);
  self.cbFuncionario.Clear;

  for i := 0 to listaFuncionario.Count -1 do
     begin
       self.cbFuncionario.AddItem(intToStr(TFuncionario(listaFuncionario[i]).getCodFunc)+' - '+TFuncionario(listaFuncionario[i]).getNomeFunc, listaFuncionario[i]);
     end;

     FreeAndNil(listaFuncionario);
end;

end.
