unit FSD.NewUnitMuka;

interface

uses
  System.Classes,
  System.SysUtils,
  ToolsAPI;

type TFSDNewUnitMuka = class(TNotifierObject, IOTACreator,
                                              IOTAModuleCreator,
                                              IOTAFile)

  protected
    function GetCreatorType: string;
    { Return False if this is a new module }
    function GetExisting: Boolean;
    { Return the File system IDString that this module uses for reading/writing }
    function GetFileSystem: string;
    { Return the Owning module, if one exists (for a project module, this would
      be a project; for a project this is a project group) }
    function GetOwner: IOTAModule;
    { Return true, if this item is to be marked as un-named.  This will force the
      save as dialog to appear the first time the user saves. }
    function GetUnnamed: Boolean;


    function GetAncestorName: string;
    { Return the implementation filename, or blank to have the IDE create a new
      unique one. (C++ .cpp file or Delphi unit) NOTE: If a value is returned then it *must* be a
      fully qualified filename.  This also applies to GetIntfFileName and
      GetAdditionalFileName on the IOTAAdditionalFilesModuleCreator interface. }
    function GetImplFileName: string;
    { Return the interface filename, or blank to have the IDE create a new
      unique one.  (C++ header) }
    function GetIntfFileName: string;
    { Return the form name }
    function GetFormName: string;
    { Return True to Make this module the main form of the given Owner/Project }
    function GetMainForm: Boolean;
    { Return True to show the form }
    function GetShowForm: Boolean;
    { Return True to show the source }
    function GetShowSource: Boolean;
    { Create and return the Form resource for this new module if applicable }
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    { Create and return the Implementation source for this module. (C++ .cpp
      file or Delphi unit) }
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    { Create and return the Interface (C++ header) source for this module }
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    { Called when the new form/datamodule/custom module is created }
    procedure FormCreated(const FormEditor: IOTAFormEditor);

    function GetSource: string;
    { Return the age of the file. -1 if new }
    function GetAge: TDateTime;
  public
    class function New: IOTACreator;
  end;

implementation

{ TFSDNewUnitMuka }

procedure TFSDNewUnitMuka.FormCreated(const FormEditor: IOTAFormEditor);
begin

end;

function TFSDNewUnitMuka.GetAge: TDateTime;
begin
  result := -1;
end;

function TFSDNewUnitMuka.GetAncestorName: string;
begin
  result := '';
end;

function TFSDNewUnitMuka.GetCreatorType: string;
begin
  result := sUnit;
end;

function TFSDNewUnitMuka.GetExisting: Boolean;
begin
  result := False;
end;

function TFSDNewUnitMuka.GetFileSystem: string;
begin
  result := '';
end;

function TFSDNewUnitMuka.GetFormName: string;
begin
  result := '';
end;

function TFSDNewUnitMuka.GetImplFileName: string;
begin
  result := '';
end;

function TFSDNewUnitMuka.GetIntfFileName: string;
begin
  result := '';
end;

function TFSDNewUnitMuka.GetMainForm: Boolean;
begin
  result := False;
end;

function TFSDNewUnitMuka.GetOwner: IOTAModule;
begin
  result := GetActiveProject;
end;

function TFSDNewUnitMuka.GetShowForm: Boolean;
begin
  result := False;
end;

function TFSDNewUnitMuka.GetShowSource: Boolean;
begin
  result := True;
end;

function TFSDNewUnitMuka.GetSource: string;
begin
  result :=
    'unit Unit1;' + sLineBreak +
    '' + sLineBreak +
    'interface' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  ToolsAPI,' + sLineBreak +
    '  System.SysUtils,' + sLineBreak +
    '  System.Classes;' + sLineBreak +
    '' + sLineBreak +
    '' + sLineBreak +
    'implementation' + sLineBreak +
    '' + sLineBreak +
    'end.';
end;

function TFSDNewUnitMuka.GetUnnamed: Boolean;
begin
  result := True;
end;

class function TFSDNewUnitMuka.New: IOTACreator;
begin
  result := Self.Create;
end;

function TFSDNewUnitMuka.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  result := nil;
end;

function TFSDNewUnitMuka.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  result := Self;
end;

function TFSDNewUnitMuka.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin

end;

end.
