object frmLancamentosMensais: TfrmLancamentosMensais
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'C'#193'LCULOS'
  ClientHeight = 442
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object pnCalculos: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 361
    Caption = 'pnCalculos'
    Color = clActiveCaption
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object Label1: TLabel
      Left = 168
      Top = 32
      Width = 86
      Height = 17
      Caption = 'Compet'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 312
      Top = 32
      Width = 38
      Height = 17
      Caption = 'Horas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object Funcionário: TLabel
      Left = 32
      Top = 32
      Width = 77
      Height = 17
      Caption = 'Funcion'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 240
      Width = 48
      Height = 17
      Caption = 'L'#237'quido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      OnClick = Label3Click
    end
    object MaskEdit1: TMaskEdit
      Left = 168
      Top = 55
      Width = 86
      Height = 23
      EditMask = '!99/0000;1;_'
      MaxLength = 7
      TabOrder = 0
      Text = '  /    '
    end
    object MaskEdit2: TMaskEdit
      Left = 312
      Top = 55
      Width = 50
      Height = 23
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
    end
    object MaskEdit3: TMaskEdit
      Left = 32
      Top = 257
      Width = 52
      Height = 23
      EditMask = '!####,00;0'
      MaxLength = 7
      TabOrder = 2
      Text = ''
      OnChange = MaskEdit3Change
    end
  end
end
