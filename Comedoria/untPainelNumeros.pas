unit untPainelNumeros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.MPlayer, ComObj,
  Vcl.Imaging.jpeg;

type
  TfrmPainelNumeros = class(TForm)
    Edit1: TEdit;
    Panel5: TPanel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  var  voz: OLEVariant;
  end;

var
  frmPainelNumeros: TfrmPainelNumeros;


implementation

{$R *.dfm}

uses untPainelPrincipal;

procedure BlockInput(ABlockInput : boolean); stdcall; external 'USER32.DLL';

procedure TfrmPainelNumeros.Edit1Change(Sender: TObject);
begin
    frmPainelPrincipal.Panel1.Caption := '';
end;

procedure TfrmPainelNumeros.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = vk_Decimal then
    begin
      edit1.Clear;
    end;
end;

procedure TfrmPainelNumeros.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if edit1.text = '' then
begin

end
else
begin
  if key = #13 then
    begin
        BlockInput(true);
        frmPainelPrincipal.Panel1.Caption := edit1.Text;
        with frmPainelPrincipal.MediaPlayer1 do
        begin
        Open;
        Play;
        end;
        edit1.SelectAll;
        key := #0;
        edit1.ReadOnly := true;
    end;
end;


    if not (CharInSet(key,['0'..'9', char(vk_Return)])) then
     begin
          key := #0;
     end;

end;

procedure TfrmPainelNumeros.FormCreate(Sender: TObject);
begin
     voz := CreateOLEObject ('SAPI.SpVoice');


    Panel5.Left := (frmPainelNumeros.ClientWidth div 2) - (Panel5.Width div 6);
    Panel5.Top := (frmPainelNumeros.ClientHeight div 2) - (Panel5.Height div 2);

end;

procedure TfrmPainelNumeros.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
    begin
        frmPainelPrincipal.Panel1.Caption := edit1.Text;
    end;
end;

procedure TfrmPainelNumeros.FormShow(Sender: TObject);
begin
   if Screen.MonitorCount > 1 then
     begin
      Application.CreateForm (TfrmPainelPrincipal, frmPainelPrincipal);
      frmPainelPrincipal.Width := Screen.Monitors[1].Width;
      frmPainelPrincipal.Height := Screen.Monitors[1].Height;
      frmPainelPrincipal.Top := Screen.Monitors[1].Top;
      frmPainelPrincipal.Left := Screen.Monitors[1].Left;
      frmPainelPrincipal.Show;
   end;
end;

end.
