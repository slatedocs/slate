# Metadata

Metadata provides extra information about the returned data.

## Pagination

> Example of metadata:

```json
    "metadata": {
        "pagination": {
            "count": 116,
            "next": "http://example.procurify.xyz/api/v3/integrations/netsuite/object-maps/?page=3&status=synced",
            "previous": "http://example.procurify.xyz/api/v3/integrations/netsuite/object-maps/?page=1&status=synced",,
            "page_size": 10,
            "num_pages": 12,
            "current_page": 2
        }
    }
```

Parameter | Description
--------- | -----------
count | number of total objects in data
next | URL to the next page of data
previous | URL to the previous page of data
page_size | number of objects per page
num_pages | number of paginated pages
current_page | current page

URL Query String | Description
--------- | -----------
page | go to a certain page of data
page_size | change number of objects per page
page_size=all | return all objects without pagination

