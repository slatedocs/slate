# Storage (NOR Flash Recorder 0x0B)

The NOR flash recorder exists only on the ProMotion board and it uses subsystem ID 0x0B. Regarding this subsystem a number of commands exist, which are listed below:

```c 
#define FlashEraseAll 0x01 //erasing the on-chip recorder
#define FlashRecordStartStop 0x02 //start/stop a recording session
#define FlashPlaybackStartStop 0x03 //start/stop playing back from the recorder
```

Note that the above commands are placed within the header section of the packet in Byte#3.

## Data Section
The data section consists of 16 bytes. The first 4 bytes (Byte 4-7) and the last 9 bytes (Byte 11-19) are always reserved in the NOR flash subsystem. However, the other bytes might be used differently depending on the command field, which is explained next.

#### FlashEraseAll Command/Response
In the command mode, the packet commands Neblina to do a full-erase for the on-chip NOR flash memory. This takes about 2 minutes to complete. Here is the command packet:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command)  |Byte 4-19|
|:------------------:|:---------------:|:------------:|:------------------:|:-------:|
|        0x4B        |       0x10      |      CRC     |0x01 (FlashEraseAll)|Reserved |

In response, Neblina will first send an acknowledge packet to indicate the successful receipt of the command issued by the host. Next, when the erasing process completes, Neblina will send a "process completed" packet back to the host as follows:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command)  | Bytes 4-19 |
|:------------------:|:---------------:|:------------:|:------------------:|------------|
|        0x0B        |       0x10      |      CRC     |0x01 (FlashEraseAll)|  Reserved  |


#### FlashRecordStartStop Command/Response
In the command mode, the packet commands Neblina to either start a new recording session, or close the currently open one. Byte#8 will be a Boolean value representing the start (1) or stop (0) command. Here is the full command packet:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) | Byte 3 (command) |Byte 4-7|  Byte 8  | Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:----------------:|:------:|:--------:|------------|
|        0x4B        |       0x10      |      CRC     |0x02 (FlashRecord)|Reserved|start/stop|  Reserved  |

In response, after sending the acknowledge packet to indicate the receipt of the command, Neblina will send a single packet confirming the recording session number that has been created/closed. Byte#4 will be a Boolean value representing the creation (1) or closure (0) of the recording session. The session number is also a 16-bit unsigned integer packed into two bytes in little endian format (Byte 9-10). Here is the full response packet:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2|Byte 3 (command)| Byte 4-7 |   Byte 8   |Byte 9-10 |Bytes 11-19|
|:----------------:|:-------------:|:----:|:--------------:|:--------:|:----------:|:--------:|:---------:|
|       0x0B       |      0x10     | CRC  |      0x02      | Reserved |create/close|Session ID|  Reserved |

#### FlashPlaybackStartStop Command/Response
In the command mode, the packet commands Neblina to either open a previously recorded session for playback or close the one that is currently open and being played. Byte#8 will be a Boolean value representing the open (1) or close (0) mode. If the mode is to close the current session, then, no session number is needed to be provided. Otherwise, in the opening mode, Byte#9-10 will include the session ID number as a 16-bit unsigned integer value. It is notable that in the opening mode, if the session ID is set to 0xFFFF, then Neblina will open the last recorded session. Here is the full command packet:

| Byte 0 | Byte 1 |Byte 2|  Byte 3 (command)  |Byte 4-7|  Byte 8  |Byte 9-10 (open mode)|Bytes 11-19|
|:------:|:------:|:----:|:------------------:|:------:|:--------:|:-------------------:|:---------:|
|  0x4B  |  0x10  | CRC  |0x03 (FlashPlayback)|Reserved|open/close|Session ID (Byte#8=1)| Reserved  |

In response, Neblina will first send an acknowledge packet to indicate the receipt of the command. Next, for opening a session for playback, Neblina will only send an error packet to the host, if the session opening has failed, e.g., due to an invalid session number request. If the session opening has been successful, Neblina will not send an acknowledge packet to the host, since the playback data being streamed to the host will virtually confirm this matter. Here is the error packet response to an invalid request to open a particular Session ID. Note that the most-significant bit of the first byte, i.e., error flag, is set to 1:

| Byte 0 | Byte 1 (length) |Byte 2|  Byte 3 (command)  |Byte 4-7|   Byte 8  |Byte 9-10 |Bytes 11-19|
|:------:|:---------------:|:----:|:------------------:|:------:|:---------:|:--------:|:---------:|
|  0x8B  |       0x10      | CRC  |0x03 (FlashPlayback)|Reserved|0x01 (open)|Session ID| Reserved |

If the playback is successful, whenever we reach the end of the session, where there is no more data to be streamed to the host, Neblina will send a completion status packet to the host as follows:

| Byte 0 | Byte 1 (length) |Byte 2|  Byte 3 (command)  |Byte 4-7|      Byte 8      | Bytes 9-19 |
|:------:|:---------------:|:----:|:------------------:|:------:|:----------------:|:----------:|
|  0x0B  |       0x10      | CRC  |0x03 (FlashPlayback)|Reserved|0 (session closed)|  Reserved  |
