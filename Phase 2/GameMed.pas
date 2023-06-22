unit GameMed;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Radiant.Shapes,
  FMX.Controls.Presentation, FMX.StdCtrls, math, FMX.Layouts, FMX.Objects;

type
  TfrmGameMed = class(TForm)

  private
    { Private declarations }
  public

    { Public declarations }


  end;

var
  frmGamemed: TfrmGamemed;


implementation

uses Menu_u, Character_u, Difficulty_u, Game_u;
{$R *.fmx}



end.
