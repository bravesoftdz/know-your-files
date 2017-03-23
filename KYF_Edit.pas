unit KYF_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Nyx, Registry, ComCtrls, Menus, ShlObj, MMSystem, ShellAPI;

type
  TKYFedit = class(TForm)
    ComboBoxExt: TComboBox;
    EditTxt: TLabel;
    ButtonEdit: TButton;
    Open: TOpenDialog;
    ComboBoxParameter: TComboBox;
    TxtParameter: TLabel;
    ExePath: TMemo;
    TxtAssociate: TLabel;
    ButtonBrowse: TButton;
    ImgIcon: TImage;
    TxtIcon: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
    procedure ComboBoxParameterChange(Sender: TObject);
    procedure ButtonBrowseClick(Sender: TObject);
    procedure ComboBoxExtChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KYFedit: TKYFedit;
  IconRes: String;
  MenuX: TMenuItem;
implementation

{$R *.dfm}

procedure TKYFedit.ButtonBrowseClick(Sender: TObject);
begin
Open.FileName:='';
If Open.Execute Then
Begin
  ExePath.Lines.Text:=Open.FileName;
  ImgIcon.Picture.Icon.Handle:=ExtractIcon(HInstance, PWideChar(Open.FileName), 0);
End;
end;

procedure TKYFedit.ButtonEditClick(Sender: TObject);
Var Reg: TRegistry;
    RegPath: UnicodeString;
begin
Reg:=TRegistry.Create;
Try
Reg.RootKey:=HKEY_CLASSES_ROOT;
RegPath:='';
RegPath:=ComboBoxExt.Items[ComboBoxExt.ItemIndex];
Reg.OpenKey(RegPath, True);
RegPath:='';
RegPath:=RegPath+'\'+Reg.ReadString('')+'\shell\open\command';
ShowMessage(RegPath);
If Reg.KeyExists(RegPath) Then
Begin
Reg.OpenKey(RegPath, True);
Reg.OpenKey('', True);
Reg.WriteString('', '"'+ExePath.Lines.Text+'" '+ComboBoxParameter.Text);
Reg.CloseKey;
sndPlaySound('Sound', SND_ASYNC);
SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, Nil, Nil);
ShowMessage('Successfully Edited The File Association! :)');
End;
Finally
Reg.Free;
End
  End;

procedure TKYFedit.ComboBoxExtChange(Sender: TObject);
Var Reg: TRegistry;
    RegPath, IconUtil: UnicodeString;
    ExeIndex: Word;
begin
Reg:=TRegistry.Create;
Try
Reg.RootKey:=HKEY_CLASSES_ROOT;
RegPath:='';
RegPath:=ComboBoxExt.Items[ComboBoxExt.ItemIndex];
Reg.OpenKey(RegPath, True);
RegPath:='';
RegPath:=RegPath+'\'+Reg.ReadString('')+'\DefaultIcon\';
Reg.OpenKey(RegPath, True);
IconRes:=Reg.ReadString('');
If FileExists(IconRes) Then
begin
ImgIcon.Picture.Icon.LoadFromFile(IconRes);
end
  Else If Pos('.exe', IconRes)>1 Then
Begin
  IconUtil:=StringReplace(IconRes, '"', '', [rfReplaceAll]);
  IconUtil:=Copy(IconUtil, 0, Pos(',', IconUtil)-1);
  ShowMessage(PChar(IconUtil));
  ImgIcon.Picture.Icon.Handle:=ExtractAssociatedIcon(HINSTANCE_ERROR, PChar(IconUtil), ExeIndex);
End;
Finally
Reg.Free;
End;
 End;

procedure TKYFedit.ComboBoxParameterChange(Sender: TObject);
begin
If ComboBoxParameter.Text='Custom' Then
Begin
  ComboBoxParameter.Items[2]:=InputBox('Parameter Edit:', 'Enter The Parametres:', '%1');
  ComboBoxParameter.ItemIndex:=2;
End;
  End;

procedure TKYFedit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
MenuX.Enabled:=True;
end;

procedure TKYFedit.FormCreate(Sender: TObject);
Var Reg: TRegistry;
    I: Integer;
    Keys: TStringList;
begin
Reg:=TRegistry.Create;
Keys:=TStringList.Create;
Try
Reg.RootKey:=HKEY_CLASSES_ROOT;
Reg.OpenKey('', False);
Reg.GetKeyNames(Keys);
For I:=0 To Keys.Count-1 Do
Begin
If Copy(Keys.Strings[I], 0, 1)='.' Then
  ComboBoxExt.Items.Add(Keys.Strings[I]);
End
Finally
Reg.Free;
Keys.Free;
End;
ComboBoxExt.ItemIndex:=0;
end;

end.

