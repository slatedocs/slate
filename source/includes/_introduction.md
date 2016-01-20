# Introduction

Welcome to the Mifiel API! We at Mifiel provide a simple and robust RESTful API enabling any service or company operating in Mexico to integrate electronic signatures (using the FIEL) into their workflow.

Through Mifiel's API, you can easily manage documents and certificates within you or your company's account.


### Getting started

To start using the API you will first need an APP_ID and a APP_SECRET which will be provided upon request (please contact us at [hola@mifiel.com](mailto:hola@mifiel.com)).

You will first need to create an account at [mifiel.com](https://www.mifiel.com) since the APP_ID and APP_SECRET will be linked to your account. 

We have language bindings in Shell and Ruby! You can view code examples on the right (switch between different programming languages using the tabs on top).

### API Versions

All API calls are versioned, and the current Mifiel API is v1.0. We will never introduce any breaking changes within any version, but may add new, non-breaking features and enhancements from time to time.

## Error Handling

All errors follow the [JSend](http://labs.omniti.com/labs/jsend) specification. Following are examples of error objects found in the body of error responses (_e.g. non-200 status code_).

### When a client sends an unexpected request:

> Example JSON __fail__ response:

```json
  {
    "status": "fail",
    "errors": [
      "Document#29f3cb01-744d-4eae-8718-213aec8a1678 not found"
    ]
  }
```

Field   | Type    |  Description
------- | ------- | ------------
status  | String  | `fail`
errors  | Array   | Array of error messages

### For server errors:

> Example JSON __error__ response:

```json
  {
    "status": "error",
    "message": "500: Internal Server Error" 
  }
```

Field   | Type    |  Description
------- | ------- | ------------
status  | String  | `error`
message | String  | A descriptive message

## Mifiel-supported SDKs

We currently suppport only Ruby but are working on adding more languages.

### Ruby

```ruby
# Configure Mifiel gem
Mifiel.config do |config|
  config.app_id = '<APP_ID>'
  config.app_secret = '<APP_SECRET>'
end
```

You can find the repo at [github.com/Mifiel/ruby-api-client](https://github.com/Mifiel/ruby-api-client)

Add this line to your application's Gemfile:

`gem 'mifiel'`

Then execute:

`$ bundle`

Or install it yourself as:

`$ gem install mifiel`


## Authentication

Mifiel uses SHA1 HMAC encryption to authenticate API calls. Each request has to be authenticated by following these steps:

1. A canonical string is first created using your HTTP headers containing the
content-type, content-MD5, request URI and the timestamp. You can replace content-type and content-MD5 with a blank string if needed. The timestamp must be a valid HTTP date. The canonical string is computed as follows:

`canonical_string = 'http method,content-type,content-MD5,request URI,timestamp'`

2. This string is then used to create the signature, which is a Base64 encoded
SHA1 HMAC, using the APP_SECRET key.

3. This signature is then added as the `Authorization` HTTP header in the following form:

`Authorization: APIAuth APP-ID:signature-from-step-2`

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

### Ruby Example

If you are using Ruby, we recommend using our [official gem](https://github.com/Mifiel/ruby-api-client). 

If you want to create your own, you can use the [api-auth](https://github.com/mgomes/api_auth/) gem which supports many popular HTTP clients. In this example we are using the [RestClient](https://github.com/rest-client/rest-client) gem. 

