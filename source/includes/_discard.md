## `/rtc_dead_letters/<rtc_dead_letter_id>/discard`

> A `PUT` request to this endpoint marks an RTC dead letter message as discarded, indicating that it is not to be processed further.

```python
    url = "http://smartapi.bboxx.co.uk/v1/rtc_dead_letters/1/discard"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, headers=headers)

    print r.json()
    >>> {
        "status": "success", 
        "message": "Dead letter message discarded", 
        "data": None
    }
```

This endpoint marks an RTC dead letter message as discarded, indicating that it is not to be processed further. The id of the message to be replayed is specified in the url.

    | value 
---:|:------
__endpoint__ | `/rtc_dead_letters/<rtc_dead_letter_id>/discard`
__method__ | `PUT`
__url_params__ | `rtc_dead_letter_id` _(int)_
__payload__ | None
__response__ | 200

