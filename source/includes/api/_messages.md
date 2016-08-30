# Messages
The Messages resource lets you send SMS/MMS messages and view messages that were previously sent or received.

## Properties
| Property            | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|:--------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id                  | The unique ID of the message.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| from                | The message sender’s telephone number (or short code).                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| to                  | Message recipient telephone number (or short code).                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| direction           | Direction of message, in - a message that came from the telephone network to one of your numbers (an “inbound” message) or out - a message that was sent from one of your numbers to the telephone network (an “outbound” message)                                                                                                                                                                                                                                                                          |
| text                | The message contents. NOTE: We only store the message contents for 30 days. Any messages older than 30 days will not contain text.                                                                                                                                                                                                                                                                                                                                                                          |
| media               | Json array containing list of media urls to be sent as content for an mms. Valid URLs are: <br> https://api.catapult.inetwork.com/v1/users/&lt;user-id&gt;/media/<media-name></media-name> <br>We also support media URLs that are external to Bandwidth API, http:// or https:// format: <br> Example: http://customer-web-site.com/file.jpg <br> And coming soon, we are going to use file name from Content-Disposition header in case it’s passed by the media URLs that are external to Bandwidth API. |
| state               | Message state, values are:  <br> * `received`<br> * `queued`<br> * `sending`<br> * `sent` <br> * `error`                                                                                                                                                                                                                                                                                                                                                                                                    |
| time                | The time the message resource was created (UTC, follows the ISO 8601 format).                                                                                                                                                                                                                                                                                                                                                                                                                               |
| callbackUrl         | The complete URL where the events related to the outgoing message will be sent.                                                                                                                                                                                                                                                                                                                                                                                                                             |
| callbackTimeout     | Determine how long should the platform wait for callbackUrl’s response before timing out (milliseconds).                                                                                                                                                                                                                                                                                                                                                                                                    |
| fallbackUrl         | The server URL used to send message events if the request to callbackUrl fails.                                                                                                                                                                                                                                                                                                                                                                                                                             |
| page                | Used for pagination to indicate the page requested for querying a list of messages. If no value is specified the default is 0.                                                                                                                                                                                                                                                                                                                                                                              |
| size                | Used for pagination to indicate the size of each page requested for querying a list of messages. If no value is specified the default value is 25. (Maximum value 1000)                                                                                                                                                                                                                                                                                                                                     |
| tag                 | A string that will be included in the callback events of the message.                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| receiptRequested    | Requested receipt option for outbound messages: `none` `all` `error` Default is `none`.                                                                                                                                                                                                                                                                                                                                                                                                                     |
| deliveryState       | One of the message delivery states `waiting` `delivered` `not-delivered `                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| deliveryCode        | Numeric value of deliver code, see table for values.                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| deliveryDescription | Message delivery description for the respective delivery code                                                                                                                                                                                                                                                                                                                                                                                                                                               |

## Message Request Receipt
| Receipt | Description                                                     |
|:--------|:----------------------------------------------------------------|
| none    | Delivery receipt will not be sent as callback event.            |
| error   | Only error delivery receipt event maybe sent as callback event. |
| all     | Success or error delivery receipt maybe sent as callback event. |

## Message States
| State    | Description                                                                            |
|:---------|:---------------------------------------------------------------------------------------|
| received | The message was received.                                                              |
| queued   | The message is waiting in queue and will be sent soon.                                 |
| sending  | The message was removed from queue and is being sent.                                  |
| sent     | The message was sent successfully.                                                     |
| error    | There was an error sending or receiving a message (check errors resource for details). |

## Message Delivery State
| State         | Description                                        |
|:--------------|:---------------------------------------------------|
| waiting       | Waiting for receipt.                               |
| delivered     | Receipt indicating that message was delivered.     |
| not-delivered | Receipt indicating that message was not delivered. |

## Message Delivery Code
| Code | Description                                   |
|:-----|:----------------------------------------------|
| 0    | Message delivered to carrier                  |
| 100  | Message not delivered to carrier              |
| 187  | Statistical spam detected                     |
| 188  | Keyword spam detected                         |
| 189  | Spam detected                                 |
| 482  | Loop detected                                 |
| 600  | Destination carrier could not accept messages |
| 610  | Message submittion failed                     |
| 620  | Destination application error                 |
| 630  | Message not acknowledge                       |
| 720  | Invalid destination number                    |
| 740  | Invalid source number                         |
| 999  | Unknown error                                 |


## Multiple Message Result Types
