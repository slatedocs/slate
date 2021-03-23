# MauticJS API

Mautic provides a means for plugins to inject custom JavaScript into mtc.js, the PHP generated script that manages Mautic's tracking pixel, dynamic web content, etc. mtc.js is embedded in 3rd party websites to manage communication between those and Mautic.

## mtc.js

```php
<?php

namespace Mautic\PageBundle\EventListener;

use Mautic\CoreBundle\CoreEvents;
use Mautic\CoreBundle\Event\BuildJsEvent;
use Mautic\PageBundle\Event\TrackingEvent;
use Mautic\PageBundle\PageEvents;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class TrackingSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents()
    {
        return [
            CoreEvents::BUILD_MAUTIC_JS    => ['onBuildJs', 0],
            PageEvents::ON_CONTACT_TRACKED => ['onContactTracked', 0],
        ];
    }

    public function onBuildJs(BuildJsEvent $event)
    {
        $event->appendJs(
            <<<JS

        document.addEventListener('mauticPageEventDelivered', function(e) {
            var detail   = e.detail;
            if (detail.response && detail.response.events && detail.response.events.tracked) {
                console.log(detail.response.events.tracked);
            }
      });

JS
        );
    }

    public function onContactTracked(TrackingEvent $event)
    {
        $contact  = $event->getContact();
        $response = $event->getResponse();

        $response->set(
            'tracked',
            [
                'email' => $contact->getEmail()
            ]
        );
    }
}
```

To inject custom Javascript into mtc.js, use an [event listener](#events) for the `CoreEvents::BUILD_MAUTIC_JS` event. This event receives a `Mautic\CoreBundle\Event\BuildJsEvent` object where `$event->appendJs($js, $sectionName);` can be used to inject the script's code.

<aside class="warning">
Note that the code that triggers the tracking call to Mautic has a priority of -255. Thus, any listener to this event should use a priority greater than -255.
</aside>

<aside class="warning">
Only native Javascript or <a href="#mauticjs-api-functions">MauticJs API functions</a> should be used since jQuery and other libraries are not guaranteed to be available in 3rd party websites.
</aside>

## Hooking into the Tracking Process and Returning Custom Responses

If it's desired to do something during the request to track the contact (`/mtc/event`) or append to the payload returned to the tracking code which can be leveraged by custom javascript injected through `CoreEvents::BUILD_MAUTIC_JS`, subscribe to the `PageEvents::ON_CONTACT_TRACKED` event. The listener can inject a custom payload through the `Mautic\PageBundle\Event\TrackingEvent::set` method. This will expose the payload to the tracking code's `mauticPageEventDelivered` event in the `detail.response.events` object. See the PHP code example. 

## JS Form Processing Hooks

```js
if (typeof MauticFormCallback == 'undefined') {
    var MauticFormCallback = {};
}
MauticFormCallback['replaceWithFormName'] = {
    onValidateEnd: function (formValid) {
         // before form submit
    },
    onResponse: function (response) { 
         // after form submit
    }
};

```

If you wish execute additional code to execute as form is being processed create a `MauticFormCallback` object.  In the example code replace `replaceWithFormName` with the name of your form. 

`onValidateEnd` and `onResponse` are actions called by `Form.customCallbackHandler`. 

### onValidate()

```js
MauticFormCallback['replaceWithFormName'] = {
    onValidate: function () {
        // before form validation
        var formIsGood = True;
        var dontUpdate = False;
        if(dontUpdate){
            return null;
        }else if(formIsGood){
            return True;
        }else if(!formIsGood){
            return False;
        }
    },
};
```

Called before default form validation and can be used to override default form validation.

Return `True` to skip the default form validation continue with form processing. Return `False` to skip the default form validation and prevent the form submission.  Return `null` to execute default form validation.

### onValidateStart()

```js
MauticFormCallback['replaceWithFormName'] = {
    onValidateStart: function () {
         // before default validation
    },
};
```

Called at the beginning of the default form validation.  Receives no values and return value is not required and not processed.

<aside class="warning">
onValidateStart may not be executed if the default form validation is handled during the `onValidate` callback
</aside>

### onValidateEnd(formValid)

```js
MauticFormCallback['replaceWithFormName'] = {
    onValidateEnd: function (formValid) {
         // before form submit
    },
};
```

Called after all form validation is complete (default and/or `onValidate` callback) and before the form is submitted.  Receives `formValid` to determine if form is valid.  Return value is not required and not processed.

### onErrorMark(callbackData)

```js
var callbackData = {
    containerId: containerId,
    valid: valid,
    validationMessage: callbackValidationMessage
};

MauticFormCallback['replaceWithFormName'] = {
    onErrorMark: function (callbackData) {
         // called during error marking
    },
};
```

Called during error marking.  Receives a `callbackData` object. Return `True` to skip the default error marking.

### onErrorClear(containerId)

```js
MauticFormCallback['replaceWithFormName'] = {
    onErrorClear: function (containerId) {
         // called to clear an existing error
    },
};
```

Called to clear an existing error.  Receives `containerId` with the id of the element containing the error. Return `True` to skip the default error clearing.

### onResponse(response)

```js
MauticFormCallback['replaceWithFormName'] = {
    onResponse: function (response) {
         // called to process the response to the form submission
    },
};
```

Called prior to default form submission response processing.  Receives `response` containing the form submission response. Return `True` to skip the default form submission response processing.

### onResponseStart(response)

```js
MauticFormCallback['replaceWithFormName'] = {
    onResponseStart: function (response) {
         // called to process the response to the form submission
    },
};
```

Called at the beginning default form submission response processing.  Receives `response` containing the form submission response. Return value is not required and not processed.

<aside class="warning">
onResponseStart may not be executed if the default response processing is handled during the `onResponse` callback
</aside>

### onResponseEnd(response)

```js
MauticFormCallback['replaceWithFormName'] = {
    onResponseEnd: function (response) {
         // called to process the response to the form submission
    },
};
```

Called at the end default form submission response processing.  Receives `response` containing the form submission response. Return value is not required and not processed.

<aside class="warning">
onResponseEnd may not be executed if the default response processing is handled during the `onResponse` callback
</aside>

### onMessageSet(messageObject)

```js
var messageObject = {
    message: message,
    type: type
};

MauticFormCallback['replaceWithFormName'] = {
    onErrorMark: function (messageObject) {
         // called prior to default message insertion
    },
};
```

Called prior to default message insertion.  Receives a `messageObject` containing the message and message type. Return `True` to skip the default message insertion.

### onSubmitButtonDisable(messageObject)

```js
MauticFormCallback['replaceWithFormName'] = {
    onErrorMark: function (messageObject) {
         // called prior to default message insertion
    },
};
```

Called prior to default disabling of the submit button.  Receives no values. Return `True` to skip the default disabling of the submit button.

### onSubmitButtonEnable()

```js
MauticFormCallback['replaceWithFormName'] = {
    onErrorMark: function (messageObject) {
         // called prior to default message insertion
    },
};
```

Called prior to default enabling of the submit button.  Receives no values. Return `True` to skip the default enabling of the submit button.

### onShowNextPage()

```js
MauticFormCallback['replaceWithFormName'] = {
    onShowNextPage: function (pageNumber) {
         // called prior to going to the next page
    },
};
```

Called prior to going to the next page in the form. Useful to adjust the DOM prior to making the page visible.


### onShowPreviousPage()

```js
MauticFormCallback['replaceWithFormName'] = {
    onShowPreviousPage: function (pageNumber) {
         // called prior to going back to previous page
    },
};
```

Called prior to going back to a previous page in the form. Useful to adjust the DOM prior to making the page visible.


