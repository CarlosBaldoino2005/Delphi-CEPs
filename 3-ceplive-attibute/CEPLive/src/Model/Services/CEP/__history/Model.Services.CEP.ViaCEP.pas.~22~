unit Model.Services.CEP.ViaCEP;

interface

uses
  Model.Services.CEP.BaseClass;

type
  TModelServicesCEPViaCEP = class(TModelServicesCEPBase)
  protected
    function GetUri: string; override;
    function GetName: string; override;
  end;

implementation

{ TModelServicesCEPViaCEP }

function TModelServicesCEPViaCEP.GetName: string;
begin
  Result := 'ViaCEP';
end;

function TModelServicesCEPViaCEP.GetUri: string;
begin
  Result :=  'https://viacep.com.br/ws/'+GetCode+'/json/';
end;

end.
