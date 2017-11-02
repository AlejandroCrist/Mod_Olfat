object frmAddValvulas: TfrmAddValvulas
  Left = 382
  Top = 0
  BorderIcons = []
  Caption = 'A'#241'adir Valvulas'
  ClientHeight = 544
  ClientWidth = 522
  Color = clBtnFace
  Constraints.MinHeight = 544
  Constraints.MinWidth = 522
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gdpElementos: TGridPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 544
    Align = alClient
    ColumnCollection = <
      item
        Value = 25.000000000000000000
      end
      item
        Value = 30.000000000000000000
      end
      item
        Value = 45.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = rdgSelValvulas
        Row = 0
        RowSpan = 4
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = btnComenzar
        Row = 4
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = btnReset
        Row = 5
      end
      item
        Column = 1
        Control = btnSeleccionar
        Row = 3
      end
      item
        Column = 1
        Control = pnlTiempoCiclo
        Row = 2
      end
      item
        Column = 1
        Control = pnlCicloInic
        Row = 1
      end
      item
        Column = 2
        Control = pnlInfo
        Row = 3
        RowSpan = 2
      end
      item
        Column = 2
        Control = memInsert
        Row = 0
        RowSpan = 3
      end
      item
        Column = 1
        Control = pnlValvSelec
        Row = 0
      end
      item
        Column = 2
        Control = btnConfigurar
        Row = 5
      end
      item
        Column = 0
        ColumnSpan = 3
        Control = pnlFicheros
        Row = 6
      end
      item
        Column = 0
        ColumnSpan = 3
        Control = btnSalir
        Row = 7
      end>
    RowCollection = <
      item
        Value = 16.330608884948600000
      end
      item
        Value = 12.247956663711450000
      end
      item
        Value = 12.247956663711450000
      end
      item
        Value = 10.887072589965730000
      end
      item
        Value = 8.165304442474294000
      end
      item
        Value = 8.165304442474294000
      end
      item
        Value = 20.295018927555180000
      end
      item
        Value = 11.660777385159010000
      end>
    ShowCaption = False
    TabOrder = 0
    object rdgSelValvulas: TRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 124
      Height = 273
      Align = alClient
      Caption = 'V'#225'lvulas'
      Items.Strings = (
        'V1'
        'V2'
        'V3'
        'V4'
        'V5'
        'V6'
        'V7'
        'V8'
        'V9')
      TabOrder = 0
      OnClick = rdgSelValvulasClick
    end
    object btnComenzar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 283
      Width = 280
      Height = 38
      Align = alClient
      Caption = 'Comenzar'
      TabOrder = 1
      OnClick = btnComenzarClick
    end
    object btnReset: TButton
      AlignWithMargins = True
      Left = 4
      Top = 327
      Width = 280
      Height = 38
      Align = alClient
      Caption = 'Reset'
      TabOrder = 2
      OnClick = btnResetClick
    end
    object btnSeleccionar: TButton
      AlignWithMargins = True
      Left = 134
      Top = 224
      Width = 150
      Height = 53
      Align = alClient
      Caption = 'Selecccionar'
      TabOrder = 3
      OnClick = btnSeleccionarClick
    end
    object pnlTiempoCiclo: TPanel
      AlignWithMargins = True
      Left = 134
      Top = 158
      Width = 150
      Height = 60
      Align = alClient
      TabOrder = 4
      object lblTiempoCiclo: TLabel
        Left = 0
        Top = 0
        Width = 74
        Height = 60
        Alignment = taCenter
        AutoSize = False
        Caption = 'Tiempo de Ciclo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
      object edtTiempoCiclo: TEdit
        Left = 80
        Top = 16
        Width = 57
        Height = 25
        AutoSize = False
        NumbersOnly = True
        TabOrder = 0
        OnKeyPress = edtTiempoCicloKeyPress
      end
    end
    object pnlCicloInic: TPanel
      AlignWithMargins = True
      Left = 134
      Top = 92
      Width = 150
      Height = 60
      Align = alClient
      TabOrder = 5
      object lblCicloInicio: TLabel
        Left = 8
        Top = 2
        Width = 66
        Height = 55
        Alignment = taCenter
        AutoSize = False
        Caption = 'Inicio de Ciclo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
      object edtCicloInic: TEdit
        Left = 80
        Top = 16
        Width = 57
        Height = 25
        AutoSize = False
        Enabled = False
        NumbersOnly = True
        TabOrder = 0
        Text = '0'
      end
    end
    object pnlInfo: TPanel
      AlignWithMargins = True
      Left = 290
      Top = 224
      Width = 228
      Height = 97
      Align = alClient
      TabOrder = 6
      object Label1: TLabel
        Left = 8
        Top = 9
        Width = 202
        Height = 32
        Caption = '- Introduzca el valor de Tiempo de Ciclo en milisegundos.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label2: TLabel
        Left = 8
        Top = 47
        Width = 198
        Height = 48
        Caption = 
          '- Pulse Configurar para renombrar las V'#225'lvulas, cambiar ubicaci'#243 +
          'n de ficheros y cargar Paradigmas.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
    object memInsert: TMemo
      AlignWithMargins = True
      Left = 290
      Top = 4
      Width = 228
      Height = 214
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 7
    end
    object pnlValvSelec: TPanel
      AlignWithMargins = True
      Left = 134
      Top = 4
      Width = 150
      Height = 82
      Align = alClient
      TabOrder = 8
      object lblTiempo: TLabel
        Left = 16
        Top = 16
        Width = 60
        Height = 19
        Caption = 'Tiempo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblTiempoReal: TLabel
        Left = 16
        Top = 49
        Width = 4
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object btnConfigurar: TButton
      AlignWithMargins = True
      Left = 290
      Top = 327
      Width = 228
      Height = 38
      Align = alClient
      Caption = 'Configurar'
      TabOrder = 9
      OnClick = btnConfigurarClick
    end
    object pnlFicheros: TPanel
      Left = 1
      Top = 368
      Width = 520
      Height = 109
      Align = alClient
      TabOrder = 10
      object Label19: TLabel
        Left = 6
        Top = 20
        Width = 87
        Height = 13
        Caption = 'C:\Ficheros_STMP'
      end
      object Label17: TLabel
        Left = 6
        Top = 58
        Width = 11
        Height = 13
        Caption = 'C:'
      end
      object Label18: TLabel
        Left = 6
        Top = 39
        Width = 11
        Height = 13
        Caption = 'C:'
      end
      object Label20: TLabel
        Left = 6
        Top = 77
        Width = 116
        Height = 16
        Caption = 'GRABAR FICHERO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object flbFicheros: TFileListBox
        Left = 289
        Top = 3
        Width = 228
        Height = 102
        ItemHeight = 13
        TabOrder = 0
      end
      object RadioGroup2: TRadioGroup
        Left = 153
        Top = 73
        Width = 80
        Height = 23
        TabOrder = 1
      end
      object RadioButton10: TRadioButton
        Left = 159
        Top = 75
        Width = 30
        Height = 17
        Caption = 'SI'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object RadioButton11: TRadioButton
        Left = 195
        Top = 75
        Width = 38
        Height = 17
        Caption = 'NO'
        TabOrder = 3
      end
    end
    object btnSalir: TButton
      Left = 1
      Top = 477
      Width = 520
      Height = 66
      Align = alClient
      Caption = 'SALIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = btnSalirClick
    end
  end
end
