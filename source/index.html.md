---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Overview

Welcome to Sunlight's API! Use our api to create groups, invite users to a group, see the activities of a group's users and many other things.

The api is organized around REST and was built under the [JSON API](http://jsonapi.org/) specifications.

Send your pull-requests to [`https://github.com/jalagrange/slate`](https://github.com/jalagrange/slate)

## Query parameters

All routes support query parameters to refine responses

- [**include**](http://jsonapi.org/format/#fetching-relationships), e.g. `GET /api/v2/orders?include=category` to include properties of the order relationship

- [**sort**](http://jsonapi.org/format/#fetching-sorting), e.g. `GET /api/v2/orders?sort=name` to sort all accounts ascending by name

- [**page**](http://jsonapi.org/format/#fetching-pagination), e.g. `GET /api/v2/orders?page[number]=1&page[size]=10` to return only the first 10 orders

- [**filter**](http://jsonapi.org/format/#fetching-filtering), The `filter` is not defined by JSON API. Implementations must specify if how the `filter` query parameter is supported.


# Authentication

> Authentication using HTTP basic auth.

```shell
$ curl 'https://person.clearbit.com/v1/people/email/alex@alexmaccaw.com' \
        -u {key}:
```

> Alternatively pass a Bearer token in an Authorization header.

```shell
$ curl 'https://person.clearbit.com/v1/people/email/alex@alexmaccaw.com' \
        -H 'Authorization: Bearer {key}'
```

Authentication is done through the API key that will be provided by sunlight support.

Requests are authenticated using HTTP Basic Auth. Provide your API key as the basic auth username. You do not need to provide a password.

Alternatively you can also pass your API key as a bearer token in an Authorization header.

You can see your account’s API keys, and roll them if necessary, in the dashboard.

# Groups

The groups help you organize better the users in sunlight, they allow you to monitor what the members are learning and know what they are spending their sunlights.

## Group Model

> Example Group Object

```json
 {
    "id": "806b946cf5",
    "name": "Sunlight",
    "address": "Planet Earth",
    "bio": "Test",
    "about-url": "https://sunlight.is",
    "manager-approval": false,
    "privacy-setting": "admin-invite",
    "avatar-url": "https://sunlight-production-beanstalk.s3.amazonaws.com/avatar.jpeg",
    "cover-url": "https://sunlight-production-beanstalk.s3.amazonaws.com/cover.jpeg",
    "number-of-members": 1
    "created-at": "2017-07-20T15:19:04.416Z",
    "updated-at": "2017-07-20T15:19:04.416Z",
  }
```

*A group object contains the following fields*

Attribute | Type | Description
--------- | ------- | -----------
uid | **string** | The sunlight defined id representing the group
name | **string** | The name of the group
address | **string** | The address of the group
bio | **string** | A short description of the group
abour-url | **string** | Url for the group's website.
manager-approval | **boolean** | if the orders requieres manager approval
privacy-setting | **string** | Group privacy type
avatar-url | **string** | Avatar url of the group
cover-url | **string** | Cover url of the group
number-of-members | **integer** | The number of users in the group
created-at | **timestamp** | The time the group was added to Sunlight
updated-at | **timestamp** | The time the group was updated to Sunlight

### privacy-settings:

You can choose to allow people to join your group anytime, have them request invites or only allow them to join by an admin’s invitation.

- `admin-invite`: People are joined by an invitation from the group admin ***(Avaiable)***
- `public_access`: People can join your group anytime ***(No avaible)***
- `request_invite`: People request invite to join a group ***(No avaible)***

### manager-approval

- `true`: if you’d like every spending order that uses funds from this group to require approval from a group admin.
- `false`: if you wouldn't like every spending order that uses funds from this group to require approval from a group admin.


## Create group

> Create Group Example

```shell
$ curl -X POST \
  https://app.sunlight.is/api/groups \
  -H 'accept: application/vnd.api+json' \
  -H 'authorization: Bearer <your access token>' \
  -H 'content-type: application/json' \
  -d '{
  "data": {
    "attributes": {
      "name": "Sunlight",
      "address": "Planet Earth",
      "about-url": "https://sunlight.is",
      "bio": "Give Sunlight to employees, friends and family for them to spend on education."
      "privacy-setting": "admin-invite",
      "manager-approval": true
    }
  }
}'
```

> The json response encoded looks like:

```json
HTTP/1.1 201 CREATED 

{
  "data": {
    "type": "groups",
    "id": "806b946cf5",
    "attributes": {
      "id": "806b946cf5",
      "name": "Sunlight",
      "address": "Planet Earth",
      "bio": "Give Sunlight to employees, friends and family for them to spend on education.",
      "avatar-url": null,
      "cover-url": null,
      "about-url": "https://sunlight.is",
      "privacy-setting": "admin-invite",
      "manager-approval": true,
      "created-at": "2017-07-20T15:19:04.416Z",
      "slack-config-url": null,
      "slack-url": null,
      "slack-token": null,
      "number-of-members": 1
    },
    "links": {
      "self": "/groups/806b946cf5"
    },
    "relationships": {}
  },
  "included": []
}
```

Groups can be created via a `POST` to `https://sunlight.is/api/groups`, which accepts a JSON object describing the group.

<aside class="notice">
  Note that a group will always have at least one user associated, at the time of creating a group will automatically be a member and administrator.
</aside>

### Query Parameters

The table below shows the fields you can create for a group

Parameter | Required | Description
--------- | ------- | -----------
name | yes | The name of the group
address | no | The address of the group
bio | no | A short description of the group
abour-url | no | Url for the group's website.
manager-approval | no | if the orders requieres manager approval
privacy-setting | yes | Group privacy type
avatar-url | no | Avatar url of the group
cover-url | no | Cover url of the group
number-of-members | no | The number of users in the group

## Invite a user to a group

> Invite unregistered user to Group - Example

```shell
$ curl -X POST \
  http://localhost:4000/api/v2/group-invitations \
  -H 'accept: application/vnd.api+json' \
  -H 'authorization: Bearer <your access token>' \
  -H 'content-type: application/json' \
  -d '{
  "data": {
    "attributes": {
      "email": "jose@sunlight.is"
    },
    "relationships": {
      "group": {
        "data": {
          "id": "9030927d27" 
        }
      }
    }
  }
}'
```

> The json response encoded looks like:

```json
HTTP/1.1 201 CREATED 

{
  "data": {
    "type": "group-users",
    "id": "a910564e67",
    "attributes": {
      "id": "a910564e67",
      "administrator": false
    },
    "links": {
      "self": "/group-users/a910564e67"
    },
    "relationships": { }
  },
  "included": []
}
```

> Invite registered user to Group - Example

```shell
$ curl -X POST \
  http://localhost:4000/api/v2/group-users \
  -H 'accept: application/vnd.api+json' \
  -H 'authorization: Bearer <your access token>' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 648830e0-0f0e-5d35-93ab-b7fd494c8d61' \
  -d '{
  "data": {
    "attributes": {
      administrator: false
    },
    "relationships": {
      "user": {
        "data": {
          "id": "54a4759f2c"
        }  
      },
      "group": {
        "data": {
          "id": "9030927d27" 
        }
      }
    }
  }
}'
```

> The json response encoded looks like:

```json
HTTP/1.1 201 CREATED 

{
  "data": {
    "type": "group-users",
    "id": "832a222ad8",
    "attributes": {
      "id": "832a222ad8",
      "administrator": false
    },
    "links": {
      "self": "/group-users/832a222ad8"
    },
    "relationships": { }
  }
}
```

The groups allow you to invite registered and unregistered users in sunglight, to each case there are different params and different endpoints.

<aside class="notice">
  You can only invite users to groups where you are an admin.
</aside>

### To unregistered users 

via a `POST` to `https://sunlight.is/api/group-invitations`, which accepts a JSON object.

Parameter | Required | Description
--------- | ------- | -----------
email | yes | The email of the user you want to invite
relationships[group][id] | yes | Group id which the user will be joining to.

### To registered users

via a `POST` to `https://sunlight.is/api/group-users`, which accepts a JSON object.

Parameter | Required | Description
--------- | ------- | -----------
administrator | yes | true if you want the user to be group admin
relationships[user][id] | yes | User's id of the user you want to invite
relationships[group][id] | yes | Group's id which the user will be joining


## Edit budget of an individual user

# Activities

## Get activities of a user
## Get activities of a group


# Orders

Overview orders

## List orders

> List orders - Example

```shell
$ curl -X GET \
  http://localhost:4000/api/v2/orders \
  -H 'accept: application/vnd.api+json' \
  -H 'authorization: Bearer <your access token>' \
  -H 'content-type: application/json' \
```

> The json response encoded looks like:

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
    "self": "http://localhost:4000/orders?page[number]=1&page[size]=10",
    "first": "http://localhost:4000/orders?page[number]=1&page[size]=10",
    "prev": "http://localhost:4000/orders?page[number]=0&page[size]=10",
    "next": "http://localhost:4000/orders?page[number]=2&page[size]=10",
    "last": "http://localhost:4000/orders?page[number]=2&page[size]=10"
  },
  "included": []
}
```

You can fetch a list of orders via a `GET` to `https://sunlight.is/api/v2/orders`. The order list is sorted by the `updated-at` field and by default is ordered descending, most recently updated first.

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
page[number] | no | What page of results to fetch defaults to first page.
page[size] | no | How many results per page defaults to 10, max is 50.
sort | no | what field to sort the results by. Valid values: `name`, `created-at`, `update-at`, `total`, `status`, `provider`
filter | no | The filter query parameter is reserved for filtering data. Valid Values: `group-id`, `received-by`, `status`

<aside class="notice">
  The scope of the orders a user can see will depend on the rol of said user.

  Every user can see all of their orders and the ones associated to the groups which said user is admin.
</aside>

