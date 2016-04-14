# Product Images

Properties for a product image

|||
|---|---|
| Managed by | [Product Images Resource](/api/?BasicAuth#product-images-resource)

## Product Image Object – Properties

| Name | Type | Description |
| --- | --- | --- |
| id | int |
| product_id | int | The ID of the product the image belongs to |
| image_file | string | When specifying a product image, the image_file should be specified as either: A path to an image already uploaded via FTP in the import directory and the path should be relative from the import directory. It can be a URL to an image accessible on the internet. |
| is_thumbnail | boolean | If true, the image is used as product thumbnail |
| sort_order | int | The order in which the image will be displayed on the product page. When updating if the image is given a lower priority, all image with a sort_order the same or greater than the images new sort_order value will have their sort_order reordered |
| description | text | The description for the image |
| date_created | date |
