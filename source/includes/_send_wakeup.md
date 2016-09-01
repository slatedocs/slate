## `/products/<imei>/send_wakeup`

### Description
It is possible to force the unit to connect, download new status information and upload its telemetry data to the system.
This is done by sending a `WAKEUP` sms. For more information about unit connectivity and why this might be desirable please see <a href="/#units-connecting-to-the-system">this section of the docs</a>

### Endpoint
> A `POST` request to this endpoint will send a wakeup-sms to the unit and force it to connect to the system. The response will include the sms_history record that us created as a result of the request.

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/000000000000/send_wakeup"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, headers=headers)

    print r.json()
    >>> {
        "data": {
            "sms_history_id": 37571,
            "product_imei": "013950005303699",
            "attempted_retries": 0,
            "enable_history_id": null,
            "sent_time": "2016-08-08T16:34:56.860081",
            "sms_timeout": 3600.0,
            "status": null,
            "trigger": "wakeup"
            "message": null,
            "message_reference": "/41a8b4b06a019949/12882393256110756",
            "created_at": "2016-08-08T16:34:56.886694",
            "modified_at": null,
            "created_by": "u.celery@bboxx.co.uk",
        },
        "message": "sms successfully sent",
        "status": "success"
    }
```

This endpoint is used to send a wakeup-sms to a unit and force it to connect to the system. The response will include the sms_history record that us created as a result of the request.

    | value
---:|:------
__endpoint__ | `/products/<imei>/send_wakeup`
__method__ | `POST`
__url_params__ | `product_imei` _(str)_
__payload__ | None
__response__ | 200
__permissions__ | `ADMIN`

<aside class="notice">Repeated calls to this endpoint will cause multiple wakeups to be sent.</aside>

### Delivery Notifications
A record of each sms is kept in the <a href="/#sms-history">sms_history_table</a>. This includes a `status` column which can be read as follows:

* `NULL` - sms sent but not received. The time of sending will be the `created_at` field.
* `Delivered` - sms delivered. The time of delivery will by the `modified_at` time.
* `Expired` - sms not delivered within the timeout, which for wakeups is 3600 seconds. The sms has expired and will not affect the unit.



