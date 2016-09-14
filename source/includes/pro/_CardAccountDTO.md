## CardAccountDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор продукта
currency | string | 1..1 | текстовый код валюты по [ISO 4217](https://ru.wikipedia.org/wiki/ISO_4217)
runningBalance | [AmountDTO](#amountdto) | 1..1 | доступные средства продукта
--- |||
feeds | [FeedDTO](#feeddto) | 0..1 | элементы ленты событий, например графика платежей по кредиту или затраченные поездки на общественном транспорте
tags | [MarkerDTO](#markerdto) | 0..1 | дополнительные поля
card | [CardDTO](#carddto) | 1..1 | карт, привязанных к счету
hasRequisites | bool | 0..1 | наличие реквизитов для отправки по смс или почте

<aside class="warning">Счет для данного типа не будет отображаться в списке, только пластиковая карта</aside>
