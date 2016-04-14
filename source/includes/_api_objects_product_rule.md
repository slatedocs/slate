# Product Rules

|||
|---|---|
| Managed by | [Product Rules Resource](/api/stores/v2/products/rules)

## Product Rule Object - Properties

| Name | Type | Description |
| --- | --- | --- |
| id | int | The ID of the rule. |
| product_id | int | The ID of the product the rule belongs to |
| sort_order | int | The order in which the rule will be displayed on the product page. When updating if the rule is given a lower priority, all rules with a sort_order the same or greater than the rules new sort_order value will have their sort_order reordered |
| is_enabled | boolean | If set to true, the rule will be evaluated when a customer configures a products options. |
| is_stop | boolean | If set to true and the rule evaluates to true, no more rules with a higher sort_order will be processed. |
| price_adjuster | object | If a product option rule specifies a change to the price based on an option, the "price_adjuster" object will consist of two name/value pairs. The first pair is named "adjuster" and contains one of the following values: "relative", "percentage", or "absolute". The "percentage" value causes the price to vary based on either a positive or negative percentage. The "relative" value causes the price to vary by either a positive or negative monetary amount. The "absolute" value resets the price, so it should always be a positive number. The second pair is named "adjuster_value" and contains a decimal value representing one of the following: the amount to add or subtract from the price, the percentage by which the price should change, or the new price (as per the "adjuster" setting). If the product option rule does not specify a change to the price based on size or color, "price_adjuster" will be null. |
| weight_adjuster | object | If a product option rule specifies a change to the weight based on an option, the "weight_adjuster" object will consist of two name/value pairs. The first pair is named "adjuster" and contains one of the following values: "relative" or "absolute". The "relative" value causes the weight to vary by either a positive or negative amount. The "absolute" value resets the weight, so it should always be a positive number. The second pair is named "adjuster_value" and contains a decimal value representing one of the following: the amount to add or subtract from the weight or the new weight (as per the "adjuster" setting). If the product option rule does not specify a change to the price based on size or color, "weight_adjuster" will be null. |
| is_purchasing_disabled | boolean | If true this rule prohibits purchasing the product with the configured option values. |
| purchasing_disabled_message | string | The message to display if the rule disabled purchasing the product. |
| is_purchasing_hidden | boolean | If true the rule hides the options on the product. Setting this to true has no effect if the rule is based on an SKU or has conditions from multiple product options. |
| image_file | string | When specifying a product rule, the image_file should be specified as either: A path to an rule already uploaded via FTP in the import directory and the path should be relative from the import directory. It can be a URL to an rule accessible on the internet. |
| conditions | array | The conditions array can contain one or more objects. Each object inside the array contains three name/value pairs, but at least one value will be missing at any given time. If a "product_option_id" value is present, then a "option_value_id" must also be present. If "product_option_id" and "option_value_id" values are present, then a "sku_id" value must not be present. This also holds true in the reverse, where if a "sku_id" value exists, values for the "product_option_id" and "option_value_id" cannot exist. NOTE: if you can use a SKU value, this is preferred for simplicity. Empty values are represented as "null". If multiple objects are included in the array, the software runs through them using an AND/OR logic. Objects with identical "product_option_id" values will be linked with an OR. Objects with different "product_option_id" values will be linked with an AND. When one object contains a "sku_id" value and the other contains "product_option_id" and "option_value_id" values, they will be linked with an AND. Two objects which both contain "sku_id" values will be linked with an OR. |
