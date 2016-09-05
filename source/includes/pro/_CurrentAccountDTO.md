## CurrentAccountDTO

```xml
<currentAccounts type="CurrentAccountDTO">
   <id>current_accounts_id</id>
   <accountNumber>78595893712734543353</accountNumber>
   <allCards type="CardDTO">
      #
      # CardDTO
      #
   </allCards>
   <allCards type="CardDTO">
      #
      # CardDTO
      #
   </allCards>
   <blockedAmount type="AmountDTO">
      <currency>EUR</currency>
      <fxAmount>50000</fxAmount>
   </blockedAmount>
   <currency>EUR</currency>
   <hasRequisites>false</hasRequisites>
   <mainCardId>card_id</mainCardId>
   <productName>Credit account</productName>
   <runningBalance type="AmountDTO">
      <currency>EUR</currency>
      <fxAmount>123456</fxAmount>
   </runningBalance>
</currentAccounts>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор счета
accountNumber | string | 1..1 | номер счета
productName | string | 1..1 | название счета
currency | string | 1..1 | текстовый код валюты счета по ISO 4217
runningBalance | [AmountDTO](#amountdto) | 0..1 | основная карта, привязанная к счету
mainCard | string | 0..1 | основная карта, привязанная к счету
allCards | [CardDTO](#carddto) | 0..1 | список всех карт, привязанных к счету
hasRequisites | bool | 0..1 | наличие реквизитов для отправки по смс или почте
