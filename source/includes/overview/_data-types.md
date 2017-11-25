## Data Types

### Timestamp

All timestamps are in milliseconds since UNIX epoch. Many endpoints, particularly those around the matching engine, will return millisecond timestamps with microsecond precision, e.g.

`"1511482279491.739"`

All date libraries in modern languages should be able to handle this without issue.

### Numbers

We recommend passing all numbers as strings, instead of integer or floats, to preserve float precision and processing.

Numbers returned by the API, particularly decimals, will be returned as strings.