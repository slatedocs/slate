
# LED Data protocol
Subsystem Number: 0x04

|Command|Code|
|:-:|:-:|
|Set Value|**0x01**|
|Get Value|**0x02**|
|Set Config|**0x03**|
|Get Config|**0x04**|

## Set LED Value(s)
This command is used to change up to 8 LEDs at a time. You specify the amount of LEDs you want to change and then specify the indices and values following them.

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4|5|6|7|8|(...)|18|19|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x44|0x10|CRC|0x01|Number of LEDs|Index|Value|Index|Value|(...)|Index|Value|


## Get LED Value(s)
This command is used to read the values of up to 8 LEDs at a time. You specify the amount of LEDs you want to know the value of and then specify the indices.

**Command**:

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|
|:-:|:-:|:-:|:-:|
|0x44|0|CRC|0x02|

**Response**:

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4|...|11|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x04|8|CRC|0x02|Led0 value|...|LED8 value|

## Set LED Configuration

**Command**:

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|5-19 (config bytes)|
|:-:|:-:|:-:|:-:|:-:|:-:|
|0x44|0x10|CRC|0x03|Index|Config TBD|

## Get LED Configuration

**Command**:

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|
|:-:|:-:|:-:|:-:|:-:|:-:|
|0x44|0x10|CRC|0x04|Index|

**Response**:

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|
|:-:|:-:|:-:|:-:|:-:|:-:|
|0x44|0x10|CRC|0x04|Index|Config TBD|


## Examples

### Reading the LED values.

Reading the values of LEDs

**Command**:

|0|1|2|3|
|:-:|:-:|:-:|:-:|
|0x44|0|CRC|0x02|

**Response**:

|0|1|2|3|4|5|6|7|8|9|10|11|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x44|8|CRC|0x02|4|122|255|255|0|0|0|0|

Led0 & Led1 are dimmed

Led2 & Led3 are full on

Led4-Led7 are off


### Changing the luminosity values of 3 different LEDs. 

Changing the value of LED #2 to 0xFF, LED #4 to 0x00 and LED #7 to 0xA5.

|0|1|2|3|4|5|6|7|8|9|10|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x44|0x10|CRC|0x18|0x3|0x2|0xFF|0x4|0x00|0x7|0xA5|




