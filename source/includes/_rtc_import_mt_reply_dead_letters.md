## `/rtc_import_mt_reply_dead_letters`

> A `POST` request to this endpoint instructs SMART Solar to copy any RTC dead letter messages from the RTC-MT.Reply.Dead-Letter queue to the database to enable examination and further processing.

```python
    url = "http://smartapi.bboxx.co.uk/v1/rtc_import_mt_reply_dead_letters"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, headers=headers)

    print r.json()
    >>> {
            "status": "success",
            "message": "MT Reply dead letters imported",
            "data": {}
    }
```

This endpoint instructs SMART Solar to copy any RTC dead letter messages from the RTC-MT.Reply.Dead-Letter queue to the database to enable examination and further processing.

    | value 
---:|:------
__endpoint__ | `/rtc_import_mt_reply_dead_letters`
__method__ | `POST`
__url_params__ | None
__payload__ | None
__response__ | 200

