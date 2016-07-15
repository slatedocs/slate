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
          "event_type":"Pickup",
          "scan_time":"2015-11-17T20:31:00Z",
          "description":"Parcel picked up"
        },
        {
          "event_type":"Info",
          "scan_time":"2015-11-18T01:04:00Z",
          "description":"In transit between locations"
        },
        {
          "event_type":"In Transit",
          "scan_time":"2015-11-18T01:14:00Z",
          "description":"In transit",
          "origin_location":"Sydney",
          "destination_location":"Brisbane"
        },
        {
          "event_type":"Info",
          "scan_time":"2015-11-18T19:46:00Z",
          "description":"Arrived at the depot for processing"
        },
        {
          "event_type":"Info",
          "scan_time":"2015-11-18T23:00:00Z",
          "description":"Parcel is loaded for delivery"
        },
        {
          "event_type":"Delivered",
          "scan_time":"2015-11-18T23:46:00Z",
          "description":"Parcel delivered"
        }
      ]
    }
```

Order tracking gives the public details associated with a Sendle order based on the order's **Sendle Reference** as a search key _(as `ref` above)._ The API response returns tracking scans from pickup to delivery. Order tracking does not contain personal location information. Important details in tracking include:

| Field | Description |
|------:|:------------|
**event_type** | Type of scan event. Options usually are `Pickup`, `Info`, or `Delivered`, though there are many tracking event types explained on the table below. |
**scan_time** | Timestamp marker for a tracking event scan. Scans are set in the <strong>UTC</strong> time zone. |
**description** | A short description for the tracking event. |
**origin_location** | Marks the departure location of a parcel from a physical hub within an order's transit. |
**destination_location** | Marks the arrival location of a parcel to a physical hub in the courier network. |


| Event Type | Description |
|-----------:|:------------|
**Pickup** | Parcel successfully picked up. |
**Info** | Information received from courier. |
**In Transit** | Parcel in transit between courier hub locations. |
**Delivered** | Parcel successfully delivered. |
**Delivery Attempted** | Parcel delivery attempted, but unsuccessful. |
**Card Left** | Parcel delivery attempted, card left for receiver to arrange collection or re-delivery where available. |
**Left with Agent** | Parcel left with agent, this will be a parcel connect location, POPStation, or similar.|
**Delivery Failed** | Delivery failed. |
