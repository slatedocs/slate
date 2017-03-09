## FormFieldDTO

```xml
<fields type="FormFieldDTO">
  <id>field_id</id>
  <comboBoxValues>
    <id>val_1_id</id>
    <name>product_1</name>
    <order>1</order>
    <value>40817810200005239000</value>
  </comboBoxValues>
  <comboBoxValues>
    <id>val_2_id</id>
    <name>product_2</name>
    <order>2</order>
    <value>40817810500005239001</value>
  </comboBoxValues>
  <defaultValue nil="true" />
  <errorMessage nil="true" />
  <fieldClass>SOURCE_ACCOUNT</fieldClass>
  <formOrder>1</formOrder>
  <groupName nil="true" />
  <hint nil="true" />
  <mandatory>true</mandatory>
  <maxLimit nil="true" />
  <minLimit nil="true" />
  <name>Счет списания</name>
  <readOnly>false</readOnly>
  <regExp nil="true" />
</fields>
<fields type="FormFieldDTO">
  <id>field_id</id>
  <defaultValue nil="true" />
  <errorMessage nil="true" />
  <fieldClass>AMOUNT</fieldClass>
  <formOrder>1</formOrder>
  <groupName nil="true" />
  <hint nil="true" />
  <mandatory>true</mandatory>
  <maxLimit>922337203685477</maxLimit>
  <minLimit>0</minLimit>
  <name>Сумма списания</name>
  <readOnly>false</readOnly>
  <regExp nil="true" />
</fields>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор поля
fieldClass | [FieldClass](#fieldclass) | 1..1 | тип поля формы, определяющий формат данных
mandatory | bool | 1..1 | обязательность поле формы
formOrder | int | 1..1 | порядковый номер поля в форме
name | string | 1..1 | название поля
minLimit | int | 0..1 | в зависимости от типа поля это ограничения на значение поля формы
maxLimit | int | 0..1 | в зависимости от типа поля это ограничения на значение поля формы
regExp | string | 0..1 | регулярное выражение, которому должно соответствовать значение поля и в случае несоответствия показывается errorMessage
defaultValue | string | 0..1 | значение поля по умолчанию
errorMessage | string | 0..1 | сообщение в случае, если значение поля формы не проходит валидацию
hint | string | 0..1 | отображаемая подсказка к полю
placeholder | string | 0..1 | отображаемое внутри поля
comboBoxValues | [ComboBoxValueDTO](#comboboxvaluedto) | 0..1 | список значений
readOnly | bool | 0..1 | признак редактируемости

<aside class="notice">для платежных форм валюта поля AMOUNT будет привязана к валюте в выбранном счете поля SOURCE_ACCOUNT</aside>

<aside class="notice">если тип поля – SOURCE_ACCOUNT и TARGET_ACCOUNT, comboBoxValues это список для всех допустимых счетов</aside>

### FieldClass

key | type | comment
--- | ---- | ---:
SOURCE_ACCOUNT | string | список идентификаторов продуктов в виде [ComboBoxValueDTO](#comboboxvaluedto) выбора 1..*
TARGET_ACCOUNT | string | список идентификаторов продуктов в виде [ComboBoxValueDTO](#comboboxvaluedto) выбора 1..*
SINGLE_LINE_TEXT | string | однострочный текст
MULTI_LINE_TEXT | string | многострочный текст
CHECK_BOX | bool | чекбокс {true, false}
PASSWORD | string | однострочный текст маскированный при вводе
MONTH_YEAR | string | UNIXTIME в милисекундах
DATE | int | UNIXTIME в милисекундах (например 1394582400000)
COMBO_BOX | string | список строк для comboBoxValues выбора 1..*
AMOUNT | int | ddddd (умноженное на 100) с валютой  и проверкой на остаток средств из ``SOURCE_ACCOUNT``
MONEY | int | ddddd (умноженное на 100) с валютой из ``SOURCE_ACCOUNT``
PHONE | int | номер телефона (например 71231231212)
PRINTED_TEXT | string | текст пояснение без возможности редактирования пользователем
PHOTO_CARD | string | ввода номера карты с элементом фотографирования карты библиотекой [card.io](http://www.card.io) и маской ``**** **** **** ****``, так же в дополнение для поля используется проверка алгоритмом Луна
PHOTO_QRCODE | string | информация, зашифрованную в QR-коде
IMAGE | [LogoResource](#logoresource) | картинка
HIDDEN | string | скрытое поле для технического применения
NUMERIC | int | чесло без дроби (например 1394582400)
DECIMAL | int | число с дробной частью (например 1394582400.93)
DYNAMIC | string | поле при вводе 2х символов делает запрос [getDynamicFieldValues](#getdynamicfieldvalues) и в случае признака необходимости обновления текущей формы делает запрос [getCurrentForm](#getcurrentform)

<aside class="warning">PHOTO_CHECK - эксперементальный ключ для фотографирования дорожных чеков</aside>
