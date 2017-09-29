## Types of event

This is a list of all the types of event we currently send.

| Event                             |                             | Related object |
| --------------------------------- | --------------------------- |--------------------------- |
| `card.created`                    | Occurs whenever a [card is created](#create-a-card) | [Card](#cards) |
| `customer.created`                | Occurs whenever a [customer is created](#create-a-customer) | [Customer](#customers) |
| `customer.updated`                | Occurs whenever a [customer is updated](#update-a-customer) | [Customer](#customers) |
| `customer.verification`           | Occurs whenever a customer [confirmation token is generated](#generate-a-confirmation-token) | [Customer](#customers) |
| `customer.subscribed`             | Occurs whenever a [customer is subscribed](#subscribe) | [Customer](#customers) |
| `customer.unsubscribed`           | Occurs whenever a [customer is unsubscribed](#unsubscribe) | [Customer](#customers) |
| `address.created`                 | Occurs whenever an [address is created](#create-an-address) | [Address](#addresses) |
| `address.updated`                 | Occurs whenever an [address is updated](#update-an-address) | [Address](#addresses) |
| `order.created`                   | Occurs whenever an [order is created](#create-an-order) | [Order](#orders) |
| `order.updated`                   | Occurs whenever an [order is updated](#update-an-order) | [Order](#orders) |
| `session.created`                 | Occurs whenever a session is created | [Session](#sessions) |
| `session.updated`                 | Occurs whenever a [session is updated](#update-a-session) | [Session](#sessions) |
| `message.created`                 | Occurs whenever a message is created. | [Message](#messages) |
| `shipment.updated`                | Occurs whenever a [shipment is updated](#webhook) | [Shipment](#shipments) |
