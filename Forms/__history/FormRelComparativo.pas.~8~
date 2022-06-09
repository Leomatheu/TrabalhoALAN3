unit FormRelComparativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TRelComparativo = class(TForm)
    pnBotoes: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    btnCalcular: TButton;
    btnCancelar: TButton;
    btnExport: TButton;
    SaveDialog1: TSaveDialog;
    pnFLucroAtual: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    edtCustoOp: TEdit;
    edtRef: TMaskEdit;
    edtFat: TMaskEdit;
    Label1: TLabel;
    edtQtdMaquina: TEdit;
    Label5: TLabel;
    edtValorNovaMaquina: TEdit;
    Label6: TLabel;
    edtFatNovaMaquina: TEdit;
    Label7: TLabel;
    edtCustoOpNovaMaquina: TEdit;
    Label8: TLabel;
    edtAumentoFunc: TEdit;
    mmResultado: TMemo;
    procedure btnCalcularClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelComparativo: TRelComparativo;

implementation
uses
   uControler;

{$R *.dfm}

procedure TRelComparativo.btnCalcularClick(Sender: TObject);
var
   controler : TControler;
   text : String;
begin
  controler := TControler.Create;
  text := controler.fGetLucroSContratar(self.edtRef.Text) + controler.fGetLucroContratando(self.edtRef.Text);
  self.mmResultado.Lines.Text := text;


end;

procedure TRelComparativo.btnCancelarClick(Sender: TObject);
begin
   self.Close;
end;

end.
