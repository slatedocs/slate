# Перевод между кошельками

### Параметры

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

### Коды ошибок

* `missing_type` - отсутствует обязательный параметр type
* `missing_client_payment_id` - отсутствует обязательный параметр client_payment_id
* `missing_amount` - отсутствует обязательный параметр amount
* `invalid_amount` - сумма перевода должна быть > 0
* `missing_destination` - отсутствует обязательный параметр destination
* `destination_not_found` - кошелек назначения платежа не найден
* `invalid_destination` - попытка отправить p2p перевод самому себе
* `insufficient_funds` - недостаточно средств для выполнения p2p перевода