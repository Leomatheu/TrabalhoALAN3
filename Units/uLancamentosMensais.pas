unit uLancamentosMensais;

interface
  type TLancamento = class

    private
      codigoFunc:Integer;
      competencia:String;
      hora:double;
      liquido:double;


    public
       procedure setFuncionario(codigoFunc:integer);
       function getFuncionario:integer;
       procedure setComp(competencia:String);
       function getComp:String;
       procedure setHorasTrab(hora:double);
       function getHorasTrab:double;
       procedure setLiquido(liquido:double);
       function getLiquido:double;
  end;

implementation


{ TLancamento }

function TLancamento.getComp: String;
begin
    result := self.competencia;
end;

function TLancamento.getFuncionario: integer;
begin
  result := self.codigoFunc;
end;

function TLancamento.getHorasTrab: double;
begin
    result := self.hora;
end;

function TLancamento.getLiquido: double;
begin
    result := self.liquido;
end;

procedure TLancamento.setLiquido(liquido: double);
begin
    self.liquido := liquido;
end;

procedure TLancamento.setComp(competencia: String);
begin
    self.competencia := competencia;
end;

procedure TLancamento.setFuncionario(codigoFunc: integer);
begin
   self.codigoFunc := codigoFunc;
end;

procedure TLancamento.setHorasTrab(hora: double);
begin
    self.hora := hora;
end;

end.
