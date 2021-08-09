## Invoices

Note: Creating, deleting and updating invoices is not supported.

<!-------------------- GET INVOICE -------------------->
### Get customer invoices by reseller ID

`GET /invoices/find/:reseller_id/customer_invoices`

Retrieve a list of invoices belonging to the customers of the reseller specified.

```shell
# Retrieve customer invoices list
curl "https://cloudmc_endpoint/rest/invoices/find/efd32752-c6f2-45cf-b494-cc6be8a45845/customer_invoices?includeAllSubOrgs=false&billingCycle=07-2021" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
	"data": [{
		"draftedDate": "2021-07-27T00:00:00Z",
		"createdDate": "2021-07-27T00:00:00Z",
		"status": "DRAFT",
		"organization": {
			"name": "org_name",
			"id": "289ec5fb-0970-44e3-bca8-777a691e23c7"
		},
		"id": "20e9b8d8-b1cb-4462-b6e8-fbb8416b2cbb",
		"detail": {
			"discounted": true,
			"discounts": [],
			"startDate": "2021-07-01T00:00:00Z",
			"endDate": "2021-08-01T00:00:00Z",
			"currency": "CAD",
			"subTotal": 272154.29,
			"categories": [{
				"discounted": true,
				"unit": {
					"unit": "HOUR",
					"name": {}
				},
				"discounts": [],
				"productId": "5bec5db2-b438-4610-ba73-f3ed50a7b26b",
				"price": "40.0",
				"name": {
					"en": "memory",
					"fr": "memory"
				},
				"subTotal": 65407.39,
				"sku": "product_sku"
			}]
		}
	}]
}
```

Optional Query Parameters | &nbsp;
---------- | -----------
`includeAllSubOrgs`<br/>*boolean* | Whether or not to include sub-organizations of sub-organizations or just direct sub-organizations of the reseller.
`billingCycle`<br/>*String* | The cycle which the invoice belongs to. Format is `MM-YYYY`

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the invoice.
`status`<br/>*enum* | The status of the invoice. Possible values are: USAGE_PENDING, DRAFT, ISSUED, OVERDUE, PAID, VOID.
`createdDate`<br/>*date* | The created date of the invoice.
`draftedDate`<br/>*date* | The date the invoice was drafted. Is null if status is still USAGE_PENDING.
`issuedDate`<br/>*date* | The date the invoice was issued.
`dueDate`<br/>*date* | The date the invoice is due.
`organization.id`<br/>*UUID* | The UUID of the organization the invoice belongs to.
`organization.name`<br/>*string* | The name of the organization the invoice belongs to.
`total`<br/>*BigDecimal* | The invoice total after discounts, taxes and credits.
`balance`<br/>*BigDecimal* | The invoice's remaining balance.
`detail`<br/>*Object* | The invoice detail contains a currency and a list of categories. Each category has a list of products.
`detail.discounted`<br/>*boolean* | Whether the invoice is discounted or not.
`detail.discounts`<br/>*Array[Object]* | Returns an array of discounts applied to the invoice.
`detail.currency`<br/>*string* | The short-name of the currency.
`detail.subTotal`<br/>*string* | A string containing the total before discounts.
`detail.startDate`<br/>*string* | An ISO-8601 instant format string representing the start of the invoice detail report.
`detail.endDate`<br/>*string* | An ISO-8601 instant format string representing the end of the invoice detail report.
`detail.categories`<br/>*Array[Object]* | An array of category objects. Contains all categories that had usage for the period. 
`detail.categories.name`<br/>*Object* | A map of short language codes to their translated category names. 
`detail.categories.subTotal`<br/>*string* | A string with the subtotal of usage for the category. It is the summed up product usage.
`detail.categories.products`<br/>*Object* | A map of short language codes to their translated category names. 
`detail.categories.products.sku`<br/>*string* | A unique string representing the sku for a product.
`detail.categories.products.name`<br/>*Object* | The name object in each language for the product name.
`detail.categories.products.cost`<br/>*string* | A string of the summed up total cost for the product.
`detail.categories.products.usage`<br/>*Object* | A string of the summed up total usage for the product.
`detail.categories.products.price`<br/>*Object* | A string representing the *average* unit price over the preriod.
`detail.categories.products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`detail.categories.products.unit`<br/>*Object* | The unit object of the product.
`detail.categories.products.unit.unit`<br/>*Object* | The unit value of the product.
`detail.categories.products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.


<!-------------------- LIST INVOICES -------------------->
### List invoices of organization

`GET /invoices?organization_id=:organization_id&billingCycle=MM-YYYY`

Retrieve the list of invoices associated with an organization.

```shell
# Retrieve list of invoices of an organization
curl "https://cloudmc_endpoint/rest/invoices?organization_id=289ec5fb-0970-44e3-bca8-777a691e23c7&billingCycle=07-2021" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
	"data": [{
		"draftedDate": "2021-07-27T00:00:00Z",
		"createdDate": "2021-07-27T00:00:00Z",
		"status": "DRAFT",
		"organization": {
			"name": "org_name",
			"id": "289ec5fb-0970-44e3-bca8-777a691e23c7"
		},
		"id": "20e9b8d8-b1cb-4462-b6e8-fbb8416b2cbb",
		"detail": {
			"discounted": true,
			"discounts": [],
			"startDate": "2021-07-01T00:00:00Z",
			"endDate": "2021-08-01T00:00:00Z",
			"currency": "CAD",
			"subTotal": 272154.29,
			"categories": [{
				"discounted": true,
				"unit": {
					"unit": "HOUR",
					"name": {}
				},
				"discounts": [],
				"productId": "5bec5db2-b438-4610-ba73-f3ed50a7b26b",
				"price": "40.0",
				"name": {
					"en": "memory",
					"fr": "memory"
				},
				"subTotal": 65407.39,
				"sku": "product_sku"
			}]
		}
	}]
}

```
Optional Query Parameters | &nbsp;
---------- | -----------
`organization_id`<br/>*UUID* | The UUID of the organization the invoice belongs to.
`billingCycle`<br/>*String* | The cycle which the invoice belongs to. Format is `MM-YYYY`

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the invoice.
`status`<br/>*enum* | The status of the invoice. Possible values are: USAGE_PENDING, DRAFT, ISSUED, OVERDUE, PAID, VOID.
`createdDate`<br/>*date* | The created date of the invoice.
`draftedDate`<br/>*date* | The date the invoice was drafted. Is null if status is still USAGE_PENDING.
`issuedDate`<br/>*date* | The date the invoice was issued.
`dueDate`<br/>*date* | The date the invoice is due.
`organization.id`<br/>*UUID* | The UUID of the organization the invoice belongs to.
`organization.name`<br/>*string* | The name of the organization the invoice belongs to.
`total`<br/>*BigDecimal* | The invoice total after discounts, taxes and credits.
`balance`<br/>*BigDecimal* | The invoice's remaining balance.
`detail`<br/>*Object* | The invoice detail contains a currency and a list of categories. Each category has a list of products.
`detail.discounted`<br/>*boolean* | Whether the invoice is discounted or not.
`detail.discounts`<br/>*Array[Object]* | Returns an array of discounts applied to the invoice.
`detail.currency`<br/>*string* | The short-name of the currency.
`detail.subTotal`<br/>*string* | A string containing the total before discounts.
`detail.startDate`<br/>*string* | An ISO-8601 instant format string representing the start of the invoice detail report.
`detail.endDate`<br/>*string* | An ISO-8601 instant format string representing the end of the invoice detail report.
`detail.categories`<br/>*Array[Object]* | An array of category objects. Contains all categories that had usage for the period. 
`detail.categories.name`<br/>*Object* | A map of short language codes to their translated category names. 
`detail.categories.subTotal`<br/>*string* | A string with the subtotal of usage for the category. It is the summed up product usage.
`detail.categories.products`<br/>*Object* | A map of short language codes to their translated category names. 
`detail.categories.products.sku`<br/>*string* | A unique string representing the sku for a product.
`detail.categories.products.name`<br/>*Object* | The name object in each language for the product name.
`detail.categories.products.cost`<br/>*string* | A string of the summed up total cost for the product.
`detail.categories.products.usage`<br/>*Object* | A string of the summed up total usage for the product.
`detail.categories.products.price`<br/>*Object* | A string representing the *average* unit price over the preriod.
`detail.categories.products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`detail.categories.products.unit`<br/>*Object* | The unit object of the product.
`detail.categories.products.unit.unit`<br/>*Object* | The unit value of the product.
`detail.categories.products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.

<!-------------------- APPROVE INVOICE -------------------->
### Approve invoice

`PUT /invoices/:invoice_id/approve`

Manually approve a draft invoice and issue the invoice to the customer by email.

```shell
# Approve a draft invoice
curl -X PUT "https://cloudmc_endpoint/rest/invoices/20e9b8d8-b1cb-4462-b6e8-fbb8416b2cbb/approve" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
	"data": {
		"draftedDate": "2021-07-27T00:00:00Z",
		"createdDate": "2021-07-27T00:00:00Z",
		"status": "ISSUED",
		"organization": {
			"name": "org_name",
			"id": "289ec5fb-0970-44e3-bca8-777a691e23c7"
		},
		"id": "20e9b8d8-b1cb-4462-b6e8-fbb8416b2cbb",
		"detail": {
			"discounted": true,
			"discounts": [],
			"startDate": "2021-07-01T00:00:00Z",
			"endDate": "2021-08-01T00:00:00Z",
			"currency": "CAD",
			"subTotal": 272154.29,
			"categories": [{
				"discounted": true,
				"unit": {
					"unit": "HOUR",
					"name": {}
				},
				"discounts": [],
				"productId": "5bec5db2-b438-4610-ba73-f3ed50a7b26b",
				"price": "40.0",
				"name": {
					"en": "memory",
					"fr": "memory"
				},
				"subTotal": 65407.39,
				"sku": "product_sku"
			}]
		},
		"total": 272154.29,
	}
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the invoice.
`status`<br/>*enum* | The status of the invoice. Possible values are: USAGE_PENDING, DRAFT, ISSUED, OVERDUE, PAID, VOID.
`createdDate`<br/>*date* | The created date of the invoice.
`draftedDate`<br/>*date* | The date the invoice was drafted. Is null if status is still USAGE_PENDING.
`issuedDate`<br/>*date* | The date the invoice was issued.
`dueDate`<br/>*date* | The date the invoice is due.
`organization.id`<br/>*UUID* | The UUID of the organization the invoice belongs to.
`organization.name`<br/>*string* | The name of the organization the invoice belongs to.
`total`<br/>*BigDecimal* | The invoice total after discounts, taxes and credits.
`balance`<br/>*BigDecimal* | The invoice's remaining balance.
`detail`<br/>*Object* | The invoice detail contains a currency and a list of categories. Each category has a list of products.
`detail.discounted`<br/>*boolean* | Whether the invoice is discounted or not.
`detail.discounts`<br/>*Array[Object]* | Returns an array of discounts applied to the invoice.
`detail.currency`<br/>*string* | The short-name of the currency.
`detail.subTotal`<br/>*string* | A string containing the total before discounts.
`detail.startDate`<br/>*string* | An ISO-8601 instant format string representing the start of the invoice detail report.
`detail.endDate`<br/>*string* | An ISO-8601 instant format string representing the end of the invoice detail report.
`detail.categories`<br/>*Array[Object]* | An array of category objects. Contains all categories that had usage for the period. 
`detail.categories.name`<br/>*Object* | A map of short language codes to their translated category names. 
`detail.categories.subTotal`<br/>*string* | A string with the subtotal of usage for the category. It is the summed up product usage.
`detail.categories.products`<br/>*Object* | A map of short language codes to their translated category names. 
`detail.categories.products.sku`<br/>*string* | A unique string representing the sku for a product.
`detail.categories.products.name`<br/>*Object* | The name object in each language for the product name.
`detail.categories.products.cost`<br/>*string* | A string of the summed up total cost for the product.
`detail.categories.products.usage`<br/>*Object* | A string of the summed up total usage for the product.
`detail.categories.products.price`<br/>*Object* | A string representing the *average* unit price over the preriod.
`detail.categories.products.period`<br/>*string* | The period for the product capture. Possible values: HOURS, MONTH.
`detail.categories.products.unit`<br/>*Object* | The unit object of the product.
`detail.categories.products.unit.unit`<br/>*Object* | The unit value of the product.
`detail.categories.products.unit.name`<br/>*Object* | The name of the unit of the product in the required language. Only present when defining custom units.
