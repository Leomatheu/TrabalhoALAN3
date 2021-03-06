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
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Image4: TImage;
    Image5: TImage;
    btnExport: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure btnExportClick(Sender : TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLucroAtual: TfrmLucroAtual;

implementation
uses
   uControler;

{$R *.dfm}

procedure TfrmLucroAtual.btnCalcularClick(Sender: TObject);
var
   controler : TControler;
begin
   controler := TControler.create;
   self.mmResultado.Text := controler.fGetLucroAtual(self.edtRef.Text);
end;

procedure TfrmLucroAtual.btnCancelarClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmLucroAtual.btnExportClick(Sender: TObject);
begin
   if(SaveDialog1.Execute)then
     mmResultado.lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TfrmLucroAtual.FormActivate(Sender: TObject);
begin
   self.edtCustoOp.Text := '';
   self.edtRef.Text := '';
   self.edtFat.Clear;

   self.edtRef.SetFocus;
end;

end.
