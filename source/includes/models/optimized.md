# Optimized models

Once the [User Created Models](#user-created-models) have been imported into Foxtrot, an optimized version of
each will be returned. You will never need to create these Optimized models. The Foxtrot SDK will create them for you.
In addition to the original fields the models are based on, new fields are added to make the models easier to work with.

## OptimizedRoute

| Field                     | Type                                           | Nullable | Description
|---------------------------|------------------------------------------------|----------|-------------
| id                        | String                                         | false    | The id of the route.
| startTime                 | DateTime                                       | false    | The estimated start time of the route.
| name                      | String                                         | true     | The name of the route.
| waypoints                 | List<[OptimizedWaypoint](#optimizedwaypoint)>  | false    | The list of waypoint objects. This list must not be empty.


## OptimizedWaypoint

| Field                                | Type                                               | Nullable | Description
|--------------------------------------|----------------------------------------------------|----------|-------------
| id                                   | String                                             | false    | The id of the waypoint.
| name                                 | String                                             | true     | The name of the waypoint.
| address                              | String                                             | true     | The address at the waypoint.
| location                             | [Location](#location)                              | false    | The geocode coordinate at this waypoint.
| customerId                           | String                                             | false    | The globally unique identifier identifying the customer at this waypoint.
| serviceTimeInSeconds                 | Long                                               | true     | The estimated amount of time in seconds the driver will take to complete this waypoint.
| eta                                  | DateTime                                           | true     | The estimated time of arrival at this waypoint.
| distanceInMetersFromPreviousWaypoint | Long                                               | true     | The estimated distance in meters to get to this waypoint from the previous waypoint.
| timeInSecondsFromPreviousWaypoint    | Long                                               | true     | The estimated time in seconds to get to this waypoint from the previous waypoint.
| deliveries                           | List<[OptimizedDelivery](#optimizeddelivery)>      | false    | The list of Delivery objects at this waypoint. This list must not be empty.
| timeWindows                          | List<[OptimizedTimeWindow](#optimizedtimewindow)>  | false    | The list of TimeWindow objects at this waypoint. This list must not be empty.


## OptimizedTimeWindow

| Field                     | Type                             | Nullable | Description
|---------------------------|----------------------------------|----------|------------
| start                     | DateTime                         | false    | The start time of this time window. This value must be after the start of the route.
| end                       | DateTime                         | false    | The end time of this time window. This value must be after the start of this time window.


## OptimizedDelivery

| Field                     | Type                                                  | Nullable | Description
|---------------------------|-------------------------------------------------------|----------|------------
| id                        | String                                                | false    | The id of the delivery.
| name                      | String                                                | false    | The name of the product.
| quantity                  | Double                                                | true     | The quantity of the product. This field should in the unit that makes sense for the product.
| latestAttempt             | [OptimizedDeliveryAttempt](#optimizeddeliveryattempt) | true     | The last attempt status that was made to this delivery.

## OptimizedDeliveryAttempt

| Field                     | Type                             | Nullable | Description
|---------------------------|----------------------------------|----------|------------
| id                        | String                           | false    | The id of the delivery attempt.
| deliveryStatus            | [DeliveryStatus](#deliverystatus)| false    | The status of the [OptimizedDelivery](#optimizeddelivery).
| timestamp                 | DateTime                         | false    | The timestamp the attempt was created.
| notes                     | String                           | true     | The driver's note about the attempt.

