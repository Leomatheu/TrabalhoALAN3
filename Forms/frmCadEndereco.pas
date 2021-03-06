unit frmCadEndereco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, SYSTEM.JSON;

type
  TformCadEndereco = class(TForm)
    pnBotoes: TPanel;
    Image2: TImage;
    Image3: TImage;
    btnSalvar: TButton;
    btnCancelar: TButton;
    pnFLucroAtual: TPanel;
    Image1: TImage;
    edtCEP: TLabeledEdit;
    edtLogradouro: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtEstado: TLabeledEdit;
    edtNumero: TLabeledEdit;
    Panel1: TPanel;
    Image4: TImage;
    SpeedButton1: TSpeedButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure btnCancelarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadEndereco: TformCadEndereco;

implementation
uses
  uControler;

{$R *.dfm}

procedure TformCadEndereco.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TformCadEndereco.btnSalvarClick(Sender: TObject);
var
  controler : TControler;
begin
  controler := TControler.Create;
  controler.pCadastroEndereco;
end;

procedure TformCadEndereco.FormActivate(Sender: TObject);
begin
  if(formCadEndereco = nil)then
     formCadEndereco := TformCadEndereco.Create(nil);
end;

procedure TformCadEndereco.SpeedButton1Click(Sender: TObject);
var
  json : TJSONObject;
begin
  RESTClient1.BaseURL := 'https://viacep.com.br/ws/';
  RESTRequest1.Method := rmGET;
  RESTRequest1.Resource := '{CEP}/json';
  RESTRequest1.Params.AddUrlSegment('cep', self.edtCEP.text);
  RESTRequest1.Execute;

  json := TJSONObject.ParseJSONValue(RESTRequest1.Response.JSONText) as TJSONObject;

  self.edtLogradouro.text := json.GetValue<string>('logradouro');
  self.edtComplemento.Text := json.GetValue<string>('complemento');
  self.edtBairro.Text := json.GetValue<string>('bairro');
  self.edtCidade.Text := json.GetValue<string>('localidade');
  self.edtEstado.Text := json.GetValue<string>('uf');

end;

end.
