## WsBannerDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
order | int | 1..1 | порядок следования
title | string | 1..1 | заголовок
text | string | 1..1 | подпись
landingURL | string | 1..1 | ссылка, открывающаяся по клику на баннере
imageURL | string | 1..1 | ссылка на изображение
type | string | 1..1 | тип, по умолчанию: PHONE_SMALL
