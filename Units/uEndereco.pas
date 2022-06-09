unit uEndereco;

interface

  Type TEndereco = class

     private
       idEndereco : integer;
       cep : string;
       rua : string;
       complemento : string;
       numero : string;
       bairro : string;
       cidade : string;
       estado : string;

     public
       procedure setIdEndereco(idEndereco:integer);
       function getIdEndereco:integer;

       procedure setCep(cep:string);
       function getCep:string;

       procedure setRua(rua:string);
       function getRua:string;

       procedure setComplemento(complemento:string);
       function getComplemento:string;

       procedure setNumero(numero:string);
       function getNumero:string;

       procedure setBairro(bairro:string);
       function getBairro:string;

       procedure setCidade(cidade:string);
       function getCidade:string;

       procedure setEstado(estado:string);
       function getEstado:string;





  end;

implementation

{ TEndereco }

function TEndereco.getBairro: string;
begin
  result := self.bairro;
end;

function TEndereco.getCep: string;
begin
  result := self.cep;
end;

function TEndereco.getCidade: string;
begin
  result := self.cidade;
end;

function TEndereco.getComplemento: string;
begin
  result := self.complemento;
end;

function TEndereco.getEstado: string;
begin
  result := self.estado;
end;

function TEndereco.getIdEndereco: integer;
begin
  result := self.idEndereco;
end;

function TEndereco.getNumero: string;
begin
  Result := self.numero;
end;

function TEndereco.getRua: string;
begin
  result := self.rua;
end;

procedure TEndereco.setBairro(bairro: string);
begin
  self.bairro := bairro;
end;

procedure TEndereco.setCep(cep: string);
begin
  self.cep := cep;
end;

procedure TEndereco.setCidade(cidade: string);
begin
  self.cidade := cidade;
end;

procedure TEndereco.setComplemento(complemento: string);
begin
  self.complemento := complemento;
end;

procedure TEndereco.setEstado(estado: string);
begin
  self.estado := estado;
end;

procedure TEndereco.setIdEndereco(idEndereco: integer);
begin
  self.idEndereco := idEndereco;
end;

procedure TEndereco.setNumero(numero: string);
begin
  self.numero := numero;
end;

procedure TEndereco.setRua(rua: string);
begin
  self.rua := rua;
end;

end.
