program ExampleEdgeCount;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDigitalIn4V2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    idi4: TBrickletIndustrialDigitalIn4V2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Digital In 4 Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var i: integer; count: longword;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  idi4 := TBrickletIndustrialDigitalIn4V2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Configure rising edge count (channel 3) with 10ms debounce }
  idi4.SetEdgeCountConfiguration(3, 0, 10);

  { Get edge count 10 times with 1s delay }
  for i := 0 to 9 do begin
    Sleep(1000);

    { Get current edge count }
    count := idi4.GetEdgeCount(3, false);
    WriteLn(Format('Count: %d', [count]));
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
