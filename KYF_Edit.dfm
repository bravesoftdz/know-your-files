object KYFedit: TKYFedit
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'File Association Editor'
  ClientHeight = 370
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EditTxt: TLabel
    Left = 0
    Top = 0
    Width = 353
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'The File Association You Wish To Edit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Dungeon'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object TxtParameter: TLabel
    Left = 61
    Top = 65
    Width = 233
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Parameter:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Dungeon'
    Font.Style = []
    ParentFont = False
  end
  object TxtAssociate: TLabel
    Left = 8
    Top = 129
    Width = 344
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Application To Associate With:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Dungeon'
    Font.Style = []
    ParentFont = False
  end
  object ImgIcon: TImage
    Left = 160
    Top = 263
    Width = 32
    Height = 32
    Center = True
    Stretch = True
  end
  object TxtIcon: TLabel
    Left = 136
    Top = 232
    Width = 81
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Icon:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Dungeon'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 8
    Top = 232
    Width = 105
    Height = 105
  end
  object ComboBoxExt: TComboBox
    Left = 5
    Top = 29
    Width = 350
    Height = 30
    Style = csOwnerDrawFixed
    ItemHeight = 24
    TabOrder = 0
    OnChange = ComboBoxExtChange
  end
  object ButtonEdit: TButton
    Left = 61
    Top = 318
    Width = 233
    Height = 39
    Caption = 'Edit!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -28
    Font.Name = 'Dungeon'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonEditClick
  end
  object ComboBoxParameter: TComboBox
    Left = 61
    Top = 88
    Width = 233
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = '%1'
    OnChange = ComboBoxParameterChange
    Items.Strings = (
      '%1'
      '"%1"'
      'Custom')
  end
  object ExePath: TMemo
    Left = 13
    Top = 160
    Width = 281
    Height = 52
    ReadOnly = True
    TabOrder = 3
  end
  object ButtonBrowse: TButton
    Left = 300
    Top = 160
    Width = 52
    Height = 52
    Caption = 'Browse'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = ButtonBrowseClick
  end
  object Open: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Open With...'
    Left = 8
    Top = 64
  end
end
