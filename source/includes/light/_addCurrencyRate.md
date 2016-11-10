## addCurrencyRate

```xml
<addCurrencyRate>
    <rate type="WsCurrencyRateDTO">
        #
        # rate
        #
    </rate>
</addCurrencyRate>
```

Добавление курса валют

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
rate | [WsCurrencyRateDTO](#wscurrencyratedto) | 1..1 | курс
**Response:** | | |
rate | [WsCurrencyRateDTO](#wscurrencyratedto) | 1..1 | курс
sucсess | bool | 0..1 | статус операции
errorMessage | string | 0..1 | текстовое сообщение
