# API Endpoint

You access Beyonic’s API at the following endpoint:
    <aside class="notice">https://app.beyonic.com/api</aside>

This endpoint uses your saved API version (see below). If you’d like to make sure that your application always accesses the same version, you can specify a specific version as shown in the versioning section.

# Versioning

> Example Request:

```shell
curl -H "Beyonic-Version: v1" https://app.beyonic.com/api
```

```ruby
require 'beyonic'
Beyonic.api_version = 'v1'
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiVersion("v1");
?>
```

```python
import beyonic
beyonic.api_version = 'v1'
```

New API versions are released only when we make backward incompatible changes to the API. We define these as changes that will prevent our official clients from working on old versions. Some changes DO NOT result in a new version, including: Adding new API methods, adding optional parameters to existing API methods or adding new fields to responses.

You don't need to specify a version in your request. The first time an API request is made for your organization, the version is saved, and will be used on subsequent API requests unless it is changed in the organization settings, or overridden as below. This allows your client applications to continue working even if newer API versions are released.

You can temporarily override the API version for a specific request in 2 ways:

* Use version specific URLS like: https://app.beyonic.com/api/v1
* Include the Beyonic-Version header in your request as shown in the examples to the right.

The various API libraries provide methods for changing the version, as shown in the examples to the right.

Note that this doesn't change your organization's default API version, which was saved in your organizations settings the first time you interacted with the Beyonic API. To change your default API version, log into the web portal and go to "Company Settings" > Settings (Cogwheel) > Manage General Settings.

