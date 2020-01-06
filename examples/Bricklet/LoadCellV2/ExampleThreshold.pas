program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLoadCellV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletLoadCellV2;
  public
    procedure WeightCB(sender: TBrickletLoadCellV2; const weight: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Load Cell Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for weight callback }
procedure TExample.WeightCB(sender: TBrickletLoadCellV2; const weight: longint);
begin
  WriteLn(Format('Weight: %d g', [weight]));
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletLoadCellV2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register weight callback to procedure WeightCB }
    oBricklet.OnWeight:= {$ifdef FPC}@{$endif}WeightCB;

    { Configure threshold for weight "greater than 200 g"
      with a debounce period of 1s (1000ms) }
    oBricklet.SetWeightCallbackConfiguration(1000, false, '>', 200, 0);

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
