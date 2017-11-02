object frmConfigurar: TfrmConfigurar
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Configurar Nombre Valvulas'
  ClientHeight = 417
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrevParad: TPanel
    Left = 220
    Top = -1
    Width = 257
    Height = 418
    TabOrder = 4
    object lblParadigmas: TLabel
      Left = 14
      Top = 19
      Width = 214
      Height = 29
      Alignment = taCenter
      Caption = 'Cargar Paradigma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object lblCarpeta: TLabel
      Left = 14
      Top = 67
      Width = 46
      Height = 13
      Caption = 'Carpeta: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object flbFicherosParad: TFileListBox
      Left = 14
      Top = 91
      Width = 227
      Height = 182
      ItemHeight = 13
      TabOrder = 0
    end
    object btnPrevisualizar: TButton
      Left = 30
      Top = 296
      Width = 187
      Height = 39
      Caption = 'Previsualizar Paradigma'
      TabOrder = 1
      OnClick = btnPrevisualizarClick
    end
    object btnCancelParad: TButton
      Left = 30
      Top = 356
      Width = 187
      Height = 39
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelParadClick
    end
  end
  object pnlNombreValv: TPanel
    Left = 220
    Top = 0
    Width = 257
    Height = 417
    TabOrder = 3
    Visible = False
    object lblTitulo: TLabel
      Left = 7
      Top = 8
      Width = 234
      Height = 23
      Caption = 'Configurar Nombre Valvulas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblv1: TLabel
      Left = 13
      Top = 54
      Width = 52
      Height = 16
      Caption = 'Valvula 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblv2: TLabel
      Left = 13
      Top = 86
      Width = 52
      Height = 16
      Caption = 'Valvula 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblv3: TLabel
      Left = 14
      Top = 118
      Width = 52
      Height = 16
      Caption = 'Valvula 3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblv4: TLabel
      Left = 13
      Top = 150
      Width = 52
      Height = 16
      Caption = 'Valvula 4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblv5: TLabel
      Left = 13
      Top = 182
      Width = 52
      Height = 16
      Caption = 'Valvula 5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblv6: TLabel
      Left = 13
      Top = 214
      Width = 52
      Height = 16
      Caption = 'Valvula 6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblv7: TLabel
      Left = 13
      Top = 246
      Width = 52
      Height = 16
      Caption = 'Valvula 7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblv8: TLabel
      Left = 13
      Top = 278
      Width = 52
      Height = 16
      Caption = 'Valvula 8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblv9: TLabel
      Left = 13
      Top = 310
      Width = 52
      Height = 16
      Caption = 'Valvula 9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnGuardar: TButton
      Left = 8
      Top = 349
      Width = 105
      Height = 46
      Caption = 'Guardar'
      TabOrder = 0
      OnClick = btnGuardarClick
    end
    object gpbEdts: TGroupBox
      Left = 93
      Top = 37
      Width = 154
      Height = 306
      TabOrder = 1
      object edtv1: TEdit
        Left = 3
        Top = 16
        Width = 146
        Height = 21
        TabOrder = 0
        OnKeyPress = KeyPress
      end
      object edtv2: TEdit
        Left = 3
        Top = 48
        Width = 146
        Height = 21
        TabOrder = 1
        OnKeyPress = KeyPress
      end
      object edtv3: TEdit
        Left = 3
        Top = 80
        Width = 146
        Height = 21
        TabOrder = 2
        OnKeyPress = KeyPress
      end
      object edtv4: TEdit
        Left = 3
        Top = 112
        Width = 146
        Height = 21
        TabOrder = 3
        OnKeyPress = KeyPress
      end
      object edtv5: TEdit
        Left = 3
        Top = 144
        Width = 146
        Height = 21
        TabOrder = 4
        OnKeyPress = KeyPress
      end
      object edtv6: TEdit
        Left = 3
        Top = 176
        Width = 146
        Height = 21
        TabOrder = 5
        OnKeyPress = KeyPress
      end
      object edtv7: TEdit
        Left = 3
        Top = 208
        Width = 146
        Height = 21
        TabOrder = 6
        OnKeyPress = KeyPress
      end
      object edtv8: TEdit
        Left = 3
        Top = 240
        Width = 146
        Height = 21
        TabOrder = 7
        OnKeyPress = KeyPress
      end
      object edtv9: TEdit
        Left = 3
        Top = 272
        Width = 146
        Height = 21
        TabOrder = 8
        OnKeyPress = KeyPress
      end
    end
    object btnCancelar: TButton
      Left = 139
      Top = 349
      Width = 106
      Height = 46
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
  object pnlFicheros: TPanel
    Left = 220
    Top = -2
    Width = 257
    Height = 418
    TabOrder = 1
    object lblTituloCambFich: TLabel
      Left = 0
      Top = 9
      Width = 257
      Height = 29
      Alignment = taCenter
      AutoSize = False
      Caption = 'Configurar Ficheros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object lblFichSTMP: TLabel
      Left = 14
      Top = 67
      Width = 120
      Height = 16
      Caption = 'Ruta Ficheros STMP:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblUbSTMP: TLabel
      Left = 30
      Top = 97
      Width = 18
      Height = 16
      Caption = 'C:\'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblFichParadig: TLabel
      Left = 14
      Top = 238
      Width = 154
      Height = 16
      Caption = 'Ruta Ficheros Paradigmas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblUbParadig: TLabel
      Left = 30
      Top = 280
      Width = 18
      Height = 16
      Caption = 'C:\'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnCambiarFichSTMP: TButton
      Left = 14
      Top = 133
      Width = 227
      Height = 56
      Caption = 'Cambiar Ubicaci'#243'n Ficheros STMP'
      TabOrder = 0
      OnClick = btnCambiarFichSTMPClick
    end
    object btnCambiarFichParad: TButton
      Left = 13
      Top = 312
      Width = 227
      Height = 56
      Caption = 'Cambiar Ubicaci'#243'n Ficheros Paradigma'
      TabOrder = 1
      OnClick = btnCambiarFichParadClick
    end
  end
  object pnlBotones: TPanel
    Left = 0
    Top = 0
    Width = 214
    Height = 417
    TabOrder = 0
    object btnConfNomVal: TButton
      Left = 12
      Top = 20
      Width = 190
      Height = 90
      Caption = 'Configurar Nombre V'#225'lvulas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      WordWrap = True
      OnClick = btnConfNomValClick
    end
    object btnFicheros: TButton
      Left = 12
      Top = 130
      Width = 190
      Height = 90
      Caption = 'Configurar Ubicaci'#243'n de Ficheros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = btnFicherosClick
    end
    object btnParadigmas: TButton
      Left = 12
      Top = 240
      Width = 190
      Height = 90
      Caption = 'Cargar Paradigma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      WordWrap = True
      OnClick = btnParadigmasClick
    end
    object btnCerrar: TButton
      Left = 12
      Top = 346
      Width = 190
      Height = 51
      Caption = 'Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnCerrarClick
    end
  end
  object pnlVisParadig: TPanel
    Left = 483
    Top = 0
    Width = 605
    Height = 417
    Caption = 'pnlVisParadig'
    TabOrder = 2
    object pnlInfoValv: TPanel
      Left = 4
      Top = 5
      Width = 98
      Height = 344
      Align = alCustom
      Caption = 'pnlInfoValv'
      ShowCaption = False
      TabOrder = 0
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
    end
    object scrbDiagrama: TScrollBox
      Left = 106
      Top = 5
      Width = 425
      Height = 344
      HorzScrollBar.Increment = 15
      HorzScrollBar.Range = 1200
      Align = alCustom
      AutoScroll = False
      Color = clWhite
      ParentColor = False
      TabOrder = 1
      object pnlDiagrama: TPanel
        Left = 0
        Top = 0
        Width = 1202
        Height = 323
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
          Height = 321
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
    object btnCargarParad: TButton
      Left = 128
      Top = 355
      Width = 289
      Height = 55
      Caption = 'Cargar Paradigma'
      TabOrder = 2
      OnClick = btnCargarParadClick
    end
  end
end
