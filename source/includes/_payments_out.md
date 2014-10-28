# Платеж со счета кошелька


### Параметры

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

### Коды ошибок

* `missing_type` - отсутствует обязательный параметр type
* `missing_client_payment_id` - отсутствует обязательный параметр client_payment_id
* `missing_amount` - отсутствует обязательный параметр amount
* `invalid_amount` - неверная сумма платежа, должно быть min <= amount <= max, где min и max - минимальная и максимальная сумма для Сервиса
* `missing_service` - отсутствует обязательный параметр service
* `service_not_found` - запрошенный сервис не найдет
* `missing_parameters` - не передан обязательный параметр parameters