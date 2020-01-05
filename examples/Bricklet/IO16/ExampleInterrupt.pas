program ExampleInterrupt;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIO16;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    io: TBrickletIO16;
  public
    procedure InterruptCB(sender: TBrickletIO16; const port: char;
                          const interruptMask: byte; const valueMask: byte);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your IO-16 Bricklet }

var
  e: TExample;

{ Callback procedure for interrupt callback }
procedure TExample.InterruptCB(sender: TBrickletIO16; const port: char;
                               const interruptMask: byte; const valueMask: byte);
begin
  WriteLn(Format('Port: %s', [port]));
  WriteLn(Format('Interrupt Mask: %d', [interruptMask]));
  WriteLn(Format('Value Mask: %d', [valueMask]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  io:= TBrickletIO16.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register interrupt callback to procedure InterruptCB }
  io.OnInterrupt:= {$ifdef FPC}@{$endif}InterruptCB;

  { Enable interrupt on pin 2 of port A }
  io.SetPortInterrupt('a', 1 shl 2);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
