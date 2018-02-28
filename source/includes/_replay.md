## `/rtc_dead_letters/<rtc_dead_letter_id>/replay`

> A `PUT` request to this endpoint replays an RTC dead letter message.

```python
    url = "https://smartapi.bboxx.co.uk/v1/rtc_dead_letters/1/replay"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, headers=headers)

    print r.json()
    >>> {
        "status": "success", 
        "message": "Dead letter message replayed", 
        "data": None
    }
```

This endpoint replays an RTC dead letter message. The id of the message to be replayed is specified in the url.

    | value 
---:|:------
__endpoint__ | `/rtc_dead_letters/<rtc_dead_letter_id>/replay`
__method__ | `PUT`
__url_params__ | `rtc_dead_letter_id` _(int)_
__payload__ | None
__response__ | 200

