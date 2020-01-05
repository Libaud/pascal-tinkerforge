program ExampleStackStatus;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickMaster;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    master: TBrickMaster;
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
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  master:= TBrickMaster.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current stack voltage }
  stackVoltage:= master.GetStackVoltage;
  WriteLn(Format('Stack Voltage: %f V', [stackVoltage/1000.0]));

  { Get current stack current }
  stackCurrent:= master.GetStackCurrent;
  WriteLn(Format('Stack Current: %f A', [stackCurrent/1000.0]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
