# Authentication

> Generating a signature:

```php
<?php
define('API_KEY', '<INSERT_API_KEY>');
define('API_SECRET', '<INSERT_API_SECRET>');

$expires = (int) gmdate('U') + 1800; // not more than 1800 seconds
$sig = base64_encode(hash_hmac('sha1', API_KEY.$expires, API_SECRET, true));

echo urlencode($sig); // for get requests
echo $sig;
```

```shell
expiry=$((`date +%s`+1800)) # not more than 1800 seconds
sig=$(echo -n "<INSERT_API_KEY>$expiry" | openssl dgst -sha1 -binary -hmac "<INSERT_API_KEY>" | base64)
```

All methods require a valid trial or production API key. Methods which manipulate or retrieve data in your account additionally require a signature. You ideally need to generate this signature for each request and set a short expiry time. For testing purposes you can chose to create a signature that will be valid for up to 30 minutes.

## Authentication Errors

If there's a problem with your API key, signature or expires one of the following errors will be returned:

### Invalid API Key

> Error responses:

```json
{
    "errors":  {
        "INVALID_API_KEY": "Invalid API key specified"
    }
}
```
 
### Signature Incorrect

```json
{
    "errors":  {
        "INVALID_API_KEY": "Signatures don't match"
    }
}
```

In this situation your signature doesn't match the one we generated for comparison. Most like there's something wrong in the way you're generating your signature. If passing the signature in the query string make sure you've URL encoded it before submitting.
 
### Invalid Permissions

```json
{
    "errors":  {
        "INVALID_API_KEY": "API key doesn't has access to the specified api call"
    }
}
```

If you see this error it means that your API key only has partial access to our API. You'll need to contact us to get the API method you're trying to call associated with your API key.
 
### No Trial Requests Left

```json
{
    "errors":  {
        "INVALID_API_KEY": "No trial requests left"
    }
}
```

Your trial key has used its allocation of free credits and you're trying to call a batch API method that needs credits. Methods that manipulate your account don't need credits or a production key.
 
### API Key Doesn't Support Signed Requests

```json
{
    "errors":  {
        "INVALID_API_KEY": "API key not upgraded to support signed requests"
    }
}
```

Most likely you've got a very old API key and you're trying to access one of our newer API methods that needs to be sent signature and expiry information but your key doesn't have these.
 
### Signature Too Old

```json
{
    "errors":  {
        "INVALID_API_KEY": "Signature expired too long ago"
    }
}
```

The signature you're trying to use expired more than 30 minutes ago. Ideally you should generate a new signature with every request but you must generate a new one at least every 30 minutes.
 
### Signature Expiry Too Long

```json
{
    "errors":  {
        "INVALID_API_KEY": "Specified expiry is too far in the future (max 1800 seconds allowed)"
    }
}
```

You can only generate a signature that expires a maximum of 30 minutes into the future. If you see this message you need to check the expiry value you're using to generate your signature.

# General Error Handling

```json
{
    "errors":  {
        "INVALID_COMPANY_NAME": "Company name not specified",
        "INVALID_COMPANY_URL": "Company URL not specified",
        "INVALID_COUNTRY": "Country ISO 3 code not specified",
        "INVALID_BUSINESS_CATEGORY_ID": "Business category ID not specified"
    }
}
```

When an error occurs the data returned contains an error section with a list of relevant errors. Errors are returned when incorrect parameters are passed to an API method and in a few other distinct cases.
 
Generally the response will contain a top level node errors {} when an error has occurred and response {} when a successful result is returned.
