unit uControler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg,
  uLancamentosMensais, uFuncionario, uEmpresa,
  LancamentosMensais, CadFuncionarios, CadEmpresa;

  Type TControler = class

     public
       procedure pCadastroDeEmpresa;




  end;

implementation

{ TControler }

procedure TControler.pCadastroDeEmpresa;
var
   frmCadEmp : TfrmEmpresa;
   objEmpresa : TEmpresa;
begin
    if(frmEmpresa = nil)then
       frmEmpresa := TfrmEmpresa.Create(nil);

   if(frmEmpresa.ShowModal = mrOK)then
     begin

       objEmpresa := TEmpresa.Create;
       objEmpresa.setCodEmp(StrToInt(frmEmpresa.edtCodEmpresa.Text));
       objEmpresa.setDescEmp(frmEmpresa.edtDescricao.Text);
       objEmpresa.setContatoEmp(frmEmpresa.edtContato.Text);
       objEmpresa.setEndEmp(frmEmpresa.edtEndereco.Text);
       objEmpresa.setInscEmp(frmEmpresa.edtInscricao.Text);


     end;


      FreeAndNil(frmEmpresa);
end;





end.
