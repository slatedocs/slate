## WsCurrencyRateDTO

```xml
<rate type="WsCurrencyRateDTO">
    <id>сurrencyRate_id</id>
    <date>2016-09-08</date>
    <buy>66.03</buy>
    <sell>70.0</sell>
    <firstCurrency>CHF</firstCurrency>
    <secondCurrency>RUB</secondCurrency>
    <groupName>Internet bank exchange</groupName>
    <type>OTHER</type>
</rate>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | уникальный идентификатор операции
date | string | 0..1 | дата
firstCurrency | string | 1..1 | первая валюта
secondCurrency | string | 1..1 | вторая валюта
buy | string | 1..1 | цена покупки
sell | string | 1..1 | цена продажи
type | [CurrencyRateType](#currencyratetype) | 1..1 | тип курса
groupName | string | 0..1 | имя группы

### CurrencyRateType

key | comment
--- | ---:
CENTRAL_BANK | курс центробанка с поддержкой 4 символов после запятой
OTHER | все остальные курсы
