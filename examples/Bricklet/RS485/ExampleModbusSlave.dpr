program ExampleModbusSlave;

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
    procedure ModbusSlaveWriteSingleRegisterRequestCB(sender: TBrickletRS485;
                                                      const requestID: byte;
                                                      const registerAddress: longword;
                                                      const registerValue: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your RS485 Bricklet }

var
  e: TExample;

{ Callback procedure for Modbus slave write single register request callback }
procedure TExample.ModbusSlaveWriteSingleRegisterRequestCB(sender: TBrickletRS485;
                                                           const requestID: byte;
                                                           const registerAddress: longword;
                                                           const registerValue: word);
begin
  WriteLn(Format('Request ID: %d', [requestID]));
  WriteLn(Format('Register Address: %d', [registerAddress]));
  WriteLn(Format('Register Value: %d', [registerValue]));

  if (registerAddress <> 42) then begin
    WriteLn('Error: Invalid register address');
    sender.ModbusSlaveReportException(requestID, BRICKLET_RS485_EXCEPTION_CODE_ILLEGAL_DATA_ADDRESS);
  end
  else begin
    sender.ModbusSlaveAnswerWriteSingleRegisterRequest(requestID);
  end
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

	  { Set operating mode to Modbus RTU slave }
	  oBricklet.SetMode(BRICKLET_RS485_MODE_MODBUS_SLAVE_RTU);

	  { Modbus specific configuration:
		- slave address = 17
		- master request timeout = 0ms (unused in slave mode) }
	  oBricklet.SetModbusConfiguration(17, 0);

	  { Register Modbus slave write single register request callback to procedure
		ModbusSlaveWriteSingleRegisterRequestCB }
	  oBricklet.OnModbusSlaveWriteSingleRegisterRequest := {$ifdef FPC}@{$endif}ModbusSlaveWriteSingleRegisterRequestCB;

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
