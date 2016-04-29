## Products Resource – Operations

Catalog of saleable items in the store.

|||
|---|---|
| **Manages** | [Product Object](/api/?BasicAuth#product-properties) |
| **OAuth Scopes** | `store_v2_products` |
| |`store_v2_products_read_only`

**Operations**

*   [List Products](#list-products)
*   [Get a Product](#get-a-product)
*   [Get a Product Count](#get-a-product-count)
*   [Create a Product](#create-a-product)
*   [Update a Product](#update-a-product)
*   [Delete a Product](#delete-a-product)
*   [Delete All Products](#delete-all-products)

## List Products

Gets the collection of products. (Default sorting is by product id, from lowest to highest.)

```json
[
  {
    "id": 32,
    "keyword_filter": null,
    "name": "[Sample] Tomorrow is today, Red printed scarf",
    "type": "physical",
    "sku": "",
    "description": "Densely pack your descriptions with useful information and watch products fly off the shelf.",
    "search_keywords": null,
    "availability_description": "",
    "price": "89.0000",
    "cost_price": "0.0000",
    "retail_price": "0.0000",
    "sale_price": "0.0000",
    "calculated_price": "89.0000",
    "sort_order": 0,
    "is_visible": true,
    "is_featured": true,
    "related_products": "-1",
    "inventory_level": 0,
    "inventory_warning_level": 0,
    "warranty": null,
    "weight": "0.3000",
    "width": "0.0000",
    "height": "0.0000",
    "depth": "0.0000",
    "fixed_cost_shipping_price": "10.0000",
    "is_free_shipping": false,
    "inventory_tracking": "none",
    "rating_total": 0,
    "rating_count": 0,
    "total_sold": 0,
    "date_created": "Fri, 21 Sep 2012 02:31:01 +0000",
    "brand_id": 17,
    "view_count": 4,
    "page_title": "",
    "meta_keywords": null,
    "meta_description": null,
    "layout_file": "product.html",
    "is_price_hidden": false,
    "price_hidden_label": "",
    "categories": [
      14
    ],
    "date_modified": "Mon, 24 Sep 2012 01:34:57 +0000",
    "event_date_field_name": "Delivery Date",
    "event_date_type": "none",
    "event_date_start": "",
    "event_date_end": "",
    "myob_asset_account": "",
    "myob_income_account": "",
    "myob_expense_account": "",
    "peachtree_gl_account": "",
    "condition": "New",
    "is_condition_shown": false,
    "preorder_release_date": "",
    "is_preorder_only": false,
    "preorder_message": "",
    "order_quantity_minimum": 0,
    "order_quantity_maximum": 0,
    "open_graph_type": "product",
    "open_graph_title": "",
    "open_graph_description": null,
    "is_open_graph_thumbnail": true,
    "upc": null,
    "avalara_product_tax_code": "",
    "date_last_imported": "",
    "option_set_id": null,
    "tax_class_id": 0,
    "option_set_display": "right",
    "bin_picking_number": "",
    "custom_url": "/tomorrow-is-today-red-printed-scarf/",
    "primary_image": {
      "id": 247,
      "zoom_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/247/in_123__14581.1393831046.1280.1280.jpg?c=1",
      "thumbnail_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/247/in_123__14581.1393831046.220.290.jpg?c=1",
      "standard_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/247/in_123__14581.1393831046.386.513.jpg?c=1",
      "tiny_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/247/in_123__14581.1393831046.44.58.jpg?c=1"
    },
    "availability": "available",
    "brand": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/brands/17.json",
      "resource": "/brands/17"
    },
    "images": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/images.json",
      "resource": "/products/32/images"
    },
    "discount_rules": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/discountrules.json",
      "resource": "/products/32/discountrules"
    },
    "configurable_fields": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/configurablefields.json",
      "resource": "/products/32/configurablefields"
    },
    "custom_fields": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/customfields.json",
      "resource": "/products/32/customfields"
    },
    "videos": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/videos.json",
      "resource": "/products/32/videos"
    },
    "skus": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/skus.json",
      "resource": "/products/32/skus"
    },
    "rules": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/rules.json",
      "resource": "/products/32/rules"
    },
    "option_set": null,
    "options": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/options.json",
      "resource": "/products/32/options"
    },
    "tax_class": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/taxclasses/0.json",
      "resource": "/taxclasses/0"
    }
  },
  {
    "id": 33,
    "keyword_filter": null,
    "name": "[Sample] Anna, multi-colored bangles",
    "type": "physical",
    "sku": "",
    "description": "One of the best things you can do to make your store successful is invest some time in writing great product descriptions.</p>",
    "search_keywords": null,
    "availability_description": "",
    "price": "59.0000",
    "cost_price": "0.0000",
    "retail_price": "0.0000",
    "sale_price": "0.0000",
    "calculated_price": "59.0000",
    "sort_order": 0,
    "is_visible": true,
    "is_featured": true,
    "related_products": "-1",
    "inventory_level": 0,
    "inventory_warning_level": 0,
    "warranty": null,
    "weight": "0.5000",
    "width": "0.0000",
    "height": "0.0000",
    "depth": "0.0000",
    "fixed_cost_shipping_price": "0.0000",
    "is_free_shipping": false,
    "inventory_tracking": "none",
    "rating_total": 0,
    "rating_count": 0,
    "total_sold": 0,
    "date_created": "Fri, 21 Sep 2012 02:46:41 +0000",
    "brand_id": 18,
    "view_count": 12,
    "page_title": "",
    "meta_keywords": null,
    "meta_description": null,
    "layout_file": "product.html",
    "is_price_hidden": false,
    "price_hidden_label": "",
    "categories": [
      14
    ],
    "date_modified": "Mon, 24 Sep 2012 05:28:02 +0000",
    "event_date_field_name": "Delivery Date",
    "event_date_type": "none",
    "event_date_start": "",
    "event_date_end": "",
    "myob_asset_account": "",
    "myob_income_account": "",
    "myob_expense_account": "",
    "peachtree_gl_account": "",
    "condition": "New",
    "is_condition_shown": false,
    "preorder_release_date": "",
    "is_preorder_only": false,
    "preorder_message": "",
    "order_quantity_minimum": 0,
    "order_quantity_maximum": 0,
    "open_graph_type": "product",
    "open_graph_title": "",
    "open_graph_description": null,
    "is_open_graph_thumbnail": true,
    "upc": null,
    "avalara_product_tax_code": "",
    "date_last_imported": "",
    "option_set_id": 13,
    "tax_class_id": 0,
    "option_set_display": "right",
    "bin_picking_number": "",
    "custom_url": "/anna-multi-colored-bangles/",
    "primary_image": {
      "id": 245,
      "zoom_url": "https://cdn.url.path/bcapp/et7xe3pz/products/33/images/245/HERO_cocolee_anna_92865__20303.1393831046.1280.1280.jpg?c=1",
      "thumbnail_url": "https://cdn.url.path/bcapp/et7xe3pz/products/33/images/245/HERO_cocolee_anna_92865__20303.1393831046.220.290.jpg?c=1",
      "standard_url": "https://cdn.url.path/bcapp/et7xe3pz/products/33/images/245/HERO_cocolee_anna_92865__20303.1393831046.386.513.jpg?c=1",
      "tiny_url": "https://cdn.url.path/bcapp/et7xe3pz/products/33/images/245/HERO_cocolee_anna_92865__20303.1393831046.44.58.jpg?c=1"
    },
    "availability": "available",
    "brand": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/brands/18.json",
      "resource": "/brands/18"
    },
    "images": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/33/images.json",
      "resource": "/products/33/images"
    },
    "discount_rules": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/33/discountrules.json",
      "resource": "/products/33/discountrules"
    },
    "configurable_fields": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/33/configurablefields.json",
      "resource": "/products/33/configurablefields"
    },
    "custom_fields": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/33/customfields.json",
      "resource": "/products/33/customfields"
    },
    "videos": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/33/videos.json",
      "resource": "/products/33/videos"
    },
    "skus": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/33/skus.json",
      "resource": "/products/33/skus"
    },
    "rules": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/33/rules.json",
      "resource": "/products/33/rules"
    },
    "option_set": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/optionsets/13.json",
      "resource": "/optionsets/13"
    },
    "options": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/33/options.json",
      "resource": "/products/33/options"
    },
    "tax_class": {
      "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/taxclasses/0.json",
      "resource": "/taxclasses/0"
    }
  }
]
```

|||
|---|---|
| Basic Auth: | `GET /api/v2/products` |
| OAuth: | `GET /stores/{store_hash}/v2/products` |

### Filters

Filter parameters can be added to the URL query string to select specific products in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `min_id` | int | `/api/v2/products?min_id={value}` |
| `max_id` | int | `/api/v2/products?max_id={value}` |
| `name` | string | `/api/v2/products?name={value}` |
| `keyword_filter` | string | `/api/v2/products?keyword_filter={value}` |
| `description` | string | `/api/v2/products?description={value}` |
| `sku` | string | `/api/v2/products?sku={value}` |
| `condition` | string | `/api/v2/products?condition={value}` |
| `availability` | string | `/api/v2/products?availability={value}` |
| `brand_id` | string | `/api/v2/products?brand_id={value}` |
| `min_date_created` | dateTime or date | `/api/v2/products?min_date_created={value}` |
| `max_date_created` | dateTime or date | `/api/v2/products?max_date_created={value}` |
| `min_date_modified` | dateTime or date | `/api/v2/products?min_date_modified={value}` |
| `max_date_modified` | dateTime or date | `/api/v2/products?max_date_modified={value}` |
| `min_date_last_imported` | date | `/api/v2/products?min_date_last_imported={value}` |
| `max_date_last_imported` | date | `/api/v2/products?max_date_last_imported={value}` |
| `min_price` | decimal | `/api/v2/products?min_price={value}` |
| `max_price` | decimal | `/api/v2/products?max_price={value}` |
| `min_number_sold` | int | `/api/v2/products?min_number_sold={value}` |
| `max_number_sold` | int | `/api/v2/products?max_number_sold={value}` |
| `is_visible` | string | `/api/v2/products?is_visible={value}` |
| `is_featured` | string | `/api/v2/products?is_featured={value}` |
| `min_inventory_level` | int | `/api/v2/products?min_inventory_level={value}` |
| `max_inventory_level` | int | `/api/v2/products?max_inventory_level={value}` |
| `include_sku` | boolean | `/api/v2/products?include_sku={value}` |
| `category` | string | `/api/v2/products?category={value}` |
| `product_tax_code` | string | `/api/v2/products?product_tax_code={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 products are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/products?page={number}` |
| `Limit` | int | `/api/v2/products?limit={count}` |

## Get a Product

Gets a product.

```json
{
  "id": 32,
  "keyword_filter": null,
  "name": "[Sample] Tomorrow is today, Red printed scarf",
  "type": "physical",
  "sku": "",
  "description": "Densely pack your descriptions with useful information and watch products fly off the shelf.",
  "search_keywords": null,
  "availability_description": "",
  "price": "89.0000",
  "cost_price": "0.0000",
  "retail_price": "0.0000",
  "sale_price": "0.0000",
  "calculated_price": "89.0000",
  "sort_order": 0,
  "is_visible": true,
  "is_featured": true,
  "related_products": "-1",
  "inventory_level": 0,
  "inventory_warning_level": 0,
  "warranty": null,
  "weight": "0.3000",
  "width": "0.0000",
  "height": "0.0000",
  "depth": "0.0000",
  "fixed_cost_shipping_price": "10.0000",
  "is_free_shipping": false,
  "inventory_tracking": "none",
  "rating_total": 0,
  "rating_count": 0,
  "total_sold": 0,
  "date_created": "Fri, 21 Sep 2012 02:31:01 +0000",
  "brand_id": 17,
  "view_count": 4,
  "page_title": "",
  "meta_keywords": null,
  "meta_description": null,
  "layout_file": "product.html",
  "is_price_hidden": false,
  "price_hidden_label": "",
  "categories": [
    14
  ],
  "date_modified": "Mon, 24 Sep 2012 01:34:57 +0000",
  "event_date_field_name": "Delivery Date",
  "event_date_type": "none",
  "event_date_start": "",
  "event_date_end": "",
  "myob_asset_account": "",
  "myob_income_account": "",
  "myob_expense_account": "",
  "peachtree_gl_account": "",
  "condition": "New",
  "is_condition_shown": false,
  "preorder_release_date": "",
  "is_preorder_only": false,
  "preorder_message": "",
  "order_quantity_minimum": 0,
  "order_quantity_maximum": 0,
  "open_graph_type": "product",
  "open_graph_title": "",
  "open_graph_description": null,
  "is_open_graph_thumbnail": true,
  "upc": null,
  "avalara_product_tax_code": "",
  "date_last_imported": "",
  "option_set_id": null,
  "tax_class_id": 0,
  "option_set_display": "right",
  "bin_picking_number": "",
  "custom_url": "/tomorrow-is-today-red-printed-scarf/",
  "primary_image": {
    "id": 247,
    "zoom_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/247/in_123__14581.1393831046.1280.1280.jpg?c=1",
    "thumbnail_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/247/in_123__14581.1393831046.220.290.jpg?c=1",
    "standard_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/247/in_123__14581.1393831046.386.513.jpg?c=1",
    "tiny_url": "https://cdn.url.path/bcapp/et7xe3pz/products/32/images/247/in_123__14581.1393831046.44.58.jpg?c=1"
  },
  "availability": "available",
  "brand": {
    "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/brands/17.json",
    "resource": "/brands/17"
  },
  "images": {
    "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/images.json",
    "resource": "/products/32/images"
  },
  "discount_rules": {
    "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/discountrules.json",
    "resource": "/products/32/discountrules"
  },
  "configurable_fields": {
    "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/configurablefields.json",
    "resource": "/products/32/configurablefields"
  },
  "custom_fields": {
    "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/customfields.json",
    "resource": "/products/32/customfields"
  },
  "videos": {
    "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/videos.json",
    "resource": "/products/32/videos"
  },
  "skus": {
    "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/skus.json",
    "resource": "/products/32/skus"
  },
  "rules": {
    "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/rules.json",
    "resource": "/products/32/rules"
  },
  "option_set": null,
  "options": {
    "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/products/32/options.json",
    "resource": "/products/32/options"
  },
  "tax_class": {
    "url": "https://store-et7xe3pz.mybigcommerce.com/api/v2/taxclasses/0.json",
    "resource": "/taxclasses/0"
  }
}
```

|||
|---|---|
| Basic Auth: | `GET /api/v2/products/{id}` |
| OAuth: | `GET /stores/{store_hash}/v2/products/{id}` |

## Get a Product Count

Gets a count of products.

```json
{
  "count": 44
}
```

|||
|---|---|
| Basic Auth: | `GET /api/v2/products/count` |
| OAuth: | `GET /stores/{store_hash}/v2/products/count` |

### Filters

Filter parameters can be added to the URL query string to select specific products in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `min_id` | int | `/api/v2/products?min_id={value}` |
| `max_id` | int | `/api/v2/products?max_id={value}` |
| `name` | string | `/api/v2/products?name={value}` |
| `keyword_filter` | string | `/api/v2/products?keyword_filter={value}` |
| `description` | string | `/api/v2/products?description={value}` |
| `sku` | string | `/api/v2/products?sku={value}` |
| `condition` | string | `/api/v2/products?condition={value}` |
| `availability` | string | `/api/v2/products?availability={value}` |
| `brand_id` | string | `/api/v2/products?brand_id={value}` |
| `min_date_created` | date | `/api/v2/products?min_date_created={value}` |
| `max_date_created` | date | `/api/v2/products?max_date_created={value}` |
| `min_date_modified` | date | `/api/v2/products?min_date_modified={value}` |
| `max_date_modified` | date | `/api/v2/products?max_date_modified={value}` |
| `min_date_last_imported` | date | `/api/v2/products?min_date_last_imported={value}` |
| `max_date_last_imported` | date | `/api/v2/products?max_date_last_imported={value}` |
| `min_price` | decimal | `/api/v2/products?min_price={value}` |
| `max_price` | decimal | `/api/v2/products?max_price={value}` |
| `min_number_sold` | int | `/api/v2/products?min_number_sold={value}` |
| `max_number_sold` | int | `/api/v2/products?max_number_sold={value}` |
| `is_visible` | string | `/api/v2/products?is_visible={value}` |
| `is_featured` | string | `/api/v2/products?is_featured={value}` |
| `min_inventory_level` | int | `/api/v2/products?min_inventory_level={value}` |
| `max_inventory_level` | int | `/api/v2/products?max_inventory_level={value}` |
| `include_sku` | boolean | `/api/v2/products?include_sku={value}` |
| `category` | string | `/api/v2/products?category={value}` |
| `product_tax_code` | string | `/api/v2/products?product_tax_code={value}` |

### Notes

If no filters are applied, the total number of products is returned.

## Create a Product

Creates a new product. The example request shows how to create a basic product by sending a [product object](/api/?javascript#product-properties) with the minimum required properties.

```json
{
    "name": "Plain T-Shirt",
    "type": "physical",
    "description": "This timeless fashion staple will never go out of style!",
    "price": "29.99",
    "categories": [18],
    "availability": "available",
    "weight": "0.5"
}
```
|||
|---|---|
| Basic Auth: | `POST /api/v2/products` |
| OAuth: | `POST /stores/{store_hash}/v2/products` |

### Read-only Properties

The following properties of the product are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `calculated_price`
*   `brand`
*   `images`
*   `discount_rules`
*   `configurable_fields`
*   `custom_fields`
*   `videos`
*   `skus`
*   `rules`
*   `option_set`
*   `options`
*   `tax_class`

### Requirements

The following properties of the product are required. The request won’t be fulfilled unless these properties are valid.

*   `name`
*   `price`
*   `categories`
*   `type`
*   `availability`
*   `weight`

### Notes

When the `is_visible` property is not provided, the product visibility is `false` by default.

To make newly created products immediately visible on the storefront, you must set `is_visible` to `true` when you create the product.

To maximize system performance, Bigcommerce caps the number of categories that a product can belong to at 1,000. If your `POST` includes an array of more than 1,000 `categories` ID values, Bigcommerce will return a 403 error.

```json
403 Access Denied/Forbidden
```

If automatic tax is enabled on the store, the value of `tax_class_id` will have no effect on the calculation of taxes.

## Update a Product

Updates an existing product.

|||
|---|---|
| Basic Auth: | `PUT /api/v2/products/{id}` |
| OAuth: | `PUT /stores/{store_hash}/v2/products/{id}` |

### Read-only Properties

The following properties of the product are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `rating_total`
*   `rating_count`
*   `number_sold`
*   `date_created`
*   `date_modified`
*   `date_last_imported`
*   `calculated_price`
*   `brand`
*   `images`
*   `discount_rules`
*   `configurable_fields`
*   `custom_fields`
*   `videos`
*   `skus`
*   `rules`
*   `option_set`
*   `options`
*   `tax_class`

### Requirements

The following properties of the product are required. The request won’t be fulfilled unless these properties are valid.

### Notes

To update a product, set one or more [product properties](/api/?javascript#product-properties) in the `PUT` request:

```json
{
    "custom_url": "/plain-tshirt/",
    "is_visible": true
}
```

For example, you can use a `PUT` to link a product to an option set:

```curl
{
    "option_set_id": 14
}
```

Invalid property values will produce a `400 Bad Request` error response:

```curl 
{
    "condition": "Worn"
}
```

```json 
400 Bad Request
```

Trying to set read-only properties will also produce a `400 Bad Request` error response:

```curl
{
    "number_sold": 99
}
```

```json 
400 Bad Request
```
To maximize system performance, Bigcommerce caps the maximum number of categories to which a product can belong, at 1,000. If your `PUT` includes an array of more than 1,000 `categories` ID values, Bigcommerce will return a 403 error.

```json
403 Access Denied/Forbidden
```

If automatic tax is enabled on the store, the value of `tax_class_id` will have no effect on the calculation of taxes.

## Delete a Product

Deletes a product.

|||
|---|---|
| Basic Auth: | `DELETE /api/v2/products/{id}` |
| OAuth: | `DELETE /stores/{store_hash}/v2/products/{id}` |

### Notes

Successful deletion of a product results in a `204 No Content` response.

```json
204 No Content
```

## Delete All Products

Deletes all products from the store.

|||
|---|---|
| Basic Auth: | `DELETE /api/v2/products` |
| OAuth: | `DELETE /stores/{store_hash}/v2/products` |

### Notes

Successful deletion of all products returns a `204 No Content` response.

```json 
204 No Content
```