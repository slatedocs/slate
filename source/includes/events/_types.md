## Types of event

This is a list of all the types of event we currently send.

| Event                             |                             |
| --------------------------------- | --------------------------- |
| `verification.confirmed`          | Occurs whenever a customer is [confirmed](#confirm-a-customer) |
| `verification.needs_confirmation` | Occurs whenever a [confirmation token is sent](#send-a-confirmation-token) |
| `card.created`                    | Occurs whenever a [card is created](#create-a-card) |
| `customer.created`                | Occurs whenever a [customer is created](#create-a-customer) |
| `customer.updated`                | Occurs whenever a [customer is updated](#update-a-customer) |
| `address.created`                 | Occurs whenever an [address is created](#create-an-address) |
| `address.updated`                 | Occurs whenever an [address is updated](#update-an-address) |
| `order.created`                   | Occurs whenever an [order is created](#create-an-order) |
| `order.updated`                   | Occurs whenever an [order is updated](#update-an-order) |
| `session.created`                 | Occurs whenever a session is created |
| `session.updated`                 | Occurs whenever a [session is updated](#update-a-session) |
| `message.created`                 | Occurs whenever a message is created, whatever the message's `sender_role`. |
| `shipment.updated`                | Occurs whenever a [shipment is updated](#webhook) |
