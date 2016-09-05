## FieldValueDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор заполненного поля
formFieldId | string | 1..1 | идентификатор соответствующего поля FormFieldDTO формы FormDTO
value | string | 1..1 | сохраненное значение поля. Формат содержимого зависит от значения fieldClass соответствующего поля формы
