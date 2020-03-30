unit LogUtils;

interface

uses
  Winapi.Windows, System.SysUtils;

procedure Log(const Msg: string);

implementation

var
  LastLog: Cardinal = 0;
  Loging : Boolean = False;

procedure Log(const Msg: string);
var
  n: string;
  h: TextFile;
  t, d: Cardinal;
begin
  t := GetTickCount;

  if LastLog <> 0 then
    d := t - LastLog
  else
    d := 0;

  LastLog := t;
  n := ChangeFileExt(ParamStr(0), '.log');
  AssignFile(h, n);

  if FileExists(n) then
    Append(h)
  else
    Rewrite(h);

  try
    WriteLn(h, DateTimeToStr(Now) + ' (' + IntToStr(d) + 'ms): ' + Msg);
  finally
    CloseFile(h);
  end;
end;

end.
