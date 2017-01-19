# Pagination

Get all resources supports paginations, for example, to retrive projects:

### HTTP Request

`GET http://api.practitest.com/api/v2/projects.json`

### Pagination Parameters

Parameter | Default | Description
--------- | ------- | -----------
page[number] | 1 | the page number starting from 1
page[size] | 100 | number of entities displayed on a page

<aside class="notice">
The example query parameters above use unencoded [ and ] characters simply for readability. In practice, these characters must be percent-encoded as page%5Bnumber%5D and page%5Bsize%5D
</aside>
