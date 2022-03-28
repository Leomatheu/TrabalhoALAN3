unit DAO;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uEmpresa, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.Controls, uFuncionario;

type
  TDataModule1 = class(TDataModule)
    Conexao: TFDConnection;
    transacoes: TFDTransaction;
    query: TFDQuery;
    Driver: TFDPhysMySQLDriverLink;
    listaImagens: TImageList;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure pInsertEmpresa(objEmpresa: TEmpresa);
    procedure pInsereFuncionario(objFuncionario : TFuncionario);
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

procedure TDataModule1.pInsereFuncionario(objFuncionario: TFuncionario);
var
   query : TFDQuery;
begin
   query := TFDQuery.Create(nil);
   query.Connection := DataModule1.Conexao;

   query.SQL.Add('insert into cadFuncionario values(0, :nomeFuncionario, :dataNascimento, :statusFuncionario, :valorHora, :generoFuncionario, :cpfFuncionario, :rgFuncionario);');
   query.Params[0].AsString := objFuncionario.getNomeFunc;
   query.Params[1].AsString := objFuncionario.getDataNasc;
   query.Params[2].AsString := objFuncionario.getStatusFunc;
   query.Params[3].AsFloat := objFuncionario.getValorHora;
   query.Params[4].AsString := objFuncionario.getGeneroFunc;
   query.Params[5].AsString := objFuncionario.getCPF;
   query.Params[6].AsString := objFuncionario.getRG;

   try
     query.ExecSQL;
     ShowMessage('Inser��o realizada com sucesso !!');
   except
     on e:Exception do
        ShowMessage('Erro na inser��o do funcion�rio: '+e.ToString);
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
end;

end.
