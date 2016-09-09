## addCurrencyRate

Добавление курса валют

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
firstCurrency | string | 1..1 | первая валюта
secondCurrency | string | 1..1 | вторая валюта
rateType | [CurrencyRateType](#currencyratetype) | 1..1 | тип курса
buy | string | 1..1 | цена покупки
sell | string | 1..1 | цена продажи
groupName | string | 1..1 | группа валюты
**Response:** | | |
rate | [WsCurrencyRateDTO](#wscurrencyratedto) | 1..1 | курс
