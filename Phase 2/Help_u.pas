unit Help_u;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  Radiant.Shapes, FMX.Layouts;

type
  TfrmHelp = class(TForm)
    ScaledLayout1: TScaledLayout;
    rdtArrowback: TRadiantChevronArrow;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdtArrowbackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure ChangeForm(frmHide, frmShow: TForm; sTitle : String);
  end;

var
  frmHelp: TfrmHelp;

implementation

{$R *.fmx}
uses
Menu_u;

procedure TfrmHelp.ChangeForm(frmHide, frmShow: TForm; sTitle: String);
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

procedure TfrmHelp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmHelp.rdtArrowbackClick(Sender: TObject);
begin
frmMenu.ChangeForm(frmHelp,frmMenu,'Menu');
end;

end.
