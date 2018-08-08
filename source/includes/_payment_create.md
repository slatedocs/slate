## ایجاد تراکنش

```shell
curl -X POST https://api.idpay.ir/v1/payment \
  -H 'Content-Type: application/json' \
  -H 'X-API-KEY: 965b0483-4519-46b0-aca0-1a6971dc2781' \
  -H 'X-SANDBOX: true' \
  -d '{
  "order_id": 101,
  "amount": 10000,
  "phone": "09382198592",
  "desc": "توضیحات پرداخت کننده",
  "callback": "https://example.com/idpay-web-service.php"
}'
```

```php
<?php

$params = array(
  'order_id' => 101,
  'amount' => 10000,
  'phone' => '09382198592',
  'desc' => 'توضیحات پرداخت کننده',
  'callback' => 'https://example.com/idpay-web-service.php',
);

$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, 'https://api.idpay.ir/v1/payment');
curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($params));
curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($curl, CURLOPT_HTTPHEADER, array(
  'Content-Type: application/json',
  'X-API-KEY: 965b0483-4519-46b0-aca0-1a6971dc2781',
  'X-SANDBOX: true'
));

$response = curl_exec($curl);
curl_close($curl);

return $response;
```

> با اجرای دستور بالا پاسخی مشابه متن زیر با فرمت JSON دریافت میشود:

```json
{
  "id": "d2e353189823079e1e4181772cff5292",
  "link": "https://idpay.ir/p/ws-sandbox/d2e353189823079e1e4181772cff5292"
}
```

با استفاده از آدرس زیر میتوانید یک تراکنش جدید ایجاد کنید.

### آدرس درخواست

`POST https://api.idapy.ir/v1/payment`

### پارامترهای مورد نیاز

پارامتر | نوع | ضروری | توضیحات
------- | --- | ----- | -------
order_id | string | بله | شماره سفارش پذیرنده ؛ به طول حداکثر 50 کاراکتر
amount | integer | بله | مبلغ قابل پرداخت به ریال ؛ مبلغ باید بین 10,000 ریال تا 500,000,000 ریال
phone | string | خیر | تلفن همراه جهت سهولت در پیگیری های بعدی ؛ به طول 11 کاراکتر. مثل 09382198592
desc | string | خیر | توضیح تراکنش ؛ به طول حداکثر 255 کاراکتر
callback | string | بله | آدرس بازگشت به سایت پذیرنده ؛ به طول حداکثر 255 کاراکتر

### داده های دریافتی

در پاسخ ، مقادیر `id` و `link` باز میگردد که بهتر است آنها را در دیتابیس خود ذخیره کنید.
