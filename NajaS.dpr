program NajaS;

uses
  Vcl.SvcMgr,
  Principal in 'Principal.pas' {dmPrincipal: TService},
  LogUtils in 'LogUtils.pas';

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;

  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.Run;
end.
