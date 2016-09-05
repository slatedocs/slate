## FilledFormDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор заполненной формы
formId | string | 1..1 | идентификатор соответствующей формы
values | [FieldValueDTO](#fieldvaluedto) | 1..1 | набор сохраненных значений полей в данной заполненной форме
