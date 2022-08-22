
# Tags

## Get All Tags

```shell
curl --location --request GET 'https://yourdomain.com/wp-json/fluent-crm/v2/tags' \
-H 'Authorization: Basic API_USERNAME:API_PASSWORD'
```

> The above command returns JSON structured like this:

```json
{
    "tags": [
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

This endpoint returns all available tags.

### HTTP Request
`GET https://yourdomain.com/wp-json/fluent-crm/v2/tags`

### URL Parameters

Parameter | Description
--------- | -----------
sort_by | Sort your list by id, title, subscribers
sort_order | Give a sorting order of the list DESC or ASC
search | Search by any value
page | Page number Default is 1

## Create a new Tag

```shell
curl --location --request POST 'https://yourdomain.com/wp-json/fluent-crm/v2/tags?title=New List&slug=new-data' \
-H 'Authorization: Basic API_USERNAME:API_PASSWORD'
```

> The above command returns JSON structured like this:

```json
{
    "lists": {
        "title": "User Tags",
        "slug": "user-tags",
        "description": "",
        "updated_at": "2021-07-20 13:18:19",
        "created_at": "2021-07-20 13:18:19",
        "id": 4
    },
    "message": "Successfully saved the tag."
}
```

### HTTP Request
`POST https://yourdomain.com/wp-json/fluent-crm/v2/tags/`

### URL Parameters

Parameter | Description
--------- | -----------
title | Add name to your list.
slug | Add slug name to your list.
description | Add Internal Subtitle.

This endpoint will create a new tag.

## Update any Tag

```shell
curl --location --request PUT 'https://yourdomain.com/wp-json/fluent-crm/v2/tags/1?title=New Title' \
-H 'Authorization: Basic API_USERNAME:API_PASSWORD'
```

> The above command returns JSON structured like this:

```json
{
  "lists": "1",
  "message": "Successfully saved the tag."
}
```

### HTTP Request
`PUT https://yourdomain.com/wp-json/fluent-crm/v2/tags/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
id | List id
title | Add name to your list.
slug | Add slug name to your list.
description | Add Internal Subtitle.

This endpoint will update a specific tag.


## Delete a specific Tag

```shell
curl --location --request DELETE 'https://yourdomain.com/wp-json/fluent-crm/v2/tags/<ID>' \
-H 'Authorization: Basic API_USERNAME:API_PASSWORD'
```

> The above command returns JSON structured like this:

```json
{
    "message": "Successfully removed the tag."
}
```

### HTTP Request
`DELETE https://yourdomain.com/wp-json/fluent-crm/v2/tags/<ID>`

This endpoint will delete a specific tag.
