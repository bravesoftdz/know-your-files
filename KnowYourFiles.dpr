program KnowYourFiles;





{$R *.dres}

uses
  Forms,
  KYF in 'KYF.pas' {Win},
  KYF_Add in 'KYF_Add.pas' {WinAdd},
  KYF_Key in 'KYF_Key.pas' {Form3},
  KYF_Edit in 'KYF_Edit.pas' {KYFedit};

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown:=DebugHook<>0;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TWin, Win);
  Application.CreateForm(TWinAdd, WinAdd);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TKYFedit, KYFedit);
  Application.Run;
end.
