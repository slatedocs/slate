## updateCurrencyRate

Обновление курса валют

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
rateId | string | 1..1 | идентификатор
buy | string | 1..1 | курс покупки
sell | string | 1..1 | курс продажи
**Response:** | | |
rate | [WsCurrencyRateDTO](#wscurrencyratedto) | 1..1 | курс
sucсess | bool | 0..1 | статус операции
errorMessage | string | 0..1 | текстовое сообщение
