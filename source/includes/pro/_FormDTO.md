## FormDTO

> Запрос на сервер, пример:

```xml
<soap:Body>
  <getStandardForms>
    <bankClientId>client_id</bankClientId>
    <hash>forms_hash</hash>
  </getStandardForms>
 </soap:Body>
```

> Ответ сервера, пример:

```xml
<soap:Body>
  <getPaymentFormResponse xmlns="http://core.proxy.platform.idamobile.com">
    <return>
      <form xmlns="http://servicedto.dto.proxy.platform.idamobile.com/xsd">
        <id xmlns="http://modeldto.dto.proxy.platform.idamobile.com/xsd">form_id</id>
        <beneficiaryId xsi:nil="true" xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd" />
          <fields>
            #
            # fields
            #
          </fields>
          <fields>
            #
            # fields
            #
          </fields>
        <hasNext xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">true</hasNext>
        <logoResource xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">http://idamob.ru/ic.png</logoResource>
        <name xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">Form name</name>
        <position xsi:nil="true" xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd" />
        <requiresCommission xmlns ="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">false</requiresCommission>
        <type xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">PAYMENT</type>
      </form>
    </return>
  </getPaymentFormResponse>
</soap:Body>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор формы
name | string | 1..1 | название формы
beneficiaryId | string | 0..1 | идентификатор получателя, соответствующий форме
fields | [FormFieldDTO](#formfielddto) | 1..1 | список всех полей на форме
type | [FormType](#formtype) | 1..1 | тип формы для переходов или идентификатор (может быть не уникальный)
hasNext | bool | 1..1 | признак наличия следующей формы. Если значение поля равно TRUE, то при заполнении данной формы клиент запросит с сервера следующую форму вместо запроса на осуществление платежа
requiresCommission | bool | 0..1 | признак необходимости запроса комиссии с сервера с помощью метода [requestCommission](#requestcommission)
logoResource | [LogoResource](#logoresource) | 0..1 | url для доступа к логотипу
position | [FormPosition](#formposition) | 0..1 | расположение формы для ряда уникальных кейсов
showConfirmation | bool | 0..1 | показ экрана подтверждения

### FormType
key | comment
--- | ---:
id | любое значение, может быть не уникальное, например TRANSFER, PAYMENT
TRANSFER_CURRENCY_EXCHANGE | форма для обмена валют через раздел курсы банка
TRANSFER_BY_PHONE | форма для раздела оплаты по номеру телефона (всегда HIDDEN), при ее наличии появляется раздел перевода по номеру телефона

### FormPosition
key | comment
--- | ---:
HIDDEN | форма не видна в списках, но на нее возможен переход через таргет продукта или пуш сообщения
PRODUCT_ORDER | форма попадает в отдельный раздел бокового меню
