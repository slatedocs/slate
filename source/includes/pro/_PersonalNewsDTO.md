## PersonalNewsDTO

key | type | status | comment
--- | ---- | :----: | ---:
entityId | string | 1..1 | уникальный идентификатор новости
title | string | 0..1 | заголовок новости
creationDate | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | дата публикации новости
preview | string | 0..1 | укороченная версия новости
isRead | bool | 0..1 | признак прочитанности
url | string | 0..1 | ссылка на новость в интернет
details | [pushDetails](#) | 0..1 | тело сообщения после открытия, функционал завязан на сервер iDa PiGeon ключами и структурой
