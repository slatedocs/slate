# Contacts

## Contact Object

```json
{
  "contact": {
    "id": "<contact-id>",
    "external_id": "<your-contact-id>",
    "name": "John",
    "phone": "0123456789",
    "gender":1,
    "salutation":0,
    "salutation_text": "Sehr geehrter Herr John",
    "email": "john@bilendo.de",
    "created_at": "2016-01-18T13:53:06+01:00",
    "updated_at": "2016-01-18T13:53:06+01:00",
    "customer": {
      "id": "<customer-id>",
      "external_id": "<your-customer-id>",
      "name": "Company Inc.",
      "customer_number": "100001",
      "address": "Company Inc.\nSome Street\n13245 City",
      "dunning_stop": false,
      "dunning_stop_date": null,
      "created_at": "2016-01-18T13:52:53+01:00",
      "updated_at": "2016-01-20T16:30:14+01:00"
    }
  }
}
```

Attribute | Type | Description
--------- | ----------- | ---------
id | string | Bilendo id of the contact <br>Example: `con-00000000-0000-0000-0000-000000000000`
external_id | string | your id of the contact
name | string | name of the contact
phone | string | phone number of the contact
gender | integer | 0 = unknown<br>1 = male<br>2 = female
salutation | integer | 0 = formal<br>1 = informal
salutation text | string | 0 = "Sehr geehrter Herr #{name}"; <br>"Sehr geehrter Frau #{name}"; <br>"Sehr geehrte Damen und Herren" (if a name missing) <br>1 = "Hallo #{name}"
email | string | email
customer_id | string | the customer id
main_contact | boolean | true = main contact<br>false = not main contact


## Create new Contact

> Request

```shell
curl -X "POST" "https://apisandbox.bilendo.de/api/v1/contacts" \
  -H "Authorization: Token token=YOUR-API-TOKEN" \
  -d "name=John" \
  -d "phone=0123456789" \
  -d "external_id=<your-contact-id>" \
  -d "gender=1" \
  -d "salutation=1" \
  -d "customer_id=<customer-id>" \
  -d "customer[external_id]=<your-customer-id>" \
  -d "email=john@bilendo.de" \
```

```php
<?php

// Get cURL resource
$ch = curl_init();

// Set url
curl_setopt($ch, CURLOPT_URL, 'https://apisandbox.bilendo.de/api/v1/contacts');

// Set method
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');

// Set options
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

// Set headers
curl_setopt($ch, CURLOPT_HTTPHEADER, [
  "Authorization: Token token=YOUR-API-TOKEN",
  "Content-Type: application/x-www-form-urlencoded"
 ]
);
// Create body
$body = [
  "name" => "John",
  "phone" => "0123456789",
  "external_id" => "<your-contact-id>",
  "gender" => "1",
  "salutation" => "1",
  "customer_id" => "<customer-id>",
  "customer[external_id]" => "<your-customer-id>",
  "email" => "john@bilendo.de"
];
$body = http_build_query($body);

// Set body
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $body);

// Send the request & save response to $resp
$resp = curl_exec($ch);

if(!$resp) {
  die('Error: "' . curl_error($ch) . '" - Code: ' . curl_errno($ch));
} else {
  echo "Response HTTP Status Code : " . curl_getinfo($ch, CURLINFO_HTTP_CODE);
  echo "\nResponse HTTP Body : " . $resp;
}

// Close request to clear up some resources
curl_close($ch);

?>
```

```ruby
require 'net/http'
require 'net/https'
begin
  uri = URI('https://apisandbox.bilendo.de/api/v1/contacts')

  # Create client
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  data = {
    "name" => "John",
    "phone" => "0123456789",
    "external_id" => "<your-contact-id>",
    "gender" => "1",
    "salutation" => "1",
    "customer_id" => "<customer-id>",
    "customer[external_id]" => "<your-customer-id>",
    "email" => "john@bilendo.de"
  }
  body = URI.encode_www_form(data)

  # Create Request
  req =  Net::HTTP::Post.new(uri)
  # Add headers
  req.add_field "Authorization", "Token token=YOUR-API-TOKEN"
  # Set header and body
  req.body = body

  # Fetch Request
  res = http.request(req)
  puts "Response HTTP Status Code: #{res.code}"
  puts "Response HTTP Response Body: #{res.body}"
rescue StandardError => e
  puts "HTTP Request failed (#{e.message})"
end

```

```python
import requests

try:
  response = requests.post(
      url = "https://apisandbox.bilendo.de/api/v1/contacts",
      headers = {
          "Authorization": "Token token=YOUR-API-TOKEN"
      },
      data = {
          "name": "John",
          "phone": "0123456789",
          "external_id": "<your-contact-id>",
          "gender": "1",
          "salutation": "1",
          "customer_id": "<customer-id>",
          "customer[external_id]": "<your-customer-id>",
          "email": "john@bilendo.de"
      }
  )
  print('Response HTTP Status Code: {status_code}'.format(
      status_code=response.status_code))
  print('Response HTTP Response Body: {content}'.format(
      content=response.content))
except requests.exceptions.RequestException:
  print('HTTP Request failed')

```

> Response

```json
{
  "contact": {
    "id": "<contact-id>",
    "external_id": "<your-contact-id>",
    "name": "John",
    "phone": "0123456789",
    "gender":1,
    "salutation":1,
    "salutation_text": "Hallo John",
    "email": "john@bilendo.de",
    "created_at": "2016-01-18T13:53:06+01:00",
    "updated_at": "2016-01-18T13:53:06+01:00",
    "customer": {
      "id": "<customer-id>",
      "external_id": "<your-customer-id>",
      "name": "Company Inc.",
      "customer_number": "100001",
      "address": "Company Inc.\nSome Street\n13245 City",
      "dunning_stop": false,
      "dunning_stop_date": null,
      "created_at": "2016-01-18T13:52:53+01:00",
      "updated_at": "2016-01-20T16:30:14+01:00"
    }
  }
}
```

Parameter | type | Description
--------- | ----------- | ---------
name | mandatory | name of the contact
phone | optional | phone number of the contact
gender | mandatory | 0 = unknown<br>1 = male<br>2 = female
external_id | optional | your contact id
salutation | mandatory | 0 = formal<br>1 = informal
email | optional | email
customer_id <strong>or</strong><br>customer[external_id]| mandatory | bilendo-customer-id<br>your-customer-id
main_contact | optional | true = make this contact a main contact, false = make this contact not a main contact

<aside class="notice">
      <strong>Note:</strong> You can use the <strong>id</strong> or the <strong>external_id</strong> for associated customers.
      If you provide both, we will focus on the id, not on the external_id.
</aside>

### API Endpoint

`POST https://apisandbox.bilendo.de/api/v1/contacts`


## Update existing Contact

> Request

```shell
curl -X "PATCH" "https://apisandbox.bilendo.de/api/v1/contacts/<contact-id>" \
  -H "Authorization: Token token=YOUR-API-TOKEN" \
  -d "name=New name" \
```

```php
<?php

// Get cURL resource
$ch = curl_init();

// Set url
curl_setopt($ch, CURLOPT_URL, 'https://apisandbox.bilendo.de/api/v1/contacts/<contact-id>');

// Set method
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PATCH');

// Set options
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

// Set headers
curl_setopt($ch, CURLOPT_HTTPHEADER, [
  "Authorization: Token token=YOUR-API-TOKEN"
 ]
);
// Create body
$body = [
  "name" => "New name"
  ];
$body = http_build_query($body);

// Set body
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $body);

// Send the request & save response to $resp
$resp = curl_exec($ch);

if(!$resp) {
  die('Error: "' . curl_error($ch) . '" - Code: ' . curl_errno($ch));
} else {
  echo "Response HTTP Status Code : " . curl_getinfo($ch, CURLINFO_HTTP_CODE);
  echo "\nResponse HTTP Body : " . $resp;
}

// Close request to clear up some resources
curl_close($ch);

?>
```

```ruby
require 'net/http'
require 'net/https'

begin
  uri = URI('https://apisandbox.bilendo.de/api/v1/contacts/<contact-id>')

  # Create client
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  data = {
    "name" => "New name"
  }
  body = URI.encode_www_form(data)

  # Create Request
  req =  Net::HTTP::Patch.new(uri)
  # Add headers
  req.add_field "Authorization", "Token token=YOUR-API-TOKEN"
  # Set header and body
  req.body = body

  # Fetch Request
  res = http.request(req)
  puts "Response HTTP Status Code: #{res.code}"
  puts "Response HTTP Response Body: #{res.body}"
rescue StandardError => e
  puts "HTTP Request failed (#{e.message})"
end

```

```python
import requests

try:
  response = requests.patch(
      url = "https://apisandbox.bilendo.de/api/v1/contacts/<contact-id>",
      headers = {
          "Authorization": "Token token=YOUR-API-TOKEN"
      },
      data = {
          "name": "New name"
      }
  )
  print('Response HTTP Status Code: {status_code}'.format(
      status_code=response.status_code))
  print('Response HTTP Response Body: {content}'.format(
      content=response.content))
except requests.exceptions.RequestException:
  print('HTTP Request failed')
```

> Response

```json
{
  "contact": {
    "id": "<contact-id>",
    "external_id": "<your-contact-id>",
    "name": "New name",
    "phone": "0123456789",
    "gender":1,
    "salutation":1,
    "salutation_text": "Hallo John",
    "email": "john@bilendo.de",
    "created_at": "2016-01-18T13:53:06+01:00",
    "updated_at": "2016-01-18T13:53:06+01:00",
    "customer": {
      "id": "<customer-id>",
      "external_id": "<your-customer-id>",
      "name": "Company Inc.",
      "customer_number": "100001",
      "address": "Company Inc.\nSome Street\n13245 City",
      "dunning_stop": false,
      "dunning_stop_date": null,
      "created_at": "2016-01-18T13:52:53+01:00",
      "updated_at": "2016-01-20T16:30:14+01:00"
    }
  }
}
```

### API Endpoint

`PATCH https://apisandbox.bilendo.de/api/v1/contacts/<contact-id>`


## Get a specific Contact

> Request

```shell
curl -X "GET" "https://apisandbox.bilendo.de/api/v1/contacts/<contact-id>" \
  -H "Authorization: Token token=YOUR-API-TOKEN"
```

```php
<?php

// Get cURL resource
$ch = curl_init();

// Set url
curl_setopt($ch, CURLOPT_URL, 'https://apisandbox.bilendo.de/api/v1/contacts/<contact-id>');

// Set method
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET');

// Set options
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

// Set headers
curl_setopt($ch, CURLOPT_HTTPHEADER, [
  "Authorization: Token token=YOUR-API-TOKEN"
 ]
);


// Send the request & save response to $resp
$resp = curl_exec($ch);

if(!$resp) {
  die('Error: "' . curl_error($ch) . '" - Code: ' . curl_errno($ch));
} else {
  echo "Response HTTP Status Code : " . curl_getinfo($ch, CURLINFO_HTTP_CODE);
  echo "\nResponse HTTP Body : " . $resp;
}

// Close request to clear up some resources
curl_close($ch);

?>
```

```ruby
require 'net/http'
require 'net/https'

begin
  uri = URI('https://apisandbox.bilendo.de/api/v1/contacts/<contact-id>')

  # Create client
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER


  # Create Request
  req =  Net::HTTP::Get.new(uri)
  # Add headers
  req.add_field "Authorization", "Token token=YOUR-API-TOKEN"

  # Fetch Request
  res = http.request(req)
  puts "Response HTTP Status Code: #{res.code}"
  puts "Response HTTP Response Body: #{res.body}"
rescue StandardError => e
  puts "HTTP Request failed (#{e.message})"
end

```

```python
import requests

try:
  response = requests.get(
      url = "https://apisandbox.bilendo.de/api/v1/contacts/<contact-id>",
      headers = {
          "Authorization": "Token token=YOUR-API-TOKEN"
      }
  )
  print('Response HTTP Status Code: {status_code}'.format(
      status_code=response.status_code))
  print('Response HTTP Response Body: {content}'.format(
      content=response.content))
except requests.exceptions.RequestException:
  print('HTTP Request failed')
```

> Response

```json
{
  "contact": {
    "id": "<contact-id>",
    "external_id": "<your-contact-id>",
    "name": "New name",
    "phone": "0123456789",
    "gender":1,
    "salutation":1,
    "salutation_text": "Hallo John",
    "email": "john@bilendo.de",
    "created_at": "2016-01-18T13:53:06+01:00",
    "updated_at": "2016-01-18T13:53:06+01:00",
    "customer": {
      "id": "<customer-id>",
      "external_id": "<your-customer-id>",
      "name": "Company Inc.",
      "customer_number": "100001",
      "address": "Company Inc.\nSome Street\n13245 City",
      "dunning_stop": false,
      "dunning_stop_date": null,
      "created_at": "2016-01-18T13:52:53+01:00",
      "updated_at": "2016-01-20T16:30:14+01:00"
    }
  }
}
```

### Api Endpoint

`GET https://apisandbox.bilendo.de/api/v1/contacts/<contact-id>`


## Find a specific Contact

Use this endpoint to case-insensitive find a contact on bilendo by providing your own id.

> Request

```shell
curl -X "GET" "https://apisandbox.bilendo.de/api/v1/contacts/find/<your-contact-id>" \
  -H "Authorization: Token token=YOUR-API-TOKEN"
```

```php
<?php

// Get cURL resource
$ch = curl_init();

// Set url
curl_setopt($ch, CURLOPT_URL, 'https://apisandbox.bilendo.de/api/v1/contacts/find/<your-contact-id>');

// Set method
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET');

// Set options
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

// Set headers
curl_setopt($ch, CURLOPT_HTTPHEADER, [
  "Authorization: Token token=YOUR-API-TOKEN"
 ]
);


// Send the request & save response to $resp
$resp = curl_exec($ch);

if(!$resp) {
  die('Error: "' . curl_error($ch) . '" - Code: ' . curl_errno($ch));
} else {
  echo "Response HTTP Status Code : " . curl_getinfo($ch, CURLINFO_HTTP_CODE);
  echo "\nResponse HTTP Body : " . $resp;
}

// Close request to clear up some resources
curl_close($ch);

?>
```

```ruby
require 'net/http'
require 'net/https'

begin
  uri = URI('https://apisandbox.bilendo.de/api/v1/contacts/find/<your-contact-id>')

  # Create client
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER


  # Create Request
  req =  Net::HTTP::Get.new(uri)
  # Add headers
  req.add_field "Authorization", "Token token=YOUR-API-TOKEN"

  # Fetch Request
  res = http.request(req)
  puts "Response HTTP Status Code: #{res.code}"
  puts "Response HTTP Response Body: #{res.body}"
rescue StandardError => e
  puts "HTTP Request failed (#{e.message})"
end

```

```python
import requests

try:
  response = requests.get(
      url = "https://apisandbox.bilendo.de/api/v1/contacts/find/<your-contact-id>",
      headers = {
          "Authorization": "Token token=YOUR-API-TOKEN",
      },
  )
  print('Response HTTP Status Code: {status_code}'.format(
      status_code=response.status_code))
  print('Response HTTP Response Body: {content}'.format(
      content=response.content))
except requests.exceptions.RequestException:
  print('HTTP Request failed')
```

> Response

```json
{
  "contact": {
    "id": "<contact-id>",
    "external_id": "<your-contact-id>",
    "name": "New name",
    "phone": "0123456789",
    "gender":1,
    "salutation":1,
    "salutation_text": "Hallo John",
    "email": "john@bilendo.de",
    "created_at": "2016-01-18T13:53:06+01:00",
    "updated_at": "2016-01-18T13:53:06+01:00",
    "customer": {
      "id": "<customer-id>",
      "external_id": "<your-customer-id>",
      "name": "Company Inc.",
      "customer_number": "100001",
      "address": "Company Inc.\nSome Street\n13245 City",
      "dunning_stop": false,
      "dunning_stop_date": null,
      "created_at": "2016-01-18T13:52:53+01:00",
      "updated_at": "2016-01-20T16:30:14+01:00"
    }
  }
}
```

### Api Endpoint

`GET https://apisandbox.bilendo.de/api/v1/contacts/find/<your-contact-id>`
