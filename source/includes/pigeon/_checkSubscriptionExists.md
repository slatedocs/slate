## checkSubscriptionExists

>Request:

```xml
<checkSubscriptionExists>
    <user>login_1</user>
</checkSubscriptionExists>
 ```

>Response:

```xml
<checkSubscriptionExistsResponse xmlns="http://inbound.sbi.pigeon.idamobile.com/">
   <return>
      <status>OK</status>
      <exists>true</exists>
   </return>
</checkSubscriptionExistsResponse>
```

Проверка состояния подписки нескольких пользователей

key | type | status | comment
--- | --- | :---: | ---:
**Request:** | | |
user | string | 1..1 | уникальный идентификатор пользователя
**Response:** | | |
status | [status](#status) | 1..1 | статус сервера по доставке
errorMessage | string | 0..1 | описание возможной ошибки
exists | bool | 1..1 | наличие пользователя в базе получателей пушей
