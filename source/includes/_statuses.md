# Check for Status Updates

```
  {
    "state":"Pickup"
  }
```

<aside class='notice'>The state tracks the position of an order in it's lifetime with Sendle. Below is a table explaining the various states.</aside>


### States

Sendle uses a handful of terms to describe an order's state

State | Description
------|------
Ordering | An order is created, but not booked with a courier yet.
Booking | An order is booked with a courier.
Manual Booking | An order was manually booked by Support.
Picking Up | Booking has been consigned and Courier is scheduled to pick up the parcel.
In Transit | Parcel is in transit.
Delivered | Parcel has been successfully delivered.
Delivery Attempted | Parcel delivery was attempted.
Onforwarded | Parcel could not be delivered, a 3rd party has been contracted to deliver the parcel.
Cancelled | A cancelled order.
Abandoned | An order was Abandoned.
Failed | An booking has failed.

