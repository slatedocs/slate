## getAdditonalProductDetails

```xml
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
```

Запрос на получение дополнительной информации о продукте

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
productId | string | 1..1 | идентификатор продукта
cardId | string | 0..1 | идентификатор карты
**Response:** | | |
sections | [DetailsSectionDTO](#detailssectiondto) | 0..1 | детали по продукту по секциям
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
