object FormApresentacaoGrafico: TFormApresentacaoGrafico
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Gr'#225'fico pagamentos mensais por funcion'#225'rio'
  ClientHeight = 493
  ClientWidth = 870
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnGrafico: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 493
    Align = alClient
    Caption = 'pnGrafico'
    ShowCaption = False
    TabOrder = 0
    object Grafico: TChart
      Left = 1
      Top = 1
      Width = 868
      Height = 491
      Title.Font.Color = clRed
      Title.Font.Height = -12
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'TChart')
      Chart3DPercent = 8
      View3DOptions.HorizOffset = -14
      View3DOptions.OrthoAngle = 135
      View3DOptions.Perspective = 33
      View3DOptions.VertOffset = 4
      View3DOptions.Zoom = 102
      View3DOptions.ZoomText = ztAuto
      Zoom.Brush.Color = clDefault
      Zoom.Brush.Style = bsSolid
      Align = alClient
      Color = clActiveCaption
      TabOrder = 0
      DefaultCanvas = 'TTeeCanvas3D'
      PrintMargins = (
        15
        22
        15
        22)
      ColorPaletteIndex = 13
      object Series1: TBarSeries
        Legend.Visible = False
        ShowInLegend = False
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series2: THorizBarSeries
        Legend.Visible = False
        BarBrush.Gradient.Direction = gdLeftRight
        ShowInLegend = False
        Gradient.Direction = gdLeftRight
        XValues.Name = 'Bar'
        XValues.Order = loNone
        YValues.Name = 'Y'
        YValues.Order = loAscending
      end
    end
  end
end
