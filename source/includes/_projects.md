# Projects

## GET all projects

This endpoint retrieves all projects.

### HTTP Request

`GET http://prod.practitest.com/api/v2/projects.json`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page[number] | 1 | the page number starting from 1
page[size] | 100 | number of entities displayed on a page

Note: The example query parameters above use unencoded [ and ] characters simply for readability. In practice, these characters must be percent-encoded as page%5Bnumber%5D and page%5Bsize%5D

Here's the examples of the JSON requests and responses that you may get when submitting a GET request

[shell_example](/?shell#authentication)

[ruby_example](/?ruby#authentication)

[python_example](/?python#authentication)

[C#](/?csharp#authentication)
