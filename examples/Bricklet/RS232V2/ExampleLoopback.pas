program ExampleLoopback;

{ For this example connect the RX pin to the TX pin on the same Bricklet }

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRS232V2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    rs232: TBrickletRS232V2;
  public
    procedure ReadCB(sender: TBrickletRS232V2; const message_: TArrayOfChar);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your RS232 Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for read callback }
procedure TExample.ReadCB(sender: TBrickletRS232V2; const message_: TArrayOfChar);
var str: string;
begin
  { Assume that the message consists of ASCII characters and
    convert it from an array of chars to a string }
  SetString(str, PChar(@message_[0]), Length(message_));
  WriteLn(Format('Message: "%s"', [str]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  rs232 := TBrickletRS232V2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register read callback to procedure ReadCB }
  rs232.OnRead := {$ifdef FPC}@{$endif}ReadCB;

  { Enable read callback }
  rs232.EnableReadCallback;

  { Write "test" string }
  rs232.Write(['t', 'e', 's', 't']);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
