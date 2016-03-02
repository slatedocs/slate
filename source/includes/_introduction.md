# Introduction

> example of a Sendle API call using Curl:

```shell
  curl 'https://www.sendle.com/api/quote?pickup_suburb=Wonglepong&pickup_postcode=4275&delivery_suburb=Foul%20Bay&delivery_postcode=5577&kilogram_weight=2.0&cubic_metre_volume=0.01'
  -H 'Content-Type: application/json'
```

### Welcome to the Sendle API!

You can use our API to book Sendle parcels, manage shipping, and oversee past and present orders any way you like!

Sendle API uses [JSON](http://www.json.org/). You can view code examples in the dark area to the right.

For all examples in this guide, we will be using [**cURL**](http://curl.haxx.se/) from the command line, but you are encouraged to make requests in whichever method you are most comfortable with.

### API Endpoints

The Sendle API services different tasks which can be accessed through GET, POST, or DELETE requests through specific urls.

endpoint | request | task
---------|---------|------
/api/ping | GET | [Connection Test](#ping-server)
/api/quote | GET | [Quoting](#getting-quotes)
/api/orders | POST | [Booking Orders](#creating-orders)
/api/orders/{id} | GET | [View Order {id}](#view-an-order)
/api/{label_url} | GET | [View a label](#getting-labels)
/api/orders/{id} | DELETE | [Cancel an order](#cancelling-orders)
