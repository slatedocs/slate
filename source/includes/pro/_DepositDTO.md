## DepositDTO

```xml
<deposits type="DepositDTO">
    <id>deposit_id</id>
    <accountNumber>78595893712734543344</accountNumber>
    <autoRenewal>true</autoRenewal>
    <capitalization>true</capitalization>
    <capitalizationTerm nil="true"/>
    <currency>EUR</currency>
    <fxInterestRate>102342</fxInterestRate>
    <hasRequisites>false</hasRequisites>
    <initialAmount type="AmountDTO">
        <currency>EUR</currency>
        <fxAmount>100000</fxAmount>
    </initialAmount>
    <mainCardId nil="true"/>
    <maturityDate>2013-05-24T00:00:00.000+03:00</maturityDate>
    <openingDate>2012-05-24T00:00:00.000+03:00</openingDate>
    <period>180</period>
    <productName>deposit_name</productName>
    <runningBalance type="AmountDTO">
        <currency>EUR</currency>
        <fxAmount>920723</fxAmount>
    </runningBalance>
    <status>ACTIVE</status>
</deposits>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | уникальный идентификатор
accountNumber | string | 1..1 | номер продукта в банке
currency | string | 1..1 | текстовый код валюты по [ISO 4217](https://ru.wikipedia.org/wiki/ISO_4217)
productName | string | 1..1 | название продукта
runningBalance | [AmountDTO](#amountdto) | 1..1 | средства на продукте
--- |||
feeds | [FeedDTO](#feeddto) | 0..1 | элементы ленты событий, например графика платежей по кредиту или затраченные поездки на общественном транспорте
tags | [MarkerDTO](#markerdto) | 0..1 | дополнительные поля
mainCardId | string | 0..1 | основная карта, привязанная к счету
allCards | [CardDTO](#carddto) | 0..1 | список всех карт, привязанных к счету
hasRequisites | bool | 0..1 | наличие реквизитов для отправки по смс или почте
openingDate | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | дата открытия
period | int | 1..1 | период начисления процентов в месяцах
interestRate | [AmountDTO](#amountdto) | 1..1 | процентая ставка

**deprecated:**

 |||
--- | ---- | :----: | ---:
fxInterestRate | int | 1..1 | 
maturityDate | int | 0..1 | 
contractNumber | string | 0..1 | 
contractStatus | string | 0..1 | 
initialAmount | [AmountDTO](#amountdto) | 0..1 | 
accruedInterest | [AmountDTO](#amountdto) | 0..1 | 
autoRenewal | bool | 0..1 | 
capitalization | bool | 0..1 | 
capitalizationTerm | string | 0..1 | 
status | string | 0..1 | 
