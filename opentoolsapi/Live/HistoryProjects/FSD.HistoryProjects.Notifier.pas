unit FSD.HistoryProjects.Notifier;

interface

uses
  ToolsAPI,
  System.Classes,
  System.IniFiles,
  System.SysUtils;

type TFSDHistoryProjectsNotifier = class(TNotifierObject, IOTANotifier, IOTAIDENotifier)

  protected
    { This procedure is called for many various file operations within the
      IDE }
    procedure FileNotification(NotifyCode: TOTAFileNotification;
      const FileName: string; var Cancel: Boolean);
    { This function is called immediately before the compiler is invoked.
      Set Cancel to True to cancel the compile }
    procedure BeforeCompile(const Project: IOTAProject; var Cancel: Boolean); overload;
    { This procedure is called immediately following a compile.  Succeeded
      will be true if the compile was successful }
    procedure AfterCompile(Succeeded: Boolean); overload;

  public
    class function New: IOTAIDENotifier;
end;

var
  Index: Integer = -1;

procedure RegisterHistoryNotifier;

implementation

procedure RegisterHistoryNotifier;
begin
  Index := (BorlandIDEServices as IOTAServices)
              .AddNotifier(TFSDHistoryProjectsNotifier.New);
end;

{ TFSDHistoryProjectsNotifier }

procedure TFSDHistoryProjectsNotifier.AfterCompile(Succeeded: Boolean);
begin

end;

procedure TFSDHistoryProjectsNotifier.BeforeCompile(
  const Project: IOTAProject; var Cancel: Boolean);
begin

end;

procedure TFSDHistoryProjectsNotifier.FileNotification(
  NotifyCode: TOTAFileNotification; const FileName: string;
  var Cancel: Boolean);
var
  fileExt: string;
  iniFileName: String;
  iniFile: TIniFile;
begin
  Cancel := False;
  fileExt:= ExtractFileExt(FileName);

  if (not fileExt.Equals('.dproj')) and
     (not fileExt.Equals('.groupproj')) or
     (NotifyCode <> ofnFileOpened)
  then
    Exit;

  iniFileName := ExtractFilePath(GetModuleName(HInstance)) +
                  '\SeniorDeveloper\HistoryProjects.ini';

  ForceDirectories(ExtractFilePath(iniFileName));

  iniFile := TIniFile.Create(iniFileName);
  try
    iniFile.WriteString(FileName, 'ProjectName',
        ExtractFileName(FileName).Replace(fileExt, ''));
  finally
    iniFile.Free;
  end;
end;

class function TFSDHistoryProjectsNotifier.New: IOTAIDENotifier;
begin
  result := Self.Create;
end;

initialization

finalization
  (BorlandIDEServices as IOTAServices)
    .RemoveNotifier(Index);

end.
