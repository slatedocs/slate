## ایجاد تراکنش

با استفاده از آدرس زیر می‌توانید یک تراکنش جدید ایجاد کنید.

<aside class="notice">
دامنه آدرس بازگشت به سایت پذیرنده یا <code>callback</code> باید مطابق با آدرسی باشد که در <a href="https://idpay.ir/dashboard/web-services">وب سرویس‌های من</a> تعریف شده است.
</aside>

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
  "callback": "https://example.com/callback"
}'
```

```php
<?php

$url = 'https://api.idpay.ir/v1/payment';

$params = array(
  'order_id' => '101',
  'amount' => 10000,
  'phone' => '09382198592',
  'desc' => 'توضیحات پرداخت کننده',
  'callback' => 'https://example.com/callback',
);

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
  'Content-Type: application/json',
  'X-API-KEY: 965b0483-4519-46b0-aca0-1a6971dc2781',
  'X-SANDBOX: true'
));

$result = curl_exec($ch);
$httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

var_dump($httpcode);
var_dump($result);
```

```javascript
var request = require('request');

var options = {
  method: 'POST',
  url: 'https://api.idpay.ir/v1/payment',
  headers: {
    'Content-Type': 'application/json',
    'X-API-KEY': '965b0483-4519-46b0-aca0-1a6971dc2781',
    'X-SANDBOX': true,
  },
  body: {
    'order_id': '101',
    'amount': 10000,
    'phone': '09382198592',
    'desc': 'توضیحات پرداخت کننده',
    'callback': 'https://example.com/callback',
  },
  json: true,
};

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```go
url := "https://api.idpay.ir/v1/payment"

data := map[string]string{
  "order_id": "101",
  "amount":   "10000",
  "phone":    "09382198592",
  "desc":     "توضیحات پرداخت کننده",
  "callback": "https://example.com/callback",
}

payload, _ := json.Marshal(data)

req, _ := http.NewRequest("POST", url, bytes.NewBuffer(payload))

req.Header.Set("Content-Type", "application/json")
req.Header.Set("X-API-KEY", "965b0483-4519-46b0-aca0-1a6971dc2781")
req.Header.Set("X-SANDBOX", "true")

res, _ := http.DefaultClient.Do(req)

defer res.Body.Close()
body, _ := ioutil.ReadAll(res.Body)

fmt.Println(string(body))
```

### آدرس درخواست

`POST https://api.idpay.ir/v1/payment`

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

### وضعیت پاسخ

کد | شناسه خطا | توضیحات
-- | --------- | -------
201 | - | تراکنش ایجاد شد
403 | -4 | شما به این سرویس دسترسی ندارید
403 | -3 | IP درخواست نامعتبر است
403 | -2 | سرویس پرداخت تایید نشده است
403 | -1 | دریافت کننده مسدود شده است
406 | 1 | این سرویس در دسترس نیست
404 | 2 | سرویس پرداخت یافت نشد
403 | 5 | API Key نامعتبر است
406 | 6 | پارامتر ارسالی خالی یا نامعتبر است (شماره سفارش)
406 | 7 | پارامتر ارسالی خالی یا نامعتبر است (مبلغ)
406 | 8 | پارامتر ارسالی خالی یا نامعتبر است (آدرس بازگشت)
404 | 9 | آدرس بازگشت مطابق با تنظیمات سرویس نیست
403 | 10 | حساب بانکی سرویس تایید نشده است
404 | 11 | مبلغ کمتر از حداقل است
404 | 12 | مبلغ بیشتر از حداکثر است
406 | 13 | سرویس در حال حاضر غیرفعال است
406 | 14 | تراکنش ایجاد نشد


### پاسخ

درصورتیکه درخواست موفق باشد، وضعیت `201 Created` اعلام خواهد شد.

در پاسخ، مقادیر `id` و `link` باز میگردد که بهتر است آنها را در دیتابیس خود ذخیره کنید.
بعد از ذخیره اطلاعات دریافتی، پرداخت کننده باید به لینک دریافت شده منتقل شود.

پارامتر | نوع | توضیحات
------- | --- | -------
id | string | کلید منحصر بفرد تراکنش
link | string | لینک پرداخت برای انتقال خریدار به آن