{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletMultiTouch;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletMultiTouch.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletMultiTouch = class;
  TBrickletMultiTouchNotifyTouchState = procedure(aSender: TBrickletMultiTouch; const aState: word) of object;

  /// <summary>
  ///  Capacitive touch sensor for 12 electrodes
  /// </summary>
  TBrickletMultiTouch = class(TDevice)
  private
    fTouchStateCallback: TBrickletMultiTouchNotifyTouchState;
    procedure CallbackWrapperTouchState(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the current touch state. The state is given as a bitfield.
    ///  
    ///  Bits 0 to 11 represent the 12 electrodes and bit 12 represents
    ///  the proximity.
    ///  
    ///  If an electrode is touched, the corresponding bit is *true*. If
    ///  a hand or similar is in proximity to the electrodes, bit 12 is
    ///  *true*.
    ///  
    ///  Example: The state 4103 = 0x1007 = 0b1000000000111 means that
    ///  electrodes 0, 1 and 2 are touched and that something is in the
    ///  proximity of the electrodes.
    ///  
    ///  The proximity is activated with a distance of 1-2cm. An electrode
    ///  is already counted as touched if a finger is nearly touching the
    ///  electrode. This means that you can put a piece of paper or foil
    ///  or similar on top of a electrode to build a touch panel with
    ///  a professional look.
    /// </summary>
    function GetTouchState: word; virtual;

    /// <summary>
    ///  Recalibrates the electrodes. Call this function whenever you changed
    ///  or moved you electrodes.
    /// </summary>
    procedure Recalibrate; virtual;

    /// <summary>
    ///  Enables/disables electrodes with a bitfield (see <see cref="BrickletMultiTouch.TBrickletMultiTouch.GetTouchState"/>).
    ///  
    ///  *True* enables the electrode, *false* disables the electrode. A
    ///  disabled electrode will always return *false* as its state. If you
    ///  don't need all electrodes you can disable the electrodes that are
    ///  not needed.
    ///  
    ///  It is recommended that you disable the proximity bit (bit 12) if
    ///  the proximity feature is not needed. This will reduce the amount of
    ///  traffic that is produced by the <see cref="BrickletMultiTouch.TBrickletMultiTouch.OnTouchState"/> callback.
    ///  
    ///  Disabling electrodes will also reduce power consumption.
    ///  
    ///  Default: 8191 = 0x1FFF = 0b1111111111111 (all electrodes enabled)
    /// </summary>
    procedure SetElectrodeConfig(const aEnabledElectrodes: word); virtual;

    /// <summary>
    ///  Returns the electrode configuration, as set by <see cref="BrickletMultiTouch.TBrickletMultiTouch.SetElectrodeConfig"/>.
    /// </summary>
    function GetElectrodeConfig: word; virtual;

    /// <summary>
    ///  Sets the sensitivity of the electrodes. An electrode with a high sensitivity
    ///  will register a touch earlier then an electrode with a low sensitivity.
    ///  
    ///  If you build a big electrode you might need to decrease the sensitivity, since
    ///  the area that can be charged will get bigger. If you want to be able to
    ///  activate an electrode from further away you need to increase the sensitivity.
    ///  
    ///  After a new sensitivity is set, you likely want to call <see cref="BrickletMultiTouch.TBrickletMultiTouch.Recalibrate"/>
    ///  to calibrate the electrodes with the newly defined sensitivity.
    /// </summary>
    procedure SetElectrodeSensitivity(const aSensitivity: byte); virtual;

    /// <summary>
    ///  Returns the current sensitivity, as set by <see cref="BrickletMultiTouch.TBrickletMultiTouch.SetElectrodeSensitivity"/>.
    /// </summary>
    function GetElectrodeSensitivity: byte; virtual;

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
                          out aFirmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  Returns the current touch state, see <see cref="BrickletMultiTouch.TBrickletMultiTouch.GetTouchState"/> for
    ///  information about the state.
    ///  
    ///  This callback is triggered every time the touch state changes.
    /// </summary>
    property OnTouchState: TBrickletMultiTouchNotifyTouchState read fTouchStateCallback write fTouchStateCallback;
  end;

implementation

procedure TBrickletMultiTouch.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletMultiTouch.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_GET_TOUCH_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_RECALIBRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_SET_ELECTRODE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_GET_ELECTRODE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_SET_ELECTRODE_SENSITIVITY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_GET_ELECTRODE_SENSITIVITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletMultiTouch.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_MULTI_TOUCH_CALLBACK_TOUCH_STATE]:= {$ifdef FPC}@{$endif}CallbackWrapperTouchState;
end;

function TBrickletMultiTouch.GetTouchState: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_GET_TOUCH_STATE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletMultiTouch.Recalibrate;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_RECALIBRATE, 8);
  SendRequest(_request);
end;

procedure TBrickletMultiTouch.SetElectrodeConfig(const aEnabledElectrodes: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_SET_ELECTRODE_CONFIG, 10);
  LEConvertUInt16To(aEnabledElectrodes, 8, _request);
  SendRequest(_request);
end;

function TBrickletMultiTouch.GetElectrodeConfig: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_GET_ELECTRODE_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletMultiTouch.SetElectrodeSensitivity(const aSensitivity: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_SET_ELECTRODE_SENSITIVITY, 9);
  LEConvertUInt8To(aSensitivity, 8, _request);
  SendRequest(_request);
end;

function TBrickletMultiTouch.GetElectrodeSensitivity: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_GET_ELECTRODE_SENSITIVITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMultiTouch.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletMultiTouch.CallbackWrapperTouchState(const aPacket: TDynamicByteArray);
var
  _State: word;
begin
  _State:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fTouchStateCallback)) then begin
    fTouchStateCallback(self, _State);
  end;
end;

end.
