
# Digital I/O
Subsystem Number: 0x06

## Set/Get Config

Modify and access the parameters of the GPIOs.

### Packet Structure

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(LED Index)|5(Config)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x81|0x10|CRC|0x01|Index(0-256)|Mode Config|

### Mode Config Byte

|0|1|2|3|4|5|6|7|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Reserved|Reserved|Reserved|Reserved|Reserved|Direction|Mode[1]|Mode[0]|

### Direction codes

|In| Out|
|:-:|:-:|
|0x0| 0x1|

### Mode codes
|Push-Pull|Pull-Down|Pull-Up|
|:-:|:-:|:-:|
|0x0|0x1|0x2|

###Example

Setting the LED #4 to Output Pull-up

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4|5|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x81|0x10|CRC|0x01|4|0x4|0x3|

## Set/Get Value(s)

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(LED Index)|5(direction)|6(Mode)|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x81|0x10|CRC|0x01|Index|In/Out|PU/PD/Push-Pull|

## Notify Set

## Notify Event



