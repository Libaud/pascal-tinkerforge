program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletParticulateMatter;

type
  TExample = class
  private
    ipcon: TIPConnection;
    pm: TBrickletParticulateMatter;
  public
    procedure PMConcentrationCB(sender: TBrickletParticulateMatter; const pm10: word;
                                const pm25: word; const pm100: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Particulate Matter Bricklet }

var
  e: TExample;

{ Callback procedure for PM concentration callback }
procedure TExample.PMConcentrationCB(sender: TBrickletParticulateMatter; const pm10: word;
                                     const pm25: word; const pm100: word);
begin
  WriteLn(Format('PM 1.0: %d µg/m³', [pm10]));
  WriteLn(Format('PM 2.5: %d µg/m³', [pm25]));
  WriteLn(Format('PM 10.0: %d µg/m³', [pm100]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  pm := TBrickletParticulateMatter.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register PM concentration callback to procedure PMConcentrationCB }
  pm.OnPMConcentration := {$ifdef FPC}@{$endif}PMConcentrationCB;

  { Set period for PM concentration callback to 1s (1000ms) }
  pm.SetPMConcentrationCallbackConfiguration(1000, false);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
