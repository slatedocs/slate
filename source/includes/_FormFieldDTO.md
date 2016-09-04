## FormFieldDTO

```xml
<fields xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">
  <id xmlns="http://modeldto.dto.proxy.platform.idamobile.com/xsd">field_id</id>
  <comboBoxValues>
    <id xmlns="http://modeldto.dto.proxy.platform.idamobile.com/xsd">val_id</id>
    <name>40817810200005239000</name>
    <order>1</order>
    <value>40817810200005239000</value>
  </comboBoxValues>
  <comboBoxValues>
    <id xmlns="http://modeldto.dto.proxy.platform.idamobile.com/xsd">val_id</id>
    <name>40817810500005239001</name>
    <order>2</order>
    <value>40817810500005239001</value>
  </comboBoxValues>
  <defaultValue xsi:nil="true" />
  <errorMessage xsi:nil="true" />
  <fieldClass>SOURCE_ACCOUNT</fieldClass>
  <formOrder>1</formOrder>
  <groupName xsi:nil="true" />
  <hint xsi:nil="true" />
  <mandatory>true</mandatory>
  <maxLimit>0</maxLimit>
  <minLimit>0</minLimit>
  <name>Счет списания</name>
  <readOnly>false</readOnly>
  <regExp xsi:nil="true" />
</fields>
<fields xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">
  <id xmlns="http://modeldto.dto.proxy.platform.idamobile.com/xsd">field_id</id>
  <defaultValue xsi:nil="true" />
  <errorMessage xsi:nil="true" />
  <fieldClass>MONEY</fieldClass>
  <formOrder>1</formOrder>
  <groupName xsi:nil="true" />
  <hint xsi:nil="true" />
  <mandatory>true</mandatory>
  <maxLimit>922337203685477</maxLimit>
  <minLimit>0</minLimit>
  <name>Сумма списания</name>
  <readOnly>false</readOnly>
  <regExp xsi:nil="true" />
</fields>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор поля
name | string | 0..1 | название поля
formOrder | int | 1..1 | порядковый номер поля в форме
minLimit | int | 0..1 | в зависимости от типа поля это ограничения на значение поля формы
maxLimit | int | 0..1 | в зависимости от типа поля это ограничения на значение поля формы
regExp | string | 0..1 | регулярное выражение, которому должно соответствовать значение поля и в случае несоответствия показывается errorMessage
defaultValue | string | 0..1 | значение поля по умолчанию
mandatory | bool | 1..1 | обязательность поле формы
errorMessage | string | 0..1 | сообщение в случае, если значение поля формы не проходит валидацию
hint | string | 0..1 | отображаемая подсказка к полю
placeholder | string | 0..1 | отображаемое string внутри текстового поля
fieldClass | [FieldClass](#introduction) | 1..1 | тип поля формы, определяющий формат данных
comboBoxValues | [ComboBoxValueDTO](#introduction) | 0..1 | список значений выпадающего списка, если тип поля – COMBOBOX; список пар {номер счета, идентификатор счета} для всех допустимых счетов, если тип поля – SOURCE_ACCOUNT и TARGET_ACCOUNT






























