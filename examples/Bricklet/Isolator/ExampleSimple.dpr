program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIsolator;

type
  TExample = class
  private
    ipcon: TIPConnection;
    i: TBrickletIsolator;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Isolator Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var messagesFromBrick, messagesFromBricklet: longword;
    connectedBrickletDeviceIdentifier: word; connectedBrickletUID: string;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  i := TBrickletIsolator.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current statistics }
  i.GetStatistics(messagesFromBrick, messagesFromBricklet,
                  connectedBrickletDeviceIdentifier, connectedBrickletUID);

  WriteLn(Format('Messages From Brick: %d', [messagesFromBrick]));
  WriteLn(Format('Messages From Bricklet: %d', [messagesFromBricklet]));
  WriteLn(Format('Connected Bricklet Device Identifier: %d', [connectedBrickletDeviceIdentifier]));
  WriteLn(Format('Connected Bricklet UID: %s', [connectedBrickletUID]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
