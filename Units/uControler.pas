unit uControler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg,
  uLancamentosMensais, uFuncionario, uEmpresa,
  LancamentosMensais, CadFuncionarios, CadEmpresa, DAO, FormLucroAtual, FormRelComparativo;

  Type TControler = class

     public
       procedure pCadastroDeEmpresa;
       procedure pCadastroDeFuncionario;
       procedure pCadastroLancamento;
       procedure pFormLucroAtual;
       procedure pFormRelComparativo;
       function fTiraPonto(prValor : String): String;
       function fGetLucroAtual(prReferencia : String) : String;
       function fGetLucroSContratar(prReferencia : String) : String;
       function fGetLucroContratando(prReferencia : String) : String;
  end;

implementation


{ TControler }

function TControler.fGetLucroContratando(prReferencia: String): String;
var
   BD : TDataModule1;
   mediaSalarial, somaSalarial, custoContratando, faturamentoReal, custoOpTotal, custoOpNewMaquina,
   custoOldMaquina, lucroTotalCont, fatOldMaquina, fatNewMaquina  : Double;
   retorno : String;
begin
  BD :=  TDataModule1.Create(nil);

  mediaSalarial := strToInt(BD.fSelecaoMediaSalarial);
  somaSalarial := strToInt(BD.fSelecaoSomaSalario(prReferencia));

  custoContratando :=  mediaSalarial +  somaSalarial;
  faturamentoReal := strToFloat(Copy(RelComparativo.edtFat.Text, 3, Length(RelComparativo.edtFat.Text))) * strToFloat(BD.fSelecaoMediaHoras(prReferencia)) / 200;
  custoOpTotal :=  faturamentoReal * StrToInt(RelComparativo.edtCustoOp.Text) / 100;
  custoOldMaquina :=  custoOpTotal / StrToFloat(RelComparativo.edtQtdMaquina.Text);
  custoOpNewMaquina :=  custoOldMaquina - (custoOldMaquina * (strToFloat(RelComparativo.edtCustoOpNovaMaquina.Text)/ 100));
  fatOldMaquina := faturamentoReal / strToFloat(RelComparativo.edtQtdMaquina.Text);
  fatNewMaquina := (fatOldMaquina * (strToFloat(RelComparativo.edtFatNovaMaquina.Text) / 100)) +  fatOldMaquina;

  lucroTotalCont :=  (faturamentoReal + fatNewMaquina)- custoOpTotal - custoOpNewMaquina - custoContratando;

  retorno := #13#10 + 'Custo da m�o de obra contratando: '+ FormatFloat('R$ #,###,#0.00', custoContratando) + #13#10 +
             'Lucro total contratando: '+ FormatFloat('R$ #,###,#0.00', lucroTotalCont);

  result := retorno;

end;

function TControler.fGetLucroAtual(prReferencia: String): String;
var
   BD : TDataModule1;
   faturamentoReal, maoDeObraTotal, custoOp, lucroAtual : Double;
   retorno : String;

begin
  BD := TDataModule1.Create(nil);
  faturamentoReal := strToFloat(Copy(frmLucroAtual.edtFat.Text, 3, Length(frmLucroAtual.edtFat.Text))) * strToFloat(BD.fSelecaoMediaHoras(prReferencia)) / 200;
  maoDeObraTotal := StrToFloat(BD.fSelecaoSomaSalario(prReferencia));
  custoOp := faturamentoReal * StrToInt(frmLucroAtual.edtCustoOp.Text) / 100;
  lucroAtual := faturamentoReal - maoDeObraTotal - custoOp;

  retorno := 'Faturamento real : ' + FormatFloat('R$ #,###,#0.00', faturamentoReal) + #13#10 +
             'M�o de obra total : ' + FormatFloat('R$ #,###,#0.00', maoDeObraTotal) + #13#10 +
             'Custo operacional : ' + FormatFloat('R$ #,###,#0.00', custoOp) + #13#10 +
             #13#10+
             'O lucro atual � : ' + FormatFloat('R$ #,###,#0.00', lucroAtual);

  result := retorno;

end;

function TControler.fGetLucroSContratar(prReferencia: String): String;
var
   BD : TDataModule1;
   faturamento, mediaCustoMaoDeObra, mediaCustoComAumento,
   fatOldMaquina, fatNewMaquina, custoOpTotal, custoOpNewMaquina,
   custoOldMaquina, custoMaoDeObraComAumento : Double;
   retorno : String;
begin
  BD := TDataModule1.Create(nil);
  faturamento :=  strToFloat(Copy(RelComparativo.edtFat.Text, 3, Length(RelComparativo.edtFat.Text))) * strToFloat(BD.fSelecaoMediaHoras(prReferencia)) / 200;
  fatOldMaquina := faturamento / strToFloat(RelComparativo.edtQtdMaquina.Text);
  fatNewMaquina := (fatOldMaquina * strToFloat(RelComparativo.edtFatNovaMaquina.Text) / 100) +  fatOldMaquina;
  custoOpTotal :=  faturamento * StrToInt(RelComparativo.edtCustoOp.Text) / 100;
  custoOldMaquina :=  custoOpTotal / StrToFloat(RelComparativo.edtQtdMaquina.Text);
  custoOpNewMaquina :=  custoOldMaquina - (custoOldMaquina * strToFloat(RelComparativo.edtCustoOpNovaMaquina.Text)/ 100);
  mediaCustoMaoDeObra :=  StrToFloat(BD.fSelecaoSomaSalario(RelComparativo.edtRef.Text)) / StrToFloat(RelComparativo.edtQtdMaquina.Text);
  mediaCustoComAumento := mediaCustoMaoDeObra *  (StrToFloat(RelComparativo.edtAumentoFunc.Text)/100) + mediaCustoMaoDeObra;
  custoMaoDeObraComAumento :=  mediaCustoComAumento * StrToFloat(RelComparativo.edtQtdMaquina.Text);


  retorno := 'Faturamento real: '+ FormatFloat('R$ #,###,#0.00', faturamento) + #13#10 +
             'Faturamento m�quina nova: '+ FormatFloat('R$ #,###,#0.00',  fatNewMaquina) + #13#10 +
             'Custo op. nova m�quina: '+ FormatFloat('R$ #,###,#0.00', custoOpNewMaquina) + #13#10 +
             'Custo m�o de obra com aumento: '+ FormatFloat('R$ #,###,#0.00', custoMaoDeObraComAumento) + #13#10 +
             'Lucro sem contrata��o: ' + FormatFloat('R$ #,###,#0.00', faturamento + fatNewMaquina - custoOpTotal - custoOpNewMaquina - custoMaoDeObraComAumento) + #13#10;

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


procedure TControler.pFormLucroAtual;
begin
      frmLucroAtual := TfrmLucroAtual.Create(nil);
      frmLucroAtual.ShowModal;
end;


procedure TControler.pFormRelComparativo;
begin
   RelComparativo := TRelComparativo.Create(nil);
   RelComparativo.ShowModal;
end;

end.
