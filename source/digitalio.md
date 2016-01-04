# Digital I/O
Subsystem Number: 0x03

List of commands:
* Set Config: **0x01**
* Get Config: **0x02**
* Set Value: **0x03**
* Get Value: **0x04**
* Notify Set: **0x05**
* Notify Event: **0x06**

## Set/Get Config

Modify and access the parameters of the Digital I/Os.

### Packet Structure

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(LED Index)|5(Config)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x43|0x10|CRC|0x01|Index|Mode Config|

### Mode Config Byte

|Bit 7:3|Bit 2:1|Bit 0|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Reserved|Mode[1:0]|Direction|

### Direction codes

|In|Out|
|:-:|:-:|
|0x0|0x1|

### Mode codes
|Floating|Pull-Down|Pull-Up|Push-Pull|
|:-:|:-:|:-:|:-:|
|0x0|0x1|0x2|0x3|

## Set/Get Value(s)

Setting and getting the GPIO value.

### Set Value Packet Structure

Setting the value of the Digital I/O pin to either '0' or '1'.

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|5(Value[0])|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x43|0x10|CRC|0x03|Index|(0/1)|

### Get Value Packet Structure

Getting the current value of the Digital I/O pin.

Command:

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x43|0x10|CRC|0x04|Index|

Response:

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|5(Value[0])|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x03|0x10|CRC|0x04|Index|(0/1)|


## Signal Change Notification

### Notify Set Packet Structure

A packet will be sent when a change (either edge) in the input signal has been detected.

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|5(Off/On)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x43|0x10|CRC|0x05|Index|Off/On|

### Notification activation codes

|Off|On|
|:-:|:-:|
|0x0|0x1|


### Notify Event Packet Structure

When a edge has triggered this event, the application receives a notification that it has happened with the index of the pin that has been triggered.

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x03|0x10|CRC|0x06|Index|

## Examples

### Setting Pin Config and Output Value Example

Configuring pin #5 to output push-pull and setting the I/O value #5 to output **1** (need two packets)

|Description|0|1|2|3|4|5|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Set Config Command|0x43|0x10|CRC|0x01|0x5|0x4|
|Drive Output Command|0x43|0x10|CRC|0x03|0x5|0x1|

### Read Value Example

Reading the value of Digital I/O #4

|Description|0|1|2|3|4|5|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Get Value Command|0x43|0x10|CRC|0x04|0x4|
|Get Value Response|0x03|0x10|CRC|0x04|0x4|0x1|

### Event Notification Example

Make a notification happen when there is an signal transition on pin #7. There is then a notification that a transition has occured on pin #7.

|Description|0|1|2|3|4|5|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Notify Set Command|0x43|0x10|CRC|0x03|0x05|0x1|
|Notify Event Response|0x03|0x10|CRC|0x06|0x7|


