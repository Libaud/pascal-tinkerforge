﻿program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletTemperatureIRV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletTemperatureIRV2;
  public
    procedure ObjectTemperatureCB(sender: TBrickletTemperatureIRV2;
                                  const temperature: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Temperature IR Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for object temperature callback }
procedure TExample.ObjectTemperatureCB(sender: TBrickletTemperatureIRV2;
                                       const temperature: smallint);
begin
  WriteLn(Format('Object Temperature: %f °C', [temperature/10.0]));
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletTemperatureIRV2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register object temperature callback to procedure ObjectTemperatureCB }
	  oBricklet.OnObjectTemperature := {$ifdef FPC}@{$endif}ObjectTemperatureCB;

	  { Set period for object temperature callback to 1s (1000ms) without a threshold }
	  oBricklet.SetObjectTemperatureCallbackConfiguration(1000, false, 'x', 0, 0);

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
