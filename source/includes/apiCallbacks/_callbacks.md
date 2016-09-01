# Rest API Callbacks
HTTP Callback events (Webhooks) are events that are sent to your application server via HTTP to notify you of activity related to your Bandwidth phone numbers, phone calls and messages.

## How to receive HTTP callback events on your web server
You can set the URL to receive these events in two ways:

* Create [/applications](#applications), set incomingCallUrl and incomingMessageUrl and associate the applications to the [/phoneNumbers](#phone-numbers) you want to receive HTTP callback events for.
* Create an outgoing [/calls](#post-calls) and [/messages](#post-messages) set the callbackUrl property to your web server endpoint

When you set callback URLs in an application you create, Bandwidth API will send events as JSON objects to those URLs as they happen. Based on these events, the program that serves these URLs can control the flow of calls and messages by calling back to Bandwidth APIs.

![diagram](images/callback-events1.png)

## Securing your web server with HTTP Basic Auth

You can password protect your web server for Bandwidth Callbacks for example:

`https://username:password@yoursecurehost.com/yoursecureapp`
