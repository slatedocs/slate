## getBanners

Получение списка всех баннеров

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
**Response:** | | |
banners | [WsBannerDTO](#wsbannerdto) | 0..1 | массив доступных баннеров
lastUpdateTime | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | время последнего обновления данных
sucсess | bool | 0..1 | статус операции
errorMessage | string | 0..1 | текстовое сообщение
