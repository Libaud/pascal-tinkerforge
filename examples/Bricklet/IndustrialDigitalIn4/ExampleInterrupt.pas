program ExampleInterrupt;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDigitalIn4;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIndustrialDigitalIn4;
  public
    procedure InterruptCB(sender: TBrickletIndustrialDigitalIn4;
                          const interruptMask: word; const valueMask: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Digital In 4 Bricklet }

var
  e: TExample;

{ Callback procedure for interrupt callback }
procedure TExample.InterruptCB(sender: TBrickletIndustrialDigitalIn4;
                               const interruptMask: word; const valueMask: word);
begin
  WriteLn(Format('Interrupt Mask: %d', [interruptMask]));
  WriteLn(Format('Value Mask: %d', [valueMask]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletIndustrialDigitalIn4.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register interrupt callback to procedure InterruptCB }
    oBricklet.OnInterrupt:= {$ifdef FPC}@{$endif}InterruptCB;

    { Enable interrupt on pin 0 }
    oBricklet.SetInterrupt(1 shl 0);

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
