## MarkerDTO

key | type | status | comment
--- | ---- | :----: | ---:
key | string | 1..1 | идентификатор маркера
value | string | 0..1 | информация, привязанная к маркеру

### BankClientDTO support MarkerDTO:

key | comment
--- | ---:
SPECIAL_ORDERS | наличие раздела в боковом меню с именем String, в который собираются формы с признаком PRODUCT_ORDER
FINANCIAL_REPORTS | наличие в меню раздела финансовой аналитики, запрос на аналитику идет через getTransactionsByDates с полем продукта FINANCIAL_REPORTS
PERSONAL_NEWS | наличие в меню раздела персональных новостей или уведомлений о событиях

<aside class="notice">INCASSO : FLAG_COLLECTION, FLAG_SEQUESTRATION, FLAG_CALL_ANFSEQ</aside>

### AccountDTO, CardDTO support MarkerDTO:

key | type | status | comment
--- | ---- | :----: | ---:
BUTTON_1_TEXT | string | 1..1 | текст подсказки на кнопке
BUTTON_1_TARGET | string | 0..1 | переход по нажатию кнопки
ANALYTICS | string | 1..1 | наличие на продукте кнопки перехода на экран аналитики

key | comment
--- | ---:
payment_full | раздел платежей полностью
payment_short | платежный раздел короткий
FormType | открытие формы

<aside class="notice">если необходимо более одной кнопки используется изменение порядкового номера в ключе, например BUTTON_2_TEXT</aside>