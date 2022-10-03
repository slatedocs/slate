# Affiliate

You can become an affiliate of sx.bet and participate in fee sharing. You'll be able to hook into our market resolution and liquidity using thiis API. Please [contact us](mailto:contact@sx.bet) if you are interested in working with us. We would love to hear from you!

## Get affiliate users

```shell
curl --location --request GET 'https://api.sx.bet/affiliate/users'
```

> The above command returns JSON structured like this:

```json
{
  "status": "success",
  "data": ["0x781555cF6fD1a4B9A36D6dcBB19E90DFE8aDb897"]
}
```

This endpoint retrieves all users registered under a particular affiliate.

### HTTP Request

`GET https://api.sx.bet/affiliate/users`

### Query parameters

| Name      | Required | Type   | Description            |
| --------- | -------- | ------ | ---------------------- |
| affiliate | true     | string | The affiliate to query |

### Response format

| Name   | Type     | Description                                            |
| ------ | -------- | ------------------------------------------------------ |
| status | string   | `success` or `failure` if the request succeeded or not |
| data   | string[] | The users currently registered under this affiliate    |
