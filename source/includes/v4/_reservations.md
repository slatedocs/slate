# Ticket Reservations

Tickets can be (short term) reserved for 5 minutes each. The reservation can be updated (and refreshed) for a max of 60 minutes 
reservation time.

### Creating a reservation

A ticket can be reserved like this:

`POST https://demo.gomus.de/api/v4/tickets/reservations`

> Write definition of order into /tmp/reservations.json before executing shell command.

```shell
curl "https://demo.gomus.de/api/v4/tickets/reservations"
    -XPOST --data "@/tmp/reservations.json"
    -H "Content-Type: application/json"
    -H "Authorization: Bearer meowmeowmeow"
```

> The above command assumes the reservations.json JSON is structured like this:

```json
  {
      "reservation": 
          {
              "ticket_id": 247,
              "quantity": 5,
              "start_at": "2016-09-25T16:00:00+02:00"
         }
       
   }
```

The response will contain the reservation object or an error.

### Response

The response is a data block, which contains the validity information like this:


```json
  {
 	"reservation":
 		{
 			"token":"XBqvPGe09EyXPi4iDC1Mgg",
 			"quantity":5,
 			"ticket_id":247,
 			"start_at":"2016-09-25T16:00:00+02:00",
 			"valid_until":"2016-09-02T19:11:20+02:00"
 		}
  }
```

### Updating and refreshing a reservation

A ticket reservation can be updated and refreshed like this:

`PUT https://demo.gomus.de/api/v4/tickets/reservations/:token`

> Write definition of order into /tmp/reservation_update.json before executing shell command.

```shell
curl "https://demo.gomus.de/api/v4/tickets/reservations/:token"
    -XPUT --data "@/tmp/reservations_update.json"
    -H "Content-Type: application/json"
    -H "Authorization: Bearer meowmeowmeow"
```

> The above command assumes the reservation_update.json JSON is structured like this:

```json
{
	
    "reservation":
        {
            "quantity": 10
        }
 }
```

The response will contain the reservation object or an error.

Note: you can only update the quantity, the validity will automaticaly refresh on each update.



### Deleting a reservation

A ticket reservation can be deleted. It is advised that you do so if the reservation is no longer needed.

`DELETE https://demo.gomus.de/api/v4/tickets/reservations/:token`

> Write definition of order into /tmp/reservation_update.json before executing shell command.

```shell
curl "https://demo.gomus.de/api/v4/tickets/reservations/:token"
    -XDELETE
    -H "Content-Type: application/json"
    -H "Authorization: Bearer meowmeowmeow"
```

The response will have no content.

