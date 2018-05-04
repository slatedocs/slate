# Webhooks

Shiftboard can make an HTTP request to a customer-specified endpoint when specific events occur. Supported events include the following:
  
* account created
* account updated
* account deleted
* shift created
* shift updated
* shift deleted

Each of these events can be subscribed to independently (enabled/disabled and endpoint specified).

The webhook call is an HTTP GET request with the URL parameterized
with the ID of the affected object.  For example, if the account.create
endpoint is specified as ‘http://test.com/account/create/' then a
notification will look like ‘http://test.com/account/create/###’
where ### is the ID of the newly created account.  The ID can be
the internal Shiftboard ID, the external Customer ID (if the site
is configured to support that), or a customer-specified custom field
on the shift object.

For more information, or to get a webhook configured for your site, please contact your Account Manager.

Reference: [Webhooks](https://en.wikipedia.org/wiki/Webhook)
