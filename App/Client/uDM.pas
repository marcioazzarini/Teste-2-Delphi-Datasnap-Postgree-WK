unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  Datasnap.Win.MConnect, Datasnap.Win.SConnect, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.SqlExpr, Data.FMTBcd, Datasnap.Provider, MidasLib;

type
  TDM = class(TDataModule)
    SQLConnection1: TSQLConnection;
    ssmPessoas: TSqlServerMethod;
    dspPessoas: TDataSetProvider;
    cdsPessoas: TClientDataSet;
    cdsPessoasidpessoa: TLargeintField;
    cdsPessoasfinatureza: TSmallintField;
    cdsPessoasdsdocumento: TWideStringField;
    cdsPessoasnmprimeiro: TWideStringField;
    cdsPessoasnmsegundo: TWideStringField;
    cdsPessoasdtregistro: TDateField;
    ssmEnderecos: TSqlServerMethod;
    dspEnderecos: TDataSetProvider;
    cdsEnderecos: TClientDataSet;
    cdsEnderecosidendereco: TLargeintField;
    cdsEnderecosidpessoa: TLargeintField;
    cdsEnderecosdscep: TWideStringField;
    cdsEnderecosdsuf: TWideStringField;
    cdsEnderecosnmcidade: TWideStringField;
    cdsEnderecosnmbairro: TWideStringField;
    cdsEnderecosnmlogradouro: TWideStringField;
    cdsEnderecosdscomplemento: TWideStringField;
    ssmBuscaCEP: TSqlServerMethod;
    dspBuscaCEP: TDataSetProvider;
    cdsBuscaCEP: TClientDataSet;
    cdsBuscaCEPCep: TStringField;
    cdsBuscaCEPLogradouro: TStringField;
    cdsBuscaCEPBairro: TStringField;
    cdsBuscaCEPLocalidade: TStringField;
    cdsBuscaCEPUF: TStringField;
    procedure cdsPessoasBeforePost(DataSet: TDataSet);
    procedure cdsPessoasAfterInsert(DataSet: TDataSet);
    procedure cdsEnderecosAfterInsert(DataSet: TDataSet);
    procedure cdsEnderecosAfterEdit(DataSet: TDataSet);
    procedure cdsEnderecosBeforeDelete(DataSet: TDataSet);
    procedure cdsEnderecosBeforePost(DataSet: TDataSet);
    procedure cdsPessoasBeforeDelete(DataSet: TDataSet);
  private
    procedure ValidaCampo(Campo: TField; sDescricao: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uPessoaClass, uEnderecoClass;

{$R *.dfm}

procedure TDM.cdsEnderecosAfterEdit(DataSet: TDataSet);
begin
  if not (cdsPessoas.State in [dsEdit, dsInsert]) then
    cdsPessoas.Edit;
end;

procedure TDM.cdsEnderecosAfterInsert(DataSet: TDataSet);
begin
  cdsEnderecosidendereco.AsInteger := -1;
  cdsEnderecosidpessoa.AsInteger := cdsPessoasidpessoa.AsInteger;

  if not (cdsPessoas.State in [dsEdit, dsInsert]) then
    cdsPessoas.Edit;
end;

procedure TDM.cdsEnderecosBeforeDelete(DataSet: TDataSet);
var
  objEndereco: TEndereco;
begin
  if not (cdsPessoas.State in [dsEdit, dsInsert]) then
    cdsPessoas.Edit;

  if (cdsEnderecosidendereco.AsInteger > 0) then
  begin
    objEndereco := TEndereco.Create;
    objEndereco.idendereco := cdsEnderecosidendereco.AsInteger;
    objEndereco.Excluir;
  end;
end;

procedure TDM.cdsEnderecosBeforePost(DataSet: TDataSet);
begin
  ValidaCampo(cdsEnderecosdscep, 'CEP');
  ValidaCampo(cdsEnderecosnmlogradouro, 'Logradouro');
  ValidaCampo(cdsEnderecosnmbairro, 'Bairro');
  ValidaCampo(cdsEnderecosnmcidade, 'Cidade');
  ValidaCampo(cdsEnderecosdsuf, 'UF');
end;

procedure TDM.cdsPessoasAfterInsert(DataSet: TDataSet);
begin
  cdsPessoasdtregistro.AsDateTime := Now;
  cdsPessoasfinatureza.AsInteger := 1;

  DM.cdsEnderecos.Close;
  DM.cdsEnderecos.ParamByName('idpessoa').AsInteger := -1;
  DM.cdsEnderecos.Open;
end;

procedure TDM.cdsPessoasBeforeDelete(DataSet: TDataSet);
var
  objPessoa: TPessoa;
begin
  objPessoa := TPessoa.Create;
  objPessoa.idpessoa := cdsPessoasidpessoa.AsInteger;
  objPessoa.Excluir;

end;

procedure TDM.cdsPessoasBeforePost(DataSet: TDataSet);
var
  objPessoa: TPessoa;
  objEndereco: TEndereco;
begin

  ValidaCampo(cdsPessoasdsdocumento, 'Documento');
  ValidaCampo(cdsPessoasnmprimeiro, 'Nome');
  ValidaCampo(cdsPessoasnmsegundo, 'Sobrenome');

  if (cdsEnderecos.State in [dsInsert, dsEdit]) then
    cdsEnderecos.Post;

  if (cdsEnderecos.RecordCount <= 0) then
    raise Exception.Create('Endere�o Obrigat�rio!');

  if (cdsPessoas.State in [dsInsert]) then
     cdsPessoasidpessoa.AsInteger := -1;

  objPessoa := TPessoa.Create;
  objPessoa.idpessoa := cdsPessoasidpessoa.AsInteger;
  objPessoa.finatureza := cdsPessoasfinatureza.AsInteger;
  objPessoa.dsdocumento := cdsPessoasdsdocumento.AsString;
  objPessoa.nmprimeiro := cdsPessoasnmprimeiro.AsString;
  objPessoa.nmsegundo := cdsPessoasnmsegundo.AsString;
  objPessoa.dtregistro := cdsPessoasdtregistro.AsDateTime;
  objPessoa.Salvar;

  cdsPessoasidpessoa.AsInteger := objPessoa.idpessoa;

  cdsEnderecos.DisableControls;
  cdsEnderecos.First;
  while not cdsEnderecos.EOF do
  begin
    objEndereco := TEndereco.Create;
    objEndereco.idendereco := cdsEnderecosidendereco.AsInteger;
    objEndereco.idpessoa := objPessoa.idpessoa;
    objEndereco.dscep := cdsEnderecosdscep.AsString;

    objEndereco.dsuf :=  cdsEnderecosdsuf.AsString;
    objEndereco.nmcidade := cdsEnderecosnmcidade.AsString;
    objEndereco.nmlogradouro := cdsEnderecosnmlogradouro.AsString;
    objEndereco.dscomplemento := cdsEnderecosdscomplemento.AsString;

    if (cdsEnderecos.UpdateStatus in [usInserted, usModified]) then
    begin
       objEndereco.Salvar;
    end
    else
      if (cdsEnderecos.UpdateStatus = usDeleted) then
      begin
         objEndereco.Excluir;
      end;

    cdsEnderecos.Next;
  end;
  cdsEnderecos.EnableControls;
end;

procedure TDM.ValidaCampo(Campo: TField; sDescricao: String);
begin
   if (Trim(Campo.AsString) = '') then
     raise Exception.Create('Campo n�o pode ser nulo: ' + sDescricao);
end;

end.
