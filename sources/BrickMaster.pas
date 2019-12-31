{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickMaster;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickMaster.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To31OfUInt8 = array [0..31] of byte;
  TArray0To3OfUInt8 = array [0..3] of byte;
  TArray0To59OfUInt8 = array [0..59] of byte;
  TArray0To5OfUInt8 = array [0..5] of byte;

  TBrickMaster = class;
  TBrickMasterNotifyStackCurrent = procedure(aSender: TBrickMaster; const current: word) of object;
  TBrickMasterNotifyStackVoltage = procedure(aSender: TBrickMaster; const voltage: word) of object;
  TBrickMasterNotifyUSBVoltage = procedure(aSender: TBrickMaster; const voltage: word) of object;
  TBrickMasterNotifyStackCurrentReached = procedure(aSender: TBrickMaster; const current: word) of object;
  TBrickMasterNotifyStackVoltageReached = procedure(aSender: TBrickMaster; const voltage: word) of object;
  TBrickMasterNotifyUSBVoltageReached = procedure(aSender: TBrickMaster; const voltage: word) of object;

  /// <summary>
  ///  Basis to build stacks and has 4 Bricklet ports
  /// </summary>
  TBrickMaster = class(TDevice)
  private
    fStackCurrentCallback: TBrickMasterNotifyStackCurrent;
    fStackVoltageCallback: TBrickMasterNotifyStackVoltage;
    fUSBVoltageCallback: TBrickMasterNotifyUSBVoltage;
    fStackCurrentReachedCallback: TBrickMasterNotifyStackCurrentReached;
    fStackVoltageReachedCallback: TBrickMasterNotifyStackVoltageReached;
    fUSBVoltageReachedCallback: TBrickMasterNotifyUSBVoltageReached;
  protected
    procedure CallbackWrapperStackCurrent(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperStackVoltage(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperUSBVoltage(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperStackCurrentReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperStackVoltageReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperUSBVoltageReached(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Returns the stack voltage in mV. The stack voltage is the
    ///  voltage that is supplied via the stack, i.e. it is given by a
    ///  Step-Down or Step-Up Power Supply.
    /// </summary>
    function GetStackVoltage: word; virtual;

    /// <summary>
    ///  Returns the stack current in mA. The stack current is the
    ///  current that is drawn via the stack, i.e. it is given by a
    ///  Step-Down or Step-Up Power Supply.
    /// </summary>
    function GetStackCurrent: word; virtual;

    /// <summary>
    ///  Writes the extension type to the EEPROM of a specified extension.
    ///  The extension is either 0 or 1 (0 is the on the bottom, 1 is the one on top,
    ///  if only one extension is present use 0).
    ///  
    ///  Possible extension types:
    ///  
    ///  <code>
    ///   "Type", "Description"
    ///  
    ///   "1",    "Chibi"
    ///   "2",    "RS485"
    ///   "3",    "WIFI"
    ///   "4",    "Ethernet"
    ///   "5",    "WIFI 2.0"
    ///  </code>
    ///  
    ///  The extension type is already set when bought and it can be set with the
    ///  Brick Viewer, it is unlikely that you need this function.
    /// </summary>
    procedure SetExtensionType(const extension: byte; const exttype: longword); virtual;

    /// <summary>
    ///  Returns the type for a given extension as set by <see cref="BrickMaster.TBrickMaster.SetExtensionType"/>.
    /// </summary>
    function GetExtensionType(const extension: byte): longword; virtual;

    /// <summary>
    ///  Returns *true* if the Master Brick is at position 0 in the stack and a Chibi
    ///  Extension is available.
    /// </summary>
    function IsChibiPresent: boolean; virtual;

    /// <summary>
    ///  Sets the address (1-255) belonging to the Chibi Extension.
    ///  
    ///  It is possible to set the address with the Brick Viewer and it will be
    ///  saved in the EEPROM of the Chibi Extension, it does not
    ///  have to be set on every startup.
    /// </summary>
    procedure SetChibiAddress(const address: byte); virtual;

    /// <summary>
    ///  Returns the address as set by <see cref="BrickMaster.TBrickMaster.SetChibiAddress"/>.
    /// </summary>
    function GetChibiAddress: byte; virtual;

    /// <summary>
    ///  Sets the address (1-255) of the Chibi Master. This address is used if the
    ///  Chibi Extension is used as slave (i.e. it does not have a USB connection).
    ///  
    ///  It is possible to set the address with the Brick Viewer and it will be
    ///  saved in the EEPROM of the Chibi Extension, it does not
    ///  have to be set on every startup.
    /// </summary>
    procedure SetChibiMasterAddress(const address: byte); virtual;

    /// <summary>
    ///  Returns the address as set by <see cref="BrickMaster.TBrickMaster.SetChibiMasterAddress"/>.
    /// </summary>
    function GetChibiMasterAddress: byte; virtual;

    /// <summary>
    ///  Sets up to 254 slave addresses. Valid addresses are in range 1-255. 0 has a
    ///  special meaning, it is used as list terminator and not allowed as normal slave
    ///  address. The address numeration (via num parameter) has to be used
    ///  ascending from 0. For example: If you use the Chibi Extension in Master mode
    ///  (i.e. the stack has an USB connection) and you want to talk to three other
    ///  Chibi stacks with the slave addresses 17, 23, and 42, you should call with
    ///  ``(0, 17)``, ``(1, 23)``, ``(2, 42)`` and ``(3, 0)``. The last call with
    ///  ``(3, 0)`` is a list terminator and indicates that the Chibi slave address
    ///  list contains 3 addresses in this case.
    ///  
    ///  It is possible to set the addresses with the Brick Viewer, that will take care
    ///  of correct address numeration and list termination.
    ///  
    ///  The slave addresses will be saved in the EEPROM of the Chibi Extension, they
    ///  don't have to be set on every startup.
    /// </summary>
    procedure SetChibiSlaveAddress(const num: byte; const address: byte); virtual;

    /// <summary>
    ///  Returns the slave address for a given num as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetChibiSlaveAddress"/>.
    /// </summary>
    function GetChibiSlaveAddress(const num: byte): byte; virtual;

    /// <summary>
    ///  Returns the signal strength in dBm. The signal strength updates every time a
    ///  aPacket is received.
    /// </summary>
    function GetChibiSignalStrength: byte; virtual;

    /// <summary>
    ///  Returns underrun, CRC error, no ACK and overflow error counts of the Chibi
    ///  communication. If these errors start rising, it is likely that either the
    ///  distance between two Chibi stacks is becoming too big or there are
    ///  interferences.
    /// </summary>
    procedure GetChibiErrorLog(out underrun: word; out crcError: word; out noAck: word; out overflow: word); virtual;

    /// <summary>
    ///  Sets the Chibi frequency range for the Chibi Extension. Possible values are:
    ///  
    ///  <code>
    ///   "Type", "Description"
    ///  
    ///   "0",    "OQPSK 868MHz (Europe)"
    ///   "1",    "OQPSK 915MHz (US)"
    ///   "2",    "OQPSK 780MHz (China)"
    ///   "3",    "BPSK40 915MHz"
    ///  </code>
    ///  
    ///  It is possible to set the frequency with the Brick Viewer and it will be
    ///  saved in the EEPROM of the Chibi Extension, it does not
    ///  have to be set on every startup.
    /// </summary>
    procedure SetChibiFrequency(const frequency: byte); virtual;

    /// <summary>
    ///  Returns the frequency value as set by <see cref="BrickMaster.TBrickMaster.SetChibiFrequency"/>.
    /// </summary>
    function GetChibiFrequency: byte; virtual;

    /// <summary>
    ///  Sets the channel used by the Chibi Extension. Possible channels are
    ///  different for different frequencies:
    ///  
    ///  <code>
    ///   "Frequency", "Possible Channels"
    ///  
    ///   "OQPSK 868MHz (Europe)", "0"
    ///   "OQPSK 915MHz (US)",     "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
    ///   "OQPSK 780MHz (China)",  "0, 1, 2, 3"
    ///   "BPSK40 915MHz",         "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
    ///  </code>
    ///  
    ///  It is possible to set the channel with the Brick Viewer and it will be
    ///  saved in the EEPROM of the Chibi Extension, it does not
    ///  have to be set on every startup.
    /// </summary>
    procedure SetChibiChannel(const channel: byte); virtual;

    /// <summary>
    ///  Returns the channel as set by <see cref="BrickMaster.TBrickMaster.SetChibiChannel"/>.
    /// </summary>
    function GetChibiChannel: byte; virtual;

    /// <summary>
    ///  Returns *true* if the Master Brick is at position 0 in the stack and a RS485
    ///  Extension is available.
    /// </summary>
    function IsRS485Present: boolean; virtual;

    /// <summary>
    ///  Sets the address (0-255) belonging to the RS485 Extension.
    ///  
    ///  Set to 0 if the RS485 Extension should be the RS485 Master (i.e.
    ///  connected to a PC via USB).
    ///  
    ///  It is possible to set the address with the Brick Viewer and it will be
    ///  saved in the EEPROM of the RS485 Extension, it does not
    ///  have to be set on every startup.
    /// </summary>
    procedure SetRS485Address(const address: byte); virtual;

    /// <summary>
    ///  Returns the address as set by <see cref="BrickMaster.TBrickMaster.SetRS485Address"/>.
    /// </summary>
    function GetRS485Address: byte; virtual;

    /// <summary>
    ///  Sets up to 255 slave addresses. Valid addresses are in range 1-255. 0 has a
    ///  special meaning, it is used as list terminator and not allowed as normal slave
    ///  address. The address numeration (via ``num`` parameter) has to be used
    ///  ascending from 0. For example: If you use the RS485 Extension in Master mode
    ///  (i.e. the stack has an USB connection) and you want to talk to three other
    ///  RS485 stacks with the addresses 17, 23, and 42, you should call with
    ///  ``(0, 17)``, ``(1, 23)``, ``(2, 42)`` and ``(3, 0)``. The last call with
    ///  ``(3, 0)`` is a list terminator and indicates that the RS485 slave address list
    ///  contains 3 addresses in this case.
    ///  
    ///  It is possible to set the addresses with the Brick Viewer, that will take care
    ///  of correct address numeration and list termination.
    ///  
    ///  The slave addresses will be saved in the EEPROM of the Chibi Extension, they
    ///  don't have to be set on every startup.
    /// </summary>
    procedure SetRS485SlaveAddress(const num: byte; const address: byte); virtual;

    /// <summary>
    ///  Returns the slave address for a given ``num`` as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetRS485SlaveAddress"/>.
    /// </summary>
    function GetRS485SlaveAddress(const num: byte): byte; virtual;

    /// <summary>
    ///  Returns CRC error counts of the RS485 communication.
    ///  If this counter starts rising, it is likely that the distance
    ///  between the RS485 nodes is too big or there is some kind of
    ///  interference.
    /// </summary>
    function GetRS485ErrorLog: word; virtual;

    /// <summary>
    ///  Sets the configuration of the RS485 Extension. Speed is given in baud. The
    ///  Master Brick will try to match the given baud rate as exactly as possible.
    ///  The maximum recommended baud rate is 2000000 (2Mbit/s).
    ///  Possible values for parity are 'n' (none), 'e' (even) and 'o' (odd).
    ///  Possible values for stop bits are 1 and 2.
    ///  
    ///  If your RS485 is unstable (lost messages etc.), the first thing you should
    ///  try is to decrease the speed. On very large bus (e.g. 1km), you probably
    ///  should use a value in the range of 100000 (100kbit/s).
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    /// </summary>
    procedure SetRS485Configuration(const speed: longword; const parity: char; const stopbits: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickMaster.TBrickMaster.SetRS485Configuration"/>.
    /// </summary>
    procedure GetRS485Configuration(out speed: longword; out parity: char; out stopbits: byte); virtual;

    /// <summary>
    ///  Returns *true* if the Master Brick is at position 0 in the stack and a WIFI
    ///  Extension is available.
    /// </summary>
    function IsWifiPresent: boolean; virtual;

    /// <summary>
    ///  Sets the configuration of the WIFI Extension. The ``ssid`` can have a max length
    ///  of 32 characters. Possible values for ``connection`` are:
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "0", "DHCP"
    ///   "1", "Static IP"
    ///   "2", "Access Point: DHCP"
    ///   "3", "Access Point: Static IP"
    ///   "4", "Ad Hoc: DHCP"
    ///   "5", "Ad Hoc: Static IP"
    ///  </code>
    ///  
    ///  If you set ``connection`` to one of the static IP options then you have to
    ///  supply ``ip``, ``subnet_mask`` and ``gateway`` as an array of size 4 (first
    ///  element of the array is the least significant byte of the address). If
    ///  ``connection`` is set to one of the DHCP options then ``ip``, ``subnet_mask``
    ///  and ``gateway`` are ignored, you can set them to 0.
    ///  
    ///  The last parameter is the port that your program will connect to. The
    ///  default port, that is used by brickd, is 4223.
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  It is recommended to use the Brick Viewer to set the WIFI configuration.
    /// </summary>
    procedure SetWifiConfiguration(const ssid: string; const connection: byte; const ip: array of byte; const subnetMask: array of byte;
                                   const gateway: array of byte; const aPort: word); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickMaster.TBrickMaster.SetWifiConfiguration"/>.
    /// </summary>
    procedure GetWifiConfiguration(out ssid: string; out connection: byte; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8;
                                   out gateway: TArray0To3OfUInt8; out port: word); virtual;

    /// <summary>
    ///  Sets the encryption of the WIFI Extension. The first parameter is the
    ///  type of the encryption. Possible values are:
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "0", "WPA/WPA2"
    ///   "1", "WPA Enterprise (EAP-FAST, EAP-TLS, EAP-TTLS, PEAP)"
    ///   "2", "WEP"
    ///   "3", "No Encryption"
    ///  </code>
    ///  
    ///  The ``key`` has a max length of 50 characters and is used if ``encryption``
    ///  is set to 0 or 2 (WPA/WPA2 or WEP). Otherwise the value is ignored.
    ///  
    ///  For WPA/WPA2 the key has to be at least 8 characters long. If you want to set
    ///  a key with more than 50 characters, see <see cref="BrickMaster.TBrickMaster.SetLongWifiKey"/>.
    ///  
    ///  For WEP the key has to be either 10 or 26 hexadecimal digits long. It is
    ///  possible to set the WEP ``key_index`` (1-4). If you don't know your
    ///  ``key_index``, it is likely 1.
    ///  
    ///  If you choose WPA Enterprise as encryption, you have to set ``eap_options`` and
    ///  the length of the certificates (for other encryption types these parameters
    ///  are ignored). The certificate length are given in byte and the certificates
    ///  themselves can be set with <see cref="BrickMaster.TBrickMaster.SetWifiCertificate"/>. ``eap_options`` consist
    ///  of the outer authentication (bits 1-2), inner authentication (bit 3) and
    ///  certificate type (bits 4-5):
    ///  
    ///  <code>
    ///   "Option", "Bits", "Description"
    ///  
    ///   "outer authentication", "1-2", "0=EAP-FAST, 1=EAP-TLS, 2=EAP-TTLS, 3=EAP-PEAP"
    ///   "inner authentication", "3", "0=EAP-MSCHAP, 1=EAP-GTC"
    ///   "certificate type", "4-5", "0=CA Certificate, 1=Client Certificate, 2=Private Key"
    ///  </code>
    ///  
    ///  Example for EAP-TTLS + EAP-GTC + Private Key: ``option = 2 | (1 &lt;&lt; 2) | (2 &lt;&lt; 3)``.
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  It is recommended to use the Brick Viewer to set the Wi-Fi encryption.
    /// </summary>
    procedure SetWifiEncryption(const encryption: byte; const key: string; const keyIndex: byte; const eapOptions: byte; const caCertificateLength: word; const clientCertificateLength: word; const privateKeyLength: word); virtual;

    /// <summary>
    ///  Returns the encryption as set by <see cref="BrickMaster.TBrickMaster.SetWifiEncryption"/>.
    ///  
    ///  <note>
    ///   Since Master Brick Firmware version 2.4.4 the key is not returned anymore.
    ///  </note>
    /// </summary>
    procedure GetWifiEncryption(out encryption: byte; out key: string; out keyIndex: byte; out eapOptions: byte; out caCertificateLength: word; out clientCertificateLength: word; out privateKeyLength: word); virtual;

    /// <summary>
    ///  Returns the status of the WIFI Extension. The ``state`` is updated automatically,
    ///  all of the other parameters are updated on startup and every time
    ///  <see cref="BrickMaster.TBrickMaster.RefreshWifiStatus"/> is called.
    ///  
    ///  Possible states are:
    ///  
    ///  <code>
    ///   "State", "Description"
    ///  
    ///   "0", "Disassociated"
    ///   "1", "Associated"
    ///   "2", "Associating"
    ///   "3", "Error"
    ///   "255", "Not initialized yet"
    ///  </code>
    /// </summary>
    procedure GetWifiStatus(out macAddress: TArray0To5OfUInt8; out bssid: TArray0To5OfUInt8; out channel: byte; out rssi: smallint; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out rxCount: longword; out txCount: longword; out state: byte); virtual;

    /// <summary>
    ///  Refreshes the Wi-Fi status (see <see cref="BrickMaster.TBrickMaster.GetWifiStatus"/>). To read the status
    ///  of the Wi-Fi module, the Master Brick has to change from data mode to
    ///  command mode and back. This transaction and the readout itself is
    ///  unfortunately time consuming. This means, that it might take some ms
    ///  until the stack with attached WIFI Extension reacts again after this
    ///  function is called.
    /// </summary>
    procedure RefreshWifiStatus; virtual;

    /// <summary>
    ///  This function is used to set the certificate as well as password and username
    ///  for WPA Enterprise. To set the username use index 0xFFFF,
    ///  to set the password use index 0xFFFE. The max length of username and
    ///  password is 32.
    ///  
    ///  The certificate is written in chunks of size 32 and the index is used as
    ///  the index of the chunk. ``data_length`` should nearly always be 32. Only
    ///  the last chunk can have a length that is not equal to 32.
    ///  
    ///  The starting index of the CA Certificate is 0, of the Client Certificate
    ///  10000 and for the Private Key 20000. Maximum sizes are 1312, 1312 and
    ///  4320 byte respectively.
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after uploading the certificate.
    ///  
    ///  It is recommended to use the Brick Viewer to set the certificate, username
    ///  and password.
    /// </summary>
    procedure SetWifiCertificate(const index: word; const data: array of byte; const dataLength: byte); virtual;

    /// <summary>
    ///  Returns the certificate for a given index as set by <see cref="BrickMaster.TBrickMaster.SetWifiCertificate"/>.
    /// </summary>
    procedure GetWifiCertificate(const index: word; out data: TArray0To31OfUInt8; out dataLength: byte); virtual;

    /// <summary>
    ///  Sets the power mode of the WIFI Extension. Possible modes are:
    ///  
    ///  <code>
    ///   "Mode", "Description"
    ///  
    ///   "0", "Full Speed (high power consumption, high throughput)"
    ///   "1", "Low Power (low power consumption, low throughput)"
    ///  </code>
    ///  
    ///  The default value is 0 (Full Speed).
    /// </summary>
    procedure SetWifiPowerMode(const aMode: byte); virtual;

    /// <summary>
    ///  Returns the power mode as set by <see cref="BrickMaster.TBrickMaster.SetWifiPowerMode"/>.
    /// </summary>
    function GetWifiPowerMode: byte; virtual;

    /// <summary>
    ///  Returns informations about the Wi-Fi receive buffer. The Wi-Fi
    ///  receive buffer has a max size of 1500 byte and if data is transfered
    ///  too fast, it might overflow.
    ///  
    ///  The return values are the number of overflows, the low watermark
    ///  (i.e. the smallest number of bytes that were free in the buffer) and
    ///  the bytes that are currently used.
    ///  
    ///  You should always try to keep the buffer empty, otherwise you will
    ///  have a permanent latency. A good rule of thumb is, that you can transfer
    ///  1000 messages per second without problems.
    ///  
    ///  Try to not send more then 50 messages at a time without any kind of
    ///  break between them.
    /// </summary>
    procedure GetWifiBufferInfo(out overflow: longword; out lowWatermark: word; out used: word); virtual;

    /// <summary>
    ///  Sets the regulatory domain of the WIFI Extension. Possible domains are:
    ///  
    ///  <code>
    ///   "Domain", "Description"
    ///  
    ///   "0", "FCC: Channel 1-11 (N/S America, Australia, New Zealand)"
    ///   "1", "ETSI: Channel 1-13 (Europe, Middle East, Africa)"
    ///   "2", "TELEC: Channel 1-14 (Japan)"
    ///  </code>
    ///  
    ///  The default value is 1 (ETSI).
    /// </summary>
    procedure SetWifiRegulatoryDomain(const domain: byte); virtual;

    /// <summary>
    ///  Returns the regulatory domain as set by <see cref="BrickMaster.TBrickMaster.SetWifiRegulatoryDomain"/>.
    /// </summary>
    function GetWifiRegulatoryDomain: byte; virtual;

    /// <summary>
    ///  Returns the USB voltage in mV. Does not work with hardware version 2.1.
    /// </summary>
    function GetUSBVoltage: word; virtual;

    /// <summary>
    ///  Sets a long Wi-Fi key (up to 63 chars, at least 8 chars) for WPA encryption.
    ///  This key will be used
    ///  if the key in <see cref="BrickMaster.TBrickMaster.SetWifiEncryption"/> is set to "-". In the old protocol,
    ///  a payload of size 63 was not possible, so the maximum key length was 50 chars.
    ///  
    ///  With the new protocol this is possible, since we didn't want to break API,
    ///  this function was added additionally.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Firmware)
    /// </summary>
    procedure SetLongWifiKey(const key: string); virtual;

    /// <summary>
    ///  Returns the encryption key as set by <see cref="BrickMaster.TBrickMaster.SetLongWifiKey"/>.
    ///  
    ///  <note>
    ///   Since Master Brick firmware version 2.4.4 the key is not returned anymore.
    ///  </note>
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Firmware)
    /// </summary>
    function GetLongWifiKey: string; virtual;

    /// <summary>
    ///  Sets the hostname of the WIFI Extension. The hostname will be displayed
    ///  by access points as the hostname in the DHCP clients table.
    ///  
    ///  Setting an empty String will restore the default hostname.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure SetWifiHostname(const hostname: string); virtual;

    /// <summary>
    ///  Returns the hostname as set by <see cref="BrickMaster.TBrickMaster.SetWifiHostname"/>.
    ///  
    ///  An empty String means, that the default hostname is used.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    function GetWifiHostname: string; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickMaster.TBrickMaster.OnStackCurrent"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickMaster.TBrickMaster.OnStackCurrent"/> callback is only triggered if the current has changed
    ///  since the last triggering.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure SetStackCurrentCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickMaster.TBrickMaster.SetStackCurrentCallbackPeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    function GetStackCurrentCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickMaster.TBrickMaster.OnStackVoltage"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickMaster.TBrickMaster.OnStackVoltage"/> callback is only triggered if the voltage has changed
    ///  since the last triggering.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure SetStackVoltageCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickMaster.TBrickMaster.SetStackVoltageCallbackPeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    function GetStackVoltageCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickMaster.TBrickMaster.OnUSBVoltage"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickMaster.TBrickMaster.OnUSBVoltage"/> callback is only triggered if the voltage has changed
    ///  since the last triggering.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure SetUSBVoltageCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickMaster.TBrickMaster.SetUSBVoltageCallbackPeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    function GetUSBVoltageCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickMaster.TBrickMaster.OnStackCurrentReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the current is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the current is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the current is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the current is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure SetStackCurrentCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickMaster.TBrickMaster.SetStackCurrentCallbackThreshold"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure GetStackCurrentCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickMaster.TBrickMaster.OnStackVoltageReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the voltage is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the voltage is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the voltage is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the voltage is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure SetStackVoltageCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickMaster.TBrickMaster.SetStackVoltageCallbackThreshold"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure GetStackVoltageCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickMaster.TBrickMaster.OnUSBVoltageReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the voltage is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the voltage is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the voltage is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the voltage is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure SetUSBVoltageCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickMaster.TBrickMaster.SetUSBVoltageCallbackThreshold"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure GetUSBVoltageCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickMaster.TBrickMaster.OnStackCurrentReached"/>,
    ///  * <see cref="BrickMaster.TBrickMaster.OnStackVoltageReached"/>,
    ///  * <see cref="BrickMaster.TBrickMaster.OnUSBVoltageReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickMaster.TBrickMaster.SetStackCurrentCallbackThreshold"/>,
    ///  * <see cref="BrickMaster.TBrickMaster.SetStackVoltageCallbackThreshold"/>,
    ///  * <see cref="BrickMaster.TBrickMaster.SetUSBVoltageCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickMaster.TBrickMaster.SetDebouncePeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Returns *true* if the Master Brick is at position 0 in the stack and an Ethernet
    ///  Extension is available.
    ///  
    ///  .. versionadded:: 2.1.0$nbsp;(Firmware)
    /// </summary>
    function IsEthernetPresent: boolean; virtual;

    /// <summary>
    ///  Sets the configuration of the Ethernet Extension. Possible values for
    ///  ``connection`` are:
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "0", "DHCP"
    ///   "1", "Static IP"
    ///  </code>
    ///  
    ///  If you set ``connection`` to static IP options then you have to supply ``ip``,
    ///  ``subnet_mask`` and ``gateway`` as an array of size 4 (first element of the
    ///  array is the least significant byte of the address). If ``connection`` is set
    ///  to the DHCP options then ``ip``, ``subnet_mask`` and ``gateway`` are ignored,
    ///  you can set them to 0.
    ///  
    ///  The last parameter is the port that your program will connect to. The
    ///  default port, that is used by brickd, is 4223.
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  It is recommended to use the Brick Viewer to set the Ethernet configuration.
    ///  
    ///  .. versionadded:: 2.1.0$nbsp;(Firmware)
    /// </summary>
    procedure SetEthernetConfiguration(const connection: byte; const ip: array of byte; const subnetMask: array of byte; const gateway: array of byte; const aPort: word); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickMaster.TBrickMaster.SetEthernetConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.1.0$nbsp;(Firmware)
    /// </summary>
    procedure GetEthernetConfiguration(out connection: byte; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out port: word); virtual;

    /// <summary>
    ///  Returns the status of the Ethernet Extension.
    ///  
    ///  ``mac_address``, ``ip``, ``subnet_mask`` and ``gateway`` are given as an array.
    ///  The first element of the array is the least significant byte of the address.
    ///  
    ///  ``rx_count`` and ``tx_count`` are the number of bytes that have been
    ///  received/send since last restart.
    ///  
    ///  ``hostname`` is the currently used hostname.
    ///  
    ///  .. versionadded:: 2.1.0$nbsp;(Firmware)
    /// </summary>
    procedure GetEthernetStatus(out macAddress: TArray0To5OfUInt8; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out rxCount: longword; out txCount: longword; out hostname: string); virtual;

    /// <summary>
    ///  Sets the hostname of the Ethernet Extension. The hostname will be displayed
    ///  by access points as the hostname in the DHCP clients table.
    ///  
    ///  Setting an empty String will restore the default hostname.
    ///  
    ///  The current hostname can be discovered with <see cref="BrickMaster.TBrickMaster.GetEthernetStatus"/>.
    ///  
    ///  .. versionadded:: 2.1.0$nbsp;(Firmware)
    /// </summary>
    procedure SetEthernetHostname(const hostname: string); virtual;

    /// <summary>
    ///  Sets the MAC address of the Ethernet Extension. The Ethernet Extension should
    ///  come configured with a valid MAC address, that is also written on a
    ///  sticker of the extension itself.
    ///  
    ///  The MAC address can be read out again with <see cref="BrickMaster.TBrickMaster.GetEthernetStatus"/>.
    ///  
    ///  .. versionadded:: 2.1.0$nbsp;(Firmware)
    /// </summary>
    procedure SetEthernetMACAddress(const macAddress: array of byte); virtual;

    /// <summary>
    ///  Sets the Ethernet WebSocket configuration. The first parameter sets the number of socket
    ///  connections that are reserved for WebSockets. The range is 0-7. The connections
    ///  are shared with the plain sockets. Example: If you set the connections to 3,
    ///  there will be 3 WebSocket and 4 plain socket connections available.
    ///  
    ///  The second parameter is the port for the WebSocket connections. The port can
    ///  not be the same as the port for the plain socket connections.
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  It is recommended to use the Brick Viewer to set the Ethernet configuration.
    ///  
    ///  The default values are 3 for the socket connections and 4280 for the port.
    ///  
    ///  .. versionadded:: 2.2.0$nbsp;(Firmware)
    /// </summary>
    procedure SetEthernetWebsocketConfiguration(const sockets: byte; const aPort: word); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickMaster.TBrickMaster.SetEthernetConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.2.0$nbsp;(Firmware)
    /// </summary>
    procedure GetEthernetWebsocketConfiguration(out sockets: byte; out port: word); virtual;

    /// <summary>
    ///  Sets the Ethernet authentication secret. The secret can be a string of up to 64
    ///  characters. An empty string disables the authentication.
    ///  
    ///  See the :ref:`authentication tutorial &lt;tutorial_authentication&gt;` for more
    ///  information.
    ///  
    ///  The secret is stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  It is recommended to use the Brick Viewer to set the Ethernet authentication secret.
    ///  
    ///  The default value is an empty string (authentication disabled).
    ///  
    ///  .. versionadded:: 2.2.0$nbsp;(Firmware)
    /// </summary>
    procedure SetEthernetAuthenticationSecret(const secret: string); virtual;

    /// <summary>
    ///  Returns the authentication secret as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetEthernetAuthenticationSecret"/>.
    ///  
    ///  .. versionadded:: 2.2.0$nbsp;(Firmware)
    /// </summary>
    function GetEthernetAuthenticationSecret: string; virtual;

    /// <summary>
    ///  Sets the WIFI authentication secret. The secret can be a string of up to 64
    ///  characters. An empty string disables the authentication.
    ///  
    ///  See the :ref:`authentication tutorial &lt;tutorial_authentication&gt;` for more
    ///  information.
    ///  
    ///  The secret is stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  It is recommended to use the Brick Viewer to set the WIFI authentication secret.
    ///  
    ///  The default value is an empty string (authentication disabled).
    ///  
    ///  .. versionadded:: 2.2.0$nbsp;(Firmware)
    /// </summary>
    procedure SetWifiAuthenticationSecret(const secret: string); virtual;

    /// <summary>
    ///  Returns the authentication secret as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetWifiAuthenticationSecret"/>.
    ///  
    ///  .. versionadded:: 2.2.0$nbsp;(Firmware)
    /// </summary>
    function GetWifiAuthenticationSecret: string; virtual;

    /// <summary>
    ///  Returns the type of the connection over which this function was called.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    function GetConnectionType: byte; virtual;

    /// <summary>
    ///  Returns *true* if the Master Brick is at position 0 in the stack and a WIFI
    ///  Extension 2.0 is available.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    function IsWifi2Present: boolean; virtual;

    /// <summary>
    ///  Starts the bootloader of the WIFI Extension 2.0. Returns 0 on success.
    ///  Afterwards the <see cref="BrickMaster.TBrickMaster.WriteWifi2SerialPort"/> and <see cref="BrickMaster.TBrickMaster.ReadWifi2SerialPort"/>
    ///  functions can be used to communicate with the bootloader to flash a new
    ///  firmware.
    ///  
    ///  The bootloader should only be started over a USB connection. It cannot be
    ///  started over a WIFI2 connection, see the <see cref="BrickMaster.TBrickMaster.GetConnectionType"/> function.
    ///  
    ///  It is recommended to use the Brick Viewer to update the firmware of the WIFI
    ///  Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    function StartWifi2Bootloader: shortint; virtual;

    /// <summary>
    ///  Writes up to 60 bytes (number of bytes to be written specified by ``length``)
    ///  to the serial port of the bootloader of the WIFI Extension 2.0. Returns 0 on
    ///  success.
    ///  
    ///  Before this function can be used the bootloader has to be started using the
    ///  <see cref="BrickMaster.TBrickMaster.StartWifi2Bootloader"/> function.
    ///  
    ///  It is recommended to use the Brick Viewer to update the firmware of the WIFI
    ///  Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    function WriteWifi2SerialPort(const data: array of byte; const length_: byte): shortint; virtual;

    /// <summary>
    ///  Reads up to 60 bytes (number of bytes to be read specified by ``length``)
    ///  from the serial port of the bootloader of the WIFI Extension 2.0.
    ///  Returns the number of actually read bytes.
    ///  
    ///  Before this function can be used the bootloader has to be started using the
    ///  <see cref="BrickMaster.TBrickMaster.StartWifi2Bootloader"/> function.
    ///  
    ///  It is recommended to use the Brick Viewer to update the firmware of the WIFI
    ///  Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure ReadWifi2SerialPort(const length_: byte; out data: TArray0To59OfUInt8; out Result: byte); virtual;

    /// <summary>
    ///  Sets the WIFI authentication secret. The secret can be a string of up to 64
    ///  characters. An empty string disables the authentication. The default value is
    ///  an empty string (authentication disabled).
    ///  
    ///  See the :ref:`authentication tutorial &lt;tutorial_authentication&gt;` for more
    ///  information.
    ///  
    ///  To apply configuration changes to the WIFI Extension 2.0 the
    ///  <see cref="BrickMaster.TBrickMaster.SaveWifi2Configuration"/> function has to be called and the Master Brick
    ///  has to be restarted afterwards.
    ///  
    ///  It is recommended to use the Brick Viewer to configure the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure SetWifi2AuthenticationSecret(const secret: string); virtual;

    /// <summary>
    ///  Returns the WIFI authentication secret as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetWifi2AuthenticationSecret"/>.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    function GetWifi2AuthenticationSecret: string; virtual;

    /// <summary>
    ///  Sets the general configuration of the WIFI Extension 2.0.
    ///  
    ///  The ``port`` parameter sets the port number that your programm will connect
    ///  to. The default value is 4223.
    ///  
    ///  The ``websocket_port`` parameter sets the WebSocket port number that your
    ///  JavaScript programm will connect to. The default value is 4280.
    ///  
    ///  The ``website_port`` parameter sets the port number for the website of the
    ///  WIFI Extension 2.0. The default value is 80.
    ///  
    ///  The ``phy_mode`` parameter sets the specific wireless network mode to be used.
    ///  Possible values are B, G and N. The default value is G.
    ///  
    ///  The ``sleep_mode`` parameter is currently unused.
    ///  
    ///  The ``website`` parameter is used to enable or disable the web interface of
    ///  the WIFI Extension 2.0, which is available from firmware version 2.0.1. Note
    ///  that, for firmware version 2.0.3 and older, to disable the the web interface
    ///  the ``website_port`` parameter must be set to 1 and greater than 1 to enable
    ///  the web interface. For firmware version 2.0.4 and later, setting this parameter
    ///  to 1 will enable the web interface and setting it to 0 will disable the web
    ///  interface.
    ///  
    ///  To apply configuration changes to the WIFI Extension 2.0 the
    ///  <see cref="BrickMaster.TBrickMaster.SaveWifi2Configuration"/> function has to be called and the Master Brick
    ///  has to be restarted afterwards.
    ///  
    ///  It is recommended to use the Brick Viewer to configure the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure SetWifi2Configuration(const aPort: word; const websocketPort: word; const websitePort: word; const phyMode: byte; const sleepMode: byte; const website: byte); virtual;

    /// <summary>
    ///  Returns the general configuration as set by <see cref="BrickMaster.TBrickMaster.SetWifi2Configuration"/>.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure GetWifi2Configuration(out port: word; out websocketPort: word; out websitePort: word; out phyMode: byte; out sleepMode: byte; out website: byte); virtual;

    /// <summary>
    ///  Returns the client and access point status of the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure GetWifi2Status(out clientEnabled: boolean; out clientStatus: byte; out clientIP: TArray0To3OfUInt8; out clientSubnetMask: TArray0To3OfUInt8; out clientGateway: TArray0To3OfUInt8; out clientMACAddress: TArray0To5OfUInt8; out clientRXCount: longword; out clientTXCount: longword; out clientRSSI: shortint; out apEnabled: boolean; out apIP: TArray0To3OfUInt8; out apSubnetMask: TArray0To3OfUInt8; out apGateway: TArray0To3OfUInt8; out apMACAddress: TArray0To5OfUInt8; out apRXCount: longword; out apTXCount: longword; out apConnectedCount: byte); virtual;

    /// <summary>
    ///  Sets the client specific configuration of the WIFI Extension 2.0.
    ///  
    ///  The ``enable`` parameter enables or disables the client part of the
    ///  WIFI Extension 2.0. The default value is *true*.
    ///  
    ///  The ``ssid`` parameter sets the SSID (up to 32 characters) of the access point
    ///  to connect to.
    ///  
    ///  If the ``ip`` parameter is set to all zero then ``subnet_mask`` and ``gateway``
    ///  parameters are also set to all zero and DHCP is used for IP address configuration.
    ///  Otherwise those three parameters can be used to configure a static IP address.
    ///  The default configuration is DHCP.
    ///  
    ///  If the ``mac_address`` parameter is set to all zero then the factory MAC
    ///  address is used. Otherwise this parameter can be used to set a custom MAC
    ///  address.
    ///  
    ///  If the ``bssid`` parameter is set to all zero then WIFI Extension 2.0 will
    ///  connect to any access point that matches the configured SSID. Otherwise this
    ///  parameter can be used to make the WIFI Extension 2.0 only connect to an
    ///  access point if SSID and BSSID match.
    ///  
    ///  To apply configuration changes to the WIFI Extension 2.0 the
    ///  <see cref="BrickMaster.TBrickMaster.SaveWifi2Configuration"/> function has to be called and the Master Brick
    ///  has to be restarted afterwards.
    ///  
    ///  It is recommended to use the Brick Viewer to configure the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure SetWifi2ClientConfiguration(const enable: boolean; const ssid: string; const ip: array of byte; const subnetMask: array of byte; const gateway: array of byte; const macAddress: array of byte; const bssid: array of byte); virtual;

    /// <summary>
    ///  Returns the client configuration as set by <see cref="BrickMaster.TBrickMaster.SetWifi2ClientConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure GetWifi2ClientConfiguration(out enable: boolean; out ssid: string; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out macAddress: TArray0To5OfUInt8; out bssid: TArray0To5OfUInt8); virtual;

    /// <summary>
    ///  Sets the client hostname (up to 32 characters) of the WIFI Extension 2.0. The
    ///  hostname will be displayed by access points as the hostname in the DHCP clients
    ///  table.
    ///  
    ///  To apply configuration changes to the WIFI Extension 2.0 the
    ///  <see cref="BrickMaster.TBrickMaster.SaveWifi2Configuration"/> function has to be called and the Master Brick
    ///  has to be restarted afterwards.
    ///  
    ///  It is recommended to use the Brick Viewer to configure the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure SetWifi2ClientHostname(const hostname: string); virtual;

    /// <summary>
    ///  Returns the client hostname as set by <see cref="BrickMaster.TBrickMaster.SetWifi2ClientHostname"/>.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    function GetWifi2ClientHostname: string; virtual;

    /// <summary>
    ///  Sets the client password (up to 63 chars) for WPA/WPA2 encryption.
    ///  
    ///  To apply configuration changes to the WIFI Extension 2.0 the
    ///  <see cref="BrickMaster.TBrickMaster.SaveWifi2Configuration"/> function has to be called and the Master Brick
    ///  has to be restarted afterwards.
    ///  
    ///  It is recommended to use the Brick Viewer to configure the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure SetWifi2ClientPassword(const password: string); virtual;

    /// <summary>
    ///  Returns the client password as set by <see cref="BrickMaster.TBrickMaster.SetWifi2ClientPassword"/>.
    ///  
    ///  <note>
    ///   Since WIFI Extension 2.0 firmware version 2.1.3 the password is not
    ///   returned anymore.
    ///  </note>
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    function GetWifi2ClientPassword: string; virtual;

    /// <summary>
    ///  Sets the access point specific configuration of the WIFI Extension 2.0.
    ///  
    ///  The ``enable`` parameter enables or disables the access point part of the
    ///  WIFI Extension 2.0. The default value is true.
    ///  
    ///  The ``ssid`` parameter sets the SSID (up to 32 characters) of the access point.
    ///  
    ///  If the ``ip`` parameter is set to all zero then ``subnet_mask`` and ``gateway``
    ///  parameters are also set to all zero and DHCP is used for IP address configuration.
    ///  Otherwise those three parameters can be used to configure a static IP address.
    ///  The default configuration is DHCP.
    ///  
    ///  The ``encryption`` parameter sets the encryption mode to be used. Possible
    ///  values are Open (no encryption), WEP or WPA/WPA2 PSK. The default value is
    ///  WPA/WPA2 PSK. Use the <see cref="BrickMaster.TBrickMaster.SetWifi2APPassword"/> function to set the encryption
    ///  password.
    ///  
    ///  The ``hidden`` parameter makes the access point hide or show its SSID.
    ///  The default value is *false*.
    ///  
    ///  The ``channel`` parameter sets the channel (1 to 13) of the access point.
    ///  The default value is 1.
    ///  
    ///  If the ``mac_address`` parameter is set to all zero then the factory MAC
    ///  address is used. Otherwise this parameter can be used to set a custom MAC
    ///  address.
    ///  
    ///  To apply configuration changes to the WIFI Extension 2.0 the
    ///  <see cref="BrickMaster.TBrickMaster.SaveWifi2Configuration"/> function has to be called and the Master Brick
    ///  has to be restarted afterwards.
    ///  
    ///  It is recommended to use the Brick Viewer to configure the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure SetWifi2APConfiguration(const enable: boolean; const ssid: string; const ip: array of byte; const subnetMask: array of byte; const gateway: array of byte; const encryption: byte; const hidden: boolean; const channel: byte; const macAddress: array of byte); virtual;

    /// <summary>
    ///  Returns the access point configuration as set by <see cref="BrickMaster.TBrickMaster.SetWifi2APConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure GetWifi2APConfiguration(out enable: boolean; out ssid: string; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out encryption: byte; out hidden: boolean; out channel: byte; out macAddress: TArray0To5OfUInt8); virtual;

    /// <summary>
    ///  Sets the access point password (at least 8 and up to 63 chars) for the configured encryption
    ///  mode, see <see cref="BrickMaster.TBrickMaster.SetWifi2APConfiguration"/>.
    ///  
    ///  To apply configuration changes to the WIFI Extension 2.0 the
    ///  <see cref="BrickMaster.TBrickMaster.SaveWifi2Configuration"/> function has to be called and the Master Brick
    ///  has to be restarted afterwards.
    ///  
    ///  It is recommended to use the Brick Viewer to configure the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure SetWifi2APPassword(const aPassword: string); virtual;

    /// <summary>
    ///  Returns the access point password as set by <see cref="BrickMaster.TBrickMaster.SetWifi2APPassword"/>.
    ///  
    ///  <note>
    ///   Since WIFI Extension 2.0 firmware version 2.1.3 the password is not
    ///   returned anymore.
    ///  </note>
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    function GetWifi2APPassword: string; virtual;

    /// <summary>
    ///  All configuration functions for the WIFI Extension 2.0 do not change the
    ///  values permanently. After configuration this function has to be called to
    ///  permanently store the values.
    ///  
    ///  The values are stored in the EEPROM and only applied on startup. That means
    ///  you have to restart the Master Brick after configuration.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    function SaveWifi2Configuration: byte; virtual;

    /// <summary>
    ///  Returns the current version of the WIFI Extension 2.0 firmware (major, minor, revision).
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    function GetWifi2FirmwareVersion: TArray0To2OfUInt8; virtual;

    /// <summary>
    ///  Turns the green status LED of the WIFI Extension 2.0 on.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure EnableWifi2StatusLED; virtual;

    /// <summary>
    ///  Turns the green status LED of the WIFI Extension 2.0 off.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    procedure DisableWifi2StatusLED; virtual;

    /// <summary>
    ///  Returns *true* if the green status LED of the WIFI Extension 2.0 is turned on.
    ///  
    ///  .. versionadded:: 2.4.0$nbsp;(Firmware)
    /// </summary>
    function IsWifi2StatusLEDEnabled: boolean; virtual;

    /// <summary>
    ///  Requires WIFI Extension 2.0 firmware 2.1.0.
    ///  
    ///  Sets the mesh specific configuration of the WIFI Extension 2.0.
    ///  
    ///  The ``enable`` parameter enables or disables the mesh part of the
    ///  WIFI Extension 2.0. The default value is *false*. The mesh part cannot be
    ///  enabled together with the client and access-point part.
    ///  
    ///  If the ``root_ip`` parameter is set to all zero then ``root_subnet_mask``
    ///  and ``root_gateway`` parameters are also set to all zero and DHCP is used for
    ///  IP address configuration. Otherwise those three parameters can be used to
    ///  configure a static IP address. The default configuration is DHCP.
    ///  
    ///  If the ``router_bssid`` parameter is set to all zero then the information is
    ///  taken from Wi-Fi scan when connecting the SSID as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetWifi2MeshRouterSSID"/>. This only works if the the SSID is not hidden.
    ///  In case the router has hidden SSID this parameter must be specified, otherwise
    ///  the node will not be able to reach the mesh router.
    ///  
    ///  The ``group_id`` and the ``group_ssid_prefix`` parameters identifies a
    ///  particular mesh network and nodes configured with same ``group_id`` and the
    ///  ``group_ssid_prefix`` are considered to be in the same mesh network.
    ///  
    ///  The ``gateway_ip`` and the ``gateway_port`` parameters specifies the location
    ///  of the brickd that supports mesh feature.
    ///  
    ///  To apply configuration changes to the WIFI Extension 2.0 the
    ///  <see cref="BrickMaster.TBrickMaster.SaveWifi2Configuration"/> function has to be called and the Master Brick
    ///  has to be restarted afterwards.
    ///  
    ///  It is recommended to use the Brick Viewer to configure the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.2$nbsp;(Firmware)
    /// </summary>
    procedure SetWifi2MeshConfiguration(const aEnable: boolean; const aRootIP: array of byte; const aRootSubnetMask: array of byte; const aRootGateway: array of byte; const aRouterBSSID: array of byte; const aGroupID: array of byte; const aGroupSSIDPrefix: string; const aGatewayIP: array of byte; const aGatewayPort: word); virtual;

    /// <summary>
    ///  Requires WIFI Extension 2.0 firmware 2.1.0.
    ///  
    ///  Returns the mesh configuration as set by <see cref="BrickMaster.TBrickMaster.SetWifi2MeshConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.4.2$nbsp;(Firmware)
    /// </summary>
    procedure GetWifi2MeshConfiguration(out aEnable: boolean; out aRootIP: TArray0To3OfUInt8; out aRootSubnetMask: TArray0To3OfUInt8; out aRootGateway: TArray0To3OfUInt8; out aRouterBSSID: TArray0To5OfUInt8; out aGroupID: TArray0To5OfUInt8; out aGroupSSIDPrefix: string; out aGatewayIP: TArray0To3OfUInt8; out aGatewayPort: word); virtual;

    /// <summary>
    ///  Requires WIFI Extension 2.0 firmware 2.1.0.
    ///  
    ///  Sets the mesh router SSID of the WIFI Extension 2.0.
    ///  It is used to specify the mesh router to connect to.
    ///  
    ///  Note that even though in the argument of this function a 32 characters long SSID
    ///  is allowed, in practice valid SSID should have a maximum of 31 characters. This
    ///  is due to a bug in the mesh library that we use in the firmware of the extension.
    ///  
    ///  To apply configuration changes to the WIFI Extension 2.0 the
    ///  <see cref="BrickMaster.TBrickMaster.SaveWifi2Configuration"/> function has to be called and the Master Brick
    ///  has to be restarted afterwards.
    ///  
    ///  It is recommended to use the Brick Viewer to configure the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.2$nbsp;(Firmware)
    /// </summary>
    procedure SetWifi2MeshRouterSSID(const aSSID: string); virtual;

    /// <summary>
    ///  Requires WIFI Extension 2.0 firmware 2.1.0.
    ///  
    ///  Returns the mesh router SSID as set by <see cref="BrickMaster.TBrickMaster.SetWifi2MeshRouterSSID"/>.
    ///  
    ///  .. versionadded:: 2.4.2$nbsp;(Firmware)
    /// </summary>
    function GetWifi2MeshRouterSSID: string; virtual;

    /// <summary>
    ///  Requires WIFI Extension 2.0 firmware 2.1.0.
    ///  
    ///  Sets the mesh router password (up to 64 characters) for WPA/WPA2 encryption.
    ///  The password will be used to connect to the mesh router.
    ///  
    ///  To apply configuration changes to the WIFI Extension 2.0 the
    ///  <see cref="BrickMaster.TBrickMaster.SaveWifi2Configuration"/> function has to be called and the Master Brick
    ///  has to be restarted afterwards.
    ///  
    ///  It is recommended to use the Brick Viewer to configure the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.2$nbsp;(Firmware)
    /// </summary>
    procedure SetWifi2MeshRouterPassword(const aPassword: string); virtual;

    /// <summary>
    ///  Requires WIFI Extension 2.0 firmware 2.1.0.
    ///  
    ///  Returns the mesh router password as set by <see cref="BrickMaster.TBrickMaster.SetWifi2MeshRouterPassword"/>.
    ///  
    ///  .. versionadded:: 2.4.2$nbsp;(Firmware)
    /// </summary>
    function GetWifi2MeshRouterPassword: string; virtual;

    /// <summary>
    ///  Requires WIFI Extension 2.0 firmware 2.1.0.
    ///  
    ///  Returns the common mesh status of the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.2$nbsp;(Firmware)
    /// </summary>
    procedure GetWifi2MeshCommonStatus(out aStatus: byte; out aRootNode: boolean; out aRootCandidate: boolean; out aConnectedNodes: word; out aRXCount: longword; out aTXCount: longword); virtual;

    /// <summary>
    ///  Requires WIFI Extension 2.0 firmware 2.1.0.
    ///  
    ///  Returns the mesh client status of the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.2$nbsp;(Firmware)
    /// </summary>
    procedure GetWifi2MeshClientStatus(out aHostname: string; out aIP: TArray0To3OfUInt8; out aSubnetMask: TArray0To3OfUInt8; out aGateway: TArray0To3OfUInt8; out aMACAddress: TArray0To5OfUInt8); virtual;

    /// <summary>
    ///  Requires WIFI Extension 2.0 firmware 2.1.0.
    ///  
    ///  Returns the mesh AP status of the WIFI Extension 2.0.
    ///  
    ///  .. versionadded:: 2.4.2$nbsp;(Firmware)
    /// </summary>
    procedure GetWifi2MeshAPStatus(out aSSID: string; out aIP: TArray0To3OfUInt8; out aSubnetMask: TArray0To3OfUInt8; out aGateway: TArray0To3OfUInt8; out aMACAddress: TArray0To5OfUInt8); virtual;

    /// <summary>
    ///  The SPITF protocol can be used with a dynamic baudrate. If the dynamic baudrate is
    ///  enabled, the Brick will try to adapt the baudrate for the communication
    ///  between Bricks and Bricklets according to the amount of data that is transferred.
    ///  
    ///  The baudrate will be increased exponentially if lots of data is send/received and
    ///  decreased linearly if little data is send/received.
    ///  
    ///  This lowers the baudrate in applications where little data is transferred (e.g.
    ///  a weather station) and increases the robustness. If there is lots of data to transfer
    ///  (e.g. Thermal Imaging Bricklet) it automatically increases the baudrate as needed.
    ///  
    ///  In cases where some data has to transferred as fast as possible every few seconds
    ///  (e.g. RS485 Bricklet with a high baudrate but small payload) you may want to turn
    ///  the dynamic baudrate off to get the highest possible performance.
    ///  
    ///  The maximum value of the baudrate can be set per port with the function
    ///  <see cref="BrickMaster.TBrickMaster.SetSPITFPBaudrate"/>. If the dynamic baudrate is disabled, the baudrate
    ///  as set by <see cref="BrickMaster.TBrickMaster.SetSPITFPBaudrate"/> will be used statically.
    ///  
    ///  The minimum dynamic baudrate has a value range of 400000 to 2000000 baud.
    ///  
    ///  By default dynamic baudrate is enabled and the minimum dynamic baudrate is 400000.
    ///  
    ///  .. versionadded:: 2.4.6$nbsp;(Firmware)
    /// </summary>
    procedure SetSPITFPBaudrateConfig(const aEnableDynamicBaudrate: boolean; const aMinimumDynamicBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate config, see <see cref="BrickMaster.TBrickMaster.SetSPITFPBaudrateConfig"/>.
    ///  
    ///  .. versionadded:: 2.4.6$nbsp;(Firmware)
    /// </summary>
    procedure GetSPITFPBaudrateConfig(out enableDynamicBaudrate: boolean; out minimumDynamicBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the timeout count for the different communication methods.
    ///  
    ///  The methods 0-2 are available for all Bricks, 3-7 only for Master Bricks.
    ///  
    ///  This function is mostly used for debugging during development, in normal operation
    ///  the counters should nearly always stay at 0.
    ///  
    ///  .. versionadded:: 2.4.3$nbsp;(Firmware)
    /// </summary>
    function GetSendTimeoutCount(const aCommunicationMethod: byte): longword; virtual;

    /// <summary>
    ///  Sets the baudrate for a specific Bricklet port ('a' - 'd'). The
    ///  baudrate can be in the range 400000 to 2000000.
    ///  
    ///  If you want to increase the throughput of Bricklets you can increase
    ///  the baudrate. If you get a high error count because of high
    ///  interference (see <see cref="BrickMaster.TBrickMaster.GetSPITFPErrorCount"/>) you can decrease the
    ///  baudrate.
    ///  
    ///  If the dynamic baudrate feature is enabled, the baudrate set by this
    ///  function corresponds to the maximum baudrate (see <see cref="BrickMaster.TBrickMaster.SetSPITFPBaudrateConfig"/>).
    ///  
    ///  Regulatory testing is done with the default baudrate. If CE compatibility
    ///  or similar is necessary in you applications we recommend to not change
    ///  the baudrate.
    ///  
    ///  The default baudrate for all ports is 1400000.
    ///  
    ///  .. versionadded:: 2.4.3$nbsp;(Firmware)
    /// </summary>
    procedure SetSPITFPBaudrate(const aBrickletPort: char; const aBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate for a given Bricklet port, see <see cref="BrickMaster.TBrickMaster.SetSPITFPBaudrate"/>.
    ///  
    ///  .. versionadded:: 2.4.3$nbsp;(Firmware)
    /// </summary>
    function GetSPITFPBaudrate(const aBrickletPort: char): longword; virtual;

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
    ///  The errors counts are for errors that occur on the Brick side. All
    ///  Bricklets have a similar function that returns the errors on the Bricklet side.
    ///  
    ///  .. versionadded:: 2.4.3$nbsp;(Firmware)
    /// </summary>
    procedure GetSPITFPErrorCount(const aBrickletPort: char; out aErrorCountACKChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword); virtual;

    /// <summary>
    ///  Enables the status LED.
    ///  
    ///  The status LED is the blue LED next to the USB connector. If enabled is is
    ///  on and it flickers if data is transfered. If disabled it is always off.
    ///  
    ///  The default state is enabled.
    ///  
    ///  .. versionadded:: 2.3.2$nbsp;(Firmware)
    /// </summary>
    procedure EnableStatusLED; virtual;

    /// <summary>
    ///  Disables the status LED.
    ///  
    ///  The status LED is the blue LED next to the USB connector. If enabled is is
    ///  on and it flickers if data is transfered. If disabled it is always off.
    ///  
    ///  The default state is enabled.
    ///  
    ///  .. versionadded:: 2.3.2$nbsp;(Firmware)
    /// </summary>
    procedure DisableStatusLED; virtual;

    /// <summary>
    ///  Returns *true* if the status LED is enabled, *false* otherwise.
    ///  
    ///  .. versionadded:: 2.3.2$nbsp;(Firmware)
    /// </summary>
    function IsStatusLEDEnabled: boolean; virtual;

    /// <summary>
    ///  Returns the firmware and protocol version and the name of the Bricklet for a
    ///  given port.
    ///  
    ///  This functions sole purpose is to allow automatic flashing of v1.x.y Bricklet
    ///  plugins.
    /// </summary>
    procedure GetProtocol1BrickletName(const aPort: char; out aProtocolVersion: byte; out aFirmwareVersion: TArray0To2OfUInt8; out aName: string); virtual;

    /// <summary>
    ///  Returns the temperature in °C/10 as measured inside the microcontroller. The
    ///  value returned is not the ambient temperature!
    ///  
    ///  The temperature is only proportional to the real temperature and it has an
    ///  accuracy of ±15%. Practically it is only useful as an indicator for
    ///  temperature changes.
    /// </summary>
    function GetChipTemperature: smallint; virtual;

    /// <summary>
    ///  Calling this function will reset the Brick. Calling this function
    ///  on a Brick inside of a stack will reset the whole stack.
    ///  
    ///  After a reset you have to create new device objects,
    ///  calling functions on the existing ones will Result in
    ///  undefined behavior!
    /// </summary>
    procedure Reset; virtual;

    /// <summary>
    ///  Returns the UID, the UID where the Brick is connected to,
    ///  the position, the hardware and firmware version as well as the
    ///  device identifier.
    ///  
    ///  The position can be '0'-'8' (stack position).
    ///  
    ///  The device identifier numbers can be found :ref:`here &lt;device_identifier&gt;`.
    ///  |device_identifier_constant|
    /// </summary>
    procedure GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickMaster.TBrickMaster.SetStackCurrentCallbackPeriod"/>. The parameter is the current
    ///  of the sensor.
    ///  
    ///  The <see cref="BrickMaster.TBrickMaster.OnStackCurrent"/> callback is only triggered if the current has changed
    ///  since the last triggering.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    property OnStackCurrent: TBrickMasterNotifyStackCurrent read fStackCurrentCallback write fStackCurrentCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickMaster.TBrickMaster.SetStackVoltageCallbackPeriod"/>. The parameter is the voltage
    ///  of the sensor.
    ///  
    ///  The <see cref="BrickMaster.TBrickMaster.OnStackVoltage"/> callback is only triggered if the voltage has changed
    ///  since the last triggering.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    property OnStackVoltage: TBrickMasterNotifyStackVoltage read fStackVoltageCallback write fStackVoltageCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickMaster.TBrickMaster.SetUSBVoltageCallbackPeriod"/>. The parameter is the USB
    ///  voltage in mV.
    ///  
    ///  The <see cref="BrickMaster.TBrickMaster.OnUSBVoltage"/> callback is only triggered if the USB voltage has changed
    ///  since the last triggering.
    ///  
    ///  Does not work with hardware version 2.1.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    property OnUSBVoltage: TBrickMasterNotifyUSBVoltage read fUSBVoltageCallback write fUSBVoltageCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetStackCurrentCallbackThreshold"/> is reached.
    ///  The parameter is the stack current in mA.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickMaster.TBrickMaster.SetDebouncePeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    property OnStackCurrentReached: TBrickMasterNotifyStackCurrentReached read fStackCurrentReachedCallback write fStackCurrentReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetStackVoltageCallbackThreshold"/> is reached.
    ///  The parameter is the stack voltage in mV.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickMaster.TBrickMaster.SetDebouncePeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    property OnStackVoltageReached: TBrickMasterNotifyStackVoltageReached read fStackVoltageReachedCallback write fStackVoltageReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickMaster.TBrickMaster.SetUSBVoltageCallbackThreshold"/> is reached.
    ///  The parameter is the voltage of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickMaster.TBrickMaster.SetDebouncePeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    property OnUSBVoltageReached: TBrickMasterNotifyUSBVoltageReached read fUSBVoltageReachedCallback write fUSBVoltageReachedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickMaster.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 9;
end;

procedure TBrickMaster.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_STACK_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_EXTENSION_TYPE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_EXTENSION_TYPE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_IS_CHIBI_PRESENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_CHIBI_ADDRESS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_ADDRESS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_CHIBI_MASTER_ADDRESS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_MASTER_ADDRESS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_CHIBI_SLAVE_ADDRESS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_SLAVE_ADDRESS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_SIGNAL_STRENGTH]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_ERROR_LOG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_CHIBI_FREQUENCY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_FREQUENCY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_CHIBI_CHANNEL]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_CHIBI_CHANNEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_IS_RS485_PRESENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_RS485_ADDRESS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_RS485_ADDRESS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_RS485_SLAVE_ADDRESS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_RS485_SLAVE_ADDRESS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_RS485_ERROR_LOG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_RS485_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_RS485_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_IS_WIFI_PRESENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_ENCRYPTION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_ENCRYPTION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_REFRESH_WIFI_STATUS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_CERTIFICATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_CERTIFICATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_POWER_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_POWER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_BUFFER_INFO]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_REGULATORY_DOMAIN]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_REGULATORY_DOMAIN]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_LONG_WIFI_KEY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_LONG_WIFI_KEY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_HOSTNAME]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_HOSTNAME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_STACK_CURRENT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_STACK_CURRENT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_STACK_VOLTAGE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_USB_VOLTAGE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_STACK_CURRENT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_STACK_CURRENT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_STACK_VOLTAGE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_USB_VOLTAGE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_IS_ETHERNET_PRESENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_ETHERNET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_ETHERNET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_ETHERNET_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_ETHERNET_HOSTNAME]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_ETHERNET_MAC_ADDRESS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_ETHERNET_WEBSOCKET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_ETHERNET_WEBSOCKET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_ETHERNET_AUTHENTICATION_SECRET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_ETHERNET_AUTHENTICATION_SECRET]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI_AUTHENTICATION_SECRET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI_AUTHENTICATION_SECRET]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_CONNECTION_TYPE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_IS_WIFI2_PRESENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_START_WIFI2_BOOTLOADER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_WRITE_WIFI2_SERIAL_PORT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_READ_WIFI2_SERIAL_PORT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI2_AUTHENTICATION_SECRET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_AUTHENTICATION_SECRET]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI2_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI2_CLIENT_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_CLIENT_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI2_CLIENT_HOSTNAME]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_CLIENT_HOSTNAME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI2_CLIENT_PASSWORD]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_CLIENT_PASSWORD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI2_AP_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_AP_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI2_AP_PASSWORD]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_AP_PASSWORD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SAVE_WIFI2_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_FIRMWARE_VERSION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_ENABLE_WIFI2_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_DISABLE_WIFI2_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_IS_WIFI2_STATUS_LED_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI2_MESH_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_MESH_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI2_MESH_ROUTER_SSID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_MESH_ROUTER_SSID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_WIFI2_MESH_ROUTER_PASSWORD]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_MESH_ROUTER_PASSWORD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_MESH_COMMON_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_MESH_CLIENT_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_WIFI2_MESH_AP_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_SEND_TIMEOUT_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_SET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_ENABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_DISABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_IS_STATUS_LED_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_MASTER_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_MASTER_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickMaster.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICK_MASTER_CALLBACK_STACK_CURRENT]:= {$ifdef FPC}@{$endif}CallbackWrapperStackCurrent;
  aCallBacks[BRICK_MASTER_CALLBACK_STACK_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperStackVoltage;
  aCallBacks[BRICK_MASTER_CALLBACK_USB_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperUSBVoltage;
  aCallBacks[BRICK_MASTER_CALLBACK_STACK_CURRENT_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperStackCurrentReached;
  aCallBacks[BRICK_MASTER_CALLBACK_STACK_VOLTAGE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperStackVoltageReached;
  aCallBacks[BRICK_MASTER_CALLBACK_USB_VOLTAGE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperUSBVoltageReached;
end;

function TBrickMaster.GetStackVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickMaster.GetStackCurrent: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_STACK_CURRENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickMaster.SetExtensionType(const extension: byte; const exttype: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_EXTENSION_TYPE, 13);
  LEConvertUInt8To(extension, 8, _request);
  LEConvertUInt32To(exttype, 9, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetExtensionType(const extension: byte): longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_EXTENSION_TYPE, 9);
  LEConvertUInt8To(extension, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

function TBrickMaster.IsChibiPresent: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_IS_CHIBI_PRESENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickMaster.SetChibiAddress(const address: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_CHIBI_ADDRESS, 9);
  LEConvertUInt8To(address, 8, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetChibiAddress: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_ADDRESS, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickMaster.SetChibiMasterAddress(const address: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_CHIBI_MASTER_ADDRESS, 9);
  LEConvertUInt8To(address, 8, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetChibiMasterAddress: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_MASTER_ADDRESS, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickMaster.SetChibiSlaveAddress(const num: byte; const address: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_CHIBI_SLAVE_ADDRESS, 10);
  LEConvertUInt8To(num, 8, _request);
  LEConvertUInt8To(address, 9, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetChibiSlaveAddress(const num: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_SLAVE_ADDRESS, 9);
  LEConvertUInt8To(num, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickMaster.GetChibiSignalStrength: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_SIGNAL_STRENGTH, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickMaster.GetChibiErrorLog(out underrun: word; out crcError: word; out noAck: word; out overflow: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_ERROR_LOG, 8);
  _response:= SendRequest(_request);
  underrun:= LEConvertUInt16From(8, _response);
  crcError:= LEConvertUInt16From(10, _response);
  noAck:= LEConvertUInt16From(12, _response);
  overflow:= LEConvertUInt16From(14, _response);
end;

procedure TBrickMaster.SetChibiFrequency(const frequency: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_CHIBI_FREQUENCY, 9);
  LEConvertUInt8To(frequency, 8, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetChibiFrequency: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_FREQUENCY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickMaster.SetChibiChannel(const channel: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_CHIBI_CHANNEL, 9);
  LEConvertUInt8To(channel, 8, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetChibiChannel: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIBI_CHANNEL, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickMaster.IsRS485Present: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_IS_RS485_PRESENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickMaster.SetRS485Address(const address: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_RS485_ADDRESS, 9);
  LEConvertUInt8To(address, 8, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetRS485Address: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_RS485_ADDRESS, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickMaster.SetRS485SlaveAddress(const num: byte; const address: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_RS485_SLAVE_ADDRESS, 10);
  LEConvertUInt8To(num, 8, _request);
  LEConvertUInt8To(address, 9, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetRS485SlaveAddress(const num: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_RS485_SLAVE_ADDRESS, 9);
  LEConvertUInt8To(num, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickMaster.GetRS485ErrorLog: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_RS485_ERROR_LOG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickMaster.SetRS485Configuration(const speed: longword; const parity: char; const stopbits: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_RS485_CONFIGURATION, 14);
  LEConvertUInt32To(speed, 8, _request);
  LEConvertCharTo(parity, 12, _request);
  LEConvertUInt8To(stopbits, 13, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetRS485Configuration(out speed: longword; out parity: char; out stopbits: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_RS485_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  speed:= LEConvertUInt32From(8, _response);
  parity:= LEConvertCharFrom(12, _response);
  stopbits:= LEConvertUInt8From(13, _response);
end;

function TBrickMaster.IsWifiPresent: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_IS_WIFI_PRESENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickMaster.SetWifiConfiguration(const ssid: string; const connection: byte; const ip: array of byte; const subnetMask: array of byte; const gateway: array of byte; const aPort: word);
var
  _request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_CONFIGURATION, 55);
  LEConvertStringTo(ssid, 8, 32, _request);
  LEConvertUInt8To(connection, 40, _request);
  if (Length(ip) <> 4) then raise EInvalidParameterException.Create('IP has to be exactly 4 items long');
  for _i:= 0 to Length(ip) - 1 do LEConvertUInt8To(ip[_i], 41 + (_i * 1), _request);
  if (Length(subnetMask) <> 4) then raise EInvalidParameterException.Create('Subnet Mask has to be exactly 4 items long');
  for _i:= 0 to Length(subnetMask) - 1 do LEConvertUInt8To(subnetMask[_i], 45 + (_i * 1), _request);
  if (Length(gateway) <> 4) then raise EInvalidParameterException.Create('Gateway has to be exactly 4 items long');
  for _i:= 0 to Length(gateway) - 1 do LEConvertUInt8To(gateway[_i], 49 + (_i * 1), _request);
  LEConvertUInt16To(aPort, 53, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetWifiConfiguration(out ssid: string; out connection: byte; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out port: word);
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  ssid:= LEConvertStringFrom(8, 32, _response);
  connection:= LEConvertUInt8From(40, _response);
  for _i:= 0 to 3 do ip[_i]:= LEConvertUInt8From(41 + (_i * 1), _response);
  for _i:= 0 to 3 do subnetMask[_i]:= LEConvertUInt8From(45 + (_i * 1), _response);
  for _i:= 0 to 3 do gateway[_i]:= LEConvertUInt8From(49 + (_i * 1), _response);
  port:= LEConvertUInt16From(53, _response);
end;

procedure TBrickMaster.SetWifiEncryption(const encryption: byte; const key: string; const keyIndex: byte; const eapOptions: byte; const caCertificateLength: word; const clientCertificateLength: word; const privateKeyLength: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_ENCRYPTION, 67);
  LEConvertUInt8To(encryption, 8, _request);
  LEConvertStringTo(key, 9, 50, _request);
  LEConvertUInt8To(keyIndex, 59, _request);
  LEConvertUInt8To(eapOptions, 60, _request);
  LEConvertUInt16To(caCertificateLength, 61, _request);
  LEConvertUInt16To(clientCertificateLength, 63, _request);
  LEConvertUInt16To(privateKeyLength, 65, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetWifiEncryption(out encryption: byte; out key: string; out keyIndex: byte; out eapOptions: byte; out caCertificateLength: word; out clientCertificateLength: word; out privateKeyLength: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_ENCRYPTION, 8);
  _response:= SendRequest(_request);
  encryption:= LEConvertUInt8From(8, _response);
  key:= LEConvertStringFrom(9, 50, _response);
  keyIndex:= LEConvertUInt8From(59, _response);
  eapOptions:= LEConvertUInt8From(60, _response);
  caCertificateLength:= LEConvertUInt16From(61, _response);
  clientCertificateLength:= LEConvertUInt16From(63, _response);
  privateKeyLength:= LEConvertUInt16From(65, _response);
end;

procedure TBrickMaster.GetWifiStatus(out macAddress: TArray0To5OfUInt8; out bssid: TArray0To5OfUInt8; out channel: byte; out rssi: smallint; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out rxCount: longword; out txCount: longword; out state: byte);
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_STATUS, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 5 do macAddress[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  for _i:= 0 to 5 do bssid[_i]:= LEConvertUInt8From(14 + (_i * 1), _response);
  channel:= LEConvertUInt8From(20, _response);
  rssi:= LEConvertInt16From(21, _response);
  for _i:= 0 to 3 do ip[_i]:= LEConvertUInt8From(23 + (_i * 1), _response);
  for _i:= 0 to 3 do subnetMask[_i]:= LEConvertUInt8From(27 + (_i * 1), _response);
  for _i:= 0 to 3 do gateway[_i]:= LEConvertUInt8From(31 + (_i * 1), _response);
  rxCount:= LEConvertUInt32From(35, _response);
  txCount:= LEConvertUInt32From(39, _response);
  state:= LEConvertUInt8From(43, _response);
end;

procedure TBrickMaster.RefreshWifiStatus;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_REFRESH_WIFI_STATUS, 8);
  SendRequest(_request);
end;

procedure TBrickMaster.SetWifiCertificate(const index: word; const data: array of byte; const dataLength: byte);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_CERTIFICATE, 43);
  LEConvertUInt16To(index, 8, _request);
  if (Length(data) <> 32) then raise EInvalidParameterException.Create('Data has to be exactly 32 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 10 + (_i * 1), _request);
  LEConvertUInt8To(dataLength, 42, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetWifiCertificate(const index: word; out data: TArray0To31OfUInt8; out dataLength: byte);
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_CERTIFICATE, 10);
  LEConvertUInt16To(index, 8, _request);
  _response:= SendRequest(_request);
  for _i:= 0 to 31 do data[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  dataLength:= LEConvertUInt8From(40, _response);
end;

procedure TBrickMaster.SetWifiPowerMode(const aMode: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_POWER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetWifiPowerMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_POWER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickMaster.GetWifiBufferInfo(out overflow: longword; out lowWatermark: word; out used: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_BUFFER_INFO, 8);
  _response:= SendRequest(_request);
  overflow:= LEConvertUInt32From(8, _response);
  lowWatermark:= LEConvertUInt16From(12, _response);
  used:= LEConvertUInt16From(14, _response);
end;

procedure TBrickMaster.SetWifiRegulatoryDomain(const domain: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_REGULATORY_DOMAIN, 9);
  LEConvertUInt8To(domain, 8, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetWifiRegulatoryDomain: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_REGULATORY_DOMAIN, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickMaster.GetUSBVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickMaster.SetLongWifiKey(const key: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_LONG_WIFI_KEY, 72);
  LEConvertStringTo(key, 8, 64, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetLongWifiKey: string;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_LONG_WIFI_KEY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertStringFrom(8, 64, _response);
end;

procedure TBrickMaster.SetWifiHostname(const hostname: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_HOSTNAME, 24);
  LEConvertStringTo(hostname, 8, 16, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetWifiHostname: string;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_HOSTNAME, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertStringFrom(8, 16, _response);
end;

procedure TBrickMaster.SetStackCurrentCallbackPeriod(const period: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_STACK_CURRENT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetStackCurrentCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_STACK_CURRENT_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickMaster.SetStackVoltageCallbackPeriod(const period: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_STACK_VOLTAGE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetStackVoltageCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickMaster.SetUSBVoltageCallbackPeriod(const period: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_USB_VOLTAGE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetUSBVoltageCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickMaster.SetStackCurrentCallbackThreshold(const option: char; const min: word; const max: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_STACK_CURRENT_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, _request);
  LEConvertUInt16To(min, 9, _request);
  LEConvertUInt16To(max, 11, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetStackCurrentCallbackThreshold(out option: char; out min: word; out max: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_STACK_CURRENT_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertUInt16From(9, _response);
  max:= LEConvertUInt16From(11, _response);
end;

procedure TBrickMaster.SetStackVoltageCallbackThreshold(const option: char; const min: word; const max: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_STACK_VOLTAGE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, _request);
  LEConvertUInt16To(min, 9, _request);
  LEConvertUInt16To(max, 11, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetStackVoltageCallbackThreshold(out option: char; out min: word; out max: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_STACK_VOLTAGE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertUInt16From(9, _response);
  max:= LEConvertUInt16From(11, _response);
end;

procedure TBrickMaster.SetUSBVoltageCallbackThreshold(const option: char; const min: word; const max: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_USB_VOLTAGE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, _request);
  LEConvertUInt16To(min, 9, _request);
  LEConvertUInt16To(max, 11, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetUSBVoltageCallbackThreshold(out option: char; out min: word; out max: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_USB_VOLTAGE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertUInt16From(9, _response);
  max:= LEConvertUInt16From(11, _response);
end;

procedure TBrickMaster.SetDebouncePeriod(const debounce: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetDebouncePeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

function TBrickMaster.IsEthernetPresent: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_IS_ETHERNET_PRESENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickMaster.SetEthernetConfiguration(const connection: byte; const ip: array of byte; const subnetMask: array of byte; const gateway: array of byte; const aPort: word);
var
  _request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_ETHERNET_CONFIGURATION, 23);
  LEConvertUInt8To(connection, 8, _request);
  if (Length(ip) <> 4) then raise EInvalidParameterException.Create('IP has to be exactly 4 items long');
  for _i:= 0 to Length(ip) - 1 do LEConvertUInt8To(ip[_i], 9 + (_i * 1), _request);
  if (Length(subnetMask) <> 4) then raise EInvalidParameterException.Create('Subnet Mask has to be exactly 4 items long');
  for _i:= 0 to Length(subnetMask) - 1 do LEConvertUInt8To(subnetMask[_i], 13 + (_i * 1), _request);
  if (Length(gateway) <> 4) then raise EInvalidParameterException.Create('Gateway has to be exactly 4 items long');
  for _i:= 0 to Length(gateway) - 1 do LEConvertUInt8To(gateway[_i], 17 + (_i * 1), _request);
  LEConvertUInt16To(aPort, 21, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetEthernetConfiguration(out connection: byte; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out port: word);
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_ETHERNET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  connection:= LEConvertUInt8From(8, _response);
  for _i:= 0 to 3 do ip[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  for _i:= 0 to 3 do subnetMask[_i]:= LEConvertUInt8From(13 + (_i * 1), _response);
  for _i:= 0 to 3 do gateway[_i]:= LEConvertUInt8From(17 + (_i * 1), _response);
  port:= LEConvertUInt16From(21, _response);
end;

procedure TBrickMaster.GetEthernetStatus(out macAddress: TArray0To5OfUInt8; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out rxCount: longword; out txCount: longword; out hostname: string);
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_ETHERNET_STATUS, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 5 do macAddress[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  for _i:= 0 to 3 do ip[_i]:= LEConvertUInt8From(14 + (_i * 1), _response);
  for _i:= 0 to 3 do subnetMask[_i]:= LEConvertUInt8From(18 + (_i * 1), _response);
  for _i:= 0 to 3 do gateway[_i]:= LEConvertUInt8From(22 + (_i * 1), _response);
  rxCount:= LEConvertUInt32From(26, _response);
  txCount:= LEConvertUInt32From(30, _response);
  hostname:= LEConvertStringFrom(34, 32, _response);
end;

procedure TBrickMaster.SetEthernetHostname(const hostname: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_ETHERNET_HOSTNAME, 40);
  LEConvertStringTo(hostname, 8, 32, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.SetEthernetMACAddress(const macAddress: array of byte);
var
  _request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_ETHERNET_MAC_ADDRESS, 14);
  if (Length(macAddress) <> 6) then raise EInvalidParameterException.Create('MAC Address has to be exactly 6 items long');
  for _i:= 0 to Length(macAddress) - 1 do LEConvertUInt8To(macAddress[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickMaster.SetEthernetWebsocketConfiguration(const sockets: byte; const aPort: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_ETHERNET_WEBSOCKET_CONFIGURATION, 11);
  LEConvertUInt8To(sockets, 8, _request);
  LEConvertUInt16To(aPort, 9, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetEthernetWebsocketConfiguration(out sockets: byte; out port: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_ETHERNET_WEBSOCKET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  sockets:= LEConvertUInt8From(8, _response);
  port:= LEConvertUInt16From(9, _response);
end;

procedure TBrickMaster.SetEthernetAuthenticationSecret(const secret: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_ETHERNET_AUTHENTICATION_SECRET, 72);
  LEConvertStringTo(secret, 8, 64, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetEthernetAuthenticationSecret: string;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_ETHERNET_AUTHENTICATION_SECRET, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertStringFrom(8, 64, _response);
end;

procedure TBrickMaster.SetWifiAuthenticationSecret(const secret: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI_AUTHENTICATION_SECRET, 72);
  LEConvertStringTo(secret, 8, 64, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetWifiAuthenticationSecret: string;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI_AUTHENTICATION_SECRET, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertStringFrom(8, 64, _response);
end;

function TBrickMaster.GetConnectionType: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CONNECTION_TYPE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickMaster.IsWifi2Present: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_IS_WIFI2_PRESENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

function TBrickMaster.StartWifi2Bootloader: shortint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_START_WIFI2_BOOTLOADER, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt8From(8, _response);
end;

function TBrickMaster.WriteWifi2SerialPort(const data: array of byte; const length_: byte): shortint;
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_WRITE_WIFI2_SERIAL_PORT, 69);
  if (Length(data) <> 60) then raise EInvalidParameterException.Create('Data has to be exactly 60 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  LEConvertUInt8To(length_, 68, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertInt8From(8, _response);
end;

procedure TBrickMaster.ReadWifi2SerialPort(const length_: byte; out data: TArray0To59OfUInt8; out Result: byte);
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_READ_WIFI2_SERIAL_PORT, 9);
  LEConvertUInt8To(length_, 8, _request);
  _response:= SendRequest(_request);
  for _i:= 0 to 59 do data[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  Result:= LEConvertUInt8From(68, _response);
end;

procedure TBrickMaster.SetWifi2AuthenticationSecret(const secret: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI2_AUTHENTICATION_SECRET, 72);
  LEConvertStringTo(secret, 8, 64, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetWifi2AuthenticationSecret: string;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_AUTHENTICATION_SECRET, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertStringFrom(8, 64, _response);
end;

procedure TBrickMaster.SetWifi2Configuration(const aPort: word; const websocketPort: word; const websitePort: word; const phyMode: byte; const sleepMode: byte; const website: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI2_CONFIGURATION, 17);
  LEConvertUInt16To(aPort, 8, _request);
  LEConvertUInt16To(websocketPort, 10, _request);
  LEConvertUInt16To(websitePort, 12, _request);
  LEConvertUInt8To(phyMode, 14, _request);
  LEConvertUInt8To(sleepMode, 15, _request);
  LEConvertUInt8To(website, 16, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetWifi2Configuration(out port: word; out websocketPort: word; out websitePort: word; out phyMode: byte; out sleepMode: byte; out website: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  port:= LEConvertUInt16From(8, _response);
  websocketPort:= LEConvertUInt16From(10, _response);
  websitePort:= LEConvertUInt16From(12, _response);
  phyMode:= LEConvertUInt8From(14, _response);
  sleepMode:= LEConvertUInt8From(15, _response);
  website:= LEConvertUInt8From(16, _response);
end;

procedure TBrickMaster.GetWifi2Status(out clientEnabled: boolean; out clientStatus: byte; out clientIP: TArray0To3OfUInt8; out clientSubnetMask: TArray0To3OfUInt8;
                                      out clientGateway: TArray0To3OfUInt8; out clientMACAddress: TArray0To5OfUInt8; out clientRXCount: longword;
                                      out clientTXCount: longword; out clientRSSI: shortint; out apEnabled: boolean; out apIP: TArray0To3OfUInt8;
                                      out apSubnetMask: TArray0To3OfUInt8; out apGateway: TArray0To3OfUInt8; out apMACAddress: TArray0To5OfUInt8;
                                      out apRXCount: longword; out apTXCount: longword; out apConnectedCount: byte);
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_STATUS, 8);
  _response:= SendRequest(_request);
  clientEnabled:= LEConvertBooleanFrom(8, _response);
  clientStatus:= LEConvertUInt8From(9, _response);
  for _i:= 0 to 3 do clientIP[_i]:= LEConvertUInt8From(10 + (_i * 1), _response);
  for _i:= 0 to 3 do clientSubnetMask[_i]:= LEConvertUInt8From(14 + (_i * 1), _response);
  for _i:= 0 to 3 do clientGateway[_i]:= LEConvertUInt8From(18 + (_i * 1), _response);
  for _i:= 0 to 5 do clientMACAddress[_i]:= LEConvertUInt8From(22 + (_i * 1), _response);
  clientRXCount:= LEConvertUInt32From(28, _response);
  clientTXCount:= LEConvertUInt32From(32, _response);
  clientRSSI:= LEConvertInt8From(36, _response);
  apEnabled:= LEConvertBooleanFrom(37, _response);
  for _i:= 0 to 3 do apIP[_i]:= LEConvertUInt8From(38 + (_i * 1), _response);
  for _i:= 0 to 3 do apSubnetMask[_i]:= LEConvertUInt8From(42 + (_i * 1), _response);
  for _i:= 0 to 3 do apGateway[_i]:= LEConvertUInt8From(46 + (_i * 1), _response);
  for _i:= 0 to 5 do apMACAddress[_i]:= LEConvertUInt8From(50 + (_i * 1), _response);
  apRXCount:= LEConvertUInt32From(56, _response);
  apTXCount:= LEConvertUInt32From(60, _response);
  apConnectedCount:= LEConvertUInt8From(64, _response);
end;

procedure TBrickMaster.SetWifi2ClientConfiguration(const enable: boolean; const ssid: string; const ip: array of byte; const subnetMask: array of byte;
                                                   const gateway: array of byte; const macAddress: array of byte; const bssid: array of byte);
var
  _request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI2_CLIENT_CONFIGURATION, 65);
  LEConvertBooleanTo(enable, 8, _request);
  LEConvertStringTo(ssid, 9, 32, _request);
  if (Length(ip) <> 4) then raise EInvalidParameterException.Create('IP has to be exactly 4 items long');
  for _i:= 0 to Length(ip) - 1 do LEConvertUInt8To(ip[_i], 41 + (_i * 1), _request);
  if (Length(subnetMask) <> 4) then raise EInvalidParameterException.Create('Subnet Mask has to be exactly 4 items long');
  for _i:= 0 to Length(subnetMask) - 1 do LEConvertUInt8To(subnetMask[_i], 45 + (_i * 1), _request);
  if (Length(gateway) <> 4) then raise EInvalidParameterException.Create('Gateway has to be exactly 4 items long');
  for _i:= 0 to Length(gateway) - 1 do LEConvertUInt8To(gateway[_i], 49 + (_i * 1), _request);
  if (Length(macAddress) <> 6) then raise EInvalidParameterException.Create('MAC Address has to be exactly 6 items long');
  for _i:= 0 to Length(macAddress) - 1 do LEConvertUInt8To(macAddress[_i], 53 + (_i * 1), _request);
  if (Length(bssid) <> 6) then raise EInvalidParameterException.Create('BSSID has to be exactly 6 items long');
  for _i:= 0 to Length(bssid) - 1 do LEConvertUInt8To(bssid[_i], 59 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetWifi2ClientConfiguration(out enable: boolean; out ssid: string; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8;
                                                   out gateway: TArray0To3OfUInt8; out macAddress: TArray0To5OfUInt8; out bssid: TArray0To5OfUInt8);
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_CLIENT_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  enable:= LEConvertBooleanFrom(8, _response);
  ssid:= LEConvertStringFrom(9, 32, _response);
  for _i:= 0 to 3 do ip[_i]:= LEConvertUInt8From(41 + (_i * 1), _response);
  for _i:= 0 to 3 do subnetMask[_i]:= LEConvertUInt8From(45 + (_i * 1), _response);
  for _i:= 0 to 3 do gateway[_i]:= LEConvertUInt8From(49 + (_i * 1), _response);
  for _i:= 0 to 5 do macAddress[_i]:= LEConvertUInt8From(53 + (_i * 1), _response);
  for _i:= 0 to 5 do bssid[_i]:= LEConvertUInt8From(59 + (_i * 1), _response);
end;

procedure TBrickMaster.SetWifi2ClientHostname(const hostname: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI2_CLIENT_HOSTNAME, 40);
  LEConvertStringTo(hostname, 8, 32, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetWifi2ClientHostname: string;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_CLIENT_HOSTNAME, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertStringFrom(8, 32, _response);
end;

procedure TBrickMaster.SetWifi2ClientPassword(const password: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI2_CLIENT_PASSWORD, 72);
  LEConvertStringTo(password, 8, 64, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetWifi2ClientPassword: string;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_CLIENT_PASSWORD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertStringFrom(8, 64, _response);
end;

procedure TBrickMaster.SetWifi2APConfiguration(const enable: boolean; const ssid: string; const ip: array of byte; const subnetMask: array of byte; const gateway: array of byte; const encryption: byte; const hidden: boolean; const channel: byte; const macAddress: array of byte);
var
  _request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI2_AP_CONFIGURATION, 62);
  LEConvertBooleanTo(enable, 8, _request);
  LEConvertStringTo(ssid, 9, 32, _request);
  if (Length(ip) <> 4) then raise EInvalidParameterException.Create('IP has to be exactly 4 items long');
  for _i:= 0 to Length(ip) - 1 do LEConvertUInt8To(ip[_i], 41 + (_i * 1), _request);
  if (Length(subnetMask) <> 4) then raise EInvalidParameterException.Create('Subnet Mask has to be exactly 4 items long');
  for _i:= 0 to Length(subnetMask) - 1 do LEConvertUInt8To(subnetMask[_i], 45 + (_i * 1), _request);
  if (Length(gateway) <> 4) then raise EInvalidParameterException.Create('Gateway has to be exactly 4 items long');
  for _i:= 0 to Length(gateway) - 1 do LEConvertUInt8To(gateway[_i], 49 + (_i * 1), _request);
  LEConvertUInt8To(encryption, 53, _request);
  LEConvertBooleanTo(hidden, 54, _request);
  LEConvertUInt8To(channel, 55, _request);
  if (Length(macAddress) <> 6) then raise EInvalidParameterException.Create('MAC Address has to be exactly 6 items long');
  for _i:= 0 to Length(macAddress) - 1 do LEConvertUInt8To(macAddress[_i], 56 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetWifi2APConfiguration(out enable: boolean; out ssid: string; out ip: TArray0To3OfUInt8; out subnetMask: TArray0To3OfUInt8; out gateway: TArray0To3OfUInt8; out encryption: byte; out hidden: boolean; out channel: byte; out macAddress: TArray0To5OfUInt8);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_AP_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  enable:= LEConvertBooleanFrom(8, _response);
  ssid:= LEConvertStringFrom(9, 32, _response);
  for _i:= 0 to 3 do ip[_i]:= LEConvertUInt8From(41 + (_i * 1), _response);
  for _i:= 0 to 3 do subnetMask[_i]:= LEConvertUInt8From(45 + (_i * 1), _response);
  for _i:= 0 to 3 do gateway[_i]:= LEConvertUInt8From(49 + (_i * 1), _response);
  encryption:= LEConvertUInt8From(53, _response);
  hidden:= LEConvertBooleanFrom(54, _response);
  channel:= LEConvertUInt8From(55, _response);
  for _i:= 0 to 5 do macAddress[_i]:= LEConvertUInt8From(56 + (_i * 1), _response);
end;

procedure TBrickMaster.SetWifi2APPassword(const aPassword: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI2_AP_PASSWORD, 72);
  LEConvertStringTo(aPassword, 8, 64, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetWifi2APPassword: string;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_AP_PASSWORD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertStringFrom(8, 64, _response);
end;

function TBrickMaster.SaveWifi2Configuration: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SAVE_WIFI2_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickMaster.GetWifi2FirmwareVersion: TArray0To2OfUInt8;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_FIRMWARE_VERSION, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 2 do Result[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
end;

procedure TBrickMaster.EnableWifi2StatusLED;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_ENABLE_WIFI2_STATUS_LED, 8);
  SendRequest(_request);
end;

procedure TBrickMaster.DisableWifi2StatusLED;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_DISABLE_WIFI2_STATUS_LED, 8);
  SendRequest(_request);
end;

function TBrickMaster.IsWifi2StatusLEDEnabled: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_IS_WIFI2_STATUS_LED_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickMaster.SetWifi2MeshConfiguration(const aEnable: boolean; const aRootIP: array of byte; const aRootSubnetMask: array of byte; const aRootGateway: array of byte; const aRouterBSSID: array of byte; const aGroupID: array of byte; const aGroupSSIDPrefix: string; const aGatewayIP: array of byte; const aGatewayPort: word);
var
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI2_MESH_CONFIGURATION, 55);
  LEConvertBooleanTo(aEnable, 8, _request);
  if (Length(aRootIP) <> 4) then raise EInvalidParameterException.Create('Root IP has to be exactly 4 items long');
  for _i:= 0 to Length(aRootIP) - 1 do LEConvertUInt8To(aRootIP[_i], 9 + (_i * 1), _request);
  if (Length(aRootSubnetMask) <> 4) then raise EInvalidParameterException.Create('Root Subnet Mask has to be exactly 4 items long');
  for _i:= 0 to Length(aRootSubnetMask) - 1 do LEConvertUInt8To(aRootSubnetMask[_i], 13 + (_i * 1), _request);
  if (Length(aRootGateway) <> 4) then raise EInvalidParameterException.Create('Root Gateway has to be exactly 4 items long');
  for _i:= 0 to Length(aRootGateway) - 1 do LEConvertUInt8To(aRootGateway[_i], 17 + (_i * 1), _request);
  if (Length(aRouterBSSID) <> 6) then raise EInvalidParameterException.Create('Router BSSID has to be exactly 6 items long');
  for _i:= 0 to Length(aRouterBSSID) - 1 do LEConvertUInt8To(aRouterBSSID[_i], 21 + (_i * 1), _request);
  if (Length(aGroupID) <> 6) then raise EInvalidParameterException.Create('Group ID has to be exactly 6 items long');
  for _i:= 0 to Length(aGroupID) - 1 do LEConvertUInt8To(aGroupID[_i], 27 + (_i * 1), _request);
  LEConvertStringTo(aGroupSSIDPrefix, 33, 16, _request);
  if (Length(aGatewayIP) <> 4) then raise EInvalidParameterException.Create('Gateway IP has to be exactly 4 items long');
  for _i:= 0 to Length(aGatewayIP) - 1 do LEConvertUInt8To(aGatewayIP[_i], 49 + (_i * 1), _request);
  LEConvertUInt16To(aGatewayPort, 53, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetWifi2MeshConfiguration(out aEnable: boolean; out aRootIP: TArray0To3OfUInt8; out aRootSubnetMask: TArray0To3OfUInt8; out aRootGateway: TArray0To3OfUInt8; out aRouterBSSID: TArray0To5OfUInt8; out aGroupID: TArray0To5OfUInt8; out aGroupSSIDPrefix: string; out aGatewayIP: TArray0To3OfUInt8; out aGatewayPort: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_MESH_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aEnable:= LEConvertBooleanFrom(8, _response);
  for _i:= 0 to 3 do aRootIP[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  for _i:= 0 to 3 do aRootSubnetMask[_i]:= LEConvertUInt8From(13 + (_i * 1), _response);
  for _i:= 0 to 3 do aRootGateway[_i]:= LEConvertUInt8From(17 + (_i * 1), _response);
  for _i:= 0 to 5 do aRouterBSSID[_i]:= LEConvertUInt8From(21 + (_i * 1), _response);
  for _i:= 0 to 5 do aGroupID[_i]:= LEConvertUInt8From(27 + (_i * 1), _response);
  aGroupSSIDPrefix:= LEConvertStringFrom(33, 16, _response);
  for _i:= 0 to 3 do aGatewayIP[_i]:= LEConvertUInt8From(49 + (_i * 1), _response);
  aGatewayPort:= LEConvertUInt16From(53, _response);
end;

procedure TBrickMaster.SetWifi2MeshRouterSSID(const aSSID: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI2_MESH_ROUTER_SSID, 40);
  LEConvertStringTo(aSSID, 8, 32, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetWifi2MeshRouterSSID: string;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_MESH_ROUTER_SSID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertStringFrom(8, 32, _response);
end;

procedure TBrickMaster.SetWifi2MeshRouterPassword(const aPassword: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_WIFI2_MESH_ROUTER_PASSWORD, 72);
  LEConvertStringTo(aPassword, 8, 64, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetWifi2MeshRouterPassword: string;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_MESH_ROUTER_PASSWORD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertStringFrom(8, 64, _response);
end;

procedure TBrickMaster.GetWifi2MeshCommonStatus(out aStatus: byte; out aRootNode: boolean; out aRootCandidate: boolean; out aConnectedNodes: word; out aRXCount: longword; out aTXCount: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_MESH_COMMON_STATUS, 8);
  _response:= SendRequest(_request);
  aStatus:= LEConvertUInt8From(8, _response);
  aRootNode:= LEConvertBooleanFrom(9, _response);
  aRootCandidate:= LEConvertBooleanFrom(10, _response);
  aConnectedNodes:= LEConvertUInt16From(11, _response);
  aRXCount:= LEConvertUInt32From(13, _response);
  aTXCount:= LEConvertUInt32From(17, _response);
end;

procedure TBrickMaster.GetWifi2MeshClientStatus(out aHostname: string; out aIP: TArray0To3OfUInt8; out aSubnetMask: TArray0To3OfUInt8; out aGateway: TArray0To3OfUInt8; out aMACAddress: TArray0To5OfUInt8);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_MESH_CLIENT_STATUS, 8);
  _response:= SendRequest(_request);
  aHostname:= LEConvertStringFrom(8, 32, _response);
  for _i:= 0 to 3 do aIP[_i]:= LEConvertUInt8From(40 + (_i * 1), _response);
  for _i:= 0 to 3 do aSubnetMask[_i]:= LEConvertUInt8From(44 + (_i * 1), _response);
  for _i:= 0 to 3 do aGateway[_i]:= LEConvertUInt8From(48 + (_i * 1), _response);
  for _i:= 0 to 5 do aMACAddress[_i]:= LEConvertUInt8From(52 + (_i * 1), _response);
end;

procedure TBrickMaster.GetWifi2MeshAPStatus(out aSSID: string; out aIP: TArray0To3OfUInt8; out aSubnetMask: TArray0To3OfUInt8; out aGateway: TArray0To3OfUInt8; out aMACAddress: TArray0To5OfUInt8);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_WIFI2_MESH_AP_STATUS, 8);
  _response:= SendRequest(_request);
  aSSID:= LEConvertStringFrom(8, 32, _response);
  for _i:= 0 to 3 do aIP[_i]:= LEConvertUInt8From(40 + (_i * 1), _response);
  for _i:= 0 to 3 do aSubnetMask[_i]:= LEConvertUInt8From(44 + (_i * 1), _response);
  for _i:= 0 to 3 do aGateway[_i]:= LEConvertUInt8From(48 + (_i * 1), _response);
  for _i:= 0 to 5 do aMACAddress[_i]:= LEConvertUInt8From(52 + (_i * 1), _response);
end;

procedure TBrickMaster.SetSPITFPBaudrateConfig(const aEnableDynamicBaudrate: boolean; const aMinimumDynamicBaudrate: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG, 13);
  LEConvertBooleanTo(aEnableDynamicBaudrate, 8, _request);
  LEConvertUInt32To(aMinimumDynamicBaudrate, 9, _request);
  SendRequest(_request);
end;

procedure TBrickMaster.GetSPITFPBaudrateConfig(out enableDynamicBaudrate: boolean; out minimumDynamicBaudrate: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG, 8);
  _response:= SendRequest(_request);
  enableDynamicBaudrate:= LEConvertBooleanFrom(8, _response);
  minimumDynamicBaudrate:= LEConvertUInt32From(9, _response);
end;

function TBrickMaster.GetSendTimeoutCount(const aCommunicationMethod: byte): longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_SEND_TIMEOUT_COUNT, 9);
  LEConvertUInt8To(aCommunicationMethod, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickMaster.SetSPITFPBaudrate(const aBrickletPort: char; const aBaudrate: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_SET_SPITFP_BAUDRATE, 13);
  LEConvertCharTo(aBrickletPort, 8, _request);
  LEConvertUInt32To(aBaudrate, 9, _request);
  SendRequest(_request);
end;

function TBrickMaster.GetSPITFPBaudrate(const aBrickletPort: char): longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_SPITFP_BAUDRATE, 9);
  LEConvertCharTo(aBrickletPort, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickMaster.GetSPITFPErrorCount(const aBrickletPort: char; out aErrorCountACKChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_SPITFP_ERROR_COUNT, 9);
  LEConvertCharTo(aBrickletPort, 8, _request);
  _response:= SendRequest(_request);
  aErrorCountACKChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

procedure TBrickMaster.EnableStatusLED;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_ENABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

procedure TBrickMaster.DisableStatusLED;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_DISABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

function TBrickMaster.IsStatusLEDEnabled: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_IS_STATUS_LED_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickMaster.GetProtocol1BrickletName(const aPort: char; out aProtocolVersion: byte; out aFirmwareVersion: TArray0To2OfUInt8; out aName: string);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(aPort, 8, _request);
  _response:= SendRequest(_request);
  aProtocolVersion:= LEConvertUInt8From(8, _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  name:= LEConvertStringFrom(12, 40, _response);
end;

function TBrickMaster.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickMaster.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickMaster.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_MASTER_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUid:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickMaster.CallbackWrapperStackCurrent(const aPacket: TDynamicByteArray);
var
  _current: word;
begin
  _current:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fStackCurrentCallback)) then begin
    fStackCurrentCallback(self, _current);
  end;
end;

procedure TBrickMaster.CallbackWrapperStackVoltage(const aPacket: TDynamicByteArray);
var
  _voltage: word;
begin
  _voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fStackVoltageCallback)) then begin
    fStackVoltageCallback(self, _voltage);
  end;
end;

procedure TBrickMaster.CallbackWrapperUSBVoltage(const aPacket: TDynamicByteArray);
var
  _voltage: word;
begin
  _voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fUSBVoltageCallback)) then begin
    fUSBVoltageCallback(self, _voltage);
  end;
end;

procedure TBrickMaster.CallbackWrapperStackCurrentReached(const aPacket: TDynamicByteArray);
var
  _current: word;
begin
  _current:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fStackCurrentReachedCallback)) then begin
    fStackCurrentReachedCallback(self, _current);
  end;
end;

procedure TBrickMaster.CallbackWrapperStackVoltageReached(const aPacket: TDynamicByteArray);
var
  _voltage: word;
begin
  _voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fStackVoltageReachedCallback)) then begin
    fStackVoltageReachedCallback(self, _voltage);
  end;
end;

procedure TBrickMaster.CallbackWrapperUSBVoltageReached(const aPacket: TDynamicByteArray);
var
  _Voltage: word;
begin
  _Voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fUSBVoltageReachedCallback)) then begin
    fUSBVoltageReachedCallback(self, _Voltage);
  end;
end;

end.
