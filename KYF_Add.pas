unit KYF_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, jpeg, ExtCtrls, MMSystem, ShlObj,Nyx;

type
  TWinAdd = class(TForm)
    Exe: TMemo;
    Description: TMemo;
    ApplyButton: TButton;
    PathTxt: TLabel;
    DescTxt: TLabel;
    BrowseButton: TButton;
    Ext: TMemo;
    ExtTxt: TLabel;
    Open: TOpenDialog;
    BG: TImage;
    procedure ApplyButtonClick(Sender: TObject);
    procedure BrowseButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
end;

var
  WinAdd: TWinAdd;
  Extension: string;
  Langs: TStringList;
  xMenu: TMenuItem;
implementation

{$R *.dfm}

procedure TWinAdd.ApplyButtonClick(Sender: TObject);
begin
If Description.Lines.Text<>'' Then
  Associate(Extension, Exe.Lines.Text, Exe.Lines.Text, Description.Lines.Text, '"%1"', True, 1)
  Else
Associate(Extension, Exe.Lines.Text, Exe.Lines.Text, '@DESC', '"%1"' , True, 1);
SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, Nil, Nil);
sndPlaySound('Sound', SND_ASYNC);
end;

procedure TWinAdd.BrowseButtonClick(Sender: TObject);
begin
If Open.Execute Then
   Exe.Lines.Text:=Open.FileName;
end;



procedure TWinAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
xMenu.Enabled:=True;
end;

procedure TWinAdd.FormHide(Sender: TObject);
begin
WinAdd.SetFocus;
end;

procedure TWinAdd.FormShow(Sender: TObject);
begin
WinAdd.Caption:=Langs.Strings[0]+' - '+Langs.Strings[1]+' :)';
WinAdd.ExtTxt.Caption:=Langs.Strings[12];
end;

end.
