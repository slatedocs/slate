﻿# Административное API


## Аутентификация

На тестовой системе созданы 2 пользователя от имени которых возможен вызов административного API.

| Логин      | Пароль  | Роли пользователя |
| :--------  |:------- |:------------------|
| user       | user    | user              |
| admin      | admin   | admin             |

## Получение всех кошельков проекта

### Параметры

* `page` - номер (начиная с 0) страницы, которую запрашивает клиент, опционально, по умолчанию 0
* `size` - размер страницы, которую запрашивает клиент, опционально, по умолчанию 35
* `sort` - поле для сортировки. Можно указать несколько полей через запятую, например: `amount,createdAt`. Можно указать направление через запятую, например: `amount,desc`

### Поля для сортировки:

- `paymentCount` - по количеству платежей 
- `turnover` - по обороту 
- `activeCardCount` - по количеству привязанных карт 
- `totalCardCount` - по количеству привязанных карт (с уже удаленными) 
- `createdAt` - по дате регистрации
- `amount` - по остаткам

### Фильтры:

- `ipAddress` - по ip адресу
- `givenName` `familyName` `patronymicName` - по ФИО, поиск полного совпадения или совпадения в начале
- `phone` - по номеру телефона, поиск полного совпадения или совпадения в начале
- `cardNumber` - по бин+номер карты - чтобы искать пользователей, у которых была привязана эта же карта, поиск любых совпадений внутри номера
- `active` - по статусу активации (true|false)

```shell
$ curl -uadmin:admin "https://www.synq.ru/mserver2-dev/admin/wallets?familyName=арсен&active=true&sort=paymentCount,desc"
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : [ {
    "phone" : "+380503839001",
    "amount" : 8598.17,
    "name" : "Алексей Арсеньев",
    "verified" : false,
    "enabled" : true,
    "active" : true,
    "role" : "user",
    "created_at" : "2014-08-20T15:10:25.943Z",
    "last_month_payments_count" : 134,
    "turnover" : 1401.84,
    "payment_count" : 197,
    "active_card_count" : 0,
    "total_card_count" : 0
  }, {
    "phone" : "+12345675578",
    "amount" : 10000,
    "name" : "Алексей Арсеньев",
    "verified" : true,
    "enabled" : true,
    "active" : true,
    "role" : "user",
    "created_at" : "2014-08-05T13:42:34.745Z",
    "last_month_payments_count" : 8,
    "turnover" : 0,
    "payment_count" : 9,
    "active_card_count" : 0,
    "total_card_count" : 0
  } ]
}
```

## Загрузка кошелька

```shell
$ curl -uuser:user "https://www.synq.ru/mserver2-dev/admin/wallets/%2B79260000006"
```

```json
{
   "meta":{
      "code":200
   },
   "data":{
      "phone":"+79260000006",
      "amount":65572.14,
      "verified":false,
      "enabled":true,
      "active":true,
      "role":"user",
      "created_at":"2014-06-01T12:43:52.876Z",
      "limits":{
         "in_amount_limit":15000,
         "out_amount_limit":15000,
         "wallet_amount_limit":15000,
         "in_monthly_turnover_limit":40000,
         "out_monthly_turnover_limit":40000,
         "active_cards_limit":10
      },
      "in_last_month_turnover":0,
      "out_last_month_turnover":0
   }
}
```

## Блокировка кошелька

### Параметры

* `message` - сообщение для пользователя кошелька, объясняющее причину блокировки и как дальше жить
* `reason` - сообщение для сотрудников проекта о причине блокировки (не видно клиенту)

```shell
$ curl -uuser:user  -H 'Content-type:application/json' --data '{"message": "Заблокирован до выяснения.", "reason": "Клиент - кардер." }' "https://www.synq.ru/mserver2-dev/admin/wallets/%2B12345657367/disable"
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {
    "phone" : "+12345657367",
    "amount" : 10000,
    "reset_password" : false,
    "lock_message" : "Заблокироваан до выяснения.",
    "verified" : false,
    "enabled" : false,
    "active" : true,
    "lock_reason" : "Клиент - кардер."
    "locked_at" : "2014-08-14T16:46:42.122Z"
  }
}
```

## Разблокировка кошелька

```shell
$ curl -uuser:user -X POST "https://www.synq.ru/mserver2-dev/admin/wallets/%2B12345657367/enable"
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {
    "phone" : "+12345657367",
    "amount" : 10000,
    "reset_password" : false,
    "verified" : false,
    "enabled" : true,
    "active" : true
  }
}
```

## Получение платежей кошелька

### Параметры

* `wallet` - обязательный параметр, телефон кошелька чьи платежи мы хотим видеть
* `type` - фильтр по типу платежа, допускается указание нескольких значений разделенный запятыми, опционально
* `status`- фильтр по статусу платежа, допускается указание нескольких значений разделенный запятыми, опционально
* `service` - идентификатор сервиса, опционально
* `amount_from`и `amount_to` - границы диапазона сумм платежей, опционально
* `date_from` и `date_to` - границы диапазона дат создания платежей, опционально
* `page` - номер (начиная с 0) страницы, которую запрашивает клиент, опционально, по умолчанию 0
* `size` - размер страницы, которую запрашивает клиент, опционально, по умолчанию 35

```shell
$ curl -uuser:user "https://www.synq.ru/mserver2-dev/admin/wallets/%2B79260000006/payments?type=out&status=created&amount_from=0.5&amount_to=1&date_from=2014-08-01T12:10:15.525Z&date_to=2014-08-11T00:00:00.00Z&service=1"
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : [ {
    "id" : 1401089240212,
    "client_payment_id" : "c131a7e2-c553-4295-867e-1023359bee28",
    "amount" : 1,
    "total" : 4.01,
    "created_at" : "2014-08-01T12:20:15.525Z",
    "status" : "created",
    "type" : "out",
    "service" : {
      "id" : 1,
      "name" : "Мегафон"
    },
    "parameters" : [ {
      "code" : "phoneNumber",
      "name" : "№ телефона (10 цифр)",
      "value" : "9157101280"
    } ],
    "outbound" : {
      "id" : 35,
      "code" : "tpr_out",
      "name" : "ООО ТПР (провайдер)"
    }
  } ]
}
```
## Отчет об обороте кошелька по дням

```shell
$ curl -uuser:user "https://www.synq.ru/mserver2-dev/admin/wallets/%2B79260000006/turnover?from=2014-05-01&to=2014-06-03"
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : [ {
    "tick" : "2014-06-01",
    "amount" : 125477.16
  }, {
    "tick" : "2014-06-02",
    "amount" : 0
  }, {
    "tick" : "2014-06-03",
    "amount" : 0
  } ]
}
```

## Отчет об остатке кошелька по дням

```shell
$ curl -uuser:user "https://www.synq.ru/mserver2-dev/admin/wallets/%2B79260000006/balance?from=2014-07-11&to=2014-07-13"
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : [ {
    "tick" : "2014-07-11",
    "amount" : 55572.14
  }, {
    "tick" : "2014-07-12",
    "amount" : 55572.14
  }, {
    "tick" : "2014-07-13",
    "amount" : 55572.14
  } ]
}
```

## Удаление кошелька

<aside class="warning">Команда работает только на dev сервере</aside>

```shell
$ curl -u+user:user -X DELETE https://www.synq.ru/mserver2-dev/admin/wallets/+79260000006
```

```json
{
  "meta" : {
    "code" : 200
  }
}
```

## Изменение статуса персональных данных

### Параметры

* `wallet` - номер телефона в международном формате
* `statue` - `DATA_ENTERED | DATA_VERIFIED` статус персональных данных

```shell
$ curl  -H 'Content-type:application/json' -uuser:user -d '{"status": "DATA_VERIFIED"}' "https://www.synq.ru/mserver2-dev/admin/wallets/%2B79260000006/update_status" 
```

> Результат содержит `"status": "data_verified", "verified_at": "2014-10-22T10:26:12.035Z"`

```json
{
    "meta": {
        "code": 200
    },
    "data": {
        "family_name": "Иванов",
        "given_name": "Иван",
        "patronymic_name": "Иванович",
        "passport_series_number": "1122334455",
        "passport_issued_at": "2012-12-20",
        "itn": "330500938709",
        "ssn": "11223344595",
        "status": "data_verified",
        "verified_at": "2014-10-22T10:26:12.035Z",
        "changed_at": "2014-10-22T10:26:10.604Z",
        "wallet": {
            "phone": "+380935895452"
        }
    }
}
```