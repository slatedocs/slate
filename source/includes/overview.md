# Symbol Enums

Symbol Enums are replacements for the character based instrument name to a short integer. Symbols Enums are included in almost all Black Ocean messages pertaining to orders, risk management and reporting. Symbol Enums are used to replace hashing functions necessary to ﬁnd either orders, instrument data or risk information normally associated with instruments in most other trading systems. It is essential they be included in the messages which require them. Failure to include them will result in a reject of the message and wrong symbol Enums will result in undeﬁned behavior. Amer the login is complete, the user can send a BOInstrumentRequest message to the OES (Order Entry Server) and will receive back a BOInstrument message which contains all information for each instrument including the symbol name and the symbol Enum for that symbol name. The BOInstrumentRequest and BOInstrument messages will be covered in detail in a subsequent section.

## Current Instruments supported and their corresponding Symbol Enums

| Instrument Name | Symbol Enum |
| --------------- | ----------- |
| BTCUSD          | 1           |
| USDUSDT         | 2           |
| FLYUSDT         | 3           |
| BTCUSDT         | 4           |
