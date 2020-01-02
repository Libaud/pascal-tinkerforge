{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletTilt;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickletTilt.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletTilt = class;
  TBrickletTiltNotifyTiltState = procedure(aSender: TBrickletTilt; const aState: byte) of object;

  /// <summary>
  ///  Detects inclination of Bricklet (tilt switch open/closed)
  /// </summary>
  TBrickletTilt = class(TDevice)
  private
    fTiltStateCallback: TBrickletTiltNotifyTiltState;
    procedure CallbackWrapperTiltState(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the current tilt state. The state can either be
    ///  
    ///  * 0 = Closed: The ball in the tilt switch closes the circuit.
    ///  * 1 = Open: The ball in the tilt switch does not close the circuit.
    ///  * 2 = Closed Vibrating: The tilt switch is in motion (rapid change between open and close).
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_tilt_mechanics.jpg
    ///     :scale: 100 %
    ///     :alt: Tilt states
    ///     :align: center
    ///     :target: ../../_images/Bricklets/bricklet_tilt_mechanics.jpg
    /// </summary>
    function GetTiltState: byte; virtual;

    /// <summary>
    ///  Enables the <see cref="BrickletTilt.TBrickletTilt.OnTiltState"/> callback.
    /// </summary>
    procedure EnableTiltStateCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickletTilt.TBrickletTilt.OnTiltState"/> callback.
    /// </summary>
    procedure DisableTiltStateCallback; virtual;

    /// <summary>
    ///  Returns *true* if the <see cref="BrickletTilt.TBrickletTilt.OnTiltState"/> callback is enabled.
    /// </summary>
    function IsTiltStateCallbackEnabled: boolean; virtual;

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
    ///  This callback provides the current tilt state. It is called every time the
    ///  state changes.
    ///  
    ///  See <see cref="BrickletTilt.TBrickletTilt.GetTiltState"/> for a description of the states.
    /// </summary>
    property OnTiltState: TBrickletTiltNotifyTiltState read fTiltStateCallback write fTiltStateCallback;
  end;

implementation

procedure TBrickletTilt.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletTilt.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_TILT_FUNCTION_GET_TILT_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TILT_FUNCTION_ENABLE_TILT_STATE_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_TILT_FUNCTION_DISABLE_TILT_STATE_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_TILT_FUNCTION_IS_TILT_STATE_CALLBACK_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TILT_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletTilt.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_TILT_CALLBACK_TILT_STATE]:= {$ifdef FPC}@{$endif}CallbackWrapperTiltState;
end;

function TBrickletTilt.GetTiltState: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TILT_FUNCTION_GET_TILT_STATE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletTilt.EnableTiltStateCallback;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TILT_FUNCTION_ENABLE_TILT_STATE_CALLBACK, 8);
  SendRequest(_request);
end;

procedure TBrickletTilt.DisableTiltStateCallback;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TILT_FUNCTION_DISABLE_TILT_STATE_CALLBACK, 8);
  SendRequest(_request);
end;

function TBrickletTilt.IsTiltStateCallbackEnabled: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TILT_FUNCTION_IS_TILT_STATE_CALLBACK_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletTilt.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TILT_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletTilt.CallbackWrapperTiltState(const aPacket: TDynamicByteArray);
var
  _state: byte;
begin
  _state:= LEConvertUInt8From(8, aPacket);

  if (Assigned(fTiltStateCallback)) then begin
    fTiltStateCallback(self, _state);
  end;
end;

end.
