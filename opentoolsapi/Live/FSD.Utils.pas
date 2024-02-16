unit FSD.Utils;

interface

uses
  System.SysUtils,
  System.Classes,
  ToolsAPI;

function ActiveSourceEditor: IOTASourceEditor;
function EditorAsString: string;
function EditorAsStringList: TStringList;

implementation

function ActiveSourceEditor: IOTASourceEditor;
var
  module: IOTAModule;
  i: Integer;
begin
  module := (BorlandIDEServices as IOTAModuleServices).CurrentModule;
  for i := 0 to Pred(module.ModuleFileCount) do
  begin
    if module.ModuleFileEditors[i]
      .QueryInterface(IOTASourceEditor, result) = S_OK then
      Break;
  end;
end;

function EditorAsString: string;
const
  iBufferSize: Integer = 1024;
Var
  Reader: IOTAEditReader;
  iRead: Integer;
  iPosition: Integer;
  strBuffer: AnsiString;
begin
  Result := '';

  Reader := ActiveSourceEditor.CreateReader;
  try
    iPosition := 0;
    repeat
      SetLength(strBuffer, iBufferSize);
      iRead := Reader.GetText(0, PAnsiChar(strBuffer), iBufferSize);
      SetLength(strBuffer, iRead);
      Result := Result + String(strBuffer);
      Inc(iPosition, iRead);
    until iRead < iBufferSize;
  finally
    Reader := Nil;
  end;
end;

function EditorAsStringList: TStringList;
begin
  result := TStringList.Create;
  result.Text := EditorAsString;
end;

end.
