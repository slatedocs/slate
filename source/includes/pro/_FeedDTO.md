## FeedDTO

```xml
<feeds xsi:type="FeedDTO">
  <id>feed_id</id>
  <title>% по депозиту</title>
  <type>DEPOSIT_PRODUCT</type>
</feeds>
```

Список фидов не сортируется на мобильных клиентах, а отображается в том порядке, в котором приходит с сервера

key | type | status | comment
--- | ---- | :----: | ---:
title | string | 1..1 | наименование фида
type | [FeedType](#feedtype) | 1..1 | тип ячейки в ленте

### FeedType

key | comment
--- | ---:
LOAN_PRODUCT | график погашения кредита
DEPOSIT_PRODUCT | график начисления процентов по депозиту
