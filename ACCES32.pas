unit ACCES32;

interface

uses Windows;

//8-bit
function InPortB(Port: DWord): Word; cdecl; external 'ACCES32.dll';
function OutPortB(Port: DWord; Value: Byte): Word; cdecl; external 'ACCES32.dll';
//16-bit
function InPort(Port: DWord): Word; cdecl; external 'ACCES32.dll';
function OutPort(Port: DWord; Value: Word): Word; cdecl; external 'ACCES32.dll';
//32-bit
function InPortL(Port: DWord): DWord; cdecl; external 'ACCES32.dll';
function OutPortL(Port: DWord; Value: DWord): Word; cdecl; external 'ACCES32.dll';
function InPortDWord(Port: DWord): DWord; cdecl; external 'ACCES32.dll';
function OutPortDWord(Port: DWord; Value: DWord): Word; cdecl; external 'ACCES32.dll';

type
  TPCI_COMMON_CONFIG = record
    VendorID : word;
    DeviceID : word;
    Command : word;
    Status : word;
    RevisionID : byte;
    ProgIf : byte;
    SubClass : byte;
    BaseClass : byte;
    CacheLineSize : byte;
    LatencyTimer : byte;
    HeaderType : byte;
    BIST : byte;
    BaseAddresses : Array[0..5] of dword;
    Reserved1 : Array[0..1] of dword;
    RomBaseAddress : dword;
    Reserved2 : Array[0..1] of dword;
    InterruptLine : byte;
    InterruptPin : byte;
    MinimumGrant : byte;
    MaximumLatency : byte;
  end;

implementation

end.
 