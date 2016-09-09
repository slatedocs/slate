## getNearestLocation

Запрос ближайшей к точке локации

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
latitude | string | 1..1 | широта
longitude | string | 1..1 | долгота
**Response:** | | |
location | [WsLocationDTO](#wslocationdto) | 0..1 | локация
