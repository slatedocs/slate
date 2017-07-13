## Version

the go~mus API version is _4.2_

Note: the current API version is a release candidate, features and specs might change until final release.

The system and api version is available at each instance:

`GET https://demo.gomus.de/api/v4/version`

```shell
curl "https://demo.gomus.de/api/v4/version"
```

> The above command returns JSON structured like this:

```json
{
    "version": {
        "system": "2.9.1",
        "api": "4.2",
        "time": "2017-07-13T19:49:15+02:00",
        "zone": "Europe/Berlin",
        "currency": "EUR"
    }
}
```