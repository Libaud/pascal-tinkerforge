program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletCompass;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletCompass;
  public
    procedure HeadingCB(sender: TBrickletCompass; const heading: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Compass Bricklet }

var
  e: TExample;

{ Callback procedure for heading callback }
procedure TExample.HeadingCB(sender: TBrickletCompass; const heading: smallint);
begin
  WriteLn(Format('Heading: %f °', [heading/10.0]));
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletCompass.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register heading callback to procedure HeadingCB }
    oBricklet.OnHeading:= {$ifdef FPC}@{$endif}HeadingCB;

    { Set period for heading callback to 0.1s (100ms) without a threshold }
    oBricklet.SetHeadingCallbackConfiguration(100, false, 'x', 0, 0);

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
