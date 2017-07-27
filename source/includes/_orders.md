# Orders

An Order is a request for a purchase of a certain Item.

## Order Model

> Example Order Object

```json
  {
    "id": "1d7986fed6",
    "name": "Silent Child",
    "url": "https://www.amazon.co.uk/Silent-Child-Sarah-Denzil-ebook/dp/B01MUDRSND",
    "provider": "Amazon",
    "cost": 0,
    "price": 100,
    "status": "completed",
    "delivery-email": "user@sunlight.is",
    "address": null,
    "created-at": "2017-03-07T15:45:22.224Z",
    "updated-at": "2017-05-29T20:30:07.969Z",
    "status-changed-at": "2017-03-16T18:50:36.190Z",
    "card-name": null,
    "card-number": null,
    "card-cvv": null,
    "card-billing-address": null,
    "card-expiration-month": null,
    "card-expiration-year": null
  }
```

*A order object contains the following fields*

Attribute | Type | Description
--------- | ------- | -----------
id | **string** | The sunlight defined id representing the order.
name | **string** | The name of the order.
url | **string** | Url to find out more about the item or where to buy it.
provider | **string** | Name of the provider of the item to be purchased.
cost | **integer** | Additional costs associated with the order.
price | **integer** | Order price.
status | **string** | Status in which the order is found.
delivery-email | **string** | Email of the person who will receive the order.
address | **string** | The delivery address of the order.
created-at | **timestamp** | The time the order was added to Sunlight.
updated-at | **timestamp** | The time the order was updated to Sunlight.
status-changed-at | **timestamp** | The time the order status was update to Sunlight.
card-name | **string** |The name as displayed in the card.
card-number | **string** | The 16 digit card number.
card-cvv | **string** | The 3-4 digit code on the back.
card-billing-address | **text** | The billing address associated to the card.
card-expiration-month | **string** | The expiration month of the card
card-expiration-year | **string** | The expiration year of the card

## Orders List

> Orders List - Example

```shell
$ curl -X GET \
  https://app.sunlight.is/api/v2/orders \
  -H 'accept: application/vnd.api+json' \
  -H 'authorization: Bearer <your access token>' \
  -H 'content-type: application/json' \
```

> The encoded json response looks like:

```json
HTTP/1.1 200 OK

{
  "data": [
    {
        "type": "orders",
        "id": "1d7986fed6",
        "attributes": {
          "id": "1d7986fed6",
          "name": "Silent Child",
          "url": "https://www.amazon.co.uk/Silent-Child-Sarah-Denzil-ebook/dp/B01MUDRSND/ref=sr_1_1?ie=UTF8",
          "provider": "Amazon",
          "cost": 0,
          "status": "cancelled",
          "delivery-email": "juan@sunlight.is",
          "address": null,
          "price": 123,
          "created-at": "2017-03-07T15:45:22.224Z",
          "updated-at": "2017-05-29T20:30:07.969Z",
          "status-changed-at": "2017-03-16T18:50:36.190Z",
          "card-name": null,
          "card-number": null,
          "card-cvv": null,
          "card-billing-address": null,
          "card-expiration-month": null,
          "card-expiration-year": null
        },
        "links": {
          "self": "/orders/1d7986fed6"
        },
        "relationships": { }
    },
    {
        "type": "orders",
        "id": "a5cdf56821",
        "attributes": {
          "id": "a5cdf56821",
          "name": "Platzi Subscription",
          "url": "https://platzi.com/comprar/mensual/?course=todos",
          "provider": "Platzi",
          "cost": 0,
          "status": "completed",
          "delivery-email": "gabriel@sunlight.is",
          "address": "Venezuela",
          "price": 2900,
          "created-at": "2017-03-06T16:38:18.516Z",
          "updated-at": "2017-05-29T20:30:11.260Z",
          "status-changed-at": "2017-03-06T16:39:38.110Z",
          "card-name": null,
          "card-number": null,
          "card-cvv": null,
          "card-billing-address": null,
          "card-expiration-month": null,
          "card-expiration-year": null
        },
        "links": {
          "self": "/orders/a5cdf56821"
        },
        "relationships": { }
    }
  ],
  "meta": {
    "total-open": 0,
    "total-waiting": 0,
    "total-waiting-manager-approval": 0,
    "total-approved": 0,
    "total-manager-approved": 0,
    "total-payment-method-issued": 0,
    "total-completed": 1,
    "total-cancelled": 1,
    "total-refunded": 0,
    "totalPages": 1
  },
  "links": {
    "self": "https://app.sunlight.is/orders?page[number]=1&page[size]=10",
    "first": "https://app.sunlight.is/orders?page[number]=1&page[size]=10",
    "prev": "https://app.sunlight.is/orders?page[number]=0&page[size]=10",
    "next": "https://app.sunlight.is/orders?page[number]=2&page[size]=10",
    "last": "https://app.sunlight.is/orders?page[number]=2&page[size]=10"
  },
  "included": []
}
```

You can fetch a list of orders via a `GET` to `https://app.sunlight.is/api/v2/orders`. The order list is sorted by the `updated-at` field and by default is ordered descending, most recently updated first.

<aside class="notice">
  The scope of the orders a user can see will depend on the role of said user.

  Every user can see all of their orders. Additionally, admins of a group can see that groups associated orders.
</aside>

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
page[number] | no | What page of results to fetch defaults to first page.
page[size] | no | How many results per page defaults to 10, max is 50.
sort | no | what field to sort the results by. Valid values: `name`, `created-at`, `update-at`, `total`, `status`, `provider`
filter | no | The filter query parameter is reserved for filtering data. Valid Values: `group-id`, `received-by`, `status`, `id`

### Filters

Filter | Description | Uri Example
---------- | ------------ | -------------
`id` | Filter by order id | `/orders?filter[id]=e67c60e651`
`group-id` | Filter by group-id | `/orders?filter[group-id]=410aff7f39`
`received-by` | Filter by user-id who owns the order | `/orders?filter[received-by]=2bc8066314`
`status` | Filter by order status | `/orders?filter[status]=completed`
