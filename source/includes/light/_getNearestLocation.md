## getNearestLocation

<aside class="success">данный метод применяется для реализации ботов и разного рода сторонних систем</aside>

Запрос ближайшей к точке локации

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
latitude | string | 1..1 | широта
longitude | string | 1..1 | долгота
**Response:** | | |
location | [WsLocationDTO](#wslocationdto) | 0..1 | локация
sucсess | bool | 0..1 | статус операции
errorMessage | string | 0..1 | текстовое сообщение
