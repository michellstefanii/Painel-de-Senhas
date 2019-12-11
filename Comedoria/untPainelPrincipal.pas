unit untPainelPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.MPlayer,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, DateUtils, MMSystem, Vcl.ComCtrls;

type
  TfrmPainelPrincipal = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Timer1: TTimer;
    MediaPlayer1: TMediaPlayer;
    Panel5: TPanel;
    procedure FormShow(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
  private
  function NomeDoMes(i: word; tipo: integer): string;
  function DataPorExtenso(dt: TDateTime): string;
  public
    procedure disparasom(Sender: TObject);
  end;

var
  frmPainelPrincipal: TfrmPainelPrincipal;

implementation

{$R *.dfm}

uses untPainelNumeros;

procedure TfrmPainelPrincipal.disparasom(Sender: TObject);
begin
      frmPainelNumeros.voz.Speak('Senha ' + frmPainelPrincipal.Panel1.Caption, 0);
      frmPainelNumeros.edit1.ReadOnly := false;
      BlockInput(false);
end;

procedure TfrmPainelPrincipal.FormShow(Sender: TObject);
begin
      panel4.Caption := DataPorExtenso(now);

      panel3.Caption := timetostr(time);
end;

procedure TfrmPainelPrincipal.MediaPlayer1Notify(Sender: TObject);
begin
        frmpainelprincipal.disparasom(Sender);
end;

function TfrmPainelPrincipal.NomeDoMes(i: word; tipo: integer): string;
const mes: array[1..12] of string = ('janeiro', 'fevereiro',
  'março', 'abril', 'maio', 'junho', 'julho', 'agosto',
  'setembro', 'outubro', 'novembro', 'dezembro');
begin
  if (tipo = 0)
     then NomeDoMes := mes[i]

  else NomeDoMes := copy(mes[i], 1, 3);
end;

function TfrmPainelPrincipal.DataPorExtenso(dt: TDateTime): string;
var d, m, a: word;
begin
   DecodeDate(dt, a, m, d);

   DataPorExtenso := IntToStr(d) + ' de ' +
      NomeDoMes(m, 0) + ' de ' + IntToStr(a);
end;


end.
