# Introduction

### Welcome to the Sendle API!

You can use our Application Programming Interface (**API**) to book Sendle parcels, manage shipping, and oversee past and present orders any way you like!

<aside class="success">
Our Application Programming Interface
  <ol>
    <li>
      Sendle provides a number of services, such as quoting, booking and tracking, via its Application Programming Interface (API).
    </li>
    <li>
      Sendle is the owner of the API however we give you the right to use the API for your own purposes, explicitly for sending your own parcels.
    </li>
    <li>
      If you wish to use the API for the purpose of sending parcels for other parties, you must first seek the permission of Sendle to do so and adhere to any requirements set by Sendle from time to time.  You can seek this permission by emailing <a href="mailto:business@sendle.com?subject=Requesting+API+Access"><strong>business@sendle.com</strong></a>.
    </li>
    <li>
      This term should be read in conjunction with our <a href="https://support.sendle.com/hc/en-us/sections/200968387-Terms"><strong>Website User Agreement</strong></a> which sets out our (and your) intellectual property rights in more detail.
    </li>
  </ol>
</aside>

> example of a Sendle API call using Curl:

```shell
  curl 'https://www.sendle.com/api/quote?pickup_suburb=Wonglepong&pickup_postcode=4275&delivery_suburb=Foul%20Bay&delivery_postcode=5577&kilogram_weight=2.0&cubic_metre_volume=0.01'
  -H 'Content-Type: application/json'
```

Sendle API uses [JSON](http://www.json.org/). You can view code examples in the rightmost column.

For all examples in this guide, we will be using [**cURL**](http://curl.haxx.se/) from the command line, but you are encouraged to make requests in whichever method you are most comfortable with.

### API Endpoints

The Sendle API services different tasks which can be accessed through GET, POST, or DELETE requests through specific urls.

endpoint | request | task
---------|---------|------
/api/ping | GET | [Connection Test](#ping-server)
/api/quote | GET | [Quoting](#getting-quotes)
/api/orders | POST | [Booking Orders](#creating-orders)
/api/orders/{id} | GET | [View Order {id}](#view-an-order)
/api/{label_url} | GET | [View a Label](#getting-labels)
/api/tracking/{ref} | GET | [Track a Parcel](#track-a-parcel)
/api/orders/{id} | DELETE | [Cancel an order](#cancelling-orders)
