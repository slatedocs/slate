## CardDTO

```xml
<allCards type="CardDTO">
   <id>card_id</id>
   <blockAllowed>true</blockAllowed>
   <blocked>false</blocked>
   <cardHolder>IVAN IVANOV</cardHolder>
   <cardOwner>Иван Иванов</cardOwner>
   <cardStatus>ACTIVE</cardStatus>
   <cardType>Maestro</cardType>
   <expirationMonth>9</expirationMonth>
   <expirationYear>2015</expirationYear>
   <fxRunningBalance>30000</fxRunningBalance>
   <logoResource>http://static.idamob.ru/pro/cards/${image.type}/ic_card_bg.png</logoResource>
   <maskedCardNumber>**** **** 9633 ****</maskedCardNumber>
</allCards>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
maskedCardNumber | string | 1..1 | частично маскированный номер карты, например <code>1111 1111 **** 1111</code>
expirationMonth | int | 1..1 | месяц истечения срока
expirationYear | int | 1..1 | год истечения срока
fxRunningBalance | int | 0..1 | сумма на карте умноженное на 100, при отсутствии берется из счета к которому привязана карты
cardHolder | string | 0..1 | имя держателя карты (как на карте)
logoResource | [LogoResource](#logoresource) | 0..1 | url для доступа к логотипу
blockAllowed | bool | 0..1 | признак разрешена ли блокировка карты из приложения
cardType | string | 1..1 | тип карты или название (например Visa Gold, MasterCard)
blocked | bool | 0..1 | признак блокировки карты
cardOwner | string | 0..1 | владелец карты
cardStatus | string | 0..1 | статус карты
bonusPointsAmount | [AmountDTO](#amountdto) | 0..1 | сумма бонусов
--- |||
feeds | [FeedDTO](#feeddto) | 0..1 | элементы ленты событий, например графика платежей по кредиту или затраченные поездки на общественном транспорте
tags | [MarkerDTO](#markerdto) | 0..1 | дополнительные поля
