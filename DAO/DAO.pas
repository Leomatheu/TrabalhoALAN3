unit DAO;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uEmpresa, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.Controls;

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

procedure TDataModule1.pInsertEmpresa(objEmpresa: TEmpresa);
var
   query : TFDQuery;
begin
   query := TFDQuery.Create(nil);
   query.Connection := DataModule1.Conexao;

   query.SQL.Add('insert into cadEmpresa values(0, :descricaoEmpresa, :contatoEmpresa, :enderecoEmpresa, :inscricaoEmpresa');

   query.Params[0].AsString := objEmpresa.getDescEmp;
   query.Params[1].AsString := objEmpresa.getContatoEmp;
   query.Params[2].AsString := objEmpresa.getEndEmp;
   query.Params[3].AsString := objEmpresa.getInscEmp;

   try
      query.ExecSQL;
   except
      on e:Exception do 
         showMessage('Erro na inser��o da empresa : ' + e.ToString);
   end;
end;

end.
