unit Model.Services.CEP.BrasilAPI;

interface

uses
  Model.Services.CEP.BaseClass;

type
  [TUriCEP('BrasilAPI','https://brasilapi.com.br/api/cep/v1/<#Code>')]
  TModelServicesCEPBrasilAPI = class(TModelServicesCEPBase);

implementation

end.
