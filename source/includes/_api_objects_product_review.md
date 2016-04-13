|||
|---|---|
| Managed by | [Product Reviews Resource](/api/stores/v2/products/reviews)

## Properties

| Name | Type | Description |
| --- | --- | --- |
| `id` | `int` | Unique database ID for this product review. Read-only. |
| `product_id` | `int` | The ID of the product to which this review belongs. Read-only. |
| `author` | `string` | The review's author, displayed on the storefront. |
| `date_created` | `date` | RFC 2822 date that specifies the creation time of the review. (If not specified, will use the current time.) |
| `rating` | `int` | A whole number from 1–5, specifying the product's rating in this review. |
| `title` | `string` | The review's title, displayed on the storefront. |
| `review` | `text` | The full text of the review, displayed on the storefront. |
| `status` | `int` | A status indicator. 0="Pending", 1= "Approved", 2="Disapproved". |
