# Post Install Event Data

The purpose of the event data API is for advertisers to help Vungle learn which of the users that we send them are valuable.

This endpoint allows advertisers to send user level event data to Vungle.

## HTTP Request
```shell
curl "http://ingest.vungle.com/eventData?data=myData"

curl -H "Content-Type: application/json" -d '{"data": "myData"}' "http://ingest.vungle.com/eventData"
```

>Note that the above examples would return a `400 BAD REQUEST` and the error below, as they lack our required parameters:

```json
{
  "missing_fields":
  [
    "vungle_app_id",
    "trk",
    "event_trk_id",
    "event_name",
    "device_idfa | device_mac | device_other_id"
  ]
}
```

We support both `GET` and `POST` methods to ingest event data at the following endpoint:

`http://ingest.vungle.com/eventData`

<aside class="success">
Vungle recommends using the POST method with a JSON body
</aside>

## Required Parameters
```shell
curl "http://ingest.vungle.com/eventData?device_idfa=236A005B-700F-4889-B9CE-999EAB2B605D&vungle_app_id=myVungleApp&trk=tune&event_trk_id=uniqueID1234&event_name=tutorial-complete"
```

>The above command will return a `200 OK` response, and is an example of the minimum request you can send to Vungle.

### Device Identifier

We require at least *ONE* device identifier per event.

Parameter   | Description
-----       | -----
device_idfa | Apple IDFA or Google Play Services Advertising ID
device_mac  | Mac Address in canonical format, either hyphen or colon separated
device_other_id | Some other unique identifier, e.g. Android ID, hashed identifiers, etc.

<aside class="success">
Vungle recommends using device_idfa wherever possible!
</aside>


### Other Required Parameters

>The omission of one or more of the required parameters will result in a `400 BAD REQUEST` response, along with a response body that identifies which required parameters you are missing. For example:

```shell
curl "http://ingest.vungle.com/eventData?trk=tune&event_trk_id=uniqueID1234"
```

>would result result in:

```json
{
  "missing_fields":
  [
    "vungle_app_id",
    "event_name",
    "device_idfa | device_mac | device_other_id"
  ]
}
```

Parameter     | Description
------------- | -----------
vungle_app_id | App ID as given on the Vungle dashboard
trk           | Source of the incoming event. In the case of a direct server to server integration, you should self-identifier, else you should identify the tracking provider, e.g. 'tune', 'kochava','adjust','appsflyer',etc.
event_trk_id  | This should be an identifier that is unique to the event. Used for deduplication.
event_name    | This should be a string that identifies the event that is consistent across users, e.g. 'tutorial-complete', 'level-3', etc.

## Optional Parameters

Parameter           | Default | Description
-------------       | ------- | -----------
device_ip           | None    | IP address of device
device_make         | None    | Device manufacturer
device_model        | None    | Device model
device_carrier      | None    | Device cell carrier
device_language     | None    | ISO 639-1 language code of device (2 digits)
device_country      | None    | ISO 3166 country code of source IP (2 digits)
device_user_agent   | None    | Device's browser user agent
device_os           | None    | Operating system version number
event_value         | None    | Some value associated with the event. Should be relative to other events that you send to Vungle.
event_datetime      | Timestamp of event reception | Datetime of time of event. If timezone not specified, UTC assumed
event_currency      | `'usd'` | If event_value is an explicit monetary value, define the currency here.
event_iap_event     | `false` | Set a flag here
device_limit_track  | `false` | Boolean for whether device has 'limit ad tracking' set


