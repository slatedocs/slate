## TemplateDTO

```xml
<templates type="TemplateDTO">
  <id>template</id>
  <filledForm type="FilledFormDTO">
    <id>filled_form_1</id>
    <formId>form_1</formId>
    <values type="FieldValueDTO">
      <id>form_1_2_val</id>
      <formFieldId>form_1_2</formFieldId>
      <value>1000000</value>
    </values>
  </filledForm>
  <form type="FormDTO">
    <id>form_1</id>
    <fields type="FormFieldDTO">
      <id>form_1_2</id>
      <fieldClass>MONEY</fieldClass>
      <formOrder>2</formOrder>
      <name>Amount</name>
    </fields>
    <hasNext>false</hasNext>
    <name>Transfer</name>
    <requiresCommission>false</requiresCommission>
    <showConfirmation>false</showConfirmation>
    <type>TRANSFER</type>
  </form>
  <logoResource nil="true"/>
  <name>To Credit</name>
</templates>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор шаблона
name | string | 1..1 | название шаблона
form | [FormDTO](#formdto) | 1..1 | соответствующая шаблону форма
filledForm | [FilledFormDTO](#filledformdto) | 1..1 | заполненные поля формы
logoResource | [LogoResource](#logoresource) | 0..1 | url для доступа к логотипу
