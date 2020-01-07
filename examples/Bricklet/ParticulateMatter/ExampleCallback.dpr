program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletParticulateMatter;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletParticulateMatter;
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
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletParticulateMatter.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register PM concentration callback to procedure PMConcentrationCB }
	  oBricklet.OnPMConcentration := {$ifdef FPC}@{$endif}PMConcentrationCB;

	  { Set period for PM concentration callback to 1s (1000ms) }
	  oBricklet.SetPMConcentrationCallbackConfiguration(1000, false);

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBricklet.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
