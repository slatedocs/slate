﻿# Платежи

Платеж - это операция движения денежных средств между счетами mserver выполняемая по распоряжению пользователя. Платежи различаются по типу:

| Код типа платежа | Описание                                                                                          |
|:-----------------|:--------------------------------------------------------------------------------------------------|
| `out`            | Вывод средств со счета кошелька пользователя в пользу провайдера (провайдер КредитПилот)          |
| `p2p`            | Перевод денег со счета кошелька пользователя на счет кошелька другого пользователя                |
| `in`             | Ввод средств на счет кошелька пользователя через провайдера (провайдеры КредитПилот, ИПСП, Рапида)|

### Поля, общие для всех типов платежей

* `type` - in|out|p2p тип Платежа
* `client_payment_id` - клиентский идентификатор (UUID)
* `amount` - сумма к зачислению в рублях
* `total` - полная сумма Платежа с учетом комиссии в рублях
* `createdAt` - время создания
* `processedAt` - время завершения online обработки
* `status` - состояние
* `decline_reason` - причина отказа в проведении

### Поля для платежей типа `out` (вывод денег)

* `service` - назначение платежа
* `outbound` - провайдер, на счет которого были отправлены деньги со счете кошелька
* `parameters` - параметры платежа, например номер карты/телефона

### Поля для типа `in` (ввод денег)

* `inbound` - провайдер, со счета которого деньги пришли на счет кошелька
* `card` - карта с которой прошло пополнение

### Поля для типа `p2p` (перевод между кошельками)

* `destination` - кошелек назначения перевода
* `message` - сообщение адресату перевода

## Статусы платежа

| Код статуса платежа   | Описание                                                                                     |
| :-------------------  |:---------------------------------------------------------------------------------------------|
| `created`             | Платеж создан (например вызовом POST /payments) и ожидает от клиента команды на исполнение   |
| `processing`          | Платеж был запущен в обработку (например вызовом POST /payments/{id}/pay и исполняется       |
| `completed`           | Платеж успешно исполнен                                                                      |
| `declined`            | Платеж отклонен, с уточнением причины в поле `decline_reason`                                |

## Причины отказа в проведении платежа

| Код причины отказа    | Описание                                                                                     |
| :-------------------  |:---------------------------------------------------------------------------------------------|
| `invalid_data`        | Неверные данные платежа (например неверный номер карты/номер телефона)                       |
| `insufficient_funds`  | Недостаточно средств на счете кошелька                                                       |
| `internal_error`      | Что-то пошло не так, обратитесь в поддержку                                                  |


## Клиентский идентификатор платежа

Клиент обязан генерировать [UUID](http://wikipedia.org/wiki/UUID) для каждого отдельного платежа и передавать его в поле `client_payment_id` платежного запроса. Если в процессе создания платежа клиент получил ошибку I/O, он должен повторять запрос создания платежа с тем же самым `client_payment_id` до получения ответа. Гарантируется, что платеж с данным `client_payment_id` будет создан не более 1 раза.

## Проведение платежа

Для передачи mserver платежа на исполнение клиент следует общепринятому в платежной индустрии двухфазному протоколу. В первой фазе, подготовительной, клиент создает в mserver Платеж с необходимыми параметрами. 
По завершении подготовительной фазы клиент получает от mserver информацию о полной стоимости платежа (поле `total`) и предъявляет полную стоимость платежа пользователю кошелька. 
В случае согласия пользователя с условиями исполнения платежа клиент от имени пользователя инициирует исполнение подготовленного платежа (вторая фаза, платежная).

![проведение платежа](http://www.websequencediagrams.com/cgi-bin/cdraw?lz=dGl0bGUg0JTQstGD0YXRhNCw0LfQvdGL0Lkg0L_Qu9Cw0YLQtdC2AAoJ0YDQvtGC0L7QutC-0LsgbXNlcnZlcgoKbm90ZSBvdmVyIGNsaWVudCwAEwg6INCf0L7QtNCzADIHstC4AE8Fu9GM0LDRjyAAbQewCgoANAYtPgAxCVBPU1QgL3BheW1lbnRzIHtwYXJhbXN9AGcGcmlnaHQgb2YAYAkKAIEGCCDRgdC-0LfQtNCw0LXRggCBPA0sCiDRgNCw0YHRgdGH0LjRgtGL0LIAIAi60L7QvNC40YHRgdC40Y4KINC90LjQutGC0L4AAwiD0LTQsCDQtdGJ0LUg0L3QtQCCHQq40YIKZW5kIG5vdGUKCgCCEwctPgCCCgY6IHtpZDogMTIzLCBhbW91bnQ6IDEwMCwgdG90YWw6IDExMCwgbmV4dF9hY3Rpb246IHBheX0AglEHbGVmAIFlBQBEBwog0LrQu9C40LXQvQCBWQa-0LrQsNC3AIFADL_QvgCCXgW3AIJuBQCDQQa70Y4gCgAUB9C90YPRjiDRgQCDSQW40LzQvtGB0YLRjACDag6wIDExMCDRgAoAOheMAIJnBrMAhCYFgdC10L0AggQN0YwAgggLAIQGHgCEYQsAg2ouLzEyMy9wYXkAg3YhAFQFh9C40L0AhBAJ0YAAhQ0FvtC0AIEoBgCFaA0AgloO0YMAhXkGtdC00LvQsNCzAIRYBtGB0Y8g0L4AhhUFsNGI0LgAgmgG0YwKAIUCBQCCWgbRjwCERQUAhCILAIJXBQCEJQoAhBwSAIN_DWdldH0Ahg0TR0UAgXgPAIRjE3N0YXR1czogY29tcGxldGVkAIY4BwCEMSO70YPRhwCGPQcAgSshIAoAWQogKNC40YEAhGAI0LXQvSkKIFlheSEAhhcJ&s=modern-blue)

### Платеж в пользу провайдера

#### Параметры

* `type` = out - тип платежа
* `client_payment_id` - клиентский идентификатор платежа
* `amount` -  сумма к зачислению
* `service` - назначение платежа, идентификатор Сервиса
* `parameters` - параметры платежного запроса в соответствии с /services/{service}

```shell
$ curl -u+79261111111:password -H 'Content-type:application/json' 
 -d '{"type": "out", "client_payment_id": "e731a7e2-c553-4295-867e-1023359bee28", 
 "amount": 100, "service": 61, "parameters": {"phoneNumber": "9267101283", 
 "BIK": "044583151", "Name": "name", "SName": "sname", "Fam": "fam"}}' 
 https://www.synq.ru/mserver2-dev/v1/payments
```

```json
{
  "meta" : {
    "code" : 200,
    "next_action" : "get"
  },
  "data" : {
    "id" : 1401089234883,
    "client_payment_id" : "e731a7e2-c553-4295-867e-1023359bee28",
    "amount" : 100,
    "created_at" : "2014-05-26T15:15:07.389Z",
    "status" : "processing",
    "type" : "out",
    "service" : {
      "id" : 61,
      "name" : "Мультибанк"
    },
    "parameters" : [ {
      "code" : "phoneNumber",
      "name" : "№ Телефона (10 цифр)",
      "value" : "9267101283"
    }, {
      "code" : "BIK",
      "name" : "БИК",
      "value" : "044583151"
    }, {
      "code" : "Name",
      "name" : "Имя Отправителя",
      "value" : "name"
    }, {
      "code" : "SName",
      "name" : "Отчество Отправителя",
      "value" : "sname"
    }, {
      "code" : "Fam",
      "name" : "Фамилия Отправителя",
      "value" : "fam"
    } ],
    "outbound" : {
      "id" : 35,
      "code" : "tpr_out",
      "name" : "ООО ТПР (провайдер)"
    }
  }
}
```

#### Коды ошибок

* `missing_type` - отсутствует обязательный параметр type
* `missing_client_payment_id` - отсутствует обязательный параметр client_payment_id
* `missing_amount` - отсутствует обязательный параметр amount
* `missing_service` - отсутствует обязательный параметр service
* `service_not_found` - запрошенный сервис не найдет
* `missing_parameters` - не передан обязательный параметр parameters
* `wallet_not_identified` - не идентифицироанным пользователмя запрещены P2P транзакции

Привышение лимитов

* `in_amount_limit` - привышен максимально возможный входящий платёж
* `out_amount_limit` - привышен максимально возможный исходящий платёж
* `amount_limit` - привышена максимально возможная сумма на кошельке
* `monthly_in_turnover_limit` - превишен максимально возможный входящий месячный оборот
* `monthly_out_turnover_limit` - превишен максимально возможный исходящий месячный оборот
* `active_cards_limit` - превишено максимально возможное колличество активных карт

> Пример ответа при пивышении лимита
 
```json
{
   "meta":{
      "code":422,
      "error":"in_amount_limit",
      "details":{
         "limit":15000,
         "actual":16000
      }
   }
} 
``` 

### Перевод между кошельками

#### Параметры

* `type` = p2p - тип платежа
* `client_payment_id` - клиентский идентификатор платежа
* `amount` -  сумма перевода
* `destination` - кошелек назначения перевода
* `message` - сообщение адресату перевода (опционально)

```shell
$ curl -u+79261111111:password -H 'Content-type:application/json' 
 -d '{"type": "p2p", "client_payment_id": "071c6d23-7508-4e35-ad92-852308a47677", "amont": 100, "destination": "+79261111112", "message": "Съешь ещё этих мягких французских булок, да выпей чаю"}'   https://www.synq.ru/mserver2-dev/v1/payments
```

```json
{
  "meta" : {
    "code" : 200,
    "next_action" : "pay"
  },
  "data" : {
    "id" : 1401089237211,
    "client_payment_id" : "071c6d23-7508-4e35-ad92-852308a47677",
    "amount" : 100,
    "total" : 100.00,
    "created_at" : "2014-07-01T06:30:01.277Z",
    "status" : "created",
    "type" : "p2p",
    "destination" : {
      "phone" : "+79261111112"
    },
    "message" : "Съешь ещё этих мягких французских булок, да выпей чаю"
  }
}
```

#### Коды ошибок

* `missing_type` - отсутствует обязательный параметр type
* `missing_client_payment_id` - отсутствует обязательный параметр client_payment_id
* `missing_amount` - отсутствует обязательный параметр amount
* `invalid_amount` - сумма перевода должна быть > 0
* `missing_destination` - отсутствует обязательный параметр destination
* `destination_not_found` - кошелек назначения платежа не найден
* `invalid_destination` - попытка отправить p2p перевод самому себе
* `insufficient_funds` - недостаточно средств для выполнения p2p перевода


### Пополнение кошелька

Пополнение кошелька пользователя через запросы к API возможно с использованием пластиковых карт. Существуют 3 сценария пополнения кошелька с карты:

* однократное пополнение
* однократное пополнение с сохранением данных карты для последующего использования ("привязка карты")
* пополнение с сохраненной ранее карты ("рекарринг")

#### Параметры

* `type` = in - тип платежа
* `client_payment_id` - клиентский идентификатор платежа
* `amount` -  сумма к зачислению
* `store_card` - `true` | `false` - сохранить карту, чтобы использовать ее для платежей в дальнейшем (опциональный)
* `card` - идентификатор сохраненной карты с которой будут списаны деньги (опциональный)

> ***Пример однократного пополнения***

> Создаем платеж:

```shell
$ curl -u+79261111111:password -H 'Content-type:application/json' 
 -d '{"type": "in", "client_payment_id": "071c6d23-7508-4e35-ad92-852308a47678", "amount": 100}'
 https://www.synq.ru/mserver2-dev/v1/payments
```

```json
{
  "meta" : {
    "code" : 200,
    "next_action" : "pay"
  },
  "data" : {
    "id" : 1401089237212,
    "client_payment_id" : "071c6d23-7508-4e35-ad92-852308a47678",
    "amount" : 100,
    "total" : 100.00,
    "created_at" : "2014-07-01T06:55:27.870Z",
    "status" : "created",
    "type" : "in",
    "inbound" : {
      "id" : 62,
      "code" : "ipsp_in",
      "name" : "ООО ИПСП (агент)"
    },
    "card" : {
      "state" : "created"
    }
  }
}
```

> Платим:

```shell
$curl -u+79261111111:password -H 'Content-type:application/json' 
 -X POST https://www.synq.ru/mserver2-dev/v1/payments/1401089237212/pay
```

```json
{
  "meta" : {
    "code" : 200,
    "next_action" : "get"
  },
  "data" : {
    "id" : 1401089237212,
    "client_payment_id" : "071c6d23-7508-4e35-ad92-852308a47678",
    "amount" : 100,
    "total" : 100,
    "created_at" : "2014-07-01T06:55:27.870Z",
    "status" : "processing",
    "type" : "in",
    "inbound" : {
      "id" : 62,
      "code" : "ipsp_in",
      "name" : "ООО ИПСП (агент)"
    },
    "card" : {
      "state" : "pending",
      "payment_page_url" : "https://test1.ipsp.com/frontend/endpoint?product_id=1721&desc=mserver2&payment_type=S&amount=100.00&currency=RUB&cf=1401089237212&locale=ru&hash=3d49fa2b7ceb67f8ad7ed7f2247dd2cad1c4acdc"
    }
  }
}
```
> далее следует перенаправить пользователя на платежную страницу по ссылке из поля `card.payment_page_url`.

> ***Пример однократного пополнения с сохранением данных карты***

> Создаем платеж:

```shell
$ curl -u+79261111111:password -H 'Content-type:application/json' 
 -d '{"type": "in", "client_payment_id": "071c6d23-7508-4e35-ad92-852308a47679", "amount": 100, "store_card": true}' https://www.synq.ru/mserver2-dev/v1/payments
```

```json
{
  "meta" : {
    "code" : 200,
    "next_action" : "pay"
  },
  "data" : {
    "id" : 1401089237231,
    "client_payment_id" : "071c6d23-7508-4e35-ad92-852308a47679",
    "amount" : 100,
    "total" : 100.00,
    "created_at" : "2014-07-01T08:31:24.058Z",
    "status" : "created",
    "type" : "in",
    "inbound" : {
      "id" : 62,
      "code" : "ipsp_in",
      "name" : "ООО ИПСП (агент)"
    },
    "card" : {
      "id" : 21,
      "state" : "created"
    }
  }
}
```

> Платим:

```shell
$ curl -u+79261111111:password-H 'Content-type:application/json' 
-X POST https://www.synq.ru/mserver2-dev/v1/payments/1401089237231/pay
```

```json
{
  "meta" : {
    "code" : 200,
    "next_action" : "get"
  },
  "data" : {
    "id" : 1401089237231,
    "client_payment_id" : "071c6d23-7508-4e35-ad92-852308a47679",
    "amount" : 100,
    "total" : 100,
    "created_at" : "2014-07-01T08:31:24.058Z",
    "status" : "processing",
    "type" : "in",
    "inbound" : {
      "id" : 62,
      "code" : "ipsp_in",
      "name" : "ООО ИПСП (агент)"
    },
    "card" : {
      "id" : 21,
      "state" : "pending",
      "payment_page_url" : "https://test1.ipsp.com/frontend/endpoint?product_id=1721&desc=mserver2&payment_type=S&amount=100.00&currency=RUB&cf=1401089237231&locale=ru&biller_client_id=21&perspayee_expiry=0150&recur_freq=1&hash=5136f2cb7fd77f98b1df86d4644338e5a10dab98"
    }
  }
}
```

> далее следует перенаправить пользователя на платежную страницу по ссылке из поля `card.payment_page_url`.

> ***Убедимся, что платеж успешен и карта сохранена***

```shell
$ curl -u+79261111111:passwordhttps://www.synq.ru/mserver2-dev/v1/payments/1401089237231
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {
    "id" : 1401089237231,
    "client_payment_id" : "071c6d23-7508-4e35-ad92-852308a47679",
    "amount" : 100,
    "total" : 100,
    "created_at" : "2014-07-01T08:31:24.058Z",
    "processed_at" : "2014-07-01T08:39:40.173Z",
    "status" : "completed",
    "type" : "in",
    "inbound" : {
      "id" : 62,
      "code" : "ipsp_in",
      "name" : "ООО ИПСП (агент)"
    },
    "card" : {
      "id" : 21,
      "state" : "active",
      "title" : "541715******2399",
      "type" : "MasterCard"
    }
  }
}
```

> ***Пример пополнения с сохраненной карты***

> Используем карту #21 сохраненную в предыдущем примере.

> Создаем платеж:

```shell
$ curl -u+79261111111:password-H 'Content-type:application/json'
 -d '{"type": "in", "client_payment_id": "071c6d23-7508-4e35-ad92-852308a47689", "amount": 100, "card": 21}'  
 https://www.synq.ru/mserver2-dev/v1/payments
```

```json
{
  "meta" : {
    "code" : 200,
    "next_action" : "pay"
  },
  "data" : {
    "id" : 1401089237232,
    "client_payment_id" : "071c6d23-7508-4e35-ad92-852308a47653",
    "amount" : 100,
    "total" : 100.00,
    "created_at" : "2014-07-01T08:58:51.143Z",
    "status" : "created",
    "type" : "in",
    "inbound" : {
      "id" : 62,
      "code" : "ipsp_in",
      "name" : "ООО ИПСП (агент)"
    },
    "card" : {
      "id" : 21,
      "state" : "active",
      "title" : "541715******2399",
      "type" : "MasterCard"
    }
  }
}
```

> Платим:

```shell
$ curl -u+79261111111:password -H 'Content-type:application/json' X POST https://www.synq.ru/mserver2-dev/v1/payments/1401089237232/pay
```

```json
{
  "meta" : {
    "code" : 200,
    "next_action" : "get"
  },
  "data" : {
    "id" : 1401089237232,
    "client_payment_id" : "071c6d23-7508-4e35-ad92-852308a47653",
    "amount" : 100,
    "total" : 100,
    "created_at" : "2014-07-01T12:04:49.330Z",
    "status" : "processing",
    "type" : "in",
    "inbound" : {
      "id" : 62,
      "code" : "ipsp_in",
      "name" : "ООО ИПСП (агент)"
    },
    "card" : {
      "id" : 25,
      "state" : "active",
      "title" : "541715******2399",
      "type" : "MasterCard"
    }
  }
}
```

## Получение истории платежей

```shell
$ curl -u+79261111111:password "https://www.synq.ru/mserver2-dev/v1/payments?page=0&size=35&type=out,in&status=completed,declined"
```

Параметры `page` и `size` в запросе позволяют задать номер (начиная с 0) и размер страницы, которую запрашивает клиент. По умолчанию номер страницы - 0 и размер страницы - 35 платежей.
Опциональные параметры `type` и `status` позволяют фильтровать платежи по типу и статусу.

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : [ {
    "id" : 1401089238188,
    "client_payment_id" : "e131a7e2-c553-4295-867e-1023359bee31",
    "amount" : 2,
    "total" : 5.01,
    "created_at" : "2014-07-08T16:08:56.536Z",
    "status" : "declined",
    "type" : "out",
    "service" : {
      "id" : 15,
      "name" : "MTS Украина"
    },
    "parameters" : [ {
      "code" : "phoneNumber",
      "name" : "№ телефона (9-10 цифр)",
      "value" : "0509244604"
    } ],
    "outbound" : {
      "id" : 35,
      "code" : "tpr_out",
      "name" : "ООО ТПР (провайдер)"
    }
  }, {
    "id" : 1401089238187,
    "client_payment_id" : "e731a7e2-c553-4295-867e-1023359bee31",
    "amount" : 2,
    "total" : 5.01,
    "created_at" : "2014-07-08T16:05:40.110Z",
    "processed_at" : "2014-07-08T16:07:41.435Z",
    "status" : "completed",
    "type" : "out",
    "service" : {
      "id" : 15,
      "name" : "MTS Украина"
    },
    "parameters" : [ {
      "code" : "phoneNumber",
      "name" : "№ телефона (9-10 цифр)",
      "value" : "0509244604"
    } ],
    "outbound" : {
      "id" : 35,
      "code" : "tpr_out",
      "name" : "ООО ТПР (провайдер)"
    }
  }, {
    "id" : 1401089238186,
    "client_payment_id" : "1331a7e2-c553-4295-867e-1023359bee38",
    "amount" : 1,
    "total" : 4.01,
    "created_at" : "2014-07-08T15:14:42.620Z",
    "status" : "declined",
    "decline_reason" : "internal_error",
    "type" : "out",
    "service" : {
      "id" : 15,
      "name" : "MTS Украина"
    },
    "parameters" : [ {
      "code" : "phoneNumber",
      "name" : "№ телефона (9-10 цифр)",
      "value" : "1509244604"
    } ],
    "outbound" : {
      "id" : 35,
      "code" : "tpr_out",
      "name" : "ООО ТПР (провайдер)"
    }
  }, {
    "id" : 1401089238185,
    "client_payment_id" : "1231a7e2-c553-4295-867e-1023359bee38",
    "amount" : 1,
    "total" : 4.01,
    "created_at" : "2014-07-08T15:13:28.298Z",
    "status" : "declined",
    "decline_reason" : "internal_error",
    "type" : "out",
    "service" : {
      "id" : 15,
      "name" : "MTS Украина"
    },
    "parameters" : [ {
      "code" : "phoneNumber",
      "name" : "№ телефона (9-10 цифр)",
      "value" : "0509244604"
    } ],
    "outbound" : {
      "id" : 35,
      "code" : "tpr_out",
      "name" : "ООО ТПР (провайдер)"
    }
  }, {
    "id" : 1401089238184,
    "client_payment_id" : "1731a7e2-c553-4295-867e-1023359bee38",
    "amount" : 1,
    "total" : 4.01,
    "created_at" : "2014-07-08T15:11:19.489Z",
    "status" : "declined",
    "type" : "out",
    "service" : {
      "id" : 15,
      "name" : "MTS Украина"
    },
    "parameters" : [ {
      "code" : "phoneNumber",
      "name" : "№ телефона (9-10 цифр)",
      "value" : "0509244604"
    } ],
    "outbound" : {
      "id" : 35,
      "code" : "tpr_out",
      "name" : "ООО ТПР (провайдер)"
    }
  }, {
    "id" : 1401089238183,
    "client_payment_id" : "e731a7e2-c553-4295-867e-1023359bee34",
    "amount" : 1,
    "total" : 4.01,
    "created_at" : "2014-07-08T14:58:52.154Z",
    "status" : "declined",
    "type" : "out",
    "service" : {
      "id" : 15,
      "name" : "MTS Украина"
    },
    "parameters" : [ {
      "code" : "phoneNumber",
      "name" : "№ телефона (9-10 цифр)",
      "value" : "0509244604"
    } ],
    "outbound" : {
      "id" : 35,
      "code" : "tpr_out",
      "name" : "ООО ТПР (провайдер)"
    }
  }, {
    "id" : 1401089238182,
    "client_payment_id" : "e731a7e2-c553-4295-867e-1023359bee38",
    "amount" : 1,
    "total" : 4.01,
    "created_at" : "2014-07-08T14:56:39.222Z",
    "status" : "declined",
    "type" : "out",
    "service" : {
      "id" : 15,
      "name" : "MTS Украина"
    },
    "parameters" : [ {
      "code" : "phoneNumber",
      "name" : "№ телефона (9-10 цифр)",
      "value" : "0509244604"
    } ],
    "outbound" : {
      "id" : 35,
      "code" : "tpr_out",
      "name" : "ООО ТПР (провайдер)"
    }
  }, {
    "id" : 1401089238181,
    "client_payment_id" : "e731a7e2-c553-4295-867e-1023359bee28",
    "amount" : 1,
    "total" : 4.01,
    "created_at" : "2014-07-08T14:25:44.646Z",
    "processed_at" : "2014-07-08T14:26:55.029Z",
    "status" : "completed",
    "type" : "out",
    "service" : {
      "id" : 15,
      "name" : "MTS Украина"
    },
    "parameters" : [ {
      "code" : "phoneNumber",
      "name" : "№ телефона (9-10 цифр)",
      "value" : "0509244604"
    } ],
    "outbound" : {
      "id" : 35,
      "code" : "tpr_out",
      "name" : "ООО ТПР (провайдер)"
    }
  } ]
}
```

## Уведомления об изменении статуса платежа

Для уведомления внешней системы об изменениях статуса платежа mserver выполняет POST запрос на URL /payments/status. Уведомление передается в теле POST запроса в виде объекта платежной операции сериализованного в JSON. Например:

```json
{
  "created_at" : "2014-08-02T14:37:20.102Z",
  "payment" : {
    "id" : 1401089240253,
    "client_payment_id" : "a02b1416-b9c1-4782-88c5-da4d78b32f8d",
    "amount" : 1,
    "total" : 1,
    "created_at" : "2014-08-02T14:36:02.997Z",
    "processed_at" : "2014-08-02T14:37:20.102Z",
    "status" : "completed",
    "type" : "in",
    "inbound" : {
      "id" : 62,
      "code" : "ipsp_in",
      "name" : "ООО ИПСП (агент)"
    },
    "card" : {
      "state" : "used",
      "title" : "541715******2399",
      "type" : "MasterCard"
    }
  },
  "from" : "processing",
  "to" : "completed",
  "type" : "complete"
}
```

### Поля

* `created_at` - момент времени совершения платежной операции
* `payment` - стандартное представление объекта платежа описанное выше
* `from` - начальный статус платежа
* `to` - конечный статус платежа
* `type` - тип платежной операции, см. ниже

### Типы платежных операций

| Тип                   | Описание                                                                            |
| :-------------------  |:------------------------------------------------------------------------------------|
| `complete`            | Платеж проведен                                                                     |
| `decline`             | Платеж отклонен                                                                     |
| `undo`                | Отмена ранее успешного платежа (сторно)                                             |
| `redo`                | Ранее отмененный платеж сделан успешным (сторно сторно and we need to go deeper)    |