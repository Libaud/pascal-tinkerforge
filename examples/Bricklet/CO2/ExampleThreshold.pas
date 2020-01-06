program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletCO2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletCO2;
  public
    procedure CO2ConcentrationReachedCB(sender: TBrickletCO2;
                                        const co2Concentration: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your CO2 Bricklet }

var
  e: TExample;

{ Callback procedure for CO2 concentration reached callback }
procedure TExample.CO2ConcentrationReachedCB(sender: TBrickletCO2;
                                             const co2Concentration: word);
begin
  WriteLn(Format('CO2 Concentration: %d ppm', [co2Concentration]));
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletCO2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
    oBricklet.SetDebouncePeriod(10000);

    { Register oBricklet concentration reached callback to procedure CO2ConcentrationReachedCB }
    oBricklet.OnCO2ConcentrationReached:= {$ifdef FPC}@{$endif}CO2ConcentrationReachedCB;

    { Configure threshold for oBricklet concentration "greater than 750 ppm" }
    oBricklet.SetCO2ConcentrationCallbackThreshold('>', 750, 0);

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
