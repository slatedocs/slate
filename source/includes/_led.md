
# LED Data protocol
Subsystem Number: 0x04

## Write LED Value(s)
This command is used to change up to 8 LEDs at a time. You specify the amount of LEDs you want to change and then specify the indices and values following them.

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4|5|6|7|8|(...)|18|19|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x44|0x10|CRC|0x18|Number of LEDs|Index|Value|Index|Value|(...)|Index|Value|


## Read LED Value(s)
This command is used to read the values of up to 8 LEDs at a time. You specify the amount of LEDs you want to know the value of and then specify the indices.

**Command**:

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4|5|(...)|19|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x44|0x10|CRC|0x90|Number of LEDs|Index|(...)|Index|

**Response**:

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4|5|
|:-:|:-:|:-:|:-:|:-:|:-:|
|0x04|0x10|CRC|0x90|Number of LEDs|Value|Value|(...)|Value|

## LED Configuration

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|5-19 (config bytes)|
|:-:|:-:|:-:|:-:|:-:|:-:|
|0x44|0x10|CRC|0x01|Index|Config TBD|

## Examples

### Reading the value of 4 different LEDs.

Reading the values of LEDs #2, #3, #6, #8.

**Command**:

|0|1|2|3|4|5|6|7|8|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x44|0x10|CRC|0x90|0x4|0x2|0x3|0x6|0x8|

**Response**:

|0|1|2|3|4|5|6|7|8|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x44|0x10|CRC|0x90|0x4|0xA5|0xFF|0xFF|0x00|


### Changing the luminosity values of 3 different LEDs. 

Changing the value of LED #2 to 0xFF, LED #4 to 0x00 and LED #7 to 0xA5.

|0|1|2|3|4|5|6|7|8|9|10|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x44|0x10|CRC|0x18|0x3|0x2|0xFF|0x4|0x00|0x7|0xA5|




