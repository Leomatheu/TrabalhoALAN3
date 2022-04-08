unit FormLucroAtual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmLucroAtual = class(TForm)
    pnBotoes: TPanel;
    Image2: TImage;
    Image3: TImage;
    btnCalcular: TButton;
    btnCancelar: TButton;
    pnFLucroAtual: TPanel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtCustoOp: TEdit;
    Label3: TLabel;
    Image1: TImage;
    edtRef: TMaskEdit;
    edtFat: TMaskEdit;
    Panel1: TPanel;
    mmResultado: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLucroAtual: TfrmLucroAtual;

implementation

{$R *.dfm}

end.