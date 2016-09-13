## FeedEventDTO

```xml
<feedEvents type="FeedEventDTO">
    <fields>
        <key>name</key>
        <value>Очередной платеж</value>
    </fields>
    <fields>
        <key>fxAmount</key>
        <value>10003401</value>
    </fields>
    <fields>
        <key>postDate</key>
        <value>1398470400000</value>
    </fields>
    <fields>
        <key>currency</key>
        <value>USD</value>
    </fields>
    <id>feed_event_id</id>
</feedEvents>
```

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

<aside class="success">Любое событие поддерживает ключи из TransactionDTO</aside>
