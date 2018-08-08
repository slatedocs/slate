## ایجاد تراکنش

با استفاده از آدرس زیر می‌توانید یک تراکنش جدید ایجاد کنید.

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

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://api.idpay.ir/v1/payment');
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
  'Content-Type: application/json',
  'X-API-KEY: 965b0483-4519-46b0-aca0-1a6971dc2781',
  'X-SANDBOX: true'
));

$result = curl_exec($ch);
curl_close($ch);

return $result;
```

```go

```

```javascript

```

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

> با اجرای دستور بالا پاسخی مشابه متن زیر با فرمت JSON دریافت می‌شود:

```json
{
  "id": "d2e353189823079e1e4181772cff5292",
  "link": "https://idpay.ir/p/ws-sandbox/d2e353189823079e1e4181772cff5292"
}
```

### پاسخ

درصورتیکه درخواست موفق باشد، وضعیت `201 Created` اعلام خواهد شد.

در پاسخ، مقادیر `id` و `link` باز میگردد که بهتر است آنها را در دیتابیس خود ذخیره کنید.
بعد از ذخیره اطلاعات دریافتی، پرداخت کننده باید به لینک دریافت شده منتقل شود.
