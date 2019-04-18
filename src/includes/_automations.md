
# Automations

### Warehouse zone

Vehicles that are inside a warehouse zone are automatically put into the 
`MAINTENANCE` state. Vehicles in this state cannot be rented.

### Business Hours

Outside the business hours, vehicles are put into the `TO_PICK_UP` state, so
that our logistics partners can find and pick up the vehicles. Vehicles in this state
cannot be rented.
