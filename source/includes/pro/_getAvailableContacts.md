## getAvailableContacts

> Request:

```xml
<getAvailableContacts>
   <request>
      <bankClientId>bank_client_id</bankClientId>
      <contacts>79178842393</contacts>
      <contacts>79160369523</contacts>
      <lastUpdateTime xsi:nil="true" />
   </request>
</getAvailableContacts>
```

> Response:

```xml
<getAvailableContactsResponse>
   <return>
      <contacts>79600568810</contacts>
      <contacts>79162616444</contacts>
      <contacts>79035678752</contacts>
      <contacts>79163218216</contacts>
      <lastUpdateTime>2016-11-03T12:00:00.000+03:00</lastUpdateTime>
   </return>
</getAvailableContactsResponse>
```

Запрос на получение списка контактов, доступных для перевода

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
contacts | string | 1..1 | массив номеров телефонов из телефонной книжки клиента
lastUpdateTime | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | время последнего обновления данных на клиенте
**Response:** | | |
contacts | string | 0..1 | массив номеров телефонов, представляющий из себя пересечение имеющихся контактов клиентов банка и телефонной книжки клиента
lastUpdateTime | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | время последнего обновления данных на клиенте
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует

<aside class="warning">Активация данного функционала происходит при наличии формы c типом ``TRANSFER_BY_PHONE`` (на форме должно быть минимум одно поле c типом ``PHONE`` или ``SINGLE_LINE_TEXT``)</aside>
