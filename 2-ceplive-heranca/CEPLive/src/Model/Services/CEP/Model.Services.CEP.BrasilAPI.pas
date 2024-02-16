unit Model.Services.CEP.BrasilAPI;

interface

uses
  Model.Services.CEP.BaseClass;

type
  TModelServicesCEPBrasilAPI = class(TModelServicesCEPBase)
  protected
    function GetUri: string; override;
    function GetName: string; override;
  end;

implementation

{ TModelServicesCEPBrasilAPI }

function TModelServicesCEPBrasilAPI.GetName: string;
begin
  result := 'BrasilAPI';
end;

function TModelServicesCEPBrasilAPI.GetUri: string;
begin
  result := 'https://brasilapi.com.br/api/cep/v1/'+ GetCode;
end;

end.
