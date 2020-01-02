{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletRS232;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletRS232.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To59OfChar = array [0..59] of char;

  TBrickletRS232 = class;
  TBrickletRS232NotifyRead = procedure(aSender: TBrickletRS232; const aMessage: TArray0To59OfChar; const aLength: byte) of object;
  TBrickletRS232NotifyError = procedure(aSender: TBrickletRS232; const aError: byte) of object;

  /// <summary>
  ///  Communicates with RS232 devices
  /// </summary>
  TBrickletRS232 = class(TDevice)
  private
    fReadCallback: TBrickletRS232NotifyRead;
    fErrorCallback: TBrickletRS232NotifyError;
    procedure CallbackWrapperRead(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperError(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Writes a string of up to 60 characters to the RS232 interface. The string
    ///  can be binary data, ASCII or similar is not necessary.
    ///  
    ///  The length of the string has to be given as an additional parameter.
    ///  
    ///  The return value is the number of bytes that could be written.
    ///  
    ///  See <see cref="BrickletRS232.TBrickletRS232.SetConfiguration"/> for configuration possibilities
    ///  regarding baudrate, parity and so on.
    /// </summary>
    function Write(const aMessage: array of char; const aLength: byte): byte; virtual;

    /// <summary>
    ///  Returns the currently buffered message. The maximum length
    ///  of message is 60. If the length is given as 0, there was no
    ///  new data available.
    ///  
    ///  Instead of polling with this function, you can also use
    ///  callbacks. See <see cref="BrickletRS232.TBrickletRS232.EnableReadCallback"/> and <see cref="BrickletRS232.TBrickletRS232.OnRead"/> callback.
    /// </summary>
    procedure Read(out aMessage: TArray0To59OfChar; out aLength: byte); virtual;

    /// <summary>
    ///  Enables the <see cref="BrickletRS232.TBrickletRS232.OnRead"/> callback.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure EnableReadCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickletRS232.TBrickletRS232.OnRead"/> callback.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure DisableReadCallback; virtual;

    /// <summary>
    ///  Returns *true* if the <see cref="BrickletRS232.TBrickletRS232.OnRead"/> callback is enabled,
    ///  *false* otherwise.
    /// </summary>
    function IsReadCallbackEnabled: boolean; virtual;

    /// <summary>
    ///  Sets the configuration for the RS232 communication. Available options:
    ///  
    ///  * Baudrate between 300 and 230400 baud.
    ///  * Parity of none, odd, even or forced parity.
    ///  * Stopbits can be 1 or 2.
    ///  * Word length of 5 to 8.
    ///  * Hard-/Software flow control can either be on or off but not both simultaneously on.
    ///  
    ///  The default is: 115200 baud, parity none, 1 stop bit, word length 8, hard-/software flow control off.
    /// </summary>
    procedure SetConfiguration(const aBaudrate: byte; const aParity: byte; const aStopbits: byte; const aWordlength: byte;
                               const aHardwareFlowcontrol: byte; const aSoftwareFlowcontrol: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRS232.TBrickletRS232.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out aBaudrate: byte; out aParity: byte; out aStopbits: byte; out aWordlength: byte;
                               out aHardwareFlowcontrol: byte; out aSoftwareFlowcontrol: byte); virtual;

    /// <summary>
    ///  Sets a break condition (the TX output is forced to a logic 0 state).
    ///  The parameter sets the hold-time of the break condition (in ms).
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetBreakCondition(const aBreakTime: word); virtual;

    /// <summary>
    ///  Returns the UID, the UID where the Bricklet is connected to,
    ///  the position, the hardware and firmware version as well as the
    ///  device identifier.
    ///  
    ///  The position can be 'a', 'b', 'c' or 'd'.
    ///  
    ///  The device identifier numbers can be found :ref:`here &lt;device_identifier&gt;`.
    ///  |device_identifier_constant|
    /// </summary>
    procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber;
                          out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is called if new data is available. The message has
    ///  a maximum size of 60 characters. The actual length of the message
    ///  is given in addition.
    ///  
    ///  To enable this callback, use <see cref="BrickletRS232.TBrickletRS232.EnableReadCallback"/>.
    /// </summary>
    property OnRead: TBrickletRS232NotifyRead read fReadCallback write fReadCallback;

    /// <summary>
    ///  This callback is called if an error occurs.
    ///  Possible errors are overrun, parity or framing error.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    property OnError: TBrickletRS232NotifyError read fErrorCallback write fErrorCallback;


    /// <summary>
    ///  This callback is called if new data is available. The message has
    ///  a maximum size of 60 characters. The actual length of the message
    ///  is given in addition.
    ///
    ///  To enable this callback, use <see cref="BrickletRS232.TBrickletRS232.EnableReadCallback"/>.
    /// </summary>
    property OnReadCallback: TBrickletRS232NotifyRead read fReadCallback write fReadCallback; { for backward compatibility }

    /// <summary>
    ///  This callback is called if an error occurs.
    ///  Possible errors are overrun, parity or framing error.
    ///
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    property OnErrorCallback: TBrickletRS232NotifyError read fErrorCallback write fErrorCallback; { for backward compatibility }

  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletRS232.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 2;
end;

procedure TBrickletRS232.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_RS232_FUNCTION_WRITE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_FUNCTION_READ]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_FUNCTION_ENABLE_READ_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_RS232_FUNCTION_DISABLE_READ_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_RS232_FUNCTION_IS_READ_CALLBACK_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS232_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_FUNCTION_SET_BREAK_CONDITION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS232_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletRS232.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_RS232_CALLBACK_READ]:= {$ifdef FPC}@{$endif}CallbackWrapperRead;
  aCallBacks[BRICKLET_RS232_CALLBACK_ERROR]:= {$ifdef FPC}@{$endif}CallbackWrapperError;
end;

function TBrickletRS232.Write(const aMessage: array of char; const aLength: byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_WRITE, 69);
  if (Length(aMessage) <> 60) then raise EInvalidParameterException.Create('Message has to be exactly 60 items long');
  for _i:= 0 to Length(aMessage) - 1 do LEConvertCharTo(aMessage[_i], 8 + (_i * 1), _request);
  LEConvertUInt8To(aLength, 68, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS232.Read(out aMessage: TArray0To59OfChar; out aLength: byte);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_READ, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 59 do aMessage[_i]:= LEConvertCharFrom(8 + (_i * 1), _response);
  aLength:= LEConvertUInt8From(68, _response);
end;

procedure TBrickletRS232.EnableReadCallback;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_ENABLE_READ_CALLBACK, 8);
  SendRequest(_request);
end;

procedure TBrickletRS232.DisableReadCallback;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_DISABLE_READ_CALLBACK, 8);
  SendRequest(_request);
end;

function TBrickletRS232.IsReadCallbackEnabled: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_IS_READ_CALLBACK_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletRS232.SetConfiguration(const aBaudrate: byte; const aParity: byte; const aStopbits: byte; const aWordlength: byte; const aHardwareFlowcontrol: byte; const aSoftwareFlowcontrol: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_SET_CONFIGURATION, 14);
  LEConvertUInt8To(aBaudrate, 8, _request);
  LEConvertUInt8To(aParity, 9, _request);
  LEConvertUInt8To(aStopbits, 10, _request);
  LEConvertUInt8To(aWordlength, 11, _request);
  LEConvertUInt8To(aHardwareFlowcontrol, 12, _request);
  LEConvertUInt8To(aSoftwareFlowcontrol, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletRS232.GetConfiguration(out aBaudrate: byte; out aParity: byte; out aStopbits: byte; out aWordlength: byte; out aHardwareFlowcontrol: byte; out aSoftwareFlowcontrol: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aBaudrate:= LEConvertUInt8From(8, _response);
  aParity:= LEConvertUInt8From(9, _response);
  aStopbits:= LEConvertUInt8From(10, _response);
  aWordlength:= LEConvertUInt8From(11, _response);
  aHardwareFlowcontrol:= LEConvertUInt8From(12, _response);
  aSoftwareFlowcontrol:= LEConvertUInt8From(13, _response);
end;

procedure TBrickletRS232.SetBreakCondition(const aBreakTime: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_SET_BREAK_CONDITION, 10);
  LEConvertUInt16To(aBreakTime, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletRS232.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletRS232.CallbackWrapperRead(const aPacket: TDynamicByteArray);
var
  _message: TArray0To59OfChar;
  _length: byte;
  _i: longint;
begin
  for _i:= 0 to 59 do _message[_i]:= LEConvertCharFrom(8 + (_i * 1), aPacket);
  _length:= LEConvertUInt8From(68, aPacket);

  if (Assigned(fReadCallback)) then begin
    fReadCallback(self, _message, _length);
  end;
end;

procedure TBrickletRS232.CallbackWrapperError(const aPacket: TDynamicByteArray);
var
  _error: byte;
begin
  _error:= LEConvertUInt8From(8, aPacket);

  if (Assigned(fErrorCallback)) then begin
    fErrorCallback(self, _error);
  end;
end;

end.
