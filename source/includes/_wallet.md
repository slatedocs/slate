# Кошелек

Кошелек - учетная запись конечного пользователя в mserver. Позволяет получать информацию о доступном остатке на счете и персональных данных конечного пользователя.  

> Пример 

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {    
    "phone" : "+79261111111",    
    "amount" : 0,
    "name" : "Алексей Арсеньев",
    "verified" : false
  }
}
```

### Поля

* `phone` - номер телефона в международном формате, уникальный идентификатор Кошелька (в пределах Проекта), также является логином
* `amount` - остаток на счете кошелька, в рублях
* `name` - имя конечного пользователя, возвращается в случае, если были заданы имя и/или фамилия
* `verified` - `true`|`false` статус идентификации пользователя

## Создание кошелька

<aside class="notice">При создании кошелька на dev сервере на счет зачисляется 10000 рублей.</aside>

### Параметры

* `phone` - номер телефона в международном формате
* `password` - пароль, не короче 6 символов

```shell
$ curl -H 'Content-type:application/json'
 -d '{"phone": "+79261111111", "password": "password"}'
 https://www.synq.ru/mserver2-dev/v1/wallet
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {
    "phone" : "+79261111111",
    "check_digit" : "8" 
  },
  "dev" : {
    "activation_code" : "242321"
  }
}
```

### Коды ошибок

* `missing_phone` - не передан номер телефона
* `invalid_phone` - номер телефона не соответствует международному формату
* `missing_password` - не передан пароль
* `invalid_password` - пароль короче 6 символов
* `phone_already_exists` - кошелек с таким номером телефона уже существует (и активирован)
* `wallet_not_active` - кошелек с таким номером телефона уже существует и его нужно активировать кодом из СМС

После создания кошелька требуется активация (подтверждение номера телефона) кодом, который отправлен в СМС сообщении. До выполнения активации
аутентифицироваться на mserver учетными данными кошелька будет нельзя. Сервер будет возвращать HTTP статус 401 с кодом ошибки `wallet_not_active`.

> Ошибка до активации кошелька

```json
{
  "meta" : {
    "code" : 401,
    "error" : "wallet_not_active"
  }
}
```

<aside class="notice">На dev сервере код не отправляется в СМС и возвращается в ответе в поле `dev.security_code`</aside>

## Активация кошелька

### Параметры

* `phone` - номер телефона в международном формате
* `code` - код активации кошелька из СМС сообщения

```shell
$ curl -H 'Content-type:application/json'  
 -d '{"phone": "+79261111111", "code": "242321"}' 
 https://www.synq.ru/mserver2-dev/v1/wallet/activate
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {
    "phone" : "+79261111111"
  }
}
```

### Коды ошибок

* `missing_phone` - не передан номер телефона
* `invalid_phone` - номер телефона не соответствует международному формату
* `missing_code` - не передан код активации
* `already_active` - кошелек с телефоном `phone` уже активирован
* `invalid_code` - переданный код активации не совпадает с присланным в СМС
* `code_expired` - с момента создания кода активации прошло больше 15 минут, запросите код повторно
* `failure_limit_exceeded` - вы прислали неверный код активации больше 5 раз, обратитесь в поддержку

## Запрос повторной отправки кода активации

<aside class="notice">На dev сервере код не отправляется в СМС и возвращается в ответе в поле `dev.security_code`</aside>

### Параметры

* `phone` - номер телефона в международном формате

```shell
curl -H 'Content-type:application/json'
 -d '{"phone": "+79261111111"}' 
 https://www.synq.ru/mserver2-dev/v1/wallet/resend_code
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {
    "phone" : "+79261111111",
    "check_digit" : "3"
  },
  "dev" : {
    "security_code" : "482721"
  }
}
```

### Коды ошибок

* `missing_phone` - не передан номер телефона
* `invalid_phone` - номер телефона не соответствует международному формату
* `already_active` - кошелек с телефоном `phone` уже активирован
* `failure_limit_exceeded` - вы прислали неверный код активации больше 5 раз, обратитесь в поддержку
* `resend_limit_exceeded` - mserver отправил отведенные 5 СМС сообщений с кодами активации, обратитесь в поддержку

## Запрос кода для смены пароля

<aside class="notice">На dev сервере код не отправляется в СМС и возвращается в ответе в поле `dev.security_code`</aside>

```shell
$ curl -H 'Content-type:application/json' 
 -d '{"phone": "+79261111111"}'
 https://www.synq.ru/mserver2-dev/v1/wallet/send_password_reset_code
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {
    "phone" : "+79261111111",
    "check_digit" : "1"
  },
  "dev" : {
    "security_code" : "934879"
  }
}
```
### Коды ошибок

* `failure_limit_exceeded` - вы прислали неверный код смены пароля больше 5 раз, обратитесь в поддержку
* `resend_limit_exceeded` - mserver отправил отведенные 5 СМС сообщений с кодами смены пароля, обратитесь в поддержку

## Смена пароля

```shell
$ curl -H 'Content-type:application/json' 
 -d '{"code": "934879", "password": "PassWord", "phone": "+79261111111"}' ttps://www.synq.ru/mserver2-dev/v1/wallet/reset_password
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {
    "phone" : "+79261111111"
  }
}
```

### Коды ошибок

* `missing_code` - не передан код смены пароля 
* `invalid_code` - переданный код смены пароля не совпадает с присланным в СМС
* `code_expired` - с момента создания кода смены пароля прошло больше 15 минут, запросите код повторно
* `failure_limit_exceeded` - вы прислали неверный код смены пароля больше 5 раз, обратитесь в поддержку


## Загрузка кошелька

```shell
$ curl -u+79261111111:password https://www.synq.ru/mserver2-dev/v1/wallet
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {    
    "phone" : "+79261111111",
    "amount" : 0,
    "name" : "Алексей Арсеньев",
    "verified" : false,
    "reset_password" : false
  }
}
```

## Поиск кошельков

```shell
$ curl -u+79261111111:password -H 'Content-type:application/json' 
-d '{"phones": ["+79990000000", "+79260000001", "+79260000002"]}' 
https://www.synq.ru/mserver2-dev/v1/wallet/find
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : [ {
    "phone" : "+79260000001"
  }, {
    "phone" : "+79260000002"
  } ]
}
```

## Удаление кошелька

<aside class="notice">Команда работает только на dev сервере.</aside>

```shell
$ curl -u+79261111111:password -X DELETE https://www.synq.ru/mserver2-dev/v1/wallet
```

```json
{
  "meta" : {
    "code" : 200
  }
}
```

## Задание персональных данных пользователя

### Параметры

* `family_name` - фамилия
* `given_name` - имя
* `patronymic_name` - отчество
* `passport_series_number` - серия и номер паспорта, 10 цифр
* `passport_issued_at` - дата в формате гггг-мм-дд
* `itn` - ИНН, 12 цифр
* `ssn` - СНИЛС, 11 цифр

```shell
$ curl -u+79261111111:password -H 'Content-type:application/json' 
-d '{"family_name": "Арсеньев", "given_name": "Алексей", "patronymic_name": "Александрович", 
"passport_series_number": "2202655885", "passport_issued_at" : "2012-02-27", 
"itn": "330500938709", "ssn": "11223344595"}'  
https://www.synq.ru/mserver2-dev/v1/wallet/person
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {
    "family_name" : "Арсеньев",
    "given_name" : "Алексей",
    "patronymic_name" : "Александрович",
    "passport_series_number" : "2202655885",
    "passport_issued_at" : "2012-02-27",
    "itn" : "330500938709",                       
    "ssn" : "11223344595",                        
    "status" : "data_entered"
  }
}
```

### Коды ошибок

* `invalid_family_name` - фамилия длиннее 512 символов
* `invalid_given_name` - имя длиннее 512 символов
* `invalid_patronymic_name` - отчество длиннее 512 символов
* `invalid_passport_series_number` - серия/номер паспорта не соответствует формату
* `invalid_itn` - ИНН не соответствует формату
* `invalid_ssn` - СНИЛС не соответствует формату
* `person_already_verified` - перcональные данные утверждены, изменение невозможно, обратитесь в поддержку

## Загрузка персональных данных пользователя
```shell
$ curl -u+79261111111:password https://www.synq.ru/mserver2-dev/v1/wallet/person
```

```json
{
  "meta" : {
    "code" : 200
  },
  "data" : {
    "family_name" : "Арсеньев",
    "given_name" : "Алексей",
    "patronymic_name" : "Александрович",
    "passport_series_number" : "2202655885",
    "passport_issued_at" : "2012-02-27",
    "itn" : "330500938709",
    "ssn" : "11223344595",
    "status" : "data_verified",
    "verified_at" : "2014-05-29T17:06:20.066Z"
  }
}
```

## Статусы персональных данных

| Код статуса ПД   | Описание                                                                                      |
|:-----------------|:----------------------------------------------------------------------------------------------|
| `data_entered`   | Персональные данные введены пользователем, изменение ПД возможно            	           |
| `data_verified`  | Персональные данные проверены, дальнейшее изменение ПД невозможно                             |