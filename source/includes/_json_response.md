> This endpoint will return JSON structured like this:

```json
 "data": [
        {
            "id": "<customer-id>",
            "type": "customer",
            "attributes": {
                "id": "<customer-id>",
                "external_id": "<your-customer-id>",
                "customer_number": "10001",
                "additional_number": "20002",
                "name": "New Company",
                "phone": "123456",
                "dunning_stop": false,
                "dunning_stop_date": null,
                "notice": null,
                "shipping_mode": "email",
                "customer_group_id": "<customer-group-id>",
                "template_email_id": "<template-email-id>",
                "template_invoice_id": "<template-invoice-id>",
                "template_post_id": "<template-post-id>",
                "template_setting_id": "<template-setting-id>",
                "created_at": "2020-05-13T12:52:12+02:00",
                "updated_at": "2020-05-13T13:31:07+02:00"
            }
        }
    ]
}
```
