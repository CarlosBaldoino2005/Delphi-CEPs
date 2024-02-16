unit Model.Services.CEP.ViaCEP;

interface

uses
  Model.Services.CEP.BaseClass;

type
  [TUriCEP('ViaCEP','https://viacep.com.br/ws/<#Code>/json/')]
  TModelServicesCEPViaCEP = class(TModelServicesCEPBase);

implementation

end.
