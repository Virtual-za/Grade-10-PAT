unit Character_u;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, Radiant.Shapes, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmCharacter = class(TForm)
    ScaledLayout1: TScaledLayout;
    rdtArrowback: TRadiantChevronArrow;
    lblSelect: TLabel;
    rdtBackground: TRadiantRectangle;
    imgCircle: TImage;
    imgTriangle: TImage;
    imgSquare: TImage;
    btnConfirm: TButton;
    rdtBorderS: TRadiantRectangle;
    rdtBorderT: TRadiantRectangle;
    rdtBorderC: TRadiantRectangle;
    procedure rdtArrowbackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure imgCircleClick(Sender: TObject);
    procedure imgSquareClick(Sender: TObject);
    procedure imgTriangleClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
  private
    { Private declarations }
  public

    TimgSquare: TImage
    { Public declarations }

    end;

  var
    frmCharacter: TfrmCharacter;

implementation

{$R *.fmx}

uses
  Menu_u, Game_u, Difficulty_u;

procedure TfrmCharacter.btnConfirmClick(Sender: TObject);
begin
  if rdtBorderS.Visible = True then
  begin
    frmGame.imgCharacter.bitmap.LoadFromFile('Square.png');
    frmGame.rdtFrame.Fill.Color := Talphacolorrec.cornflowerblue;
    frmGame.rdtFrame.Position.x :=   frmGame.rdtFrame.Position.x - 0.5
  end;



    if rdtBorderC.Visible = True then
    begin
    frmGame.imgCharacter.bitmap.LoadFromFile('Circle.png');
     frmGame.rdtFrame.Fill.Color := Talphacolorrec.Pink;
     frmGame.rdtFrame.Position.y :=   frmGame.rdtFrame.Position.y - 1
    end;


    if rdtBorderT.Visible = True then
     begin
    frmGame.imgCharacter.bitmap.LoadFromFile('Triangle.png');
    frmGame.rdtFrame.Fill.Color := Talphacolorrec.Yellow;
    end;

   frmMenu.ChangeForm(frmCharacter,frmDifficulty, 'Difficulty');
end;

procedure TfrmCharacter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmCharacter.FormCreate(Sender: TObject);
begin
  rdtBackground.Fill.Color := TalphaCOlorrec.Black;
  rdtBackground.Visible := True;
  lblSelect.BringToFront;
  imgSquare.BringToFront;
  imgCircle.BringToFront;
  imgTriangle.BringToFront;
  rdtArrowback.BringToFront;
  TimgSquare := imgSquare;
  rdtBorderC.Visible := False;

  rdtBorderC.Fill.Color := TalphaCOlorrec.Pink;

  rdtBorderS.Visible := False;

  rdtBorderS.Fill.Color := TalphaCOlorrec.BLue;

  rdtBorderT.Visible := False;

  rdtBorderT.Fill.Color := TalphaCOlorrec.Yellow;
end;

procedure TfrmCharacter.imgCircleClick(Sender: TObject);
begin
  rdtBorderC.Visible := True;
  rdtBorderT.Visible := False;
  rdtBorderS.Visible := False;
end;

procedure TfrmCharacter.imgSquareClick(Sender: TObject);
begin
  rdtBorderS.Visible := True;
  rdtBorderT.Visible := False;
  rdtBorderC.Visible := False;
end;

procedure TfrmCharacter.imgTriangleClick(Sender: TObject);
begin
  rdtBorderT.Visible := True;
  rdtBorderS.Visible := False;
  rdtBorderC.Visible := False;
end;

procedure TfrmCharacter.rdtArrowbackClick(Sender: TObject);
begin
  frmMenu.ChangeForm(frmCharacter, frmMenu, 'Menu');
end;

end.
