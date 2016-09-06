## DepositDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор продукта
accountNumber | string | 1..1 | номер продукта в банке
currency | string | 1..1 | текстовый код валюты счета по [ISO 4217](https://ru.wikipedia.org/wiki/ISO_4217)
productName | string | 1..1 | название продукта
fxInterestRate | int | 1..1 | средства на продукте
--- |||
feeds | [FeedDTO](#feeddto) | 0..1 | элементы ленты событий, например графика платежей по кредиту или затраченные поездки на общественном транспорте
tags | [MarkerDTO](#markerdto) | 0..1 | дополнительные поля
mainCard | string | 0..1 | основная карта, привязанная к счету
allCards | [CardDTO](#carddto) | 0..1 | список всех карт, привязанных к счету
hasRequisites | bool | 0..1 | наличие реквизитов для отправки по смс или почте

**deprecated:**

 |||
--- | ---- | :----: | ---:
runningBalance | [AmountDTO](#amountdto) | 0..1 | 
openingDate | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | 
period | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | 
interestRate | [AmountDTO](#amountdto) | 1..1 | 
maturityDate | int | 0..1 | 
contractNumber | string | 0..1 | 
contractStatus | string | 0..1 | 
initialAmount | [AmountDTO](#amountdto) | 0..1 | 
accruedInterest | [AmountDTO](#amountdto) | 0..1 | 
autoRenewal | bool | 0..1 | 
capitalization | bool | 0..1 | 
capitalizationTerm | string | 0..1 | 
status | string | 0..1 | 
