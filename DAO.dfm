object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 623
  Width = 626
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'Database=alan'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 48
  end
  object DataSource1: TDataSource
    Left = 40
    Top = 104
  end
  object SQLQuery1: TSQLQuery
    GetMetadata = True
    DataSource = DataSource1
    Params = <
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select * from empresa ')
    Left = 40
    Top = 168
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 528
    Top = 216
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = SQLQuery1
    ScopeMappings = <>
    Left = 40
    Top = 232
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 40
    Top = 304
  end
end
