unit uPessoaClass;

interface

uses
  System.SysUtils, Datasnap.DBClient, uInterface;

type
  TPessoa = class(TInterfacedObject, IEntidade)
  private
    Fidpessoa: Integer;
    Ffinatureza: Integer;
    Fdsdocumento: String;
    Fnmprimeiro: String;
    Fnmsegundo: String;
    Fdtregistro: TDateTime;

  public
    property idpessoa: Integer read Fidpessoa write Fidpessoa;
    property finatureza: Integer read Ffinatureza write Ffinatureza;
    property dsdocumento: string read Fdsdocumento write Fdsdocumento;
    property nmprimeiro: string read Fnmprimeiro write Fnmprimeiro;
    property nmsegundo: string read Fnmsegundo write Fnmsegundo;
    property dtregistro: TDateTime read Fdtregistro write Fdtregistro;

    constructor Create; overload;

    function Salvar: integer;
    procedure Excluir;

  end;

implementation

{ TPessoa }

uses uServerCalls, uDM;

constructor TPessoa.Create;
begin
  Fidpessoa := -1;
end;

procedure TPessoa.Excluir;
var
  Server: TServerMethods1Client;
begin
  Server := TServerMethods1Client.Create(DM.SQLConnection1.DBXConnection);
  try
    Server.ExcluiPessoa(Fidpessoa);
  finally
    Server.Free;
  end;
end;

function TPessoa.Salvar: integer;
var
  Server: TServerMethods1Client;
begin
  Server := TServerMethods1Client.Create(DM.SQLConnection1.DBXConnection);
  try
    Fidpessoa := Server.SalvaPessoa(Fidpessoa,Finatureza, Fdsdocumento, Fnmprimeiro, Fnmsegundo,
                      Fdtregistro);
  finally
    Server.Free;
  end;
end;

end.
