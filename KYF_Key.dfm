object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 276
  ClientWidth = 337
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmAuto
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 29
    Width = 194
    Height = 20
    AutoSize = False
    Layout = tlCenter
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 78
    Width = 194
    Height = 20
    AutoSize = False
    Layout = tlCenter
    WordWrap = True
  end
  object Label3: TLabel
    Left = 8
    Top = 134
    Width = 194
    Height = 20
    AutoSize = False
    Layout = tlCenter
    WordWrap = True
  end
  object Label4: TLabel
    Left = 8
    Top = 182
    Width = 194
    Height = 20
    AutoSize = False
    Layout = tlCenter
    WordWrap = True
  end
  object Button1: TButton
    Left = 8
    Top = 238
    Width = 321
    Height = 35
    Caption = 'Apply!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object KeyAdd: TComboBox
    Left = 208
    Top = 29
    Width = 120
    Height = 26
    AutoCompleteDelay = 10
    AutoCloseUp = True
    Style = csOwnerDrawFixed
    DoubleBuffered = True
    DropDownCount = 12
    ItemHeight = 20
    ItemIndex = 0
    ParentDoubleBuffered = False
    TabOrder = 0
    TabStop = False
    Text = 'CTRL+A'
    Items.Strings = (
      'CTRL+A'
      'CTRL+B'
      'CTRL+C'
      'CTRL+D')
  end
  object KeyEdit: TComboBox
    Left = 208
    Top = 78
    Width = 120
    Height = 26
    AutoCompleteDelay = 10
    AutoCloseUp = True
    Style = csOwnerDrawFixed
    DoubleBuffered = True
    DropDownCount = 12
    ItemHeight = 20
    ItemIndex = 0
    ParentDoubleBuffered = False
    TabOrder = 2
    TabStop = False
    Text = 'CTRL+A'
    Items.Strings = (
      'CTRL+A'
      'CTRL+B'
      'CTRL+C'
      'CTRL+D')
  end
  object KeyRemove: TComboBox
    Left = 208
    Top = 134
    Width = 120
    Height = 26
    AutoCompleteDelay = 10
    AutoCloseUp = True
    Style = csOwnerDrawFixed
    DoubleBuffered = True
    DropDownCount = 12
    ItemHeight = 20
    ItemIndex = 0
    ParentDoubleBuffered = False
    TabOrder = 3
    TabStop = False
    Text = 'CTRL+A'
    Items.Strings = (
      'CTRL+A'
      'CTRL+B'
      'CTRL+C'
      'CTRL+D')
  end
  object KeyExit: TComboBox
    Left = 208
    Top = 182
    Width = 120
    Height = 26
    AutoCompleteDelay = 10
    AutoCloseUp = True
    Style = csOwnerDrawFixed
    DoubleBuffered = True
    DropDownCount = 12
    ItemHeight = 20
    ItemIndex = 0
    ParentDoubleBuffered = False
    TabOrder = 4
    TabStop = False
    Text = 'CTRL+A'
    Items.Strings = (
      'CTRL+A'
      'CTRL+B'
      'CTRL+C'
      'CTRL+D')
  end
end
