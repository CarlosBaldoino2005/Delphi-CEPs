unit Model.Services.CEP.APICEP;

interface

uses
  Model.Services.CEP.BaseClass;

type
  [TUriCEP('APICEP','https://ws.apicep.com/cep/<#Code>.json')]
  TModelServicesCEPAPICEP = class(TModelServicesCEPBase);

implementation

end.
