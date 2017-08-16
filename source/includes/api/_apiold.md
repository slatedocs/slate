---
title: 'Emotions AI IAM Auth v2017-08-04T10:52:13Z'
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - javascript--nodejs: Node.JS
  - python: Python
  - ruby: Ruby
  - java: Java
toc_footers: []
includes: []
search: true
highlight_theme: darkula
---

# Emotions AI IAM Auth v2017-08-04T10:52:13Z

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.


Base URL = <a href="https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test">https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test</a>



# Authentication


* API Key
    - Parameter Name: **Authorization**, in: header. 



* API Key
    - Parameter Name: **x-api-key**, in: header. 



* API Key
    - Parameter Name: **Authorization**, in: header. 



# Default

## POST /audio

> Code samples

```shell
# You can also use wget
curl -X post https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/audio \
  -H 'Accept: application/json'

```

```http
POST https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/audio HTTP/1.1
Host: 7wvm7mbq90.execute-api.eu-west-1.amazonaws.com

Accept: application/json

```

```javascript
var headers = {
  'Accept':'application/json'

};

$.ajax({
  url: 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/audio',
  method: 'post',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');

const headers = {
  'Accept':'application/json'

};

fetch('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/audio',
{
  method: 'POST',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.post 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/audio', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.post('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/audio', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/audio");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

Post audio data

### Responses

Status|Meaning|Description
---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful Request

> Example responses

```json
{}
```
<aside class="success">
This operation does not require authentication
</aside>

## OPTIONS /data

> Code samples

```shell
# You can also use wget
curl -X options https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
OPTIONS https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data HTTP/1.1
Host: 7wvm7mbq90.execute-api.eu-west-1.amazonaws.com
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data',
  method: 'options',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');

const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

fetch('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data',
{
  method: 'OPTIONS',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
}

result = RestClient.options 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.options('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("OPTIONS");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

### Responses

Status|Meaning|Description
---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful Request

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||Standard CORS header to allow all origins. Assists in accessing the API from a locally hosted web application
200|Access-Control-Allow-Methods|string||Allows the use of all method types
200|Access-Control-Allow-Headers|string||Allows the use of all header types

> Example responses

```json
{}
```
<aside class="success">
This operation does not require authentication
</aside>

## OPTIONS /data/{proxy+}

> Code samples

```shell
# You can also use wget
curl -X options https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
OPTIONS https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+} HTTP/1.1
Host: 7wvm7mbq90.execute-api.eu-west-1.amazonaws.com
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+}',
  method: 'options',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');

const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

fetch('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+}',
{
  method: 'OPTIONS',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
}

result = RestClient.options 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+}', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.options('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+}', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("OPTIONS");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

### Responses

Status|Meaning|Description
---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful Request

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||Standard CORS header to allow all origins. Assists in accessing the API from a locally hosted web application
200|Access-Control-Allow-Methods|string||Allows the use of all method types
200|Access-Control-Allow-Headers|string||Allows the use of all header types

> Example responses

```json
{}
```
<aside class="success">
This operation does not require authentication
</aside>

## X-AMAZON-APIGATEWAY-ANY-METHOD /data/{proxy+}

> Code samples

```shell
# You can also use wget
curl -X x-amazon-apigateway-any-method https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+} \
  -H 'Accept: application/json'

```

```http
X-AMAZON-APIGATEWAY-ANY-METHOD https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+} HTTP/1.1
Host: 7wvm7mbq90.execute-api.eu-west-1.amazonaws.com

Accept: application/json

```

```javascript
var headers = {
  'Accept':'application/json'

};

$.ajax({
  url: 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+}',
  method: 'x-amazon-apigateway-any-method',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');

const headers = {
  'Accept':'application/json'

};

fetch('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+}',
{
  method: 'X-AMAZON-APIGATEWAY-ANY-METHOD',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.x-amazon-apigateway-any-method 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+}', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.x-amazon-apigateway-any-method('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+}', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/data/{proxy+}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("X-AMAZON-APIGATEWAY-ANY-METHOD");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

### Parameters

Parameter|In|Type|Required|Description
---|---|---|---|---|
proxy|path|string|true|No description


### Responses

Status|Meaning|Description
---|---|---|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
apiKey, apiKey
</aside>

## POST /events

> Code samples

```shell
# You can also use wget
curl -X post https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
POST https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events HTTP/1.1
Host: 7wvm7mbq90.execute-api.eu-west-1.amazonaws.com
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events',
  method: 'post',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "records": {},
  "events": {}
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

fetch('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
}

result = RestClient.post 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.post('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

This endpoint takes a timeseries data stream from the users application to be analysed. The endpoint will return a record of significant events found in this data stream such as rising and falling heart rate events and minimum and maximum heart rate values.

### Parameters

Parameter|In|Type|Required|Description
---|---|---|---|---|
SimpleTSModel|body|SimpleTSModel|true|No description


> Body parameter

```json
{
  "records": {},
  "events": {}
}
```
### Responses

Status|Meaning|Description
---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful Request

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||

> Example responses

```json
{
  "records": {},
  "events": {}
}
```
<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
apiKey, apiKey
</aside>

## OPTIONS /events

> Code samples

```shell
# You can also use wget
curl -X options https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
OPTIONS https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events HTTP/1.1
Host: 7wvm7mbq90.execute-api.eu-west-1.amazonaws.com
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events',
  method: 'options',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');

const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

fetch('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events',
{
  method: 'OPTIONS',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
}

result = RestClient.options 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.options('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/events");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("OPTIONS");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

### Responses

Status|Meaning|Description
---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful Request

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||Standard CORS header to allow all origins. Assists in accessing the API from a locally hosted web application
200|Access-Control-Allow-Methods|string||Allows the use of all method types
200|Access-Control-Allow-Headers|string||Allows the use of all header types

> Example responses

```json
{
  "records": {},
  "events": {}
}
```
<aside class="success">
This operation does not require authentication
</aside>

## GET /testdata

> Code samples

```shell
# You can also use wget
curl -X get https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata \
  -H 'Accept: application/json'

```

```http
GET https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata HTTP/1.1
Host: 7wvm7mbq90.execute-api.eu-west-1.amazonaws.com

Accept: application/json

```

```javascript
var headers = {
  'Accept':'application/json'

};

$.ajax({
  url: 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata',
  method: 'get',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');

const headers = {
  'Accept':'application/json'

};

fetch('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

This endpoint can be accessed to generate a randomised series of data records based on a number of parameters. The body of the response will contain this series of records in a format that can be sent to the events endpoint.

### Parameters

Parameter|In|Type|Required|Description
---|---|---|---|---|
values|query|string|false|No description
freq|query|string|false|No description
n|query|string|false|No description


### Responses

Status|Meaning|Description
---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful Request

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||

> Example responses

```json
{
  "params": {},
  "data": {
    "records": {
      "heartrate": [
        {
          "time": 1502377675559,
          "value": 65.57791893977732
        },
        {
          "time": 1502377676559,
          "value": 66.8288782259724
        },
        {
          "time": 1502377677559,
          "value": 65.3857155150675
        },
        {
          "time": 1502377678559,
          "value": 65.83014912028783
        },
        {
          "time": 1502377679559,
          "value": 65.51832616209319
        },
        {
          "time": 1502377680559,
          "value": 65.93427318720406
        },
        {
          "time": 1502377681559,
          "value": 65.19809325807245
        },
        {
          "time": 1502377682559,
          "value": 65.50799994257609
        },
        {
          "time": 1502377683559,
          "value": 66.36218231484747
        },
        {
          "time": 1502377684559,
          "value": 64.72513592180856
        }
      ]
    },
    "events": {}
  }
}
```
<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
apiKey, apiKey
</aside>

## OPTIONS /testdata

> Code samples

```shell
# You can also use wget
curl -X options https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
OPTIONS https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata HTTP/1.1
Host: 7wvm7mbq90.execute-api.eu-west-1.amazonaws.com
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata',
  method: 'options',

  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```javascript--nodejs
const request = require('node-fetch');

const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

fetch('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata',
{
  method: 'OPTIONS',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
}

result = RestClient.options 'https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.options('https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://7wvm7mbq90.execute-api.eu-west-1.amazonaws.com/test/testdata");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("OPTIONS");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());
```

### Responses

Status|Meaning|Description
---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful Request

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||Standard CORS header to allow all origins. Assists in accessing the API from a locally hosted web application
200|Access-Control-Allow-Methods|string||Allows the use of all method types
200|Access-Control-Allow-Headers|string||Allows the use of all header types

> Example responses

```json
{}
```
<aside class="success">
This operation does not require authentication
</aside>



