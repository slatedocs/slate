---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - php
  - python
  - ruby
  - java
  - shell


toc_footers:
  - <a href='https://www.adback.co/fr/register/'>Sign Up for a Developer token</a>
  - <a href='https://www.adback.co/fr/admin/api/'>Claim your token here, must be logged</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the AdBack API documentation! You can use our API to access AdBack API endpoints, which can get non blockable URL and names for your analytics tags.

We have language bindings in PHP, Shell, Ruby, Java, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.


# How it works ?

What's the utility of the API? How it works ?

AdBlock lists are updated regularly so domains or scripts can be blocked in a very untimely manner.

The API gives a possibility to provide you with functioning domains and scripts in real time. Our system daily verifies the validity of domains and scripts we provide and in case of blocking, automatically allocates the new ones.

Therefore the implementation of the API script has to be done only once and then operates totally autonomously.

![alt text](/images/how.png)

# Implement AdBack tags !

## 1) Get script name and url

> get script URL and name, store it in your preferred local cache provider:

```php

<?php

/* here we use redis to cache api requests */
$cache = new Redis();
$cache->connect('host');

$scriptElements = json_decode(file_get_contents('https://adback.co/api/script/me?access_token=[token]'), true);
foreach ($scriptElements as $key => $value) {
    $cache->hSet('scriptElement', $key, $value);
}
$cache->expire('scriptElement', 60*60*24);

```

```python
wip
```

```ruby
wip
```

```java
wip
```

```shell

curl -X "GET" 'https://adback.co/api/script/me?access_token=[token]'

```

> The above API call returns JSON structured like this:

```json
{
  "analytics_domain": "example.url.com",
  "analytics_script": "scriptname",
  "message_domain": "example.url.com",
  "message_script": "scriptname",
  "autopromo_banner_domain": "example.url.com",
  "autopromo_banner_script": "scriptname",
  "product_domain": "example.url.com",
  "product_script": "scriptname"
}
```

### HTTP Request

`GET https://adback.co/api/script/me`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
access_token | true | Personal token for authentication, [here](https://www.adback.co/fr/admin/api/) your can get your token


<aside class="notice">
You should use cache storage to limit api calls.
</aside>


## 2) Generate

> generate autopromo script from cache:

```php

<?php

/* here we use redis to cache api requests */
$cache = new Redis();
$cache->connect('host');

if ($cache->has('scriptElement')) {
    $scriptElements = $cache->hGetAll('scriptElement');
    $autopromoBannerDomain = $scriptElements['autopromo_banner_domain'];
    $autopromoBannerScript = $scriptElements['autopromo_banner_script'];
    
    $autopromoBannerCode = 
<<< EOS
        (function (a,d){var s,t;s=d.createElement('script');
        s.src=a;s.async=1;
        t=d.getElementsByTagName('script')[0];
        t.parentNode.insertBefore(s,t);
        })("https://$autopromoBannerDomain/$autopromoBannerScript.js", document);
EOS;
}

```

```python

wip

```

```ruby

wip

```

```java

wip

```

```shell

wip

```

### Generate autopromo script from cache


<aside class="warning">You should setup cron task or service to reshresh tag every 6 hours</aside>


## 3) Display

```php

<?php

/* add a div where you want to display your banner */
echo "<div data-tag='test'></div>";

/* display script */
echo "<script>$autopromoBannerCode</script>";

```

```python

wip

```

```ruby

wip

```

```java

wip

```

```shell

wip

```

Display autopromo banner AdBack script
