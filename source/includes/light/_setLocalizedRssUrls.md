## setLocalizedRssUrls

```xml
<setLocalizedRssUrls>
    <rss>
        <defaultUrl>http://www.banki.ru/xml/news.rss</defaultUrl>
        <localizedUrls type="WsLocalizedRssUrl">
            #
            # localizedUrls
            #
        </localizedUrls>
        <localizedUrls type="WsLocalizedRssUrl">
            #
            # localizedUrls
            #
        </localizedUrls>
    </rss>
</setLocalizedRssUrls>
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
