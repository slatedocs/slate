# Lists

## Get All Lists

```shell
curl --location --request GET 'https://yourdomain.com/wp-json/fluent-crm/v2/lists' \
-H 'Authorization: Basic API_USERNAME:API_PASSWORD'
```

> The above command returns JSON structured like this:

```json
{
    "lists": [
        {
            "id": "2",
            "title": "User Two",
            "slug": "user-two",
            "description": null,
            "is_public": "0",
            "created_at": "2021-07-19 08:25:22",
            "updated_at": "2021-07-19 08:25:22",
            "totalCount": 1,
            "subscribersCount": 1
        },
        {
            "id": "1",
            "title": "User One",
            "slug": "user-one",
            "description": null,
            "is_public": "0",
            "created_at": "2021-07-19 08:25:22",
            "updated_at": "2021-07-19 08:25:22",
            "totalCount": 1,
            "subscribersCount": 1
        }
    ]
}
```

This endpoint returns all available lists.

### HTTP Request
`GET https://yourdomain.com/wp-json/fluent-crm/v2/lists`

### URL Parameters

Parameter | Description
--------- | -----------
sort_by | Sort your list by id, title, subscribers
sort_order | Give a sorting order of the list DESC or ASC
search | Search by any value
with[] | Get other additional data

***Possible with parameters:***

- subscribersCount

## Create a new list

```shell
curl --location --request POST 'https://yourdomai.com/wp-json/fluent-crm/v2/lists?title=New List&slug=new-data' \
-H 'Authorization: Basic API_USERNAME:API_PASSWORD'
```

> The above command returns JSON structured like this:

```json
{
    "lists": {
        "title": "User List",
        "slug": "user-list",
        "description": "",
        "updated_at": "2021-07-20 13:18:19",
        "created_at": "2021-07-20 13:18:19",
        "id": 4
    },
    "message": "Successfully saved the list."
}
```

### HTTP Request
`POST https://yourdomain.com/wp-json/fluent-crm/v2/lists/`

### URL Parameters

Parameter | Description
--------- | -----------
title | Add name to your list.
slug | Add slug name to your list.
description | Add Internal Subtitle.

This endpoint will create a new list.

## Update any list

```shell
curl --location --request PUT 'https://yourdomain.com/wp-json/fluent-crm/v2/lists/1?title=New Title' \
-H 'Authorization: Basic API_USERNAME:API_PASSWORD'
```

> The above command returns JSON structured like this:

```json
{
  "lists": "1",
  "message": "Successfully saved the list."
}
```

### HTTP Request
`PUT https://yourdomain.com/wp-json/fluent-crm/v2/lists/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
id | List id
title | Add name to your list.
slug | Add slug name to your list.
description | Add Internal Subtitle.

This endpoint will update a specific list.


## Delete a specific list

```shell
curl --location --request DELETE 'https://yourdomain.com/wp-json/fluent-crm/v2/lists/<ID>' \
-H 'Authorization: Basic API_USERNAME:API_PASSWORD'
```

> The above command returns JSON structured like this:

```json
{
    "message": "Successfully removed the list."
}
```

### HTTP Request
`DELETE https://yourdomain.com/wp-json/fluent-crm/v2/lists/<ID>`

This endpoint will delete a specific list.
