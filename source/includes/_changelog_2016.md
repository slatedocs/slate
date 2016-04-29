# 2016

## April 

### New API SKU Properties Available

We have updated the product SKU API to make several new properties available directly on the SKU resource. This update means that you no longer need to create a product rule in order to set these properties – you can now update them directly on the SKU:

| Property | Type | Description |
|---|---|---|
| price | decimal | This SKU's base price on the storefront. If this value is null, the product's default price (set in the Product resource's price field) will be used as the base price. |
| adjusted_price | decimal | The SKU's price on the storefront – after the product's base price is inherited, and/or any option set or any product rules are applied. This property is READ-ONLY. |
| weight | decimal | This SKU's base weight on the storefront. If this value is null, the product's default weight (set in the Product resource's weight field) will be used as the base weight. |
| adjusted_weight | decimal | This SKU's weight on the storefront – after the product's base weight is inherited, and/or any option set or any product rules are applied. This property is READ-ONLY.|
| is_purchasing_disabled | boolean | If true, this prohibits purchasing of the SKU.|
| purchasing_disabled_message | string  | The message to display if purchasing is disabled on this SKU. |
| image_file | string | The image that will be displayed when this SKU is selected on the storefront. When updating a SKU image, send the publicly accessible URL. Supported image formats are JPEG, PNG, and GIF. |

You can see the new SKU schema on our updated [Object page][1]. You'll find usage guidelines, and updated sample responses, on our updated [Resources page][2].

This update requires no immediate changes to your applications. Any existing SKU-only rules will still function as before, and will still be accessible via the API.

However, as we make SKU-only properties available directly on SKUs, BigCommerce plans to eventually deprecate the management of SKU-only properties via product rules.

[1]: /api/v2/
[2]: /api/v2/

## March

### SNI (Server Name Indication) required as of June 30, 2016

As of June 30, 2016, all requests to the BigCommerce API will be required to support [Server Name Indication][3] (SNI). After that date, requests will fail if they don't support SNI.

[3]: https://en.m.wikipedia.org/wiki/Server_Name_Indication

### Orders API provies opt-in email field

The Orders API provides a new `is_email_opt_in` field. This Boolean field will be `true` if the shopper has opted in (on the checkout page) to receive a store's email newsletter. It is read-only.

We have updated the following documentation to cover this new field:  

* [Orders][4] object
* [Create an Order][5] endpoint
* [Update an Order][6] endpoint

[4]: /api/v2/#orders
[5]: /api/v2/#create-an-order
[6]: /api/v2/#update-an-order

### Stencil Framework now generally available

Developers can now install the Stencil themes framework without registering for access. Please follow the documentation link that's relevant to your experience with Stencil:

* New to Stencil? We recommend starting with [this overview][7].
* Installing Stencil for the first time? Use these [complete instructions][8].
* Early Access participant? To receive future updates of the framework, we ask that you please [reinstall Stencil][9] from our new open repositories.

[7]: https://stencil.bigcommerce.com/docs
[8]: https://stencil.bigcommerce.com/docs/installing-and-launching-stencil-1
[9]: https://stencil.bigcommerce.com/docs/early-access-please-reinstall

## February 

### Gift Certificate API

BigCommerce has published a new API for managing gift certificates. The API allows your applications to manage gift certificates' amount/balance, purchaser, recipient, dates of purchase and expiration, and current status.

The new endpoint information is available [here][10].

[10]: /api/v2#gift_certificates

### Customer/Address resource have new custom fields

Two Customers endpoints, and two Customer Addresses endpoints, now provide support for read-only custom fields:

        Customers
        	List Customers
        	Get a Customer

        Customer Addresses
        	List Customer Addresses
        	Get a Customer Address

You can access custom fields within the new   **`form_fields`**   element. For details and examples, please see our updated [Customers][11] and [Customer Addresses][11] reference pages.

[11]: /api/v2#customers

### New Store Updated & Order Webhooks

BigCommerce has made available two new webhooks. We encourage you to use these webhooks, as appropriate, in your applications:

* `store/order/message/created` reports [order messages][12] created by customers (via a customer account) or by merchants (via the control panel).
* `store/information/updated` reports updates to a store's settings (domain, address, currency, tax inclusion, etc.).

We have updated the [webhooks reference page][13] to include these new webhooks.

[12]: /api/v2/#order-messages
[13]: /#placeholder

### Expanded faceted-search display

[Compatible][14] Blueprint themes can now display up to 500 values in faceted-search results. This expands the previous 30-value limit on facets like brands, categories, product options, and custom fields.

To enable this expansion, you must retrofit your theme by either replacing or manually updating three files. Procedures and code snippets are in [this new documentation section][15].

We have also updated merchant-oriented documentation that covers [enabling faceted search][16] and [option-value limits][17].

[14]: https://support.bigcommerce.com/articles/Public/Product-Filtering-Settings#themes
[15]: /themes/product-filtering-toolkit#ExpandDisplay
[16]: https://support.bigcommerce.com/articles/Public/Product-Filtering-Settings#enabling
[17]: https://support.bigcommerce.com/articles/Public/Platform-Limits/

### Banners API

BigCommerce has published a new API for managing storefront banners. The API allows your applications to manage banners' display location, timing, and content.

Information about this new endpoint is available [here][18].

[18]: https://developer.bigcommerce.com/api/v2#banners

## January

### New global product variables: SKU, Brand Name, Custom Fields

BigCommerce's Blueprint theme framework now provides three new global variables:

* `%%GLOBAL_ProductSku%%`
* `%%GLOBAL_ProductBrandName%%`
* `%%GLOBAL_ProductCustomFields%%`

These variables are available in all snippets where products are available. (In general, this is anywhere that `%%GLOBAL_ProductPrice%%` appears). They are listed on [this reference page][19].

[19]: /themes/global_variables

### New product and SKU webhooks added

BigCommerce has made available several new webhooks. In the list below, the new options are highlighted within the `store/product/`,   
`store/product/inventory/`, `store/sku/`, and `store/sku/inventory*` categories. We encourage you to use these webhooks, as appropriate,  
in your applications:

```
  store/order/
  	store/order/created
  	store/order/updated
  	store/order/archived
  	store/order/statusUpdated
  store/product/
  	store/product/created
  	store/product/updated
  	store/product/deleted
  	**store/product/inventory/updated
  	store/product/inventory/order/updated
  store/product/inventory/
  	store/product/inventory/updated
  	store/product/inventory/order/updated
  store/sku/
  	store/sku/created
  	store/sku/updated
  	store/sku/deleted
  	store/sku/inventory/updated
  	store/sku/inventory/order/updated
  store/sku/inventory/
  	store/sku/inventory/updated
  	store/sku/inventory/order/updated**
  store/customer/
  	store/customer/created
  	store/customer/updated
  	store/customer/deleted
  store/app/uninstalled
```

We have updated the [webhooks reference page][20] to include these new webhooks.

[20]: /api#webhooks

### Status fields added to order/statusUpdated webhook

On January 22nd, 2016, BigCommerce will add status fields to the   `store/order/statusUpdated`   webhook event. These new fields will allow your applications to monitor order status more efficiently, with fewer API calls.

You are not required to incorporate these new fields, although we encourage you to take advantage of them. However, please use this advance notification to make sure that these new fields' presence will not disrupt your code.

Currently, to find out an order's status, an application must GET the order each time it receives the   `statusUpdated`   event. But often, the application needs to act on orders only in a single status. Because one order will generate multiple statusUpdated webhooks as the order goes from incomplete to completed, the GET requests add up to unnecessary traffic.

As of January 21ish, 2016, the webhook message will include details about the order's new and previous status. Applications that monitor the added   `new_status_id`   and   `previous_status_id`   fields will no longer need to GET to the order, simply to determine whether the order needs to be processed.

The   `new_status_id`   and   `previous_status_id`   fields will be included in a newly added   `status`   element, formatted like this:

```
    "status": {
             "previous_status_id": "0",
             "new_status_id": "11"
    }
```

The   `previous_status_id`   field will allow your applications to troubleshoot orders by tracing the path these orders took through fulfillment. You could also build logic around this field, allowing your application to process only orders that pass from one certain status to another.

For example, you could prevent the double-processing of orders whose status accidentally changed, without having to store and check a list of already processed orders.

Here is an example of a webhook message in its currently supported format:

```
    {
      "scope": "store/order/statusUpdated",
      "store_id": "353242",
      "data": {
        "type": "order",
        "id": "817"
      },
      "hash": "24c6b87efc683de186387b12746455230e250fab",
      "created_at": 1449701096,
      "producer": "stores/z4zn3wo"
    }
```

Here is the same webhook message in the new format, with the added   `status`   fields set off with blank lines for visibility:

```
    {
      "scope": "store/order/statusUpdated",
      "store_id": "353242",
      "data": {
        "type": "order",
        "id": "817",

        "status": {
                 "previous_status_id": "0",
                 "new_status_id": "11"
        }

      },
      "hash": "24c6b87efc683de186387b12746455230e250fab",
      "created_at": 1449701096,
      "producer": "stores/z4zn3wo"
    }
```

(This second example shows an order moving from an "Incomplete" status [`id: 0`] to an "Awaiting Fulfillment" status [`id: 11`]. This change occurs whenever an order is paid for during storefront checkout.)

### Include or exclude specific fields for Products resource

Your `Get a Product` or `List Products` requests can now include or exclude specific fields, by appending one of these options:

* `?include=`
* `?include=@summary`
* `?exclude=`

Certain fields are retrieved with all requests. For details and examples, please see [this documentation][21].

[21]: /api/v2#get-a-product