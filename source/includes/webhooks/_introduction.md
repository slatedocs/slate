# Introduction

## What is a web hook?

A web hook is a simple event-notification system. When an event occurs in Greenhouse, a payload of JSON data containing information about the event is sent via POST to a specified endpoint URL over HTTPS.

Each delivery will include a `Greenhouse-Event-ID` header. This will contain an unique id associated with this delivery.

## Creating a web hook

Web hooks have three components. A name, an endpoint URL, and a secret key.


- **Name**: The name is simply a reference for you. It can contain any string value.
- **Endpoint URL**: This is the URL to which we will send the POST data when the event occurs. This must be a valid URL and must be https. When the web hook is saved or updated, we will attempt to ping this URL with a payload containing some configuration settings for the web hook. If this ping fails, we will create the web hook in a disabled state and notify you that the ping has failed.
- **Secret Key**: This secret key will be used to generate a signature header that you may use to verify the hook data was sent from Greenhouse. The secret key will be used in conjunction with the web hook's payload to generate a digital signature.

## Advanced settings

Advanced settings allow customers with certain other security needs to use web hooks for their system. In most cases, users will not need to configure these.

- Basic authentication username / password: These credentials are supplied if the web hook request needs to authenticate at the destination with HTTP Basic Authorization. These credentials will be encoded in to a HTTP Authorization header. See RFC 2617 for additional details.
- Additional Headers: This textarea should contain any additional HTTP headers that will allow the POST request access to your environment. These headers will be included exactly as pasted, but may not include the following headers already reserved by Greenhouse: Content-Type, Content-Length, Greenhouse-Event-ID, Authorization, User-Agent, and Signature. Please consult with your technology department before including anything in this field.

## Authentication

```
Signature: sha256 37d2725109df92747ffcee59833a1d1262d74b9703fa1234c789407218b4a4ef
```

> To compute the HMAC digest in Ruby:

```ruby
digest = OpenSSL::Digest.new('sha256')
signature = OpenSSL::HMAC.hexdigest(digest, secret_key, body)
```

> To compute the HMAC digest in PHP:

```php
<?php
  // Requires PHP >= 5.1.2 and PECL hash >= 1.1
  $signature = hash_hmac('sha256', $body, $secret_key);
?>
```

> The `body` variable in the above code samples refers to the entire content of the JSON response. Not just the `payload` attribute.

Greenhouse uses a digital signature which is generated using the secret key entered when creating a web hook and the body of the web hook's request. This data is contained within the Signature header.

The header contains: the SHA algorithm used to generate the signature, a space, and the signature. To verify the request came from Greenhouse, compute the HMAC digest using your secret key and the body and compare it to the signature portion (after the space) contained in the header. If they match, you can be sure the web hook was sent from Greenhouse.

Important note on Unicode: Greenhouse will escape Unicode characters when they are encoded as JSON before computing the signature. For example, if the job post content is `<p>hello</p>`, the web hook body will represent it as `\u003cp\u003ehello\u003c/p\u003e`. When we compute the signature, we use the string exactly as it appears in the body, including the escaped unicode. Be sure to duplicate this process on the receiving end so the signatures match.


## Common Attributes

Currently, Web Hooks for all event types include these common attributes:

| Attribute | Note |
|-----------|------|
| `application.id` | Unique Greenhouse identifier of the application. Information not included in the web hook can be retrieved via [Harvest API - GET Applications](/harvest.html#applications)
| `application.credited_to` | If populated and a Greenhouse user, the user's Greenhouse ID, e-mail address, and Employee ID (if available) will be provided. If populated and not a Greenhouse user, just the name will be provided.
| `application.status` | One of: `rejected`, `hired`, `active`
| `application.candidate.id` | Unique Greenhouse identifier of the candidate. Information not included in the web hook can be retrieved via [Harvest API - GET Candidates](/harvest.html#candidates)
| `application.candidate.phone_numbers[].type` | One of: `home`, `work`, `mobile`, `skype`, `other`
| `application.candidate.addresses[].type` | Application Candidate Addresses Type
| `application.candidate.email_addresses[].type` | One of: `personal`, `work`, `other`
| `application.candidate.attachments[].type` | One of: `cover_letter`, `offer_packet`, `resume`, `take_home_test`, `offer_letter`, `signed_offer_letter` <br/><br/> Note: Attachments expire in 7 days.
| `application.candidate.external_id` | An arbitrary ID provided by an external source; does not map to another entity in Greenhouse.
| `application.prospect` | If true, this is a prospect application which means that the associated person is a prospect and has not yet applied for this job. (Only prospects will have non-null values for `prospect_owner`, `prospect_pool`, or `prospect_stage` under `prospect_detail`)  |
| `application.prospect_detail.prospect_owner` | The user responsible for keeping track of the prospect. Either null or a user's `id` and `name` |
| `application.prospect_detail.prospect_pool` | The current prospect pool of a prospect. Either null or a pool's `id` and `name` |
| `application.prospect_detail.prospect_stage` | The current prospect stage of a prospect. Either null or a stage's `id` and `name` |
| `application.jobs[]` | Candidates will have one job. Prospects will have 0 or more jobs.
| `application.jobs[].id` | Unique Greenhouse identifier of the job. Information not included in the web hook can be retrieved via [Harvest API - GET Jobs](/harvest.html#jobs)
| `application.jobs[].requisition_id` | An arbitrary ID provided by an external source; does not map to another entity in Greenhouse.
| `application.opening.opening_id` | This is an external opening id that may be defined for an HRIS system. This does not reference anything else in Greenhouse and may be blank.
| `custom_fields` | Contains a hash map/associative array. The key of the hash map is an immutable key; which is an underscore-slugged version of the custom field's name at creation time. The exported properties reflect the active values of the custom field at the time of the export. All custom fields, public and private, will be exported. If a field exists but does not have a value, it will be exported with a value of null for singular values and empty arrays for multiple values. *Important Note*: If a custom field is created with the name `Salary` the key will be `salary`. If later the name of this custom field is changed to `Wage` or `Bonus`, the key will remain `salary`.
| `custom_fields[].type` | One of: `short_text`, `long_text`, `boolean`, `single_select`, `multi_select`, `currency`, `currency_range`, `number`, `number_range`, `date`, `url`, or `user`.

## Custom Fields

```json
    {
        "custom_fields": {
            "short_text_field": {
                "name": "Short Text Field",
                "type": "short_text",
                "value": "A text string with fewer than 255 characters."
            },
            "long_text_field": {
                "name": "Long Text Field",
                "type": "long_text",
                "value": "A text string of any length."
            },
            "boolean_field": {
                "name": "Boolean Field",
                "type": "boolean",
                "value": true (or false)
            },
            "single_select": {
                "name": "Single Select Field",
                "type": "single_select",
                "value": "The text of selected custom field option."
            },
            "multi_select": {
                "name": "Multi Select Field",
                "type": "multi_select",
                "value": [
                    "An array containing the text of",
                    "all the selected",
                    "custom field options"
                ]
            },
            "currency_field": {
                "name": "Currency Field",
                "type": "currency",
                "value": {
                    "amount": 80000,
                    "unit": "USD"
                }
            },
            "currency_range_field": {
                "name": "Currency Range Field",
                "type": "currency_range",
                "value": {
                    "min_value": 80000,
                    "max_value": 150000,
                    "unit": "USD"
                }
            },
            "number_field": {
                "name": "Number Field",
                "type": "number",
                "value": 125
            },
            "number_range_field": {
                "name": "Number Range Field",
                "type": "number_range",
                "value": {
                    "min_value": 80000,
                    "max_value": 150000
                }
            },
            "date_field": {
                "name": "Date Field",
                "type": "date",
                "value": "YYYY-MM-DD"
            },
            "url_field": {
                "name": "URL Field",
                "type": "url",
                "value": "https://www.thisisjustatextvalue.com"
            },
            "user_field": {
                "name": "User Field",
                "type": "user",
                "value": {
                    "user_id": 94354,
                    "name": "Ben Smith",
                    "email": "ben@example.com",
                    "employee_id": "bs0615"
                }
            }
        }
    }
```

Custom fields may be attached to several objects within the Greenhouse Recruiting system. These fields may appear on candidates, applications, offers, and other objects in the system. These fields share several properties and are always indicated in web hooks by the "custom_fields" element. However, the "value" attribute of custom fields are different depending on the "type" attribute, so you must check the "type" attribute in order to predict what will be included in the value "attribute". As described in the previous section, the type attribute will be one of short_text, long_text, boolean, single_select, multi_select, currency, currency_range, number, number_range, date, url, or user. An example of each of these fields' expected value format are provided.

## Disabled web hooks

If a web hook is disabled, it will not trigger when the event occurs. Web hooks become disabled automatically if a ping event fails on create or update. They need to be manually re-enabled if this occurs.

## Retry policy

In the event of a failed webhook request (due to timeout, a non HTTP 200 response, or network issues), Greenhouse will attempt a maximum of 5 retries according to the formula on the right:

This formula increases the amount of time between each retry, while assigning a random number of seconds to avoid consistent failures from overload or contention.

Greenhouse will attempt 5 retries over the course of 7 hours.

```
RETRY_DELAY_MINUTES = [1, 15, 60, 120, 240]

sidekiq_retry_in do |index, _exception|
  seconds_delay = (RETRY_DELAY_MINUTES[index] || RETRY_DELAY_MINUTES.last) * 60
  offset = rand(30) * (index + 1)

  seconds_delay + offset
end
```

The table below outlines the estimated wait time for each retry request, assuming that rand(30) always returns 0.

| Retry number | Next Retry in | Total waiting time |
| ------------ | ------------- | ------------------ |
|       1      |        1m     |        0h  1m      |
|       2      |       15m     |        0h 16m      |
|       3      |       60m     |        1h 16m      |
|       4      |      120m     |        3h 16m      |
|       5      |      240m     |        7h 16m      |
