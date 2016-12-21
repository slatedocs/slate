## WsBannerDTO

```xml
<banners type="WsBannerDTO">
   <id>5232a36b-58dc-4ad7-9d68-956eeb3fcd3e</id>
   <imageURL>http://static.idamob.ru/jet/banners/${image.type}/umb_bn_3.png</imageURL>
   <order>1</order>
   <text>i18n{"ru":"Рекламный баннер","en":"Advertising banner"}</text>
   <title nil="true"/>
   <type>URL</type>
   <target>http://www.idamob.ru</target>
   <placement>PHONE_SMALL</placement>
</banners>
<banners type="WsBannerDTO">
   <id>3c4dff3d-37c0-46ad-aaea-4d09a19d148a</id>
   <imageURL>http://static.idamob.ru/jet/banners/${image.type}/umb_bn_2.png</imageURL>
   <order>2</order>
   <placement>PHONE_SMALL</placement>
</banners>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
order | int | 1..1 | порядок следования
title | string | 0..1 | заголовок
text | string | 0..1 | подпись
imageURL | [LogoResource](https://doc.idamob.ru/pro#logoresource) | 0..1 | ссылка на изображение
placement | [BannerPlacement](#bannerplacement) | 1..1 | область размещения
type | [BannerType](#bannertype) | 0..1 | тип активности баннера
target | string | 0..1 | направление перехода

### BannerType

key | comment
--- | ---:
URL | открытие webView
FORM | открытие формы по id

### BannerPlacement

key | comment
--- | ---:
PHONE_SMALL | отправлять по умолчанию
IPAD_SQUARE | 
IPAD_VERTICAL | 
IPAD_HORIZONTAL | 
