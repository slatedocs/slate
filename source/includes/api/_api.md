
# Emotion AI API

## Introduction
The Sensum Emotion AI API enables you to access our emotional intelligence platform.  Our API is designed to be RESTful, responding to HTTP requests with data in JSON format. Our SDKs handle many of these requests and responses natively. It can however be useful to utilise the APi directly


> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.

## URI Structure

The Sensum Emotion AI API uses URI resources to provide access to its services. To use a RESTful API, your application will use HTTP Methods(GET, POST, etc.) to request and parse a response. The Emotion AI API uses JSON for communication between your aplication and the server.

An example URI:
<a href="">https://example.com/test/testData</a>

## Authorization

Sensum Emotion AI uses API Keys and AWS Signature v4 to allow access to the API. You can register a new API Key by contacting us.

Sensum Emotion AI expects each call to contain the following headers to gain access: 

 * Content-Type: "application/json"
 * Authorization: "AWS v4 Signature"
 * X-API-Key: "EmotionAPIKey" 

<aside class="notice">Replace the above authorization header with the AWS Signature generated after login and X-API-Key with your personal API key.</aside>

## Endpoints

### POST /audio

> Code samples

```shell
# You can also use wget
curl -X post https://example.com/test/audio \
  -H 'Accept: application/json'

```

```http
POST https://example.com/test/audio HTTP/1.1
Host: example.com

Accept: application/json

```

```javascript
var headers = {
  'Accept':'application/json'

};

$.ajax({
  url: 'https://example.com/test/audio',
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

fetch('https://example.com/test/audio',
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

result = RestClient.post 'https://example.com/test/audio', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.post('https://example.com/test/audio', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://example.com/test/audio");
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

### Responses

Status|Meaning|Description
---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful request

> Example responses

```json
{}
```
<aside class="success">
This operation does not require authentication
</aside>

## Check the methods that can be called on the data resource

This endpoint allows the user to check the HTTP Methods that can be used on the data resource

### HTTP Request
`OPTIONS https://example.com/data`

> Code samples

```shell
# You can also use wget
curl -X options https://example.com/test/data \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
OPTIONS https://example.com/test/data HTTP/1.1
Host: example.com
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: 'https://example.com/test/data',
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

fetch('https://example.com/test/data',
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

result = RestClient.options 'https://example.com/test/data', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.options('https://example.com/test/data', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://example.com/test/data");
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
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful request

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||
200|Access-Control-Allow-Methods|string||
200|Access-Control-Allow-Headers|string||

> Response headers

```json
{
    "Access-Control-Allow-Origin":"*",
    "Access-Control-Allow-Methods":"DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT",
    "Access-Control-Allow-Headers":"Content-Type,Authorization,X-Amz-Date,X-Api-Key,X-Amz-Security-Token",
    "Content-Type":"application/json"
}
```
<aside class="success">
This operation does not require authentication
</aside>

## OPTIONS /data/{proxy+}

> Code samples

```shell
# You can also use wget
curl -X options https://example.com/test/data/{proxy+} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
OPTIONS https://example.com/test/data/{proxy+} HTTP/1.1
Host: example.com
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: 'https://example.com/test/data/{proxy+}',
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

fetch('https://example.com/test/data/{proxy+}',
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

result = RestClient.options 'https://example.com/test/data/{proxy+}', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.options('https://example.com/test/data/{proxy+}', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://example.com/test/data/{proxy+}");
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
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful request

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||
200|Access-Control-Allow-Methods|string||
200|Access-Control-Allow-Headers|string||

> Response Headers

```json
{
    "Access-Control-Allow-Origin":"*",
    "Access-Control-Allow-Methods":"DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT",
    "Access-Control-Allow-Headers":"Content-Type,Authorization,X-Amz-Date,X-Api-Key,X-Amz-Security-Token",
    "Content-Type":"application/json"
}
```
<aside class="success">
This operation does not require authentication
</aside>

## Get sentiment from emojis 

Given a list of emojis, this endpoint returns a dictionary containing sentiment.

Emoji Sentiment is calculated by the service as the average of the raw Valence, Arousal and Popularity(TODO Add Glossary or something to explain these).


### HTTP Request

`POST https://example.com/test/sentiment`

> Code samples

```shell
# You can also use wget
curl -X post https://example.com/test/sentiment \
  -H 'Accept: application/json'

```

```http
POST https://example.com/test/sentiment HTTP/1.1
Host: example.com

Accept: application/json

```

```javascript
var headers = {
  'Accept':'application/json'

};

$.ajax({
  url: 'https://example.com/test/sentiment',
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

fetch('https://example.com/test/sentiment',
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

result = RestClient.post 'https://example.com/test/sentiment', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.post('https://example.com/test/sentiment', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://example.com/test/sentiment");
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

### Responses

Status|Meaning|Description
---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|200 response

> Example responses

```json
{}
```
<aside class="warning">
To perform this operation, you must be authenticated by means of the following method:
API Key.
</aside>

## Check the methods that can be called on the sentiment resource

This endpoint allows the user to check the HTTP Methods that can be used on the sentiment resource

### HTTP Request

`OPTIONS https://example.com/sentiment`


> Code samples

```shell
# You can also use wget
curl -X options https://example.com/test/sentiment \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
OPTIONS https://example.com/test/sentiment HTTP/1.1
Host: example.com
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: 'https://example.com/test/sentiment',
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

fetch('https://example.com/test/sentiment',
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

result = RestClient.options 'https://example.com/test/sentiment', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.options('https://example.com/test/sentiment', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://example.com/test/sentiment");
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
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|200 response

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||
200|Access-Control-Allow-Methods|string||
200|Access-Control-Allow-Headers|string||

> Response Header

```json
{
    "Access-Control-Allow-Origin":"*",
    "Access-Control-Allow-Methods":"DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT",
    "Access-Control-Allow-Headers":"Content-Type,Authorization,X-Amz-Date,X-Api-Key,X-Amz-Security-Token",
    "Content-Type":"application/json"
}
```
<aside class="success">
This operation does not require authentication
</aside>

## X-AMAZON-APIGATEWAY-ANY-METHOD /data/{proxy+}

> Code samples

```shell
# You can also use wget
curl -X x-amazon-apigateway-any-method https://example.com/test/data/{proxy+} \
  -H 'Accept: application/json'

```

```http
X-AMAZON-APIGATEWAY-ANY-METHOD https://example.com/test/data/{proxy+} HTTP/1.1
Host: example.com

Accept: application/json

```

```javascript
var headers = {
  'Accept':'application/json'

};

$.ajax({
  url: 'https://example.com/test/data/{proxy+}',
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

fetch('https://example.com/test/data/{proxy+}',
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

result = RestClient.x-amazon-apigateway-any-method 'https://example.com/test/data/{proxy+}', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.x-amazon-apigateway-any-method('https://example.com/test/data/{proxy+}', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://example.com/test/data/{proxy+}");
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
To perform this operation, you must be authenticated by means of the following headers:
X-API-Key, Authorization
</aside>

## Send data for events analysis

This endpoint allows the user to send data to the Emotion AI service for analysis. The response will return a series of significant events  

### HTTP Request 

`POST https://example.com/test/events`

> Code samples

```shell
# You can also use wget
curl -X post https://example.com/test/events \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
POST https://example.com/test/events HTTP/1.1
Host: example.com
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: 'https://example.com/test/events',
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

fetch('https://example.com/test/events',
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

result = RestClient.post 'https://example.com/test/events', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.post('https://example.com/test/events', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://example.com/test/events");
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
> Body parameter

```json
{
    "records": {
      "heartrate": [
        {
          "time": 1502807187332,
          "value": 111.77347523527911
        },
        {
          "time": 1502807188332,
          "value": 112.89604978090439
        },
        {
          "time": 1502807189332,
          "value": 112.37719504311998
        },
        {
          "time": 1502807190332,
          "value": 113.68469103590627
        },
        {
          "time": 1502807191332,
          "value": 113.67799449012763
        },
        {
          "time": 1502807192332,
          "value": 112.71988545819869
        },
        {
          "time": 1502807193332,
          "value": 113.05775062793727
        },
        {
          "time": 1502807194332,
          "value": 114.53499763344529
        },
        {
          "time": 1502807195332,
          "value": 115.4964191594706
        },
        {
          "time": 1502807196332,
          "value": 115.31744641217797
        }
      ]
    }
  }
```
### Responses

Status|Meaning|Description
---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful request

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||

> Example responses

```json
{
    "events":{
        "heartrate":[
            {"time":1502807187000,"value":"min","severity":0.03176537181134584},
            {"time":1502807196000,"value":"max","severity":0.03176537181134584}
        ]
    },
    "stats":{
        "heartrate":{
            "avg":113.55359048765672,
            "duration":9,
            "max":115.4964191594706,
            "min":111.77347523527911,
            "std":1.175057115344551,
            "percentiles":{"10":112.3168230623359,"50":113.36787255903245,"90":115.33534368690724}}
    },
    "records":{
        "arousal":[
            {"time":1502807187332,"value":5.359549491038813e-15},
            {"time":1502807188332,"value":0.052921639437207874},
            {"time":1502807189332,"value":0.028461220785887004},
            {"time":1502807190332,"value":0.09010062973692541},
            {"time":1502807191332,"value":0.08978493383721622},
            {"time":1502807192332,"value":0.044616707881203976},
            {"time":1502807193332,"value":0.06054471797280525},
            {"time":1502807194332,"value":0.13018671519236316},
            {"time":1502807195332,"value":0.17551110237516387},
            {"time":1502807196332,"value":0.16707377298958567}
        ]
    },
    "exec_time":0.12196207046508789
}
```
<aside class="warning">
To perform this operation, you must be authenticated by means of the following headers:
X-API-Key, Authorization
</aside>

## Check the methods that can be called on the events resource

This endpoint allows the user to check the HTTP Methods that can be used on the events resource

### HTTP Request


`OPTIONS http://example.com/events`

> Code samples

```shell
# You can also use wget
curl -X options https://example.com/test/events \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
OPTIONS https://example.com/test/events HTTP/1.1
Host: example.com
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: 'https://example.com/test/events',
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

fetch('https://example.com/test/events',
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

result = RestClient.options 'https://example.com/test/events', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.options('https://example.com/test/events', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://example.com/test/events");
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
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful request

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||
200|Access-Control-Allow-Methods|string||
200|Access-Control-Allow-Headers|string||

> Response header

```json
{
    "Access-Control-Allow-Origin":"*",
    "Access-Control-Allow-Methods":"POST,OPTIONS",
    "Access-Control-Allow-Headers":"Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
    "Content-Type":"application/json"
}
```
<aside class="success">
This operation does not require authentication
</aside>

## Get test data 

This endpoint allows the user to generate a series of test data streams that can be fed into the events endpoint to test the analysis service.

### HTTP Request
`GET http://example.com/test/testdata`


> Code samples

```shell
# You can also use wget
curl -X get https://example.com/test/testdata \
  -H 'Accept: application/json'

```

```http
GET https://example.com/test/testdata HTTP/1.1
Host: example.com

Accept: application/json

```

```javascript
var headers = {
  'Accept':'application/json'

};

$.ajax({
  url: 'https://example.com/test/testdata',
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

fetch('https://example.com/test/testdata',
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

result = RestClient.get 'https://example.com/test/testdata', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('https://example.com/test/testdata', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://example.com/test/testdata");
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

### Parameters

Parameter|Default|Type|Required|Description
---|---|---|---|---|
values|[heartrate]|string|false|An array of the metrics to be generated
freq|1|string|false|Frequency of generated records in seconds. Determines timestamps
n|100|string|false|Number of records to be generated per metric


### Responses

Status|Meaning|Description
---|---|---|
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful request

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||

> Example responses

```json
{
    "data":{
        "records":{
            "heartrate":[
                {"time":1502807389973,"value":150.97562499389198},
                {"time":1502807390973,"value":152.35592250838624},
                {"time":1502807391973,"value":152.7272449519015},
                {"time":1502807392973,"value":153.35354662656178},
                {"time":1502807393973,"value":153.78404886070086},
                {"time":1502807394973,"value":155.3441181915241},
                {"time":1502807395973,"value":155.18001608899218},
                {"time":1502807396973,"value":154.5414565968463},
                {"time":1502807397973,"value":156.35855725243886},
                {"time":1502807398973,"value":156.83569789892923}
            ]
        }
    },
    "params":{"n":10,"values":["heartrate"],"freq":1}
}
```
<aside class="warning">
To perform this operation, you must be authenticated by means of the following headers:
X-API-Key, Authorization
</aside>

## Check the methods that can be called on the testdata resource

This endpoint allows the user to check the HTTP Methods that can be used on the testdata resource

### HTTP Request
`OPTIONS http://example.com/testdata`

> Code samples

```shell
# You can also use wget
curl -X options https://example.com/test/testdata \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

```http
OPTIONS https://example.com/test/testdata HTTP/1.1
Host: example.com
Content-Type: application/json
Accept: application/json

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json'

};

$.ajax({
  url: 'https://example.com/test/testdata',
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

fetch('https://example.com/test/testdata',
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

result = RestClient.options 'https://example.com/test/testdata', params: {
  }, headers: headers

p JSON.parse(result)
```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.options('https://example.com/test/testdata', params={

}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://example.com/test/testdata");
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
200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful request

### Response Headers

Status|Header|Type|Format|Description
---|---|---|---|---|
200|Access-Control-Allow-Origin|string||
200|Access-Control-Allow-Methods|string||
200|Access-Control-Allow-Headers|string||

> Response Header 

```json
{
    "Access-Control-Allow-Origin":"*",
    "Access-Control-Allow-Methods":"DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT",
    "Access-Control-Allow-Headers":"Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
    "Content-Type":"application/json"
}
```
<aside class="success">
This operation does not require authentication
</aside>

## Errors

The Sensum Emotion AI API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request
401 | Unauthorized
403 | Forbidden
405 | Method Not Allowed
406 | Not Acceptable
410 | Gone
429 | Too Many Requests
500 | Internal Server Error
503 | Service Unavailable


