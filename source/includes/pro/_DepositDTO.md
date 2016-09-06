## DepositDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор счета
accountNumber | string | 1..1 | номер счета в банке
status | string | 0..1 | статус депозита;
currency | string | 1..1 | текстовый код валюты счета по ISO 4217
productName | string | 1..1 | название счета
runningBalance | [AmountDTO](#amountdto) | 0..1 | основная карта, привязанная к счету
feeds | [FeedDTO](#feeddto) | 0..1 | элементы ленты событий
tags | [MarkerDTO](#markerdto) | 0..1 | дополнительные поля
mainCard | string | 0..1 | основная карта, привязанная к счету
allCards | [CardDTO](#carddto) | 0..1 | список всех карт, привязанных к счету
hasRequisites | bool | 0..1 | наличие реквизитов для отправки по смс или почте
openingDate | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | дата открытия счета
period | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | период начисления процентов в месяцах
interestRate | [AmountDTO](#amountdto) | 1..1 | процентая ставка
