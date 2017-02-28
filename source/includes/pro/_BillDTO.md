## BillDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | уникальный идентификатор
name | string | 1..1 | название счета
form | [FormDTO](#formdto) | 1..1 | соответствующая счету форма
filledForm | [FilledFormDTO](#filledformdto) | 1..1 | соответствующая счету заполненная форма
logoResource | [LogoResource](#logoresource) | 0..1 | url для доступа к логотипу
description | string | 0..1 | описание счета

<aside class="notice">если необходимо в списке счетов отображать еще и сумму, то в форме необходимо подать поле типа AMOUNT</aside>
