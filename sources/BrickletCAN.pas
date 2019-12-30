{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletCAN;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletCAN.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To7OfUInt8 = array [0..7] of byte;

  TBrickletCAN = class;
  TBrickletCANNotifyFrameRead = procedure(aSender: TBrickletCAN; const frameType: byte; const identifier: longword; const data: TArray0To7OfUInt8; const length_: byte) of object;

  /// <summary>
  ///  Communicates with CAN bus devices
  /// </summary>
  TBrickletCAN = class(TDevice)
  private
    frameReadCallback: TBrickletCANNotifyFrameRead;
    procedure CallbackWrapperFrameRead(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Writes a data or remote frame to the write buffer to be transmitted over the
    ///  CAN transceiver.
    ///  
    ///  The Bricklet supports the standard 11-bit (CAN 2.0A) and the additional extended
    ///  18-bit (CAN 2.0B) identifiers. For standard frames the Bricklet uses bit 0 to 10
    ///  from the ``identifier`` parameter as standard 11-bit identifier. For extended
    ///  frames the Bricklet additionally uses bit 11 to 28 from the ``identifier``
    ///  parameter as extended 18-bit identifier.
    ///  
    ///  For remote frames the ``data`` parameter is ignored.
    ///  
    ///  Returns *true* if the frame was successfully added to the write buffer. Returns
    ///  *false* if the frame could not be added because write buffer is already full.
    ///  
    ///  The write buffer can overflow if frames are written to it at a higher rate
    ///  than the Bricklet can transmitted them over the CAN transceiver. This may
    ///  happen if the CAN transceiver is configured as read-only or is using a low baud
    ///  rate (see <see cref="BrickletCAN.TBrickletCAN.SetConfiguration"/>). It can also happen if the CAN bus is
    ///  congested and the frame cannot be transmitted because it constantly loses
    ///  arbitration or because the CAN transceiver is currently disabled due to a high
    ///  write error level (see <see cref="BrickletCAN.TBrickletCAN.GetErrorLog"/>).
    /// </summary>
    function WriteFrame(const frameType: byte; const identifier: longword; const data: array of byte; const length_: byte): boolean; virtual;

    /// <summary>
    ///  Tries to read the next data or remote frame from the read buffer and return it.
    ///  If a frame was successfully read, then the ``success`` return value is set to
    ///  *true* and the other return values contain the frame. If the read buffer is
    ///  empty and no frame could be read, then the ``success`` return value is set to
    ///  *false* and the other return values contain invalid data.
    ///  
    ///  The ``identifier`` return value follows the identifier format described for
    ///  <see cref="BrickletCAN.TBrickletCAN.WriteFrame"/>.
    ///  
    ///  For remote frames the ``data`` return value always contains invalid data.
    ///  
    ///  A configurable read filter can be used to define which frames should be
    ///  received by the CAN transceiver and put into the read buffer (see
    ///  <see cref="BrickletCAN.TBrickletCAN.SetReadFilter"/>).
    ///  
    ///  Instead of polling with this function, you can also use callbacks. See the
    ///  <see cref="BrickletCAN.TBrickletCAN.EnableFrameReadCallback"/> function and the <see cref="BrickletCAN.TBrickletCAN.OnFrameRead"/> callback.
    /// </summary>
    procedure ReadFrame(out aSuccess: boolean; out aFrameType: byte; out aIdentifier: longword; out data: TArray0To7OfUInt8; out length_: byte); virtual;

    /// <summary>
    ///  Enables the <see cref="BrickletCAN.TBrickletCAN.OnFrameRead"/> callback.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure EnableFrameReadCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickletCAN.TBrickletCAN.OnFrameRead"/> callback.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure DisableFrameReadCallback; virtual;

    /// <summary>
    ///  Returns *true* if the <see cref="BrickletCAN.TBrickletCAN.OnFrameRead"/> callback is enabled, *false* otherwise.
    /// </summary>
    function IsFrameReadCallbackEnabled: boolean; virtual;

    /// <summary>
    ///  Sets the configuration for the CAN bus communication.
    ///  
    ///  The baud rate can be configured in steps between 10 and 1000 kbit/s.
    ///  
    ///  The CAN transceiver has three different modes:
    ///  
    ///  * Normal: Reads from and writes to the CAN bus and performs active bus
    ///    error detection and acknowledgement.
    ///  * Loopback: All reads and writes are performed internally. The transceiver
    ///    is disconnected from the actual CAN bus.
    ///  * Read-Only: Only reads from the CAN bus, but does neither active bus error
    ///    detection nor acknowledgement. Only the receiving part of the transceiver
    ///    is connected to the CAN bus.
    ///  
    ///  The write timeout has three different modes that define how a failed frame
    ///  transmission should be handled:
    ///  
    ///  * One-Shot (= -1): Only one transmission attempt will be made. If the
    ///    transmission fails then the frame is discarded.
    ///  * Infinite (= 0): Infinite transmission attempts will be made. The frame will
    ///    never be discarded.
    ///  * Milliseconds (&gt; 0): A limited number of transmission attempts will be made.
    ///    If the frame could not be transmitted successfully after the configured
    ///    number of milliseconds then the frame is discarded.
    /// </summary>
    procedure SetConfiguration(const baudRate: byte; const transceiverMode: byte; const writeTimeout: longint); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletCAN.TBrickletCAN.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out baudRate: byte; out transceiverMode: byte; out writeTimeout: longint); virtual;

    /// <summary>
    ///  Set the read filter configuration. This can be used to define which frames
    ///  should be received by the CAN transceiver and put into the read buffer.
    ///  
    ///  The read filter has five different modes that define if and how the mask and
    ///  the two filters are applied:
    ///  
    ///  * Disabled: No filtering is applied at all. All frames are received even
    ///    incomplete and defective frames. This mode should be used for debugging only.
    ///  * Accept-All: All complete and error-free frames are received.
    ///  * Match-Standard: Only standard frames with a matching identifier are received.
    ///  * Match-Standard-and-Data: Only standard frames with matching identifier and
    ///    data bytes are received.
    ///  * Match-Extended: Only extended frames with a matching identifier are received.
    ///  
    ///  The mask and filters are used as bit masks. Their usage depends on the mode:
    ///  
    ///  * Disabled: Mask and filters are ignored.
    ///  * Accept-All: Mask and filters are ignored.
    ///  * Match-Standard: Bit 0 to 10 (11 bits) of mask and filters are used to match
    ///    the 11-bit identifier of standard frames.
    ///  * Match-Standard-and-Data: Bit 0 to 10 (11 bits) of mask and filters are used
    ///    to match the 11-bit identifier of standard frames. Bit 11 to 18 (8 bits) and
    ///    bit 19 to 26 (8 bits) of mask and filters are used to match the first and
    ///    second data byte (if present) of standard frames.
    ///  * Match-Extended: Bit 0 to 10 (11 bits) of mask and filters are used
    ///    to match the standard 11-bit identifier part of extended frames. Bit 11 to 28
    ///    (18 bits) of mask and filters are used to match the extended 18-bit identifier
    ///    part of extended frames.
    ///  
    ///  The mask and filters are applied in this way: The mask is used to select the
    ///  identifier and data bits that should be compared to the corresponding filter
    ///  bits. All unselected bits are automatically accepted. All selected bits have
    ///  to match one of the filters to be accepted. If all bits for the selected mode
    ///  are accepted then the frame is accepted and is added to the read buffer.
    ///  
    ///  <code>
    ///   "Mask Bit", "Filter Bit", "Identifier/Data Bit", "Result"
    ///  
    ///   0, X, X, Accept
    ///   1, 0, 0, Accept
    ///   1, 0, 1, Reject
    ///   1, 1, 0, Reject
    ///   1, 1, 1, Accept
    ///  </code>
    ///  
    ///  For example, to receive standard frames with identifier 0x123 only the mode can
    ///  be set to Match-Standard with 0x7FF as mask and 0x123 as filter 1 and filter 2.
    ///  The mask of 0x7FF selects all 11 identifier bits for matching so that the
    ///  identifier has to be exactly 0x123 to be accepted.
    ///  
    ///  To accept identifier 0x123 and identifier 0x456 at the same time, just set
    ///  filter 2 to 0x456 and keep mask and filter 1 unchanged.
    /// </summary>
    procedure SetReadFilter(const aMode: byte; const mask: longword; const filter1: longword; const filter2: longword); virtual;

    /// <summary>
    ///  Returns the read filter as set by <see cref="BrickletCAN.TBrickletCAN.SetReadFilter"/>.
    /// </summary>
    procedure GetReadFilter(out mode: byte; out mask: longword; out filter1: longword; out filter2: longword); virtual;

    /// <summary>
    ///  Returns information about different kinds of errors.
    ///  
    ///  The write and read error levels indicate the current level of checksum,
    ///  acknowledgement, form, bit and stuffing errors during CAN bus write and read
    ///  operations.
    ///  
    ///  When the write error level extends 255 then the CAN transceiver gets disabled
    ///  and no frames can be transmitted or received anymore. The CAN transceiver will
    ///  automatically be activated again after the CAN bus is idle for a while.
    ///  
    ///  The write and read error levels are not available in read-only transceiver mode
    ///  (see <see cref="BrickletCAN.TBrickletCAN.SetConfiguration"/>) and are reset to 0 as a side effect of changing
    ///  the configuration or the read filter.
    ///  
    ///  The write timeout, read register and buffer overflow counts represents the
    ///  number of these errors:
    ///  
    ///  * A write timeout occurs if a frame could not be transmitted before the
    ///    configured write timeout expired (see <see cref="BrickletCAN.TBrickletCAN.SetConfiguration"/>).
    ///r  * A read register overflow occurs if the read register of the CAN transceiver
    ///    still contains the last received frame when the next frame arrives. In this
    ///    case the newly arrived frame is lost. This happens if the CAN transceiver
    ///    receives more frames than the Bricklet can handle. Using the read filter
    ///    (see <see cref="BrickletCAN.TBrickletCAN.SetReadFilter"/>) can help to reduce the amount of received frames.
    ///    This count is not exact, but a lower bound, because the Bricklet might not
    ///    able detect all overflows if they occur in rapid succession.
    ///  * A read buffer overflow occurs if the read buffer of the Bricklet is already
    ///    full when the next frame should be read from the read register of the CAN
    ///    transceiver. In this case the frame in the read register is lost. This
    ///    happens if the CAN transceiver receives more frames to be added to the read
    ///    buffer than are removed from the read buffer using the <see cref="BrickletCAN.TBrickletCAN.ReadFrame"/>
    ///    function. Using the <see cref="BrickletCAN.TBrickletCAN.OnFrameRead"/> callback ensures that the read buffer
    ///    can not overflow.
    /// </summary>
    procedure GetErrorLog(out writeErrorLevel: byte; out readErrorLevel: byte; out transceiverDisabled: boolean; out writeTimeoutCount: longword; out readRegisterOverflowCount: longword; out readBufferOverflowCount: longword); virtual;

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
    procedure GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered if a data or remote frame was received by the CAN
    ///  transceiver.
    ///  
    ///  The ``identifier`` return value follows the identifier format described for
    ///  <see cref="BrickletCAN.TBrickletCAN.WriteFrame"/>.
    ///  
    ///  For remote frames the ``data`` return value always contains invalid values.
    ///  
    ///  A configurable read filter can be used to define which frames should be
    ///  received by the CAN transceiver at all (see <see cref="BrickletCAN.TBrickletCAN.SetReadFilter"/>).
    ///  
    ///  To enable this callback, use <see cref="BrickletCAN.TBrickletCAN.EnableFrameReadCallback"/>.
    /// </summary>
    property OnFrameRead: TBrickletCANNotifyFrameRead read frameReadCallback write frameReadCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletCAN.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletCAN.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_CAN_FUNCTION_WRITE_FRAME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_FUNCTION_READ_FRAME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_FUNCTION_ENABLE_FRAME_READ_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CAN_FUNCTION_DISABLE_FRAME_READ_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CAN_FUNCTION_IS_FRAME_READ_CALLBACK_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CAN_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_FUNCTION_SET_READ_FILTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CAN_FUNCTION_GET_READ_FILTER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_FUNCTION_GET_ERROR_LOG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletCAN.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_CAN_CALLBACK_FRAME_READ]:= {$ifdef FPC}@{$endif}CallbackWrapperFrameRead;
end;

function TBrickletCAN.WriteFrame(const frameType: byte; const identifier: longword; const data: array of byte; const length_: byte): boolean;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_FUNCTION_WRITE_FRAME, 22);
  LEConvertUInt8To(frameType, 8, _request);
  LEConvertUInt32To(identifier, 9, _request);
  if (Length(data) <> 8) then raise EInvalidParameterException.Create('Data has to be exactly 8 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 13 + (_i * 1), _request);
  LEConvertUInt8To(length_, 21, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletCAN.ReadFrame(out aSuccess: boolean; out aFrameType: byte; out aIdentifier: longword; out data: TArray0To7OfUInt8; out length_: byte);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_FUNCTION_READ_FRAME, 8);
  _response:= SendRequest(_request);
  aSuccess:= LEConvertBooleanFrom(8, _response);
  aFrameType:= LEConvertUInt8From(9, _response);
  aIdentifier:= LEConvertUInt32From(10, _response);
  for _i:= 0 to 7 do data[_i]:= LEConvertUInt8From(14 + (_i * 1), _response);
  length_:= LEConvertUInt8From(22, _response);
end;

procedure TBrickletCAN.EnableFrameReadCallback;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_FUNCTION_ENABLE_FRAME_READ_CALLBACK, 8);
  SendRequest(_request);
end;

procedure TBrickletCAN.DisableFrameReadCallback;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_FUNCTION_DISABLE_FRAME_READ_CALLBACK, 8);
  SendRequest(_request);
end;

function TBrickletCAN.IsFrameReadCallbackEnabled: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_FUNCTION_IS_FRAME_READ_CALLBACK_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletCAN.SetConfiguration(const baudRate: byte; const transceiverMode: byte; const writeTimeout: longint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_FUNCTION_SET_CONFIGURATION, 14);
  LEConvertUInt8To(baudRate, 8, _request);
  LEConvertUInt8To(transceiverMode, 9, _request);
  LEConvertInt32To(writeTimeout, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletCAN.GetConfiguration(out baudRate: byte; out transceiverMode: byte; out writeTimeout: longint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  baudRate:= LEConvertUInt8From(8, _response);
  transceiverMode:= LEConvertUInt8From(9, _response);
  writeTimeout:= LEConvertInt32From(10, _response);
end;

procedure TBrickletCAN.SetReadFilter(const aMode: byte; const mask: longword; const filter1: longword; const filter2: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_FUNCTION_SET_READ_FILTER, 21);
  LEConvertUInt8To(aMode, 8, _request);
  LEConvertUInt32To(mask, 9, _request);
  LEConvertUInt32To(filter1, 13, _request);
  LEConvertUInt32To(filter2, 17, _request);
  SendRequest(_request);
end;

procedure TBrickletCAN.GetReadFilter(out mode: byte; out mask: longword; out filter1: longword; out filter2: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_FUNCTION_GET_READ_FILTER, 8);
  _response:= SendRequest(_request);
  mode:= LEConvertUInt8From(8, _response);
  mask:= LEConvertUInt32From(9, _response);
  filter1:= LEConvertUInt32From(13, _response);
  filter2:= LEConvertUInt32From(17, _response);
end;

procedure TBrickletCAN.GetErrorLog(out writeErrorLevel: byte; out readErrorLevel: byte; out transceiverDisabled: boolean; out writeTimeoutCount: longword; out readRegisterOverflowCount: longword; out readBufferOverflowCount: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_FUNCTION_GET_ERROR_LOG, 8);
  _response:= SendRequest(_request);
  writeErrorLevel:= LEConvertUInt8From(8, _response);
  readErrorLevel:= LEConvertUInt8From(9, _response);
  transceiverDisabled:= LEConvertBooleanFrom(10, _response);
  writeTimeoutCount:= LEConvertUInt32From(11, _response);
  readRegisterOverflowCount:= LEConvertUInt32From(15, _response);
  readBufferOverflowCount:= LEConvertUInt32From(19, _response);
end;

procedure TBrickletCAN.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletCAN.CallbackWrapperFrameRead(const aPacket: TDynamicByteArray);
var frameType: byte; identifier: longword; data: TArray0To7OfUInt8; length_: byte; _i: longint;
begin
  frameType:= LEConvertUInt8From(8, aPacket);
  identifier:= LEConvertUInt32From(9, aPacket);
  for _i:= 0 to 7 do data[_i]:= LEConvertUInt8From(13 + (_i * 1), aPacket);
  length_:= LEConvertUInt8From(21, aPacket);

  if (Assigned(frameReadCallback)) then begin
    frameReadCallback(self, frameType, identifier, data, length_);
  end;
end;

end.
