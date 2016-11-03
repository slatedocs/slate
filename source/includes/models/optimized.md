# Optimized Models

Once the [User Created Models](#user-created-models) have been imported into Foxtrot, an optimized version of
each will be returned. You will never need to create these Optimized models. The Foxtrot SDK will create them for you. In addition to the original fields the models are based on, new fields are added to make it easier to work with the models. For example, an OptimizedWaypoint has an `eta` field, denoting when the driver is expected to arrive at that waypoint.

## OptimizedRoute

| Field                     | Type                                           | Nullable | Description
|---------------------------|------------------------------------------------|----------|-------------
| id                        | String                                         | false    | The id of the route.
| startTime                 | DateTime                                       | false    | The estimated start time of the route.
| name                      | String                                         | false    | The name of the route.
| waypoints                 | List<[OptimizedWaypoint](#optimizedwaypoint)>  | false    | The list of waypoint objects. This list will not be empty.


## OptimizedWarehouse

| Field                     | Type                             | Nullable | Description
|---------------------------|----------------------------------|----------|------------
| id                        | String  	                       | false    | The id of the warehouse.
| name                      | String                           | false    | The name of the warehouse.
| address                   | String                           | false    | The address at the warehouse.
| location                  | [Location](#location)            | false    | The geocode coordinate at this warehouse.


## OptimizedWaypoint

| Field                                | Type                                                      | Nullable | Description
|--------------------------------------|-----------------------------------------------------------|----------|-------------
| id                                   | String                                                    | false    | The id of the waypoint.
| name                                 | String                                                    | false    | The name of the waypoint.
| address                              | String                                                    | false    | The address at the waypoint.
| location                             | [Location](#location)                                     | false    | The geocode coordinate at this waypoint.
| customerId                           | String                                                    | false    | The globally unique identifier identifying the customer at this waypoint.
| serviceTimeInSeconds                 | Long                                                      | false    | The estimated amount of time in seconds the driver will take to complete this waypoint.
| eta                                  | DateTime                                                  | true     | The estimated time of arrival at this waypoint.
| distanceInMetersFromPreviousWaypoint | Long                                                      | true     | The estimated distance in meters to get to this waypoint from the previous waypoint.
| timeInSecondsFromPreviousWaypoint    | Long                                                      | true     | The estimated time in seconds to get to this waypoint from the previous waypoint.
| deliveries                           | Collection<[OptimizedDelivery](#optimizeddelivery)>       | false    | The collection of Delivery objects at this waypoint. This collection will have at least one element.
| operationHours                          | Collection<[OptimizedOperationHours](#optimizedoperationHours)>   | false    | The collection of OperationHours objects at this waypoint. This collection may be empty.


## OptimizedOperationHours

| Field                     | Type                             | Nullable | Description
|---------------------------|----------------------------------|----------|------------
| start                     | DateTime                         | false    | The start time of this operation hours. This value must be after the start of the route.
| end                       | DateTime                         | false    | The end time of this operation hours. This value must be after the start of this operation hours.


## OptimizedDelivery

| Field                     | Type                                                  | Nullable | Description
|---------------------------|-------------------------------------------------------|----------|------------
| id                        | String                                                | false    | The id of the delivery.
| name                      | String                                                | false    | The name of the product.
| quantity                  | Double                                                | false    | The quantity of the product. This field should be in the unit that makes sense for the product.
| latestAttempt             | [OptimizedDeliveryAttempt](#optimizeddeliveryattempt) | true     | The last attempt status that was made to this delivery.

## OptimizedDeliveryAttempt

| Field                     | Type                             | Nullable | Description
|---------------------------|----------------------------------|----------|------------
| id                        | String                           | false    | The id of the delivery attempt.
| deliveryStatus            | [DeliveryStatus](#deliverystatus)| false    | The status of the [OptimizedDelivery](#optimizeddelivery).
| deliveryCode              | [DeliveryCode](#deliverycode)    | true     | Additional information about the attempted delivery.
| timestamp                 | DateTime                         | false    | The timestamp the attempt was created.
| notes                     | String                           | true     | The driver's note about the attempt.

