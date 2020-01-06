program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletThermalImaging;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletThermalImaging;
  public
    procedure HighContrastImageCB(sender: TBrickletThermalImaging;
                                  const image: TArrayOfUInt8);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Thermal Imaging Bricklet }

var
  e: TExample;

{ Callback procedure for high contrast image callback }
procedure TExample.HighContrastImageCB(sender: TBrickletThermalImaging;
                                       const image: TArrayOfUInt8);
begin
  { image is an array of size 80*60 with a 8 bit grey value for each element }
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletThermalImaging.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register high contrast image callback to procedure HighContrastImageCB }
    oBricklet.OnHighContrastImage:= {$ifdef FPC}@{$endif}HighContrastImageCB;

    { Enable high contrast image transfer for callback }
    oBricklet.SetImageTransferConfig(BRICKLET_THERMAL_IMAGING_IMAGE_TRANSFER_CALLBACK_HIGH_CONTRAST_IMAGE);

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBricklet.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
