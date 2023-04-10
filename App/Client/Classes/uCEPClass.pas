unit uCEPClass;

interface

type
  TCEP = class(TObject)
  strict private
    FCEP: string;
    FLogradouro: string;
    FBairro: string;
    FLocalidade: string;
    FUF: string;
  public
    property CEP: string read FCEP;
    property Logradouro: string read FLogradouro;
    property Bairro: string read FBairro;
    property Localidade: string read FLocalidade;
    property UF: string read FUF;

    constructor Create(sCEP: string); overload;
  end;

implementation

{ TBuscaCEPXML }

uses uDM;

constructor TCEP.Create(sCEP: string);
begin
  DM.cdsBuscaCEP.Close;
  DM.cdsBuscaCEP.ParamByName('sCEP').AsString := sCEP;
  DM.cdsBuscaCEP.Open;

  FCEP := DM.cdsBuscaCEPCep.AsString;
  FLogradouro := DM.cdsBuscaCEPLogradouro.AsString;
  FBairro := DM.cdsBuscaCEPBairro.AsString;
  FLocalidade := DM.cdsBuscaCEPLocalidade.AsString;
  FUF := DM.cdsBuscaCEPUF.AsString;
end;


end.
