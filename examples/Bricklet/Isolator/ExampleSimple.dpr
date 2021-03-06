program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIsolator;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIsolator;
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
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletIsolator.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get current statistics }
	  oBricklet.GetStatistics(messagesFromBrick, messagesFromBricklet,
					  connectedBrickletDeviceIdentifier, connectedBrickletUID);

	  WriteLn(Format('Messages From Brick: %d', [messagesFromBrick]));
	  WriteLn(Format('Messages From Bricklet: %d', [messagesFromBricklet]));
	  WriteLn(Format('Connected Bricklet Device Identifier: %d', [connectedBrickletDeviceIdentifier]));
	  WriteLn(Format('Connected Bricklet UID: %s', [connectedBrickletUID]));

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBricklet.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
