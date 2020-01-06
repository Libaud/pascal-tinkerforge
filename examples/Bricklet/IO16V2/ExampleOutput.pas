program ExampleOutput;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIO16V2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIO16V2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your IO-16 Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var i: integer;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletIO16V2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Configure channel 7 as output low }
    oBricklet.SetConfiguration(7, 'o', false);

    { Set channel 7 alternating high/low 10 times with 100 ms delay }
    for i:= 0 to 9 do begin
      Sleep(100);
      oBricklet.SetSelectedValue(7, true);
      Sleep(100);
      oBricklet.SetSelectedValue(7, false);
    end;

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBricklet.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
