unit LancamentosMensais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmLancamentosMensais = class(TForm)
    pnCalculos: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Funcionário: TLabel;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    procedure Label3Click(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancamentosMensais: TfrmLancamentosMensais;

implementation

{$R *.dfm}

procedure TfrmLancamentosMensais.Label3Click(Sender: TObject);
begin

end;

procedure TfrmLancamentosMensais.MaskEdit3Change(Sender: TObject);
begin

end;

end.
