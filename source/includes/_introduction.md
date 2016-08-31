# Introduction

Welcome to the Mifiel API! We at Mifiel provide a simple and robust RESTful API enabling any service or company operating in Mexico to integrate electronic signatures (using the FIEL) into their workflow.

Through Mifiel's API, you can easily manage documents and certificates within your Mifiel account.

We have language bindings in **Shell**, **PHP**, **Ruby** and **Python**! You can view code examples on the right (switch between different programming languages using the tabs on top).

### API Versions

All API calls are versioned, and the current Mifiel API is v1.0. We will never introduce any breaking changes within any version, but may add new, non-breaking features and enhancements from time to time.

### Sandbox enviroment

For your convenience Mifiel offers a Sandbox environment where you can confidently test your code.

To start using the API in the **Sandbox** environment you need to first create an account at [sandbox.mifiel.com](https://sandbox.mifiel.com).

Once you have an account you will need an _APP_ID_ and an _APP_SECRET_ which you can generate in [sandbox.mifiel.com/access_tokens](https://sandbox.mifiel.com/access_tokens).

Just change the **www**.mifiel.com for **sandbox**.mifiel.com in every endpoint that you use.

<aside class="warning">
  Documents signed in the Sandobox environment are legally invalid and should not be used for legal purposes.
</aside>

### Production enviroment

To start using the API in the **Production** environment you need to first create an account at [mifiel.com](https://www.mifiel.com).

Once you have an account you will need an _APP_ID_ and a _APP_SECRET_ which you can generate in [mifiel.com/access_tokens](https://www.mifiel.com/access_tokens).

## Mifiel-supported SDKs

We currently suppport **Ruby**, **PHP** and **Python** but are working on adding more languages.

### Ruby

```ruby
# Configure Mifiel gem
Mifiel.config do |config|
  config.app_id = '<APP_ID>'
  config.app_secret = '<APP_SECRET>'
end
```

Add this line to your application's Gemfile:

`gem 'mifiel'`

Then execute:

`$ bundle`

Or install it yourself as:

`$ gem install mifiel`

You can find the repo at [github.com/Mifiel/ruby-api-client](https://github.com/Mifiel/ruby-api-client).

### PHP

```php
<?php
// include composer autoload
require 'vendor/autoload.php';

// import Mifiel Client Class
use Mifiel\ApiClient as Mifiel;

// Configure Mifiel Library
Mifiel::setTokens('APP_ID', 'APP_SECRET');
?>
```

The best way to install Mifiel is quickly and easily with [Composer](https://getcomposer.org).

To install the most recent version, run the following command.

`php composer.phar require mifiel/api-client` 

Now your composer.json has been updated automatically and you're able to require the just created *vendor/autoload.php* file to PSR-4 autoload the library.

You can find the repo at [github.com/Mifiel/ruby-api-client](https://github.com/Mifiel/php-api-client).

### Python

```python
# Import the Client 
from mifiel import Client

# Configure Mifiel Library, you will 
# pass this to every call you make to our servers.
client = Client(app_id='APP_ID', secret_key='APP_SECRET')
# If you want to make tests without beeing charged
# you can use our sandbox enviroment with:
client.use_sandbox
```

The best way to install Mifiel lib is with [PIP](https://pypi.python.org/pypi).
To install the most recent version please run the following command.

`pip install mifiel`

You can find the repo at [github.com/Mifiel/python-api-client](https://github.com/Mifiel/python-api-client/)

## Authentication

Mifiel uses __SHA1 HMAC encryption__ to authenticate API calls. Each request has to be authenticated by following these steps:

1. A canonical string is first created using your HTTP headers containing the
content-type, content-MD5, request URI and the timestamp. You can replace content-type and content-MD5 with a blank string if needed. The timestamp must be a valid HTTP date. The canonical string is computed as follows:

`canonical_string = 'http method,content-type,content-MD5,request URI,timestamp'`

2. This string is then used to create the signature, which is a Base64 encoded
SHA1 HMAC, using the __APP_SECRET__ key.

3. This signature is then added as the `Authorization` HTTP header in the following form:

`Authorization: APIAuth APP-ID:signature-from-step-2`

```ruby
app_id = '<APP_ID>'
app_secret = '<APP_SECRET>'
rest_request = RestClient::Request.new(
  url: 'https://www.mifiel.com/api/v1/documents',
  method: :get,
)
response = ApiAuth.sign!(rest_request, app_id, app_secret).execute
json_response = JSON.load(response)
```

### Ruby Example

If you are using Ruby, we recommend using our [official gem](https://github.com/Mifiel/ruby-api-client). 

If you want to create your own, you can use the [api-auth](https://github.com/mgomes/api_auth/) gem which supports many popular HTTP clients. In this example we are using the [RestClient](https://github.com/rest-client/rest-client) gem. 

