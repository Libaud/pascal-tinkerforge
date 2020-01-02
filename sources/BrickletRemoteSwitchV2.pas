{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletRemoteSwitchV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletRemoteSwitchV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletRemoteSwitchV2 = class;
  TBrickletRemoteSwitchV2NotifySwitchingDone = procedure(aSender: TBrickletRemoteSwitchV2) of object;
  TBrickletRemoteSwitchV2NotifyRemoteStatusA = procedure(aSender: TBrickletRemoteSwitchV2; const aHouseCode: byte; const aReceiverCode: byte;
                                                         const aSwitchTo: byte; const aRepeats: word) of object;
  TBrickletRemoteSwitchV2NotifyRemoteStatusB = procedure(aSender: TBrickletRemoteSwitchV2; const aAddress: longword; const aUnit: byte;
                                                         const aSwitchTo: byte; const aDimValue: byte; const aRepeats: word) of object;
  TBrickletRemoteSwitchV2NotifyRemoteStatusC = procedure(aSender: TBrickletRemoteSwitchV2; const aSystemCode: char; const aDeviceCode: byte;
                                                         const aSwitchTo: byte; const aRepeats: word) of object;

  /// <summary>
  ///  Controls remote mains switches and receives signals from remotes
  /// </summary>
  TBrickletRemoteSwitchV2 = class(TDevice)
  private
    fSwitchingDoneCallback: TBrickletRemoteSwitchV2NotifySwitchingDone;
    fRemoteStatusACallback: TBrickletRemoteSwitchV2NotifyRemoteStatusA;
    fRemoteStatusBCallback: TBrickletRemoteSwitchV2NotifyRemoteStatusB;
    fRemoteStatusCCallback: TBrickletRemoteSwitchV2NotifyRemoteStatusC;
    procedure CallbackWrapperSwitchingDone(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperRemoteStatusA(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperRemoteStatusB(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperRemoteStatusC(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the current switching state. If the current state is busy, the
    ///  Bricklet is currently sending a code to switch a socket. It will not
    ///  accept any calls of switch socket functions until the state changes to ready.
    ///  
    ///  How long the switching takes is dependent on the number of repeats, see
    ///  <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.SetRepeats"/>.
    /// </summary>
    function GetSwitchingState: byte; virtual;

    /// <summary>
    ///  Sets the number of times the code is send when one of the Switch Socket
    ///  functions is called. The repeats basically correspond to the amount of time
    ///  that a button of the remote is pressed.
    ///  
    ///  Some dimmers are controlled by the length of a button pressed,
    ///  this can be simulated by increasing the repeats.
    ///  
    ///  The default value is 5.
    /// </summary>
    procedure SetRepeats(const aRepeats: byte); virtual;

    /// <summary>
    ///  Returns the number of repeats as set by <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.SetRepeats"/>.
    /// </summary>
    function GetRepeats: byte; virtual;

    /// <summary>
    ///  To switch a type A socket you have to give the house code, receiver code and the
    ///  state (on or off) you want to switch to.
    ///  
    ///  The house code and receiver code have a range of 0 to 31 (5bit).
    ///  
    ///  A detailed description on how you can figure out the house and receiver code
    ///  can be found :ref:`here &lt;remote_switch_bricklet_type_a_house_and_receiver_code&gt;`.
    /// </summary>
    procedure SwitchSocketA(const aHouseCode: byte; const aReceiverCode: byte; const aSwitchTo: byte); virtual;

    /// <summary>
    ///  To switch a type B socket you have to give the address, unit and the state
    ///  (on or off) you want to switch to.
    ///  
    ///  The address has a range of 0 to 67108863 (26bit) and the unit has a range
    ///  of 0 to 15 (4bit). To switch all devices with the same address use 255 for
    ///  the unit.
    ///  
    ///  A detailed description on how you can teach a socket the address and unit can
    ///  be found :ref:`here &lt;remote_switch_bricklet_type_b_address_and_unit&gt;`.
    /// </summary>
    procedure SwitchSocketB(const aAddress: longword; const aUnit: byte; const aSwitchTo: byte); virtual;

    /// <summary>
    ///  To control a type B dimmer you have to give the address, unit and the
    ///  dim value you want to set the dimmer to.
    ///  
    ///  The address has a range of 0 to 67108863 (26bit), the unit and the dim value
    ///  has a range of 0 to 15 (4bit).
    ///  
    ///  A detailed description on how you can teach a dimmer the address and unit can
    ///  be found :ref:`here &lt;remote_switch_bricklet_type_b_address_and_unit&gt;`.
    /// </summary>
    procedure DimSocketB(const aAddress: longword; const aUnit: byte; const aDimValue: byte); virtual;

    /// <summary>
    ///  To switch a type C socket you have to give the system code, device code and the
    ///  state (on or off) you want to switch to.
    ///  
    ///  The system code has a range of 'A' to 'P' (4bit) and the device code has a
    ///  range of 1 to 16 (4bit).
    ///  
    ///  A detailed description on how you can figure out the system and device code
    ///  can be found :ref:`here &lt;remote_switch_bricklet_type_c_system_and_device_code&gt;`.
    /// </summary>
    procedure SwitchSocketC(const aSystemCode: char; const aDeviceCode: byte; const aSwitchTo: byte); virtual;

    /// <summary>
    ///  Sets the configuration for **receiving** data from a remote of type A, B or C.
    ///  
    ///  * Remote Type: A, B or C depending on the type of remote you want to receive.
    ///  * Minimum Repeats: The minimum number of repeated data packets until the callback
    ///    is triggered (if enabled).
    ///  * Callback Enabled: Enable or disable callback (see <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.OnRemoteStatusA"/> callback,
    ///    <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.OnRemoteStatusB"/> callback and <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.OnRemoteStatusC"/> callback).
    ///  
    ///  Default is ('A', 2, false).
    /// </summary>
    procedure SetRemoteConfiguration(const aRemoteType: byte; const aMinimumRepeats: word; const aCallbackEnabled: boolean); virtual;

    /// <summary>
    ///  Returns the remote configuration as set by <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.SetRemoteConfiguration"/>
    /// </summary>
    procedure GetRemoteConfiguration(out aRemoteType: byte; out aMinimumRepeats: word; out aCallbackEnabled: boolean); virtual;

    /// <summary>
    ///  Returns the house code, receiver code, switch state (on/off) and number of
    ///  repeats for remote type A.
    ///  
    ///  Repeats == 0 means there was no button press. Repeats &gt;= 1 means there
    ///  was a button press with the specified house/receiver code. The repeats are the
    ///  number of received identical data packets. The longer the button is pressed,
    ///  the higher the repeat number.
    ///  
    ///  Use the callback to get this data automatically when a button is pressed,
    ///  see <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.SetRemoteConfiguration"/> and <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.OnRemoteStatusA"/> callback.
    /// </summary>
    procedure GetRemoteStatusA(out aHouseCode: byte; out aReceiverCode: byte; out aSwitchTo: byte; out aRepeats: word); virtual;

    /// <summary>
    ///  Returns the address (unique per remote), unit (button number), switch state
    ///  (on/off) and number of repeats for remote type B.
    ///  
    ///  If the remote supports dimming the dim value is used instead of the switch state.
    ///  
    ///  If repeats=0 there was no button press. If repeats &gt;= 1 there
    ///  was a button press with the specified address/unit. The repeats are the number of received
    ///  identical data packets. The longer the button is pressed, the higher the repeat number.
    ///  
    ///  Use the callback to get this data automatically when a button is pressed,
    ///  see <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.SetRemoteConfiguration"/> and <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.OnRemoteStatusB"/> callback.
    /// </summary>
    procedure GetRemoteStatusB(out aAddress: longword; out aUnit: byte; out aSwitchTo: byte; out aDimValue: byte; out aRepeats: word); virtual;

    /// <summary>
    ///  Returns the system code, device code, switch state (on/off) and number of repeats for
    ///  remote type C.
    ///  
    ///  If repeats=0 there was no button press. If repeats &gt;= 1 there
    ///  was a button press with the specified system/device code. The repeats are the number of received
    ///  identical data packets. The longer the button is pressed, the higher the repeat number.
    ///  
    ///  Use the callback to get this data automatically when a button is pressed,
    ///  see <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.SetRemoteConfiguration"/> and <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.OnRemoteStatusC"/> callback.
    /// </summary>
    procedure GetRemoteStatusC(out aSystemCode: char; out aDeviceCode: byte; out aSwitchTo: byte; out aRepeats: word); virtual;

    /// <summary>
    ///  Returns the error count for the communication between Brick and Bricklet.
    ///  
    ///  The errors are divided into
    ///  
    ///  * ACK checksum errors,
    ///  * message checksum errors,
    ///  * framing errors and
    ///  * overflow errors.
    ///  
    ///  The errors counts are for errors that occur on the Bricklet side. All
    ///  Bricks have a similar function that returns the errors on the Brick side.
    /// </summary>
    procedure GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword;
                                  out aErrorCountFrame: longword; out aErrorCountOverflow: longword); virtual;

    /// <summary>
    ///  Sets the bootloader mode and returns the status after the _requested
    ///  mode change was instigated.
    ///  
    ///  You can change from bootloader mode to firmware mode and vice versa. A change
    ///  from bootloader mode to firmware mode will only take place if the entry function,
    ///  device identifier and CRC are present and correct.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function SetBootloaderMode(const aMode: byte): byte; virtual;

    /// <summary>
    ///  Returns the current bootloader mode, see <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.SetWriteFirmwarePointer"/> before. The firmware is written
    ///  to flash every 4 chunks.
    ///  
    ///  You can only write firmware in bootloader mode.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function WriteFirmware(const aData: array of byte): byte; virtual;

    /// <summary>
    ///  Sets the status LED configuration. By default the LED shows
    ///  communication traffic between Brick and Bricklet, it flickers once
    ///  for every 10 received data packets.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is will show heartbeat by default.
    /// </summary>
    procedure SetStatusLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.SetStatusLEDConfig"/>
    /// </summary>
    function GetStatusLEDConfig: byte; virtual;

    /// <summary>
    ///  Returns the temperature in °C as measured inside the microcontroller. The
    ///  value returned is not the ambient temperature!
    ///  
    ///  The temperature is only proportional to the real temperature and it has bad
    ///  accuracy. Practically it is only useful as an indicator for
    ///  temperature changes.
    /// </summary>
    function GetChipTemperature: smallint; virtual;

    /// <summary>
    ///  Calling this function will reset the Bricklet. All configurations
    ///  will be lost.
    ///  
    ///  After a reset you have to create new device objects,
    ///  calling functions on the existing ones will Result in
    ///  undefined behavior!
    /// </summary>
    procedure Reset; virtual;

    /// <summary>
    ///  Writes a new UID into flash. If you want to set a new UID
    ///  you have to decode the Base58 encoded UID string into an
    ///  integer first.
    ///  
    ///  We recommend that you use Brick Viewer to change the UID.
    /// </summary>
    procedure WriteUID(const aUID: longword); virtual;

    /// <summary>
    ///  Returns the current UID as an integer. Encode as
    ///  Base58 to get the usual string version.
    /// </summary>
    function ReadUID: longword; virtual;

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
    ///  This callback is triggered whenever the switching state changes
    ///  from busy to ready, see <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.GetSwitchingState"/>.
    /// </summary>
    property OnSwitchingDone: TBrickletRemoteSwitchV2NotifySwitchingDone read fSwitchingDoneCallback write fSwitchingDoneCallback;

    /// <summary>
    ///  Returns the house code, receiver code, switch state (on/off) and number of repeats for
    ///  remote type A.
    ///  
    ///  The repeats are the number of received identical data packets. The longer the button is pressed,
    ///  the higher the repeat number. The callback is triggered with every repeat.
    ///  
    ///  You have to enable the callback with <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.SetRemoteConfiguration"/>. The number
    ///  of repeats that you can set in the configuration is the minimum number of repeats that have
    ///  to be seen before the callback is triggered for the first time.
    /// </summary>
    property OnRemoteStatusA: TBrickletRemoteSwitchV2NotifyRemoteStatusA read fRemoteStatusACallback write fRemoteStatusACallback;

    /// <summary>
    ///  Returns the address (unique per remote), unit (button number), switch state (on/off) and number of repeats for
    ///  remote type B.
    ///  
    ///  If the remote supports dimming the dim value is used instead of the switch state.
    ///  
    ///  The repeats are the number of received identical data packets. The longer the button is pressed,
    ///  the higher the repeat number. The callback is triggered with every repeat.
    ///  
    ///  You have to enable the callback with <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.SetRemoteConfiguration"/>. The number
    ///  of repeats that you can set in the configuration is the minimum number of repeats that have
    ///  to be seen before the callback is triggered for the first time.
    /// </summary>
    property OnRemoteStatusB: TBrickletRemoteSwitchV2NotifyRemoteStatusB read fRemoteStatusBCallback write fRemoteStatusBCallback;

    /// <summary>
    ///  Returns the system code, device code, switch state (on/off) and number of repeats for
    ///  remote type C.
    ///  
    ///  The repeats are the number of received identical data packets. The longer the button is pressed,
    ///  the higher the repeat number. The callback is triggered with every repeat.
    ///  
    ///  You have to enable the callback with <see cref="BrickletRemoteSwitchV2.TBrickletRemoteSwitchV2.SetRemoteConfiguration"/>. The number
    ///  of repeats that you can set in the configuration is the minimum number of repeats that have
    ///  to be seen before the callback is triggered for the first time.
    /// </summary>
    property OnRemoteStatusC: TBrickletRemoteSwitchV2NotifyRemoteStatusC read fRemoteStatusCCallback write fRemoteStatusCCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletRemoteSwitchV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletRemoteSwitchV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_SWITCHING_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SET_REPEATS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_REPEATS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SWITCH_SOCKET_A]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SWITCH_SOCKET_B]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_DIM_SOCKET_B]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SWITCH_SOCKET_C]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SET_REMOTE_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_REMOTE_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_REMOTE_STATUS_A]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_REMOTE_STATUS_B]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_REMOTE_STATUS_C]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletRemoteSwitchV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_REMOTE_SWITCH_V2_CALLBACK_SWITCHING_DONE]:= {$ifdef FPC}@{$endif}CallbackWrapperSwitchingDone;
  aCallBacks[BRICKLET_REMOTE_SWITCH_V2_CALLBACK_REMOTE_STATUS_A]:= {$ifdef FPC}@{$endif}CallbackWrapperRemoteStatusA;
  aCallBacks[BRICKLET_REMOTE_SWITCH_V2_CALLBACK_REMOTE_STATUS_B]:= {$ifdef FPC}@{$endif}CallbackWrapperRemoteStatusB;
  aCallBacks[BRICKLET_REMOTE_SWITCH_V2_CALLBACK_REMOTE_STATUS_C]:= {$ifdef FPC}@{$endif}CallbackWrapperRemoteStatusC;
end;

function TBrickletRemoteSwitchV2.GetSwitchingState: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_SWITCHING_STATE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRemoteSwitchV2.SetRepeats(const aRepeats: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SET_REPEATS, 9);
  LEConvertUInt8To(aRepeats, 8, _request);
  SendRequest(_request);
end;

function TBrickletRemoteSwitchV2.GetRepeats: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_REPEATS, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRemoteSwitchV2.SwitchSocketA(const aHouseCode: byte; const aReceiverCode: byte; const aSwitchTo: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SWITCH_SOCKET_A, 11);
  LEConvertUInt8To(aHouseCode, 8, _request);
  LEConvertUInt8To(aReceiverCode, 9, _request);
  LEConvertUInt8To(aSwitchTo, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletRemoteSwitchV2.SwitchSocketB(const aAddress: longword; const aUnit: byte; const aSwitchTo: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SWITCH_SOCKET_B, 14);
  LEConvertUInt32To(aAddress, 8, _request);
  LEConvertUInt8To(aUnit, 12, _request);
  LEConvertUInt8To(aSwitchTo, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletRemoteSwitchV2.DimSocketB(const aAddress: longword; const aUnit: byte; const aDimValue: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_DIM_SOCKET_B, 14);
  LEConvertUInt32To(aAddress, 8, _request);
  LEConvertUInt8To(aUnit, 12, _request);
  LEConvertUInt8To(aDimValue, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletRemoteSwitchV2.SwitchSocketC(const aSystemCode: char; const aDeviceCode: byte; const aSwitchTo: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SWITCH_SOCKET_C, 11);
  LEConvertCharTo(aSystemCode, 8, _request);
  LEConvertUInt8To(aDeviceCode, 9, _request);
  LEConvertUInt8To(aSwitchTo, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletRemoteSwitchV2.SetRemoteConfiguration(const aRemoteType: byte; const aMinimumRepeats: word; const aCallbackEnabled: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SET_REMOTE_CONFIGURATION, 12);
  LEConvertUInt8To(aRemoteType, 8, _request);
  LEConvertUInt16To(aMinimumRepeats, 9, _request);
  LEConvertBooleanTo(aCallbackEnabled, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletRemoteSwitchV2.GetRemoteConfiguration(out aRemoteType: byte; out aMinimumRepeats: word; out aCallbackEnabled: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_REMOTE_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aRemoteType:= LEConvertUInt8From(8, _response);
  aMinimumRepeats:= LEConvertUInt16From(9, _response);
  aCallbackEnabled:= LEConvertBooleanFrom(11, _response);
end;

procedure TBrickletRemoteSwitchV2.GetRemoteStatusA(out aHouseCode: byte; out aReceiverCode: byte; out aSwitchTo: byte; out aRepeats: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_REMOTE_STATUS_A, 8);
  _response:= SendRequest(_request);
  aHouseCode:= LEConvertUInt8From(8, _response);
  aReceiverCode:= LEConvertUInt8From(9, _response);
  aSwitchTo:= LEConvertUInt8From(10, _response);
  aRepeats:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletRemoteSwitchV2.GetRemoteStatusB(out aAddress: longword; out aUnit: byte; out aSwitchTo: byte; out aDimValue: byte; out aRepeats: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_REMOTE_STATUS_B, 8);
  _response:= SendRequest(_request);
  aAddress:= LEConvertUInt32From(8, _response);
  aUnit:= LEConvertUInt8From(12, _response);
  aSwitchTo:= LEConvertUInt8From(13, _response);
  aDimValue:= LEConvertUInt8From(14, _response);
  aRepeats:= LEConvertUInt16From(15, _response);
end;

procedure TBrickletRemoteSwitchV2.GetRemoteStatusC(out aSystemCode: char; out aDeviceCode: byte; out aSwitchTo: byte; out aRepeats: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_REMOTE_STATUS_C, 8);
  _response:= SendRequest(_request);
  aSystemCode:= LEConvertCharFrom(8, _response);
  aDeviceCode:= LEConvertUInt8From(9, _response);
  aSwitchTo:= LEConvertUInt8From(10, _response);
  aRepeats:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletRemoteSwitchV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletRemoteSwitchV2.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRemoteSwitchV2.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRemoteSwitchV2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletRemoteSwitchV2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRemoteSwitchV2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletRemoteSwitchV2.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRemoteSwitchV2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletRemoteSwitchV2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletRemoteSwitchV2.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletRemoteSwitchV2.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletRemoteSwitchV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletRemoteSwitchV2.CallbackWrapperSwitchingDone(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fSwitchingDoneCallback)) then begin
    fSwitchingDoneCallback(self);
  end;
end;

procedure TBrickletRemoteSwitchV2.CallbackWrapperRemoteStatusA(const aPacket: TDynamicByteArray);
var
  _houseCode: byte;
  _receiverCode: byte;
  _switchTo: byte;
  _repeats: word;
begin
  _houseCode:= LEConvertUInt8From(8, aPacket);
  _receiverCode:= LEConvertUInt8From(9, aPacket);
  _switchTo:= LEConvertUInt8From(10, aPacket);
  _repeats:= LEConvertUInt16From(11, aPacket);

  if (Assigned(fRemoteStatusACallback)) then begin
    fRemoteStatusACallback(self, _houseCode, _receiverCode, _switchTo, _repeats);
  end;
end;

procedure TBrickletRemoteSwitchV2.CallbackWrapperRemoteStatusB(const aPacket: TDynamicByteArray);
var
  _address: longword;
  _unit: byte;
  _switchTo: byte;
  _dimValue: byte;
  _repeats: word;
begin
  _address:= LEConvertUInt32From(8, aPacket);
  _unit:= LEConvertUInt8From(12, aPacket);
  _switchTo:= LEConvertUInt8From(13, aPacket);
  _dimValue:= LEConvertUInt8From(14, aPacket);
  _repeats:= LEConvertUInt16From(15, aPacket);

  if (Assigned(fRemoteStatusBCallback)) then begin
    fRemoteStatusBCallback(self, _address, _unit, _switchTo, _dimValue, _repeats);
  end;
end;

procedure TBrickletRemoteSwitchV2.CallbackWrapperRemoteStatusC(const aPacket: TDynamicByteArray);
var
  _systemCode: char;
  _deviceCode: byte;
  _switchTo: byte;
  _repeats: word;
begin
  _systemCode:= LEConvertCharFrom(8, aPacket);
  _deviceCode:= LEConvertUInt8From(9, aPacket);
  _switchTo:= LEConvertUInt8From(10, aPacket);
  _repeats:= LEConvertUInt16From(11, aPacket);

  if (Assigned(fRemoteStatusCCallback)) then begin
    fRemoteStatusCCallback(self, _systemCode, _deviceCode, _switchTo, _repeats);
  end;
end;

end.
