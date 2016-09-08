## setLocalizedRssUrls

```xml
<defaultUrl>http://www.banki.ru/xml/news.rss</defaultUrl>
<localizedUrls type="WsLocalizedRssUrl">
   <locale>en</locale>
   <url>http://newsroom.bankofamerica.com/feeds/press_release/all/rss.xml</url>
</localizedUrls>
<localizedUrls type="WsLocalizedRssUrl">
   <locale>ru</locale>
   <url>http://www.banki.ru/xml/news.rss</url>
</localizedUrls>
 ```

Установка источника новостей банка в виде RSS

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
defaultUrl | string | 1..1 | ссылка на источник по умолчанию
localizedUrls | [WsLocalizedRssUrl](#wslocalizedrssurl) | 0..1 | ссылки для источников в зависимости от локали
**Response:** | | |
sucсess | bool | 1..1 | статус операции
errorMessage | string | 0..1 | текст ошибки
