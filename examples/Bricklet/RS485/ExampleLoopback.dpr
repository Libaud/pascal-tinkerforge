program ExampleLoopback;

{ For this example connect the RX+/- pins to TX+/- pins on the same Bricklet
  and configure the DIP switch on the Bricklet to full-duplex mode }

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRS485;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletRS485;
  public
    procedure ReadCB(sender: TBrickletRS485; const message_: TArrayOfChar);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your RS485 Bricklet }

var
  e: TExample;

{ Callback procedure for read callback }
procedure TExample.ReadCB(sender: TBrickletRS485; const message_: TArrayOfChar);
var str: string;
begin
  { Assume that the message consists of ASCII characters and
    convert it from an array of chars to a string }
  SetString(str, PChar(@message_[0]), Length(message_));
  WriteLn(Format('Message: "%s"', [str]));
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletRS485.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Enable full-duplex mode }
	  oBricklet.SetRS485Configuration(115200, BRICKLET_RS485_PARITY_NONE,
								  BRICKLET_RS485_STOPBITS_1, BRICKLET_RS485_WORDLENGTH_8,
								  BRICKLET_RS485_DUPLEX_FULL);

	  { Register read callback to procedure ReadCB }
	  oBricklet.OnRead := {$ifdef FPC}@{$endif}ReadCB;

	  { Enable read callback }
	  oBricklet.EnableReadCallback;

	  { Write "test" string }
	  oBricklet.Write(['t', 'e', 's', 't']);

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
