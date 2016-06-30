# User created models

These models must be imported into Foxtrot before they can be optimized.

## Route
```java
List<Waypoint> waypoints = ...
Route route = Route.builder()
                   .setName("Route A")
                   .setStartTime(new DateTime(1467053939000, DateTimeZone.UTC))
                   .setWaypoints(waypoints)
                   .build();
```
A Route contains a list of [Waypoint](#waypoint) the driver will drive on.

| Field                     | Type                         | Required | Description
|---------------------------|------------------------------|----------|------------
| startTime                 | DateTime                     | true     | The estimated start time of the route.
| name                      | String                       | false    | The name of the route.
| waypoints                 | List<[Waypoint](#waypoint)>  | true     | The list of waypoint objects. This list must not be empty.


## Waypoint
```java
List<Delivery> deliveries = ...;
List<TimeWindow> timeWindows = ...;
Waypoint waypoint = Waypoint.builder()
                            .setLocation(Location.create(1.0, 2.0))
                            .setAddress("123 Fake St")
                            .setName("Whole Foods")
                            .setCustomerId("Customer Unique Id")
                            .setDeliveries(deliveries)
                            .setTimeWindows(timeWindows)
                            .setServiceTimeInSeconds(600L) // 10 minutes
                            .build();
```
A Waypoint contains both the customer information, their location, and a list of [Delivery](#delivery) items at the location.

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| name                      | String                           | false    | The name of the waypoint.
| address                   | String                           | false    | The address at the waypoint.
| location                  | [Location](#location)            | true     | The geocode coordinate at this waypoint.
| customerId                | String                           | true     | The globally unique identifier identifying the customer at this waypoint.
| serviceTimeInSeconds      | Long                             | false    | The estimated amount of time in seconds the driver will take to complete this waypoint.
| deliveries                | List<[Delivery](#delivery)>      | true     | The list of Delivery objects at this waypoint. This list must not be empty.
| timeWindows               | List<[TimeWindow](#timewindow)>  | false    | The list of TimeWindow objects at this waypoint. This list must not be empty.

## Location
```java
Location location = Location.create(1.0, 2.0);
```
A Location object describes the latitude and longitude coordinate position

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| latitude                  | Double                           | true     | The latitude position. -90 <= latitude <= 90
| longitude                 | Double                           | true     | The longitude position. -180 <= longitude <= 180

## TimeWindow
```java
DateTime now = new DateTime();
TimeWindow timeWindow = TimeWindow.builder()
                                  .setStart(now)
                                  .setEnd(now.plusHours(4)) //four hours from now
                                  .build();
```
A TimeWindow describes the time constraint to make the delivery. e.g. the working hours of the customer.

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| start                     | DateTime                         | true     | The start time of this time window. This value must be after the start of the route.
| end                       | DateTime                         | true     | The end time of this time window. This value must be after the start of this time window.


## Delivery
```java
Delivery delivery = Delivery.builder()
                            .setProduct("Beer")
                            .setQuantity(5.0)
                            .build();
```
A Delivery describes the item to be delivered. 

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| name                      | String                           | true     | The name of the product.
| quantity                  | Double                           | false    | The quantity of the product. This field should in the unit that makes sense for the product.

## DeliveryAttempt
```java
DeliveryAttempt attempt = DeliveryAttempt.builder()
                                         .setNotes("Handed to customer")
                                         .setStatus(DeliveryStatus.SUCCESSFUL)
                                         .build();
```
A DeliveryAttempt contains status information on a delivery. 

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| deliveryStatus            | [DeliveryStatus](#deliverystatus)| true     | The status of the [Delivery](#delivery).
| notes                     | String                           | false    | The driver's note about the attempt.

## DeliveryStatus
A DeliveryStatus is an enumeration for possible attempt states.

| States        | Description
|---------------|------------
| FAILED        | Marks a failed delivery.
| SUCCESSFUL    | Marks a successful delivery.
| REATTEMPT     | Marks the delivery can be reattempted. The delivery was previously marked FAILED, but the route manager has re-authorized a reattempt.

## Driver
```java
Driver driver = Driver.builder()
                      .setId("the id")
                      .setName("the name")
                      .build();
```
A Driver represents the driver driving the route.

| Field     | Type          | Required | Description
|-----------|---------------|----------|---------------------
| id        | String        | true     | The driver's id.
| name      | String        | true     | The driver's name.

