program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickIMU;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBrick: TBrickIMU;
  public
    procedure QuaternionCB(sender: TBrickIMU; const x: single; const y: single;
                           const z: single; const w: single);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your IMU Brick }

var
  e: TExample;

{ Callback procedure for quaternion callback }
procedure TExample.QuaternionCB(sender: TBrickIMU; const x: single; const y: single;
                                const z: single; const w: single);
begin
  WriteLn(Format('Quaternion [X]: %f', [x]));
  WriteLn(Format('Quaternion [Y]: %f', [y]));
  WriteLn(Format('Quaternion [Z]: %f', [z]));
  WriteLn(Format('Quaternion [W]: %f', [w]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection := TIPConnection.Create(nil);

  { Create device object }
  oBrick := TBrickIMU.Create(nil);
  oBrick.UIDString:= UID;
  oBrick.IPConnection:= oIPConnection;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register quaternion callback to procedure QuaternionCB }
  oBrick.OnQuaternion := {$ifdef FPC}@{$endif}QuaternionCB;

  { Set period for quaternion callback to 1s (1000ms) }
  oBrick.SetQuaternionPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
