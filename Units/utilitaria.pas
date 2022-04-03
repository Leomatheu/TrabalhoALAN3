unit utilitaria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg,
  uLancamentosMensais, uFuncionario, uEmpresa,
  LancamentosMensais, CadFuncionarios, CadEmpresa, DAO;

implementation

function TiraPonto(valor: string): string;
var i: integer;
begin
     for i := 0 to Length(valor) do
       begin
       if valor[i]='.' then
          begin
               delete(valor,i,1);
          end
       end;
       Result := valor;
end;

end.
