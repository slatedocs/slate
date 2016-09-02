---
title: iDa Mobile Test API Reference

language_tabs:
  - shell
  - ruby
  - python
  - javascript
  - xml : WSDL

toc_footers:
  - <a href='http://www.idamob.ru'>@ copyright iDa Mobile 2016</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Kittn API! You can use our API to access Kittn API endpoints, which can get information on various cats, kittens, and breeds in our database.

We have language bindings in Shell, Ruby, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/tripit/slate). Feel free to edit it and use it as a base for your own API's documentation.

# Authentication

> To authorize, use this code:

```xml
<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
  <s:Header>
    <Action s:mustUnderstand="1" xmlns="http://schemas.microsoft.com/ws/2005/05/addressing/none">http://core.proxy.platform.idamobile.com/IdaMobProxyServiceFacadePortType/getPaymentFormResponse</Action>
  </s:Header>
  <s:Body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <getPaymentFormResponse xmlns="http://core.proxy.platform.idamobile.com">
      <return>
        <form xmlns="http://servicedto.dto.proxy.platform.idamobile.com/xsd">
          <id xmlns="http://modeldto.dto.proxy.platform.idamobile.com/xsd">275411748</id>
          <beneficiaryId xsi:nil="true" xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd" />
          <fields xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">
            <id xmlns="http://modeldto.dto.proxy.platform.idamobile.com/xsd">5</id>
            <comboBoxValues>
              <id xmlns="http://modeldto.dto.proxy.platform.idamobile.com/xsd">5_1</id>
              <name>40817810200005239000</name>
              <order>1</order>
              <value>40817810200005239000</value>
            </comboBoxValues>
            <comboBoxValues>
              <id xmlns="http://modeldto.dto.proxy.platform.idamobile.com/xsd">5_2</id>
              <name>40817810500005239001</name>
              <order>2</order>
              <value>40817810500005239001</value>
            </comboBoxValues>
            <defaultValue xsi:nil="true" />
            <errorMessage xsi:nil="true" />
            <fieldClass>SOURCE_ACCOUNT</fieldClass>
            <formOrder>1</formOrder>
            <groupName xsi:nil="true" />
            <hint xsi:nil="true" />
            <mandatory>true</mandatory>
            <maxLimit>0</maxLimit>
            <minLimit>0</minLimit>
            <name>Счет списания</name>
            <readOnly>false</readOnly>
            <regExp xsi:nil="true" />
          </fields>
          <fields xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">
            <id xmlns="http://modeldto.dto.proxy.platform.idamobile.com/xsd">9</id>
            <defaultValue xsi:nil="true" />
            <errorMessage xsi:nil="true" />
            <fieldClass>MONEY</fieldClass>
            <formOrder>1</formOrder>
            <groupName xsi:nil="true" />
            <hint xsi:nil="true" />
            <mandatory>true</mandatory>
            <maxLimit>922337203685477</maxLimit>
            <minLimit>0</minLimit>
            <name>Сумма списания</name>
            <readOnly>false</readOnly>
            <regExp xsi:nil="true" />
          </fields>
          <hasNext xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">false</hasNext>
          <logoResource xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">https://i.lockobank.ru/mbaresources/icons/android-small/FORM_2.png</logoResource>
          <name xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">Îïëàòà óñëóã Áèëàéí</name>
          <position xsi:nil="true" xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd" />
          <requiresCommission xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">false</requiresCommission>
          <type xmlns="http://form.modeldto.dto.proxy.platform.idamobile.com/xsd">PAYMENT</type>
        </form>
      </return>
    </getPaymentFormResponse>
  </s:Body>
</s:Envelope>
```

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

