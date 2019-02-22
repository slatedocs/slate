## Retrieve Managed Clients

 > **Example**: Retrieve a list of all managed clients under your account.

 > Request

```shell
curl "https://rest.tsheets.com/api/v1/managed_clients"
  -H "Authorization: Bearer <TOKEN>"
```

```csharp
var client = new RestClient("https://rest.tsheets.com/api/v1/managed_clients");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <TOKEN>");
IRestResponse response = client.Execute(request);
```

```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("https://rest.tsheets.com/api/v1/managed_clients")
  .get()
  .addHeader("Authorization", "Bearer <TOKEN>")
  .build();

Response response = client.newCall(request).execute();
```

```javascript
var request = require("request");

var options = { method: 'GET',
  url: 'https://rest.tsheets.com/api/v1/managed_clients',
  headers: 
   { Authorization: 'Bearer <TOKEN>' } };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
```

```php
<?php

$request = new HttpRequest();
$request->setUrl('https://rest.tsheets.com/api/v1/managed_clients');
$request->setMethod(HTTP_METH_GET);

$request->setHeaders(array(
  'Authorization' => 'Bearer <TOKEN>'
));

try {
  $response = $request->send();

  echo $response->getBody();
} catch (HttpException $ex) {
  echo $ex;
}
```

```ruby
require 'uri'
require 'net/http'

url = URI("https://rest.tsheets.com/api/v1/managed_clients")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Bearer <TOKEN>'

response = http.request(request)
puts response.read_body
```

```python
import requests

url = "https://rest.tsheets.com/api/v1/managed_clients"

payload = ""
headers = {
    'Authorization': "Bearer <TOKEN>"
    }

response = requests.request("GET", url, data=payload, headers=headers)

print(response.text)
```

```go
package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
)

func main() {

  url := "https://rest.tsheets.com/api/v1/managed_clients"

  req, _ := http.NewRequest("GET", url, nil)

  req.Header.Add("Authorization", "Bearer <TOKEN>")

  res, _ := http.DefaultClient.Do(req)

  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(res)
  fmt.Println(string(body))

}
```

> Response<br/><i>(example will have the following layout)</i>

> <code class="level200">200 OK</code>

```json
{ 
  "results":{ 
   "managed_clients":{ 
     "1146":{ 
      "id":"1146",
      "company_url":"acmedev",
      "company_name":"Acme Dev",
      "active":true,
      "created":"2018-05-31T16:52:50+00:00",
      "last_modified":"2018-08-08T22:23:34+00:00"
     },
     "1232":{ 
      "id":"1232",
      "company_url":"acmetrucking",
      "company_name":"Acme Trucking",
      "active":true,
      "created":"2018-07-13T20:14:52+00:00",
      "last_modified":"2018-07-13T20:19:12+00:00"
     },
     "1274":{ 
      "id":"1274",
      "company_url":"bodacious",
      "company_name":"Bodacious Swine",
      "active":false,
      "created":"2018-08-09T17:21:28+00:00",
      "last_modified":"2018-08-09T17:22:44+00:00"
     },
     "1233":{ 
      "id":"1233",
      "company_url":"acmeclean",
      "company_name":"Acme Cleaning",
      "active":false,
      "created":"2018-07-13T20:32:46+00:00",
      "last_modified":"2018-07-13T20:35:06+00:00"
     }
   },
   "more":false
  }
}
```

Retrieves a list of managed clients available from your account.
 
### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/managed_clients</api>

### Filter Parameters
|                |             |             |
| -------------: | :---------: | ----------- |
| **active**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'yes'. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |

<aside class="warning">
To use this endpoint you must be an admin on your account and have the External Access add-on installed.
</aside>
