unit uControler;


interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.Imaging.jpeg,

  uLancamentosMensais, uFuncionario, uEmpresa,
  LancamentosMensais, CadFuncionarios, CadEmpresa, DAO, FormLucroAtual,
  FormRelComparativo, FormFiltroGrafico, FormGrafico, frmCadEndereco, uEndereco;

  Type TControler = class

     public
       procedure pCadastroDeEmpresa;
       procedure pCadastroDeFuncionario;
       procedure pCadastroLancamento;
       procedure pCadastroEndereco;
       procedure pFormLucroAtual;
       procedure pFormRelComparativo;
       procedure pFormFiltrosGrafico;
       procedure pFormLancamentosMensais;
       procedure pCriaGrafico;
       procedure pCadastroDeEndereco;
       procedure pCadEndereco;
       function fTiraPonto(prValor : String): String;
       function fGetLucroAtual(prReferencia : String) : String;
       function fGetLucroSContratar(prReferencia : String) : String;
       function fGetLucroContratando(prReferencia : String) : String;
       function fValidaCampos(Key : char; Text : String; Tag : Integer) : Boolean;

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

  retorno := #13#10 + 'Custo da m?o de obra contratando: '+ FormatFloat('R$ #,###,#0.00', custoContratando) + #13#10 +
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
             'M?o de obra total : ' + FormatFloat('R$ #,###,#0.00', maoDeObraTotal) + #13#10 +
             'Custo operacional : ' + FormatFloat('R$ #,###,#0.00', custoOp) + #13#10 +
             #13#10+
             'O lucro atual ? : ' + FormatFloat('R$ #,###,#0.00', lucroAtual);

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
             'Faturamento m?quina nova: '+ FormatFloat('R$ #,###,#0.00',  fatNewMaquina) + #13#10 +
             'Custo op. nova m?quina: '+ FormatFloat('R$ #,###,#0.00', custoOpNewMaquina) + #13#10 +
             'Custo m?o de obra com aumento: '+ FormatFloat('R$ #,###,#0.00', custoMaoDeObraComAumento) + #13#10 +
             'Lucro sem contrata??o: ' + FormatFloat('R$ #,###,#0.00', faturamento + fatNewMaquina - custoOpTotal - custoOpNewMaquina - custoMaoDeObraComAumento) + #13#10;

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

function TControler.fValidaCampos(Key: char; Text: String;
  Tag: Integer): Boolean;
begin
   If (key = #13) or (key = #9) then
   Begin
      Key:= #0;
      if not(Text = '') or (Tag = 1) then
         begin
           //Perform(Wm_NextDlgCtl,0,0);
           result := true;
         end
      else
         begin
           ShowMessage('Campo obrigat?rio n?o pode ser vazio !!');
           result := false;
         end;
   end;
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


procedure TControler.pCadastroDeEndereco;
var
    frmCadEndereco : TFormCadEndereco;
begin
    if(formCadEndereco = nil)then
     formCadEndereco := TformCadEndereco.Create(nil);

    formCadEndereco.ShowModal;
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
        objFuncionario.setCodigoEmpresa(TEmpresa(frmCadFuncionario.cbEmpresa.Items.Objects[frmCadFuncionario.cbEmpresa.ItemIndex]).getCodEmp);
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
        objFuncionario.setCodigoEndereco(TEndereco(frmCadFuncionario.cbEndereco.Items.Objects[frmCadFuncionario.cbEndereco.ItemIndex]).getIdEndereco);

        BD := TDataModule1.Create(nil);
        BD.pInsereFuncionario(objFuncionario);
     end;


     FreeAndNil(frmCadFuncionario);
end;

procedure TControler.pCadastroEndereco;
var
  objEndereco : TEndereco;
  data : TDataModule1;
begin
  objEndereco := TEndereco.Create;

  objEndereco.setCep(formCadEndereco.edtCEP.text);
  objEndereco.setRua(formCadEndereco.edtLogradouro.Text);
  objEndereco.setComplemento(formCadEndereco.edtComplemento.Text);
  objEndereco.setNumero(formCadEndereco.edtNumero.Text);
  objEndereco.setBairro(formCadEndereco.edtBairro.Text);
  objEndereco.setCidade(formCadEndereco.edtCidade.Text);
  objEndereco.setEstado(formCadEndereco.edtEstado.Text);

  data := TDataModule1.Create(nil);
  data.pInsertEndereco(objEndereco);
end;

procedure TControler.pCadastroLancamento;
var
   objLancamento : TLancamento;
   BD : TDataModule1;
   objFuncionario : TFuncionario;
   i : integer;
   liquido : String;
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


procedure TControler.pCadEndereco;
var
   objEndereco : TEndereco;
   BD : TDataModule1;
begin

end;

procedure TControler.pCriaGrafico;
var
  BD : TDataModule1;
  lista : Tlist;
  i, funcionario : integer;

begin
  BD := TDataModule1.Create(nil);
  FormApresentacaoGrafico.Series2.Clear;
  FormApresentacaoGrafico.Series1.Clear;
  if not(frmFiltoGrafico.ckTodosFuncs.Checked)then
     begin
        funcionario := TFuncionario(frmFiltoGrafico.cbFuncionario.Items.Objects[frmFiltoGrafico.cbFuncionario.ItemIndex]).getCodFunc;
        lista := BD.fSelecaoLancamentosMensais(frmFiltoGrafico.edtData01.Text, frmFiltoGrafico.edtData02.Text, funcionario);

        for i := 0 to lista.Count -1 do
          begin
            FormApresentacaoGrafico.Caption := 'GR?FICO PAGAMENTOS MENSAIS FUNC. '+ BD.fSelecaoNomeFuncionario(TLancamento(lista[i]).getFuncionario);
            FormApresentacaoGrafico.Grafico.Title.Caption := 'Pagamentos mensais funcion?rio ' + BD.fSelecaoNomeFuncionario(TLancamento(lista[i]).getFuncionario);
            FormApresentacaoGrafico.Series1.Marks.Visible := false;
            FormApresentacaoGrafico.Grafico.Title.Font.Color := clBlack;
            FormApresentacaoGrafico.Grafico.Title.Font.Size := 10;
            FormApresentacaoGrafico.Series1.AddBar(TLancamento(lista[i]).getLiquido, TLancamento(lista[i]).getComp, clYellow);
          end;
     end
  else
     begin
       lista := BD.fSelecaoLancamentosMensaisRef(frmFiltoGrafico.edtData01.text);

       for i := 0 to lista.Count -1 do
         begin
           FormApresentacaoGrafico.Caption := 'GR?FICO PAGAMENTOS MENSAIS POR REFER?NCIA';
           FormApresentacaoGrafico.Grafico.Title.Caption := 'Pagamentos realizados em ' + TLancamento(lista[i]).getComp;
           FormApresentacaoGrafico.Grafico.Title.Font.Color := clBlack;
           FormApresentacaoGrafico.Grafico.Title.Font.Size := 10;
           FormApresentacaoGrafico.Series2.Marks.Text := BD.fSelecaoNomeFuncionario(TLancamento(lista[i]).getFuncionario);
           FormApresentacaoGrafico.Series2.AddBar(TLancamento(lista[i]).getLiquido, BD.fSelecaoNomeFuncionario(TLancamento(lista[i]).getFuncionario), clYellow);
         end;
     end;


  FormApresentacaoGrafico.ShowModal;
end;

procedure TControler.pFormFiltrosGrafico;
begin
   frmFiltoGrafico := TfrmFiltoGrafico.Create(nil);
   frmFiltoGrafico.ShowModal;
end;

procedure TControler.pFormLancamentosMensais;
begin
  frmLancamentosMensais := TfrmLancamentosMensais.Create(nil);
  frmLancamentosMensais.ShowModal;
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
