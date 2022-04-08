unit DAO;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uEmpresa, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.Controls, uFuncionario, Datasnap.DBClient, uLancamentosMensais;

type
  TDataModule1 = class(TDataModule)
    Conexao: TFDConnection;
    transacoes: TFDTransaction;
    query: TFDQuery;
    Driver: TFDPhysMySQLDriverLink;
    DataSet: TClientDataSet;
    listaImagem: TImageList;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure pInsertEmpresa(objEmpresa: TEmpresa);
    procedure pInsereFuncionario(objFuncionario : TFuncionario);
    procedure pInsereLancamento(objLancamento : TLancamento);
    function fSelecaoEmpresa: TList;
    function fSelecaoFuncionario(codigoEmpresa : integer) : Tlist;
    function fSelecaoSomaSalario(referencia : string) : String;
    function fSelecaoMediaHoras(referencia : String) : String;

  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
   Conexao.Connected := true;
end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
   Conexao.Connected := false;
end;

function TDataModule1.fSelecaoEmpresa: TList;
var
   query : TFDQuery;
   objEmpresa : TEmpresa;
   listaEmpresa : Tlist;
begin
   query := TFDQuery.Create(nil);
   query.Connection := DataModule1.Conexao;

   query.SQL.Add('Select * from cadEmpresa;');

   try
     query.Open;
     query.First;
     listaEmpresa := Tlist.Create;

     while not(query.Eof)do
        begin
           objEmpresa := TEmpresa.Create;
           objEmpresa.setCodEmp(query.Fields[0].asInteger);
           objEmpresa.setDescEmp(query.Fields[1].AsString);
           objEmpresa.setContatoEmp(query.Fields[2].asString);
           objEmpresa.setEndEmp(query.Fields[3].asString);
           objEmpresa.setInscEmp(query.Fields[4].asString);

           listaEmpresa.Add(objEmpresa);
           query.Next;
        end;
     result := listaEmpresa;
   except
      on e: Exception do
         ShowMessage('Falha na busca por empresasas : '+e.ToString);

   end;

   query.Close;
   query.Free;
end;

function TDataModule1.fSelecaoFuncionario(codigoEmpresa : integer): Tlist;
var
   query : TFDQuery;
   listaFuncionario : Tlist;
   objFuncionario : TFuncionario;

begin
   query := TFDQuery.Create(nil);
   query.Connection := DataModule1.Conexao;

   query.SQL.Add('select * from cadFuncionario where cadFuncionario.codigoEmpresa = :codigoEmpresa;');
   query.Params[0].asInteger := codigoEmpresa;

   try
      query.Open;
      query.First;
      listaFuncionario := Tlist.Create;

      while not(query.Eof) do
         begin
           objFuncionario := TFuncionario.Create;
           objFuncionario.setCodFunc(query.Fields[0].AsInteger);
           objFuncionario.setNomeFunc(query.Fields[1].asString);
           objFuncionario.setDataNasc(query.Fields[2].asString);
           objFuncionario.setStatusFunc(query.Fields[3].asString);
           objFuncionario.setValorHora(query.Fields[4].asFloat);
           objFuncionario.setGeneroFunc(query.Fields[5].asString);
           objFuncionario.setCPF(query.Fields[6].asString);
           objFuncionario.setRG(query.Fields[7].asString);
           objFuncionario.setCodigoEmpresa(query.Fields[8].asInteger);

           listaFuncionario.Add(objFuncionario);
           query.Next;
         end;

         result := listaFuncionario;
   except
        on e: Exception do
           ShowMessage('Falha na consulta do banco : ' + e.ToString);
   end;

end;

function TDataModule1.fSelecaoMediaHoras(referencia: String): String;
var
   query : TFDQuery;
   retorno : String;
begin
   query := TFDQuery.Create(nil);
   query.Connection := DataModule1.Conexao;

   query.SQL.Add('select sum(lancamentosmensais.horaTrabalhada)/(select count(lancamentosmensais.codigoFuncionario)) from lancamentosmensais where lancamentosmensais.competecia = :referencia;');
   query.Params[0].AsString := referencia;

   try
      query.Open;
      query.First;
      retorno := query.Fields[0].AsString;
      result := retorno;
   except
      on e: Exception do
         ShowMessage('Falha na consulta da m�dia de horas : '+ e.ToString);
   end;
end;

function TDataModule1.fSelecaoSomaSalario(referencia: string): String;
var
   query : TFDQuery;
   retorno : String;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('select sum(lancamentosmensais.valorLiquido) from lancamentosmensais where lancamentosmensais.competecia = :referencia;');
  query.Params[0].AsString := referencia;

  try
    query.Open;
    query.First;
    retorno := query.Fields[0].AsString;
    result := retorno;

  except
    on e: Exception do
       ShowMessage('Falha na consulta de soma dos sal�rios : '+ e.ToString);

  end;
end;

procedure TDataModule1.pInsereFuncionario(objFuncionario: TFuncionario);
var
   query : TFDQuery;
begin
   query := TFDQuery.Create(nil);
   query.Connection := DataModule1.Conexao;

   query.SQL.Add('insert into cadFuncionario values(0, :nomeFuncionario, :dataNascimento, :statusFuncionario, :valorHora, :generoFuncionario, :cpfFuncionario, :rgFuncionario, :codigoEmpresa);');
   query.Params[0].AsString := objFuncionario.getNomeFunc;
   query.Params[1].AsString := objFuncionario.getDataNasc;
   query.Params[2].AsString := objFuncionario.getStatusFunc;
   query.Params[3].AsFloat := objFuncionario.getValorHora;
   query.Params[4].AsString := objFuncionario.getGeneroFunc;
   query.Params[5].AsString := objFuncionario.getCPF;
   query.Params[6].AsString := objFuncionario.getRG;
   query.Params[7].AsInteger := objFuncionario.getCodigoEmpresa;

   try
     query.ExecSQL;
     ShowMessage('Inser��o realizada com sucesso !!');
   except
     on e:Exception do
        ShowMessage('Erro na inser��o do funcion�rio: '+e.ToString);
   end;

   query.Close;
   query.Free;
end;

procedure TDataModule1.pInsereLancamento(objLancamento: TLancamento);
var
   query : TFDQuery;
begin
   query := TFDQuery.Create(nil);
   query.Connection := DataModule1.Conexao;

   query.SQL.Add('insert into lancamentosMensais values(0, :codigoFuncionario, :codigoEmpresa, :horaTrabalhada, :competecia, :valorLiquido);');

   query.Params[0].AsInteger := objLancamento.getFuncionario;
   query.Params[1].AsInteger := objLancamento.getEmpresa;
   query.Params[2].AsFloat := objLancamento.getHorasTrab;
   query.Params[3].AsString := objLancamento.getComp;
   query.Params[4].AsFloat := objLancamento.getLiquido;

   try
     query.ExecSQL;
     ShowMessage('C�lculo salvo com sucesso !!');
   except
      on e:Exception do
         ShowMessage('Erro ao gravar o c�lculo: '+e.ToString);
   end;
end;

procedure TDataModule1.pInsertEmpresa(objEmpresa: TEmpresa);
var
   query : TFDQuery;
begin
   query := TFDQuery.Create(nil);
   query.Connection := DataModule1.Conexao;

   query.SQL.Add('insert into cadEmpresa values(0, :descricaoEmpresa, :contatoEmpresa, :enderecoEmpresa, :inscricaoEmpresa);');

   query.Params[0].AsString := objEmpresa.getDescEmp;
   query.Params[1].AsString := objEmpresa.getContatoEmp;
   query.Params[2].AsString := objEmpresa.getEndEmp;
   query.Params[3].AsString := objEmpresa.getInscEmp;

   try
      query.ExecSQL;
      ShowMessage('Inser��o realizada com sucesso !!');
   except
      on e:Exception do
         showMessage('Erro na inser��o da empresa : ' + e.ToString);
   end;

   query.Close;
   query.Free;
end;



end.
