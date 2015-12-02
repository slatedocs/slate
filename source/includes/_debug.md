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
#define DEBUG_SET_INTERFACE 0x01
```

There is also a single command corresponding to the Debug mode, that is to set the interface protocol between the host and Neblina. By default, the interface is set to BLE, but we can set the interface to UART as well. Here is the command code for setting the interface:

| Packet|
|--------|
| Header: Bytes(0-3) |
| Data (4-7): RESERVED |
|Data (8):|
| * 0x00 MCU receives commands from BLE interface|
| * 0x01 MCU receives commands from the debug UART interface.|

