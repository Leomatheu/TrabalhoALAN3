object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 236
  Width = 319
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'Database=alan'
      'DriverID=MySQL')
    Connected = True
    Left = 32
    Top = 24
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\progvisual33\Documents\Pessoal\Exerc'#237'cios Aula\PZIMexer' +
      'cicio\DELPHI\TrabalhoAlan\Projeto\Win32\Debug\libmysql.dll'
    Left = 136
    Top = 24
  end
end
