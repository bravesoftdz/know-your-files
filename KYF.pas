unit KYF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, pngimage, Nyx, Registry,
  MMSystem, ShlObj;

type
  TWin = class(TForm)
    Menu: TMainMenu;
    MenuFile: TMenuItem;
    MenuOptions: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    MenuManExt: TMenuItem;
    MenuExit: TMenuItem;
    MenuAdd: TMenuItem;
    N3: TMenuItem;
    MenuEdit: TMenuItem;
    MenuRemove: TMenuItem;
    MenuKeys: TMenuItem;
    Open: TOpenDialog;
    MenuLanguage: TMenuItem;
    MainEN: TMenuItem;
    MainRS: TMenuItem;
    Description: TMemo;
    BG: TImage;
    AddImage: TImage;
    EditImage: TImage;
    RemoveImage: TImage;
    ActiveTab: TLabel;
    procedure Translate;
    procedure TranslateTo(L: String);
    procedure MenuKeysClick(Sender: TObject);
    procedure EditTxtClick(Sender: TObject);
    procedure MenuExitClick(Sender: TObject);
    procedure MainENClick(Sender: TObject);
    procedure MainRSClick(Sender: TObject);
    procedure AddImageMouseEnter(Sender: TObject);
    procedure EditImageMouseEnter(Sender: TObject);
    procedure RemoveImageMouseEnter(Sender: TObject);
    procedure ShrinkImgs(Sender: TObject);
    procedure AddImageClick(Sender: TObject);
    procedure EditImageClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Win: TWin;
  Lang: TStringList;
implementation

uses KYF_Edit, KYF_Add, KYF_Key;

{$R *.dfm}


procedure TWin.EditImageClick(Sender: TObject);
begin
KYF_Edit.KYFedit.Show;
end;

procedure TWin.EditImageMouseEnter(Sender: TObject);
begin
AddImage.Width:=124;
AddImage.Height:=124;
EditImage.Width:=132;
EditImage.Height:=132;
RemoveImage.Width:=124;
RemoveImage.Height:=124;
ActiveTab.Caption:=TranslateString(Lang, 2, 'Add');
end;

procedure TWin.EditTxtClick(Sender: TObject);
begin
KYF_Edit.KYFedit.Show;
End;

procedure TWin.MainENClick(Sender: TObject);
begin
TranslateTo('EN');
IniWrite('Config.db', 'Config', 'Language', '0x00032');
end;

procedure TWin.MainRSClick(Sender: TObject);
begin
TranslateTo('RS');
IniWrite('Config.db', 'Config', 'Language', '0x00064');
end;

procedure TWin.MenuExitClick(Sender: TObject);
begin
Close;
end;


procedure TWin.FormCreate(Sender: TObject);
begin
Lang:=TStringList.Create;
KYF_Add.Langs:=TStringList.Create;
If IniRead('Config.db', 'Config', 'Language')='0x00032' Then
  Lang.LoadFromFile('EN.db')
Else If IniRead('Config.db', 'Config', 'Language')='0x00064' Then
  Lang.LoadFromFile('RS.db')
Else
  Lang.LoadFromFile('EN.db');
Translate;
Langs.AddStrings(Lang);
KYF_Add.xMenu:=MenuOptions;
KYF_Edit.MenuX:=MenuOptions;
end;

procedure TWin.FormDestroy(Sender: TObject);
begin
Lang.Free;
If Assigned(Langs) Then
  Langs.Free;
end;

procedure TWin.AddImageClick(Sender: TObject);
begin
If Open.Execute Then
Begin
KYF_Add.Extension:='.'+GetExt(Open.FileName);
KYF_Add.WinAdd.Ext.Lines.Text:=KYF_Add.Extension;
KYF_Add.WinAdd.Show;
MenuOptions.Enabled:=False;
End;
  End;

procedure TWin.AddImageMouseEnter(Sender: TObject);
begin
AddImage.Width:=132;
AddImage.Height:=132;
EditImage.Width:=124;
EditImage.Height:=124;
RemoveImage.Width:=124;
RemoveImage.Height:=124;
ActiveTab.Caption:=Lang[1];
end;

procedure TWin.ShrinkImgs(Sender: TObject);
begin
AddImage.Width:=124;
AddImage.Height:=124;
EditImage.Width:=124;
EditImage.Height:=124;
RemoveImage.Width:=124;
RemoveImage.Height:=124;
end;

procedure TWin.MenuKeysClick(Sender: TObject);
begin
KYF_Key.Form3.Show;
end;

procedure TWin.Translate;
begin
{ Translation In Action! }
Win.Caption:=Lang.Strings[0];
MenuFile.Caption:=Lang.Strings[4];
MenuOptions.Caption:=Lang.Strings[5];
MenuManExt.Caption:=Lang.Strings[6];
MenuAdd.Caption:=Lang.Strings[1];
MenuEdit.Caption:=Lang.Strings[2];
MenuRemove.Caption:=Lang.Strings[3];
MenuExit.Caption:=Lang.Strings[7];
MenuLanguage.Caption:=Lang.Strings[8];
MenuKeys.Caption:=Lang.Strings[9];
Open.Filter:=Lang.Strings[10];
Open.Title:=Lang.Strings[11];

{ Done! :) }
End;

procedure TWin.TranslateTo(L: String);
begin
If L='EN' Then
  Lang.LoadFromFile('EN.db')
Else If L='RS' Then
  Lang.LoadFromFile('RS.db');
Translate;
ActiveTab.Caption:='';
end;

procedure TWin.RemoveImageMouseEnter(Sender: TObject);
begin
AddImage.Width:=124;
AddImage.Height:=124;
EditImage.Width:=124;
EditImage.Height:=124;
RemoveImage.Width:=132;
RemoveImage.Height:=132;
ActiveTab.Caption:=Lang.Strings[3];
end;

end.
