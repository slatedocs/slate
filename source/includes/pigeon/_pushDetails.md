## pushDetails

```xml
<details>
   <entry>
     <key>logo_url</key>
     <value>http://www.idamob.ru/ic.png</value>
   </entry>
   <entry>
     <key>push_description</key>
     <value>Текстовый блок с некоторым описанием</value>
   </entry>
   <entry>
     <key>name</key>
     <value>Заголовок сообщения</value>
   </entry>
   <entry>
     <key>currency</key>
     <value>100000000</value>
   </entry>
   <entry>
     <key>fxAmount</key>
     <value>RUR</value>
   </entry>
   <entry>
     <key>Период</key>
     <value>3 года</value>
   </entry>
   <entry>
     <key>Процент</key>
     <value>3%</value>
   </entry>
</details>
```

Дополнительные детали по пушу или экран ошибки

key | type | status | comment
--- | --- | :---: | ---:
logoUrl | string | 0..1 | ссылка на логотип или картинку, отображается на форме 64х64
name | string | 1..1 | заголовок пуш-сообщения в одну строку
pushDescription | string | 0..1 | многострочный текст для деталей пуш-сообщения в шапке экрана
tags | [MarkerDTO](#markerdto) | 0..1 | массив маркеров-деталей для показа списком
amount | [AmountDTO](#amountdto) | 0..1 | сумма в валюте для деталей пуш-уведомления

### MarkerDTO

key | type | status | comment
--- | ---- | :----: | ---:
key | string | 1..1 | идентификатор маркера
value | string | 0..1 | информация, привязанная к маркеру

### AmountDTO

key | type | status | comment
--- | ---- | :----: | ---:
currency | string | 1..1 | текстовый код валюты по [ISO 4217](https://ru.wikipedia.org/wiki/ISO_4217)
fxAmount | int | 1..1 | сумма помноженная на 100 для отображения копеек
