This endpoint retrieves brands and products based on the similarity with the provided image.

### HTTP Request

`POST http://api.markable.us/v1/search`

### Headers

`Content-Type: application/vnd.api+json`

### Body Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
box | json | true | The bounding box that outlines the object of interest.
box.x | number | true | The x-coordinate of the top-left corner.
box.y | number | true | The y-coordinate of the top-left corner.
box.width | number | true | The width of the rectangle.
box.height | number | true | The height of the rectangle.
catalog_id | string | true | The Catalog ID of the catalog to search with this request.
image_uri | string | true | The base-64-encoded data URI.

<aside class="warning">
Remember — the parameters have to be on the body of the request!
</aside>

### Response

Parameter | Type | Description
--------- | ---- | -----------
brands | array | List of brands matched on a Visual Search.
products | array | List of products matched on a Visual Search.
type | string | Represent the property on this object that contains the first match. Possible values are 'brands', 'products'
