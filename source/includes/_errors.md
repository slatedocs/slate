# Errors

## Error response

> Generic error response (4xx, 5xx)

```json
{
  "error": {
    "id": "NOT_FOUND",
    "message": "Not found"
  }
}
```
> Validation failed (400)

```json
{
  "error": {
    "id": "INVALID_INPUT",
    "message": "Invalid request"
  }
}
```

All error messages will return an `id` and a human readable `message`. 

Important: Different error types `id` can be added and removed over time so you should make sure your application accepts new ones as well.

Error id | Code | Description
--------- | ------- | -----------
INVALID_INPUT | 400  | Invalid request
VALIDATION_ERROR | 400  | Validation Error 
ORDER_TIMESLOT_FULL | 400  | Invalid order time slot 
ORDER_TIMESLOT_PAST | 400  | Invalid order time slot
FIRE_ORDER_LOCK_TIMEOUT | 400  | Server was unable to change an order's state
DUPLICATE_ORDER | 400  | Duplicate order
INVALID_PROMO_CODE | 400  | Invalid promo code
INVALID_PROMO_CODE | 400 | Invalid promo code
UNPUBLISHED_PROMO | 400 | Unpublished promo code
SINGLE_USE_PROMO_ALREADY_ASSIGNED | 400 | Single use promo code has already been assigned
PROMO_ALREADY_ASSIGNED_TO_OTHER_USER | 400 | Promo code has already been assigned to another user
PROMO_ALREADY_APPLIED_BY_USER | 400 | Promo code already applied by user
INVALID_PROMO_ACTIVATION_DATES | 400 | Invalid promo code activation dates
MULTI_USE_PROMO_CAP_REACHED | 400 |Promo code cap reached
STORE_CLOSED | 400  | Store closed
UNAUTHORIZED | 401  | Unauthorized
FORBIDDEN | 403  | Forbidden
NOT_FOUND | 404  | Resource not found
INTERNAL_SERVER_ERROR | 500  | Internal server error
