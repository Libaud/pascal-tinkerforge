program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLoadCell;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    lc: TBrickletLoadCell;
  public
    procedure WeightReachedCB(sender: TBrickletLoadCell; const weight: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Load Cell Bricklet }

var
  e: TExample;

{ Callback procedure for weight reached callback }
procedure TExample.WeightReachedCB(sender: TBrickletLoadCell; const weight: longint);
begin
  WriteLn(Format('Weight: %d g', [weight]));
end;

procedure TExample.Execute;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  lc:= TBrickletLoadCell.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 1 second (1000ms) }
  lc.SetDebouncePeriod(1000);

  { Register weight reached callback to procedure WeightReachedCB }
  lc.OnWeightReached:= {$ifdef FPC}@{$endif}WeightReachedCB;

  { Configure threshold for weight "greater than 200 g" }
  lc.SetWeightCallbackThreshold('>', 200, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
