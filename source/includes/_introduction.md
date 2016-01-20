# Introduction

Welcome to Mifiel API.

### Overview

Mifiel provides a simple ad robust REST-ful API to integrate document signatures in your existing applications and services.

The API enables document and certificate managment for your account.

### Before you start

To start using the API you will need an APP_ID and a APP_SECRET which will be provided upon request (contact us at hola@mifiel.com).

You will first need to create an account in [mifiel.com](https://www.mifiel.com) since the APP_ID and APP_SECRET will be linked to your account. 

We have language bindings in Shell and Ruby! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

### API Versions

All API calls are versioned, and the current Mifiel API is v1. We will never introduce any breaking changes within any version, but we may add new, non-breaking features from time to time.

## Mifiel supported SDKs

We currently suppport only Ruby but we're working to add more languages.

### Ruby

```ruby
# Configure Mifiel gem
Mifiel.config do |config|
  config.app_id = '<APP_ID>'
  config.app_secret = '<APP_SECRET>'
end
```

You can find the repo in [github.com/Mifiel/ruby-api-client](https://github.com/Mifiel/ruby-api-client)

Add this line to your application's Gemfile:

`gem 'mifiel'`

And then execute:

`$ bundle`

Or install it yourself as:

`$ gem install mifiel`


## Authentication

Mifiel uses SHA1 HMAC encryption to authenticate API calls. Each request has to be authenticated by following these steps:

1. A canonical string is first created using your HTTP headers containing the
content-type, content-MD5, request URI and the timestamp. You can replace content-type and content-MD5 with a blank string if needed. The timestamp must be a valid HTTP date. The canonical string is computed as follows:

`canonical_string = 'http method,content-type,content-MD5,request URI,timestamp'`

2. This string is then used to create the signature which is a Base64 encoded
SHA1 HMAC, using the APP_SECRET key.

3. This signature is then added as the `Authorization` HTTP header in the form:

`Authorization: APIAuth APP-ID:signature-from-step-2`

### Ruby Example

```ruby
app_id = 'your app id'
app_secret = 'your app secret'
rest_request = RestClient::Request.new(
  url: 'https://www.mifiel.com/api/v1/documents',
  method: :get,
)
response = ApiAuth.sign!(rest_request, app_id, app_secret).execute
json_response = JSON.load(response)
```

If you are using Ruby, we recommend using our [official gem](https://github.com/Mifiel/ruby-api-client). 

If you want to do it yourself, you can use the [api-auth](https://github.com/mgomes/api_auth/) gem which supports many popular HTTP clients. In this example we are using the [RestClient](https://github.com/rest-client/rest-client) gem. 
