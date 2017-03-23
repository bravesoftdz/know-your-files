unit KYF_Key;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Nyx;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    KeyAdd: TComboBox;
    KeyEdit: TComboBox;
    KeyRemove: TComboBox;
    KeyExit: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
If (KeyAdd.Text<>'') Then
  IniWrite('Config.db', 'Keys', 'Add', KeyAdd.Text);
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
If IniRead('Config.db', 'Keys', 'Add', '@NULL')<>'@NULL' Then
KeyAdd.Text:=IniRead('Config.db', 'Keys', 'Add', '@NULL');

If IniRead('Config.db', 'Keys', 'Edit', '@NULL')<>'@NULL' Then
KeyEdit.Text:=IniRead('Config.db', 'Keys', 'Edit', '@NULL');

If IniRead('Config.db', 'Keys', 'Remove', '@NULL')<>'@NULL' Then
KeyRemove.Text:=IniRead('Config.db', 'Keys', 'Remove', '@NULL');

If IniRead('Config.db', 'Keys', 'Exit', '@NULL')<>'@NULL' Then
KeyExit.Text:=IniRead('Config.db', 'Keys', 'Exit', '@NULL');
end;

end.
