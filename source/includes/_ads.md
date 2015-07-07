# Ads

## Get Ads

```shell
curl -X "GET" "http://geezeo.dev:3000/api/v2/users/:user_id:/ads" -u "%geezeo-api-key%:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/ads')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```

> The above command returns JSON structured like this:

```json
{
  "campaign_impressions": [{
    "id": 270,
    "ad_target": "http://www.example.com/api/v2/users/42/campaign_impressions/270/click",
    "links": {"marketing_campaign": 338}
  }],
  "marketing_campaigns": [{
    "id": 338,
    "campaign_location": null,
    "marketing_campaign_image": "http://www.example.com/lorem.jpg",
    "title": "title",
  }]
}
```

Return ads that are relevant to a user. This registers an impression for each returned ad, so API clients are expected to display all ads returned.

`GET /api/v2/users/:user_id:/ads`
`GET /api/v2/users/:user_id:/ads?parameters`

###Parameters

Parameter | Description
--------- | -----------
campaign_location | Limit results to this campaign location.
count | Retrieve at most this many campaign impressions. Defaults to 1.
ad_dimensions | Retrieve only ads with the requested ad_dimensions.

<aside class="warning">campaign_location and ad_dimensions are all optional, but only certain combinations are meaningful</aside>


Description | ad_dimensions | campaign_location
----------- | ------------- | -----------------
Alert Ad | 650_100 | Alert
Budget Ad | 650_100 | Budget
Cashflow Ad | 650_100 | Cashflow
Goal Ad | 650_100 | SavingsGoal
Large Banner Ad | 650_100 | n/a
Left Sidebar Ad | 225_225 | n/a
Mobile Ad | 320_80 | Mobile
Net Worth Ad | 650_100 | Networth
Right Sidebar Ad | 200_200 | n/a
Small Right Sidebar Ad | 95 _95 | n/a
Transaction Feed Ad | 425_100 | n/a


###Status Codes

Status | Description
------ | -----------
200 OK | returned when successful
401 Not Authorized | returned when invalid credentials are provided
404 Not Found | returned when an invalid user is specified

