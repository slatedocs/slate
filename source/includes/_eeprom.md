# EEPROM APIs
###########################
The ProMotion board features an EEPROM with 2Kbytes of memory available for the application.

### eepromRead()
This function commands a single page read for the EEPROM subsystem, where the page number should be provided as an input argument. Each page contains 8 bytes.

### eepromWrite()
This function commands a write transaction to the EEPROM subsystem for a single page. The page number and the 8-byte content of the page to be written should be provided as input arguments.
