{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletDualButton;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletDualButton.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletDualButton = class;
  TBrickletDualButtonNotifyStateChanged = procedure(aSender: TBrickletDualButton; const aButtonL: byte; const aButtonR: byte;
                                                    const aLedL: byte; const aLedR: byte) of object;

  /// <summary>
  ///  Two tactile buttons with built-in blue LEDs
  /// </summary>
  TBrickletDualButton = class(TDevice)
  private
    fStateChangedCallback: TBrickletDualButtonNotifyStateChanged;
    procedure CallbackWrapperStateChanged(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the state of the LEDs. Possible states are:
    ///  
    ///  * 0 = AutoToggleOn: Enables auto toggle with initially enabled LED.
    ///  * 1 = AutoToggleOff: Activates auto toggle with initially disabled LED.
    ///  * 2 = On: Enables LED (auto toggle is disabled).
    ///  * 3 = Off: Disables LED (auto toggle is disabled).
    ///  
    ///  In auto toggle mode the LED is toggled automatically at each press of a button.
    ///  
    ///  If you just want to set one of the LEDs and don't know the current state
    ///  of the other LED, you can get the state with <see cref="BrickletDualButton.TBrickletDualButton.GetLEDState"/> or you
    ///  can use <see cref="BrickletDualButton.TBrickletDualButton.SetSelectedLEDState"/>.
    /// </summary>
    procedure SetLEDState(const aLedL: byte; const aLedR: byte); virtual;

    /// <summary>
    ///  Returns the current state of the LEDs, as set by <see cref="BrickletDualButton.TBrickletDualButton.SetLEDState"/>.
    /// </summary>
    procedure GetLEDState(out aLedL: byte; out aLedR: byte); virtual;

    /// <summary>
    ///  Returns the current state for both buttons. Possible states are:
    ///  
    ///  * 0 = pressed
    ///  * 1 = released
    /// </summary>
    procedure GetButtonState(out aButtonL: byte; out aButtonR: byte); virtual;

    /// <summary>
    ///  Sets the state of the selected LED (0 or 1).
    ///  
    ///  The other LED remains untouched.
    /// </summary>
    procedure SetSelectedLEDState(const aLed: byte; const aState: byte); virtual;

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
    ///  This callback is called whenever a button is pressed.
    ///  
    ///  Possible states for buttons are:
    ///  
    ///  * 0 = pressed
    ///  * 1 = released
    ///  
    ///  Possible states for LEDs are:
    ///  
    ///  * 0 = AutoToggleOn: Auto toggle enabled and LED on.
    ///  * 1 = AutoToggleOff: Auto toggle enabled and LED off.
    ///  * 2 = On: LED on (auto toggle is disabled).
    ///  * 3 = Off: LED off (auto toggle is disabled).
    /// </summary>
    property OnStateChanged: TBrickletDualButtonNotifyStateChanged read fStateChangedCallback write fStateChangedCallback;
  end;

implementation

procedure TBrickletDualButton.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletDualButton.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_DUAL_BUTTON_FUNCTION_SET_LED_STATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_FUNCTION_GET_LED_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_FUNCTION_GET_BUTTON_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_FUNCTION_SET_SELECTED_LED_STATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletDualButton.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_DUAL_BUTTON_CALLBACK_STATE_CHANGED]:= {$ifdef FPC}@{$endif}CallbackWrapperStateChanged;
end;

procedure TBrickletDualButton.SetLEDState(const aLedL: byte; const aLedR: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_FUNCTION_SET_LED_STATE, 10);
  LEConvertUInt8To(aLedL, 8, _request);
  LEConvertUInt8To(aLedR, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletDualButton.GetLEDState(out aLedL: byte; out aLedR: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_FUNCTION_GET_LED_STATE, 8);
  _response:= SendRequest(_request);
  aLedL:= LEConvertUInt8From(8, _response);
  aLedR:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletDualButton.GetButtonState(out aButtonL: byte; out aButtonR: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_FUNCTION_GET_BUTTON_STATE, 8);
  _response:= SendRequest(_request);
  aButtonL:= LEConvertUInt8From(8, _response);
  aButtonR:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletDualButton.SetSelectedLEDState(const aLed: byte; const aState: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_FUNCTION_SET_SELECTED_LED_STATE, 10);
  LEConvertUInt8To(aLed, 8, _request);
  LEConvertUInt8To(aState, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletDualButton.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletDualButton.CallbackWrapperStateChanged(const aPacket: TDynamicByteArray);
var
  _buttonL: byte; _buttonR: byte; _ledL: byte; _ledR: byte;
begin
  _buttonL:= LEConvertUInt8From(8, aPacket);
  _buttonR:= LEConvertUInt8From(9, aPacket);
  _ledL:= LEConvertUInt8From(10, aPacket);
  _ledR:= LEConvertUInt8From(11, aPacket);

  if (Assigned(fStateChangedCallback)) then begin
    fStateChangedCallback(self, _buttonL, _buttonR, _ledL, _ledR);
  end;
end;

end.
