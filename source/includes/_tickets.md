# Tickets

## Create Support Ticket


```shell
curl -X "POST" "http://partner.url/api/v2/users/:user_id:/tickets" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/tickets')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Post.new uri.request_uri
  request.basic_auth key,''
  request.body = :request_payload:

  response = http.request request

  puts response.body
end

```

> Request payload

```json
{
  "ticket": {
    "description": "How do I create a new Goal?",
    "problem_type": "faq",
    "requester_email": "user@example.com"
  }
}
```

Create a support ticket for the given user.

`POST /api/v2/users/:user_id:/tickets`

### Problem types

| Description | Type |
|-------------|------|
| "I want to request a feature" | `feature_request` |
| "I'm not sure how something works" | `faq` |
| "Something isn't working as intended" | `gzo_defect` |
| "I want to request a financial institution so I can add it" | `bank_request` |
| "Other" | `gzo_defect` |

### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
