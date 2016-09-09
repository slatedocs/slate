## getNewsFeed

Запрос списка новостей

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
limit | int | 1..1 | ограничитель максимального количества новостей (0 или NULL - без ограничений)
**Response:** | | |
news | [WsNewsDTO](#wsnewsdto) | 0..1 | массив доступных новостей
