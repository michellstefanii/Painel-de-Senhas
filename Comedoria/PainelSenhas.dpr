program PainelSenhas;

uses
  Vcl.Forms,
  untPainelPrincipal in 'untPainelPrincipal.pas' {frmPainelPrincipal},
  untPainelNumeros in 'untPainelNumeros.pas' {frmPainelNumeros};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPainelNumeros, frmPainelNumeros);
  Application.CreateForm(TfrmPainelPrincipal, frmPainelPrincipal);
  Application.Run;
end.
