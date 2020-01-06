program ExampleCallback;

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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletCO2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register oBricklet concentration callback to procedure CO2ConcentrationCB }
    oBricklet.OnCO2Concentration:= {$ifdef FPC}@{$endif}CO2ConcentrationCB;

    { Set period for oBricklet concentration callback to 1s (1000ms)
      Note: The oBricklet concentration callback is only called every second
            if the oBricklet concentration has changed since the last call! }
    oBricklet.SetCO2ConcentrationCallbackPeriod(1000);

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
