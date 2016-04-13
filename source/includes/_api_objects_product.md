# Products

## Product Object – Properties

Properties for a saleable item in the catalog

|||
|---|---|
| Managed by | [Products Resource](/api/?BasicAuth#products-resource)

| Name | Type | Description |
| --- | --- | --- | --- |
| `id` | `int` | The unique numerical ID of the product, increments sequentially |
| `keyword_filter` | `string` |
| `name` | `string` | The product name. |
| `type` | `enum` | The product type: physical - a physical stock unit digital - a digital download |
| `sku` | `string` | User defined product code/stock keeping unit (SKU). |
| `description` | `text` | The product description which can include HTML formatting. |
| `search_keywords` | `text` | A comma separated list of keywords that can be used to locate the product when searching the store. |
| `availability_description` | `string` | Availability text displayed on the checkout page under the product title telling the customer how long it will normally take to ship this product, such as "Usually ships in 24 hours". |
| `price` | `decimal` | The price of the product, the price should include or exclude tax based on the store settings. |
| `cost_price` | `decimal` | The cost price of the product, stored for reference only, it is not used or displayed anywhere on the store. |
| `retail_price` | `decimal` | The retail cost of the product, if entered the retail cost price will be shown on the product page. |
| `sale_price` | `decimal` | The sale price will be used instead of value in the price field when calculating the products cost if entered. |
| `calculated_price` | `decimal` |
| `sort_order` | `int` | Priority this product will be given when included in product lists on category pages and search results. The lower the number, the closer to the top of the results the product will be. |
| `is_visible` | `boolean` | Flag to determine if the product should be displayed to customers browsing the store or not. If true the product will be displayed, false the product will be hidden from view. |
| `is_featured` | `boolean` | Flag to determine if the product should be included in "featured products" panel when viewing the store. |
| `related_products` | `string` | Defaults to -1, which causes the store to automatically generate a list of related products. To manually specify the list of related products, include their IDs, separated by commas. For example, "3, 6, 7, 21". |
| `inventory_level` | `int` | Current inventory level of the product. Simple inventory tracking must be enabled (See the inventory_tracking field) for this to take any effect. |
| `inventory_warning_level` | `int` | Inventory Warning level for the product. When the products inventory level drops below the warning level the store owner will be informed. Simple inventory tracking must be enabled (See the inventory_tracking field) for this to take any effect. |
| `warranty` | `text` | Warranty information displayed on the product page which can include HTML formatting. |
| `weight` | `decimal` | Weight of the product used which can be used when calculating shipping costs. |
| `width` | `decimal` | Width of the product used which can be used when calculating shipping costs. |
| `height` | `decimal` | Height of the product used which can be used when calculating shipping costs. |
| `depth` | `decimal` | Depth of the product used which can be used when calculating shipping costs. |
| `fixed_cost_shipping_price` | `decimal` | A fixed shipping cost for the product, if defined the value will be used during checkout instead of normal shipping cost calculation. |
| `is_free_shipping` | `boolean` | Flag used to indicate if the product has free shipping or not. If true the shipping cost for the product will be zero. |
| `inventory_tracking` | `enum` | The type of inventory tracking for the product: none - inventory levels will not be tracked. simple - inventory levels will be tracked using the "inventory_level" and "inventory_warning_level" fields. sku - inventory levels will be tracked based on individual product options which maintain their own warning levels and inventory levels. |
| `rating_total` | `int` | The total rating for the product. |
| `rating_count` | `int` | The total number of ratings the product has had. |
| `total_sold` | `int` |
| `date_created` | `date` | The date of which the product was created. |
| `brand_id` | `int` | The product's brand |
| `view_count` | `int` | The number of times the product has been viewed. |
| `page_title` | `string` | Custom title for the products page, if not defined the product name will be used as the page title. |
| `meta_keywords` | `text` | Custom meta keywords for the product page, if not defined the store default keywords will be used. |
| `meta_description` | `text` | Custom meta description for the product page, if not defined the store default meta description will be used. |
| `layout_file` | `string` | The layout template file used to render this category. |
| `is_price_hidden` | `boolean` | False by default, which indicates that the price of this product should be shown on the product page. If set to "true", the price is hidden. NOTE: To successfully set "is_price_hidden" to "true", the "availability" value must be "disabled". |
| `price_hidden_label` | `string` | By default, an empty string. If "is_price_hidden" is "true", the value of "price_hidden_label" is displayed instead of the price. NOTE: To successfully set a non-empty string value for "price_hidden_label", the "availability" value must be "disabled". |
| `categories` | `array` | An array of IDs for the categories this product belongs to. When updating a product, if an array of categories is supplied all product categories will be overwritten. Does not accept more than 1,000 ID values. |
| `date_modified` | `date` | The date that the product was last modified. |
| `event_date_field_name` | `string` | Name of the field to be displayed on the product page when selecting the "delivery/event" date. |
| `event_date_type` | `enum` | none - If set to none then the event/delivery date requirement and field will be disabled. after - The selected date must fall either on or after the date specified in the "event_date_start" field. before - The selected date must fall either before or on the date specified in the "event_date_end" field. range - The selected date must fall between the "event_date_start" and "event_date_end" dates. |
| `event_date_start` | `date` | The date which is used as the "after" date when the product requires the customer to select a delivery/event date. |
| `event_date_end` | `date` | The date which is used as the "before" date when the product requires the customer to select a delivery/event date. |
| `myob_asset_account` | `string` | MYOB Asset Account. |
| `myob_income_account` | `string` | MYOB Income Account. |
| `myob_expense_account` | `string` | MYOB Expense/COS Account. |
| `peachtree_gl_account` | `string` | Peachtree General Ledger Account. |
| `condition` | `enum` | The product condition, will be shown on the product page if the value of the "is_condition_shown" field is true. Possible values: `New`, `Used`, `Refurbished` |
| `is_condition_shown` | `boolean` | Flag used to determine if the product condition is shown to the customer on the product page. |
| `preorder_release_date` | `date` | Pre-order release date. See availability field for details on setting a products availability to accept pre-orders. |
| `is_preorder_only` | `boolean` | If set to false, the product will not change its availability from preorder to available on the release date. Otherwise on the release date the products availability/status will change to available. |
| `preorder_message` | `string` | Custom expected date message to display on the product page, if undefined the message defaults to the store wide setting. Can contain the %%DATE%% place holder which will be substituted for the release date |
| `order_quantity_minimum` | `int` | The minimum quantity an order has to contain to be able to purchase this product. |
| `order_quantity_maximum` | `int` | The maximum quantity an order can contain when purchasing the product. |
| `open_graph_type` | `enum` | Type of product, valid values are: product album book drink food game movie song tv_show |
| `open_graph_title` | `string` | Title of the product, if not specified the product name will be used instead. |
| `open_graph_description` | `text` | Description to use for the product, if not specified then the meta_description will be used instead. |
| `is_open_graph_thumbnail` | `boolean` | If set to true, the product thumbnail image will be used as the open graph image. |
| `upc` | `string` | The product UPC code which is used in feeds for shopping comparison sites. |
| `date_last_imported` | `date` | The date of which the product was last imported using the bulk importer. |
| `option_set_id` | `int` | The ID of the option set applied to the product. Note: To remove the option set off the product, set the value to "null" on update. |
| `tax_class_id` | `int` | The ID of the tax class applied to the product. NOTE: Value ignored if automatic tax is enabled. |
| `option_set_display` | `enum` | The position the option set options will be displayed on the product page. |
| `bin_picking_number` | `string` | The BIN picking number for the product. |
| `custom_url` | `string` |
| `availability` | `enum` | Availability of the product. availability options: available - The product can be purchased in the store front. disabled - The product is listed in the store front but can not be purchased. preorder - The product is listed for pre-orders. |
| `brand` | `resource` |
| `downloads` | `resource` |
| `images` | `resource` | See the Images resource for information. |
| `discount_rules` | `resource` | See the Bulk Discount Rules resource for information. |
| `configurable_fields` | `resource` | See the Configurable Fields resource for information. |
| `custom_fields` | `resource` | See the Custom Fields resource for information. |
| `videos` | `resource` | See the Videos resource for information. |
| `skus` | `resource` | Stock Keeping Units for the product. See the SKU resource for the definition of a sku object. |
| `rules` | `resource` | Rules which apply to this product only which are based on the products Option Set. See Rules resource for information. |
| `option_set` | `resource` | See the Option Set resource for information. |
| `options` | `resource` | Options from the option set applied to the product. See the Product Options resource for information. |
| `tax_class` | `resource` |
| `avalara_product_tax_code` | `resource` | Accepts AvaTax system codes that identify products and services that fall into special sales tax categories. Allows merchants that subscribe to Avalara Premium to achieve increased accuracy in sales tax calculations. Stores without Avalara Premium will ignore the code when calculating sales tax. Do not pass more than one code. The codes are case-sensitive. Refer to the "AvaTax System tax codes" section of the following page for further information and the full list of codes: https://help.avalara.com/000_AvaTax_Calc/000AvaTaxCalc_User_Guide/040_Managing_Tax_Profiles/050_Tax_Codes/001_What_is_a_Tax_Code |

## Webhook Events

### Product Created

```json
store/product/created
```

Occurs when a product is created from the control panel, bulk import or via the API.

### Product Updated

```json
store/product/updated
```

Occurs when a product is updated from the control panel or via the API.


### Product Deleted

```json
store/product/deleted
```

Occurs when a product is deleted from the control panel or via the API.
