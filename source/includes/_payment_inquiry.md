## استعلام وضعیت تراکنش

```shell
curl -X POST \
  https://api.idpay.ir/v1/payment/inquiry \
  -H 'Content-Type: application/json' \
  -H 'X-API-KEY: 965b0483-4519-46b0-aca0-1a6971dc2781' \
  -H 'X-SANDBOX: true' \
  -d '{
  "id": "d2e353189823079e1e4181772cff5292",
  "order_id": "101"
}'
```

```php
<?php

$params = array(
  'id' => 'd2e353189823079e1e4181772cff5292',
  'order_id' => 101,
);

$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, 'https://api.idpay.ir/v1/payment/inquiry');
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
  "status": "1",
  "track_id": "10012",
  "id": "d2e353189823079e1e4181772cff5292",
  "order_id": "101",
  "amount": "10000",
  "date": "1533559373"
}
```

با استفاده از آدرس زیر میتوانید آخرین وضعیت یک تراکنش را دریافت نمایید.

### آدرس درخواست

`POST https://api.idapy.ir/v1/payment/inquiry`

### پارامترهای مورد نیاز

پارامتر | نوع | ضروری | توضیحات
------- | --- | ----- | -------
id | string | بله | کلید منحصر بفرد تراکنش که در مرحله [ایجاد تراکنش](#c92c9baf91) دریافت شده است
order_id | string | بله | شماره سفارش پذیرنده که در مرحله [ایجاد تراکنش](#c92c9baf91) ارسال شده است


### داده های دریافتی

پارامتر | نوع | توضیحات
------- | --- | -------
status | integer | [وضعیت تراکنش](#ad39f18522)
track_id | integer | کد رهگیری آیدی پی
id | string | کلید منحصر بفرد تراکنش که در مرحله [ایجاد تراکنش](#c92c9baf91) دریافت شده است
order_id | string | شماره سفارش پذیرنده که در مرحله [ایجاد تراکنش](#c92c9baf91) ارسال شده است
amount | integer | مبلغ ثبت شده هنگام [ایجاد تراکنش](#c92c9baf91)
date | timestamp | زمان پرداخت تراکنش

<aside class="warning">توضیح double spending</aside>
