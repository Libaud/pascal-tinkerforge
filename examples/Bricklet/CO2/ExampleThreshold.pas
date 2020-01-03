program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletCO2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    co2: TBrickletCO2;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  co2 := TBrickletCO2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  co2.SetDebouncePeriod(10000);

  { Register CO2 concentration reached callback to procedure CO2ConcentrationReachedCB }
  co2.OnCO2ConcentrationReached := {$ifdef FPC}@{$endif}CO2ConcentrationReachedCB;

  { Configure threshold for CO2 concentration "greater than 750 ppm" }
  co2.SetCO2ConcentrationCallbackThreshold('>', 750, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
