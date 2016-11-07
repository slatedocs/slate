## mergeLocations

```xml
<mergeLocations>
    <request>
        <locations type="WsLocationDTO">
            #
            # location
            #
        </locations>
        <locations type="WsLocationDTO">
            #
            # location
            #
        </locations>
    </request>
</mergeLocations>
```

Добавление новых или совмещение локаций

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
locations | [WsLocationDTO](#wslocationdto) | 1..1 | одна или более локации
**Response:** | | |
sucсess | bool | 0..1 | статус операции
errorMessage | string | 0..1 | текстовое сообщение
