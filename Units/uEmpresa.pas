unit uEmpresa;

interface


  Type TEmpresa = class

     private
       codigoEmpresa : integer;
       descricaoEmpresa : string;
       contatoEmpresa : String;
       enderecoEmpresa : String;
       inscricaoEmpresa : String;

     public
       procedure setCodEmp(codigoEmpresa:integer);
       function getCodEmp:integer;

       procedure setDescEmp(descricaoEmpresa:String);
       function getDescEmp:String;

       procedure setContatoEmp(contatoEmpresa:String);
       function getContatoEmp:String;

       procedure setEndEmp(enderecoEmpresa:String);
       function getEndEmp:String;

       procedure setInscEmp(inscricaoEmpresa:String);
       function getInscEmp:String;
  end;

implementation

{ TEmpresa }

function TEmpresa.getCodEmp: integer;
begin
  result := self.codigoEmpresa;
end;

function TEmpresa.getContatoEmp: String;
begin
  result := self.contatoEmpresa;
end;

function TEmpresa.getDescEmp: String;
begin
  result := self.descricaoEmpresa;
end;

function TEmpresa.getEndEmp: String;
begin
  result := self.enderecoEmpresa;
end;

function TEmpresa.getInscEmp: String;
begin
  result := self.inscricaoEmpresa;
end;

procedure TEmpresa.setCodEmp(codigoEmpresa: integer);
begin
  self.codigoEmpresa :=  codigoEmpresa;
end;

procedure TEmpresa.setContatoEmp(contatoEmpresa: String);
begin
  self.contatoEmpresa :=  contatoEmpresa;
end;

procedure TEmpresa.setDescEmp(descricaoEmpresa: String);
begin
  self.descricaoEmpresa := descricaoEmpresa;
end;

procedure TEmpresa.setEndEmp(enderecoEmpresa: String);
begin
  self.enderecoEmpresa :=  enderecoEmpresa;
end;

procedure TEmpresa.setInscEmp(inscricaoEmpresa: String);
begin
  self.inscricaoEmpresa := inscricaoEmpresa;
end;

end.
