## getLocations

Запрос локаций

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
**Response:** | | |
locations | [WsLocationDTO](#wslocationdto) | 0..1 | массив локаций
type | [WsLocationTypeDTO](#wslocationtypedto) | 0..1 | тип локации
services | [WsLocationServiceDTO](#wslocationservicedto) | 0..1 | массив сервисов
sucсess | bool | 0..1 | статус операции
errorMessage | string | 0..1 | текстовое сообщение
