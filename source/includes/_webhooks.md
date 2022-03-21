# Webhooks

Webhook is a universal way how to send data about leads, pages, forms and events. The data is sent in real-time when an action occurs so the system which listens form Mautic webhook data can process them without the need for a periodic scanning if Mautic has some new data.

## Available webhook actions

Mautic can send webhook payload on these actions:

- Email open
- Form submit
- Lead delete
- Lead point change
- Lead update
- Lead create
- Page hit

## The webhook workflow

The example workflow below describes a real-life workflow to get an idea how the webhooks can be used. Let's imagine we have a project management system (PMS) and we want to create a new issue when a lead submits a form.

1. A lead submits a Mautic form.
2. Mautic saves the form.
3. Mautic checks if there is a webhook with the *Form submit* event. If there is, Mautic sends the data to the URL address defined in the webhook.
4. PMS receives the data about the form submission and creates a new issue from it.

## Create a webhook

It is possible to create multiple different webhooks. That will allow you to send different information to different apps/scripts.

1. Open the right hand side menu (click the cog icon in the top right corner) and select *Webhooks*.
2. Create a new webhook.
3. Fill in a *Name*, *Webhook POST Url* (see the next paragraph if you don't have one) and select which *Webhook Events* should trigger this webhook.

## Test a webhook

The easiest way how to test a webhook payload is to use a service like [RequestBin](http://requestb.in/). RequestBin lets you create a URL which you can set as the `Webhook POST Url` in Mautic. Then click the *Apply* button to save it and then click the *Send Test Payload* button. That will send a test payload data to RequestBin and you will be able to see it at your RequestBin.

When you have created your testing webhook, you can test the real data it sends when a defined action is triggered.

## Immediate or queued webhooks

There is an option to queue webhooks for background execution. The reason behind it is that every time an action like contact update happens which has the webhook listener attached to it, the action has to wait for the webhook response until the webhook response returns or when it times out after 10 seconds. So it is up to the webhook receiver how fast the contact update is.

This lag can be more visible when you do a CSV import. It may be slow when it is waiting a second or two for webhook response for every imported contact.

If you want to avoid this lag in the user interface, configure the Webhook queue in the configuration and add this command to your cron tab: `bin/console mautic:webhooks:process`. This way every time the Webhook is triggered, the information is only stored as a new row into database, so it is much faster than sending the information to another service via HTTP. Then the command (cron job) will read the records from the database and make the requests which may take some time, but it is not slowing down the Users or Contacts. The command will also send 10 events in 1 Webhook request so this communication needs 10 times less HTTP requests. The caveat to this optimization is that the Webhooks are not fired every time the action happens, but every time the command (cron job) runs.

## Queued event order

Mautic will send several events in one webhook if they happen before the queue trigger command runs. Mautic's default order of those events is chronological. But Zapier integration which use webhooks heavily requires reverse chronological order. Therefore the new option to configure the order was added to webhooks as well as to the global configuration. Webhook configuration overwrites the global configuration, but if not set, the global configuration order value is applied.

## Authenticity verification

During webhook creation you can provide a secret key, if no secret key is provided it will be automatically generated. This secret has to be shared with third-party application which will receive webhooks from mautic.
Indeed, in order to verify authenticity of the data provided in a webhook, Mautic add an header `Webhook-Signature` on every webhook call. A third-party application can compute a base64 encoded HMAC-SHA256 signature with the webhook secret on the (raw) payload body to verify this signature and prove authenticity of the webhook data.

## Examples webhook script

If you need an idea about how to receive Mautic webhook data in your app, this script can be used as a starting point. The script will log the request and return the payload. Place this script on a publicly accessible URL (i.e. `http://yourwebsite.com/webhookTest.php), then fill in the Mautic *Webhook POST Url* to this script.

 ```php
<?php
// webhookTest.php

/**
 * A helper class to log and get the Mautic webhook request
 */
class webhookTest {
    /**
     * Log a message to a file
     *
     * @param  mixed $message
     * @param  string $type [info|error|request]
     */
    public function log($message, $type = 'info')
    {
        $prefix = 'webhookLog_';
        $file = $type . '.log';
        $date = new DateTime();
        error_log($date->format('Y-m-d H:i:s') . ' ' . $message . "\n\n", 3, $prefix . $file);
    }
    /**
     * Get the request JSON object and log the request
     *
     * @return object
     */
    public function getRequest()
    {
        $rawData = file_get_contents("php://input");
        $this->log($rawData, 'request');
        return $rawData;
    }
}

$secret = 'mySecret';
$webhook = new webhookTest;
$rawData = $webhook->getRequest();

// optional signature verification
$headers = getallheaders();
$receivedSignature = $headers['Webhook-Signature'];
$computedSignature = base64_encode(hash_hmac('sha256', $rawData, $secret, true));

if ($receivedSignature === $computedSignature) {
    $webhook->log('Webhook authenticity verification OK', 'request');
} else {
    $webhook->log('Webhook not authentic!', 'request');
}

// @todo Process the $requestData as needed
$requestData = json_decode($rawData);
```

Additionally here are another example in NodeJS (with express):
```javascript
'use strict';

const express = require('express');
const crypto = require('crypto');
const app = express();
const port = 3000;
const SECRET = 'mySecret';

// save raw body
app.use ((req, res, next) => {
    let data = '';
    req.setEncoding('utf8');

    req.on('data', chunk => data += chunk);
    req.on('end', () => {
        req.body = data;
        return next();
    });
});

app.post('/webhook', (req, res) => {

    // optional signature verification
    const receivedSignature = req.headers['webhook-signature'];
    console.log('Received signature (in header):', receivedSignature);

    const computedSignature = crypto.createHmac('sha256', SECRET).update(req.body).digest('base64');
    console.log('Computed signature (from body):', computedSignature);

    if (receivedSignature === computedSignature) {
        console.log('Webhook authenticity verification OK');
    } else {
        console.log('Webhook not authentic!');
    }

    // TODO: process body
    const body = JSON.parse(req.body);

    res.send();
});

app.listen(port, () => console.log(`App listening on port ${port}!`));
```
If you'd like to extend the webhook functionality with your plugin, read more in [the plugin docs](#extending-webhooks).
