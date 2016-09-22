## getTransactionsByFilter

```xml
<getTransactionsByFilterResponse>
 <return>
    <balanceOnSinceDate nil="true"/>
    <balanceOnToDate nil="true"/>
    <lastUpdateTime>2015-05-25T21:13:08.000+03:00</lastUpdateTime>
    <transactions type="TransactionDTO">
        #
        # transaction
        #
    </transactions>
    <transactions type="TransactionDTO">
        #
        # transaction
        #
    </transactions>
 </return>
</getTransactionsByFilterResponse>
```

Результатом является список транзакций, отсортированный на мобильном в порядке убывания даты их выполнения

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
productId | string | 1..1 | идентификатор продукта
cardId | string | 0..1 | идентификатор карты
fromIndex | int | 0..1 | начиная с какой позиции нужно передать транзакции (при первом запросе - 0)
count | int | 0..1 | максимальное количество транзакций на странице
transactionId | string | 0..1 | начиная с какой транзакции нужно передать транзакции
**Response:** | | |
transactions | [TransactionDTO](#transactiondto) | 0..1 | список объектов с информацией о транзакциях
lastUpdateTime | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | дата последней по времени транзакции по продукту из запрашиваемого периода
**Exception:** | | |
CardNotExistsException | string | 0..1 | карта с запрошенным cardId не существует
AccountNotExistsException | string | 0..1 | счет с запрошенным productId не существует
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует

<aside class="warning">lastUpdateTime используется для правильной работы с постраничным отображением списка на клиенте и представляет собой в большинстве случаев это время последней транзакции</aside>
