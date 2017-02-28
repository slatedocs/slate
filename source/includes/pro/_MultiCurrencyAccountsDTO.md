## MultiCurrencyAccountsDTO

```xml
<multiCurrencyAccounts type="MultiCurrencyCurrentAccountDTO">
   <id>multiCurrencyAccount_id</id>
   <accountNumber>73732929394</accountNumber>
   <currency>RUB</currency>
   <fxConsolidateBalance>100000</fxConsolidateBalance>
   <openingDate>2014-09-23T00:00:00.000+03:00</openingDate>
   <productName>Multi currency account</productName>
   <subAccounts type="CurrentAccountDTO">
      <id>subAccounts_id</id>
      <accountNumber>324234234234</accountNumber>
      <currency>RUB</currency>
      <productName>MultiCurrency-RUB</productName>
      <runningBalance type="AmountDTO">
         <currency>RUB</currency>
         <fxAmount>34567</fxAmount>
      </runningBalance>
   </subAccounts>
   <subAccounts type="CurrentAccountDTO">
      <id>subAccounts_id</id>
      <accountNumber>345435345435</accountNumber>
      <currency>USD</currency>
      <productName>MultiCurrency-USD</productName>
      <runningBalance type="AmountDTO">
         <currency>USD</currency>
         <fxAmount>11432</fxAmount>
      </runningBalance>
   </subAccounts>
</multiCurrencyAccounts>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | уникальный идентификатор
accountNumber | string | 1..1 | номер продукта в банке
currency | string | 1..1 | текстовый код валюты по [ISO 4217](https://ru.wikipedia.org/wiki/ISO_4217)
productName | string | 1..1 | название продукта
subAccounts | [CurrentAccountDTO](#currentaccountdto) | 0..1 | набор подсчетов в разных валютах
fxConsolidateBalance | int | 0..1 | средства на продукте
--- |||
feeds | [FeedDTO](#feeddto) | 0..1 | элементы ленты событий, например графика платежей по кредиту или затраченные поездки на общественном транспорте
tags | [MarkerDTO](#markerdto) | 0..1 | дополнительные поля
mainCardId | string | 0..1 | основная карта, привязанная к счету
allCards | [CardDTO](#carddto) | 0..1 | список всех карт, привязанных к счету
hasRequisites | bool | 0..1 | наличие реквизитов для отправки по смс или почте

**deprecated:**

 |||
--- | ---- | :----: | ---:
openingDate | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 0..1 | 
contractNumber | string | 0..1 | 
contractStatus | string | 0..1 | 
status | string | 0..1 | 
