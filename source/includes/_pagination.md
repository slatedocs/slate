# Pagination

```json
{
  "data": [...],
   "meta": {
      "pagination": {
          "requested_page": 7,
          "total_pages": 16
      }
  }
}
```

For those resources which are paginated, unless otherwise stated in the documentation of that resource, it will be returned in batches of 100.

To access a separate page of the collection then provide `page` as a query parameter eg. `/projects?page=3`

Information on the pagination is found in the `meta` section of the response.
