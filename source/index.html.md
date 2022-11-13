---
title: مستندات وب سرویس ژاکِت

language_tabs:
  - php

toc_footers:
  - <a href='http://zhaket.com/guard/' target='_blank'>برای دریافت کلید API عضو شوید</a>

includes:

search: false
---

# معرفی

به صفحه مستندات وب سرویس ژاکِت خوش آمدید.

وب سرویس ژاکِت قابلیت ویژه‌ای است که در اختیار فروشندگان ژاکِت قرار گرفته است. با استفاده از این وب سرویس  قادر خواهید بود برای محصولات خود در ژاکِت لایسنس تعریف کرده و از کپی شدن آن‌ها و نصب‌های متعدد بر روی وبسایت‌های مختلف جلوگیری نمایید.

برای استفاده از این وب‌سرویس ابتدا کلاس PHP وب سرویس را از <a href="https://github.com/Zhaket/api">گیت‌هاب</a> دانلود نمایید و با استفاده از متدهایی که در ادامه معرفی شده اند لایسنس را در افزونه یا قالب وردپرسی خود فعال نمایید.












# نصب لایسنس 

> برای نصب و فعال سازی لایسنس از متد زیر استفاده می‌کنیم:


```php
<?php
    require 'zhaket-api.class.php';
    
    $license_token = 'LICENSE_TOKEN'; // Your license token
    $produc_token = 'PRODUCT_TOKEN'; // Your product token
    
    /*
    	@param1 : license_token
    	@param2 : product_token
    	replace it with your own license token and product token :)
    */
    $result = Zhaket_License::install($license_token, $produc_token);
    
    if ($result->status=='successful') {
        echo $result->message; // License installed successful
    } else {
        // License not installed / show message
        if (!is_object($result->message)) {// License is Invalid
            echo $result->message;
        } else {
            foreach ($result->message as $message) {
                foreach ($message as $msg) {
                    echo $msg.'<br>';
                }
            }
        }
    }
?>
```


> توجه داشته باشید که در کدهای بالا حتما مقادیر `LICENSE_TOKEN` و `PRODUCT_TOKEN` را با توکن‌های محصول و لایسنس خود جایگزین کنید.

عملیات نصب لایسنس باید پس از نصب قالب یا افزونه توسط کاربر به صورت خود کار انجام شود. برای این کار توصیه می کنیم یک قسمت به داشبورد وردپرس و تنظیمات افزونه یا قالب خود اضافه کنید و کد لایسنس را از کاربر دریافت کنید.

پس از دریافت کد لایسنس با استفاده از متد `install` اقدام به فعال‌سازی لایسنس نمایید. 

توجه داشته باشید که هر لایسنس تنها یک بار مجاز به نصب بوده و در صورتی که کاربری مایل به نصب محصول شما بر روی چند سایت باشد باید برای هر وبسایت به صورت مجزا لایسنس تهیه کند.

از قسمت سمت راست می‌توانید نمونه کدی که با متد `install` نوشته شده است را مشاهده نمایید. 

بدیهی است که کد نمونه به ساده ترین شکل ممکن نوشته شده است و برای هماهنگی کامل با محصول شما می‌بایست متناسب با ساختار محصول شما و چگونگی فرآیند فعال‌سازی در آن، کد نمونه تغییر کند.

توصیه می‌کنیم در صورت موفق بودن نصب لایسنس، به منظور بررسی وضعیت لایسنس در آینده حتما  توکن لایسنس را داخل دیتابیس کاربر ذخیره نمایید.

# بررسی وضعیت لایسنس

> برای بررسی وضعیت لایسنس از نمونه کد زیر استفاده نمایید:


```php
<?php
    require 'zhaket-api.class.php';
    
    $license_token = 'LICENSE_TOKEN'; // Your license token
    
    /*
     * @param : license token
     * replace it with your own license token :)
     */
    $result = Zhaket_License::isValid($license_token);
    
    if ($result->status=='successful') {
        echo $result->message; // License is valid
    } else {
        // License not valid / show message
        if (!is_object($result->message)) { // License is Invalid
            echo $result->message;
        } else {
            foreach ($result->message as $message) {
                foreach ($message as $msg) {
                    echo $msg.'<br>';
                }
            }
        }
    }
?>
```

> در کد بالا باید به جای `LICENSE_TOKEN` توکن لایسنس کاربر را وارد نمایید.

متد `isValid` به شما این قابلیت را خواهد داد تا وضعیت لایسنس فعال شده بر روی محصول خود را مرتبا بررسی نمایید.

برای این منظور کافی است متد `isValid` را در زمان‌های مورد نظر بررسی کنید و در صورت فعال بودن لایسنس عملیات‌های خود را انجام دهید.

توصیه می‌کنیم وضعیت لایسنس خود را هر 24 ساعت از طریق وب سرویس بررسی کرده و نتیجه را داخل دیتابیس ذخیره کنید و در بقیه مواردی که لازم به بررسی وضعیت لایسنس هستید حتما وضعیت را از دیتابیس بخوانید.








<aside class="notice">
توجه داشته باشید که قبل از چک کردن وضعیت لایسنس حتما ابتدا باید لایسنس را نصب کرده باشید. در غیر این صورت با پیغام `لایسنس نا معتبر میباشد.`  مواجه خواهید شد.
</aside>









