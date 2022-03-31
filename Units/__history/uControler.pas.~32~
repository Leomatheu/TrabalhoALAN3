unit uControler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg,
  uLancamentosMensais, uFuncionario, uEmpresa,
  LancamentosMensais, CadFuncionarios, CadEmpresa, DAO;

  Type TControler = class

     public
       procedure pCadastroDeEmpresa;
       procedure pCadastroDeFuncionario;
       procedure pCadastroLancamento;
  end;

implementation


{ TControler }

procedure TControler.pCadastroDeEmpresa;
var
   objEmpresa : TEmpresa;
   BD : TDataModule1;
begin
   if(frmEmpresa = nil)then
       frmEmpresa := TfrmEmpresa.Create(nil);

   if(frmEmpresa.ShowModal = mrOK)then
     begin
       objEmpresa := TEmpresa.Create;
       objEmpresa.setDescEmp(frmEmpresa.edtDescricao.Text);
       objEmpresa.setContatoEmp(frmEmpresa.edtContato.Text);
       objEmpresa.setEndEmp(frmEmpresa.edtEndereco.Text);
       objEmpresa.setInscEmp(frmEmpresa.edtInscricao.Text);
     end;

   BD := TDataModule1.Create(nil);
   BD.pInsertEmpresa(objEmpresa);

   FreeAndNil(frmEmpresa);
end;


procedure TControler.pCadastroDeFuncionario;
var
   objFuncionario : TFuncionario;
   BD : TDataModule1;
begin
   if(frmCadFuncionario = nil)then
     frmCadFuncionario := TfrmCadFuncionario.Create(nil);

   if(frmCadFuncionario.ShowModal = mrOK)then
     begin
        objFuncionario := TFuncionario.Create;
        objFuncionario.setCodFunc(StrToInt(frmCadFuncionario.edtCodFunc.Text));
        objFuncionario.setNomeFunc(frmCadFuncionario.edtNome.Text);
        objFuncionario.setDataNasc(frmCadFuncionario.edtDataNasc.Text);

        if(frmCadFuncionario.ckAtivo.Checked = true)then
           objFuncionario.setStatusFunc('Ativo')
        else
           objFuncionario.setStatusFunc('Inativo');

        objFuncionario.setValorHora(StrToFloat(frmCadFuncionario.edtValor.Text));

        if(frmCadFuncionario.ckMasculino.Checked = true)then
           objFuncionario.setGeneroFunc('Masculino')
        else
           objFuncionario.setGeneroFunc('Feminino');

        objFuncionario.setCPF(frmCadFuncionario.edtCPF.Text);
        objFuncionario.setRG(frmCadFuncionario.edtRG.Text);
     end;
     BD := TDataModule1.Create(nil);
     BD.pInsereFuncionario(objFuncionario);

     FreeAndNil(frmCadFuncionario);
end;

procedure TControler.pCadastroLancamento;
var
   objLancamento : TLancamento;
begin
   if(frmLancamentosMensais = nil)then
     frmLancamentosMensais := TfrmLancamentosMensais.Create(nil);

   if(frmLancamentosMensais.ShowModal = mrOk)then
     begin
       objLancamento := TLancamento.Create;

       objLancamento.setFuncionario(StrToInt(frmLancamentosMensais.cbFuncionario.Text));
       objLancamento.setComp(frmLancamentosMensais.edtCompetencia.Text);
       objLancamento.setHorasTrab(StrToFloat(frmLancamentosMensais.edtHora.Text));
       objLancamento.setLiquido(StrToFloat(frmLancamentosMensais.edtLiquido.Text));
     end;
end;

end.
