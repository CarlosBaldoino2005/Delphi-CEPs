unit Model.Services.CEP.APICEP;

interface

uses
  Model.Services.CEP.BaseClass;

type
  TModelServicesCEPAPICEP = class(TModelServicesCEPBase)
  protected
    function GetUri: string; override;
    function GetName: string; override;
  end;

implementation

{ TModelServicesCEPAPICEP }

function TModelServicesCEPAPICEP.GetName: string;
begin
  result := 'APICEP';
end;

function TModelServicesCEPAPICEP.GetUri: string;
begin
  result := 'https://ws.apicep.com/cep/'+ GetCode +'.json';
end;

end.
