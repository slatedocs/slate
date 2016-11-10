## WsBannerDTO

```xml
<banners type="WsBannerDTO">
   <id>5232a36b-58dc-4ad7-9d68-956eeb3fcd3e</id>
   <imageURL>http://static.idamob.ru/jet/banners/${image.type}/umb_bn_3.png</imageURL>
   <landingURL>www.idamob.ru</landingURL>
   <order>1</order>
   <text>i18n{"ru":"Рекламный баннер","en":"Advertising banner"}</text>
   <type>PHONE_SMALL</type>
</banners>
<banners type="WsBannerDTO">
   <id>3c4dff3d-37c0-46ad-aaea-4d09a19d148a</id>
   <imageURL>http://static.idamob.ru/jet/banners/${image.type}/umb_bn_2.png</imageURL>
   <order>2</order>
   <type>PHONE_SMALL</type>
</banners>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
order | int | 1..1 | порядок следования
title | string | 0..1 | заголовок
text | string | 0..1 | подпись
landingURL | string | 0..1 | ссылка, открывающаяся по клику на баннере
imageURL | string | 0..1 | ссылка на изображение
type | string | 1..1 | тип, по умолчанию: ``PHONE_SMALL``
