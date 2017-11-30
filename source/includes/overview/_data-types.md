## Data Types

### Timestamp

All timestamps are in milliseconds since UNIX epoch. Many endpoints, particularly those relating to the matching engine, will return millisecond timestamps with microsecond precision, encoded as string.

`1511482279491.739`

All date libraries in modern languages should be able to handle this without issue.

### Numbers

We recommend passing all numbers as strings in your requests, instead of integers or floats, to preserve precision and accurate processing.

Numbers returned by the API, particularly decimals, will be returned as strings.