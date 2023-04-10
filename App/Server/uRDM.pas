unit uRDM;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, TesteWKServer_TLB, StdVcl, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TrdmWKTech = class(TRemoteDataModule, IrdmWKTech)
    qryPessoa: TFDQuery;
    qryPessoaidpessoa: TLargeintField;
    qryPessoafinatureza: TSmallintField;
    qryPessoadsdocumento: TWideStringField;
    qryPessoanmprimeiro: TWideStringField;
    qryPessoanmsegundo: TWideStringField;
    qryPessoadtregistro: TDateField;
    dspPessoa: TDataSetProvider;
    qryEndereco: TFDQuery;
    qryEnderecoidendereco: TLargeintField;
    qryEnderecoidpessoa: TLargeintField;
    qryEnderecodscep: TWideStringField;
    dspEndereco: TDataSetProvider;
    qryEnderecoIntegracao: TFDQuery;
    qryEnderecoIntegracaoidendereco: TLargeintField;
    qryEnderecoIntegracaodsuf: TWideStringField;
    qryEnderecoIntegracaonmcidade: TWideStringField;
    qryEnderecoIntegracaonmbairro: TWideStringField;
    qryEnderecoIntegracaonmlogradouro: TWideStringField;
    qryEnderecoIntegracaodscomplemento: TWideStringField;
    dspEnderecoIntegracao: TDataSetProvider;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure helloWorld; safecall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses uDM;

class procedure TrdmWKTech.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TrdmWKTech.helloWorld;
begin
  raise Exception.Create('Hello World');
end;

initialization
  TComponentFactory.Create(ComServer, TrdmWKTech,
    Class_rdmWKTech, ciMultiInstance, tmApartment);
end.
