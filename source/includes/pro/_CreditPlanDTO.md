## CreditPlanDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор кредитного плана
amount | AmountDTO | 1..1 | сумма с указанием валюты
paymentDate | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | дата платежа
status | [CreditPlanStatus] | 1..1 | состояние платежа (PENDING, COMPLETED, OVERDUE)
rateAmount | Amount | 0..1 | ???