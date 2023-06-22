unit Menu_u;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Radiant.Shapes,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Colors,
  Game_u,Settings_u,About_u , Difficulty_u,Character_u, Help_u,GameMed,
  FMX.Media;

type
  TfrmMenu = class(TForm)
    rdtcirStart: TRadiantCircle;
    ScaledLayout1: TScaledLayout;
    rdtGrSettings: TRadiantGear;
    rdtNoringClose: TRadiantNoRing;
    imgLogo: TImage;
    imgTitle: TImage;
    rdtTriStart: TRadiantTriangle;
    rdtBackground: TRadiantRectangle;
    imgHelp: TImage;
    mdpMusic: TMediaPlayer;
    procedure FormCreate(Sender: TObject);
    procedure rdtNoringCloseClick(Sender: TObject);
    procedure rdtTriStartClick(Sender: TObject);
    procedure rdtGrSettingsClick(Sender: TObject);
    procedure imgLogoClick(Sender: TObject);
    procedure rdtcirStartClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure imgHelpClick(Sender: TObject);


  private
    { Private declarations }
      public
    { Public declarations }
    procedure ChangeForm(frmHide, frmShow: TForm; sTitle : String);
  end;

var
  frmMenu: TfrmMenu;


implementation

{$R *.fmx}

procedure TfrmMenu.ChangeForm(frmHide, frmShow: TForm; sTitle : String);
begin
  with frmShow do
    begin
      Caption := sTitle;
      Left := frmHide.Left;
      Top := frmHide.Top;
      ClientWidth := frmHide.ClientWidth;
      ClientHeight := frmHide.ClientHeight;
      frmShow.Show;
      frmHide.Hide;
    end;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
   mdpMusic.FileName := 'Menu.mp3';
   mdpMusic.Play;
frmMenu.width := 999;
  frmMenu.height := 720;
  rdtNoringClose.Fill.Color := TalphaColorrec.Red;
  rdtGrSettings.Fill.Color := TalphaColorrec.lightgrey;
  rdtcirStart.Fill.Color := TalphaColorrec.skyblue;
  rdtTriStart.Fill.Color := TalphaColorrec.palegreen;
  rdtBackground.fill.Color := TalphaColorrec.black;
  rdtbackground.SendToBack;
  rdtbackground.Visible := True;


 imgLogo.Hint := 'About';
 rdtNoringClose.hint := 'Exit';
 imgHelp.hint := 'Help';
 rdtGrSettings.hint := 'Settings';
 rdtTriStart.hint := 'Play!';
  rdtCirStart.hint := 'Play!';

end;

procedure TfrmMenu.Image1Click(Sender: TObject);
begin
ChangeForm(frmMenu,frmCharacter,'Character Selection');
end;

procedure TfrmMenu.imgHelpClick(Sender: TObject);
begin
 Changeform(frmMenu,frmHelp,'Help');
end;

procedure TfrmMenu.imgLogoClick(Sender: TObject);
begin
Changeform(frmMenu,frmAbout,'About');
end;

procedure TfrmMenu.rdtcirStartClick(Sender: TObject);
begin
changeform(frmMenu,frmCharacter,'CharacterSelection');

end;

procedure TfrmMenu.rdtGrSettingsClick(Sender: TObject);
begin
Changeform(frmMenu,frmSettings, 'Settings');
end;

procedure TfrmMenu.rdtNoringCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMenu.rdtTriStartClick(Sender: TObject);
begin
  ChangeForm(frmMenu,frmcharacter,'Character Selection');
end;

end.
