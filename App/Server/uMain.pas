unit uMain;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  IPPeerServer,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, FireDAC.VCLUI.Wait;

type
  TfrmMain = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uServerContainer;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  ServerContainer1.DSServer1.Start;
end;

end.

