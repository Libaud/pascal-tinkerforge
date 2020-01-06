program ExampleStackStatus;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickMaster;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBrick: TBrickMaster;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your Master Brick }

var
  e: TExample;

procedure TExample.Execute;
var stackVoltage, stackCurrent: word;
begin
  { Create IP connection }
  oIPConnection := TIPConnection.Create(nil);

  { Create device object }
  oBrick := TBrickMaster.Create(nil);
  oBrick.IPConnection:= oIPConnection;
  oBrick.UIDString:= UID;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current stack voltage }
  stackVoltage := oBrick.GetStackVoltage;
  WriteLn(Format('Stack Voltage: %f V', [stackVoltage/1000.0]));

  { Get current stack current }
  stackCurrent := oBrick.GetStackCurrent;
  WriteLn(Format('Stack Current: %f A', [stackCurrent/1000.0]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
