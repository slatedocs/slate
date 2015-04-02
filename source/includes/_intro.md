# Introduction

Welcome to the Chartboost API Docs! You can use these docs to help you access all of our external API endpoints.

We provide code examples where appropriate in Shell (cURL), Python, and PHP. You can view these code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs on the top right.

We are in the process of creating clients for Python and PHP that will aim to remove the heavy lifting in integrating with our endpoints. In the meantime, we hope this documentation serves as a sufficient guide to integrating with our system.


## How To Read These Docs

These docs will be useful to find out how to make the requests to send to our API endpoints.

Each endpoint will have all of the possible and required parameters listed and described. Additionally, there will be information on the HTTP method to use, the headers to include, etc. All ambiguity about a given endpoint should be covered by either the documentation or the code examples. If at any point you find a point that needs clarification, please email [support](mailto:support@chartboost.com).

At some points throughout the docs, we will use double curly braces to signify a variable that should be placed at a certain point. For example, we might notate `{{api token}}` in one parameter. When sending requests of your own, you should replace it with a value. So in practice, `{{api token}}` may become `"my_network_api_token"`

# Authentication

Each service API currently has different methods of authentication. The documentation for the service will include specific instructions on how to authenticate. For all endpoints that require authentication, requests must be signed and the signature must be placed in the `X-Chartboost-Signature` header.

All API requests must be made over HTTPS. Calls made over plain HTTP will redirect to HTTPS, but it a security risk regardless.


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
Remember - The method for generating a signature varies by endpoint.
</aside>
