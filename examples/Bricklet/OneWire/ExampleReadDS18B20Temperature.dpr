program ExampleReadDS18B20Temperature;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletOneWire;

type
  TExample = class
  private
    ipcon: TIPConnection;
    ow: TBrickletOneWire;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your One Wire Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var i: integer;
var t_low, t_high, status: byte;
var temperature: Single;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  ow := TBrickletOneWire.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  ow.WriteCommand(0, 78); { WRITE SCRATCHPAD }
  ow.Write(0); { ALARM H (unused) }
  ow.Write(0); { ALARM L (unused) }
  ow.Write(127); { CONFIGURATION: 12-bit mode }

  { Read temperature 10 times }
  for i := 0 to 9 do begin
    ow.WriteCommand(0, 68); { CONVERT T (start temperature conversion) }
    Sleep(1000); { Wait for conversion to finish }
    ow.WriteCommand(0, 190); { READ SCRATCHPAD }

    ow.Read(t_low, status);
    ow.Read(t_high, status);

    temperature := t_low or (t_high shl 8);

    { Negative 12-bit values are sign-extended to 16-bit two's complement }
    if (temperature > 1 << 12) then begin
      temperature := temperature - 1 << 16;
    end;

    { 12-bit mode measures in units of 1/16°C }
    WriteLn('Temperature: %f °C', temperature/16.0);
  end;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
