# Debug subsystem (0x00)

**Important: this subsystem is used to support debug modes of Neblina.  Programmers should not rely on those functions for 
production code.  However, it can be very useful to validate custom protocols, error rates, performance monitors, memory usage, etc.**

## Motivation

Observability and controllability are essential components of the debugging process.  Bugs in distributed systems
such as sensor networks, remotely connected systems are notoriously more difficult to diagnose because when the code
misbehaves, the root cause can be hidden very deep.  By implementing small trace buffers, event counters, error counters,
one can essentially add important visibility into those systems.  This is the reason that this subsystem is implemented
at the core of Neblina.

## Commands

### Debug - Set Interface (0x01)

```c 
#define DEBUG_CMD_SET_INTERFACE 0x01
```

There is also a single command corresponding to the Debug mode, that is to set the interface protocol between the host and Neblina. By default, the interface is set to BLE, but we can set the interface to UART as well. Here is the command code for setting the interface:

| Packet|
|--------|
| Header: Bytes(0-3) |
| Data (4-7): RESERVED |
|Data (8):|
| * 0x00 MCU receives commands and responds to them through the BLE interface|
| * 0x01 MCU receives commands and responds to them through the debug UART interface.|

In response, Neblina will send an acknowledge packet to the host to confirm the successful receipt of the command.

### Debug - Check Motion Engine and Flash Recorder States (0x02)

```c 
#define DEBUG_CMD_MOTENGINE_RECORDER_STATUS 0x02
```

In the command mode, the host can send this packet to Neblina to inquire what streaming options are active on Neblina, and whether the flash recording or playback is ON or not. The command packet is as follows:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|            Byte 3 (command)          |Byte 4-19|
|:----------------:|:-------------:|:----------:|:------------------------------------:|:-------:|
|       0x40       |      0x10     |     CRC    |0x02 (motion engine & recorder states)|Reserved |

In the response mode, Neblina will first send an acknowledge packet to the host to confirm the successful receipt of the command. Next, the main response packet will be prepared, where Byte#4-7 is reserved, while Byte#8-11 represent the 32-bit motion engine status register, and Byte#12 will show the flash recorder state. Byte#13-19 are also reserved. The full response packet is as follows:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|Byte 3 (command)|Byte 4-7 |     Byte 8-11      |    Byte 12    |Byte 13-19|
|:----------------:|:-------------:|:----------:|:--------------:|:-------:|:------------------:|:-------------:|:--------:|
|       0x0        |     0x10      |    CRC     |      0x02      |Reserved |Motion Engine Status|Recorder Status| Reserved |

The motion engine and recorder status registers are described next.

##### Motion Engine Status Register (32-bit register, Byte#8-11):
Here is the bit-field declaration for this register:

|Byte 11-9| Byte 9 | Byte 8 |Byte 8|Byte 8| Byte 8 |  Byte 8  |Byte 8|Byte 8| Byte 8 |
|:-------:|:------:|:------:|:----:|:----:|:------:|:--------:|:----:|:----:|:------:|
|Bits 31:9|  Bit 8 |  Bit 7 |Bit 6 |Bit 5 | Bit 4  |  Bit 3   |Bit 2 |Bit 1 |  Bit 0 |
|:-------:|:------:|:------:|:----:|:----:|:------:|:--------:|:----:|:----:|:------:|
|Reserved |SitStand|MAG_data|Steps |Motion|IMU_data|Quaternion|Euler |Force |Distance|

Each bit-field shows whether the corresponding motion engine feature has been enabled for streaming (1) or not (0).

##### Flash Recorder/Playback Status Register (Byte#12):
Here is the status value regarding the flash recorder:
```c 
Byte#12 = { 0x00 (Idle state), 0x01 (Playing back), 0x02 (Recording), 0x03-0xFF (unused) } 
```

