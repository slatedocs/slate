# I2C Subsystem (0x07)

**This subsystem is not yet implemented by the Neblina.**

Features:
* Select a given I2C bus (bus/pin mapping will be documented)
* Support Read to I2C (Parameters: Device bus address, Register offset, number of bytes to read)
* Support Write to I2C (Parameters: Device bus address, Register offset, Number of bytes to write, Bytes...)

This subsystem will help try out sensors and interfaces by pushing the I2C accesses to the tablet or PC host.
It is meant mainly for developpers to be able to try out some sensors without having to code firmware.  It will be limited
in its speed and capabilities, but should help us and many others try out register modifications or other elements without needing
a re-compilation or re-flashing of the device.

