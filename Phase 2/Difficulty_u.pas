unit Difficulty_u;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  Radiant.Shapes, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Edit;

type
  TfrmDifficulty = class(TForm)
    ScaledLayout1: TScaledLayout;
    rdtArrowback: TRadiantChevronArrow;
    imgEasy: TImage;
    imgHard: TImage;
    imgMedium: TImage;
    lblDifficulty: TLabel;
    RdtBackground: TRadiantRectangle;
    lblUsername: TLabel;
    edtUsername: TEdit;
    lblError: TLabel;
    btnLockin: TButton;
    procedure FormCreate(Sender: TObject);
    procedure rdtArrowback2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgEasyMouseEnter(Sender: TObject);
    procedure imgEasyMouseLeave(Sender: TObject);
    procedure imgMediumMouseEnter(Sender: TObject);
    procedure imgMediumMouseLeave(Sender: TObject);
    procedure imgHardMouseEnter(Sender: TObject);
    procedure imgHardMouseLeave(Sender: TObject);
    procedure btnLockinClick(Sender: TObject);
    procedure imgEasyClick(Sender: TObject);
    procedure imgMediumClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgHardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sUsername: String;
  end;

var
  frmDifficulty: TfrmDifficulty;
  sUsername: string;

implementation

uses Menu_u, Game_u, Character_u, GameMed;

{$R *.fmx}

procedure TfrmDifficulty.btnLockinClick(Sender: TObject);
begin
  sUsername := edtUsername.Text;
  if edtUsername.Text = '' then
  begin
    lblError.Visible := True;
    imgEasy.Enabled := False;
    imgMedium.Enabled := False;
    imgHard.Enabled := False;
  end

  else

  begin
    lblError.Visible := False;
    imgEasy.Enabled := True;
    imgMedium.Enabled := True;
    imgHard.Enabled := True;
    sUsername := edtUsername.Text;
  end;

end;

procedure TfrmDifficulty.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmDifficulty.FormCreate(Sender: TObject);
begin

  sUsername := edtUsername.Text;
  frmDifficulty.fill.Color := TalphaColorrec.Black;
  lblDifficulty.font.Size := 25;
  RdtBackground.SendToBack;
  RdtBackground.fill.Color := TalphaColorrec.Black;
  RdtBackground.Visible := True;

  imgEasy.Enabled := False;
  imgMedium.Enabled := False;
  imgHard.Enabled := False;

  rdtArrowback.Stroke.Color := TalphaColorrec.Black;
  lblError.Visible := False;

end;

procedure TfrmDifficulty.FormShow(Sender: TObject);
begin
  edtUsername.SetFocus;
end;

procedure TfrmDifficulty.imgEasyClick(Sender: TObject);
var
  i: integer;
begin
  frmMenu.Changeform(frmDifficulty, frmGame, 'Game: Easy');

  edtUsername.Text := '';
  frmGame.iTrue := 1;
    frmMenu.mdpMusic.stop;
      frmMenu.mdpMusic.FileName := ('Easy.mp3');

     frmMenu.mdpMusic.play;
end;

procedure TfrmDifficulty.imgEasyMouseEnter(Sender: TObject);
begin
  imgEasy.Position.y := imgEasy.Position.y - 5;
end;

procedure TfrmDifficulty.imgEasyMouseLeave(Sender: TObject);
begin
  imgEasy.Position.y := imgEasy.Position.y + 5;
end;

procedure TfrmDifficulty.imgHardClick(Sender: TObject);
var

  i: integer;
begin
  frmMenu.Changeform(frmDifficulty, frmGame, 'Game: Hard');
  edtUsername.Text := '';
  frmGame.iTrue := 3;
  frmMenu.mdpMusic.stop;
      frmMenu.mdpMusic.FileName := ('Hard.mp3');
     frmMenu.mdpMusic.play;
end;

procedure TfrmDifficulty.imgHardMouseEnter(Sender: TObject);
begin
  imgHard.Position.y := imgEasy.Position.y - 5;
end;

procedure TfrmDifficulty.imgHardMouseLeave(Sender: TObject);
begin
  imgHard.Position.y := imgEasy.Position.y + 5;
end;

procedure TfrmDifficulty.imgMediumClick(Sender: TObject);
var
  i: integer;
begin
  frmMenu.Changeform(frmDifficulty, frmGame, 'Game: Medium');
  edtUsername.Text := '';
  frmGame.iTrue := 2;




  // mdpGame.FileName := ('Easy.mp3');

  frmMenu.mdpMusic.Stop;
  frmMenu.mdpMusic.FileName := ('Medium.mp3');
  frmMenu.mdpMusic.Play;

  frmMenu.mdpMusic.FileName := ('Hard.mp3');

end;

procedure TfrmDifficulty.imgMediumMouseEnter(Sender: TObject);
begin
  imgMedium.Position.y := imgEasy.Position.y - 5;
end;

procedure TfrmDifficulty.imgMediumMouseLeave(Sender: TObject);
begin
  imgMedium.Position.y := imgEasy.Position.y + 5;
end;

procedure TfrmDifficulty.rdtArrowback2Click(Sender: TObject);
begin
  frmMenu.Changeform(frmDifficulty, frmCharacter, 'Menu');
  edtUsername.Text := '';
  lblError.Visible := False;

end;

end.
