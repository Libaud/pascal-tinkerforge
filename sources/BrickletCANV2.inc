const
  BRICKLET_CAN_V2_DEVICE_IDENTIFIER = 2107;
  BRICKLET_CAN_V2_DEVICE_DISPLAY_NAME = 'CAN Bricklet 2.0';

  BRICKLET_CAN_V2_FUNCTION_WRITE_FRAME_LOW_LEVEL = 1;
  BRICKLET_CAN_V2_FUNCTION_READ_FRAME_LOW_LEVEL = 2;
  BRICKLET_CAN_V2_FUNCTION_SET_FRAME_READ_CALLBACK_CONFIGURATION = 3;
  BRICKLET_CAN_V2_FUNCTION_GET_FRAME_READ_CALLBACK_CONFIGURATION = 4;
  BRICKLET_CAN_V2_FUNCTION_SET_TRANSCEIVER_CONFIGURATION = 5;
  BRICKLET_CAN_V2_FUNCTION_GET_TRANSCEIVER_CONFIGURATION = 6;
  BRICKLET_CAN_V2_FUNCTION_SET_QUEUE_CONFIGURATION_LOW_LEVEL = 7;
  BRICKLET_CAN_V2_FUNCTION_GET_QUEUE_CONFIGURATION_LOW_LEVEL = 8;
  BRICKLET_CAN_V2_FUNCTION_SET_READ_FILTER_CONFIGURATION = 9;
  BRICKLET_CAN_V2_FUNCTION_GET_READ_FILTER_CONFIGURATION = 10;
  BRICKLET_CAN_V2_FUNCTION_GET_ERROR_LOG_LOW_LEVEL = 11;
  BRICKLET_CAN_V2_FUNCTION_SET_COMMUNICATION_LED_CONFIG = 12;
  BRICKLET_CAN_V2_FUNCTION_GET_COMMUNICATION_LED_CONFIG = 13;
  BRICKLET_CAN_V2_FUNCTION_SET_ERROR_LED_CONFIG = 14;
  BRICKLET_CAN_V2_FUNCTION_GET_ERROR_LED_CONFIG = 15;
  BRICKLET_CAN_V2_FUNCTION_GET_SPITFP_ERROR_COUNT = 234;
  BRICKLET_CAN_V2_FUNCTION_SET_BOOTLOADER_MODE = 235;
  BRICKLET_CAN_V2_FUNCTION_GET_BOOTLOADER_MODE = 236;
  BRICKLET_CAN_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER = 237;
  BRICKLET_CAN_V2_FUNCTION_WRITE_FIRMWARE = 238;
  BRICKLET_CAN_V2_FUNCTION_SET_STATUS_LED_CONFIG = 239;
  BRICKLET_CAN_V2_FUNCTION_GET_STATUS_LED_CONFIG = 240;
  BRICKLET_CAN_V2_FUNCTION_GET_CHIP_TEMPERATURE = 242;
  BRICKLET_CAN_V2_FUNCTION_RESET = 243;
  BRICKLET_CAN_V2_FUNCTION_WRITE_UID = 248;
  BRICKLET_CAN_V2_FUNCTION_READ_UID = 249;
  BRICKLET_CAN_V2_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_CAN_V2_CALLBACK_FRAME_READ_LOW_LEVEL = 16;

  BRICKLET_CAN_V2_FRAME_TYPE_STANDARD_DATA = 0;
  BRICKLET_CAN_V2_FRAME_TYPE_STANDARD_REMOTE = 1;
  BRICKLET_CAN_V2_FRAME_TYPE_EXTENDED_DATA = 2;
  BRICKLET_CAN_V2_FRAME_TYPE_EXTENDED_REMOTE = 3;
  BRICKLET_CAN_V2_TRANSCEIVER_MODE_NORMAL = 0;
  BRICKLET_CAN_V2_TRANSCEIVER_MODE_LOOPBACK = 1;
  BRICKLET_CAN_V2_TRANSCEIVER_MODE_READ_ONLY = 2;
  BRICKLET_CAN_V2_FILTER_MODE_ACCEPT_ALL = 0;
  BRICKLET_CAN_V2_FILTER_MODE_MATCH_STANDARD_ONLY = 1;
  BRICKLET_CAN_V2_FILTER_MODE_MATCH_EXTENDED_ONLY = 2;
  BRICKLET_CAN_V2_FILTER_MODE_MATCH_STANDARD_AND_EXTENDED = 3;
  BRICKLET_CAN_V2_TRANSCEIVER_STATE_ACTIVE = 0;
  BRICKLET_CAN_V2_TRANSCEIVER_STATE_PASSIVE = 1;
  BRICKLET_CAN_V2_TRANSCEIVER_STATE_DISABLED = 2;
  BRICKLET_CAN_V2_COMMUNICATION_LED_CONFIG_OFF = 0;
  BRICKLET_CAN_V2_COMMUNICATION_LED_CONFIG_ON = 1;
  BRICKLET_CAN_V2_COMMUNICATION_LED_CONFIG_SHOW_HEARTBEAT = 2;
  BRICKLET_CAN_V2_COMMUNICATION_LED_CONFIG_SHOW_COMMUNICATION = 3;
  BRICKLET_CAN_V2_ERROR_LED_CONFIG_OFF = 0;
  BRICKLET_CAN_V2_ERROR_LED_CONFIG_ON = 1;
  BRICKLET_CAN_V2_ERROR_LED_CONFIG_SHOW_HEARTBEAT = 2;
  BRICKLET_CAN_V2_ERROR_LED_CONFIG_SHOW_TRANSCEIVER_STATE = 3;
  BRICKLET_CAN_V2_ERROR_LED_CONFIG_SHOW_ERROR = 4;
  BRICKLET_CAN_V2_BOOTLOADER_MODE_BOOTLOADER = 0;
  BRICKLET_CAN_V2_BOOTLOADER_MODE_FIRMWARE = 1;
  BRICKLET_CAN_V2_BOOTLOADER_MODE_BOOTLOADER_WAIT_FOR_REBOOT = 2;
  BRICKLET_CAN_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_REBOOT = 3;
  BRICKLET_CAN_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_ERASE_AND_REBOOT = 4;
  BRICKLET_CAN_V2_BOOTLOADER_STATUS_OK = 0;
  BRICKLET_CAN_V2_BOOTLOADER_STATUS_INVALID_MODE = 1;
  BRICKLET_CAN_V2_BOOTLOADER_STATUS_NO_CHANGE = 2;
  BRICKLET_CAN_V2_BOOTLOADER_STATUS_ENTRY_FUNCTION_NOT_PRESENT = 3;
  BRICKLET_CAN_V2_BOOTLOADER_STATUS_DEVICE_IDENTIFIER_INCORRECT = 4;
  BRICKLET_CAN_V2_BOOTLOADER_STATUS_CRC_MISMATCH = 5;
  BRICKLET_CAN_V2_STATUS_LED_CONFIG_OFF = 0;
  BRICKLET_CAN_V2_STATUS_LED_CONFIG_ON = 1;
  BRICKLET_CAN_V2_STATUS_LED_CONFIG_SHOW_HEARTBEAT = 2;
  BRICKLET_CAN_V2_STATUS_LED_CONFIG_SHOW_STATUS = 3;


