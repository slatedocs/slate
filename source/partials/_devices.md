# Devices

Users with activity trackers such as a Fitbit or Jawbone can set up their devices to
automatically record sleep diary entries for them.  A user may only have one authorized device
of a given type at a time.

## Authorize a Device

To authorize a device

`POST https://partner_abc.optisom.com/api/v2/users/{user_id}/devices/authorize`

### Parameters

Prameter     |Type      |Description
-------------|----------|------------
device_type  |string    |Type of device to authorize ('fitbit' or 'jawbone')
redirect_url |stirng    |URL to redirect to after authorization finishes

## Remove a Device

To remove a previously authorize a device

`POST https://partner_abc.optisom.com/api/v2/users/{user_id}/devices/destroy`

### Parameters

Prameter     |Type      |Description
-------------|----------|------------
user_id      |integer   |Id of the user owning the device to remove
device_type  |string    |Type of device to authorize ('fitbit' or 'jawbone')


## List Devices

Get a list of authorized devices

`GET https://partner_abc.optisom.com/api/v2/devices`

### Parameters

Prameter     |Type      |Description
-------------|----------|------------
user_id      |integer   |Id of the user owning the device(s)

The response will return a list of authorized devices