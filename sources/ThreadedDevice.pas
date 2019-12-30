unit ThreadedDevice;

{$ifdef FPC}
  {$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, SyncObjs, Device;

type
  TThreadedDevice = class(TDevice)
    private
     fStreamMutex: TCriticalSection;
    public
     constructor Create(aOwner: TComponent); override;
     destructor Destroy; override;
     // Properties
     property StreamMutex: TCriticalSection read fStreamMutex;
  end;

implementation

constructor TThreadedDevice.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  fStreamMutex:= TCriticalSection.Create;
end;

destructor TThreadedDevice.Destroy;
begin
  fStreamMutex.Destroy;
  inherited Destroy;
end;

end.

