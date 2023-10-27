# Invoice Scan and Match

## Create Digital Invoice

```ruby
RestClient.post(
  "https://app.procurementexpress.com/api/v1/digital_invoices",
  headers = {
    app_company_id: 1,
    authentication_token: "your token"
  },
  data: {
    file: 'fileblob'
  }
)
```

```shell
curl "https://app.procurementexpress.com/api/v1/digital_invoices"
  -X POST
  -H "Content-Type: application/json"
  -H "app_company_id: 1"
  -H "authentication_token: your token"
  -d "file:<fileblob>"
```

> The above command returns JSON structured like this:

```json
{
    "error": "File is required",
    "status": 400
}
```

```json
{
    "id": 181717,
        "invoice_number": "1234",
        "status": "outstanding",
        "issue_date": 1693198800,
        "validation_date": null,
        "uploaded_date": 1694151677,
        "due_date": null,
        "tax_amount": "0.0",
        "net_amount": "1230.0",
        "gross_amount": "1230.0",
        "balance_amount": "0.0",
        "created_at": 1694151678,
        "updated_at": 1694151680,
        "standalone_invoice": true,
        "can_accept": false,
        "can_approve": true,
        "can_reject": true,
        "can_cancel": true,
        "can_archive": true,
        "can_dearchive": false,
        "confidence_score": "0.77",
        "digital_invoice": true,
        "currency": {
            "id": 1,
            "iso_code": "EUR",
            "iso_numeric": "978",
            "name": "Euro",
            "symbol": "€",
            "created_at": "2014-12-05T09:32:59.165-06:00",
            "updated_at": "2023-09-06T06:32:46.644-05:00"
        },
        "supplier": {
            "id": 1104905,
            "name": "Amazon",
            "company_id": 6008,
        },
        "invoice_line_items": [
        {
            "id": 270279,
            "sequence_no": 1,
            "description": "iPad Air 5th gen Cover case",
            "unit_price": "30.0",
            "quantity": "1.0",
            "vat": "0.0",
            "net_amount": "30.0",
            "base_net_amount": "30.0",
            "deleted_at": null,
            "billable_status": null,
            "tax_rate_id": 15073,
            "chart_of_account_id": null,
            "invoice_id": 181717,
            "purchase_order_id": null,
            "purchase_order_item_id": null,
            "markup_info": null,
            "created_at": 1694151679,
            "updated_at": 1694151679
        },
        {
            "id": 270280,
            "sequence_no": 2,
            "description": "Paper like screen protector for iPad Pro 5th gen",
            "unit_price": "20.0",
            "quantity": "10.0",
            "vat": "0.0",
            "net_amount": "200.0",
            "base_net_amount": "200.0",
            "deleted_at": null,
            "billable_status": null,
            "tax_rate_id": 15073,
            "chart_of_account_id": null,
            "invoice_id": 181717,
            "purchase_order_id": null,
            "purchase_order_item_id": null,
            "markup_info": null,
            "created_at": 1694151679,
            "updated_at": 1694151679
        },
        {
            "id": 270281,
            "sequence_no": 3,
            "description": "Apple Pencil V2",
            "unit_price": "200.0",
            "quantity": "5.0",
            "vat": "0.0",
            "net_amount": "1000.0",
            "base_net_amount": "1000.0",
            "deleted_at": null,
            "billable_status": null,
            "tax_rate_id": 15073,
            "chart_of_account_id": null,
            "invoice_id": 181717,
            "purchase_order_id": null,
            "purchase_order_item_id": null,
            "markup_info": null,
            "created_at": 1694151679,
            "updated_at": 1694151679
        }
    ],
    "purchase_orders": [],
    "supplier_invoice_uploads": [
    {
        "id": 180354,
        "file_file_name": "change2.pdf",
        "file_content_type": "application/pdf",
        "file_file_size": 63330,
        "url": "https://po-app-staging.s3.amazonaws.com/supplier_invoice_uploads/files/000/180/354/original/my-invoice.pdf?1694151678"
    }
    ],
    "histories": [
    {
        "id": 122397,
        "comment": " has scanned an invoice via document upload",
        "invoice_id": 181717,
        "creator_id": 11752,
        "creator_name": "test android",
        "created_at": 1694151680,
        "updated_at": 1694151680,
        "comment_formatted_time": "00:41",
        "comment_formatted_date": "2023-09-08",
        "formatted_comment": "<p> has scanned an invoice via document upload</p>"
    }
    ],
}
```

Create an invoice using PDF file upload feature. It will extract all the content from
the file, create an invoice, calculate confidence score, and try to find and match supplier,
currency, and purchase orders. It will also automatically link the invoice line items with
the purchase order line items if any match found.

### Requires Invoice and Match feature flag

This API endpoint return `Invoice Scan and Match feature is disabled for this company` if
`enable_digital_invoice` feature flag or corrosponding feature flag for Invoice scan and match
feature is disabled for the company. So make sure to only allow this feature in mobile app
for the companies where Invoice scan and match feature flag is enabled. To check if required
feature flag is enabled or not check [Company Detail API](#get-a-specific-company) and check if
`scan_and_match_ff_enabled` attribute is `true`.

### How to know Invoice is Linked with Purchase Order?

Invoice are linked with Purchase order through Invoice line items. Every invoice line items
has a `purcahse_order_item_id` and `purchase_order_id` properties. If There is a match found
then corresponding invoice line items will have these 2 values set. If the values are `null`
in that case, User need to link invoice items with purchase order items using our app.

### How to create Draft Purchase Request rather than Invoice from a scan?

To create a purchase request pass a `upload_type = 'request'` data along with file and other required POST body params. If `upload_type` is other than `request` it will always create `Invoice`.

Also note that, the response you get is a valid JSON response of either `Invoice` json serializer, or `PurchaseOrder` json serializer or `Error` json depending on the `upload_type` value and the success/failure state of the request.


### Limitations

**Supported File Types**

- `application/pdf`

Only PDF files are supported today

**Maximum file size**

`10 MB`

**PDF Maximum Pages**

`10`

### HTTP Request

**URL**

`POST https://app.procurementexpress.com/api/v1/digital_invoices`

**Content-Type**

`multipart/form-data`


### Query Parameters

NOTE that `<file>` can be either a file object or a base64

| Params | Type | Description |
| ----- | ----- | ----- |
| authentication_token | header | Authentication token in header |
| app_company_id | header | Company id |
| file | File | either a file object or a base64 |
| upload_type | String | `request` to create draft PO, default is Invoice |
