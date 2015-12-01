
# LED Data protocol
Subsystem Number: 0x05

## Write LED Value(s)
This command is used to change up to 8 LEDs at a time. You specify the amount of LEDs you want to change and then specify the indices and values following them.

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4|5|6|7|8|(...)|18|19|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x85|0x10|CRC|0x11|Number of LEDs|Index|Value|Index|Value|(...)|Index|Value|

Example:

|0|  1  |  2  |   3  | 4 |5|  6 |7 |8 |9 |10|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|0x85|0x10|CRC|0x11|3|2|0x00|5|0xFF|9|0x00|

## Read LED Value(s)
Read the value of a LED

Request:

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4|
|:-:|:-:|:-:|:-:|:-:|:-:|
|0x85|0x10|CRC|0x90|Index of LED|

Response:

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4|5|
|:-:|:-:|:-:|:-:|:-:|:-:|
|0x05|0x10|CRC|0x90|Index of LED|Value|

## LED Configuration

|0 (subsystem)|1 (length)|2 (CRC)|3 (command)|4(Index)|5-19 (config bytes)|
|:-:|:-:|:-:|:-:|:-:|:-:|
|0x85|0x10|CRC|0x01|Index|Config TBD|



