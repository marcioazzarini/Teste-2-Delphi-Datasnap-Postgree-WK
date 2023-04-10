program TesteWKClient;

uses
  Vcl.Forms,
  uCadPessoa in 'uCadPessoa.pas' {frmCadPessoa},
  uDM in 'uDM.pas' {DM: TDataModule},
  uEnderecoClass in 'Classes\uEnderecoClass.pas',
  uInterface in 'Classes\uInterface.pas',
  uPessoaClass in 'Classes\uPessoaClass.pas',
  uServerCalls in 'Classes\uServerCalls.pas',
  uCEPClass in 'Classes\uCEPClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadPessoa, frmCadPessoa);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
