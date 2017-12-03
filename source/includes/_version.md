## Version

the go~mus API version is _4.4_

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
        "api": "4.4",
        "release": "Bubbles",
        "time": "2017-12-03T10:49:15+02:00",
        "zone": "Europe/Berlin",
        "currency": "EUR"
    }
}
```