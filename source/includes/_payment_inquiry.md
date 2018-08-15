## استعلام وضعیت تراکنش

با استفاده از آدرس زیر می‌توانید آخرین وضعیت یک تراکنش را دریافت نمایید.

```shell
curl -X POST https://api.idpay.ir/v1/payment/inquiry \
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

$url = 'https://api.idpay.ir/v1/payment/inquiry';

$params = array(
  'id' => 'd2e353189823079e1e4181772cff5292',
  'order_id' => '101',
);

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
  'Content-Type: application/json',
  'X-API-KEY: 965b0483-4519-46b0-aca0-1a6971dc2781',
  'X-SANDBOX: true',
));

$result = curl_exec($ch);
curl_close($ch);

var_dump($result);
```

```javascript
var request = require('request');

var options = {
  method: 'POST',
  url: 'https://api.idpay.ir/v1/payment/inquiry',
  headers: {
    'Content-Type': 'application/json',
    'X-API-KEY': '965b0483-4519-46b0-aca0-1a6971dc2781',
    'X-SANDBOX': true,
  },
  body: {
    'id': 'd2e353189823079e1e4181772cff5292',
    'order_id': '101',
  },
  json: true,
};

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```go
url := "https://api.idpay.ir/v1/payment/inquiry"

data := map[string]string{
  "id":       "d2e353189823079e1e4181772cff5292",
  "order_id": "101",
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

`POST https://api.idapy.ir/v1/payment/inquiry`

### پارامترهای مورد نیاز

پارامتر | نوع | ضروری | توضیحات
------- | --- | ----- | -------
id | string | بله | کلید منحصر بفرد تراکنش که در مرحله [ایجاد تراکنش](#2c82b7acb2) دریافت شده است
order_id | string | بله | شماره سفارش پذیرنده که در مرحله [ایجاد تراکنش](#2c82b7acb2) ارسال شده است

> با اجرای دستور بالا پاسخی مشابه متن زیر با فرمت JSON دریافت می‌شود:

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

### وضعیت پاسخ

توضیحات | کد
------- | --
پاسخ دریافت شد | 200
API Key نامعتبر است | 403
IP درخواست نامعتبر است | 403
سرویس پرداخت تایید نشده است | 403
دریافت کننده مسدود شده است | 403
سرویس پرداخت یافت نشد | 404
پارامتر ارسالی نامعتبر است (شماره سفارش، کلید منحصر بفرد تراکنش) | 406

### پاسخ

پارامتر | نوع | توضیحات
------- | --- | -------
status | integer | [وضعیت تراکنش](#ad39f18522)
track_id | integer | کد رهگیری آیدی پی
id | string | کلید منحصر بفرد تراکنش که در مرحله [ایجاد تراکنش](#2c82b7acb2) دریافت شده است
order_id | string | شماره سفارش پذیرنده که در مرحله [ایجاد تراکنش](#2c82b7acb2) ارسال شده است
amount | integer | مبلغ ثبت شده هنگام [ایجاد تراکنش](#2c82b7acb2)
date | timestamp | زمان پرداخت تراکنش

<aside class="warning"> جهت جلوگیری از دوبار مصرف شدن یک پرداخت (Double Spending)،
پذیرنده موظف است کلیدهای منحصر بفردی که از طریق API آیدی پی دریافت می‌کند را (مثل <code>id</code> و <code>track_id</code>)
در دیتابیس خود ذخیره کند و از یکتا بودن آنها اطمینان حاصل فرماید.
<br/>
توجه داشته باشید که ممکن است یک مشتری رسید پرداخت آیدی پی را ذخیره کند و برای یک خرید دیگر از آن استفاده کند.
<br/>
مسئولیت بررسی و شناسایی Double Spending کاملا به عهده پذیرنده می‌باشد.</aside>
