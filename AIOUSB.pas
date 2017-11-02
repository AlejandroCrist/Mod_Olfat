unit AIOUSB;

interface

uses
  Windows;

const
  diNone = $FFFFFFFF;
  diFirst = $FFFFFFFE;
  diOnly = $FFFFFFFD;



function GetDevices: LongWord; cdecl; external 'AIOUSB.dll';
function QueryDeviceInfo(DeviceIndex: LongWord; pPID: PLongWord; pNameSize: PLongWord; pName: PChar; pDIOBytes, pCounters: PLongWord): LongWord; cdecl; external 'AIOUSB.dll';
function AIOUSB_CloseDevice(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function ClearDevices: LongWord; cdecl; external 'AIOUSB.dll';
function GetDeviceUniqueStr(DeviceIndex: LongWord; pIIDSize: PLongWord; pIID: PChar): LongWord; cdecl; external 'AIOUSB.dll';
function GetDeviceSerialNumber(DeviceIndex: LongWord; var pSerialNumber: Int64): LongWord; cdecl; external 'AIOUSB.dll';
function ResolveDeviceIndex(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function GetDeviceByEEPROMByte(Data: Byte): LongWord; cdecl; external 'AIOUSB.dll';
function GetDeviceByEEPROMData(StartAddress, DataSize: LongWord; pData: PByte): LongWord; cdecl; external 'AIOUSB.dll';
function GetDeviceBySerialNumber(const pSerialNumber: Int64): LongWord; cdecl; external 'AIOUSB.dll';

function AIOUSB_ClearFIFO(DeviceIndex: LongWord; TimeMethod: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function AIOUSB_SetStreamingBlockSize(DeviceIndex, BlockSize: LongWord): LongWord; cdecl; external 'AIOUSB.dll';

function CustomEEPROMRead(DeviceIndex: LongWord; StartAddress: LongWord; var DataSize: LongWord; Data: Pointer): LongWord; cdecl; external 'AIOUSB.dll';
function CustomEEPROMWrite(DeviceIndex: LongWord; StartAddress: LongWord; DataSize: LongWord; Data: Pointer): LongWord; cdecl; external 'AIOUSB.dll';
function AIOUSB_FlashRead(DeviceIndex: LongWord; StartAddress: LongWord; var DataSize: LongWord; Data: Pointer): LongWord; cdecl; external 'AIOUSB.dll';
function AIOUSB_FlashWrite(DeviceIndex: LongWord; StartAddress: LongWord; DataSize: LongWord; Data: Pointer): LongWord; cdecl; external 'AIOUSB.dll';
function AIOUSB_FlashEraseSector(DeviceIndex: LongWord; Sector: Integer): LongWord; cdecl; external 'AIOUSB.dll';

function GenericVendorRead(DeviceIndex: LongWord; Request: Byte; Value, Index: Word; var DataSize: LongWord; Data: Pointer): LongWord; cdecl; external 'AIOUSB.dll';
function GenericVendorWrite(DeviceIndex: LongWord; Request: Byte; Value, Index: Word; DataSize: LongWord; Data: Pointer): LongWord; cdecl; external 'AIOUSB.dll';



function ADC_GetScan(DeviceIndex: LongWord; pBuf: PWord): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_GetScanV(DeviceIndex: LongWord; pBuf: PDouble): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_GetChannelV(DeviceIndex, ChannelIndex: LongWord; pBuf: PDouble): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_GetCalRefV(DeviceIndex, CalRefIndex: LongWord; var pRef: Double): LongWord; cdecl; external 'AIOUSB.dll';

function ADC_GetConfig(DeviceIndex: LongWord; pConfigBuf: Pointer; var ConfigBufSize: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_SetConfig(DeviceIndex: LongWord; pConfigBuf: Pointer; var ConfigBufSize: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_ADMode(DeviceIndex: LongWord; TriggerMode, CalMode: Byte): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_Range1(DeviceIndex, ADChannel: LongWord; GainCode: Byte; bDifferential: LongBool): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_RangeAll(DeviceIndex: LongWord; pGainCodes: PByte; bDifferential: LongBool): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_SetScanLimits(DeviceIndex, StartChannel, EndChannel: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_SetOversample(DeviceIndex: LongWord; Oversample: Byte): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_QueryCal(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_SetCal(DeviceIndex: LongWord; CalFileName: PChar): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_Initialize(DeviceIndex: LongWord; pConfigBuf: Pointer; var ConfigBufSize: LongWord; CalFileName: PChar): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_GetImmediate(DeviceIndex, Channel: LongWord; pBuf: PWord): LongWord; cdecl; external 'AIOUSB.dll';

function ADC_BulkAcquire(DeviceIndex: LongWord; BufSize: LongWord; pBuf: Pointer): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_BulkPoll(DeviceIndex: LongWord; var BytesLeft: LongWord): LongWord; cdecl; external 'AIOUSB.dll';

function ADC_BulkMode(DeviceIndex, BulkMode: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_BulkContinuousCallbackStart(DeviceIndex: LongWord; BufSize: LongWord; BaseBufCount: LongWord; Context: LongWord; pCallback: Pointer): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_BulkContinuousEnd(DeviceIndex: LongWord; pIOStatus: PLongWord): LongWord; cdecl; external 'AIOUSB.dll';

function ADC_InitFastITScanV(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_ResetFastITScanV(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_SetFastITScanVChannels(DeviceIndex, NewChannels: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_GetFastITScanV(DeviceIndex: LongWord; pBuf: PDouble): LongWord; cdecl; external 'AIOUSB.dll';
function ADC_GetITScanV(DeviceIndex: LongWord; pBuf: PDouble): LongWord; cdecl; external 'AIOUSB.dll';



function CTR_8254Load(DeviceIndex, BlockIndex, CounterIndex: LongWord; LoadValue: Word): LongWord; cdecl; external 'AIOUSB.dll';
function CTR_8254Mode(DeviceIndex, BlockIndex, CounterIndex, Mode: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function CTR_8254ModeLoad(DeviceIndex, BlockIndex, CounterIndex, Mode: LongWord; LoadValue: Word): LongWord; cdecl; external 'AIOUSB.dll';
function CTR_8254Read(DeviceIndex, BlockIndex, CounterIndex: LongWord; pReadValue: PWord): LongWord; cdecl; external 'AIOUSB.dll';
function CTR_8254ReadStatus(DeviceIndex, BlockIndex, CounterIndex: LongWord; pReadValue: PWord; pStatus: PByte): LongWord; cdecl; external 'AIOUSB.dll';
function CTR_8254ReadModeLoad(DeviceIndex, BlockIndex, CounterIndex, Mode: LongWord; LoadValue: Word; pReadValue: PWord): LongWord; cdecl; external 'AIOUSB.dll';

function CTR_StartOutputFreq(DeviceIndex, BlockIndex: LongWord; pHz: PDouble): LongWord; cdecl; external 'AIOUSB.dll';

function CTR_8254ReadAll(DeviceIndex: LongWord; pData: PWord): LongWord; cdecl; external 'AIOUSB.dll';

function CTR_8254SelectGate(DeviceIndex, GateIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function CTR_8254ReadLatched(DeviceIndex: LongWord; pData: PWord): LongWord; cdecl; external 'AIOUSB.dll';
function CTR_SetWaitGates(DeviceIndex: LongWord; A, B: Byte): LongWord; cdecl; external 'AIOUSB.dll';
function CTR_EndWaitGates(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function CTR_WaitForGate(DeviceIndex: LongWord; GateIndex: Byte; var Content: Word): LongWord; cdecl; external 'AIOUSB.dll';

function CTR_StartMeasuringPulseWidth(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function CTR_StopMeasuringPulseWidth(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function CTR_GetPulseWidthMeasurement(DeviceIndex, BlockIndex, CounterIndex: LongWord; pReadValue: PWord): LongWord; cdecl; external 'AIOUSB.dll';



function DIO_Configure(DeviceIndex: LongWord; Tristate: ByteBool; pOutMask: Pointer; pData: Pointer): LongWord; cdecl; external 'AIOUSB.dll';
function DIO_ConfigureEx(DeviceIndex: LongWord; pOutMask: Pointer; pData: Pointer; pTristateMask: Pointer): LongWord; cdecl; external 'AIOUSB.dll';
function DIO_ConfigurationQuery(DeviceIndex: LongWord; pOutMask: Pointer; pTristateMask: Pointer): LongWord; cdecl; external 'AIOUSB.dll';

function DIO_Read1(DeviceIndex, BitIndex: LongWord; Buffer: PByte): LongWord; cdecl; external 'AIOUSB.dll';
function DIO_Read8(DeviceIndex, ByteIndex: LongWord; Buffer: PByte): LongWord; cdecl; external 'AIOUSB.dll';
function DIO_ReadAll(DeviceIndex: LongWord; pData: Pointer): LongWord; cdecl; external 'AIOUSB.dll';

function DIO_Write1(DeviceIndex, BitIndex: LongWord; Data: ByteBool): LongWord; cdecl; external 'AIOUSB.dll';
function DIO_Write8(DeviceIndex, ByteIndex: LongWord; Data: Byte): LongWord; cdecl; external 'AIOUSB.dll';
function DIO_WriteAll(DeviceIndex: LongWord; pData: Pointer): LongWord; cdecl; external 'AIOUSB.dll';

function DIO_StreamOpen(DeviceIndex: LongWord; bIsRead: LongBool): LongWord; cdecl; external 'AIOUSB.dll';
function DIO_StreamClose(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function DIO_StreamFrame(DeviceIndex, FramePoints: LongWord; pFrameData: PWord; var BytesTransferred: DWord): LongWord; cdecl; external 'AIOUSB.dll';
function DIO_StreamSetClocks(DeviceIndex: LongWord; var ReadClockHz, WriteClockHz: Double): LongWord; cdecl; external 'AIOUSB.dll';

function DIO_SPI_Read(DeviceIndex: LongWord; Address, Reg: Byte; pValue: PByte): LongWord; cdecl; external 'AIOUSB.dll';
function DIO_SPI_Write(DeviceIndex: LongWord; Address, Reg, Value: Byte): LongWord; cdecl; external 'AIOUSB.dll';

function DIO_CSA_DoSync(DeviceIndex: LongWord; var BaseRateHz, DurAms, DurBms, DurCms: Double): LongWord; cdecl; external 'AIOUSB.dll';
function DIO_CSA_DebounceSet(DeviceIndex, DebounceCounts: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function DIO_CSA_DebounceReadAll(DeviceIndex: LongWord; pData: Pointer): LongWord; cdecl; external 'AIOUSB.dll';

function DAC_CSA_SetRangeLimits(DeviceIndex: LongWord; pData: PByte): LongWord; cdecl; external 'AIOUSB.dll';
function DAC_CSA_ClearRangeLimits(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';



function DACDirect(DeviceIndex: LongWord; Channel: Word; Value: Word): LongWord; cdecl; external 'AIOUSB.dll';
function DACMultiDirect(DeviceIndex: LongWord; pDACData: PWord; DACDataCount: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function DACSetBoardRange(DeviceIndex: LongWord; RangeCode: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function DACSetChannelCal(DeviceIndex: LongWord; Channel: LongWord; CalFileName: PChar): LongWord; cdecl; external 'AIOUSB.dll';

function DACOutputProcess(DeviceIndex: LongWord; var ClockHz: Double; NumSamples: LongWord; pSampleData: PWord): LongWord; cdecl; external 'AIOUSB.dll';

function DACOutputOpen(DeviceIndex: LongWord; var ClockHz: Double): LongWord; cdecl; external 'AIOUSB.dll';
function DACOutputClose(DeviceIndex: LongWord; bWait: LongBool): LongWord; cdecl; external 'AIOUSB.dll';
function DACOutputCloseNoEnd(DeviceIndex: LongWord; bWait: LongBool): LongWord; cdecl; external 'AIOUSB.dll';
function DACOutputFrameRaw(DeviceIndex, FramePoints: LongWord; FrameData: PWord): LongWord; cdecl; external 'AIOUSB.dll';
function DACOutputFrame(DeviceIndex, FramePoints: LongWord; FrameData: PWord): LongWord; cdecl; external 'AIOUSB.dll';
function DACOutputSetCount(DeviceIndex, NewCount: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function DACOutputSetInterlock(DeviceIndex: LongWord; bInterlock: LongBool): LongWord; cdecl; external 'AIOUSB.dll';
function DACOutputStart(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';

function DACOutputAbort(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';
function DACOutputStatus(DeviceIndex: LongWord): LongWord; cdecl; external 'AIOUSB.dll';

implementation

end.