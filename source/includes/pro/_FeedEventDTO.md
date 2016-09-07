## FeedEventDTO

Элемент ленты

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
fields | [FeedField](#feedfield) | 0..1 | массив, содержащая расширяемый список параметров для конкретного события, мапится ключами на [TransactionDTO](#transactiondto)

### FeedField

key | type | status | comment
--- | ---- | :----: | ---:
key | string | 1..1 | ключ
value | string | 1..1 | значение
