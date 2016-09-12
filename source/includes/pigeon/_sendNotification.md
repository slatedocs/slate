## sendNotification

>Request:

```xml
<sendNotification>
   <notification>
      <details>
         #
         # details
         #
      </details>
      <id>push_id</id>
      <pushContent>
         #
         # pushContent
         #
      </pushContent>
      <recipients>login_1</recipients>
      <recipients>login_2</recipients>
      <timeout>1000</timeout>
   </notification>
</sendNotification>
```

>Response:

```xml
<sendNotificationResponse xmlns:ns2="http://inbound.sbi.pigeon.idamobile.com/">
   <return>
      <status>OK</status>
      <deliveryStatus>
         <entry>
            <key>login_1</key>
            <value>QUEUED</value>
         </entry>
         <entry>
            <key>login_2</key>
            <value>INVALID_SUBSCRIPTION</value>
         </entry>
      </deliveryStatus>
   </return>
</sendNotificationResponse>
```

Отправка PUSH нотификации

key | type | status | comment
--- | --- | :---: | ---:
**Request:** | | |
id | string | 1..1 | уникальный идентификатор
recipients | string | 1..1 | получатели сообщения
timeout | int | 1..1 | время жизни сообщения в секундах
pushContent | [pushContent](#pushcontent) | 1..1 | обязательная часть пуш сообщения
pushDetails | [pushDetails](#pushdetails) | 0..1 | дополнительные детали запрашиваемые мобильным устройством по необходимости
**Response:** | | |
status | [status](#status) | 1..1 | статус сервера по доставке
errorMessage | string | 0..1 | описание возможной ошибки
deliveryStatus | [deliveryStatus](#deliverystatus) | 0..1 | результат отправки сообщения

### status

Общее сообщение с результатом выполнения команды

key | comment
--- | ---:
OK | операция выполнена успешно
ENTITY_NOT_FOUND | объект, над которым требуется выполнить операцию удален или не существовал
DUPLICATED_ENTITY | идентификатор уже был использован ранее
INTERNAL_SERVER_ERROR | внутренняя ошибка сервера

### deliveryStatus

Статус доставки PUSH-уведомления

key | comment
--- | ---:
QUEUED | уведомление принято сервером и ожидает отправки (первый признак у сообщения, технического толка)
SENT | уведомление отправлено
SENDING_FAILED | ошибка отправки уведомления
DELIVERED | уведомление доставлено на мобильный
READ| уведомление прочитано пользователем
INVALID_SUBSCRIPTION | неверный код подписки (user_id отменил подписку)
EXPIRED | сообщение не удалось отправить и дальнейшие попытки отправки не предпринимаются из-за истекшего timeout
