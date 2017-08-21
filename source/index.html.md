---
title: AdBack API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - php
  - python
  - java
  - ruby
  - shell
  - twig


toc_footers:
  - <a href='https://www.adback.co/en/register/'>Sign Up for a Developer token</a>
  - <a href='https://www.adback.co/en/admin/api/'>Claim your token here, must be logged</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the AdBack API documentation! You can use our API to access AdBack API endpoints, which can get non blockable URL and names for your analytics tags.

We have language bindings in PHP, Shell, Ruby, Java, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.


# How it works?

What's the utility of the API? How it works?

AdBlock lists are updated regularly so domains or scripts can be blocked in a very untimely manner.

The API gives a possibility to provide you with functioning domains and scripts in real time. Our system daily verifies the validity of domains and scripts we provide and in case of blocking, automatically allocates the new ones.

Therefore the implementation of the API script has to be done only once and then operates totally autonomously.

![AdBack schema](/images/how.png)

# Implement AdBack tags!

## 1) Get script names and URL

> sample script:

```php
<?php

/* here we use redis to cache api requests */
$cache = new Redis();
$cache->connect('host');

$scriptElements = json_decode(file_get_contents('https://adback.co/api/script/me?access_token=[token]'), true);
/** @var array $scriptElements */
foreach ($scriptElements as $key => $value) {
    $cache->hSet('scriptElement', $key, $value);
}
$cache->expire('scriptElement', 60 * 60 * 6);
```

```python
import redis
import requests

'''here we use redis to cache api requests'''
r_server = redis.Redis('host', 'port')
script_elements = requests.get('https://adback.co/api/script/me?access_token=[token]').json()
for (key, value) in script_elements.items():
    r_server.hset('script_element', key, value.encode("utf8"))
r_server.expire('script_element', 60 * 60 * 6)
```

```java

```

```ruby
require "redis"
require "json"
require 'open-uri'

# here we use redis to cache api requests
cache = Redis.new(:host => "HOST")
script = open('https://adback.co/api/script/me?access_token=[token]').read
script_elements = JSON.parse(script)
script_elements.each do |key, value|
  cache.hset('script_element', key, value)
end
cache.expire('script_element', 60 * 60 * 6)
```

```shell
# curl command

curl -X "GET" 'https://adback.co/api/script/me?access_token="token"'
```

```twig
# Launch the Symfony command to refesh the tags

$ php app/console adback:api-client:refresh-tag
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

AdBack provides 4 different scripts that you can generate and display from your server.

Here is the first step to implement AdBack solution.

Call AdBack API to get script names and URL, store it in your preferred local cache provider.

### Code logic:

* connect to your cache provider to limit api calls (here Redis)

* call AdBack API to get tags information's 

* cache all information

* set cache expiry time to 6 hours

### HTTP Request:

`GET https://adback.co/api/script/me`

### Query Parameters:

Parameter | Required | Description
--------- | -------- | -----------
access_token | Yes | Personal token for authentication, [here](https://www.adback.co/en/admin/api/) your can get your token

<aside class="notice">
If API doesn't return all script names or URL, please check your configuration <a href="https://www.adback.co/en/integration/admin/activation">here</a> and make sure all tags are activated.
</aside>

<aside class="warning">You should setup cron task or service to reenesh tag every 6 hours</aside>

## 2) Analytics script

> sample script:

```php

<?php
/* here we use redis to cache api requests */
$cache = new Redis();
$cache->connect('host', 'port');

$analyticsScriptCode = '';
if ($cache->has('scriptElement')) {
    $scriptElements = $cache->hGetAll('scriptElement');
    $analyticsDomain = $scriptElements['analytics_domain'];
    $analyticsScript = $scriptElements['analytics_script'];
    
    $analyticsScriptCode = <<<EOS
        (function (a,d){var s,t;s=d.createElement('script');
        s.src=a;s.async=1;
        t=d.getElementsByTagName('script')[0];
        t.parentNode.insertBefore(s,t);
        })("https://$analyticsDomain/$analyticsScript.js", document);
EOS;
}

/* display tag */
echo "<script>$analyticsScriptCode</script>";
```

```python
import redis
import requests

'''here we use redis to cache api requests'''
r_server = redis.Redis('host', 'port')
analytics_script_code = ''
if r_server.exists('script_element'):
    script_elements = r_server.hgetall('script_element')
    analytics_domain = script_elements['analytics_domain']
    analytics_script = script_elements['analytics_script']
    
    analytics_script_code = """
    (function (a,d){var s,t;s=d.createElement('script');
    s.src=a;s.async=1;
    t=d.getElementsByTagName('script')[0];
    t.parentNode.insertBefore(s,t);
    })(\"https://%s/%s.js\", document);
    """ % (analytics_domain, analytics_script)

''' display tag '''
print "<script>%s</script>" % analytics_script_code
```

```java
```

```ruby
require "redis"
require "json"
require 'open-uri'

# here we use redis to cache api requests
cache = Redis.new(:host => "HOST")
analytics_script_code = '';
if cache.exists('script_element')
  script_elements = cache.hgetall('script_element');
  analytics_domain = script_elements['analytics_domain'];
  analytics_script = script_elements['analytics_script'];
    
  analytics_script_code = """
  (function (a,d){var s,t;s=d.createElement('script');
  s.src=a;s.async=1;
  t=d.getElementsByTagName('script')[0];
  t.parentNode.insertBefore(s,t);
  })(\"https://#{analytics_domain}/#{analytics_script}.js\", document);
  """
end

# display tag
puts "<script>#{analytics_script_code}</script>"
```

```shell
# bash script to test api consumption
$ wget https://raw.githubusercontent.com/adback-anti-adblock-solution/adback-bash-refresh/master/adback-refresh-tags

$ chmod +x adback-refresh-tags

# display analytics tag with option -a and -html
$ ./adback-refresh-tags "token" -a -html
```

```twig
{{ adback_generate_scripts() }}
```

AdBack analytics provide unique data on adblock users (blocked pages, types of adblockers, Ghostery users, acceptable ads Eyeo users, precise repartition on desktop and mobile adblocker users, etc)

### Code logic:

* connect to your cache provider (here Redis)

* get script names and URL

* generate and display tag

### Single page application

You must call javascript function `adback.API().send()` to count your one page views after the analytics AdBack tag.

<aside class="notice">If you run single page application, don't forget to call javascript function `adback.API().send()` to count your pages views</aside>


## 3) Message script


> sample script:

```php
<?php

/* here we use redis to cache api requests */
$cache = new Redis();
$cache->connect('host', 'port');

$messageCode = '';
if ($cache->has('scriptElement')) {
    $scriptElements = $cache->hGetAll('scriptElement');
    if (isset($scriptElements['message_script'])) {
        $messageDomain = $scriptElements['message_domain'];
        $messageScript = $scriptElements['message_script'];
        $messageCode = <<<EOS
        (function (a,d){var s,t;s=d.createElement(‘script’);
        s.src=a;s.async=1;
        t=d.getElementsByTagName('script')[0];
        t.parentNode.insertBefore(s,t);
        })("https://$messageDomain/$messageScript.js", document);
EOS;
    }
}

/* display tag */
echo "<script>$messageCode</script>";

/* script you can set to display message on certain pages of your site */
echo "<script>var adback = adback || {}; adback.perimeter = 'perimeter1';</script>";
```

```python
import redis
import requests

'''here we use redis to cache api requests'''
r_server = redis.Redis('host', 'port')
message_code = ''
if r_server.exists('script_element'):
    script_elements = r_server.hgetall('script_element')
    message_domain = script_elements['message_domain']
    message_script = script_elements['message_script']

    message_code = """
    (function (a,d){var s,t;s=d.createElement('script');
    s.src=a;s.async=1;
    t=d.getElementsByTagName('script')[0];
    t.parentNode.insertBefore(s,t);
    })(\"https://%s/%s.js\", document);
    """ % (message_domain, message_script)

''' display tag '''
print "<script>%s</script>" % message_code

''' script you can set to display message on certain pages of your site '''
print "<script>var adback = adback || {}; adback.perimeter = 'perimeter1';</script>"
```

```java
```

```ruby
require "redis"
require "json"
require 'open-uri'

# here we use redis to cache api requests
cache = Redis.new(:host => 'host')
message_code = '';
if cache.exists('script_element')
  script_elements = cache.hgetall('script_element');
  unless script_elements['message_script'].nil?
    message_domain = script_elements['message_domain'];
    message_script = script_elements['message_script'];
    message_code = """
    (function (a,d){var s,t;s=d.createElement('script');
    s.src=a;s.async=1;
    t=d.getElementsByTagName('script')[0];
    t.parentNode.insertBefore(s,t);
    })(\"https://#{message_domain}/#{message_script}.js\", document);
    """
  end
end

# display tag
puts "<script>#{message_code}</script>"

# script you can set to display message on certain pages of your site
puts "<script>var adback = adback || {}; adback.perimeter = 'perimeter1';</script>"
```

```shell
# bash script to test api consumption
$ wget https://raw.githubusercontent.com/adback-anti-adblock-solution/adback-bash-refresh/master/adback-refresh-tags

$ chmod +x adback-refresh-tags

# display message tag with option -c and -html
$ ./adback-refresh-tags "token" -c -html
```

```twig
<!-- Make sure to include it only once -->
{{ adback_generate_scripts() }}
```

The custom message allows to dialog with adblock users, through a smart paywall able tu push several alternatives (whilsting tutorial, video watching).

### Code logic:

* connect to your cache provider (here Redis)

* get script names and URL

* generate javascript tag

* display tag

* [optional] create adback.perimeter variable and set the perimeter

* [optional] add custom class to your `<body>` if CONTENT LIMITATION is check

### Script Parameters:

Parameter | Required | Description
--------- | -------- | -----------
adback.perimeter | No | Variable you can set to display message on certain pages of your site, perimeter can be configured <a href="https://www.adback.co/en/monitoring/custom">here</a>

Back office configuration example:

![message perimeter](/images/perimeter_message.png)

### Specific format - restriction content message:

You can display text inside the article content and show only the 400 first character of an article for example.

> restricted body example:

```html
<!-- article example -->
<body class="test_restriction_content">
    Section 1.10.32 du "De Finibus Bonorum et Malorum" de Ciceron (45 av. J.-C.)

    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, 
    totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. 
    Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui 
    ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, 
    adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. 
    Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi 
    consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, 
    vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
</body>
```

![content restriction](/images/content_restriction.png)

<aside class="notice">You should configure your message after tag installation, <a href="https://www.adback.co/en/monitoring/custom">here</a>
you can see a preview of all your messages and publish / unpublish it</aside>


## 4) Autopromo banner script

> sample script:

```php
<?php

/* here we use redis to cache api requests */
$cache = new Redis();
$cache->connect('host', 'port');

$autopromoBannerCode = '';
if ($cache->has('scriptElement')) {
    $scriptElements = $cache->hGetAll('scriptElement');
    if (isset($scriptElements['autopromo_banner_script'])) {
    $autopromoBannerDomain = $scriptElements['autopromo_banner_domain'];
    $autopromoBannerScript = $scriptElements['autopromo_banner_script'];
    $autopromoBannerCode = <<<EOS
        (function (a,d){var s,t;s=d.createElement('script');
        s.src=a;s.async=1;
        t=d.getElementsByTagName('script')[0];
        t.parentNode.insertBefore(s,t);
        })("https://$autopromoBannerDomain/$autopromoBannerScript.js", document);
EOS;
    }
}

/* add div where you want to display your banner with placement 'header_728x90' */
echo "<div data-tag='header_728x90'></div>";

/* add div where you want to display your banner with placement 'side_300x250_actu' */
echo "<div data-tag='side_300x250_actu'></div>";

/* display tag */
echo "<script>$autopromoBannerCode</script>";
```

```python
import redis
import requests

'''here we use redis to cache api requests'''
r_server = redis.Redis('host', 'port')
autopromo_banner_code = ''
if r_server.exists('script_element'):
    script_elements = r_server.hgetall('script_element')
    autopromo_banner_domain = script_elements['autopromo_banner_domain']
    autopromo_banner_script = script_elements['autopromo_banner_script']

    autopromo_banner_code = """
    (function (a,d){var s,t;s=d.createElement('script');
    s.src=a;s.async=1;
    t=d.getElementsByTagName('script')[0];
    t.parentNode.insertBefore(s,t);
    })(\"https://%s/%s.js\", document);
    """ % (autopromo_banner_domain, autopromo_banner_script)

'''add div where you want to display your banner with placement 'header_728x90' '''
print "<div data-tag='header_728x90'></div>"

'''add div where you want to display your banner with placement 'side_300x250_actu' '''
print "<div data-tag='side_300x250_actu'></div>"

'''display tag'''
print "<script>%s</script>" % autopromo_banner_code
```

```java
```


```ruby
require "redis"
require "json"
require 'open-uri'

# here we use redis to cache api requests
cache = Redis.new(:host => "HOST")
autopromo_banner_code = '';
if cache.exists('script_element')
  script_elements = cache.hgetall('script_element');
  unless script_elements['autopromo_banner_script'].nil?
    autopromo_banner_domain = script_elements['autopromo_banner_domain'];
    autopromo_banner_script = script_elements['autopromo_banner_script'];
    autopromo_banner_code = """
    (function (a,d){var s,t;s=d.createElement('script');
    s.src=a;s.async=1;
    t=d.getElementsByTagName('script')[0];
    t.parentNode.insertBefore(s,t);
    })(\"https://#{autopromo_banner_domain}/#{autopromo_banner_script}.js\", document);
    """
  end
end

# add div where you want to display your banner with placement 'header_728x90'
puts "<div data-tag='header_728x90'></div>"

# add div where you want to display your banner with placement 'side_300x250_actu'
puts "<div data-tag='side_300x250_actu'></div>"

# display tag
puts "<script>#{autopromo_banner_code}</script>"
```

```shell
# bash script to test api consumption
$ wget https://raw.githubusercontent.com/adback-anti-adblock-solution/adback-bash-refresh/master/adback-refresh-tags

$ chmod +x adback-refresh-tags

# display autopromo banner tag with option -b and -html
$ ./adback-refresh-tags "token" -b -html
```

```twig
<!-- add div where you want to display your banner with placement 'header_728x90' -->
<div data-tag='header_728x90'></div>

<!-- add div where you want to display your banner with placement 'side_300x250_actu' -->
<div data-tag='side_300x250_actu'></div>

{{ adback_generate_autopromo_banner_script() }}
```

Our auto-promo banners permit to display ads for premium campaigns or your own content on blocked ads placements.

![Autopromo](/images/autopromo.png)

### Code logic:

* connect to your cache provider (here Redis)

* get script names and URL

* generate and display tag with one placement / banner

### Script Parameters:

Parameter | Required | Description
--------- | -------- | -----------
placement | Yes | Variable you must set to display one banner, data-tag takes one placement and can be configured <a href="https://www.adback.co/en/autopromo/banners">here</a>

Back office configuration example:

![Autopromo perimeter](/images/autopromo_placement.png)

### placement naming:

You should name your placement like back office example, location _ dimension _ campaign promo name,

`header_728x90  ou  side_300x250_actu`

Make sure this names match the back office configuration.

<aside class="notice">After tag installation, you must create new banner <a href="https://www.adback.co/en/autopromo/banners">here</a> for every placement that you integrate before.</aside>


## 5) Product flow script

> sample script:

```php
<?php

/* here we use redis to cache api requests */
$cache = new Redis();
$cache->connect('host');

$productFlowCode = '';
if ($cache->has('scriptElement')) {
    $scriptElements = $cache->hGetAll('scriptElement');
    if (isset($scriptElements['product_script'])) {
        $productDomain = $scriptElements['product_domain'];
        $productScript = $scriptElements['product_script'];
        $productFlowCode = <<<EOS
        (function (a,d){var s,t;s=d.createElement(‘script’);
        s.src=a;s.async=1;
        t=d.getElementsByTagName('script')[0];
        t.parentNode.insertBefore(s,t);
        })("https://$productDomain/$productScript.js", document);
EOS;
    }
}

/* display product flow script */
echo "<script>$productFlowCode</script>";
```

```python
import redis
import requests

'''here we use redis to cache api requests'''
r_server = redis.Redis('host', 'port')
product_flow_code = ''
if r_server.exists('script_element'):
    script_elements = r_server.hgetall('script_element')
    product_domain = script_elements['product_domain']
    product_script = script_elements['product_script']

    product_flow_code = """
    (function (a,d){var s,t;s=d.createElement('script');
    s.src=a;s.async=1;
    t=d.getElementsByTagName('script')[0];
    t.parentNode.insertBefore(s,t);
    })(\"https://%s/%s.js\", document);
    """ % (product_domain, product_script)

'''add div where you want to display your banner with placement header_728x90'''
print "<div data-tag='header_728x90'></div>"

'''add div where you want to display your banner with placement side_300x250_actu'''
print "<div data-tag='side_300x250_actu'></div>"

'''display tag'''
print "<script>%s</script>" % product_flow_code
```

```java
```

```ruby
require "redis"
require "json"
require 'open-uri'

# here we use redis to cache api requests
cache = Redis.new(:host => "HOST")
product_flow_code = '';
if cache.exists('script_element')
  script_elements = cache.hgetall('script_element');
  unless script_elements['product_script'].nil?
    product_domain = script_elements['product_domain'];
    product_script = script_elements['product_script'];
    product_flow_code = """
    (function (a,d){var s,t;s=d.createElement('script');
    s.src=a;s.async=1;
    t=d.getElementsByTagName('script')[0];
    t.parentNode.insertBefore(s,t);
    })(\"https://#{product_domain}/#{product_script}.js\", document);
    """
  end
end

# display tag
puts "<script>#{product_flow_code}</script>"

```

```shell
# bash script to test api consumption
$ wget https://raw.githubusercontent.com/adback-anti-adblock-solution/adback-bash-refresh/master/adback-refresh-tags

$ chmod +x adback-refresh-tags

# display product flow tag with option -p and -html
$ ./adback-refresh-tags "token" -p -html
```

```twig
{{ adback_generate_product_script() }}
```

Our product-flow displays automatically contextual ads on the blocked ads placements.

### Code logic:

* connect to your cache provider (here Redis)

* get script names and URL

* generate and display tag

<aside class="notice">You should contact our sales team to activate the product flow after tag installation at <a href="mailto:support@adback.co">support@adback.co</a></aside>

## 6) IAB banner script

> sample script:

```php
<?php

/* here we use redis to cache api requests */
$cache = new Redis();
$cache->connect('host', 'port');

$iabBannerCode = '';
if ($cache->has('scriptElement')) {
    $scriptElements = $cache->hGetAll('scriptElement');
    if (isset($scriptElements['iab_script'])) {
    $iabBannerDomain = $scriptElements['iab_banner_domain'];
    $iabBannerScript = $scriptElements['iab_banner_script'];
    $iabBannerCode = <<<EOS
        (function (a,d){var s,t;s=d.createElement('script');
        s.src=a;s.async=1;
        t=d.getElementsByTagName('script')[0];
        t.parentNode.insertBefore(s,t);
        })("https://$iabBannerDomain/$iabBannerScript.js", document);
EOS;
    }
}

/* add div where you want to display your banner with placement 'header_728x90' */
echo "<div data-iab-tag='header_728x90'></div>";

/* add div where you want to display your banner with placement 'side_300x250_actu' */
echo "<div data-iab-tag='side_300x250_actu'></div>";

/* display tag */
echo "<script>$iabBannerCode</script>";
```

```python
import redis
import requests

'''here we use redis to cache api requests'''
r_server = redis.Redis('host', 'port')
iab_banner_code = ''
if r_server.exists('script_element'):
    script_elements = r_server.hgetall('script_element')
    iab_banner_domain = script_elements['iab_banner_domain']
    iab_banner_script = script_elements['iab_banner_script']

    iab_banner_code = """
    (function (a,d){var s,t;s=d.createElement('script');
    s.src=a;s.async=1;
    t=d.getElementsByTagName('script')[0];
    t.parentNode.insertBefore(s,t);
    })(\"https://%s/%s.js\", document);
    """ % (iab_banner_domain, iab_banner_script)

'''add div where you want to display your banner with placement 'header_728x90' '''
print "<div data-iab-tag='header_728x90'></div>"

'''add div where you want to display your banner with placement 'side_300x250_actu' '''
print "<div data-iab-tag='side_300x250_actu'></div>"

'''display tag'''
print "<script>%s</script>" % iab_banner_code
```

```java
```


```ruby
require "redis"
require "json"
require 'open-uri'

# here we use redis to cache api requests
cache = Redis.new(:host => "HOST")
iab_banner_code = '';
if cache.exists('script_element')
  script_elements = cache.hgetall('script_element');
  unless script_elements['iab_banner_script'].nil?
    iab_banner_domain = script_elements['iab_banner_domain'];
    iab_banner_script = script_elements['iab_banner_script'];
    iab_banner_code = """
    (function (a,d){var s,t;s=d.createElement('script');
    s.src=a;s.async=1;
    t=d.getElementsByTagName('script')[0];
    t.parentNode.insertBefore(s,t);
    })(\"https://#{iab_banner_domain}/#{iab_banner_script}.js\", document);
    """
  end
end

# add div where you want to display your banner with placement 'header_728x90'
puts "<div data-iab-tag='header_728x90'></div>"

# add div where you want to display your banner with placement 'side_300x250_actu'
puts "<div data-iab-tag='side_300x250_actu'></div>"

# display tag
puts "<script>#{iab_banner_code}</script>"
```

```shell
# bash script to test api consumption
$ wget https://raw.githubusercontent.com/adback-anti-adblock-solution/adback-bash-refresh/master/adback-refresh-tags

$ chmod +x adback-refresh-tags

# display iab banner tag with option -b and -html
$ ./adback-refresh-tags "token" -b -html
```

```twig
<!-- add div where you want to display your banner with placement 'header_728x90' -->
<div data-iab-tag='header_728x90'></div>

<!-- add div where you want to display your banner with placement 'side_300x250_actu' -->
<div data-iab-tag='side_300x250_actu'></div>

{{ adback_generate_iab_banner_script() }}
```

Our IAB banners permit to display ads for premium campaigns on blocked ads placements.

### Code logic:

* connect to your cache provider (here Redis)

* get script names and URL

* generate and display tag with one placement / banner

### Script Parameters:

Parameter | Required | Description
--------- | -------- | -----------
placement | Yes | Variable you must set to display one banner, data-iab-tag takes one placement and can be configured <a href="https://www.adback.co/en/iab-banners/banners">here</a>

Back office configuration example:

### placement naming:

You should name your placement like back office example, location _ dimension _ campaign promo name,

`header_728x90  ou  side_300x250_actu`

Make sure this names match the back office configuration.

<aside class="notice">After tag installation, you must create new banner <a href="https://www.adback.co/en/iab-banners/banners">here</a> for every placement that you integrate before.</aside>

