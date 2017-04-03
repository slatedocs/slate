## BankClientDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | уникальный идентификатор
firstName | string | 1..1 | имя клиента, например: Иван
lastName | string | 1..1 | фамилия клиента, например: Петров
middleName | string | 0..1 | отчество клиента, например: Андреевич
phoneNumber | string | 0..1 | телефон в международном формате, например 79151234567
email | string | 0..1 | электронная почта клиента
tags | [MarkerDTO](#markerdto) | 0..1 | дополнительные свойства или настройки
