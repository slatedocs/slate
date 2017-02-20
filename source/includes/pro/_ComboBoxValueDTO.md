## ComboBoxValueDTO

```xml
<comboBoxValues>
  <id>val_id</id>
  <name>Некая надпись для удобства пользователя</name>
  <order>1</order>
  <value>id_for_server</value>
</comboBoxValues>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | уникальный идентификатор поля внутри системы, может быть равен value
name | string | 1..1 | строка или accountNamber или cardId, отображаемая в списке
order | int | 1..1 | порядковый номер значения поля в списке
value | string | 1..1 | значение, которое будет отправляться в прокси в ответе апликации

<aside class="notice">SOURCE_ACCOUNT и TARGET_ACCOUNT для name ожидают accountNumber или id продукта</aside>