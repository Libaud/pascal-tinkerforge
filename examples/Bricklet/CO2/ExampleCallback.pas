program ExampleCallback;

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
    procedure CO2ConcentrationCB(sender: TBrickletCO2; const co2Concentration: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your CO2 Bricklet }

var
  e: TExample;

{ Callback procedure for CO2 concentration callback }
procedure TExample.CO2ConcentrationCB(sender: TBrickletCO2; const co2Concentration: word);
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

  { Register CO2 concentration callback to procedure CO2ConcentrationCB }
  co2.OnCO2Concentration := {$ifdef FPC}@{$endif}CO2ConcentrationCB;

  { Set period for CO2 concentration callback to 1s (1000ms)
    Note: The CO2 concentration callback is only called every second
          if the CO2 concentration has changed since the last call! }
  co2.SetCO2ConcentrationCallbackPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
