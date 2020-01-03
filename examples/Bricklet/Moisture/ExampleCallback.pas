program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMoisture;

type
  TExample = class
  private
    ipcon: TIPConnection;
    m: TBrickletMoisture;
  public
    procedure MoistureCB(sender: TBrickletMoisture; const moisture: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Moisture Bricklet }

var
  e: TExample;

{ Callback procedure for moisture value callback }
procedure TExample.MoistureCB(sender: TBrickletMoisture; const moisture: word);
begin
  WriteLn(Format('Moisture Value: %d', [moisture]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  m := TBrickletMoisture.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register moisture value callback to procedure MoistureCB }
  m.OnMoisture := {$ifdef FPC}@{$endif}MoistureCB;

  { Set period for moisture value callback to 1s (1000ms)
    Note: The moisture value callback is only called every second
          if the moisture value has changed since the last call! }
  m.SetMoistureCallbackPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
