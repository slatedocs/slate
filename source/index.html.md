---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  # - ruby
  # - python
  # - javascript

# toc_footers:
#   - <a href='#'>Sign Up for a Developer Key</a>
#   - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

# includes:
#   - errors

search: true

code_clipboard: true
---

# Introduction

Welcome to the Tether API! You can use our API to access Tether API endpoints, which can get information about events, zones, recordings and other data from our database.

You can view code examples in the dark area to the right






# oAuth2 Integration
Before you'll start work with API you need to generate your oAuth2 token.


## Register your client app

<aside class="notice">
Make sure the user is an <b>integrator</b>, you can check by going to <b>Admin -> Users -> User</b>
</aside>

Give the user permission to create an oAuth2 application by going to: <b>Admin -> Users -> User -> Permissions</b> and ticking the <b>Allow Creating oAuth2 Applications</b> checkbox:

<img src="images/access_checkbox.png" />

Create a new oauth application by going to <b>Admin -> Users -> User -> API Details</b> and clicking the <b>Create oAuth Application</b> button. Enter a valid application name and redirect uri, after saving you will see your all registered applications:

<img src="images/create_app_btn.png" width="49%" />
<img src="images/create_modal.png" width="49%"/>

<img src="images/app_list.png" width="100%"/>

## Request authorisation
To request the authorisation token, you can use a compatible oauth2 library, for example: [oauth2](https://github.com/oauth-xx/oauth2) for ruby, or by visiting the URL manually and clicking "Authorise".

`https://my.timeline.is/oauth/authorize?client_id=YOUR_API_KEY&redirect_uri=https%3A%2F%2Fmy.site.com%2Fcallback%2Furl&response_type=code`

<aside class="notice">
<b>Note:</b> Replace YOUR_API_KEY with Tether oauth Api Key
</aside>

<aside class="notice">
<b>Note:</b> If you are not logged in, you will be redirected to the login page. After successfully logging in, you will be redirected to the authorisation page.
</aside>
<img src="images/authorise_page.png" width="100%"/>

## Redirect URI
After authorisation, the system will automatically redirect you to your REDIRECT_URI, which you configured above. For example:

`https://my.site.com/callback/url?code=380762fb28c7c17d096a06fce974535c8129ab8a13fab5608a4e1c1075bbf01a`

## Requesting the Access Token
To request the access token, you need to send a post request with the returned code above. To do this, you can use any HTTP client.

> In this example, we use `rest-client` for ruby:

```shell
parameters = 'client_id=YOUR_API_KEY&client_secret=YOUR_API_SECRET&code=RETURNED_CODE&grant_type=authorization_code&redirect_uri=https%3A%2F%2Fmy.site.com%2Fcallback%2Furl'

RestClient.post 'http://my.timeline.is/oauth/token', parameters
```

> The response look something like this:

```json
{
  "access_token": "de6780bc506a0446309bd9362820ba8aed28aa506c71eedbe1c5c4f9dd350e54",
  "token_type": "Bearer",
  "expires_in": 2629746,
  "refresh_token": "8257e65c97202ed1726cf9571600918f3bffb2544b26e00a61df9897668c33a1",
  "created_at": 1569313222
}
```

# Events
## Get events in period of time

```shell
curl "https://my.timeline.is/api/v3p/events?from=2018-07-09%2019:00:00&to=2018-07-09%2020:30:00&zone_id=5d1f0bed41092775efbddc36" \
     -H "Authorization: Bearer YOUR_OAUTH_TOKEN"
```

> The above command returns JSON structured like this:

```json
{
  "data":  [
    {
      "id": "5f06c1a541092788f683f3c8",
      "type": "events",
      "attributes":  {
        "items_count": 0,
        "duration": 2520,
        "motion": 0.0,
        "filesize": 0,
        "severity": "normal",
        "starts_at": "2020-06-12T16:03:09.019+01:00",
        "ends_at": "2020-06-12T16:45:09.019+01:00",
        "has_pir": false,
        "has_lpr": false,
        "has_motion": false,
        "has_video_loss": false,
        "has_video_blind": false,
        "has_video_defocus": false,
        "has_abnormal_audio": false,
        "has_loitering": false,
        "has_people_gathering": false,
        "has_fast_moving": false,
        "has_storage_failure": false,
        "has_storage_low_space": false,
        "has_temperature": false,
        "has_storage_not_exist": false,
        "has_alarm": false,
        "has_face": false,
        "has_tripwire": false,
        "has_intrusion": false,
        "has_parking": false,
        "has_car": false,
        "has_object_removal": false,
        "has_abandoned_object": false,
        "has_missing_object": false,
        "has_scene_change": false,
        "has_tma": false,
        "complete": true,
        "flagged": true,
        "has_auto_register": false,
        "has_ip_conflict": false,
        "has_network_change": false,
        "shared": false,
        "cloud": false,
        "starts_at_seconds_since_midnight": 57789,
        "ends_at_seconds_since_midnight": 60309,
        "updated_at": "2020-07-09T08:05:09.036+01:00",
        "created_at": "2020-07-09T08:05:09.036+01:00",
        "timeline_id": "5f06c1a441092788f683f3ba",
        "zone_id": "5f06c1a541092788f683f3c7",
        "location_id": "5f06c1a441092788f683f3c6",
        "best_id": "8fd1123a441092788f683f3c6"
      }
    }
  ], "jsonapi": {"version": "1.0"}
}
```

This endpoint retrieves events in period of time between `from` and `to` dates.

### HTTP Request
`GET https://my.timeline.is/api/v3p/events`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| zone_id | query | Zone ID to find event in | yes | String |
| from | query | Timestamp of period when event was started | No | Datetime |
| to | query | Timestamp of period when event was ended | No | Datetime |


## Get event in a point of time


```shell
curl "https://my.timeline.is/api/v3p/events?at=2018-07-09%2019:00:00&zone_id=5d1f0bed41092775efbddc36" -H "Authorization: Bearer YOUR_OAUTH_TOKEN"
```

> The above command returns JSON structured like this:

```json
{
  "data":  [
    {
      "id": "5f06c1a541092788f683f3c8",
      "type": "events",
      "attributes":  {
        "items_count": 0,
        "duration": 2520,
        "motion": 0.0,
        "filesize": 0,
        "severity": "normal",
        "starts_at": "2020-06-12T16:03:09.019+01:00",
        "ends_at": "2020-06-12T16:45:09.019+01:00",
        "has_pir": false,
        "has_lpr": false,
        "has_motion": false,
        "has_video_loss": false,
        "has_video_blind": false,
        "has_video_defocus": false,
        "has_abnormal_audio": false,
        "has_loitering": false,
        "has_people_gathering": false,
        "has_fast_moving": false,
        "has_storage_failure": false,
        "has_storage_low_space": false,
        "has_temperature": false,
        "has_storage_not_exist": false,
        "has_alarm": false,
        "has_face": false,
        "has_tripwire": false,
        "has_intrusion": false,
        "has_parking": false,
        "has_car": false,
        "has_object_removal": false,
        "has_abandoned_object": false,
        "has_missing_object": false,
        "has_scene_change": false,
        "has_tma": false,
        "complete": true,
        "flagged": true,
        "has_auto_register": false,
        "has_ip_conflict": false,
        "has_network_change": false,
        "shared": false,
        "cloud": false,
        "starts_at_seconds_since_midnight": 57789,
        "ends_at_seconds_since_midnight": 60309,
        "updated_at": "2020-07-09T08:05:09.036+01:00",
        "created_at": "2020-07-09T08:05:09.036+01:00",
        "timeline_id": "5f06c1a441092788f683f3ba",
        "zone_id": "5f06c1a541092788f683f3c7",
        "location_id": "5f06c1a441092788f683f3c6",
        "best_id": "8fd1123a441092788f683f3c6"
      }
    }
  ], "jsonapi": {"version": "1.0"}
}
```

This endpoint retrieves single event in a point of time.

### HTTP Request
`GET https://my.timeline.is/api/v3p/events`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| zone_id | query | Zone ID to find event in | yes | String |
| at | query | Timestamp of event to search | yes | Datetime |




## Filter events on Web site

You can generate correct url to our site with filters and `return_url`. We display banner at the top of site with link to your `redirect_url`.
It's very useful if you want to display events on our site and have possibility to return to yours

If you want to display events in time period use `events[from_time]` and `events[to_time]` parameters. In this case `timeline_id` is required parameter. If you don't pass correct `timeline_id`, our site will display events for selected timeline on the site.

If you want to get event at a certain point in time - use `at` parameter. In this case `zone` is required parameter.

<aside class="notice">
Note: if you'll not pass `return_url` in parameters we'll not display banner at the top of site
</aside>

### HTTP Request
`https://my.timeline.is/events`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| at | query | Timestamp of event to search | No |  |
| zone | query | Zone ID to find event in. Is required if you pass `at` parameter | Yes | String |
| events[from_time] | query | Parameter for filter. Uses to filter by time start. Ex: `20:30` | No | String |
| events[to_time] | query | Parameter for filter. Uses to filter by time start as end value. Ex: `21:00` | No | String |
| events[date] | query | Parameter for filter. Uses to filter by date. Ex: `2020-06-21` | No | String |
| timeline_id | query | ID of timeline. Is required if you what to filter events. Ex: `5cac594b8ef0f82370f18d98` | Yes | String |
| return_url | query | URL for ability to return from results page | No | String |



```shell
"https://my.timeline.is/events?events%5Bdate%5D=2020-07-21&events%5Bfrom_time%5D=20%3A30&events%5Bto_time%5D=21%3A00&return_url=http%3A%2F%2Fhost.some%2Freturn%2Furl&timeline_id=5f06cfe74109278f7ef8dab2&zone=5f06cfeb4109278f7ef8dac7"
```


# Locations
## Get all locations
This endpoint retrieves locations according to user.
### HTTP Request
`GET https://my.timeline.is/api/v3p/locations`

```shell
curl "https://my.timeline.is/api/v3p/locations" -H "Authorization: Bearer YOUR_OAUTH_TOKEN"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "5f072437410927adfe5be1e6",
      "type": "locations",
      "attributes": {
        "active": true,
        "address": "5 Dudley Gardens, RM3 8LJ",
        "city": null,
        "coordinates": [40.7143528, -74.0059731],
        "country": null,
        "latitude": -74.0059731,
        "longitude": 40.7143528,
        "name": "et1",
        "postcode": null,
        "region": null,
        "sname": "et1",
        "state": null,
        "timeline_id": "5f072437410927adfe5be1e5"
      }
    }
  ],
  "jsonapi": { "version": "1.0" }
}
```

## Arm location
This endpoint arms location with passed delay.
### HTTP Request
`POST https://my.timeline.is/api/v3p/locations/:id/arm`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| delay | query/body | Delay in seconds after system will trigger  location | no | Integer  |


```shell
curl "https://my.timelline.is/api/v3p/locations/:id/arm" \
     --data '{"delay":"5"}' \
     --request POST \
     -H "Authorization: Bearer YOUR_OAUTH_TOKEN" \
     -H "Content-Type: application/json"
```

> The above command returns 200 status without body

## Disarm location
This endpoint disarms location with passed delay.
### HTTP Request
`POST https://my.timeline.is/api/v3p/locations/:id/disarm`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| delay | query/body | Delay in seconds after system will trigger  location | no | Integer  |


```shell
curl "https://my.timelline.is/api/v3p/locations/:id/disarm" \
     --data '{"delay":"5"}' \
     --request POST \
     -H "Authorization: Bearer YOUR_OAUTH_TOKEN" \
     -H "Content-Type: application/json"
```

> The above command returns 200 status without body

# LPR
## Get license plates
This endpoint retrieves license plates between `start` and `end` dates.
### HTTP Request
`GET https://my.timeline.is/api/v3p/lpr`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| starts_at | query | Start timestamp of LPR search | No | Datetime  |
| ends_at | query | End timestamp of LPR search | No | Datetime |
| zone_id | query | Zone ID to find LPR in | yes | String |


```shell
curl "https://my.timeline.is/api/v3p/lpr?token=052om1JmDLxIOnwRLc6ppw&zone_id=5f06d0ca4109279015140bed&starts_at=2020-03-05+08%3A51%3A46.895+UTC&ends_at=2020-05-18+08%3A37%3A46.897+UTC" -H "Authorization: Bearer YOUR_OAUTH_TOKEN"
```

> The above command returns JSON structured like this:

```json
{
  "data":[
    {
      "id":"5f06d0ca4109279015140bf4",
      "type":"lprs",
      "attributes": {
        "flagged":false,
        "has_picture":false,
        "starts_at":"2020-03-05T08:51:46.895+00:00",
        "plate_number":"SV05OSL4",
        "country":"TUR",
        "starts_at_seconds_since_midnight":31906,
        "updated_at":"2020-07-09T09:09:46.896+01:00",
        "created_at":"2020-07-09T09:09:46.896+01:00",
        "timeline_id":"5f06d0ca4109279015140be7",
        "event_id":"5f06d0ca4109279015140bef",
        "camera_id":"5f06d0ca4109279015140bec",
        "agent_id":"5f06d0ca4109279015140be8",
        "zone_id":"5f06d0ca4109279015140bed",
        "location_id":"5f06d0ca4109279015140be9"
      }
    },
    {
      "id":"5f06d0ca4109279015140bf2",
      "type":"lprs",
      "attributes": {
        "flagged":false,
        "has_picture":false,
        "starts_at":"2020-04-28T01:04:46.889+01:00",
        "plate_number":"OW16DYA2",
        "country":"GBR",
        "starts_at_seconds_since_midnight":3886,
        "updated_at":"2020-07-09T09:09:46.890+01:00",
        "created_at":"2020-07-09T09:09:46.890+01:00",
        "timeline_id":"5f06d0ca4109279015140be7",
        "event_id":"5f06d0ca4109279015140bef",
        "camera_id":"5f06d0ca4109279015140bec",
        "agent_id":"5f06d0ca4109279015140be8",
        "zone_id":"5f06d0ca4109279015140bed",
        "location_id":"5f06d0ca4109279015140be9"
      }
    }
  ],
  "jsonapi": { "version": "1.0" }
}
```

# LPR Plates
## Get license plates whitelist and blacklist
This endpoint retrieves all lpr plates.
### HTTP Request
`GET https://my.timeline.is/api/v3p/lpr_plates`


```shell
curl "https://my.timeline.is/api/v3p/lpr_plates" -H "Authorization: Bearer YOUR_OAUTH_TOKEN"
```

> The above command returns JSON structured like this:

```json
{
  "data": [{
    "id": "60807953638d9d57daa71707",
    "type": "lprplates",
    "attributes": {
      "plate_number": "SV05OSL2",
      "group": "whitelist",
      "expiry_date": "2021-04-21T20:13:23.440+01:00",
      "updated_at": "2021-04-21T20:13:23.441+01:00",
      "created_at": "2021-04-21T20:13:23.441+01:00",
      "camera_id": "6080794a638d9d57daa71704"
    }
  }],
  "jsonapi": { "version": "1.0" }
}
```

## Create license plate
This endpoint creates whitelist blacklist license plate.
### HTTP Request
`POST https://my.timeline.is/api/v3p/lpr_plates`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| plate_number | query | License plate number| Yes | String |
| group | query | whitelist or blacklist | No | String |
| expiry_date | query | Expiry date | No | Datetime |
| camera_id | query | Camera Id | Yes | String |


```shell
curl "https://my.timeline.is/api/v3p/lpr_plates" -H "Authorization: Bearer YOUR_OAUTH_TOKEN"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "60807953638d9d57daa71707",
    "type": "lprplates",
    "attributes": {
      "plate_number": "SV05OSL2",
      "group": "whitelist",
      "expiry_date": "2021-04-21T20:13:23.440+01:00",
      "updated_at": null,
      "created_at": "2021-04-21T20:13:23.441+01:00",
      "camera_id": "6080794a638d9d57daa71704"
    }
  },
  "jsonapi": { "version": "1.0" }
}
```

## Delete license plate
This endpoint deletes whitelist blacklist license plate.
### HTTP Request
`DELETE https://my.timeline.is/api/v3p/lpr_plates/:id`

```shell
curl "https://my.timeline.is/api/v3p/lpr_plates/:id" -H "Authorization: Bearer YOUR_OAUTH_TOKEN"
```

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | No Content |



# Live

## Get MJPEG live stream from a camera

This endpoint returns MJPEG live stream from a camera.

### HTTP Request
`GET https://my.timeline.is/live/:zone_id/stream?token=timeline_api_token`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| token | query | Timeline API_token | No | String |


```shell
curl "https://my.timeline.is/live/:zone_id/stream?token=timeline_api_token"
```

```shell
curl "https://my.timeline.is/live/:zone_id/stream" -H "Authorization: Bearer YOUR_OAUTH_TOKEN"

```


# Perspectives

## Get all presets

This endpoint retrieves all presets related to user.

### HTTP Request
`GET https://my.timeline.is/api/v3p/perspectives`


```shell
curl "https://my.timeline.is/api/v3p/perspectives" -H "Authorization: Bearer YOUR_OAUTH_TOKEN"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "5f06d2c541092790de7656e0",
      "type": "perspectives",
      "attributes": {
        "layout": "layout_01",
        "zone_ids": [],
        "name": "quae",
        "timeline_id": "5f06d2c441092790de7656d4",
        "user_id": "5f06d2c541092790de7656df"
      }
    }
  ],
  "jsonapi": { "version": "1.0" }
}
```



## Live switch preset

When you open our Web site and go to liveview, you can change preset by this endpoint. You need to pass `:id` of needed preset to the url.

### HTTP Request
`POST https://my.timeline.is/api/v3p/perspectives/:id/live_switch_preset`

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | No Content |







## Display zones by location

If you want to select camera by location you can pass `location_id` in the url. In case if you have only 4 cameras for this location it will select smallest layout available (i.e. 4 camera layout) and show cameras for this location. In case if there are more than 36 cameras, you can pass additional `group` parameter, ie: `group=1`, `group=2` etc, to see the next "page" for this location.

<aside class="notice">
Note: if you want to see banner at the top of the site with link to your `redirect_url` you can pass `return_url` parameter to the path.
</aside>


### HTTP Request
`GET https://my.timeline.is/perspectives?location_id=5f06d4064109279130d5d6f3&group=2&return_url=http://your.some.site`






# Zones

## Get all zones

This endpoint retrieves all zones related to user.

### HTTP Request
`GET https://my.timeline.is/api/v3p/zones`


**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| location_id | query | Filters By Location Id | No | String |


```shell
curl "https://my.timeline.is/api/v3p/zones" -H "Authorization: Bearer YOUR_OAUTH_TOKEN"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "5f06d4064109279130d5d6f3",
      "type": "zones",
      "attributes": {
        "name": "Camera 2",
        "active": true,
        "device_id": "54c91a6d7365725aeb2e0f08"
      }
    }
  ],
  "jsonapi": { "version": "1.0" }
}
```


## Arm zones
This endpoint arms cameras for passed zones with passed delay.
### HTTP Request
`POST https://my.timeline.is/api/v3p/zones/arm`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| zone_ids | query/body | Zone ids splitted by comma | Yes | String |
| delay | query/body | Delay in seconds after system will trigger zone | no | Integer  |


```shell
curl "https://my.timelline.is/api/v3p/zones/arm" \
     --data '{"zone_ids":"5d1f0bf741092775efbddd71,5d1f0bf441092775efbddd23","delay":"5"}' \
     --request POST \
     -H "Authorization: Bearer YOUR_OAUTH_TOKEN" \
     -H "Content-Type: application/json"
```

> The above command returns 200 status without body



## Disarm zones
This endpoint disarms cameras for passed zones with passed delay.
### HTTP Request
`POST https://my.timeline.is/api/v3p/zones/disarm`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| zone_ids | query/body | Zone ids splitted by comma | Yes | String |
| delay | query/body | Delay in seconds after system will trigger zone | no | Integer  |


```shell
curl "https://my.timelline.is/api/v3p/zones/disarm" \
     --data '{"zone_ids":"5d1f0bf741092775efbddd71,5d1f0bf441092775efbddd23","delay":"5"}' \
     --request POST \
     -H "Authorization: Bearer YOUR_OAUTH_TOKEN" \
     -H "Content-Type: application/json"
```

> The above command returns 200 status without body





## Trigger vmd event
This endpoint adds possibility to trigger vmd event. It creates event with proper icon. You should pass event description to the request. Here is available vmd descriptions:<br/>
'PIR alarm', 'FaceDetection', 'facedetection alarm', 'Motion alarm', 'VideoMotion', 'VideoMotionInfo', 'linedetection alarm', 'CrossLineDetection', 'VideoLoss', 'VideoBlind', 'AlarmLocal', 'CrossRegionDetection', 'LeftDetection', 'TakenAwayDetection', 'VideoAbnormalDetection', 'AudioMutation', 'AudioAnomaly', 'VideoUnFocus', 'WanderDetection', 'RioterDetection', 'ParkingDetection', 'vehicledetection alarm', 'MoveDetection', 'StorageNotExist', 'StorageFailure', 'StorageLowSpace', 'AlarmOutput', 'MDResult', 'HeatImagingTemper', 'SerialData', 'SceneChange', 'scenechangedetection alarm', 'Temperature Measurement Alarm', 'fielddetection alarm', 'TrafficVehiclePosition', 'TrafficJunction', 'shelteralarm alarm', 'NetworkChange', 'NetAbort', 'ipConflict alarm', 'AutoRegister'

### HTTP Request
`POST https://my.timeline.is/api/v3p/zones/:id/trigger_event`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| event_description | query/body | Event vmd description from documentation | yes | String  |


```shell
curl "https://my.timelline.is/api/v3p/zones/5d1f0bf741092775efbddd71/trigger_event" \
     --data '{"event_description":"CrossLineDetection"}' \
     --request POST \
     -H "Authorization: Bearer YOUR_OAUTH_TOKEN" \
     -H "Content-Type: application/json"
```

> The above command returns JSON structured like this:

```json
  {
    "success": "ok",
    "error": null
  }
```

In case if request is failed it returns "success": "error"<br/>
The error could be:<br/>
`Failed to connect to tetherbox!` - in case when expired connection timeout to TB<br/>
`Wrong event description!` - in case if bad description parameter in request



## PTZ
This endpoint allows you to pass PTZ commands to zone.
### HTTP Request
`POST https://my.timeline.is/api/v3p/:zone_id/ptz`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| direction | query/body | Actions(move_auto, move_right, move_left, move_up, move_down, move_left_down, move_right_down, move_left_up, move_right_up, zoom_in, zoom_out, fetch_presets, wiper, light, goto_preset) | Yes | String |
| params | query/body | Additional parameters e.g (seeed: 5) | Yes | Hash |


```shell
curl "https://my.timelline.is/api/v3p/zones/5d1f0bf741092775efbddd71/ptz" \
     --data '{"direction":"move_right","params":{ "speed": "5"} }' \
     --request POST \
     -H "Authorization: Bearer YOUR_OAUTH_TOKEN" \
     -H "Content-Type: application/json"
```

> The above command returns 200 status without body

## Relay Outputs
This endpoint returns a list of relay outputs for zone.
### HTTP Request
`GET https://my.timeline.is/api/v3p/:zone_id/relay_outputs`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |


```shell
curl "https://my.timelline.is/api/v3p/zones/5d1f0bf741092775efbddd71/relay_outputs" \
     --request GET \
     -H "Authorization: Bearer YOUR_OAUTH_TOKEN" \
     -H "Content-Type: application/json"
```

> The above command returns

```json
{
  "relay_outputs": [{
      "properties": {
        "mode": "Bistable",
        "delay_time": "PT3S",
        "idle_state": "closed"
      },
      "@token": "2"
    },
    {
      "properties": {
        "mode": "Monostable",
        "delay_time": "PT5S",
        "idle_state": "open"
      },
      "@token": "3"
    }
  ]
}
```


## Relay
This endpoint allows you to change the zone relay status by its token.
### HTTP Request
`POST https://my.timeline.is/api/v3p/:zone_id/relay`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| relay | query/body | Relay token/number | Yes | Integer |
| state | query/body | Sate ON/OFF (default true) | No | Boolean |


```shell
curl "https://my.timelline.is/api/v3p/zones/5d1f0bf741092775efbddd71/relay" \
     --data '{"relay": 3,"state": true}' \
     --request POST \
     -H "Authorization: Bearer YOUR_OAUTH_TOKEN" \
     -H "Content-Type: application/json"
```

> The above command returns 200 status without body

## Audio challenge
This endpoint allows you play audio announcement on Tetherbox.
### HTTP Request
`POST https://my.timeline.is/api/v3p/:zone_id/audio_challenge`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| audio_base64 | query/body | Audio file in Base64 Ogg.Opus format | Yes | String |

```shell
curl "https://my.timelline.is/api/v3p/zones/5d1f0bf741092775efbddd71/audio_challenge" \
     --data '{"audio_base64":"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"}' \
     --request POST \
     -H "Authorization: Bearer YOUR_OAUTH_TOKEN" \
     -H "Content-Type: application/json"
```

> The above command returns 200 status without body



# Devices

## Get list of devices

This endpoint retrieves all devices related to user.

### HTTP Request
`GET https://my.timeline.is/api/v3p/devices`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |


```shell
curl "https://my.timeline.is/api/v3p/devices" -H "Authorization: Bearer YOUR_OAUTH_TOKEN"
```
> The above command returns JSON structured like this:

```json
{
  "id": "5e8b135ca34dbe4eee61c56b",
  "type": "devices",
  "attributes": {
    "active": false,
    "activated": false,
    "last_seen": "2021-07-13T21:33:02.662+01:00",
    "device_name": null,
    "percentage_packet_loss": 0,
    "ip": "10.11.160.252",
    "mac": "54:C4:15:88:4B:90",
    "vendor": "Hangzhou Hikvision Digital",
    "agent_id": "5d404864a34dbe15c8a4f3ca",
    "timeline_id": "5c50604ca34dbe182afa1249",
    "location_id": "5c5d7ae8a34dbe565274f2fc",
    "tunnels": [{
      "port": 37310,
      "to": 554,
      "active_till": "2021-07-14T09:35:12.461Z"
    }]
  }
}
```

## Open tunnel

This endpoint allows you to open a tunnel to the device if it's online. The tunnel is active for 1 hour since opening time.

### HTTP Request
`POST https://my.timeline.is/api/v3p/devices/:device_id/open_tunnel`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| port | query/body | TCP Port number (default 80) | No | Integer |


```shell
curl "https://my.timelline.is/api/v3p/devices/5d1f0bf741092775efbddd71/open_tunnel" \
     --data '{ "port": 554 }' \
     --request POST \
     -H "Authorization: Bearer YOUR_OAUTH_TOKEN" \
     -H "Content-Type: application/json"
```
> The above command returns JSON structured like this:

```json
{
  "tunnels": [{
    "port": 37310,
    "to": 554,
    "active_till": "2021-07-14T09:35:12.461Z"
  }]
}
```
> Once you get a response you can use port in VLC player.
  The rtsp URL will look like:
  rtsp://admin:password@timeline.is:37310/Streaming/Channels/102

## Close tunnel

This endpoint allows you to close tunnel to the device.

### HTTP Request
`POST https://my.timeline.is/api/v3p/devices/:device_id/close_tunnel`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| port | query/body | TCP Port number | Yes | Integer |


```shell
curl "https://my.timelline.is/api/v3p/devices/5d1f0bf741092775efbddd71/close_tunnel" \
     --data '{ "port": 8080 }' \
     --request POST \
     -H "Authorization: Bearer YOUR_OAUTH_TOKEN" \
     -H "Content-Type: application/json"
```
> The above command returns JSON structured like this:

```json
{
  "data": {}
}
```


# Agents

## Get Connection History

This endpoint retrieves connection history (limit 50 records) of agent.

### HTTP Request
`GET https://my.timeline.is/api/v3p/agents/:agent_id/connection_history`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |

```shell
curl "https://my.timeline.is/api/v3p/agents/\"$AGENT_ID\"/connection_history" -H "Authorization: Bearer \"$YOUR_OAUTH_TOKEN\""
```

> The above command returns JSON structured like this:

```json
{
  "connection_history": [
    {
      "date": "2021-06-23 14:35:38 +0100",
      "type": "Connected",
      "untrusted_ip": "139.162.218.118",
      "bytes_received": "N/A",
      "bytes_sent": "N/A",
      "time_duration": "N/A"
    },
    {
      "date": "2021-06-23 14:35:36 +0100",
      "type": "Disconnected",
      "untrusted_ip": "139.162.218.118",
      "bytes_received": "94.9 MB",
      "bytes_sent": "82.2 MB",
      "time_duration": "about 1 month"
    },
    {
      "date": "2021-05-12 17:16:43 +0100",
      "type": "Connected",
      "untrusted_ip": "139.162.218.118",
      "bytes_received": "N/A",
      "bytes_sent": "N/A",
      "time_duration": "N/A"
    }
  ]
}
```

## Get Connection Speed

This endpoint retrieves connection speed of agent.

### HTTP Request
`GET https://my.timeline.is/api/v3p/agents/:agent_id/connection_speed`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |

```shell
curl "https://my.timeline.is/api/v3p/agents/\"$AGENT_ID\"/connection_speed" -H "Authorization: Bearer \"$YOUR_OAUTH_TOKEN\""
```

> The above command returns JSON structured like this:

```json
{
  "connection_speed": {
    "download": "425.37 Mbit/s",
    "upload": "441.53 Mbit/s",
    "last_run": "2021-06-06T03:39:32.563+01:00"
  }
}
```

## GET External IP

This endpoint retrieves external IP of agent.

### HTTP Request
`GET https://my.timeline.is/api/v3p/agents/:agent_id/external_ip`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |

```shell
curl "https://my.timeline.is/api/v3p/agents/\"$AGENT_ID\"/external_ip" -H "Authorization: Bearer \"$YOUR_OAUTH_TOKEN\""
```

> The above command returns JSON structured like this:

```json
{ "external_ip": "88.109.208.22" }
```

## Get Network Interface Details

This endpoint retrieves network interface details of agent.

### HTTP Request
`GET https://my.timeline.is/api/v3p/agents/:agent_id/network_interface_details`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |

```shell
curl "https://my.timeline.is/api/v3p/agents/\"$AGENT_ID\"/network_interface_details" -H "Authorization: Bearer \"$YOUR_OAUTH_TOKEN\""
```

> The above command returns JSON structured like this:

```json
{
  "network_interface_details": {
    "eth0": {
      "mtu": "1500",
      "speed": "100",
      "address": "b8:ae:ed:7b:27:0f",
      "rx_bytes": "5743225639",
      "tx_bytes": "41546301",
      "ips": ["192.168.1.11/24", "192.168.88.100/24"]
    },
    "wlp2s0": {
      "wireless": true,
      "mtu": "1500",
      "address": "94:65:9c:d2:2e:e0",
      "rx_bytes": 0,
      "tx_bytes": 0,
      "ips": []
    },
    "tun0": {
      "mtu": "1500",
      "speed": "10",
      "address": "be:2a:2b:f0:fa:27",
      "rx_bytes": "41977529",
      "tx_bytes": "18039799",
      "ips": ["10.7.0.97/16"]
    }
  }
}
```

## Get Uptime

This endpoint retrieves uptime of agent.

### HTTP Request
`GET https://my.timeline.is/api/v3p/agents/:agent_id/uptime`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |

```shell
curl "https://my.timeline.is/api/v3p/agents/\"$AGENT_ID\"/uptime" -H "Authorization: Bearer \"$YOUR_OAUTH_TOKEN\""
```

> The above command returns JSON structured like this:

```json
{ "uptime": "2 hours" }
```

## Get Status

This endpoint retrieves online/offline status of agent.

### HTTP Request
`GET https://my.timeline.is/api/v3p/agents/:agent_id/status`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |

```shell
curl "https://my.timeline.is/api/v3p/agents/\"$AGENT_ID\"/status" -H "Authorization: Bearer \"$YOUR_OAUTH_TOKEN\""
```

> The above command returns JSON structured like this:

```json
{ "status": "online" }
```

## recent_reboots

This endpoint retrieves recent reboots of agent.

### HTTP Request
`GET https://my.timeline.is/api/v3p/agents/:agent_id/recent_reboots`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |

```shell
curl "https://my.timeline.is/api/v3p/agents/\"$AGENT_ID\"/recent_reboots" -H "Authorization: Bearer \"$YOUR_OAUTH_TOKEN\""
```

> The above command returns JSON structured like this:

```json
{
  "recent_reboots": [
    "reboot   system boot  4.15.0-137-gener 2021-04-01T15:12:49+0100   still running",
     "reboot   system boot  4.15.0-137-gener 2021-03-29T19:42:43+0100 - 2021-04-01T15:12:38+0100 (2+19:29)",
     "reboot   system boot  4.15.0-137-gener 2021-03-29T16:39:23+0100 - 2021-03-29T19:42:31+0100  (03:03)",
     "reboot   system boot  4.15.0-137-gener 2021-03-29T13:37:33+0100 - 2021-03-29T16:39:12+0100  (03:01)",
     "reboot   system boot  4.15.0-136-gener 2021-03-11T15:25:48+0000 - 2021-03-29T13:37:21+0100 (17+21:11)",
     "reboot   system boot  4.15.0-135-gener 2021-03-02T16:15:20+0000 - 2021-03-11T15:25:37+0000 (8+23:10)",
     "reboot   system boot  4.15.0-135-gener 2021-03-02T13:12:07+0000 - 2021-03-02T16:15:09+0000  (03:03)",
     "reboot   system boot  4.15.0-135-gener 2021-03-02T10:08:56+0000 - 2021-03-02T13:11:56+0000  (03:03)",
     "reboot   system boot  4.15.0-135-gener 2021-03-02T07:05:39+0000 - 2021-03-02T10:08:45+0000  (03:03)",
     "reboot   system boot  4.15.0-135-gener 2021-03-02T04:02:28+0000 - 2021-03-02T07:05:28+0000  (03:03)",
     "reboot   system boot  4.15.0-135-gener 2021-03-02T00:59:13+0000 - 2021-03-02T04:02:17+0000  (03:03)"
   ]
}
```

## devices

This endpoint retrieves devices of agent.

### HTTP Request
`GET https://my.timeline.is/api/v3p/agents/:agent_id/devices`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |

```shell
curl "https://my.timeline.is/api/v3p/agents/\"$AGENT_ID\"/devices" -H "Authorization: Bearer \"$YOUR_OAUTH_TOKEN\""
```

> The above command returns JSON structured like this:

```json
{
  "devices": [
    { "device_id": "60c0e29308ad4195d775d9a8", "name": "Device 1" },
    { "device_id": "6058fe9b08ad41341aa59ab1", "name": "Device 2" }
  ]
}
```

## cameras

This endpoint retrieves cameras of agent.

### HTTP Request
`GET https://my.timeline.is/api/v3p/agents/:agent_id/cameras`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |

```shell
curl "https://my.timeline.is/api/v3p/agents/\"$AGENT_ID\"/cameras" -H "Authorization: Bearer \"$YOUR_OAUTH_TOKEN\""
```

> The above command returns JSON structured like this:

```json
{
  "cameras": [
    { "camera_id": "60c0e29308ad4195d775d9a9", "name": "Camera 1" },
    { "camera_id": "6058fea008ad41341aa59b20", "name": "Camera 2" },
  ]
}
```

# Recordings

## Get list of recordings

This endpoint retrieves all recordings related to user.

### HTTP Request
`GET https://my.timeline.is/api/v3p/recordings`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| at | query | Timestamp of recording to search | Yes | Datetime |
| zone_id | query | Zone ID to find recording in | Yes | String |


```shell
curl "https://my.timeline.is/api/v3p/recordings?zone_id=5f06e4e741092794a7010c29&at=2020-04-25T08:03:36.094+01:00" -H "Authorization: Bearer YOUR_OAUTH_TOKEN"
```
> The above command returns JSON structured like this:

```json
{
  "data": [{
    "id": "5f06e4e741092794a7010c2c",
    "type": "recordings",
    "attributes": {
      "agent_image": true,
      "agent_video": true,
      "checksum": null,
      "cloud_path": null,
      "cloud_snapshot": false,
      "cloud_thumbnail": false,
      "cloud_timelapse": false,
      "cloud_timelapse_error": null,
      "cloud_timelapse_interval": null,
      "cloud_video": false,
      "cloud_waveform": false,
      "created_at": "2020-07-09T10:35:36.096+01:00",
      "ends_at": "2020-04-25T08:03:36.094+01:00",
      "ends_at_seconds_since_midnight": 29016,
      "filesize": 0,
      "flagged": true,
      "motion": 0.0,
      "object_count": 0,
      "path": "/recordings/exercitationem1",
      "skip_notify": false,
      "starts_at": "2020-04-25T08:02:36.094+01:00",
      "starts_at_seconds_since_midnight": 28956,
      "updated_at": "2020-07-09T10:35:36.096+01:00",
      "seek_to_event": 0,
      "epoch_time": "25042020-0802AM-0803AM",
      "agent_id": "5f06e4e741092794a7010c2d",
      "camera_id": "5f06e4e741092794a7010c31",
      "device_id": null,
      "event_id": "5f06e4e741092794a7010c2a",
      "flagged_by_id": null,
      "location_id": "5f06e4e741092794a7010c28",
      "timeline_id": "5f06e4e741092794a7010c27",
      "unflagged_by_id": null,
      "zone_id": "5f06e4e741092794a7010c29",
      "urls": {
        "proxy": "/recordings/5f06e4e741092794a7010c2c/view?token=4i6yNAEWG7BWHs7FaTnPVA",
        "proxy_download": "/recordings/5f06e4e741092794a7010c2c/download",
        "proxy_snapshot": "/recordings/5f06e4e741092794a7010c2c/snapshot",
        "local": "lan-molestiae1.timeline.is/api/v3/recordings/download.mp4?recording%5Bpath%5D=%2Frecordings%2Fexercitationem1&token=vrB7WxtHEHNY1kb7XocX_A",
        "local_snapshot": "lan-molestiae1.timeline.is/api/v3/recordings/snapshot?recording%5Bpath%5D=%2Frecordings%2Fexercitationem1.jpg&token=vrB7WxtHEHNY1kb7XocX_A",
        "external": "external-molestiae1.timeline.is/api/v3/recordings/download.mp4?recording%5Bpath%5D=%2Frecordings%2Fexercitationem1&token=vrB7WxtHEHNY1kb7XocX_A",
        "external_snapshot": "external-molestiae1.timeline.is/api/v3/recordings/snapshot?recording%5Bpath%5D=%2Frecordings%2Fexercitationem1.jpg&token=vrB7WxtHEHNY1kb7XocX_A"
      },
      "prev_recording_id": null,
      "next_recording_id": null
    },
    "relationships": {
      "timelapses": {
        "meta": {
          "included": false
        }
      }
    }
  }]
}
```



## Get recording

This endpoint retrives single recording object by passed `id`

### HTTP Request
`GET https://my.timeline.is/api/v3p/recordings/:id`


```shell
curl "https://my.timeline.is/api/v3p/recordings/5f06e5f241092794fc255ded" -H "Authorization: Bearer YOUR_OAUTH_TOKEN"
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "5f06e5f241092794fc255ded",
    "type": "recordings",
    "attributes": {
      "agent_image": true,
      "agent_video": true,
      "checksum": null,
      "cloud_path": null,
      "cloud_snapshot": false,
      "cloud_thumbnail": false,
      "cloud_timelapse": false,
      "cloud_timelapse_error": null,
      "cloud_timelapse_interval": null,
      "cloud_video": false,
      "cloud_waveform": false,
      "created_at": "2020-07-09T10:40:02.469+01:00",
      "ends_at": "2020-07-04T15:37:02.467+01:00",
      "ends_at_seconds_since_midnight": 56222,
      "filesize": 0,
      "flagged": false,
      "motion": 0,
      "object_count": 0,
      "path": "/recordings/officiis1",
      "skip_notify": false,
      "starts_at": "2020-07-04T15:36:02.467+01:00",
      "starts_at_seconds_since_midnight": 56162,
      "updated_at": "2020-07-09T10:40:02.469+01:00",
      "seek_to_event": 0,
      "epoch_time": "04072020-0336PM-0337PM",
      "agent_id": "5f06e5f241092794fc255dee",
      "camera_id": "5f06e5f241092794fc255df2",
      "device_id": null,
      "event_id": "5f06e5f241092794fc255deb",
      "flagged_by_id": null,
      "location_id": "5f06e5f241092794fc255de9",
      "timeline_id": "5f06e5f141092794fc255ddb",
      "unflagged_by_id": null,
      "zone_id": "5f06e5f241092794fc255de8",
      "urls": {
        "proxy": "/recordings/5f06e5f241092794fc255ded/view?token=U-Gxk1fXchjRIp2D5GDCcw",
        "proxy_download": "/recordings/5f06e5f241092794fc255ded/download",
        "proxy_snapshot": "/recordings/5f06e5f241092794fc255ded/snapshot",
        "local": "lan-facilis1.timeline.is/api/v2/recordings/download.mp4?recording%5Bpath%5D=%2Frecordings%2Fofficiis1",
        "local_snapshot": "lan-facilis1.timeline.is/api/v2/recordings/snapshot?recording%5Bpath%5D=%2Frecordings%2Fofficiis1.jpg",
        "external": "external-facilis1.timeline.is/api/v2/recordings/download.mp4?recording%5Bpath%5D=%2Frecordings%2Fofficiis1",
        "external_snapshot": "external-facilis1.timeline.is/api/v2/recordings/snapshot?recording%5Bpath%5D=%2Frecordings%2Fofficiis1.jpg"
      },
      "prev_recording_id": null,
      "next_recording_id": null
    },
    "relationships": {
      "timelapses": {
        "data": [
          {
            "type": "timelapses",
            "id": "70240479762520"
          },
          {
            "type": "timelapses",
            "id": "70240479762360"
          }
        ]
      }
    }
  },
  "included": [
    {
      "id": "70240479762520",
      "type": "timelapses",
      "attributes": {
        "id": 70240479762520,
        "src": "/api/v3p/timelapse/5f06e5f241092794fc255de8/2020-07-04%2015:35:45%20+0100/thumbnail"
      }
    },
    {
      "id": "70240479762360",
      "type": "timelapses",
      "attributes": {
        "id": 70240479762360,
        "src": "/api/v3p/timelapse/5f06e5f241092794fc255de8/2020-07-04%2015:35:50%20+0100/thumbnail"
      }
    }
  ]
}
```




## Recording on Web site

You can generate correct url to our site to display recording at a certain point in time and pass `return_url`. We display banner at the top of site with link to your `redirect_url`.
It's very useful if you want to display recording on our site and have possibility to return to yours.

<aside class="notice">
Note: if you'll not pass `return_url` in parameters we'll not display banner at the top of site
</aside>

```shell
"https://my.timeline.is/recordings?at=2018-07-09%2019:00:00&zone=5f06cfeb4109278f7ef8dac7&return_url=http%3A%2F%2Fhost.some%2Freturn%2Furl"
```

### HTTP Request
`https://my.timeline.is/recordings`

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| at | query | Timestamp of recording to search | Yes | String |
| zone | query | Zone ID to find recording in | Yes | String |
| return_url | query | URL for ability to return from results page | No | String |
