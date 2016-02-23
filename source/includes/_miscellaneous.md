# Miscellaneous

## Get Browser ID

```ruby

```

```shell
curl "http://api.careerbuilder.com/consumer/browser-id"
  -H "Authorization: YOUR_HAPPY_TOKEN"
```

> The above command returns JSON structured like this:

```json
{
    "data":["XREALLYLONGID"],
    "total":1,
    "page_size":1,
    "page":1
}
```

Generates a unique id that can be placed in a cookie to identify a user.

### HTTP Request

`GET https://api.careerbuilder.com/consumer/browser-id`
