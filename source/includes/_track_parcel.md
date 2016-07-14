# Track a Parcel
## `GET /api/tracking/{ref}`

> [ GET /api/tracking/{ref} ]

```shell
  curl "https://www.sendle.com/api/tracking/S3ND73"
```

> 200 Response

```
  {
    "tracking_events":
      [
        {
          "event_type":"pickup",
          "scan_time":"2015-11-17T20:31:00Z",
          "description":"Parcel picked up"
        },
        {
          "event_type":"information",
          "scan_time":"2015-11-18T01:04:00Z",
          "description":"In transit between locations"
        },
        {
          "event_type":"transit",
          "scan_time":"2015-11-18T01:14:00Z",
          "description":"In transit",
          "origin_location":"Sydney",
          "destination_location":"Brisbane"
        },
        {
          "event_type":"information",
          "scan_time":"2015-11-18T19:46:00Z",
          "description":"Arrived at the depot for processing"
        },
        {
          "event_type":"information",
          "scan_time":"2015-11-18T23:00:00Z",
          "description":"Parcel is loaded for delivery"
        },
        {
          "event_type":"delivery",
          "scan_time":"2015-11-18T23:46:00Z",
          "description":"Parcel delivered"
        }
      ]
    }
```

Viewing order tracking will give you all the public details associated with a Sendle Booking's tracking scans from pickup to delivery based on the order's **Sendle Reference**. Important details in tracking include:

| Field | Description |
|------:|:------------|
**event_type** | Type of scan event. Options usually are `pickup`, `information`, or `delivery`, though there are many tracking event types explained below. |
**scan_time** | Timestamp marker for a tracking event scan. |
**description** | A short description for the tracking event. |
**origin_location** | Reserved for transit events, this marks the departure of a parcel to a courier hub within an order's transit, usually marking hubs within the courier network. |
**destination_location** | This marks the arrival of a parcel to a courier hub within an order's transit, usually marking hubs within the courier network. |


| Event Type | Description |
|-----------:|:------------|
**pickup** | Event marking successful parcel pickup. |
**info** | Updating order with parcel or courier information. |
**transit** | Event marks transit between courier hub locations. |
**delivery** | Successful parcel delivery. |
**attempted** | Event marks attempted delivery. |
**card-left** | Event for attempted delivery with card left. |
**left-with-agent** | Event marks when courier leaves parcel with agent.|
**failed** | Marks order as failed. |

<aside class='info'>API parcel tracking response is cached for <strong>1 hour.</strong></aside>
