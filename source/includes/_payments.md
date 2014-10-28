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

Клиент может генерировать [UUID](http://wikipedia.org/wiki/UUID) для каждого отдельного платежа и передавать его в поле `client_payment_id` платежного запроса. Если в процессе создания платежа такой клиент получил ошибку I/O, он должен повторять запрос создания платежа с тем же самым `client_payment_id` до получения ответа. Гарантируется, что платеж с данным `client_payment_id` будет создан не более 1 раза.

## Проведение платежа

Для передачи mserver платежа на исполнение клиент следует общепринятому в платежной индустрии двухфазному протоколу. В первой фазе, подготовительной, клиент создает в mserver Платеж с необходимыми параметрами. 
По завершении подготовительной фазы клиент получает от mserver информацию о полной стоимости платежа (поле `total`) и предъявляет полную стоимость платежа пользователю кошелька. 
В случае согласия пользователя с условиями исполнения платежа клиент от имени пользователя инициирует исполнение подготовленного платежа (вторая фаза, платежная).

![проведение платежа](http://www.websequencediagrams.com/cgi-bin/cdraw?lz=dGl0bGUg0JTQstGD0YXRhNCw0LfQvdGL0Lkg0L_Qu9Cw0YLQtdC2AAoJ0YDQvtGC0L7QutC-0LsgbXNlcnZlcgoKbm90ZSBvdmVyIGNsaWVudCwAEwg6INCf0L7QtNCzADIHstC4AE8Fu9GM0LDRjyAAbQewCgoANAYtPgAxCVBPU1QgL3BheW1lbnRzIHtwYXJhbXN9AGcGcmlnaHQgb2YAYAkKAIEGCCDRgdC-0LfQtNCw0LXRggCBPA0sCiDRgNCw0YHRgdGH0LjRgtGL0LIAIAi60L7QvNC40YHRgdC40Y4KINC90LjQutGC0L4AAwiD0LTQsCDQtdGJ0LUg0L3QtQCCHQq40YIKZW5kIG5vdGUKCgCCEwctPgCCCgY6IHtpZDogMTIzLCBhbW91bnQ6IDEwMCwgdG90YWw6IDExMCwgbmV4dF9hY3Rpb246IHBheX0AglEHbGVmAIFlBQBEBwog0LrQu9C40LXQvQCBWQa-0LrQsNC3AIFADL_QvgCCXgW3AIJuBQCDQQa70Y4gCgAUB9C90YPRjiDRgQCDSQW40LzQvtGB0YLRjACDag6wIDExMCDRgAoAOheMAIJnBrMAhCYFgdC10L0AggQN0YwAgggLAIQGHgCEYQsAg2ouLzEyMy9wYXkAg3YhAFQFh9C40L0AhBAJ0YAAhQ0FvtC0AIEoBgCFaA0AgloO0YMAhXkGtdC00LvQsNCzAIRYBtGB0Y8g0L4AhhUFsNGI0LgAgmgG0YwKAIUCBQCCWgbRjwCERQUAhCILAIJXBQCEJQoAhBwSAIN_DWdldH0Ahg0TR0UAgXgPAIRjE3N0YXR1czogY29tcGxldGVkAIY4BwCEMSO70YPRhwCGPQcAgSshIAoAWQogKNC40YEAhGAI0LXQvSkKIFlheSEAhhcJ&s=modern-blue)








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