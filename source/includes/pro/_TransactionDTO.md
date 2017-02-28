## TransactionDTO

```xml
<transactions type="TransactionDTO">
    <id>f0dd6cd9-6b38-4a3c-b7b7-9826d3fe4f79</id>
    <authorization>false</authorization>
    <billingAmount type="AmountDTO">
        <currency>RUB</currency>
        <fxAmount>-84900</fxAmount>
    </billingAmount>
    <name>BEELINE</name>
    <description>Оплата BEELINE для телефона +7(910)123-45-67</description>
    <filledFormId>filled_form_id</filledFormId>
    <executionDate>2015-05-25T21:13:08.000+03:00</executionDate>
    <postDate>2015-05-25T21:13:08.000+03:00</postDate>
    <status>ACCEPTED</status>
    <tags nil="true"/>
    <transactionAmount type="AmountDTO">
        <currency>RUB</currency>
        <fxAmount>-84000</fxAmount>
    </transactionAmount>
</transactions>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор операции
name | string | 0..1 | наименование операции
transactionAmount | [AmountDTO](#amountdto) | 1..1 | сумма в валюте операции
billingAmount | [AmountDTO](#amountdto) | 1..1 | сумма в валюте счета
postDate | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | дата создания заявки на проведение операции
executionDate | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 0..1 | дата исполнения операции
description | string | 1..1 | детали операции
status | [TransactionStatus](#transactionstatus) | 1..1 | текущий статус транзакции
isOutgoing | bool | 0..1 | операция переводит деньги СО счета
filledFormId | string | 0..1 | идентификатор соответствующей заполненной формы возвращаемый на запрос [getPaymentForm](#getpaymentform)
tags | [MarkerDTO](#markerdto) | 0..1 | дополнительные поля
authorization | bool | 1..1 | операция авторизации
cardId | string | 0..1 | ID карты, с которой связана данная транзакция
sic | int | 0..1 | mcc код из процессинга для SmartTransaction
bonusPointsAmount | [AmountDTO](#amountdto) | 0..1 | сумма бонусов

### TransactionStatus

key | comment
--- | ---:
POSTED | нет
ACCEPTED | серый
HOLD | желтый
REJECTED | красный
COMPLETE | зеленый
