## `/rtc_dead_letters/<rtc_dead_letter_id>/decode`

> A `GET` request to this endpoint returns the contents of a RTC dead letter message ready for display to a user.

```python
    url = "http://smartapi.bboxx.co.uk/v1/rtc_dead_letters/1/decode"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, headers=headers)

    print r.json()
    >>> {
        "status": "success", 
        "message": "Dead letter message decoded", 
        "data": "Decoded message: [4L, [[1518543688L, u'Charger sn=HQ17048RPII pid=a04c'], [1518543691L, u'Above RV']]]"
    }
```

This endpoint returns the contents of a RTC dead letter message ready for display to a user.

    | value 
---:|:------
__endpoint__ | `/rtc_dead_letters/<rtc_dead_letter_id>/decode`
__method__ | `PUT`
__url_params__ | `rtc_dead_letter_id` _(int)_
__payload__ | None
__response__ | 200

