unit Settings_u;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, Radiant.Shapes, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmSettings = class(TForm)
    ScaledLayout1: TScaledLayout;
    rdtArrowback: TRadiantChevronArrow;
    RadiantGear1: TRadiantGear;
    Timer1: TTimer;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdtArrowbackClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmSettings: TfrmSettings;

implementation
 uses Menu_u;
{$R *.fmx}

procedure TfrmSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmSettings.rdtArrowbackClick(Sender: TObject);
begin
  frmMenu.ChangeForm(frmSettings,frmMenu,'Menu');
end;

procedure TfrmSettings.Timer1Timer(Sender: TObject);
begin
radiantGear1.RotationAngle := radiantGear1.RotationAngle + 1;
label1.RotationAngle := label1.RotationAngle + 1;
end;

end.
