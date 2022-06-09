unit FormFiltroGrafico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask;

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
    Label3: TLabel;
    Label4: TLabel;
    edtData01: TMaskEdit;
    edtData02: TMaskEdit;
    ckTodosFuncs: TCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbEmpresaChange(Sender: TObject);
    procedure pPopulaComBoxFuncionario(prEmpresa : integer);
    procedure btnSalvarClick(Sender: TObject);
    procedure ckTodosFuncsClick(Sender: TObject);
    procedure pPopulaComboxEmpresa;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltoGrafico: TfrmFiltoGrafico;

implementation
uses
   DAO, uEmpresa, uFuncionario, uControler;

{$R *.dfm}

procedure TfrmFiltoGrafico.btnCancelarClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmFiltoGrafico.btnSalvarClick(Sender: TObject);
var
   controler : TControler;
begin
  controler := TControler.Create;
  controler.pCriaGrafico;
end;

procedure TfrmFiltoGrafico.cbEmpresaChange(Sender: TObject);
begin
   pPopulaComBoxFuncionario(TEmpresa(self.cbEmpresa.Items.Objects[cbEmpresa.ItemIndex]).getCodEmp);
end;

procedure TfrmFiltoGrafico.ckTodosFuncsClick(Sender: TObject);
begin
   if(self.ckTodosFuncs.Checked)then
     begin
       self.cbFuncionario.Enabled := false;
       self.edtData02.Enabled := false;
     end;
end;

procedure TfrmFiltoGrafico.FormActivate(Sender: TObject);
begin
  self.pPopulaComboxEmpresa;
end;

procedure TfrmFiltoGrafico.pPopulaComboxEmpresa;
var
   listaEmpresa : TList;
   i: integer;
begin
  listaEmpresa := DAO.DataModule1.fSelecaoEmpresa;
  self.cbEmpresa.Clear;

  for i := 0 to listaEmpresa.Count -1 do
     begin
        self.cbEmpresa.AddItem(IntToStr(TEmpresa(listaEmpresa[i]).getCodEmp)+'-'+TEmpresa(listaEmpresa[i]).getDescEmp, listaEmpresa[i]);
     end;

  listaEmpresa.Clear;
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

  listaFuncionario.Clear;
end;

end.
