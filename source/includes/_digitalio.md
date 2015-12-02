
# Digital I/O
Subsystem Number: 0x04

## Set/Get Config

Modify and access the parameters of the GPIOs.

### Packet Structure

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(LED Index)|5(Config)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x46|0x10|CRC|0x01|Index(0-256)|Mode Config|

### Mode Config Byte

|Bit 7|Bit 6|Bit 5|Bit 4|Bit 3|Bit 2:1|Bit 0|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Reserved|Reserved|Reserved|Reserved|Reserved|Mode[1]|Mode[0]|Direction|

### Direction codes

|In|Out|
|:-:|:-:|
|0x0|0x1|

### Mode codes
|Floating|Pull-Down|Pull-Up|Push-Pull
|:-:|:-:|:-:|:-:|
|0x0|0x1|0x2|0x3|

###Example

Setting the LED #5 to Output Pull-up

|0|1|2|3|4|5|
|:-:|:-:|:-:|:-:|:-:|:-:|
|0x46|0x10|CRC|0x01|0x5|0x4|

## Set/Get Value(s)

Setting and getting the GPIO value.

### Set Value Packet Structure

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|5(Value)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x46|0x10|CRC|0x02|Index|LED Value|

### Get Value Packet Structure

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|5(Value)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x46|0x10|CRC|0x02|Index|LED Value|

## Signal Change Notification

### Notify Set Packet Structure

A packet will be sent when a change in the input signal has been detected.

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|5(On/Off)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x46|0x10|CRC|0x02|Index|On/Off|

### Notify Event Packet Structure

When a edge has triggered this event, the application receives a notification that it has happened with the index of the pin that has been triggered.

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x46|0x10|CRC|0x02|Index|


