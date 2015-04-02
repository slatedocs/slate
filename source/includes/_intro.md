# Introduction

Welcome to the Chartboost API docs! You can use these docs to learn how to access all of our external API endpoints.

We provide code examples where appropriate in Shell (cURL), Python, and PHP. You can view these code examples in the dark area to the right and use the tabs at the top of that section to switch programming languages. 

We are in the process of creating clients for Python and PHP that aim to reduce the heavy lifting involved in accessing our endpoints. In the meantime, we hope this documentation serves as a sufficient guide for integration. 


## How To Read These Docs

These docs demonstrate how to make the requests to send to our API endpoints, with each endpoint's available and required parameters described in detail. 

You'll also find information about which HTTP method to use, which headers to include, etc. 

While we believe that this documentation and the code examples will eliminate ambiguity about our endpoints, we're more than happy to answer any remaining questions you have &ndash; just [contact our Support Team](https://answers.chartboost.com/hc/en-us/requests/new) for assistance!

(Note: At some points in these docs, we will use double curly braces to signify a variable that should be placed at a certain point. For example, we might notate `{{api token}}` in one parameter. When sending requests of your own, you should replace it with a value. So in practice, `{{api token}}` may become `"my_network_api_token"`.)

# Authentication

Each service API currently has different methods of authentication. The documentation for the service will include specific instructions about how to authenticate. For all endpoints that require authentication, requests must be signed and the signature must be placed in the `X-Chartboost-Signature` header.

All API requests must be made over HTTPS. Calls made via plain HTTP will redirect to HTTPS, but it a security risk regardless.


```php
<?php
// The php examples will use the requests library, found at:
// https://github.com/rmccue/Requests

$endpoint = "https://live.chartboost.com/api/endpoint"
$headers = array(
  "X-Chartboost-Signature" => "d41d8cd98f00b204e9800998ecf8427e"
);

Requests::get($response, $headers);
?>
```

```python
# The python examples will use the requests library, found at:
# http://docs.python-requests.org/en/latest/
import requests

endpoint = 'https://live.chartboost.com/api/endpoint'
headers = {
  'X-Chartboost-Signature': 'd41d8cd98f00b204e9800998ecf8427e'
}

requests.get(endpoint, headers=headers)
```

```shell
curl 'https://live.chartboost.com/api/endpoint' \
  -H 'X-Chartboost-Signature: d41d8cd98f00b204e9800998ecf8427e'
```

<aside class="success">
Remember &ndash; signature generation methods vary by endpoint!
</aside>