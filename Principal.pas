unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs;

type
  TdmPrincipal = class(TService)
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceAfterUninstall(Sender: TService);
    procedure ServiceBeforeInstall(Sender: TService);
    procedure ServiceBeforeUninstall(Sender: TService);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure ServiceExecute(Sender: TService);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceShutdown(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

uses
  LogUtils;

{$R *.dfm}

procedure TdmPrincipal.ServiceAfterInstall(Sender: TService);
begin
  Log('TdmPrincipal.ServiceAfterInstall');
end;

procedure TdmPrincipal.ServiceAfterUninstall(Sender: TService);
begin
  Log('TdmPrincipal.ServiceAfterUninstall');
end;

procedure TdmPrincipal.ServiceBeforeInstall(Sender: TService);
begin
  Log('TdmPrincipal.ServiceBeforeInstall');
end;

procedure TdmPrincipal.ServiceBeforeUninstall(Sender: TService);
begin
  Log('TdmPrincipal.ServiceBeforeUninstall');
end;

procedure TdmPrincipal.ServiceContinue(Sender: TService;
  var Continued: Boolean);
begin
  Log('TdmPrincipal.ServiceContinue');
  Continued := true;
end;

procedure TdmPrincipal.ServiceExecute(Sender: TService);
begin
  Log('TdmPrincipal.ServiceExecute');

   while not Self.Terminated do
   begin
     Sleep(200);
     ServiceThread.ProcessRequests(True);
   end;
end;

procedure TdmPrincipal.ServicePause(Sender: TService; var Paused: Boolean);
begin
  Log('TdmPrincipal.ServicePause');
  Paused := true;
end;

procedure TdmPrincipal.ServiceShutdown(Sender: TService);
begin
  Log('TdmPrincipal.ServiceShutdown');
end;

procedure TdmPrincipal.ServiceStart(Sender: TService; var Started: Boolean);
begin
  Log('TdmPrincipal.ServiceStart');
  Started := true;
end;

procedure TdmPrincipal.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  Log('TdmPrincipal.ServiceStop');
  Stopped := true;
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  dmPrincipal.Controller(CtrlCode);
end;

function TdmPrincipal.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

end.
