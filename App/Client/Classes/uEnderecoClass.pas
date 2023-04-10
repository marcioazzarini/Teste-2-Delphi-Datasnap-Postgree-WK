unit uEnderecoClass;

interface

uses
  System.SysUtils, Datasnap.DBClient, uInterface;

type
  TEndereco = class(TInterfacedObject, IEntidade)
  private
    Fidendereco: Integer;
    Fidpessoa: Integer;
    Fdscep: String;

    Fdsuf: String;
    Fnmcidade: String;
    Fnmbairro: String;
    Fnmlogradouro: String;
    Fdscomplemento: String;

  public
    property idendereco: Integer read Fidendereco write Fidendereco;
    property idpessoa: Integer read Fidpessoa write Fidpessoa;
    property dscep: string read Fdscep write Fdscep;

    property dsuf: string read Fdsuf write Fdsuf;
    property nmcidade: string read Fnmcidade write Fnmcidade;
    property nmbairro: string read Fnmbairro write Fnmbairro;
    property nmlogradouro: string read Fnmlogradouro write Fnmlogradouro;
    property dscomplemento: string read Fdscomplemento write Fdscomplemento;


    constructor Create; overload;

    function Salvar: integer;
    procedure Excluir;

  end;

implementation

uses uServerCalls, uDM;

{ TEndereco }

constructor TEndereco.Create;
begin
  Fidendereco := -1;
end;

procedure TEndereco.Excluir;
var
  Server: TServerMethods1Client;
begin
  Server := TServerMethods1Client.Create(DM.SQLConnection1.DBXConnection);
  try
    Server.ExcluiEndereco(Fidendereco);
  finally
    Server.Free;
  end;
end;

function TEndereco.Salvar: integer;
var
  Server: TServerMethods1Client;
begin
  Server := TServerMethods1Client.Create(DM.SQLConnection1.DBXConnection);
  try
    Fidpessoa := Server.SalvaEndereco(Fidendereco, Fidpessoa, Fdscep, Fdsuf,
                Fnmcidade, Fnmbairro, Fnmlogradouro, Fdscomplemento);
  finally
    Server.Free;
  end;

end;

end.
