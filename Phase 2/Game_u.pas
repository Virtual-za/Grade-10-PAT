unit Game_u;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Radiant.Shapes,
  FMX.Controls.Presentation, FMX.StdCtrls, math, FMX.Layouts, FMX.Objects,
  FMX.Media;

type
  TfrmGame = class(TForm)
    tmrGame: TTimer;
    ScaledLayout1: TScaledLayout;
    btnStartEasy: TButton;
    rdtInfo: TRadiantRectangle;
    rdtBackground: TRadiantRectangle;
    RdtArrowBack: TRadiantChevronArrow;
    lblScore: TLabel;
    lblScoreNo: TLabel;
    lblClickon: TLabel;
    imgCharacter: TImage;
    rdtFrame: TRadiantFrame;
    lblUsername: TLabel;
    lblLives: TLabel;
    lblLivesNo: TLabel;
    lblGameOver: TLabel;
    tmrStart: TTimer;
    lblStartno: TLabel;
    btnMainMenu: TButton;
    btnStartMedium: TButton;
    btnStarthard: TButton;
    lblWin: TLabel;
    mdpGame: TMediaPlayer;

    procedure FormCreate(Sender: TObject);
    procedure btnStartEasyClick(Sender: TObject);
    procedure tmrGameTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RdtArrowBackClick(Sender: TObject);

    procedure FormActivate(Sender: TObject);
    procedure tmrStartTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMainMenuClick(Sender: TObject);
    procedure btnStartMediumClick(Sender: TObject);
    procedure btnStarthardClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
    iScore, iScoreAmt, iLives, i, iCountDown, iTrue: Integer;
    iColour: Byte;
    procedure CheckSquare(Sender: TObject);
    procedure CheckCircle(Sender: TObject);
    procedure CheckTriangle(Sender: TObject);

    procedure CheckDiamond(Sender: TObject);
    procedure CheckPentagon(Sender: TObject);
    Procedure CheckTrapezoid(Sender: TObject);

    procedure CheckHexagon(Sender: TObject);
    procedure CheckParallelogram(Sender: TObject);
    Procedure CheckStar(Sender: TObject);
    Procedure BackgroundClick(Sender: TObject);
    Procedure BackgroundClickDead (Sender: TObject);
  end;

var
  frmGame: TfrmGame;
  rdtSquare: TRadiantSquare;
  rdtCircle: TRadiantCircle;
  rdtTriangle: TRadiantTriangle;
  rdtStatic: TRadiantTriangle;
  arrRdtSquare: array [1 .. 19] of TRadiantSquare;
  arrRdtCircle: array [1 .. 19] of TRadiantCircle;
  arrRdtTriangle: array [1 .. 19] of TRadiantTriangle;

  arrRdtDiamond: array [1 .. 19] of TRadiantDiamond;
  arrRdtPentagon: array [1 .. 19] of TRadiantPentagon;
  arrRdttrapezoid: array [1 .. 19] of TRadiantTrapezoid;

  arrRdtHexagon: array [1 .. 19] of TRadiantHexagon;
  arrRdtParallelogram: array [1 .. 19] of TRadiantParallelogram;
  arrRdtStar: array [1 .. 19] of TRadiantStar;

  arrShapeEasyColor: array [1 .. 5] of Talphacolor;
  arrShapeMediumColor: array [1 .. 5] of Talphacolor;

  arrShapeHardColor: array [1 .. 5] of Talphacolor;
  TargetShape_S: TRadiantSquare;
  TargetShape_C: TRadiantCircle;
  TargetShape_T: TRadiantTriangle;
  TShapeColour: Talphacolor;

  TargetShape_D: TRadiantDiamond;
  TargetShape_P: TRadiantPentagon;
  TargetShape_TR: TRadiantTrapezoid;
  TargetShape_H: TRadiantHexagon;
  TargetShape_PA: TRadiantParallelogram;
  TargetShape_ST: TRadiantStar;

implementation

uses Menu_u, Character_u, Difficulty_u;
{$R *.fmx}

procedure TfrmGame.BackgroundClick(Sender: TObject);
begin
  iLives := iLives - 1;
  lblLivesNo.Text := inttostr(iLives);
end;

procedure TfrmGame.BackgroundClickDead(Sender: TObject);
begin
   ilives := ilives + 0;

end;

procedure TfrmGame.btnMainMenuClick(Sender: TObject);
var
  i: Integer;
begin
  frmMenu.mdpMusic.Stop;
  frmMenu.mdpMusic.FileName := 'Menu.mp3';
  frmMenu.mdpMusic.Play;
  frmMenu.ChangeForm(frmGame, frmMenu, 'Main Menu');
  iScore := 0;
  lblScoreNo.Text := '0';
  lblLivesNo.Text := '3';
  lblWin.Visible := False;
  iLives := 3;
  lblGameOver.Visible := False;
  if iTrue = 1 then
  begin
    if Assigned(TargetShape_T) = True then
      TargetShape_T.CleanupInstance;
    if Assigned(TargetShape_S) = True then
      TargetShape_S.CleanupInstance;
    if Assigned(TargetShape_C) = True then
      TargetShape_C.CleanupInstance;

    for i := 1 to 20 do
    begin
      arrRdtSquare[i].CleanupInstance;
      arrRdtCircle[i].CleanupInstance;
      arrRdtTriangle[i].CleanupInstance;

    end;
  end;
  if iTrue = 2 then
  begin
    if Assigned(TargetShape_TR) = True then
      TargetShape_TR.CleanupInstance;
    if Assigned(TargetShape_D) = True then
      TargetShape_D.CleanupInstance;
    if Assigned(TargetShape_P) = True then
      TargetShape_P.CleanupInstance;

    for i := 1 to 20 do
    begin
      arrRdtDiamond[i].CleanupInstance;
      arrRdtPentagon[i].CleanupInstance;
      arrRdttrapezoid[i].CleanupInstance;

    end;
  end;

  if iTrue = 3 then
  begin
    if Assigned(TargetShape_ST) = True then
      TargetShape_ST.CleanupInstance;
    if Assigned(TargetShape_H) = True then
      TargetShape_H.CleanupInstance;
    if Assigned(TargetShape_PA) = True then
      TargetShape_PA.CleanupInstance;

    for i := 1 to 20 do
    begin
      arrRdtHexagon[i].CleanupInstance;
      arrRdtParallelogram[i].CleanupInstance;
      arrRdtStar[i].CleanupInstance;

    end;
  end;
  btnMainMenu.Visible := False;

  frmCharacter.rdtBorderC.Visible := False;
  frmCharacter.rdtBorderT.Visible := False;
  frmCharacter.rdtBorderS.Visible := False;

  frmDifficulty.imgEasy.Enabled := False;
  frmDifficulty.imgMedium.Enabled := False;
  frmDifficulty.imgHard.Enabled := False;

  iTrue := 0;
  tmrStart.Enabled := False;
  tmrGame.Enabled := False;
end;

procedure TfrmGame.btnStartEasyClick(Sender: TObject);
var
  i, iSpace, iShapeEasy: Integer;
  rLeft, iHeight: Real;
begin
  rLeft := 40;
  iSpace := 40;

  for i := 1 to 20 do
  begin
    // square
    arrRdtSquare[i] := TRadiantSquare.Create(frmGame);

    with arrRdtSquare[i] do
    begin

      height := 80;
      width := 80;
      Parent := rdtBackground;
      iHeight := random(500);
      Position.X := rLeft;
      Fill.Color := arrShapeEasyColor[1 + random(4)];
      OnClick := CheckSquare;
      if i = 1 then
      begin
        Position.Y := frmGame.ClientHeight + arrRdtSquare[1].height + iHeight;

      end
      else
        repeat
          iHeight := iHeight + 50;
          Position.Y := frmGame.ClientHeight + iHeight;

        until (Position.Y > (arrRdtCircle[i - 1].Position.Y + arrRdtCircle
          [i - 1].height)) AND
          (Position.Y > (arrRdtTriangle[i - 1].Position.Y + arrRdtTriangle
          [i - 1].height));

    end;

    iHeight := random(1000);
    // circle
    arrRdtCircle[i] := TRadiantCircle.Create(frmGame);
    with arrRdtCircle[i] do
    begin
      height := arrRdtSquare[1].height;
      width := arrRdtSquare[1].width;
      Parent := rdtBackground;
      Fill.Color := arrShapeEasyColor[1 + random(4)];
      Position.X := rLeft;
      OnClick := CheckCircle;
      if i = 1 then
        repeat
          iHeight := iHeight + 50;
          arrRdtCircle[i].Position.Y := frmGame.ClientHeight + iHeight;
        until arrRdtCircle[i].Position.Y >
          (arrRdtSquare[i].Position.Y + arrRdtSquare[i].height)
      else
        repeat
          iHeight := iHeight + 50;
          arrRdtCircle[i].Position.Y := frmGame.ClientHeight + iHeight;
        until (Position.Y > (arrRdtSquare[i].Position.Y + arrRdtSquare[i]
          .height)) AND
          (Position.Y > (arrRdtTriangle[i - 1].Position.Y + arrRdtTriangle
          [i - 1].height))

        end;

      // Triangle
      iHeight := random(1000);
      arrRdtTriangle[i] := TRadiantTriangle.Create(frmGame);
      with arrRdtTriangle[i] do
      begin
        height := arrRdtSquare[1].height;
        width := arrRdtSquare[1].width;
        Parent := rdtBackground;
        Fill.Color := arrShapeEasyColor[1 + random(4)];
        Position.X := rLeft;
        OnClick := CheckTriangle;
        if i = 1 then
          repeat
            iHeight := iHeight + 50;
            arrRdtTriangle[i].Position.Y := frmGame.ClientHeight + iHeight;
          until (Position.Y > (arrRdtSquare[i].Position.Y + arrRdtSquare[i]
            .height)) AND
            (Position.Y > (arrRdtCircle[i].Position.Y + arrRdtCircle[i].height))
        else
          repeat
            iHeight := iHeight + 50;
            arrRdtTriangle[i].Position.Y := frmGame.ClientHeight + iHeight;
          until (Position.Y > (arrRdtSquare[i].Position.Y + arrRdtSquare[i]
            .height)) AND
            (Position.Y > (arrRdtCircle[i].Position.Y + arrRdtCircle[i]
            .height)) end;
        rLeft := rLeft + arrRdtSquare[1].width + iSpace;

      end;

      tmrGame.Enabled := True;
      btnStartEasy.BringToFront;
      rdtInfo.BringToFront;
      btnStartMedium.BringToFront;
      RdtArrowBack.BringToFront;

      lblScore.BringToFront;
      lblScoreNo.BringToFront;
      lblClickon.BringToFront;
      imgCharacter.BringToFront;
      rdtFrame.BringToFront;
      lblLives.BringToFront;
      lblLivesNo.BringToFront;

      iShapeEasy := randomrange(1, 4);

      if iShapeEasy = 1 then
      begin

        TargetShape_S := TRadiantSquare.Create(rdtInfo);

        with TargetShape_S do
        begin
          height := 61;
          width := 61;
          Fill.Color := arrShapeEasyColor[1 + random(4)];
          Position.X := 280;
          Position.Y := 24;
          Parent := rdtInfo;
          TargetShape_S.Visible := True;
          TargetShape_S.BringToFront;
        end;

      end;

      if iShapeEasy = 2 then
      begin
        TargetShape_C := TRadiantCircle.Create(rdtInfo);

        with TargetShape_C do
        begin
          height := 61;
          width := 61;
          Fill.Color := arrShapeEasyColor[1 + random(4)];
          Position.X := 280;
          Position.Y := 24;
          Parent := rdtInfo;
          TargetShape_C.Visible := True;
          TargetShape_C.BringToFront;
        end;
      end;

      if iShapeEasy = 3 then
      begin

        TargetShape_T := TRadiantTriangle.Create(rdtInfo);

        with TargetShape_T do
        begin
          height := 61;
          width := 61;
          Fill.Color := arrShapeEasyColor[1 + random(4)];
          Position.X := 280;
          Position.Y := 24;
          Parent := rdtInfo;
          TargetShape_T.Visible := True;
          TargetShape_T.BringToFront;
        end;

      end;
    end;

    procedure TfrmGame.btnStarthardClick(Sender: TObject);
    var
      i, iSpace, iShapeHard: Integer;
      rLeft, iHeight: Real;
    begin
      iScore := 0;
      rLeft := 40;
      iSpace := 50;

      for i := 1 to 20 do
      begin
        // Hexagon
        arrRdtHexagon[i] := TRadiantHexagon.Create(frmGame);

        with arrRdtHexagon[i] do
        begin

          height := 70;
          width := 100;
          Parent := rdtBackground;
          iHeight := random(500);
          Position.X := rLeft;
          Fill.Color := arrShapeHardColor[1 + random(4)];
          OnClick := CheckHexagon;
          if i = 1 then
          begin
            Position.Y := frmGame.ClientHeight + arrRdtHexagon[1].height
              + iHeight;

          end
          else
            repeat
              iHeight := iHeight + 50;
              Position.Y := frmGame.ClientHeight + iHeight;

            until (Position.Y > (arrRdtParallelogram[i - 1].Position.Y +
              arrRdtParallelogram[i - 1].height)) AND
              (Position.Y > (arrRdtStar[i - 1].Position.Y + arrRdtStar
              [i - 1].height));

        end;

        iHeight := random(1000);
        // Paralellogram
        arrRdtParallelogram[i] := TRadiantParallelogram.Create(frmGame);
        with arrRdtParallelogram[i] do
        begin
          height := 70;
          width := arrRdtHexagon[1].width;
          Parent := rdtBackground;
          Fill.Color := arrShapeHardColor[1 + random(4)];
          Position.X := rLeft;
          OnClick := CheckParallelogram;
          if i = 1 then
            repeat
              iHeight := iHeight + 50;
              arrRdtParallelogram[i].Position.Y := frmGame.ClientHeight
                + iHeight;
            until arrRdtParallelogram[i].Position.Y >
              (arrRdtHexagon[i].Position.Y + arrRdtHexagon[i].height)
          else
            repeat
              iHeight := iHeight + 50;
              arrRdtParallelogram[i].Position.Y := frmGame.ClientHeight
                + iHeight;
            until (Position.Y > (arrRdtHexagon[i].Position.Y + arrRdtHexagon[i]
              .height)) AND
              (Position.Y > (arrRdtStar[i - 1].Position.Y + arrRdtStar
              [i - 1].height))

            end;

          // Star
          iHeight := random(1000);
          arrRdtStar[i] := TRadiantStar.Create(frmGame);
          with arrRdtStar[i] do
          begin
            height := 70;
            width := arrRdtHexagon[1].width;
            Parent := rdtBackground;
            Fill.Color := arrShapeHardColor[1 + random(4)];
            Position.X := rLeft;
            OnClick := CheckStar;
            if i = 1 then
              repeat
                iHeight := iHeight + 50;
                arrRdtStar[i].Position.Y := frmGame.ClientHeight + iHeight;
              until (Position.Y > (arrRdtHexagon[i].Position.Y + arrRdtHexagon
                [i].height)) AND
                (Position.Y > (arrRdtParallelogram[i].Position.Y +
                arrRdtParallelogram[i].height))
            else
              repeat
                iHeight := iHeight + 50;
                arrRdtStar[i].Position.Y := frmGame.ClientHeight + iHeight;
              until (Position.Y > (arrRdtHexagon[i].Position.Y + arrRdtHexagon
                [i].height)) AND
                (Position.Y > (arrRdtParallelogram[i].Position.Y +
                arrRdtParallelogram[i].height)) end;
            rLeft := rLeft + arrRdtHexagon[1].width + iSpace;

          end;

          tmrGame.Enabled := True;
          btnStartEasy.BringToFront;
          rdtInfo.BringToFront;
          btnStartMedium.BringToFront;
          btnStarthard.BringToFront;
          RdtArrowBack.BringToFront;

          lblScore.BringToFront;
          lblScoreNo.BringToFront;
          lblClickon.BringToFront;
          imgCharacter.BringToFront;
          rdtFrame.BringToFront;
          lblLives.BringToFront;
          lblLivesNo.BringToFront;

          iShapeHard := randomrange(1, 4);

          if iShapeHard = 1 then
          begin

            TargetShape_H := TRadiantHexagon.Create(rdtInfo);

            with TargetShape_H do
            begin
              height := 41;
              width := 61;
              Fill.Color := arrShapeHardColor[1 + random(4)];
              Position.X := 280;
              Position.Y := 24;
              Parent := rdtInfo;
              TargetShape_H.Visible := True;
              TargetShape_H.BringToFront;
            end;

          end;

          if iShapeHard = 2 then
          begin
            TargetShape_PA := TRadiantParallelogram.Create(rdtInfo);

            with TargetShape_PA do
            begin
              height := 61;
              width := 61;
              Fill.Color := arrShapeHardColor[1 + random(4)];
              Position.X := 280;
              Position.Y := 24;
              Parent := rdtInfo;
              TargetShape_PA.Visible := True;
              TargetShape_PA.BringToFront;
            end;
          end;

          if iShapeHard = 3 then
          begin

            TargetShape_ST := TRadiantStar.Create(rdtInfo);

            with TargetShape_ST do
            begin
              height := 41;
              width := 61;
              Fill.Color := arrShapeHardColor[1 + random(4)];
              Position.X := 280;
              Position.Y := 24;
              Parent := rdtInfo;
              TargetShape_ST.Visible := True;
              TargetShape_ST.BringToFront;
            end;

          end;
        end;

        procedure TfrmGame.btnStartMediumClick(Sender: TObject);
        var
          i, iSpace, iShapeMedium: Integer;
          rLeft, iHeight: Real;
        begin
          rLeft := 40;
          iSpace := 60;

          for i := 1 to 20 do
          begin
            // Diamond
            arrRdtDiamond[i] := TRadiantDiamond.Create(frmGame);

            with arrRdtDiamond[i] do
            begin

              height := 70;
              width := 100;
              Parent := rdtBackground;
              iHeight := random(500);
              Position.X := rLeft;
              Fill.Color := arrShapeMediumColor[1 + random(4)];
              OnClick := CheckDiamond;
              if i = 1 then
              begin
                Position.Y := frmGame.ClientHeight + arrRdtDiamond[1].height
                  + iHeight;

              end
              else
                repeat
                  iHeight := iHeight + 50;
                  Position.Y := frmGame.ClientHeight + iHeight;

                until (Position.Y > (arrRdtPentagon[i - 1].Position.Y +
                  arrRdtPentagon[i - 1].height)) AND
                  (Position.Y > (arrRdttrapezoid[i - 1].Position.Y +
                  arrRdttrapezoid[i - 1].height));

            end;

            iHeight := random(1000);
            // Pentagon
            arrRdtPentagon[i] := TRadiantPentagon.Create(frmGame);
            with arrRdtPentagon[i] do
            begin
              height := 70;
              width := arrRdtDiamond[1].width;
              Parent := rdtBackground;
              Fill.Color := arrShapeMediumColor[1 + random(4)];
              Position.X := rLeft;
              OnClick := CheckPentagon;
              if i = 1 then
                repeat
                  iHeight := iHeight + 50;
                  arrRdtPentagon[i].Position.Y := frmGame.ClientHeight
                    + iHeight;
                until arrRdtPentagon[i].Position.Y >
                  (arrRdtDiamond[i].Position.Y + arrRdtDiamond[i].height)
              else
                repeat
                  iHeight := iHeight + 50;
                  arrRdtPentagon[i].Position.Y := frmGame.ClientHeight
                    + iHeight;
                until (Position.Y > (arrRdtDiamond[i].Position.Y + arrRdtDiamond
                  [i].height)) AND
                  (Position.Y > (arrRdttrapezoid[i - 1].Position.Y +
                  arrRdttrapezoid[i - 1].height))

                end;

              // Trapezoid
              iHeight := random(1000);
              arrRdttrapezoid[i] := TRadiantTrapezoid.Create(frmGame);
              with arrRdttrapezoid[i] do
              begin
                height := 70;
                width := arrRdtDiamond[1].width;
                Parent := rdtBackground;
                Fill.Color := arrShapeMediumColor[1 + random(4)];
                Position.X := rLeft;
                OnClick := CheckTrapezoid;
                if i = 1 then
                  repeat
                    iHeight := iHeight + 50;
                    arrRdttrapezoid[i].Position.Y := frmGame.ClientHeight
                      + iHeight;
                  until (Position.Y > (arrRdtDiamond[i].Position.Y +
                    arrRdtDiamond[i].height)) AND
                    (Position.Y > (arrRdtPentagon[i].Position.Y + arrRdtPentagon
                    [i].height))
                else
                  repeat
                    iHeight := iHeight + 50;
                    arrRdttrapezoid[i].Position.Y := frmGame.ClientHeight
                      + iHeight;
                  until (Position.Y > (arrRdtDiamond[i].Position.Y +
                    arrRdtDiamond[i].height)) AND
                    (Position.Y > (arrRdtPentagon[i].Position.Y + arrRdtPentagon
                    [i].height)) end;
                rLeft := rLeft + arrRdtDiamond[1].width + iSpace;

              end;

              tmrGame.Enabled := True;
              btnStartEasy.BringToFront;
              rdtInfo.BringToFront;
              btnStartMedium.BringToFront;
              RdtArrowBack.BringToFront;

              lblScore.BringToFront;
              lblScoreNo.BringToFront;
              lblClickon.BringToFront;
              imgCharacter.BringToFront;
              rdtFrame.BringToFront;
              lblLives.BringToFront;
              lblLivesNo.BringToFront;

              iShapeMedium := randomrange(1, 4);

              if iShapeMedium = 1 then
              begin

                TargetShape_D := TRadiantDiamond.Create(rdtInfo);

                with TargetShape_D do
                begin
                  height := 41;
                  width := 61;
                  Fill.Color := arrShapeMediumColor[1 + random(4)];
                  Position.X := 280;
                  Position.Y := 24;
                  Parent := rdtInfo;
                  TargetShape_D.Visible := True;
                  TargetShape_D.BringToFront;
                end;

              end;

              if iShapeMedium = 2 then
              begin
                TargetShape_P := TRadiantPentagon.Create(rdtInfo);

                with TargetShape_P do
                begin
                  height := 61;
                  width := 61;
                  Fill.Color := arrShapeMediumColor[1 + random(4)];
                  Position.X := 280;
                  Position.Y := 24;
                  Parent := rdtInfo;
                  TargetShape_P.Visible := True;
                  TargetShape_P.BringToFront;
                end;
              end;

              if iShapeMedium = 3 then
              begin

                TargetShape_TR := TRadiantTrapezoid.Create(rdtInfo);

                with TargetShape_TR do
                begin
                  height := 41;
                  width := 61;
                  Fill.Color := arrShapeMediumColor[1 + random(4)];
                  Position.X := 280;
                  Position.Y := 24;
                  Parent := rdtInfo;
                  TargetShape_TR.Visible := True;
                  TargetShape_TR.BringToFront;
                end;

              end;

            end;

            procedure TfrmGame.CheckCircle(Sender: TObject);
            begin
              if Assigned(TargetShape_C) = True then
                if (Sender as TRadiantCircle).Fill.Color = TargetShape_C.Fill.Color
                then
                begin
                  iScore := iScore + iScoreAmt;
                  lblScoreNo.Text := inttostr(iScore);
                  (Sender as TRadiantCircle).Visible := False;
                  (Sender as TRadiantCircle).Enabled := False;
                end
                else
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end

              else
              begin
                iLives := iLives - 1;
                lblLivesNo.Text := inttostr(iLives);
              end;
              if Assigned(TargetShape_C) = True then
                if (TargetShape_C.Position.Y - TargetShape_C.height) >
                  (ClientHeight - 129) then
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end;
            end;

            procedure TfrmGame.CheckDiamond(Sender: TObject);
            begin
              if Assigned(TargetShape_D) = True then
                if (Sender as TRadiantDiamond).Fill.Color = TargetShape_D.Fill.Color
                then
                begin
                  iScore := iScore + iScoreAmt;
                  lblScoreNo.Text := inttostr(iScore);
                  (Sender as TRadiantDiamond).Visible := False;
                  (Sender as TRadiantDiamond).Enabled := False;
                end
                else
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end

              else
              begin
                iLives := iLives - 1;
                lblLivesNo.Text := inttostr(iLives);
              end;
              if Assigned(TargetShape_D) = True then
                if (TargetShape_D.Position.Y - TargetShape_D.height) >
                  (ClientHeight - 129) then
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end;
            end;

            procedure TfrmGame.CheckHexagon(Sender: TObject);
            begin
              begin
                if Assigned(TargetShape_H) = True then
                  if (Sender as TRadiantHexagon)
                    .Fill.Color = TargetShape_H.Fill.Color then
                  begin
                    iScore := iScore + iScoreAmt;
                    lblScoreNo.Text := inttostr(iScore);
                    (Sender as TRadiantHexagon).Visible := False;
                    (Sender as TRadiantHexagon).Enabled := False;
                  end
                  else
                  begin
                    iLives := iLives - 1;
                    lblLivesNo.Text := inttostr(iLives);
                  end

                else
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end;
              end;
              if Assigned(TargetShape_H) = True then
                if (TargetShape_H.Position.Y - TargetShape_H.height) >
                  (ClientHeight - 129) then
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end;
            end;

            procedure TfrmGame.CheckParallelogram(Sender: TObject);
            begin
              begin
                if Assigned(TargetShape_PA) = True then
                  if (Sender as TRadiantParallelogram)
                    .Fill.Color = TargetShape_PA.Fill.Color then
                  begin
                    iScore := iScore + iScoreAmt;
                    lblScoreNo.Text := inttostr(iScore);
                    (Sender as TRadiantParallelogram).Visible := False;
                    (Sender as TRadiantParallelogram).Enabled := False;
                  end
                  else
                  begin
                    iLives := iLives - 1;
                    lblLivesNo.Text := inttostr(iLives);
                  end

                else
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end;
              end;
              if Assigned(TargetShape_PA) = True then
                if (TargetShape_PA.Position.Y - TargetShape_PA.height) >
                  (ClientHeight - 129) then
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end;
            end;

            procedure TfrmGame.CheckPentagon(Sender: TObject);
            begin
              if Assigned(TargetShape_P) = True then
                if (Sender as TRadiantPentagon).Fill.Color = TargetShape_P.Fill.Color
                then
                begin
                  iScore := iScore + iScoreAmt;
                  lblScoreNo.Text := inttostr(iScore);
                  (Sender as TRadiantPentagon).Visible := False;
                  (Sender as TRadiantPentagon).Enabled := False;
                end
                else
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end

              else
              begin
                iLives := iLives - 1;
                lblLivesNo.Text := inttostr(iLives);
              end;
              if Assigned(TargetShape_P) = True then
                if (TargetShape_P.Position.Y - TargetShape_P.height) >
                  (ClientHeight - 129) then
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end;
            end;

            procedure TfrmGame.CheckSquare(Sender: TObject);
            begin
              if Assigned(TargetShape_S) = True then
                if (Sender as TRadiantSquare).Fill.Color = TargetShape_S.Fill.Color
                then
                begin
                  iScore := iScore + iScoreAmt;
                  lblScoreNo.Text := inttostr(iScore);
                  (Sender as TRadiantSquare).Visible := False;
                  (Sender as TRadiantSquare).Enabled := False;
                end
                else
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end

              else
              begin
                iLives := iLives - 1;
                lblLivesNo.Text := inttostr(iLives);
              end;
              if Assigned(TargetShape_S) = True then
                if (TargetShape_S.Position.Y - TargetShape_S.height) >
                  (ClientHeight - 129) then
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end;
            end;

            procedure TfrmGame.CheckStar(Sender: TObject);
            begin
              if Assigned(TargetShape_ST) = True then
                if (Sender as TRadiantStar).Fill.Color = TargetShape_ST.Fill.Color
                then
                begin
                  iScore := iScore + iScoreAmt;
                  lblScoreNo.Text := inttostr(iScore);
                  (Sender as TRadiantStar).Visible := False;
                  (Sender as TRadiantStar).Enabled := False;
                end
                else
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end

              else
              begin
                iLives := iLives - 1;
                lblLivesNo.Text := inttostr(iLives);
              end;
              if Assigned(TargetShape_ST) = True then
                if (TargetShape_ST.Position.Y - TargetShape_ST.height) >
                  (ClientHeight - 129) then
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end;
            end;

            procedure TfrmGame.CheckTrapezoid(Sender: TObject);
            begin
              if Assigned(TargetShape_TR) = True then
                if (Sender as TRadiantTrapezoid)
                  .Fill.Color = TargetShape_TR.Fill.Color then
                begin
                  iScore := iScore + iScoreAmt;
                  lblScoreNo.Text := inttostr(iScore);
                  (Sender as TRadiantTrapezoid).Visible := False;
                  (Sender as TRadiantTrapezoid).Enabled := False;
                end
                else
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end

              else
              begin
                iLives := iLives - 1;
                lblLivesNo.Text := inttostr(iLives);
              end;

              if Assigned(TargetShape_TR) = True then
                if (TargetShape_TR.Position.Y - TargetShape_TR.height) >
                  (ClientHeight - 129) then
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end;

            end;

            procedure TfrmGame.CheckTriangle(Sender: TObject);

            begin
              if Assigned(TargetShape_T) = True then
                if (Sender as TRadiantTriangle).Fill.Color = TargetShape_T.Fill.Color
                then
                begin
                  iScore := iScore + iScoreAmt;
                  lblScoreNo.Text := inttostr(iScore);
                  (Sender as TRadiantTriangle).Visible := False;
                  (Sender as TRadiantTriangle).Enabled := False;

                end
                else
                begin
                  iLives := iLives - 1;
                  lblLivesNo.Text := inttostr(iLives);
                end

              else
              begin
                iLives := iLives - 1;
                lblLivesNo.Text := inttostr(iLives);
              end;

            end;

            procedure TfrmGame.FormActivate(Sender: TObject);
            begin
              lblUsername.FontColor := Talphacolorrec.White;
              lblUsername.Text := frmDifficulty.sUsername;

              lblUsername.font.Size := 20;
              lblUsername.Parent := rdtInfo;
              lblUsername.BringToFront;
              tmrStart.Enabled := True;
            end;

            procedure TfrmGame.FormClose(Sender: TObject;
              var Action: TCloseAction);
            begin
              Application.Terminate;
            end;

            procedure TfrmGame.FormCreate(Sender: TObject);
            var
              iColour, iShape, k: Integer;
              i: Integer;

            begin
              with lblUsername do
              begin

                Visible := True;
                textsettings.FontColor := Talphacolorrec.White;

                BringToFront;
                Parent := rdtInfo;
              end;

              frmGame.lblUsername.Text := sUsername;
              lblUsername.BringToFront;
              iScoreAmt := 10;
              frmGame.width := 999;
              frmGame.height := 720;
              frmGame.Fill.Color := Talphacolorrec.Black;
              rdtBackground.Fill.Color := Talphacolorrec.Black;
              RdtArrowBack.Fill.Color := Talphacolorrec.Lightgrey;
              rdtInfo.Stroke.Color := Talphacolorrec.Orangered;
              rdtInfo.Fill.Color := Talphacolorrec.Black;
              rdtFrame.BringToFront;
              lblUsername.BringToFront;
              iLives := 3;
              lblStartno.Visible := True;
              iCountDown := 3;
              btnStartEasy.Visible := False;
              btnStartMedium.Visible := False;
              btnStarthard.Visible := False;
              tmrStart.Enabled := False;
              btnMainMenu.Visible := False;
              lblWin.Visible := False;
              iTrue := 0;

              arrShapeEasyColor[4] := Talphacolorrec.red;
              arrShapeEasyColor[3] := Talphacolorrec.Green;

              arrShapeEasyColor[2] := Talphacolorrec.Yellow;

              arrShapeMediumColor[4] := Talphacolorrec.HotPink;
              arrShapeMediumColor[3] := Talphacolorrec.Aqua;

              arrShapeMediumColor[2] := Talphacolorrec.Khaki;

              arrShapeHardColor[4] := Talphacolorrec.Orange;
              arrShapeHardColor[3] := Talphacolorrec.Purple;

              arrShapeHardColor[2] := Talphacolorrec.Blue;

            end;

            procedure TfrmGame.FormShow(Sender: TObject);
            begin
              tmrStart.Enabled := True;

            end;

            procedure TfrmGame.RdtArrowBackClick(Sender: TObject);
            var
              i: Integer;
            begin
              frmMenu.ChangeForm(frmGame, frmDifficulty, 'Difficulty');
              frmMenu.mdpMusic.Stop;
              frmMenu.mdpMusic.FileName := 'Menu.mp3';
              frmMenu.mdpMusic.Play;
              iLives := 3;
              iScore := 0;
              lblScoreNo.Text := '0';
              lblLivesNo.Text := '3';

              lblGameOver.Visible := False;
              if iTrue = 1 then
              begin
                if Assigned(TargetShape_T) = True then
                  TargetShape_T.CleanupInstance;
                if Assigned(TargetShape_S) = True then
                  TargetShape_S.CleanupInstance;
                if Assigned(TargetShape_C) = True then
                  TargetShape_C.CleanupInstance;

                for i := 1 to 20 do
                begin
                  arrRdtSquare[i].CleanupInstance;
                  arrRdtCircle[i].CleanupInstance;
                  arrRdtTriangle[i].CleanupInstance;

                end;

              end;
              if iTrue = 2 then
              begin
                if Assigned(TargetShape_TR) = True then
                  TargetShape_TR.CleanupInstance;
                if Assigned(TargetShape_D) = True then
                  TargetShape_D.CleanupInstance;
                if Assigned(TargetShape_P) = True then
                  TargetShape_P.CleanupInstance;

                for i := 1 to 20 do
                begin
                  arrRdtDiamond[i].CleanupInstance;
                  arrRdtPentagon[i].CleanupInstance;
                  arrRdttrapezoid[i].CleanupInstance;
                end;
              end;

              if iTrue = 3 then
              begin
                if Assigned(TargetShape_H) = True then
                  TargetShape_H.CleanupInstance;
                if Assigned(TargetShape_PA) = True then
                  TargetShape_PA.CleanupInstance;
                if Assigned(TargetShape_ST) = True then
                  TargetShape_ST.CleanupInstance;

                for i := 1 to 20 do
                begin
                  arrRdtHexagon[i].CleanupInstance;
                  arrRdtParallelogram[i].CleanupInstance;
                  arrRdtStar[i].CleanupInstance;
                end;
              end;
              frmDifficulty.imgEasy.Enabled := False;
              frmDifficulty.imgMedium.Enabled := False;
              frmDifficulty.imgHard.Enabled := False;

              iTrue := 0;
              tmrStart.Enabled := False;
              tmrGame.Enabled := False;
              iScore := 0;
              iLives := 3;
            end;

            procedure TfrmGame.tmrGameTimer(Sender: TObject);
            var
              i, iCOunt, iSpeedUp, iSpeedM, iSpeedH, iSpeedE: Integer;
            begin
              iSpeedM := 10;
              iSpeedE := 6;

              rdtBackground.OnClick := BackgroundClick;
              if iTrue = 1 then

              begin
                iSpeedUp := 2;
                if iScore > 50 then

                  iSpeedE := iSpeedE + iSpeedUp;
                if iScore > 100 then
                  iSpeedE := iSpeedE + iSpeedUp;
                if iScore > 150 then
                  iSpeedE := iSpeedE + iSpeedUp;
                if iScore > 200 then
                  iSpeedE := iSpeedE + iSpeedUp;
                if iScore > 250 then
                  iSpeedE := iSpeedE + iSpeedUp;

                for i := 1 to 20 do
                begin

                  if arrRdtSquare[i].Position.Y + arrRdtSquare[i].height <= 0
                  then
                    arrRdtSquare[i].Position.Y := frmGame.ClientHeight + 5
                  else
                    arrRdtSquare[i].Position.Y := arrRdtSquare[i].Position.Y
                      - iSpeedE;

                  if arrRdtCircle[i].Position.Y + arrRdtCircle[i].height <= 0
                  then
                    arrRdtCircle[i].Position.Y := frmGame.ClientHeight + 5

                  else
                    arrRdtCircle[i].Position.Y := arrRdtCircle[i].Position.Y
                      - iSpeedE;

                  if arrRdtTriangle[i].Position.Y + arrRdtTriangle[i].height <= 0
                  then
                    arrRdtTriangle[i].Position.Y := frmGame.ClientHeight + 5
                  else
                    arrRdtTriangle[i].Position.Y := arrRdtTriangle[i].Position.Y
                      - iSpeedE;

                  if arrRdtSquare[i].Position.Y > 500 then
                  begin
                    arrRdtSquare[i].Fill.Color := arrShapeEasyColor
                      [randomrange(2, 5)];
                    arrRdtSquare[i].Visible := True;
                    arrRdtSquare[i].Enabled := True;
                  end;

                  if arrRdtCircle[i].Position.Y > 500 then
                  begin
                    arrRdtCircle[i].Fill.Color := arrShapeEasyColor
                      [randomrange(2, 5)];
                    arrRdtCircle[i].Visible := True;
                    arrRdtCircle[i].Enabled := True;
                  end;
                  if arrRdtTriangle[i].Position.Y > 500 then
                  begin
                    arrRdtTriangle[i].Fill.Color := arrShapeEasyColor
                      [randomrange(2, 5)];
                    arrRdtTriangle[i].Visible := True;
                    arrRdtTriangle[i].Enabled := True;
                  end;
                  if iLives = 0 then
                  begin
                    arrRdtCircle[i].Visible := False;
                    arrRdtSquare[i].Visible := False;
                    arrRdtTriangle[i].Visible := False;

                    lblGameOver.Visible := True;
                    lblGameOver.BringToFront;
                    btnMainMenu.Visible := True
                  end;

                end;
                if iScore > 250 then
                begin
                  lblWin.Visible := True;
                  btnMainMenu.Visible := True;

                  for i := 1 to 20 do
                  begin
                    arrRdtSquare[i].CleanupInstance;
                    arrRdtCircle[i].CleanupInstance;
                    arrRdtTriangle[i].CleanupInstance;

                  end;
                end;
              end;

              if iTrue = 2 then
              begin
                iSpeedUp := 1;
                if iScore > 50 then

                  iSpeedM := iSpeedM + iSpeedUp;
                if iScore > 100 then
                  iSpeedM := iSpeedM + iSpeedUp;
                if iScore > 150 then
                  iSpeedM := iSpeedM + iSpeedUp;
                if iScore > 200 then
                  iSpeedM := iSpeedM + iSpeedUp;
                if iScore > 250 then
                  iSpeedM := iSpeedM + iSpeedUp;

                for i := 1 to 20 do
                begin
                  if arrRdtDiamond[i].Position.Y + arrRdtDiamond[i].height <= 0
                  then
                    arrRdtDiamond[i].Position.Y := frmGame.ClientHeight + 5
                  else
                    arrRdtDiamond[i].Position.Y := arrRdtDiamond[i].Position.Y
                      - iSpeedM;

                  if arrRdtPentagon[i].Position.Y + arrRdtPentagon[i].height <= 0
                  then
                    arrRdtPentagon[i].Position.Y := frmGame.ClientHeight + 5

                  else
                    arrRdtPentagon[i].Position.Y := arrRdtPentagon[i].Position.Y
                      - iSpeedM;

                  if arrRdttrapezoid[i].Position.Y + arrRdttrapezoid[i]
                    .height <= 0 then
                    arrRdttrapezoid[i].Position.Y := frmGame.ClientHeight + 5
                  else
                    arrRdttrapezoid[i].Position.Y := arrRdttrapezoid[i]
                      .Position.Y - iSpeedM;

                  if arrRdtDiamond[i].Position.Y > 500 then
                  begin
                    arrRdtDiamond[i].Fill.Color := arrShapeMediumColor
                      [randomrange(2, 5)];
                    arrRdtDiamond[i].Visible := True;
                    arrRdtDiamond[i].Enabled := True;

                  end;

                  if arrRdtPentagon[i].Position.Y > 500 then
                  begin
                    arrRdtPentagon[i].Fill.Color := arrShapeMediumColor
                      [randomrange(2, 5)];
                    arrRdtPentagon[i].Visible := True;
                    arrRdtPentagon[i].Enabled := True;

                  end;
                  if arrRdttrapezoid[i].Position.Y > 500 then
                  begin
                    arrRdttrapezoid[i].Fill.Color := arrShapeMediumColor
                      [randomrange(2, 5)];
                    arrRdttrapezoid[i].Visible := True;
                    arrRdttrapezoid[i].Enabled := True;

                  end;

                  if iLives = 0 then
                  begin
                    arrRdtPentagon[i].Visible := False;
                    arrRdtDiamond[i].Visible := False;
                    arrRdttrapezoid[i].Visible := False;

                    lblGameOver.Visible := True;
                    lblGameOver.BringToFront;
                    btnMainMenu.Visible := True
                  end;

                end;
                if iScore > 250 then
                begin

                  lblWin.Visible := True;
                  btnMainMenu.Visible := True;
                  if Assigned(TargetShape_TR) = True then
                    TargetShape_TR.CleanupInstance;
                  if Assigned(TargetShape_D) = True then
                    TargetShape_D.CleanupInstance;
                  if Assigned(TargetShape_P) = True then
                    TargetShape_P.CleanupInstance;

                  for i := 1 to 20 do
                  begin
                    arrRdtDiamond[i].CleanupInstance;
                    arrRdtPentagon[i].CleanupInstance;
                    arrRdttrapezoid[i].CleanupInstance;

                  end;
                end;
              end;
              iSpeedH := 13;
              if iTrue = 3 then
              begin
                iSpeedUp := 1;
                if iScore > 50 then

                  iSpeedH := iSpeedH + iSpeedUp;
                if iScore > 100 then
                  iSpeedH := iSpeedH + iSpeedUp;
                if iScore > 150 then
                  iSpeedH := iSpeedH + iSpeedUp;
                if iScore > 200 then
                  iSpeedH := iSpeedH + iSpeedUp;
                if iScore > 250 then
                  iSpeedH := iSpeedH + iSpeedUp;

                for i := 1 to 20 do
                begin
                  if arrRdtHexagon[i].Position.Y + arrRdtHexagon[i].height <= 0
                  then
                    arrRdtHexagon[i].Position.Y := frmGame.ClientHeight + 5
                  else
                    arrRdtHexagon[i].Position.Y := arrRdtHexagon[i].Position.Y
                      - iSpeedH;
                  arrRdtHexagon[i].Fill.Color := arrShapeHardColor
                    [randomrange(2, 5)];

                  if arrRdtParallelogram[i].Position.Y + arrRdtParallelogram[i]
                    .height <= 0 then
                    arrRdtParallelogram[i].Position.Y :=
                      frmGame.ClientHeight + 5

                  else
                    arrRdtParallelogram[i].Position.Y := arrRdtParallelogram[i]
                      .Position.Y - iSpeedH;
                  arrRdtParallelogram[i].Fill.Color := arrShapeHardColor
                    [randomrange(2, 5)];

                  if arrRdtStar[i].Position.Y + arrRdtStar[i].height <= 0 then
                    arrRdtStar[i].Position.Y := frmGame.ClientHeight + 5
                  else
                    arrRdtStar[i].Position.Y := arrRdtStar[i].Position.Y
                      - iSpeedH;
                  arrRdtStar[i].Fill.Color := arrShapeHardColor
                    [randomrange(2, 5)];

                  if arrRdtHexagon[i].Position.Y > 500 then
                  begin
                    arrRdtHexagon[i].Fill.Color := arrShapeHardColor
                      [randomrange(2, 5)];
                    arrRdtHexagon[i].Visible := True;
                    arrRdtHexagon[i].Enabled := True;

                  end;

                  if arrRdtParallelogram[i].Position.Y > 500 then
                  begin
                    arrRdtParallelogram[i].Fill.Color :=
                      arrShapeHardColor[randomrange(2, 5)];
                    arrRdtParallelogram[i].Visible := True;
                    arrRdtParallelogram[i].Enabled := True;

                  end;
                  if arrRdtStar[i].Position.Y > 500 then
                  begin
                    arrRdtStar[i].Fill.Color := arrShapeHardColor
                      [randomrange(2, 5)];
                    arrRdtStar[i].Visible := True;
                    arrRdtStar[i].Enabled := True;

                  end;
                  if iLives = 0 then
                  begin
                    arrRdtParallelogram[i].Visible := False;
                    arrRdtHexagon[i].Visible := False;
                    arrRdtStar[i].Visible := False;

                    lblGameOver.Visible := True;
                    lblGameOver.BringToFront;
                    btnMainMenu.Visible := True
                  end;

                end;

              end;
              if iScore > 250 then
              begin
                lblWin.Visible := True;
                btnMainMenu.Visible := True;
                if Assigned(TargetShape_ST) = True then
                  TargetShape_ST.CleanupInstance;
                if Assigned(TargetShape_H) = True then
                  TargetShape_H.CleanupInstance;
                if Assigned(TargetShape_PA) = True then
                  TargetShape_PA.CleanupInstance;

                for i := 1 to 20 do
                begin
                  arrRdtHexagon[i].CleanupInstance;
                  arrRdtParallelogram[i].CleanupInstance;
                  arrRdtStar[i].CleanupInstance;

                end;
              end;
               if btnMainMenu.Visible = True then
               rdtBackground.OnClick :=  BackGroundCLickDead;
            end;

            procedure TfrmGame.tmrStartTimer(Sender: TObject);
            var
              iShapeMedium, iShapeHard, iShapeEasy: Integer;
            begin
              Dec(iCountDown);
              lblStartno.Text := inttostr(iCountDown);

              if iCountDown < 1 then
              begin
                lblStartno.Text := 'GO!';

              end;

              if iCountDown < 0 then
              begin
                lblStartno.Visible := False;

                if iTrue = 1 then
                  btnStartEasy.OnClick(Sender);

                if iTrue = 2 then
                  btnStartMedium.OnClick(Sender);

                if iTrue = 3 then
                  btnStarthard.OnClick(Sender);

                tmrStart.Enabled := False;

                if (Assigned(TargetShape_D) = False) or
                  (Assigned(TargetShape_P) = False) or
                  (Assigned(TargetShape_TR) = False) then
                  iShapeMedium := randomrange(1, 4);

                if (Assigned(TargetShape_H) = False) or
                  (Assigned(TargetShape_PA) = False) or
                  (Assigned(TargetShape_ST) = False) then
                  iShapeHard := randomrange(1, 4);


              end;
            end;

end.
