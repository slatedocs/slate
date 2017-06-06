# Notifications (Web Hooks)

## Receiving Notifications from the API

It's often desirable to receive notifcations about changes in the system rather than repeatedly polling the API to check for changes. 

BBOXX supports this functionality in the form of Notifications or "Webhooks". Users can opt to receive an `HTTP POST` request containing any updated data at the point at which any change is detected in the system. 

Users can `subscribe` to different `channels` after which new data published into that `channel` will be sent, via `HTTP`, to the endpoint that the user specified in the subscription stage. The user can then handle the incoming data as they wish.  

BBOXX supports `HTTP` and `HTTPS` endpoints and includes a signature in each `POST` request that a user can use to confirm the authenticity of the request and its data.

## Channels

> To view a list of available channels, send a `GET` request to `/v1/channels`.

```python
    url = "http://smartapi.bboxx.co.uk/v1/channels"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print r
    >>> <Response [200]> 

    print r.text
    >>> {
        'total_pages': 1, 
        'objects': [{
            'name': 'product-status', 
            'created_at': '2016-11-25T10:51:30.077685', 
            'created_by': 'd.mclean@bboxx.co.uk'
            'modified_at': None, 
            'modified_by': None, 
        }], 
        'num_results': 1, 
        'page': 1
    }
```

Data is separated into `Channels` so that users can receive only the data that they are interested in. 

The current list of possible channels is:

 Name | data published into this channel
------:|:------------
product-status | _enabled status, product state_ <font color="DarkGray">_(ACTIVATED/MONITORED etc.)_, user (making the change)</font>
product-alert | updates to SMART Solar alert data

Users can view a list of available channels by sending a `GET` request to `/v1/channels`

Users can view the possible contents and format of the data sent in the channel <a href="#channel-data">below</a>:

## Subscribing to a Channel

> An example of how to subscribe to the `product-status` channel.

```python
    url = "http://smartapi.bboxx.co.uk/v1/channels/product-status/subscribe"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    data = json.dumps({
        "url": "http://example_domain/example_endpoint",
    })

    r = requests.post(url=url, data=data, headers=headers)

    print r
    >>> <Response [201]> 

    print r.text
    >>> {
        'status': 'success', 
        'message': "You have subscribed to the 'product-status' channel with the url: 'test_url'", 
        'data': {
            'url': 'http://example_domain/example_endpoint', 
            'channel_name': 'product-status', 
            'key': 'n9QgxA1GO0bzBVontkWkWg=='
        }
    }

    key = r.json()["data"]["key"]

    print "THIS IS MY SECRET KEY: {} ".format(key)
    print "I SHOULD STORE IT SAFELY SINCE I CANNOT RETRIEVE IT LATER"
```

> Note the secret key that is returned inside the payload of the response - this key is required in order to verify the signature that BBOXX sends with each request. You should store it in a secure place as it will not be resent after the first subscription request.

To receive messages from a channel, users must first setup a suitable endpoint that can receive and process the `POST` request and then `subscribe` that endpoint to the desired channel.

To subscribe, send a `POST` request to `/v1/channels/<channel_name>/subscribe` with a JSON formated dictionary containing the endpoint url sent in the payload of the request - see right for an example subscription request.

You may only subscribe one url to each `channel`.

## Unsubscribing from a Channel

> An example of how to un-subscribe from the `product-status` channel.

```python
    url = "http://smartapi.bboxx.co.uk/v1/channels/product-status/unsubscribe"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    data = json.dumps({
        "url": "http://example_domain/example_endpoint",
    })

    r = requests.post(url=url, data=data, headers=headers)

    print r
    >>> <Response [200]> 

    print r.text
    >>> {
        'status': 'success', 
        'message': "You have unsubscribed from the 'product-status' channel with the url: 'http://example_domain/example_endpoint'", 
        'data': None
    }
```

If a user no longer wishes to receive notifications from a particular channel they can unsubscribe from that channel by sending a `POST` request to `/v1/channels/<channel_name>/unsubscribe` with a JSON-formatted dictionary in the payload, containing the url that they wish to remove.. 

### POST
     | value
 ----:|:---
endpoint | `/v1/channels/<channel_name>/unsubscribe`
method | `POST`
url_params | `channel_name` <font color="DarkGray">_(str)_</font>
query params | <font color="DarkGray">N/A</font>
body | `url` <font color="DarkGray">_(str)_</font> - The endpoint that you wish to unsubscribe
permissions | <font color="Jade">__`ADMIN`__</font>
response_code | `200`

A successful request will result in a `200` response code. In addition the response will confirm the channel that the user unsubscribed from.

<aside class="notice">NOTE: The secret key is supplied at the time of subscription and cannot be generated again. Please store your secret key safely.</aside>

## Receiving Notifications

Having successfully subscribed to a channel, the subscribed endpoint will receive `HTTP POST` requests whenever data relevant to that channel is changed.

The format of the request will be as follows:

### Headers  
<code>
{   
&emsp;&emsp;'Content-Type': 'application/json',  
&emsp;&emsp;'X-BBOXX-Signature': \<signature\>,  
}  
</code>

### Payload  
<code>
{  
&emsp;&emsp;'channel': \<channel\>,  
&emsp;&emsp;'timestamp': \<timestamp\>,  
&emsp;&emsp;'data': \<data\>,  
}  
</code>

`Channel`:  confirms the name of the channel.   
`Timestamp`: gives the time that the message is _created_, it is theoretically possible for messages to arrive out of order so this can be used to reject messages that are received in the incorrect order.   
`Data`: A dictionary containing the updated information in the channel.  

## Channel Data

The possible contents of `data` in the notification for each channel is listed here:

### product-status

key | value type | options
---:|-----------|--------
`state` | _int_ | [1-9]
`enabled_status`| _str_ | "enabled", "pending_enabled", "pending_disabled", "disabled"
`user` | _str_ | \<username\> - user that made the change
`date` | _datetime-str_ | "2016-01-01 00:00:00" - date that the change was effected        
    
### product-alert

key | value type | options
---:|-----------|--------
`alert_id` | _int_ | unique identifier for this alert (any subsequent updates to this alert will have the same value here)
`product_imei`| _str_ | the IMEI of the product associated with the alert
<a href="/#alert-type">alert_type_id</a> | _int_ | identifies the type of the alert 
`start_time` | _datetime-str_ | "2016-01-01 00:00:00" - when the alert was raised        
`dismissed_at` | _datetime-str_ | "2016-01-01 00:00:00" - when the alert was dismissed (will be null if the alert is still active)        
`dismissed_by` | _str_ | \<username\> - user that made the change (will be null if the alert is still active)
`dismissal_reason` | _str_ | the reason for the alert dismissal (will be null if the alert is still active)
<a href="/#repair">repair_id</a> | _int_ | identifies the repair assicated with the alert (may be null) 
`extra_info` | _str_ | extra details about the alert (may be null)
`customer_called_date` | _datetime-str_ | when the customer was called to discuss the alert (may be null)         
    
## Authenticating BBOXX Notifications

> An example of how to authenticate a request using the secret-key (supplied when a user subscribes to a channel)

```python

import hmac
import json
from hashlib import sha1

# Payload is a json string
payload = request.data

# Url is known
url = "http://example_domain/example_endpoint"

# The string is the json-dumped payload with the url appended
raw = payload + url

# The key is returned to the user when they subscribe to the channel.
key = "VERY-SECRET-KEY"

# Get the hash using HMAC-SHA1
hashed = hmac.new(key, raw, sha1)

# Get the signature
signature = hashed.digest().encode("base64").rstrip('\n')

print signature
>>> ypX0AaZT1FOnbHI5hLxQVK+sE+w=

# Compare to the signature in the request headers
if signature != request.headers["X-BBOXX-Signature"]:
    print "THIS REQUEST IS NOT AUTHENTIC"
    return
```

The notifications system supports both `HTTP` and `HTTPS` endpoints. 
In addition users can use the secret key - supplied when a new subscription is successfully made - to verify that an incoming notification is genuine. 

BBOXX notifications are signed with a signature in the header: `X-BBOXX-Signature`.  
The signature is generated using HMAC-SHA1 in the following manner.

1. Take the payload (a JSON string)
2. Append to the payload the exact URL that the request is being sent to
3. Create a binary hash of this using HMAC-SHA1, the payload and the secret. 
4. Encode the binary hash using `Base64 Encoding`

Users can therefore verify that a request is genuine by taking the received request, performing the same proceedure and matching the result again the `X-BBOXX-Signature` in the headers of the request. 

Please note that the exact url supplied to the API is used to generate the hash and any deviations, such as spaces, trailing slashes etc... will return an incorrect signature. 