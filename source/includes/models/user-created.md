# User Created Models

These models must be created and imported into Foxtrot before they can be optimized. You will never directly create any of the [Optimized](#optimized-models) models.

<aside class="notice">
The Foxtrot SDK will not return the same objects that you import, but rather their Optimized equivalents.
</aside>

## Route
A Route contains a list of [Waypoint](#waypoint)s the driver will visit.

| Field                     | Type                         | Required | Description
|---------------------------|------------------------------|----------|------------
| startTime                 | DateTime                     | true     | The estimated start time of the route.
| name                      | String                       | true     | The name of the route.
| warehouse                 | [Warehouse](#warehouse)      | true     | The warehouse of the route. This field will be the beginning and end point of the route.
| waypoints                 | Collection<[Waypoint](#waypoint)>  | true     | The collection of waypoint objects. This collection must not be empty.

```java
List<Waypoint> waypoints = ...
Warehouse warehouse = ...
Route route = Route.builder()
                   .setName("Route A")
                   .setStartTime(new DateTime(1467053939000, DateTimeZone.UTC))
                   .setWarehouse(warehouse)
                   .setWaypoints(waypoints)
                   .build();
```

## Warehouse
A Warehouse is the beginning and end point of a route

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| name                      | String                           | true     | The name of the warehouse.
| address                   | String                           | true     | The address of the warehouse.
| location                  | [Location](#location)            | true     | The geocode coordinate of the warehouse.

```java
Warehouse warehouse = Warehouse.builder()
                               .setLocation(Location.create(1.0, 2.0))
                               .setAddress("123 Fake St")
                               .setName("My warehouse")
                               .build();
```

## Waypoint
A Waypoint contains the customer information, their location, and a list of [Delivery](#delivery) items at the location.

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| name                      | String                           | true     | The name of the waypoint.
| address                   | String                           | true     | The address of the waypoint.
| location                  | [Location](#location)            | true     | The geocode coordinate of the waypoint.
| customerId                | String                           | true     | The globally unique identifier identifying the customer at the waypoint.
| serviceTimeInSeconds      | Long                             | true     | The estimated amount of time in seconds the driver will take to complete the waypoint.
| deliveries                | Collection<[Delivery](#delivery)>      | true     | The collection of Delivery objects at the waypoint. This collection must not be empty.
| timeWindows               | Collection<[TimeWindow](#timewindow)>  | true     | The collection of TimeWindow objects at the waypoint. This collection may be empty.

```java
Collection<Delivery> deliveries = ...;
Collection<TimeWindow> timeWindows = ...;
Waypoint waypoint = Waypoint.builder()
                            .setName("Friendly Neighborhood Bakery")
                            .setAddress("123 Fake St")
                            .setLocation(Location.create(1.0, 2.0))
                            .setCustomerId("Customer Unique Id")
                            .setServiceTimeInSeconds(600L) // 10 minutes
                            .setDeliveries(deliveries)
                            .setTimeWindows(timeWindows)
                            .build();
```

## Location
A Location object describes a latitude and longitude coordinate position

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| latitude                  | Double                           | true     | The latitude position. -90 <= latitude <= 90
| longitude                 | Double                           | true     | The longitude position. -180 <= longitude <= 180

```java
Location location = Location.create(37.780177, -122.397055);
```

## TimeWindow
A TimeWindow describes the time constraint to make the delivery. e.g. the working hours of the customer.

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| start                     | DateTime                         | true     | The start time of this time window. This value must be after the start of the route.
| end                       | DateTime                         | true     | The end time of this time window. This value must be after the start of this time window.

```java
DateTime now = new DateTime();
TimeWindow timeWindow = TimeWindow.builder()
                                  .setStart(now)
                                  .setEnd(now.plusHours(4)) //four hours from now
                                  .build();
```

## Delivery
A Delivery describes an item and quantity to be delivered. e.g. SKU

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| name                      | String                           | true     | The name or SKU of the product.
| quantity                  | Double                           | true     | The quantity of the product. This field should be in the unit that makes sense for the product.

```java
Delivery delivery = Delivery.builder()
                            .setProduct("Beer")
                            .setQuantity(5.0)
                            .build();
```

## DeliveryAttempt
A DeliveryAttempt contains status information on a visit a [Driver](#driver) made at a [Waypoint](#waypoint).

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| status                    | [DeliveryStatus](#deliverystatus)| true     | The status of the [Delivery](#delivery).
| deliveryCode              | [DeliveryCode](#deliverycode)    | false    | Additional information about the attempted delivery.
| notes                     | String                           | false    | The driver's note about the attempt.

```java
DeliveryCode deliveryCode = ...
DeliveryAttempt attempt = DeliveryAttempt.builder()
                                         .setDeliveryCode(deliveryCode)
                                         .setNotes("Handed to customer")
                                         .setStatus(DeliveryStatus.SUCCESSFUL)
                                         .build();
```

## DeliveryReattempt
A DeliveryReattempt marks the need to reattempt a delivery at a [Waypoint](#waypoint) in the future.

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| deliveryCode              | [DeliveryCode](#deliverycode)    | false    | Additional information about the reattempt.
| notes                     | String                           | false    | The driver's note about the reattempt.
| timeWindow                | [TimeWindow](#timewindow)        | false    | The estimated time the driver would like to come back.

```java
DeliveryCode deliveryCode = ...
DeliveryReattempt reattempt = DeliveryReattempt.builder()
                                               .setDeliveryCode(deliveryCode)
                                               .setNotes("Customer is not home")
                                               .setTimeWindow(...)
                                               .build();
```

## DeliveryVisitLater
A DeliveryVisitLater marks the need to visit the [Waypoint](#waypoint) in the future.

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| deliveryCode              | [DeliveryCode](#deliverycode)    | false    | Additional information about the visit later status.
| notes                     | String                           | false    | The driver's note about the visit later status.
| timeWindow                | [TimeWindow](#timewindow)        | false    | The estimated time the driver would like to come back.

```java
DeliveryCode deliveryCode = ...
DeliveryVisitLater deliveryVisitLater = DeliveryVisitLater.builder()
                                                          .setDeliveryCode(deliveryCode)
                                                          .setNotes("Customer is not home")
                                                          .setTimeWindow(...)
                                                          .build();
```

## DeliveryCode
A DeliveryCode allows the driver to give additional information about what happened during a [DeliveryAttempt](#deliveryattempt).

| Field                     | Type                             | Required | Description
|---------------------------|----------------------------------|----------|------------
| deliveryCode              | String                           | true     | The delivery code.
| message                   | String                           | true     | A message that describes the delivery code.

```java
DeliveryCode deliveryCode = DeliveryCode.builder()
                                         .setCode("E-201")
                                         .setMessage("Customer was not available")
                                         .build();
```


## DeliveryStatus
A DeliveryStatus is an enumeration for possible attempt states.

| States                  | Description
|-------------------------|------------
| FAILED                  | Marks a failed delivery.
| SUCCESSFUL              | Marks a successful delivery.
| AUTHORIZE_REATTEMPT     | Mark the delivery to be reattempted later.
| VISIT_LATER             | Mark the delivery to be visited later.

Both `AUTHORIZE_REATTEMPT` and `VISIT_LATER` emit the same behavior; however, it is recommended to use them based on the
context of the situation.

### `VISIT_LATER` sample use-cases:

1. Driver failed to deliver the goods product, but knows he/she will come back later during the day.

### `AUTHORIZE_REATTEMPT` sample use-cases:

1. Driver failed to deliver the goods and marked it as `FAILED`. Later during the day, the driver wants to come back.
The driver can now `AUTHORIZE_REATTEMPT` on the same delivery. Foxtrot will automatically re-optimize the route with the
new information.
2. Driver failed to deliver the goods and marked it as `FAILED`. Later during the day, a route manager wants the driver
to come back. The manager can `AUTHORIZE_REATTEMPT` on the failed delivery. Foxtrot will automatically re-optimize the route with the
new information.

## Driver
A Driver represents the driver driving the route.

| Field     | Type          | Required | Description
|-----------|---------------|----------|---------------------
| id        | String        | true     | The driver's id.
| name      | String        | true     | The driver's name.

```java
Driver driver = Driver.builder()
                      .setId("the id")
                      .setName("the name")
                      .build();
```


