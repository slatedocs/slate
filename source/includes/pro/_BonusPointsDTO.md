## BonusPointsDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор продукта
currency | string | 1..1 | текстовый код валюты по [ISO 4217](https://ru.wikipedia.org/wiki/ISO_4217)
productName | string | 1..1 | название продукта
fxRunningBalance | int | 1..1 | средства на продукте
textMessage | string | 1..1 | описание продукта
--- |||
tags | [MarkerDTO](#markerdto) | 0..1 | дополнительные поля
hasRequisites | bool | 0..1 | наличие реквизитов для отправки по смс или почте
