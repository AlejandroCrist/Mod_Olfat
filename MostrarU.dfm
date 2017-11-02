object frmMostrar: TfrmMostrar
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Mostrar'
  ClientHeight = 559
  ClientWidth = 1006
  Color = clBtnFace
  Constraints.MinHeight = 598
  Constraints.MinWidth = 1022
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 895
    Top = 115
    Width = 51
    Height = 13
    Caption = 'N'#186' Puerto:'
  end
  object Label13: TLabel
    Left = 657
    Top = 71
    Width = 37
    Height = 13
    Caption = 'Label13'
    Visible = False
  end
  object Label14: TLabel
    Left = 657
    Top = 33
    Width = 99
    Height = 13
    Caption = 'Segundos Totales:  -'
  end
  object Label16: TLabel
    Left = 657
    Top = 201
    Width = 56
    Height = 13
    Caption = 'Tarjeta OK.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 657
    Top = 188
    Width = 54
    Height = 13
    Caption = 'TRIG : OFF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 833
    Top = 201
    Width = 51
    Height = 13
    Caption = 'N'#186' Ciclo : -'
  end
  object Label2: TLabel
    Left = 657
    Top = 134
    Width = 106
    Height = 13
    Caption = 'N'#186' de Bytes le'#237'dos  : 0'
  end
  object Label21: TLabel
    Left = 898
    Top = 63
    Width = 37
    Height = 13
    Caption = 'Label21'
  end
  object Label22: TLabel
    Left = 657
    Top = 226
    Width = 39
    Height = 13
    Caption = 'Fichero:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 657
    Top = 150
    Width = 103
    Height = 13
    Caption = 'Valor de Byte le'#237'do : -'
  end
  object Label4: TLabel
    Left = 657
    Top = 169
    Width = 104
    Height = 13
    Caption = 'Tama'#241'o del buffer : 0'
  end
  object Label5: TLabel
    Left = 923
    Top = 19
    Width = 46
    Height = 19
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 897
    Top = 44
    Width = 48
    Height = 13
    Caption = 't_total : 0'
  end
  object Label8: TLabel
    Left = 657
    Top = 52
    Width = 129
    Height = 13
    Caption = 'Trama SINCRONIZACI'#211'N :'
  end
  object lblEtiqTiempo: TLabel
    Left = 10
    Top = 8
    Width = 155
    Height = 23
    Caption = 'Tiempo Ejecuci'#243'n:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblEtiqVal: TLabel
    Left = 379
    Top = 8
    Width = 134
    Height = 23
    Caption = 'Tiempo V'#225'lvula:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTiempo: TLabel
    Left = 171
    Top = 8
    Width = 10
    Height = 23
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTiempoVal: TLabel
    Left = 520
    Top = 8
    Width = 10
    Height = 23
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnAbrirPuerto: TButton
    Left = 895
    Top = 76
    Width = 82
    Height = 25
    Caption = 'Abrir Puerto'
    TabOrder = 0
    OnClick = btnAbrirPuertoClick
  end
  object btnCerrarPuerto: TButton
    Left = 895
    Top = 134
    Width = 82
    Height = 25
    Caption = 'Cerrar Puerto'
    Enabled = False
    TabOrder = 1
    OnClick = btnCerrarPuertoClick
  end
  object btnIniciar: TButton
    Left = 8
    Top = 443
    Width = 96
    Height = 49
    Caption = 'Inicio Manual'
    TabOrder = 2
    OnClick = btnIniciarClick
  end
  object btnSTOP: TButton
    Left = 644
    Top = 480
    Width = 167
    Height = 71
    Caption = 'STOP'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnSTOPClick
  end
  object MaskEdit1: TMaskEdit
    Left = 848
    Top = 107
    Width = 25
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 4
    Text = '   '
  end
  object MaskEdit10: TMaskEdit
    Left = 751
    Top = 80
    Width = 25
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 5
    Text = '   '
  end
  object MaskEdit11: TMaskEdit
    Left = 720
    Top = 80
    Width = 25
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 6
    Text = '   '
  end
  object MaskEdit12: TMaskEdit
    Left = 689
    Top = 80
    Width = 25
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 7
    Text = '   '
  end
  object MaskEdit13: TMaskEdit
    Left = 848
    Top = 49
    Width = 24
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 8
    Text = '   '
  end
  object MaskEdit2: TMaskEdit
    Left = 817
    Top = 107
    Width = 25
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 9
    Text = '   '
  end
  object MaskEdit3: TMaskEdit
    Left = 786
    Top = 107
    Width = 25
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 10
    Text = '   '
  end
  object MaskEdit4: TMaskEdit
    Left = 751
    Top = 107
    Width = 25
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 11
    Text = '   '
  end
  object MaskEdit5: TMaskEdit
    Left = 720
    Top = 107
    Width = 25
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 12
    Text = '   '
  end
  object MaskEdit6: TMaskEdit
    Left = 689
    Top = 107
    Width = 25
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 13
    Text = '   '
  end
  object MaskEdit7: TMaskEdit
    Left = 848
    Top = 80
    Width = 25
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 14
    Text = '   '
  end
  object MaskEdit8: TMaskEdit
    Left = 817
    Top = 80
    Width = 25
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 15
    Text = '   '
  end
  object MaskEdit9: TMaskEdit
    Left = 786
    Top = 80
    Width = 25
    Height = 21
    Alignment = taCenter
    Enabled = False
    EditMask = '###;1;-'
    MaxLength = 3
    TabOrder = 16
    Text = '   '
  end
  object medtNumPuerto: TMaskEdit
    Left = 952
    Top = 107
    Width = 25
    Height = 21
    Alignment = taCenter
    MaxLength = 2
    TabOrder = 17
    Text = '5'
  end
  object memActividad: TMemo
    Left = 112
    Top = 443
    Width = 398
    Height = 109
    ScrollBars = ssVertical
    TabOrder = 18
  end
  object pnlInfoValv: TPanel
    Left = 8
    Top = 48
    Width = 98
    Height = 389
    Align = alCustom
    Caption = 'pnlInfoValv'
    ShowCaption = False
    TabOrder = 19
    object pnlInfoV1: TPanel
      Left = 2
      Top = 18
      Width = 94
      Height = 30
      Align = alCustom
      Caption = 'V'#225'lvula 1'
      TabOrder = 0
    end
    object pnlInfoV2: TPanel
      Left = 2
      Top = 49
      Width = 94
      Height = 30
      Align = alCustom
      Caption = 'V'#225'lvula 2'
      TabOrder = 1
    end
    object pnlInfoV3: TPanel
      Left = 2
      Top = 80
      Width = 94
      Height = 30
      Align = alCustom
      Caption = 'V'#225'lvula 3'
      TabOrder = 2
    end
    object pnlInfoV4: TPanel
      Left = 2
      Top = 125
      Width = 94
      Height = 30
      Align = alCustom
      Caption = 'V'#225'lvula 4'
      TabOrder = 3
    end
    object pnlInfoV5: TPanel
      Left = 2
      Top = 156
      Width = 94
      Height = 30
      Align = alCustom
      Caption = 'V'#225'lvula 5'
      TabOrder = 4
    end
    object pnlInfoV6: TPanel
      Left = 2
      Top = 187
      Width = 94
      Height = 30
      Align = alCustom
      Caption = 'V'#225'lvula 6'
      TabOrder = 5
    end
    object pnlInfoV7: TPanel
      Left = 2
      Top = 232
      Width = 94
      Height = 30
      Align = alCustom
      Caption = 'V'#225'lvula 7'
      TabOrder = 6
    end
    object pnlInfoV8: TPanel
      Left = 2
      Top = 263
      Width = 94
      Height = 30
      Align = alCustom
      Caption = 'V'#225'lvula 8'
      TabOrder = 7
    end
    object pnlInfoV9: TPanel
      Left = 2
      Top = 294
      Width = 94
      Height = 30
      Align = alCustom
      Caption = 'V'#225'lvula 9'
      TabOrder = 8
    end
    object pnlProgreso: TPanel
      Left = 2
      Top = 339
      Width = 94
      Height = 30
      Align = alCustom
      Caption = 'Progreso'
      TabOrder = 9
    end
  end
  object scrbDiagrama: TScrollBox
    Left = 110
    Top = 47
    Width = 508
    Height = 389
    HorzScrollBar.Increment = 15
    HorzScrollBar.Position = 696
    HorzScrollBar.Range = 1200
    Align = alCustom
    AutoScroll = False
    Color = clWhite
    ParentColor = False
    TabOrder = 20
    object pnlDiagrama: TPanel
      Left = -696
      Top = 0
      Width = 1202
      Height = 368
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'pnlDiagrama'
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      object grdpDiagrama: TGridPanel
        Left = 1
        Top = 1
        Width = 1200
        Height = 366
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 'grdpDiagrama'
        ColumnCollection = <
          item
            Value = 50.000000000000000000
          end
          item
            Value = 50.000000000000000000
          end>
        ControlCollection = <>
        ExpandStyle = emAddColumns
        ParentColor = True
        ParentShowHint = False
        RowCollection = <
          item
            SizeStyle = ssAbsolute
            Value = 15.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 30.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 1.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 30.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 1.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 30.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 15.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 30.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 1.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 30.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 1.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 30.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 15.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 30.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 1.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 30.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 1.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 30.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 15.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 30.000000000000000000
          end>
        ShowCaption = False
        ShowHint = False
        TabOrder = 0
      end
    end
  end
  object btnGuardarRutina: TButton
    Left = 516
    Top = 442
    Width = 102
    Height = 109
    Caption = 'Guardar Rutina '
    TabOrder = 21
    OnClick = btnGuardarRutinaClick
  end
  object btnSalir: TButton
    Left = 833
    Top = 480
    Width = 160
    Height = 71
    Caption = 'SALIR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 22
    OnClick = btnSalirClick
  end
  object btnAutomatico: TButton
    Left = 8
    Top = 501
    Width = 98
    Height = 50
    Caption = 'Inicio Automatico'
    TabOrder = 23
    OnClick = btnAutomaticoClick
  end
  object VaComm1: TVaComm
    Baudrate = br115200
    FlowControl.OutCtsFlow = False
    FlowControl.OutDsrFlow = False
    FlowControl.ControlDtr = dtrDisabled
    FlowControl.ControlRts = rtsDisabled
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    FlowControl.DsrSensitivity = False
    FlowControl.TxContinueOnXoff = False
    PortNum = 5
    DeviceName = 'COM%d'
    SettingsStore.RegRoot = rrCURRENTUSER
    SettingsStore.Location = slINIFile
    OnRxChar = VaComm1RxChar
    Version = '1.9.5.1'
    Left = 824
    Top = 145
  end
  object TimerEjec: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerEjecTimer
    Left = 232
    Top = 8
  end
  object sdlGuadarParadig: TSaveDialog
    DefaultExt = 'txt'
    Options = [ofHideReadOnly, ofNoChangeDir, ofNoNetworkButton, ofOldStyleDialog, ofEnableSizing]
    Title = 'Guardar Paradigma'
    Left = 576
    Top = 432
  end
  object TimerDummy: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerDummyTimer
    Left = 320
    Top = 8
  end
end
