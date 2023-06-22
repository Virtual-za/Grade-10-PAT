unit About_u;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, Radiant.Shapes, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmAbout = class(TForm)
    ScaledLayout1: TScaledLayout;
    rdtArrowback: TRadiantChevronArrow;
    rdtBackground: TRadiantRectangle;
    Image1: TImage;
    lblInfo: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdtArrowbackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmAbout: TfrmAbout;

implementation

uses Menu_u;

{$R *.fmx}

procedure TfrmAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  rdtBackground.SendToBack;
  rdtBackground.Visible := True;
  rdtBackground.Fill.Color := Talphacolorrec.Black;
  lblInfo.text :=
    '"24/7 Games" is a game development company who specialises in the ' +
    'development of exciting, engaging and educational video games. "Outside the Box" '
    + 'is a video game in which the focus is to teach the player on the basics of geometry while'
    + ' developing other areas of the brain such as hand-eye coordination, identifying colours and the '
    + 'abilty to work under pressure.'
end;

procedure TfrmAbout.rdtArrowbackClick(Sender: TObject);
begin
  frmMenu.ChangeForm(frmAbout, frmMenu, 'Menu');
end;

end.
