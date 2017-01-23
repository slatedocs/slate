## getAccountRequisites

```xml
<getAccountRequisitesResponse>
   <return>
      <account>40729849234823</account>
      <bank>АКБ "БТА - КАЗАНЬ" (ОАО)</bank>
      <bankAccount>12312312313</bankAccount>
      <beneficaryName>Котов К.К.</beneficaryName>
      <bic>04929384</bic>
      <details>Для перевода используйте подручные средства</details>
      <taxpayerId>16612828282</taxpayerId>
   </return>
</getAccountRequisitesResponse>
```

Запрос на получение дополнительной информации о продукте при отправке на почту или смс

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
productId | string | 1..1 | идентификатор продукта
cardId | string | 0..1 | идентификатор карты
**Response:** | | |
bank | string | 0..1 | Наименование банка
bankAccount | string | 0..1 | Идентификатор банковского счета
bic | string | 0..1 | БИК
beneficaryName | string | 0..1 | Наименование бенифициара
taxpayerId | string | 0..1 | ИНН
account | string | 0..1 | Идентификатор счёта
bankswift | string | 0..1 | СВИФТ банка
corbank | string | 0..1 | Банк-корреспондент
corswift | string | 0..1 | СВИФТ Банк-корреспондента
details | string | 0..1 | Дополнительная информация
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
