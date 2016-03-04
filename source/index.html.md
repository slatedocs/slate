---
title: Redii API Reference

language_tabs:
- shell
- ruby

toc_footers:
- <a href='mailto:developers@redii.com?subject=New Developer Key'>Sign Up for a Developer Key</a>
- <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
- errors

search: true
---

# Introduction

Welcome to the Redii API! You can use our API to access Redii API endpoints, currently limited to a list of recent notifications for your Program.

We have language bindings in Shell, Ruby, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.


# Authentication

> To authorize, use this code:

```ruby
uri = URI.parse("https://<your_program_subdomain>.redii.com/api/recognition/v1/moments")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
request['authorization'] = "Token token=#{your_program_token}"
```

```shell
# With shell, you can just pass the correct header with each request
curl -IH "Authorization: Token token=your_program_token" \
https://<your_program_subdomain>.redii.com/api/recognition/v1/moments
```

> Make sure to replace `your_program_token` and `your_program_subdomain` with your relevent key and subdomain.

Redii uses API keys to allow access to the API. You can register a new API key by contacting us @ [developers@redii.com](mailto:developers@redii.com?subject=New Developer Key).

Redii expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Token token=your_program_token`

<aside class="notice">
  You must replace <code>your_program_token</code> with your Program API key.
</aside>

# Recognition

## Get All moments

```ruby
uri = URI.parse("https://<your_program_subdomain>.redii.com/api/recognition/v1/moments?limit=2")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
request['authorization'] = "Token token=#{your_program_token}"
```

```shell
# With shell, you can just pass the correct header with each request
curl -IH "Authorization: Token token=your_program_token" \
https://<your_program_subdomain>.redii.com/api/recognition/v1/moments?limit=2
```

> The above command returns JSON structured like this:

```json
{
  "moment_nominations": [
  {
    "state": "approved",
      "created_at": "2015-12-07T16:36:57.658+11:00",
      "updated_at": "2015-12-07T16:36:57.696+11:00",
      "approved_at": "2015-12-07T16:36:57.663+11:00",
      "award_text": "Repellendus sed labore tempore incidunt facere sed ab iure qui eos alias.",
      "manager_names": "Bruce Yost",
      "user_names": "Wilmer Metz",
      "by_user_id": 6,
      "award_id": 4
  },
  {
    "state": "approved",
    "created_at": "2015-12-07T16:36:57.815+11:00",
    "updated_at": "2015-12-07T16:36:57.829+11:00",
    "approved_at": "2015-12-07T16:36:57.818+11:00",
    "award_text": "Architecto quisquam laboriosam quae dolor libero iure.",
    "manager_names": "",
    "user_names": "Eldred Ullrich",
    "by_user_id": 10,
    "award_id": 3
  }
  ]
}
```

This endpoint retrieves (default of) the 10 most recent moments of recognition.

### HTTP Request

`GET https://<your_program_subdomain>.redii.com/api/recognition/v1/moments`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
limit | 10 | The number of results to return.

<aside class="success">
Remember — replace `your_program_subdomain` with your programs subdomain!
</aside>
