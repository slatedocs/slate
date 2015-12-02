# Power Management API (0x02)

#### Power Management Data Section
Regarding the power management's single command, the data consists of only 2 valid bytes (Byte#8-9), representing the percentage of the battery level with one decimal fractional digit precision, i.e., an unsigned integer within the range of [0, 1000]:
###### Byte#8: battery level (%), Least Significant Byte (LSB)
###### Byte#9: battery level (%), Most Significant Byte (MSB)
