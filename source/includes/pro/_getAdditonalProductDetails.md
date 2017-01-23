## getAdditonalProductDetails

```xml
<getAdditonalProductDetailsResponse>
   <return>
      <sections type="DetailsSectionDTO">
         <fields type="DetailsFieldDTO">
            <key>Карти №1</key>
            <value>3245</value>
         </fields>
         <fields type="DetailsFieldDTO">
            <key>Карти №2</key>
            <value>4358</value>
         </fields>
         <name>Информация по картам</name>
      </sections>
      <sections type="DetailsSectionDTO">
         <fields type="DetailsFieldDTO">
            <key>Дневной</key>
            <value>25 000 руб.</value>
         </fields>
         <name>Лимиты</name>
      </sections>
   </return>
</getAdditonalProductDetailsResponse>
```

Запрос на получение дополнительной информации о продукте

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
productId | string | 1..1 | идентификатор продукта
cardId | string | 0..1 | идентификатор карты
**Response:** | | |
sections | [DetailsSectionDTO](#detailssectiondto) | 0..1 | детали по продукту по секциям
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует

### DetailsSectionDTO

key | type | status | comment
--- | ---- | :----: | ---:
name | string | 0..1 | имя раздела
fields | [DetailsFieldDTO](#detailsfielddto) | 0..1 | данные в разделе

### DetailsFieldDTO

key | type | status | comment
--- | ---- | :----: | ---:
key | string | 0..1 | название строки
value | string | 0..1 | данные в строке
