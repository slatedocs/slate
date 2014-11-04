# Сервисы

Сервис - это назначение платежа. Сервис содержит описание параметров, которые должны быть переданы в платежном запросе конечным пользователем.

> Пример

```json
{
    "id" : 9,
    "name" : "Альфа Банк",
    "min" : 10,
    "max" : 15000,
    "verification_required": true,
    "parameters" : [ {
      "code" : "phoneNumber",
      "min_length" : 16,
      "max_length" : 16,
      "name" : "№ карты (16 цифр)",
      "pattern" : "^\\d{16}$",
      "type" : "numeric",
      "pattern_description" : "№ карты (16 цифр)",
      "items" : [ ]
}
```

### Поля

* `id` - идентификатор сервиса, передается в платежном запросе в поле `service` для указания назначения платежа
* `name` - человекочитаемое имя сервиса
* `min`, `max` - минимальная и максимальная сумма платежа, включительно
* `verification_required` - true | false требуется ли идентификация плательщика
* `parameters.code` - ключ параметра платежа
* `min_length`, `max_length` - минимальная и максимальная длина значения параметра платежа
* `name` - человекочитаемое имя параметра
* `pattern` - регулярное выражение, которому должно удовлетворять значение параметра платежа
* `pattern_description` - человекочитаемое описание для `pattern`
* `type` - numeric|text|enum тип параметра платежа, число/текст/перечисление
* `items` - возможные значения параметра платежа с типом enum

## Загрузка списка сервисов

```shell
$ curl -u+79261111111:password https://www.synq.ru/mserver2-dev/v1/services?size=1
```

```json
 {
   "meta" : {
     "total_elements" : 23,
     "code" : 200
   },
   "data" : [ {
     "id" : 9,
     "name" : "Альфа Банк",
     "min" : 10,
     "max" : 15000,
     "verification_required" : false,
     "parameters" : [ {
       "code" : "phoneNumber",
       "min_length" : 16,
       "max_length" : 16,
       "name" : "№ карты (16 цифр)",
       "pattern" : "^\\d{16}$",
       "type" : "numeric",
       "pattern_description" : "№ карты (16 цифр)",
       "items" : [ ]
     }, {
       "code" : "valid",
       "name" : "Срок действия (вид: ГГММ)",
       "pattern" : "^\\d{4}$",
       "type" : "text",
       "pattern_description" : "Срок действия (вид: ГГММ)",
       "items" : [ ]
     } ]
   } ]
 }
```

## Загрузка сервиса по идентификатору

```shell
$ curl -u+79261111111:password https://www.synq.ru/mserver2-dev/v1/services/1
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {
    "id" : 1,
    "name" : "Мегафон",
    "min" : 1,
    "max" : 15000,
    "verification_required" : false,
    "parameters" : [ {
      "code" : "phoneNumber",
      "min_length" : 10,
      "max_length" : 10,
      "name" : "№ телефона (10 цифр)",
      "pattern" : "^\\d{10}$",
      "type" : "numeric",
      "pattern_description" : "№ телефона (10 цифр)",
      "items" : [ ]
    } ]
  }
}
```

## Сервисы по группам

```shell
$ curl -u+79261111111:password https://www.synq.ru/mserver2-dev/v1/services/groups?size=1
```

```json
{
  "meta" : {
    "total_elements" : 23,
    "code" : 200
  },
  "data" : [ {
    "code" : "bank",
    "name" : "Банковские услуги",
    "services" : [ {
      "id" : 9,
      "name" : "Альфа Банк",
      "min" : 10,
      "max" : 15000,
      "verification_required" : false,
      "parameters" : [ {
        "code" : "phoneNumber",
        "min_length" : 16,
        "max_length" : 16,
        "name" : "№ карты (16 цифр)",
        "pattern" : "^\\d{16}$",
        "type" : "numeric",
        "pattern_description" : "№ карты (16 цифр)",
        "items" : [ ]
      }, {
        "code" : "valid",
        "name" : "Срок действия (вид: ГГММ)",
        "pattern" : "^\\d{4}$",
        "type" : "text",
        "pattern_description" : "Срок действия (вид: ГГММ)",
        "items" : [ ]
      } ]
    } ]
  } ]
}
```
## Поиск подходящего сервиса по номеру карты или телефона

### Поля

* `type` - phone | card тип поиска
* `input` - номер карты или телефона

> Пример поиска по номеру карты
 
```shell
$ curl -u+79261111111:password https://www.synq.ru/mserver2-dev/v1/services/search?type=card&input=5417150970409149
```

> Пример поиска по номеру телефона
 
```shell
$ curl -u+79261111111:password https://www.synq.ru/mserver2-dev/v1/services/search?type=phone&input=9267101280
```

> Пример возвращаемых данных

```json
{
   "meta":{
      "code":200
   },
   "data":[
      {
         "id":1,
         "name":"Мегафон",
         "min":1,
         "max":15000,
         "verification_required":false,
         "parameters":[
            {
               "code":"phoneNumber",
               "min_length":10,
               "max_length":10,
               "name":"№ телефона (10 цифр)",
               "pattern":"^9\\d{9}$",
               "type":"numeric",
               "pattern_description":"№ телефона (10 цифр)",
               "items":[

               ]
            }
         ]
      }
   ]
}
```