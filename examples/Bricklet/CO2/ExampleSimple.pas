program ExampleSimple;

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
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your CO2 Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var co2Concentration: word;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  co2 := TBrickletCO2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current CO2 concentration }
  co2Concentration := co2.GetCO2Concentration;
  WriteLn(Format('CO2 Concentration: %d ppm', [co2Concentration]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
