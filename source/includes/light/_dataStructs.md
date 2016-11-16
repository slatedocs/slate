# Data Structs

Серверная часть в решении iDa Light является базовой составляющей и отвечает за хранение, преобразование и отображение всей информации. При запуске сервер загружает из СУБД большинство данных и производит их кэширования для ускорения работы и уменьшения нагрузки на СУБД

### Form Generator Struct

```text
www.websequencediagrams.com

participant Bank as b
participant iDaLight as l
participant Mobile as m

b->l: mergeFormTypes()
l->b: getFormTypes()
b->l: addForm(type, fields)
l->m: update mobile forms are available\nthrough new login or pull-to-refresh
m->m: filling form with field validation
m->l: response from mobile\nwith filled fields
l->b: e-mail or createOrder()
```

Все контактные формы строятся на основе заранее заведенных шаблонов. Шаблон может быть создан, например в CRM и применяться как на сайте так и в мобильном приложении

![image](https://www.websequencediagrams.com/cgi-bin/cdraw?lz=cGFydGljaXBhbnQgQmFuayBhcyBiCgAKDGlEYUxpZ2h0IGFzIGwADQ1Nb2JpbGUgYXMgbQoKYi0-bDogbWVyZ2VGb3JtVHlwZXMoKQpsLT5iOiBnZXQACQwAJgZhZGRGb3JtKHR5cGUsIGZpZWxkcwAsBW06IHVwZGF0ZSBtAFwGZm9ybXMgYXJlIGF2YWlsYWJsZVxudGhyb3VnaCBuZXcgbG9naW4gb3IgcHVsbC10by1yZWZyZXNoCm0ASQVmaWxsaW5nAEMFIHdpdGgAaAYgdmFsaWRhdGlvbgptAIE6BXJlc3BvbnNlIGZyb20AdwdcbgArB2xsZWQAgSAHAIFQB2UtbWFpbCBvciBjcmVhdGVPcmRlcigpCg&s=default)
