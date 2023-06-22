program PATphase2_p;

uses
  System.StartUpCopy,
  FMX.Forms,
  Game_u in 'Game_u.pas' {frmGame},
  Menu_u in 'Menu_u.pas' {frmMenu},
  Difficulty_u in 'Difficulty_u.pas' {frmDifficulty},
  About_u in 'About_u.pas' {frmAbout},
  Settings_u in 'Settings_u.pas' {frmSettings},
  Character_u in 'Character_u.pas' {frmCharacter},
  Help_u in 'Help_u.pas' {frmHelp};

{$R *.res}

begin
  Application.Initialize; Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmGame, frmGame);
  Application.CreateForm(TfrmDifficulty, frmDifficulty);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TfrmCharacter, frmCharacter);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.Run;
end.
