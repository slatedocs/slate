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
| timeWindows               | Collection<[TimeWindow](#timewindow)>  | true     | The collection of TimeWindow objects at the waypoint. This collection may be empty. The TimeWindow Collection must sum up to at least 4hrs 30min in duration, and each TimeWindow cannot be shorter than 3hrs.

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
A TimeWindow describes the time constraint to make the delivery. e.g. the working hours of the customer. Foxtrot will try to help the driver arrive inside a TimeWindow. Keep in mind, the TimeWindow Collection for each waypoint must be at least 4hrs 30min in duration, and each TimeWindow cannot be shorter than 3hrs.

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
| `FAILED`                | (At Delivery Site: Option 1/3) Marks a failed delivery.
| `SUCCESSFUL`            | (At Delivery Site: Option 2/3) Marks a successful delivery.
| `VISIT_LATER`           | (At Delivery Site: Option 3/3) Marks the delivery to be visited later.
| `AUTHORIZE_REATTEMPT`   | (Optional: After prior DeliveryAttempt) Marks the delivery to be reattempted later.

It is critical that upon conclusion of every delivery attempt, the driver mark the waypoint as `FAILED`, `SUCCESSFUL` OR `VISIT_LATER`.

### `SUCCESSFUL` use-case:

Driver succeeded in delivering the product.

### `FAILED` use-case:

Driver failed in delivering the product and does not expect to make another attempt today. Knowing there will be no further attempts today, the driver marks the waypoint as FAILED.

### `VISIT_LATER` use-case:

Driver failed to deliver the product, but knows he/she will come back to try again later during the day.

### `AUTHORIZE_REATTEMPT` use-cases:

** In all circumstances using the `AUTHORIZE_REATTEMPT`, there MUST be a `FAILED` or `SUCCESSFUL` attempt immediately preceeding.

1. Driver failed to deliver the goods, sure that they will not come again later that day, and thus registers a FAILED attempt. Unexpectedly, circumstances change later during the day, and the driver decides he/she will want to try again.
The driver can `AUTHORIZE_REATTEMPT` on the same delivery and Foxtrot will automatically re-optimize the route with the
new information.
2. Driver failed to deliver the goods, sure that they will not come again later that day, and thus registers a FAILED attempt. Unexpectedly, circumstances change later during the day, and the manager decides that the driver should try again.
The manager can `AUTHORIZE_REATTEMPT` on the same delivery and Foxtrot will automatically re-optimize the route with the
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


