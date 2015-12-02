# SPI Subsystem (0x08)

**This subsystem is not yet supported by the Neblina.**

Features:
* Select a given SPI bus (bus/pin mapping will be documented)
* Support Read to SPI (Parameters: Number of bytes to read).  Response will return the bytes.  Transaction will not de-assert the CS during the access.
* Support Write to SPI (Parameters: Number of bytes to write, Data Bytes...).  Transaction will not de-assert CS during access.

This subsystem will help try out sensors and interfaces by forcing SPI transactions from the tablet or PC host.
It is meant mainly for developpers to be able to try out some sensors without having to code firmware.  It will be limited
in its speed and capabilities, but should help us and many others try out register modifications or other elements without needing
a re-compilation or re-flashing of the device.
