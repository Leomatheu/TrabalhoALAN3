unit uControler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg,
  uLancamentosMensais, uFuncionario, uEmpresa,
  LancamentosMensais, CadFuncionarios, CadEmpresa, DAO, FormLucroAtual;

  Type TControler = class

     public
       procedure pCadastroDeEmpresa;
       procedure pCadastroDeFuncionario;
       procedure pCadastroLancamento;
       function fTiraPonto(prValor : String): String;
       function fGetLucroReal(prReferencia : String) : String;
  end;

implementation


{ TControler }

function TControler.fGetLucroReal(prReferencia: String): String;
var
   BD : TDataModule1;
   faturamentoReal, maoDeObraTotal, custoOp, lucroAtual : Double;
   retorno : String;

begin
  BD := TDataModule1.Create(nil);
  faturamentoReal := strToFloat(frmLucroAtual.edtFat.Text) * strToFloat(BD.fSelecaoMediaHoras(prReferencia)) / 200;
  maoDeObraTotal := StrToFloat(BD.fSelecaoSomaSalario(prReferencia));
  custoOp := StrToFloat(frmLucroAtual.edtFat.Text) * StrToInt(frmLucroAtual.edtCustoOp.Text);
  lucroAtual := faturamentoReal - maoDeObraTotal - custoOp;

  retorno := 'Faturamento real : ' + FloatToStr(faturamentoReal) + '#13#10' +
             'M�o de obra total : ' + FloatToStr(maoDeObraTotal) + '#13#10' +
             'Custo operacional : ' + FloatToStr(custoOp) + '#13#10' +
             '#13#10'+
             'O lucro atual � : ' + FloatToStr(lucroAtual);

  result := retorno;

end;

function TControler.fTiraPonto(prValor: String): String;
var
   i : integer;
begin
     for i := 0 to Length(prValor) do
       begin
       if prValor[i]='.' then
          begin
               delete(prValor,i,1);
          end
       end;
       Result := prValor;
end;

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

       BD := TDataModule1.Create(nil);
       BD.pInsertEmpresa(objEmpresa);
     end;



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
        objFuncionario.setCodigoEmpresa(frmCadFuncionario.cbEmpresa.ItemIndex + 1);
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

        objFuncionario.setCPF(frmCadFuncionario.edtPF.Text);
        objFuncionario.setRG(frmCadFuncionario.edtRegistroGeral.Text);

        BD := TDataModule1.Create(nil);
        BD.pInsereFuncionario(objFuncionario);
     end;


     FreeAndNil(frmCadFuncionario);
end;

procedure TControler.pCadastroLancamento;
var
   objLancamento : TLancamento;
   BD : TDataModule1;
   objFuncionario : TFuncionario;
   i : integer;
   liquido : String;
begin
   if(frmLancamentosMensais = nil)then
     frmLancamentosMensais := TfrmLancamentosMensais.Create(nil);

   if(frmLancamentosMensais.ShowModal = mrOk)then
     begin
       objLancamento := TLancamento.Create;

       objLancamento.setEmpresa(TEmpresa(frmLancamentosMensais.cbEmpresa.Items.Objects[frmLancamentosMensais.cbEmpresa.ItemIndex]).getCodEmp);
       objLancamento.setFuncionario(TFuncionario(frmLancamentosMensais.cbFuncionario.Items.Objects[frmLancamentosMensais.cbFuncionario.ItemIndex]).getCodFunc);
       objLancamento.setHorasTrab(StrToFloat(frmLancamentosMensais.edtHora.Text));
       objLancamento.setComp(frmLancamentosMensais.edtCompetencia.Text);
       liquido := fTiraPonto(Copy(frmLancamentosMensais.edtLiquido.Text, 3, 11));
       objLancamento.setLiquido(StrToFloat(Copy(liquido, 1, 5)));
       BD := TDataModule1.Create(nil);
       BD.pInsereLancamento(objLancamento);
     end;
end;


end.
