program ExampleInterrupt;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDigitalIn4;

type
  TExample = class
  private
    ipcon: TIPConnection;
    idi4: TBrickletIndustrialDigitalIn4;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  idi4 := TBrickletIndustrialDigitalIn4.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register interrupt callback to procedure InterruptCB }
  idi4.OnInterrupt := {$ifdef FPC}@{$endif}InterruptCB;

  { Enable interrupt on pin 0 }
  idi4.SetInterrupt(1 shl 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
