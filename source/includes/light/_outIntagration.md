# Out Intagration

```text
www.websequencediagrams.com

participant Bank as b
participant CRM as c
participant iDaLight as l
participant Mobile as m

b->l: add form types to PostgresBD via sql script
c->l: getFormTypes()
c->l: addForm(type, fields)
l->m: update mobile forms are available\nthrough new login or pull-to-refresh
m->m: filling form with field validation
m->l: response from mobile\nwith filled fields
l->c: createOrder()
```

Уведомления обратной связи через внешний Web-сервис

Данный сервис разработан для интеграции с внешней CRM и позволяет направлять данные, полученные через контактные формы. Пример [WSDL](http://dev.idamob.ru/orders-server-stub/services/OrdersWebServiceFacade?wsdl)

![image](https://www.websequencediagrams.com/cgi-bin/cdraw?lz=cGFydGljaXBhbnQgQmFuayBhcyBiCgAKDENSTSBhcyBjAAgNaURhTGlnaHQgYXMgbAAiDU1vYmlsZSBhcyBtCgpiLT5sOiBhZGQgZm9ybSB0eXBlcyB0byBQb3N0Z3Jlc0JEIHZpYSBzcWwgc2NyaXB0CmMALQVnZXRGb3JtVHlwZXMoKQAOB2FkZEZvcm0odHlwZSwgZmllbGRzKQpsLT5tOiB1cGRhdGUgbQB3BmZvcm1zIGFyZSBhdmFpbGFibGVcbnRocm91Z2ggbmV3IGxvZ2luIG9yIHB1bGwtdG8tcmVmcmVzaAptAEkFZmlsbGluZwCBLwZ3aXRoAGgGIHZhbGlkYXRpb24KbQCBVQVyZXNwb25zZSBmcm9tAHcHXG4AKwdsbGVkAIEgBwpsLT5jOiBjcmVhdGVPcmRlcigp&s=default)
