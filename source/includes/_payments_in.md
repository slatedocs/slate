# Пополнение кошелька

Пополнение кошелька пользователя через запросы к API возможно с использованием пластиковых карт. Существуют 3 сценария пополнения кошелька с карты:

* однократное пополнение
* однократное пополнение с сохранением данных карты для последующего использования ("привязка карты")
* пополнение с сохраненной ранее карты ("рекарринг")

### Параметры

* `type` = in - тип платежа
* `client_payment_id` - клиентский идентификатор платежа
* `amount` -  сумма к зачислению
* `store_card` - `true` | `false` - сохранить карту, чтобы использовать ее для платежей в дальнейшем (опциональный)
* `card` - идентификатор сохраненной карты с которой будут списаны деньги (опциональный)

## Однократное

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

## С сохранением данных карты

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

## C сохраненной карты

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